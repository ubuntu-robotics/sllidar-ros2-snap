#!/usr/bin/bash -e

MODEL="$(snapctl get model)"
BAUDRATE="$(snapctl get baudrate)"

${SNAP}/ros2 launch sllidar_ros2 sllidar_${MODEL}_launch.py serial_baudrate:=${BAUDRATE}
