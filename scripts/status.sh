#!/usr/bin/env bash
# 重新生成status data
set -o errexit

SCRIPTS_DIR=$(cd $(dirname "$0") && pwd)
BUILD_DIR=$(cd $SCRIPTS_DIR/.. && pwd)/build
mkdir -p ${BUILD_DIR}/status
${SCRIPTS_DIR}/status/status.sh  > ${BUILD_DIR}/status/status.json
