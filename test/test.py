# SPDX-FileCopyrightText: © 2023 Uri Shaked <uri@tinytapeout.com>
# SPDX-License-Identifier: MIT

import cocotb
from cocotb.binary import BinaryRepresentation, BinaryValue
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, with_timeout
from i2c import I2cMaster


device_address = 42

async def write_i2c(controller, address, bytes):
    await with_timeout(controller.write(device_address, address.to_bytes(1) + bytes), 10 * len(bytes), 'ms')
    await with_timeout(controller.send_stop(), 1, 'ms')


async def read_i2c(controller, address, len):
    await with_timeout(controller.write(device_address, address.to_bytes(1)), 10, 'ms')
    value = await with_timeout(controller.read(device_address, len), 20 * len, 'ms')
    await with_timeout(controller.send_stop(), 1, 'ms')
    return value


async def one_byte_read(controller):
    await with_timeout(controller.read(device_address, 1), 20, 'ms')
    await with_timeout(controller.send_stop(), 1, 'ms')


async def write_and_verify_full_mem(controller, string):
    assert len(string) == 16

    # write string
    for i, c in enumerate(string):
      await write_i2c(controller, 0x08 + i, c.to_bytes(1))

    # verify string
    for i, c in enumerate(string):
        value = await read_i2c(controller, 0x08 + i, 1)
        assert value[0] == c


@cocotb.test()
async def test_ram8(dut):
  dut._log.info("Start")

  # Our example module doesn't use clock and reset, but we show how to use them here anyway.
  clock = Clock(dut.clk, 10, units="us")
  cocotb.start_soon(clock.start())

  # Reset
  dut._log.info("Reset")
  dut.ena.value = 1
  dut.rst_n.value = 0
  controller = I2cMaster(sda=dut.sda_o, sda_o=dut.sda_i, scl=dut.scl_o, scl_o=dut.scl_i, speed=10e3)
  await ClockCycles(dut.clk, 10)

  dut.rst_n.value = 1
  await ClockCycles(dut.clk, 1)


  # Test reading the status register after a 1-byte read.
  await one_byte_read(controller)
  memory = await read_i2c(controller, 0x00, 32)
  dut._log.info(f'Bytes: {memory}')
  assert memory == bytes(range(32))

  # test reading from midway through the address space
  memory = await read_i2c(controller, 0x10, 16)
  dut._log.info(f'Bytes: {memory}')
  assert memory == bytes(range(16, 32))
