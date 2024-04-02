add_cocotb_test(
  TOP debugger_apb
  SOURCES ${COMMON_SOURCES}
)

add_cocotb_test(
  TOP debugger_i2c
  SOURCES ${COMMON_SOURCES} debugger_i2c.v
)
