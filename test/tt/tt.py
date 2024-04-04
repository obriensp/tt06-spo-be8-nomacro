import binascii
import cocotb
from cocotb.binary import BinaryRepresentation, BinaryValue
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Combine, Edge, ReadOnly, NextTimeStep, RisingEdge, with_timeout
from contextlib import asynccontextmanager
from enum import Enum, IntFlag
from test.i2c import I2cMaster
from tools.isa import ISA

device_address = 42


class RegisterAddress(Enum):
    STATUS = 0x00
    RAM_BEGIN = 0x08

    def to_bytes(self, *args, **kwargs):
        return self.value.to_bytes(*args, **kwargs)


class StatusRegister(IntFlag):
    DEBUG_REQ = 0x01
    DEBUG_ACK = 0x02
    RESET_REQ = 0x04
    HALTED    = 0x08
    STEP_INST = 0x10

    def to_bytes(self, *args, **kwargs):
        return self.value.to_bytes(*args, **kwargs)


async def write_i2c(controller, address, bytes):
    await with_timeout(controller.write(device_address, address.to_bytes(1) + bytes), 10 * len(bytes), 'ms')
    await with_timeout(controller.send_stop(), 1, 'ms')


async def read_i2c(controller, address, len):
    await with_timeout(controller.write(device_address, address.to_bytes(1)), 10, 'ms')
    value = await with_timeout(controller.read(device_address, len), 20 * len, 'ms')
    await with_timeout(controller.send_stop(), 1, 'ms')
    return value


async def one_byte_read(controller):
    await with_timeout(controller.read(device_address, 1), 20, 'ms')
    await with_timeout(controller.send_stop(), 1, 'ms')


async def write_and_verify_full_mem(controller, string):
    assert len(string) == 16

    # write string
    for i, c in enumerate(string):
        await write_i2c(controller, 0x08 + i, c.to_bytes(1))

    # verify string
    for i, c in enumerate(string):
        value = await read_i2c(controller, 0x08 + i, 1)
        assert value[0] == c


async def read_status_register(controller):
    return StatusRegister(int.from_bytes(await read_i2c(controller, RegisterAddress.STATUS, 1)))


async def write_status_register(controller, value):
    await write_i2c(controller, RegisterAddress.STATUS, value.to_bytes(1))


async def toggle_debug(controller):
    await write_status_register(controller, StatusRegister.DEBUG_REQ)


async def request_reset(controller):
    await write_status_register(controller, StatusRegister.RESET_REQ)


async def step_instruction(controller):
    await write_status_register(controller, StatusRegister.STEP_INST)


@asynccontextmanager
async def debug_mode(controller):
    if await read_status_register(controller) & StatusRegister.DEBUG_ACK:
        # already in debug mode
        yield
    else:
        await toggle_debug(controller)
        try:
            yield
        finally:
            await toggle_debug(controller)


@asynccontextmanager
async def regular_mode(controller):
    if not (await read_status_register(controller) & StatusRegister.DEBUG_ACK):
        # already in regular mode
        yield
    else:
        await toggle_debug(controller)
        try:
            yield
        finally:
            await toggle_debug(controller)


async def write_program(controller, assembly):
  # Assemble the program
  isa = ISA()
  program = isa.assemble(assembly)
  assert len(program) <= 16

  # write to RAM and verify
  async with debug_mode(controller):
        await write_i2c(controller, RegisterAddress.RAM_BEGIN, program)
        assert await read_i2c(controller, RegisterAddress.RAM_BEGIN, len(program)) == program


async def reset_and_run_until_halt(dut, controller):
    async with regular_mode(controller):
        await request_reset(controller)
        await with_timeout(RisingEdge(dut.halted), 1, 'ms')


async def read_cpu_state(controller):
    async with debug_mode(controller):
        return await read_i2c(controller, RegisterAddress.STATUS, 24)


async def dump_cpu_state(dut, controller):
    contents = await read_cpu_state(controller)
    dump = binascii.b2a_hex(contents, b' ', -1)
    dut._log.info(f'CPU State: {dump}')

    # print registers
    regs = contents[0x01:0x08]
    for i, name in enumerate(['A', 'B', 'IR', 'PC', 'FLAGS', 'IN', 'OUT']):
        value = int(regs[i])
        dut._log.info(f'{name:5} 0x{value:02X} ({value:d})')

    # print memory
    memory = contents[0x08:0x18]
    isa = ISA()
    for i, byte in enumerate(memory):
        mnemonic = isa.disassemble_byte(byte)
        dut._log.info(f'{i:X}: {byte:02X} {mnemonic}')


async def testing_preamble(dut):
    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.rst_n.value = 0
    dut.ui_in.value = 0
    controller = I2cMaster(sda=dut.sda_o, sda_o=dut.sda_i, scl=dut.scl_o, scl_o=dut.scl_i, speed=10e3)
    await ClockCycles(dut.clk, 10)

    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 1)

    return controller


