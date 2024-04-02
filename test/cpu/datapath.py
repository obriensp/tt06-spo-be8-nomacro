import cocotb
from cocotb.binary import BinaryValue
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles
from enum import Enum, auto

class Module(Enum):
    A = auto()
    B = auto()
    IR = auto()
    PC = auto()
    ALU = auto()
    RAM = auto()
    ADDR = auto()
    DEBUG = auto()
    IN = auto()

def check_for_module(value, module):
    return value == module or (isinstance(value, list) and module in value)

# FIXME: support for FIn signal
def apply_controls(dut, clear=False, pc_enable=False, subtract=False, load=None, store=None):
    dut.CLR.value = 1 if clear else 0
    dut.CE.value = 1 if pc_enable else 0
    dut.SU.value = 1 if subtract else 0

    # store from bus
    assert not check_for_module(store, Module.DEBUG) # cannot store to debug from bus
    dut.AIn.value = 0 if check_for_module(store, Module.A) else 1
    dut.BIn.value = 0 if check_for_module(store, Module.B) else 1
    dut.IIn.value = 0 if check_for_module(store, Module.IR) else 1
    dut.Jn.value  = 0 if check_for_module(store, Module.PC) else 1
    dut.FIn.value = 1
    dut.MIn.value = 0 if check_for_module(store, Module.ADDR) else 1
    dut.RI.value  = 1 if check_for_module(store, Module.RAM) else 0

    # load onto bus
    dut.DOn.value = 0 if check_for_module(load, Module.DEBUG) else 1
    dut.AOn.value = 0 if check_for_module(load, Module.A) else 1
    dut.AOn.value = 0 if check_for_module(load, Module.A) else 1
    dut.BOn.value = 0 if check_for_module(load, Module.B) else 1
    dut.IOn.value = 0 if check_for_module(load, Module.IR) else 1
    dut.COn.value = 0 if check_for_module(load, Module.PC) else 1
    dut.EOn.value = 0 if check_for_module(load, Module.ALU) else 1
    dut.ROn.value = 0 if check_for_module(load, Module.RAM) else 1
    dut.NOn.value = 0 if check_for_module(load, Module.IN) else 1
    assert not check_for_module(load, Module.ADDR) # cannot drive the bus from the memory address register

async def reset_dut(dut):
    clock = Clock(dut.CLK, 1, units='us')
    cocotb.start_soon(clock.start())

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1
    apply_controls(dut)
    await ClockCycles(dut.CLK, 2)

    # clear everything
    apply_controls(dut, clear=True)
    await ClockCycles(dut.CLK, 1)

@cocotb.test()
async def test_adding(dut):
    await reset_dut(dut)

    # enable program counter for one cycle
    apply_controls(dut, pc_enable=True)
    await ClockCycles(dut.CLK, 1)

    # disable program counter, put its value on the bus, load it into B
    apply_controls(dut, load=Module.PC, store=Module.B)
    await ClockCycles(dut.CLK, 1)

    # put ALU on the bus, load it into A, run for 10 cycles
    apply_controls(dut, load=Module.ALU, store=Module.A)
    await ClockCycles(dut.CLK, 10)

    # put A onto the bus, verify its value
    apply_controls(dut, load=Module.A)
    await ClockCycles(dut.CLK, 1)
    assert dut.BUS.value == 10

async def ram_write(dut, address, value):
    dut.DEBUG.value = address
    apply_controls(dut, store=Module.ADDR, load=Module.DEBUG)
    await ClockCycles(dut.CLK, 1)

    dut.DEBUG.value = value
    apply_controls(dut, store=Module.RAM, load=Module.DEBUG)
    await ClockCycles(dut.CLK, 1)

async def ram_read(dut, address):
    dut.DEBUG.value = address
    apply_controls(dut, store=Module.ADDR, load=Module.DEBUG)
    await ClockCycles(dut.CLK, 1)

    apply_controls(dut, load=Module.RAM)
    await ClockCycles(dut.CLK, 1)

    return dut.BUS.value

@cocotb.test()
async def test_debug(dut):
    await reset_dut(dut)

    await ram_write(dut, 0x4, 0xDB)
    await ram_write(dut, 0x5, 0xE0)

    assert await ram_read(dut, 0x4) == 0xDB
    assert await ram_read(dut, 0x5) == 0xE0
