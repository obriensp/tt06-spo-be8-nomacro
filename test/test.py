# SPDX-FileCopyrightText: © 2023 Uri Shaked <uri@tinytapeout.com>
# SPDX-License-Identifier: MIT

import cocotb
from cocotb.binary import BinaryRepresentation, BinaryValue
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles

async def write_and_verify(dut, string):
  assert len(string) == 16

  # write string
  dut.WE.value = 1
  for i, c in enumerate(string):
      dut.ADDR.value = i
      dut.DIN.value = c
      await ClockCycles(dut.clk, 1)

  # verify string
  dut.WE.value = 0
  for i, c in enumerate(string):
      dut.ADDR.value = i
      await ClockCycles(dut.clk, 1)
      assert dut.DOUT.value == c

@cocotb.test()
async def test_ram8(dut):
  dut._log.info("Start")

  # Our example module doesn't use clock and reset, but we show how to use them here anyway.
  clock = Clock(dut.clk, 10, units="us")
  cocotb.start_soon(clock.start())

  # Reset
  dut._log.info("Reset")
  dut.ena.value = 1
  dut.ADDR.value = 0
  dut.DIN.value = 0
  dut.WE.value = 0
  dut.rst_n.value = 0
  await ClockCycles(dut.clk, 10)
  dut.rst_n.value = 1

  dut._log.info("Test")

  await write_and_verify(dut, b'Hello, world!\r\n\0')
