import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Edge, FallingEdge, RisingEdge, with_timeout
from contextlib import asynccontextmanager
from enum import Enum, auto

from tools.isa import ISA

class Module(Enum):
    A = auto()
    B = auto()
    OUTPUT = auto()
    IR = auto()
    PC = auto()
    ALU = auto()
    RAM = auto()
    ADDR = auto()
    DEBUG = auto()


def check_for_module(value, module):
    return value == module or (isinstance(value, list) and module in value)


# FIXME: support for FIn signal
def apply_controls(dut, clear=False, pc_enable=False, subtract=False, load=None, store=None):
    dut.D_CLR.value = 1 if clear else 0
    dut.D_HLT.value = 0
    dut.D_CE.value = 1 if pc_enable else 0
    dut.D_SU.value = 1 if subtract else 0

    # store from bus
    assert not check_for_module(store, Module.DEBUG) # cannot store to debug from bus
    dut.D_AIn.value = 0 if check_for_module(store, Module.A) else 1
    dut.D_BIn.value = 0 if check_for_module(store, Module.B) else 1
    dut.D_OIn.value = 0 if check_for_module(store, Module.OUTPUT) else 1
    dut.D_IIn.value = 0 if check_for_module(store, Module.IR) else 1
    dut.D_Jn.value  = 0 if check_for_module(store, Module.PC) else 1
    dut.D_FIn.value = 1
    dut.D_MIn.value = 0 if check_for_module(store, Module.ADDR) else 1
    dut.D_RI.value  = 1 if check_for_module(store, Module.RAM) else 0

    # load onto bus
    dut.D_DOn.value = 0 if check_for_module(load, Module.DEBUG) else 1
    dut.D_AOn.value = 0 if check_for_module(load, Module.A) else 1
    dut.D_BOn.value = 0 if check_for_module(load, Module.B) else 1
    dut.D_IOn.value = 0 if check_for_module(load, Module.IR) else 1
    dut.D_COn.value = 0 if check_for_module(load, Module.PC) else 1
    dut.D_EOn.value = 0 if check_for_module(load, Module.ALU) else 1
    dut.D_ROn.value = 0 if check_for_module(load, Module.RAM) else 1
    assert not check_for_module(load, Module.ADDR) # cannot drive the bus from the memory address register


@asynccontextmanager
async def debug_mode(dut):
    if dut.DEBUG_ACK.value == 1:
        # already in debug mode
        yield
    else:
        await enable_debug(dut)
        try:
            yield
        finally:
            await disable_debug(dut)


async def enable_debug(dut):
    if dut.DEBUG_ACK.value == 1:
        return

    dut.DEBUG_REQUEST.value = 1
    await RisingEdge(dut.DEBUG_ACK)

async def disable_debug(dut):
    dut.DEBUG_REQUEST.value = 0

    if dut.DEBUG_ACK.value == 1:
        await FallingEdge(dut.DEBUG_ACK)

async def ram_write(dut, address, value):
    async with debug_mode(dut):
        dut.DEBUG_DATA.value = address
        apply_controls(dut, store=Module.ADDR, load=Module.DEBUG)
        await ClockCycles(dut.CLK, 1)

        dut.DEBUG_DATA.value = value
        apply_controls(dut, store=Module.RAM, load=Module.DEBUG)
        await ClockCycles(dut.CLK, 1)

async def ram_read(dut, address):
    async with debug_mode(dut):
        dut.DEBUG_DATA.value = address
        apply_controls(dut, store=Module.ADDR, load=Module.DEBUG)
        await ClockCycles(dut.CLK, 1)

        apply_controls(dut, load=Module.RAM)
        await ClockCycles(dut.CLK, 1)

        return dut.BUS.value

async def write_program(dut, assembly):
    isa = ISA()
    program = isa.assemble(assembly)
    assert len(program) <= 16

    async with debug_mode(dut):
        for i, b in enumerate(program):
            await ram_write(dut, i, b)

@cocotb.test()
async def test_core(dut):
    clock = Clock(dut.CLK, 1, units='us')
    cocotb.start_soon(clock.start())

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1
    await ClockCycles(dut.CLK, 2)

    # test memory access
    async with debug_mode(dut):
        await ram_write(dut, 0x0, 0xAB)
        await ram_write(dut, 0x1, 0xCD)
        assert await ram_read(dut, 0x0) == 0xAB
        assert await ram_read(dut, 0x1) == 0xCD

    # write a simple program to memory and run it
    await write_program(dut, """
        LDI 0xA
        OUT
        HLT
    """)

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1

    await with_timeout(RisingEdge(dut.HALTED), 50, 'us')
    assert dut.OUTREG.value == 0xA

    # reset and run again
    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1

    assert dut.OUTREG.value == 0x0
    await with_timeout(RisingEdge(dut.HALTED), 50, 'us')
    assert dut.OUTREG.value == 0xA

    # test reading from IN register and writing to OUT register
    await write_program(dut, """
        IN
        OUT
        HLT
    """)

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1
    dut.INREG.value = 0x66

    await with_timeout(RisingEdge(dut.HALTED), 50, 'us')
    assert dut.OUTREG.value == 0x66

    # calculate the answer to the ultimate question of life, the universe, and everything
    await write_program(dut, """
        LDA 4
        ADD 5
        OUT
        HLT
        28
        14
    """)

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1

    await with_timeout(RisingEdge(dut.HALTED), 50, 'us')
    assert dut.OUTREG.value == 42

    # multiply two numbers
    await write_program(dut, """
        LDA 14
        SUB 12
        JC 6
        LDA 13
        OUT
        HLT
        STA 14
        LDA 13
        ADD 15
        STA 13
        JMP 0
        0
        1
        0
        6
        7
    """)

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1

    await with_timeout(RisingEdge(dut.HALTED), 1000, 'us')
    assert dut.OUTREG.value == 42

    # calculate fibonacci sequence
    await write_program(dut, """
        LDI 0x1
        STA 0xE
        LDI 0x0
        OUT
        ADD 0xE
        STA 0xF
        LDA 0xE
        STA 0xD
        LDA 0xF
        STA 0xE
        LDA 0xD
        JC  0x0
        JMP 0x3
        0
        0
        0
    """)

    dut.RESETn.value = 0
    await ClockCycles(dut.CLK, 2)
    dut.RESETn.value = 1

    for i in [1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144]:
        await Edge(dut.OUTREG)
        assert dut.OUTREG.value == i
    await ClockCycles(dut.CLK, 1)
