import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

async def reset_dut(dut):
    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 5)

    dut.RESETn.value = 1
    dut.A.value = 0
    dut.B.value = 0
    dut.SU.value = 0
    await ClockCycles(dut.CLK, 5)

@cocotb.test()
async def test_alu(dut):
    clock = Clock(dut.CLK, 1, units='us')
    cocotb.start_soon(clock.start())

    await reset_dut(dut)

    dut.A.value = 42
    dut.B.value = 17
    dut.SU.value = 1
    dut.FIn.value = 0

    print(f"Intermediate result: {int(dut.RESULT.value)}")

    await ClockCycles(dut.CLK, 1)
    await cocotb.triggers.ReadOnly()

    assert dut.RESULT.value == 42 - 17
    assert dut.CF.value == 1
    assert dut.ZF.value == 0

    await ClockCycles(dut.CLK, 10)
