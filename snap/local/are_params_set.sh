#!/bin/sh -e

EXIT_CODE=0

# Check that model is set
if [ ! -n "$(snapctl get model)" ]; then
  logger -t ${SNAP_NAME} "Model is not set, please run: snap set $SNAP_NAME model <value>"
  EXIT_CODE=1
fi

# Check that baudrate is set
if [ ! -n "$(snapctl get baudrate)" ]; then
  logger -t ${SNAP_NAME} "Baudrate is not set, please run: snap set $SNAP_NAME baudrate <value>"
  EXIT_CODE=1
fi

exit ${EXIT_CODE}
