#!/usr/bin/bash -e

MODEL="$(snapctl get model)"

LAUNCH_OPTIONS=""

OPTIONS="baudrate channel-type serial-port serial-baudrate frame-id inverted \
angle-compensate scan-mode udp-ip udp-port scan-frequency"

for OPTION in ${OPTIONS}; do
  VALUE="$(snapctl get ${OPTION})"
  if [ -n "${VALUE}" ]; then
    LAUNCH_OPTIONS+="${OPTION}:=${VALUE} "
  fi
done

# Replace '-' with '_'
LAUNCH_OPTIONS=$(echo ${LAUNCH_OPTIONS} | tr - _)

logger -t ${SNAP_NAME} "Running with options: ${LAUNCH_OPTIONS}"

${SNAP}/ros2 launch sllidar_ros2 sllidar_${MODEL}_launch.py ${LAUNCH_OPTIONS}
