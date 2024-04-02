import cocotb

async def one_step():
  await cocotb.triggers.Timer(1, units='step')

@cocotb.test()
async def test_full_adder(dut):
    dut.a.value = 42
    dut.b.value = 17
    dut.c_in.value = 0

    await one_step()
    assert(dut.sum.value == (42+17))
    assert(dut.c_out.value == 0)

    dut.c_in.value = 1
    await one_step()
    assert(dut.sum.value == (42+17+1))
    assert(dut.c_out.value == 0)
