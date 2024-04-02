add_ice40_target(
  alchitry_cu
  SOURCES ${COMMON_SOURCES}
    top.v
    pll.v
    ${PROJECT_SOURCE_DIR}/src/seven_segment.v
  TOP alchitry_top
  DEVICE hx8k
  PACKAGE cb132
  FREQ 20
  PIN_DEF pins.pcf
)
