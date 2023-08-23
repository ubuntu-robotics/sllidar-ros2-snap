#!/bin/sh -e

EXIT_CODE=0

# Make sure the ROS 2 content sharing is plugged.
if ! snapctl is-connected ros-humble; then
  logger -t ${SNAP_NAME} "Plug 'ros-humble' isn't connected, please run: snap connect $SNAP_NAME:ros-humble <providing-snap>"
  EXIT_CODE=1
fi

# Make sure the raw-usb is plugged.
if ! snapctl is-connected raw-usb; then
  logger -t ${SNAP_NAME} "Plug 'raw-usb' isn't connected, please run: snap connect $SNAP_NAME:raw-usb"
  EXIT_CODE=1
fi

exit ${EXIT_CODE}