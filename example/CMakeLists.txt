set(CMAKE_TOOLCHAIN_FILE arm-toolchain.cmake)
cmake_minimum_required(VERSION 2.8.9)
project (hello)
add_executable(hello main.cpp)
