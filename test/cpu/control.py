import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

@cocotb.test()
async def test_control(dut):
    clock = Clock(dut.CLK, 1, units='us')
    cocotb.start_soon(clock.start())

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1
    dut.OPCODE.value = 1
    dut.CF.value = 0
    dut.ZF.value = 0
    await ClockCycles(dut.CLK, 12)

