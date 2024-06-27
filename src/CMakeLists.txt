add_executable(telem
    telem.cpp
)

# STDIO on USB or UART?
pico_enable_stdio_usb(telem 1)
pico_enable_stdio_uart(telem 0)

target_link_libraries(telem pico_stdlib pico_multicore pico_sync hardware_i2c hardware_spi hardware_pwm hardware_adc pico_cyw43_arch_none)
target_include_directories(telem PUBLIC ../include)

pico_add_extra_outputs(telem)

