include_guard(GLOBAL)


function(add_ice40_target TARGET_NAME)
  cmake_parse_arguments(
    ICE40
    ""
    "DEVICE;FREQ;PACKAGE;PIN_DEF;SEED;TOP"
    "SOURCES;MEM_FILES"
    ${ARGN}
  )

  if (NOT ICE40_SOURCES)
    message(FATAL_ERROR "Need at least one source")
  endif()

  if (NOT ICE40_PIN_DEF)
    message(FATAL_ERROR "Need to specify PIN_DEF")
  endif()

  if (NOT ICE40_TOP)
    set(ICE40_TOP icebreaker_top)
  endif()

  if (NOT ICE40_DEVICE)
    set(ICE40_DEVICE up5k)
  endif()

    if (NOT ICE40_FREQ)
      set(ICE40_DEVICE 20)
    endif()

  if (NOT ICE40_PACKAGE)
    set(ICE40_PACKAGE sg48)
  endif()

  if (NOT ICE40_SEED)
    set(ICE40_SEED 1)
  endif()

  set(ICE40_DIR "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/${TARGET_NAME}.dir/ice40.dir")
  file(MAKE_DIRECTORY ${ICE40_DIR})

  set(ICE40_JSON "${ICE40_DIR}/${TARGET_NAME}.json")
  set(ICE40_ASC "${ICE40_DIR}/${TARGET_NAME}.asc")
  set(ICE40_BIN "${CMAKE_CURRENT_BINARY_DIR}/${TARGET_NAME}.bin")

  set(ICE40_FROM_MEM_FILES "")
  set(ICE40_TO_MEM_FILES "")

  foreach(pair ${ICE40_MEM_FILES})
    string(FIND "${pair}" ":" pos)
    if (pos LESS 1)
      message(WARNING "Skipping malformed pair (no input hex name): ${pair}")
    else()
      string(SUBSTRING "${pair}" 0 "${pos}" from)
      math(EXPR pos "${pos} + 1")
      string(SUBSTRING "${pair}" "${pos}" -1 to)
      list(APPEND ICE40_FROM_MEM_FILES ${from})
      list(APPEND ICE40_TO_MEM_FILES ${to})
    endif()
  endforeach()

  # Synthesis
  add_custom_command(
    OUTPUT ${ICE40_JSON}
    COMMAND ${CMAKE_COMMAND} -E rm -f ${ICE40_JSON}
    COMMAND yosys -l ${ICE40_DIR}/yosys.log -q -p 'synth_ice40 -top ${ICE40_TOP} -json ${ICE40_JSON}' ${ICE40_SOURCES}
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    DEPENDS ${ICE40_SOURCES} ${ICE40_FROM_MEM_FILES}
    COMMENT "Synthesizing ${TARGET_NAME}"
  )

  # Place and route
  add_custom_command(
    OUTPUT ${ICE40_ASC}.0
    COMMAND ${CMAKE_COMMAND} -E rm -f ${ICE40_ASC}
    COMMAND nextpnr-ice40 -l ${ICE40_DIR}/nextpnr.log -q --seed ${ICE40_SEED} --freq ${ICE40_FREQ} --top ${ICE40_TOP} --package ${ICE40_PACKAGE} --${ICE40_DEVICE} --asc ${ICE40_ASC}.0 --pcf ${ICE40_PIN_DEF} --json ${ICE40_JSON}
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    DEPENDS ${ICE40_JSON} ${ICE40_PIN_DEF}
    COMMENT "Placing and routing ${TARGET_NAME}"
  )

  # Replace BRAM files
  set(ICE40_MEM_CURRENT 0)
  foreach(from IN ZIP_LISTS ICE40_FROM_MEM_FILES ICE40_TO_MEM_FILES)
    math(EXPR ICE40_MEM_NEXT "${ICE40_MEM_CURRENT} + 1")
    add_custom_command(
      OUTPUT ${ICE40_ASC}.${ICE40_MEM_NEXT}
      COMMAND ${CMAKE_COMMAND} -E cat ${ICE40_ASC}.${ICE40_MEM_CURRENT} | icebram ${from} ${to} > ${ICE40_ASC}.${ICE40_MEM_NEXT}
      WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
      DEPENDS ${ICE40_ASC}.${ICE40_MEM_CURRENT} ${from} ${to}
      COMMENT "Replacing ${from} with ${to}"
    )
    set(ICE40_MEM_CURRENT ${ICE40_MEM_NEXT})
  endforeach()

  # Copy final asc
  add_custom_command(
    OUTPUT ${ICE40_ASC}
    COMMAND ${CMAKE_COMMAND} -E copy ${ICE40_ASC}.${ICE40_MEM_CURRENT} ${ICE40_ASC}
    DEPENDS ${ICE40_ASC}.${ICE40_MEM_CURRENT}
    COMMENT "Copying final asc"
  )

  # Bitstream packing
  add_custom_command(
    OUTPUT ${ICE40_BIN}
    COMMAND ${CMAKE_COMMAND} -E rm -f ${ICE40_BIN}
    COMMAND icepack ${ICE40_ASC} ${ICE40_BIN}
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
    DEPENDS ${ICE40_ASC}
    COMMENT "Packing ${TARGET_NAME}"
  )

  add_custom_target(
    ${TARGET_NAME} ALL
    DEPENDS ${ICE40_BIN}
  )