@cocotb.test()
async def test_ram8(dut):
    dut._log.info("Start")

    clock = Clock(dut.clk, 10, units="us")
    cocotb.start_soon(clock.start())

    # Reset
    dut._log.info("Reset")
    dut.ena.value = 1
    dut.rst_n.value = 0
    controller = I2cMaster(sda=dut.sda_o, sda_o=dut.sda_i, scl=dut.scl_o, scl_o=dut.scl_i, speed=10e3)
    await ClockCycles(dut.clk, 10)

    dut.rst_n.value = 1
    await ClockCycles(dut.clk, 1)

    # Test reading the status register after a 1-byte read.
    await one_byte_read(controller)
    dut._log.info("Reading status register")
    status_reg = await read_i2c(controller, 0x00, 1)
    dut._log.info(f"Status register: {status_reg}")
    assert status_reg == b'\x03'

    dut._log.info(f'Status again: {await read_status_register(controller)}')

    # Enable debug access
    # dut._log.info("Requesting debug access")
    # await write_i2c(controller, 0x00, 0x01.to_bytes(1))

    # Check the status register again and assert that our debug request was acknowledged
    status_reg = await read_i2c(controller, 0x00, 1)
    dut._log.info("Re-reading status register")
    dut._log.info(f"Status register: {status_reg}")
    assert int.from_bytes(status_reg) == 0x03

    # Write to the first 4 bytes of memory and verify result
    dut._log.info("Verifying memory")
    for value in [0xCAFEFACE, 0x55AA55AA]:
        await write_i2c(controller, 0x08, value.to_bytes(4))
        result = await read_i2c(controller, 0x08, 4)
        assert int.from_bytes(result) == value

    # Perform a 1-byte write
    await write_i2c(controller, 0x01, b'\x00')

    # Test writing to memory after the 1-byte write
    for value in [0xCAFEFACE, 0x55AA55AA]:
        await write_i2c(controller, 0x08, value.to_bytes(4))
        result = await read_i2c(controller, 0x08, 4)
        assert int.from_bytes(result) == value

    # Test writing to each byte of memory
    # write FFs
    await write_and_verify_full_mem(controller, b"\xFF" * 16)

    # write a string
    string = b"Hello, world!\r\n\0"
    await write_and_verify_full_mem(controller, string)

    # reset and assert that the CPU is not halted
    await write_i2c(controller, 0x00, b'\x04')
    assert dut.halted.value == 0

    # write a HLT instruction, reset, detach, verify that it has halted
    status_before = await read_i2c(controller, 0x00, 1)
    dut._log.info(f'Status before: {status_before}, HALTED before: {dut.halted.value}')
    await write_i2c(controller, 0x08, b'\xFF')
    await write_i2c(controller, 0x00, b'\x05')
    status_after = await read_i2c(controller, 0x00, 1)
    dut._log.info(f'Status after: {status_after}, HALTED after: {dut.halted.value}')
    assert dut.halted.value == 1


@cocotb.test()
async def test_out_instruction(dut):
    controller = await testing_preamble(dut)

    await write_program(controller, """
        LDI 0xA
        OUT
        HLT
    """)

    await reset_and_run_until_halt(dut, controller)
    assert dut.uo_out.value == 0xA


# @cocotb.test()
async def test_in_instruction(dut):
    controller = await testing_preamble(dut)

    await write_program(controller, """
        IN
        OUT
        HLT
    """)

    dut.ui_in = 0xBE

    await reset_and_run_until_halt(dut, controller)
    assert dut.uo_out.value == 0xBE


@cocotb.test()
async def test_addition(dut):
    controller = await testing_preamble(dut)

    await write_program(controller, """
        LDA 4
        ADD 5
        OUT
        HLT
        28
        14
    """)

    await reset_and_run_until_halt(dut, controller)
    assert dut.uo_out.value == 42


@cocotb.test()
async def test_multiplication(dut):
    controller = await testing_preamble(dut)

    await write_program(controller, """
        LDA 14
        SUB 12
        JC 6
        LDA 13
        OUT
        HLT
        STA 14
        LDA 13
        ADD 15
        STA 13
        JMP 0
        0
        1
        0
        6
        7
    """)

    await reset_and_run_until_halt(dut, controller)
    dut._log.info(f'Result: {dut.uo_out.value}')
    dut._log.info(f'Result: {dut.uo_out.value.integer}')
    await dump_cpu_state(dut, controller)
    assert dut.uo_out.value == 42


@cocotb.test()
async def test_fib_sequence(dut):
    controller = await testing_preamble(dut)

    await write_program(controller, """
        LDI 0x1
        STA 0xE
        LDI 0x0
        OUT
        ADD 0xE
        STA 0xF
        LDA 0xE
        STA 0xD
        LDA 0xF
        STA 0xE
        LDA 0xD
        JC  0x0
        JMP 0x3
        0
        0
        0
    """)

    async with regular_mode(controller):
        await request_reset(controller)

        # we might miss the start of the output stream because I2C is comparably slow.
        # wait until we see uo_out return to zero before starting validation
        for i in range(12):
            await with_timeout(Edge(dut.uo_out), 50, 'ms')
            await ReadOnly()
            if dut.uo_out.value == 0:
                break

        assert dut.uo_out.value == 0

        for i in [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]:
            await with_timeout(Edge(dut.uo_out), 50, 'ms')
            await ReadOnly()
            assert dut.uo_out.value == i

        await NextTimeStep()


@cocotb.test()
async def test_sta(dut):
    controller = await testing_preamble(dut)

    dut.ui_in.value = 66

    await write_i2c(controller, RegisterAddress.RAM_BEGIN, b'\xD0\x43\xF0\xFF')
    await write_i2c(controller, RegisterAddress.STATUS, b'\x01')

    await with_timeout(RisingEdge(dut.halted), 10, 'ms')

    async with debug_mode(controller):
        value = await read_i2c(controller, 0x08 + 0x3, 1)
        dut._log.info(f'Byte: {value}')
        assert int.from_bytes(value) == 66
