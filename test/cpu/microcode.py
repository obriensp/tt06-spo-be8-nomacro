import cocotb
from cocotb.triggers import Timer
from cocotb.handle import Force


async def step():
    await Timer(1, units='us')

@cocotb.test()
async def test_microcode(dut):
    dut.OPCODE.value = 0x1
    dut.FLAGS.value = 0
    dut.STEP.value = Force(0)
    await step()
    print(f"MIn: {dut.MIn.value}")

    dut.STEP.value = Force(1)
    await step()
    print(f"MIn: {dut.MIn.value}")

    dut.STEP.value = Force(2)
    await step()
    print(f"MIn: {dut.MIn.value}")

    dut.STEP.value = Force(3)
    await step()
    print(f"MIn: {dut.MIn.value}")
