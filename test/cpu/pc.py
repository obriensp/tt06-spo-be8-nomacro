import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, NextTimeStep

@cocotb.test()
async def test_pc(dut):
    clock = Clock(dut.CLK, 1, units='us')
    cocotb.start_soon(clock.start())

    dut.CLR.value = 0
    dut.CE.value = 0
    dut.Jn.value = 1
    dut.DIN.value = 0

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1
    await ClockCycles(dut.CLK, 2)

    # Start at 0
    assert dut.DOUT.value == 0

    # Step forward one cycle
    dut.CE.value = 1
    await ClockCycles(dut.CLK, 1)
    await NextTimeStep()
    assert dut.DOUT.value == 1

    # Step forward 3 cycles
    await ClockCycles(dut.CLK, 3)
    await NextTimeStep()
    assert dut.DOUT.value == 4

    # Jump back to 0x1
    dut.DIN.value = 0x1
    dut.Jn.value = 0
    await ClockCycles(dut.CLK, 1)
    dut.Jn.value = 1
    await NextTimeStep()
    assert dut.DOUT.value == 1

    # Step forward 3 cycles
    await ClockCycles(dut.CLK, 3)
    await NextTimeStep()
    assert dut.DOUT.value == 4

    await ClockCycles(dut.CLK, 10)
