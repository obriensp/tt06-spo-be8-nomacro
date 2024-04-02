import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, NextTimeStep

async def reset(dut):
    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 5)
    dut.RESETn.value = 1
    dut.LOADn.value = 1
    await ClockCycles(dut.CLK, 5)

@cocotb.test()
async def test_register(dut):

    clock = Clock(dut.CLK, 10, units="us")
    cocotb.start_soon(clock.start())

    await reset(dut)

    # Test loading a value
    dut.DIN.value = 42
    dut.LOADn.value = 0
    await ClockCycles(dut.CLK, 1)
    await NextTimeStep()
    assert(dut.DOUT == 42)

    # Test ignoring a value
    dut.DIN.value = 21
    dut.LOADn.value = 1
    await ClockCycles(dut.CLK, 1)
    await NextTimeStep()
    assert(dut.DOUT == 42)

    # Test clearing
    dut.CLR.value = 1
    await ClockCycles(dut.CLK, 1)
    await NextTimeStep()
    assert dut.DOUT == 0
