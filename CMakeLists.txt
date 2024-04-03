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
  src/cpu/RAM16.v
  src/cpu/register.v
  src/cpu/register4.v

  src/debugger/cpu_access.v
  src/debugger/debugger_apb.v
  src/debugger/debugger_microcode.v
  src/debugger/status_reg.v
)

list(TRANSFORM COMMON_SOURCES PREPEND "${CMAKE_CURRENT_SOURCE_DIR}/")

if (verilator_FOUND)
  add_custom_target(
    lint
    COMMAND ${VERILATOR_BIN} --lint-only -Wall ${COMMON_SOURCES}
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
  )
endif()

add_subdirectory(target)
add_subdirectory(test)
