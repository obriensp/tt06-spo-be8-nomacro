cmake_minimum_required(VERSION 3.24)
project(be8)
enable_testing()

include("cmake/ice40.cmake")

find_package(verilator QUIET)

set(COMMON_SOURCES
  src/i2c/i2c_slave.v
  src/i2c/i2c_to_apb.v

  src/cpu/alu.v
  src/cpu/bus_mux.v
  src/cpu/core.v
  src/cpu/control.v
  src/cpu/datapath.v
  src/cpu/full_adder.v
  src/cpu/microcode.v
  src/cpu/pc.v
  src/cpu/ram.v
  src/cpu/RAM8.v
  src/cpu/register.v
  src/cpu/register4.v

  src/debugger/cpu_access.v
  src/debugger/debugger_apb.v
  src/debugger/debugger_microcode.v
  src/debugger/status_reg.v
)

list(TRANSFORM COMMON_SOURCES PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/")

add_subdirectory(target)

if (verilator_FOUND)
  add_custom_target(
    lint
    COMMAND ${VERILATOR_BIN} --lint-only -Wall ${COMMON_SOURCES}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  )
endif()

add_cocotb_test(
  TOP alu
  SOURCES src/cpu/alu.v src/cpu/full_adder.v
)

add_cocotb_test(
  TOP apb_arbiter_top
  TESTBENCH tests.apb_arbiter
  SOURCES src/debugger/apb_arbiter.v
)

add_cocotb_test(
  TOP bus_mux
  SOURCES src/cpu/bus_mux.v
)

add_cocotb_test(
  TOP control
  SOURCES src/cpu/control.v src/cpu/microcode.v
)

add_cocotb_test(
  TOP core
  SOURCES
    src/cpu/alu.v
    src/cpu/bus_mux.v
    src/cpu/control.v
    src/cpu/core.v
    src/cpu/datapath.v
    src/cpu/full_adder.v
    src/cpu/microcode.v
    src/cpu/pc.v
    src/cpu/ram.v
    src/cpu/register.v
)

add_cocotb_test(
  TOP datapath
  SOURCES
    src/cpu/alu.v
    src/cpu/bus_mux.v
    src/cpu/datapath.v
    src/cpu/full_adder.v
    src/cpu/pc.v
    src/cpu/ram.v
    src/cpu/register.v
)

add_cocotb_test(
  TOP debugger_apb
  SOURCES
    src/cpu/alu.v
    src/cpu/bus_mux.v
    src/cpu/core.v
    src/cpu/control.v
    src/cpu/datapath.v
    src/cpu/full_adder.v
    src/cpu/microcode.v
    src/cpu/pc.v
    src/cpu/ram.v
    src/cpu/register.v

    src/debugger/apb_arbiter.v
    src/debugger/byte_compactor.v
    src/debugger/cpu_access.v
    src/debugger/debugger_apb.v
    src/debugger/debugger_microcode.v
    src/debugger/status_reg.v
)

add_cocotb_test(
  TOP debugger_i2c
  SOURCES
    src/cpu/alu.v
    src/cpu/bus_mux.v
    src/cpu/core.v
    src/cpu/control.v
    src/cpu/datapath.v
    src/cpu/full_adder.v
    src/cpu/microcode.v
    src/cpu/pc.v
    src/cpu/ram.v
    src/cpu/register.v
    src/cpu/register4.v

    src/debugger/apb_arbiter.v
    src/debugger/byte_compactor.v
    src/debugger/cpu_access.v
    src/debugger/debugger_apb.v
    src/debugger/debugger_i2c.v
    src/debugger/debugger_microcode.v
    src/debugger/status_reg.v

    src/i2c/rtl/i2c_slave.v
    src/i2c_to_apb.v
    src/stream1to4.v
    src/stream4to1.v
    src/streams1_to_apb.v
    src/streams4_to_apb.v
)

add_cocotb_test(
  TOP full_adder
  SOURCES src/cpu/full_adder.v
)

add_cocotb_test(
  TOP i2c
  SOURCES
    src/i2c.v src/streams1_to_apb.v
    src/stream1to4.v src/stream4to1.v
    src/streams4_to_apb.v src/i2c/rtl/i2c_slave.v
    src/i2c_to_apb.v
)

add_cocotb_test(
  TOP microcode
  SOURCES src/cpu/microcode.v
)

add_cocotb_test(
  TOP pc
  SOURCES src/cpu/pc.v
)

add_cocotb_test(
  TOP ram
  SOURCES src/cpu/ram.v
)

add_cocotb_test(
  TOP register
  SOURCES src/cpu/register.v
)
