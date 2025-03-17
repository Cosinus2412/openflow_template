# Source: https://github.com/grisumbras/object-libraries
#
# # object-libraries
# 
# > Helper functions to manage CMake object libraries
# 
# It is sometimes desirable to treat some object files as a separate entity,
# without linking or archiving them. CMake provides **object libraries** for
# that, but using them isn't exactly straightforward. This project attempts to
# mitigate the issue.
# 
# ## Background
# 
# So, what are the reasons to using object files that are not linked into a
# binary? The number one reason is object file reuse. Suppose you have an
# executable and a unit test runner, they obviously need to share object files
# that contain the code being tested. Another reason is setting special compiler
# flags for a subset of object files.
# 
# Now, why the need for a dedicated project to create object libraries, after
# all, CMake already has a command that does it? Well, have you used a CMake
# object library? Was it as convenient and idiomatic as using proper libraries?
# This project tries to provide an interface to create object libraries in such
# a way, so using them is simple.
# 
# ## Usage
# 
# In order to use the _installed_ package, you need to import it inside one of
# your `CMakeLists.txt` files:
# 
# ```cmake
# find_package(ObjectLibraries)
# ```
# 
# In order to use the project as a subproject, use `add_subdirectory` command,
# but specify the build directory also:
# 
# ```cmake
# add_subdirectory(path/to/object-libraries/sources object-libraries)
# ```
# 
# ## API
# 
# ### add_object_files
# 
# `add_object_files(<target> [NO_INCLUDE_CURRENT_DIR] source1 [source2 ...])`
# 
# Adds two targets: a backend **object library**, that compiles specified sources
# into object files, and a frontend **interface library**, called `<target>`,
# that could be used by dependent targets to link with those object files. If
# you need to set some properties on object files, you can use standard commands
# on the frontend target. By defalt, `<target>` adds current source directory
# to the list of include directories of its dependent targets, to disable that
# use `NO_INCLUDE_CURRENT_DIR` option. Example usage:
# 
# ```cmake
# add_object_files(foo_objs a.cpp b.cpp)
# target_compile_definitions(foo_objs FOO_MACRO)
# 
# add_executable(foo main.cpp)
# target_link_libraries(foo PRIVATE foo_objs)
# 
# add_executable(foo-test test.cpp)
# target_link_libraries(foo PRIVATE foo_objs)
# ```
# 
# ### get_underlying_objects
# 
# `get_underlying_objects(<var> <target>)`
# 
# Sets `<var>` to the name of the backend object library corresponding to the
# interface library `<target>`, that was created by `add_object_files`.
# Usually, you only have to deal with the frontend target, but for the cases,
# where that is not enough, you can use this function. Example usage:
# 
# ```cmake
# add_object_files(objs x.cpp)
# get_underlying_objects(objs_bkend objs)
# # set an option for a single object file, not for the whole linked binary
# target_compile_options(objs_bkend -fobscure-option)
# ```
# 
# ## License
# 
# [BSL-1.0](./LICENSE) (C) Dmitry Arkhipov
#

function(add_object_files target)
  cmake_parse_arguments(add_object_files NO_INCLUDE_CURRENT_DIR "" "" ${ARGN})

  add_library(${target} INTERFACE)
  add_library(_${target}_impl OBJECT ${add_object_files_UNPARSED_ARGUMENTS})

  set_property(
    TARGET ${target}
    PROPERTY INTERFACE_SOURCES $<TARGET_OBJECTS:_${target}_impl>
  )

  foreach(
    prop
    AUTOUIC_OPTIONS
    COMPILE_DEFINITIONS
    COMPILE_FEATURES
    COMPILE_OPTIONS
    INCLUDE_DIRECTORIES
    LINK_LIBRARIES
    POSITION_INDEPENDENT_CODE
    SYSTEM_INCLUDE_DIRECTORIES
  )
    set_target_properties(
      _${target}_impl
      PROPERTIES ${prop} $<TARGET_PROPERTY:${target},INTERFACE_${prop}>
    )
  endforeach()

  if(NOT add_object_files_NO_INCLUDE_CURRENT_DIR)
    target_include_directories(${target} INTERFACE "${CMAKE_CURRENT_SOURCE_DIR}")
  endif()
endfunction()


function(get_underlying_objects var target)
  set(${var} _${target}_impl PARENT_SCOPE)
endfunction()

