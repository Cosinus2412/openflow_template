cmake_minimum_required(VERSION 3.10)

project(gloss LANGUAGES ASM C)

include(GNUInstallDirs)  # Provides various system directories via CMAKE_INSTALL_... variables.
                         # Starting with CMake 3.14 they are used as default for install commands.

# Specify runtime libraries that are usually provided by the toolchain.
# IBEX
add_library(crt0-ibex OBJECT ibex/crt0.S)
install(FILES "$<TARGET_OBJECTS:crt0-ibex>" DESTINATION "${CMAKE_INSTALL_LIBDIR}" RENAME crt0-ibex.o)

add_library(gloss-ibex STATIC ibex/syscalls.c)
target_include_directories(gloss-ibex PRIVATE ibex)
install(TARGETS gloss-ibex ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}")

configure_file(ibex-newlib-nano.specs.in ibex-newlib-nano.specs @ONLY)
install(FILES "${CMAKE_BINARY_DIR}/ibex-newlib-nano.specs" DESTINATION "${CMAKE_INSTALL_LIBDIR}")

configure_file(ibex.ld.in ibex.ld @ONLY)
install(FILES "${CMAKE_BINARY_DIR}/ibex.ld" DESTINATION "${CMAKE_INSTALL_LIBDIR}")
