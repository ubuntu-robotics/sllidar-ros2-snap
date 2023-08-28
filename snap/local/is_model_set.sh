#!/bin/sh -e

# Check that model is set
if [ ! -n "$(snapctl get model)" ]; then
  logger -t ${SNAP_NAME} "Model is not set, please run: snap set $SNAP_NAME model <value>"
  exit 1
fi
