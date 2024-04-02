import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, with_timeout
from cocotbext.i2c import I2cMaster

device_address = 42

async def write_i2c(controller, address, bytes):
    await with_timeout(controller.write(device_address, address.to_bytes(1) + bytes), 10, 'ms')
    await with_timeout(controller.send_stop(), 100, 'us')

async def read_i2c(controller, address, len):
    await with_timeout(controller.write(device_address, address.to_bytes(1)), 10, 'ms')
    value = await with_timeout(controller.read(device_address, len), 20, 'ms')
    await with_timeout(controller.send_stop(), 100, 'us')
    return value

async def one_byte_read(controller):
    await with_timeout(controller.read(device_address, 1), 20, 'ms')
    await with_timeout(controller.send_stop(), 100, 'us')

async def fixme_wait(dut):
    await ClockCycles(dut.CLK, 5)

@cocotb.test()
async def test_debugger(dut):
    clock = Clock(dut.CLK, 100, units='ns')
    cocotb.start_soon(clock.start())

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 1)
    dut.RESETn.value = 1
    await ClockCycles(dut.CLK, 1)

    controller = I2cMaster(sda=dut.sda_o, sda_o=dut.sda_i, scl=dut.scl_o, scl_o=dut.scl_i)

    # Test reading the Hardware ID after a 1-byte read.
    await one_byte_read(controller)
    # value = await with_timeout(controller.read(device_address, 4), 20, 'ms')
    # value = await read_i2c(controller, 0xF8, 4)
    # print(f"Hardware ID: {value}")
    # assert value == b'BE-8'

    # Enable debug access
    # await write_i2c(controller, 0x00, 0x01.to_bytes(1))

    # Write to the first 4 bytes of memory and verify result
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
