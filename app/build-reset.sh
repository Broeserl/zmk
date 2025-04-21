#!/bin/bash

west build -p -b nice_nano_v2 -d build/reset -- -DSHIELD=settings_reset