endfunction()


function(add_cocotb_test)
  cmake_parse_arguments(
    COCOTB
    ""
    "TOP;TESTBENCH"
    "SOURCES"
    ${ARGN}
  )

  if (NOT COCOTB_TOP)
    message(FATAL_ERROR "Must specify Verilog top module name")
  endif()

  if (NOT COCOTB_TESTBENCH)
    set(COCOTB_TESTBENCH "${COCOTB_TOP}")
  endif()

  if (NOT COCOTB_SOURCES)
    message(FATAL_ERROR "Need at least one source")
  endif()

  # Create cocotb.dir
  set(COCOTB_DIR "${CMAKE_CURRENT_BINARY_DIR}/CMakeFiles/cocotb.dir")
  file(MAKE_DIRECTORY ${COCOTB_DIR})

  # Generate verilog source for dumping the top module
  set(COCOTB_DUMP_V_PATH "${COCOTB_DIR}/${COCOTB_TOP}.dump.v")
  file(
    WRITE ${COCOTB_DUMP_V_PATH}
    "module dump();\n"
    "  initial begin\n"
    "    $dumpfile (\"${COCOTB_DIR}/${COCOTB_TOP}.vcd\");\n"
    "    $dumpvars (0, ${COCOTB_TOP});\n"
    "    #1;\n"
    "  end\n"
    "endmodule\n"
  )

  # Run iverilog to generate .vvp
  set(COCOTB_VVP "${COCOTB_DIR}/${COCOTB_TOP}.vvp")
  add_test(
    NAME "iverilog_${COCOTB_TOP}"
    COMMAND iverilog -o ${COCOTB_VVP} -s ${COCOTB_TOP} -s dump -g2012 ${COCOTB_SOURCES} ${COCOTB_DUMP_V_PATH}
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  )
  set_tests_properties("iverilog_${COCOTB_TOP}" PROPERTIES
    FIXTURES_SETUP "fixture_iverilog_${COCOTB_TOP}"
  )

  # Get cocotb prefix
  execute_process(
    COMMAND cocotb-config --prefix
    OUTPUT_VARIABLE COCOTB_PY_PREFIX
    OUTPUT_STRIP_TRAILING_WHITESPACE
  )

  # Run vvp
  set(COCOTB_RESULTS_XML "${COCOTB_DIR}/${COCOTB_TOP}.results.xml")
  set(COCOTB_LOG "${COCOTB_DIR}/${COCOTB_TOP}.log")
  add_test(
    NAME ${COCOTB_TOP}
    COMMAND vvp -M ${COCOTB_PY_PREFIX}/cocotb/libs -m libcocotbvpi_icarus ${COCOTB_VVP}
    WORKING_DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}"
  )
  set_tests_properties(${COCOTB_TOP} PROPERTIES
    FIXTURES_REQUIRED "fixture_iverilog_${COCOTB_TOP}"
    ENVIRONMENT "MODULE=${COCOTB_TESTBENCH};COCOTB_RESULTS_FILE=${COCOTB_RESULTS_XML};PYTHONPATH=${PROJECT_SOURCE_DIR}"
    FAIL_REGULAR_EXPRESSION "FAIL=[^0];Failed to import module;No tests were discovered"
  )
endfunction()
