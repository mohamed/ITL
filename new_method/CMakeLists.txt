# CMake build file for prayer
# By: Mohamed A.M. Bamakhrama (mohamed@alumni.tum.de)

cmake_minimum_required(VERSION 3.0)
project(prayer
        VERSION 0.1
        LANGUAGES C)

set(CMAKE_C_STANDARD 90)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Release")
endif()

if("${CMAKE_C_COMPILER_ID}" STREQUAL "Clang")
  set(CFLAGS "-Weverything" )
elseif("${CMAKE_C_COMPILER_ID}" STREQUAL "GNU")
  set(CFLAGS "-Wall -Wextra -Werror" )
endif()

if(MSVC)
  set(CFLAGS "/Za /Wall")
endif()

# Specify header files
set(HEADERS
    src/defs.h
    src/prayer.h
    src/config.h
    )

# Specify sources
set(SRCS
    src/prayer.c
    src/config.c
    )

# Specify executables
add_executable(prayer src/main.c ${SRCS})
target_compile_options(prayer PRIVATE ${CFLAGS})
target_link_libraries(prayer m)
