#!/bin/zsh
# Exit script on error
set -e

# Set the path to your Pico SDK
export PICO_SDK_PATH="./include/pico-sdk"

# Set the compiler and linker flags for cross-compilation
export CFLAGS="-mcpu=cortex-m0plus -mthumb"
export CXXFLAGS="$CFLAGS"
export LDFLAGS=""

# Specify the compiler paths
export CC=/opt/homebrew/bin/arm-none-eabi-gcc
export CXX=/opt/homebrew/bin/arm-none-eabi-g++

# Clean the previous build
rm -rf build

# Configure the build with CMake, including the Pico SDK path and any necessary flags
cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_SYSTEM_NAME=Generic \
    -DCMAKE_SYSTEM_VERSION="1.0.0" \
    -DCMAKE_SYSTEM_PROCESSOR=arm \
    -DAPPLE=FALSE \
    -DCMAKE_OSX_ARCHITECTURES=FALSE \
    -DCMAKE_CROSSCOMPILING=TRUE \
    -DPICO_SDK_PATH=$PICO_SDK_PATH \
    -DCMAKE_C_COMPILER=$CC \
    -DCMAKE_CXX_COMPILER=$CXX \
    -DCMAKE_C_FLAGS="$CFLAGS" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS" \
    -DCMAKE_EXE_LINKER_FLAGS="$LDFLAGS" \
    -DPICO_BOARD="pico_w"

# Build the project
cmake --build build