get_filename_component(TOOLCHAINFILE_DIR "${CMAKE_CURRENT_LIST_FILE}" DIRECTORY)
include("${TOOLCHAINFILE_DIR}/riscv32.cmake")

set(CPU_NAME ibex CACHE STRING "Name of the processor.")

# # Generate a hex file for the ibex verilog model
# find_program(OBJCOPY_EXECUTABLE NAMES ${CMAKE_C_COMPILER_TARGET}-objcopy)
# find_program(GAWK_EXECUTABLE NAMES gawk)
# mark_as_advanced(OBJCOPY_EXECUTABLE GAWK_EXECUTABLE)
# set(PP_COMMANDS
#     "${OBJCOPY_EXECUTABLE} -O verilog <TARGET> <TARGET>.hex"
#     "${GAWK_EXECUTABLE} -i inplace -v 'RS=[0-9A-F]{8}' -vORS= '{printf (RT==\"\"?\"%s\":\"%s%08X\"), $0, strtonum(\"0x\"RT)-0x100000}' <TARGET>.hex"
# )
# set(CMAKE_ASM_LINK_EXECUTABLE ${CMAKE_ASM_LINK_EXECUTABLE} ${PP_COMMANDS})
# set(CMAKE_C_LINK_EXECUTABLE ${CMAKE_C_LINK_EXECUTABLE} ${PP_COMMANDS})

# Setup flags that we always want to append to the compiler invocations.
set(spec_file "${CMAKE_SYSROOT}/${CMAKE_INSTALL_LIBDIR}/ibex-newlib-nano.specs")
add_if_missing("${spec_file}" "-specs '${spec_file}'" CMAKE_C_FLAGS CMAKE_ASM_FLAGS)

set(CMAKE_CROSSCOMPILING_EMULATOR "${TOOLCHAINFILE_DIR}/bin/ibex-run"
    CACHE STRING "Emulator for executing the crosscompiled binaries.")
