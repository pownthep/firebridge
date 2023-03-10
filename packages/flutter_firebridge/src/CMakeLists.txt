# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(flutter_firebridge_library VERSION 0.0.1 LANGUAGES C)

add_library(flutter_firebridge SHARED
  "flutter_firebridge.c"
)

set_target_properties(flutter_firebridge PROPERTIES
  PUBLIC_HEADER flutter_firebridge.h
  OUTPUT_NAME "flutter_firebridge"
)

target_compile_definitions(flutter_firebridge PUBLIC DART_SHARED_LIB)
