#!/bin/sh
# PR 检查脚本
set -e

CHECK_DIR="$(dirname "$0")/check"
# sh "${CHECK_DIR}/check.sh" # 需要依赖，暂时禁用
sh "${CHECK_DIR}/collect.sh"
sh "${CHECK_DIR}/analyze.sh"
sh "${CHECK_DIR}/identify.sh"
