# Telemetry in a Box (TBX)

This repository contains the source code for the Telemetry in a Box (TBX) project. TBX is a telemetry system that is designed to be self contained but tied to specific hardware.

Hardware consists of various sensors like an IMU, GPS, and barometer. It's designed with FreeRTOS and mavlink, for the Pi Pico (RP2040). Ideally this can be used with any radio module but we are using RFD900x with the mesh firmware.

Make sure to use compile time flags to set the mavlink system id and component id. This is important for the telemetry system to work properly.

## Clone

```shell
git clone --recursive
git submodule update --init --recursive
```

## Build (Linux)

```shell
cmake -B build
cmake --build build
```

In the event that your preferred IDE has trouble locating header files and/or is displaying incorrect errors, pass ```-DCMAKE_EXPORT_COMPILE_COMMANDS=true``` to the first CMake command above. Similarly, if you wish to compile the additional tools (e.g. reading flash, calibrating the IMU, etc.), pass ```-DCOMPILE_TOOLS=true``` to the first CMake command above as well.

## Build (Mac)

Grab needed dependencies:

```shell
brew install cmake
brew install --cask gcc-arm-embedded
```

<!-- 
Not needed?:
# brew install gcc-arm-none-eabi
# brew install arm-none-eabi-gdb
# brew install arm-none-eabi-gcc 
-->

Then, build:

```shell
cmake -B build
cmake --build build
```
