include_guard(DIRECTORY)

# Find the programs that we want to use for post processing the binaries and setup default flags.
find_program(OBJDUMP_EXECUTABLE NAMES ${CMAKE_C_COMPILER_TARGET}-objdump llvm-objdump objdump)
find_program(OBJCOPY_EXECUTABLE NAMES ${CMAKE_C_COMPILER_TARGET}-objcopy llvm-objcopy objcopy)
find_program(SIZE_EXECUTABLE NAMES ${CMAKE_C_COMPILER_TARGET}-size llvm-size size)
set(OBJDUMP_FLAGS "-h;-S;-t" CACHE STRING "Flags that are used for creating listings with objdump.")
set(OBJCOPY_FLAGS "-O binary" CACHE STRING "Flags that are used for creating the binary file with objcopy.")
set(SIZE_FLAGS "" CACHE STRING "Flags that are used for showing the binary size.")

mark_as_advanced(OBJDUMP_EXECUTABLE OBJCOPY_EXECUTABLE SIZE_EXECUTABLE
                 OBJDUMP_FLAGS SIZE_FLAGS CONVERT_EXECUTABLE)

set(CLEAN_FILES_PROPERTY ADDITIONAL_MAKE_CLEAN_FILES)
if(CMAKE_VERSION VERSION_GREATER_EQUAL 3.15)
  set(CLEAN_FILES_PROPERTY ADDITIONAL_CLEAN_FILES)
endif()

# Function to copy reference output file
function(pp_copy_ref targetName)
  add_custom_command(TARGET "${targetName}" POST_BUILD
    COMMAND cp "${CMAKE_CURRENT_SOURCE_DIR}/${targetName}.ref" "$<TARGET_FILE:${targetName}>.ref"
    COMMENT "Copy reference output file for \"${targetName}\"")
  set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} APPEND PROPERTY ${CLEAN_FILES_PROPERTY} "$<TARGET_FILE:${targetName}>.ref")
endfunction()

# Function to create extended listings with objdump.
function(pp_create_listing targetName)
  if(NOT OBJDUMP_EXECUTABLE)
    message(STATUS "objdump couldn't be found -> skipping extended listing creation of target \"${targetName}\".")
    return()
  endif()
  add_custom_command(TARGET "${targetName}" POST_BUILD
    COMMAND ${OBJDUMP_EXECUTABLE} ${OBJDUMP_FLAGS} "$<TARGET_FILE:${targetName}>" > "$<TARGET_FILE:${targetName}>.lss"
    COMMENT "Create extended listing of target \"${targetName}\"")
  set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} APPEND PROPERTY ${CLEAN_FILES_PROPERTY} "$<TARGET_FILE:${targetName}>.lss")
endfunction()

# Function to create .bin from elf
function(pp_create_bin targetName)
  if(NOT OBJDUMP_EXECUTABLE)
    message(STATUS "objcopy couldn't be found -> skipping .bin generation \"${targetName}\".")
    return()
  endif()
  add_custom_command(TARGET "${targetName}" POST_BUILD
    COMMAND ${OBJCOPY_EXECUTABLE} ${OBJCOPY_FLAGS} "$<TARGET_FILE:${targetName}>" "$<TARGET_FILE:${targetName}>.bin"
    COMMENT "Create extended listing of target \"${targetName}\"")
  set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} APPEND PROPERTY ${CLEAN_FILES_PROPERTY} "$<TARGET_FILE:${targetName}>.bin")
endfunction()

# Function to print the size of an target after building it.
#
# pp_print_size(<target> [FORMAT <sysv|berkeley>])
#
# Optional Arguments:
#   FORMAT...........The desired format that should be used for printing the size (default: berkeley).
#
function(pp_print_size targetName)
  set(options "")
  set(oneValueArgs FORMAT)
  set(multiValueArgs "")
  cmake_parse_arguments(ARG "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
  if(NOT SIZE_EXECUTABLE)
    message(STATUS "size couldn't be found -> size information of the target \"${targetName}\" will not be printed.")
    return()
  endif()
  if(ARG_FORMAT)
    set(ARG_FORMAT "--format=${ARG_FORMAT}")
  endif()
  add_custom_command(TARGET "${targetName}" POST_BUILD
    COMMAND ${SIZE_EXECUTABLE} ${ARG_FORMAT} ${SIZE_FLAGS} "$<TARGET_FILE:${targetName}>"
    COMMENT "Print size of target \"${targetName}\".")
endfunction()

# 
# #Function to create a flash and eeprom image (ihex format)
# function(pp_create_images targetName)
#   set(DIR "")
#   if(CMAKE_RUNTIME_OUTPUT_DIRECTORY)
#     set(DIR "${CMAKE_RUNTIME_OUTPUT_DIRECTORY}/")
#   endif()
#   FIND_PROGRAM(AVR_OBJCOPY_EXECUTABLE NAMES avr-objcopy)
#   if(AVR_OBJCOPY_EXECUTABLE)
#     ADD_CUSTOM_COMMAND(TARGET "${targetName}" POST_BUILD
#       COMMAND ${AVR_OBJCOPY_EXECUTABLE} -R .eeprom -O ihex "${DIR}${targetName}" "${DIR}${targetName}.hex"
#       COMMENT "Create flash image (ihex format) of ${targetName}")
# 
#     ADD_CUSTOM_COMMAND(TARGET "${targetName}" POST_BUILD
#       COMMAND ${AVR_OBJCOPY_EXECUTABLE} -j .eeprom --no-change-warnings --change-section-lma .eeprom=0 -O ihex
#             "${DIR}${targetName}"
#             "${DIR}${targetName}.eep"
#       COMMENT "Create eeprom image (ihex format) of ${targetName}")
# 
#     FIND_PROGRAM(AVRDUDE_EXECUTABLE NAMES avrdude)
#     if(AVRDUDE_EXECUTABLE)
#       ADD_CUSTOM_TARGET(write_${targetName}_flash COMMAND ${AVRDUDE_EXECUTABLE} ${AVRDUDE_FLAGS} -U flash:w:"${DIR}${targetName}.hex":i
#                           DEPENDS ${targetName}
#                           COMMENT "Writing ${targetName} into device flash")
# 
#       ADD_CUSTOM_TARGET(write_${targetName}_eeprom COMMAND ${AVRDUDE_EXECUTABLE} ${AVRDUDE_FLAGS} -U eeprom:w:"${DIR}${targetName}.eep":i
#                           DEPENDS ${targetName}
#                           COMMENT "Writing ${targetName} into device eeprom")
# 
#       ADD_CUSTOM_TARGET(verify_${targetName}_flash COMMAND ${AVRDUDE_EXECUTABLE} ${AVRDUDE_FLAGS} -U flash:v:"${DIR}${targetName}.hex"
#                           DEPENDS ${targetName}
#                           COMMENT "Verifing device flash against ${DIR}${targetName}.hex")
# 
#       ADD_CUSTOM_TARGET(verify_${targetName}_eeprom COMMAND ${AVRDUDE_EXECUTABLE} ${AVRDUDE_FLAGS} -U eeprom:v:"${DIR}${targetName}.eep"
#                           DEPENDS ${targetName}
#                           COMMENT "Verifing device eeprom against ${DIR}${targetName}.eep")
#     ELSE()
#       MESSAGE(STATUS "avrdude couldn't be found -> transfer of ${targetName} not supported")
#     endif()
#   ELSE()
#     MESSAGE(STATUS "avr-objcopy couldn't be found -> skipping image creation (ihex format) of ${targetName}")
#   endif()
# endfunction()
