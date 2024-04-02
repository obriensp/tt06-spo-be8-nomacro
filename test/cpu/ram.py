import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

async def write_and_verify(dut, string):
    assert len(string) == 16

    # write string
    dut.RI.value = 1
    for i, c in enumerate(string):
        dut.ADDR.value = i
        dut.DIN.value = c
        await ClockCycles(dut.CLK, 1)

    # verify string
    dut.RI.value = 0
    for i, c in enumerate(string):
        dut.ADDR.value = i
        await ClockCycles(dut.CLK, 1)
        assert dut.DOUT.value == c

@cocotb.test()
async def test_ram(dut):
    clock = Clock(dut.CLK, 1, units='us')
    cocotb.start_soon(clock.start())

    dut.RI.value = 0
    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1
    await ClockCycles(dut.CLK, 2)

    # write FFs
    await write_and_verify(dut, b"\xFF" * 16)

    # write a string
    string = b"Hello, world!\r\n\0"
    await write_and_verify(dut, string)

