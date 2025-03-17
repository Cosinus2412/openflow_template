# Toolchain configuration for the riscv32-elf-gcc.
#
get_filename_component(TOOLCHAINFILE_DIR "${CMAKE_CURRENT_LIST_FILE}" DIRECTORY)

set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_C_COMPILER_TARGET riscv32-unknown-elf)
set(CMAKE_C_COMPILER   ${CMAKE_C_COMPILER_TARGET}-gcc)
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER_TARGET}-gcc)
set(CMAKE_AR           ${CMAKE_C_COMPILER_TARGET}-ar CACHE STRING "Path to a program.")
set(CMAKE_RANLIB       ${CMAKE_C_COMPILER_TARGET}-ranlib CACHE STRING "Path to a program.")

find_program(COMPILER ${CMAKE_ASM_COMPILER})
get_filename_component(COMPILER_PATH ${COMPILER} DIRECTORY)
#set(CMAKE_SYSROOT     ${COMPILER_PATH}/../riscv-gnu-toolchain-rv32i/2023.09)
set(CMAKE_SYSROOT     "/foss/designs/sysroot")  

# Setup defaults that are commonly used. (Can be overwritten via the command line.)
set(default_build_type MinSizeRel)
#set(CMAKE_INSTALL_PREFIX "${CMAKE_SYSROOT}" CACHE STRING "Install path prefix, prepended onto install directories.")
set(CMAKE_INSTALL_PREFIX "/foss/designs/sysroot" CACHE STRING "Install path prefix, prepended onto install directories.")
set(CMAKE_INSTALL_LIBDIR "lib/rv32i/ilp32" CACHE STRING "Library directory for the used multilib configuration.")

# Setup the default build type.
# (see https://blog.kitware.com/cmake-and-the-default-build-type/)
if(NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  message(STATUS "Setting build type to '${default_build_type}' as none was specified.")
  set(CMAKE_BUILD_TYPE ${default_build_type} CACHE STRING "Choose the type of build." FORCE)
  # Set the possible values of build type for cmake-gui
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS Debug Release MinSizeRel RelWithDebInfo)
endif()

# Extend linker invocations so that map files are created automatically.
set(CMAKE_ASM_LINK_EXECUTABLE
    "<CMAKE_ASM_COMPILER> <FLAGS> <CMAKE_ASM_LINK_FLAGS> -Wl,-Map,<TARGET>.map <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_C_LINK_EXECUTABLE
    "<CMAKE_C_COMPILER> <FLAGS> <CMAKE_C_LINK_FLAGS> -Wl,-Map,<TARGET>.map <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

# Prepends a value string to one or multiple string variables given that
# the search string could not be found.
#
# add_if_missing(<search_string> <value_string> <variables_to_check_and_extend...>)
#
macro(add_if_missing condition value)
  foreach(var ${ARGN})
    string(FIND "${${var}}" "${condition}" findPosition)
    if(findPosition LESS 0)
      set(${var} "${value} ${${var}}" CACHE STRING "..." FORCE)
    endif()
  endforeach()
endmacro()

# Specify flags that are unconditionally added to the compiler/linker invocations.
add_if_missing("-ffunction-sections" "-ffunction-sections" CMAKE_C_FLAGS CMAKE_ASM_FLAGS)
add_if_missing("-fdata-sections" "-fdata-sections" CMAKE_C_FLAGS CMAKE_ASM_FLAGS)
add_if_missing("-Wl,-gc-sections" "-Wl,-gc-sections" CMAKE_EXE_LINKER_FLAGS CMAKE_ASM_FLAGS)
