import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, RisingEdge, with_timeout

async def wait_for_pready(dut, count=30):
    for _ in range(count):
        if dut.PREADY.value:
            return
        await ClockCycles(dut.PCLK, 1)

async def apb_write(dut, address, value):
    dut.PSEL.value = 1
    dut.PADDR.value = address
    dut.PENABLE.value = 0
    dut.PWRITE.value = 1
    dut.PWDATA.value = value
    await ClockCycles(dut.PCLK, 1)

    dut.PENABLE.value = 1
    await ClockCycles(dut.PCLK, 1)

    await wait_for_pready(dut)

    dut.PSEL.value = 0
    dut.PENABLE.value = 0
    await ClockCycles(dut.PCLK, 1)


async def apb_read(dut, address):
    dut.PSEL.value = 1
    dut.PADDR.value = address
    dut.PENABLE.value = 0
    dut.PWRITE.value = 0
    await ClockCycles(dut.PCLK, 1)

    dut.PENABLE.value = 1
    await ClockCycles(dut.PCLK, 1)

    await wait_for_pready(dut)

    value = dut.PRDATA.value

    dut.PSEL.value = 0
    dut.PENABLE.value = 0

    await ClockCycles(dut.PCLK, 1)

    return value


@cocotb.test()
async def test_debugger_apb(dut):
    clock = Clock(dut.PCLK, 1, units='us')
    cocotb.start_soon(clock.start())

    dut.PSEL.value = 0
    dut.PADDR.value = 0
    dut.PENABLE.value = 0
    dut.PWRITE.value = 0
    dut.PWDATA.value = 0
    dut.INREG.value = 99

    dut.PRESETn.value = 0
    await ClockCycles(dut.PCLK, 2)
    dut.PRESETn.value = 1
    await ClockCycles(dut.PCLK, 2)

    registers = [
        {'name': 'A',   'address': 0x01, 'mask': 0xFF, 'handle': dut.core.datapath.a_reg.data},
        {'name': 'B',   'address': 0x02, 'mask': 0xFF, 'handle': dut.core.datapath.b_reg.data},
        {'name': 'IR',  'address': 0x03, 'mask': 0x0F, 'handle': dut.core.datapath.ir_reg.data},
        {'name': 'PC',  'address': 0x04, 'mask': 0x0F, 'handle': dut.core.datapath.pc_reg.value},
        {'name': 'OUT', 'address': 0x07, 'mask': 0xFF, 'handle': dut.core.datapath.out_reg.data},
    ]

    # request debug
    # await apb_write(dut, 0x00, 0x00000001)
    # await ClockCycles(dut.PCLK, 1)
    assert (int(await apb_read(dut, 0x00)) & 0x2) != 0

    for register in registers:
        print(f"Testing register '{register['name']}'...")

        for value in [0x55, 0xAA]:
            value = value & register['mask']
            await apb_write(dut, register['address'], value)
            assert register['handle'].value == value
            assert await apb_read(dut, register['address']) == value

    # Read input register
    print("Testing register 'IN'...")
    assert await apb_read(dut, 0x06) == dut.core.datapath.INREG.value

    # write memory
    print("Testing RAM...")
    for i in range(0, 16):
        print(f"...byte {i}...")
        addr = 0x08 + i
        for value in [0x55, 0xAA]:
            await apb_write(dut, addr, value)
            assert await apb_read(dut, addr) == value

    await ClockCycles(dut.PCLK, 1)

    for i in range(0, 32):
    # for i in range(8, 32):
        address = i
        val = await apb_read(dut, address)
        print(f"{i:02X}: 0x{int(val):02X}")

    # verify hardware ID (BE-8)
    # for i, c in enumerate(b"BE-8"):
    #     assert await apb_read(dut, 0xF8 + i) == c

    # Disable debug
    await apb_write(dut, 0x4, 0x00000001)
    assert (int(await apb_read(dut, 0x4)) & 0x2) == 0
