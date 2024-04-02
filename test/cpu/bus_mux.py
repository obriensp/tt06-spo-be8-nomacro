import cocotb
from cocotb.triggers import Timer

async def step():
    await Timer(1, units='us')

@cocotb.test()
async def test_bus_mux(dut):
    dut.DOn.value = 1
    dut.AOn.value = 1
    dut.BOn.value = 1
    dut.IOn.value = 1
    dut.COn.value = 1
    dut.EOn.value = 1
    dut.ROn.value = 1
    dut.NOn.value = 1

    dut.DEBUG.value = 0xDD
    dut.A.value     = 0xAA
    dut.B.value     = 0xBB
    dut.IR.value    = 0x11
    dut.PC.value    = 0xCC
    dut.ALU.value   = 0x42
    dut.RAM.value   = 0xFF
    dut.IN.value    = 0x99

    await step()

    dut.AOn.value = 0
    await step()
    assert dut.DOUT == 0xAA
    dut.AOn.value = 1

    dut.BOn.value = 0
    await step()
    assert dut.DOUT == 0xBB
    dut.BOn.value = 1

    dut.IOn.value = 0
    await step()
    assert dut.DOUT == 0x11
    dut.IOn.value = 1

    dut.COn.value = 0
    await step()
    assert dut.DOUT == 0xCC
    dut.COn.value = 1

    dut.EOn.value = 0
    await step()
    assert dut.DOUT == 0x42
    dut.EOn.value = 1

    dut.ROn.value = 0
    await step()
    assert dut.DOUT == 0xFF
    dut.ROn.value = 1

    dut.NOn.value = 0
    await step()
    assert dut.DOUT == 0x99
    dut.NOn.value = 1

    await step()
    assert dut.DOUT == 0x00

    dut.DOn.value = 0
    await step()
    assert dut.DOUT == 0xDD
    dut.DOn.value = 1

    # verify that the debugger has the highest priority
    dut.DOn.value = 0
    dut.AOn.value = 0
    dut.BOn.value = 0
    dut.IOn.value = 0
    dut.COn.value = 0
    dut.EOn.value = 0
    dut.ROn.value = 0
    dut.NOn.value = 0
    await step()
    assert dut.DOUT == 0xDD
