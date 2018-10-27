#!/usr/bin/env bash
# 重新生成badge
set -o errexit

SCRIPTS_DIR=$(cd $(dirname "$0") && pwd)
BUILD_DIR=$(cd $SCRIPTS_DIR/.. && pwd)/build
mkdir -p ${BUILD_DIR}/badge
for catalog in published translated translating sources;do
    ${SCRIPTS_DIR}/badge/show_status.sh -s ${catalog} > ${BUILD_DIR}/badge/${catalog}.svg
done
