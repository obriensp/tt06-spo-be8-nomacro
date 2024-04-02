add_ice40_target(
  icebreaker
  SOURCES ${COMMON_SOURCES}
    top.v
    ${PROJECT_SOURCE_DIR}/src/seven_segment.v
  TOP icebreaker_top
  FREQ 20
  PIN_DEF pins.pcf
)
