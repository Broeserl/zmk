#!/bin/bash

west build -p -b nice_nano_v2 -S zmk-usb-logging -d build/left -- -DSHIELD=tracktyl-5x6_left -DZMK_CONFIG=/workspaces/zmk-config/config -DZMK_EXTRA_MODULES="/workspaces/zmk-modules/zmk-pmw3360-driver/;/workspaces/zmk-modules/zmk-keyboard-tracktyl-5x6/"
