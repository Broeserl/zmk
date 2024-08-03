#!/bin/bash
west build -b nice_nano_v2 -d build/right -- -DSHIELD=track_man_5x6_right -DZMK_CONFIG=/workspaces/zmk-config/config
west build -b nice_nano_v2 -d build/left -- -DSHIELD=track_man_5x6_left -DZMK_CONFIG=/workspaces/zmk-config/config
