#!/bin/bash

source /opt/nest/bin/nest_vars.sh

# Start NEST Server
export NEST_SERVER_HOST="${NEST_SERVER_HOST:-0.0.0.0}"
export NEST_SERVER_MODULES="${NEST_SERVER_MODULES:-nest,numpy}"
export NEST_SERVER_PORT="${NEST_SERVER_PORT:-52425}"
export NEST_SERVER_RESTRICTION_OFF="${NEST_SERVER_RESTRICTION_OFF:-1}"
export NEST_SERVER_STDOUT="${NEST_SERVER_STDOUT:-1}"

nest-server start -d

# Start NEST Desktop
export NEST_DESKTOP_HOST="${NEST_DESTKOP_HOST:-0.0.0.0}"
export NEST_DESKTOP_PORT="${NEST_DESTKOP_HOST:-54286}"

nest-desktop start