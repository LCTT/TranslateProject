#!/bin/sh

################################################################################
# 公用常量和函数
################################################################################

# 定义类别目录
export SRC_DIR='sources'    # 未翻译
export TSL_DIR='translated' # 已翻译
export PUB_DIR='published'  # 已发布

# 定义匹配规则
export CATE_PATTERN='(talk|tech|news)'                 # 类别
export FILE_PATTERN='[0-9]{8} [a-zA-Z0-9_.,() -]*\.md' # 文件名

# 获取用于匹配操作的正则表达式
# 用法：get_operation_regex 状态 类型
#
# 状态为：
# - A：添加
# - M：修改
# - D：删除
# 类型为：
# - SRC：未翻译
# - TSL：已翻译
# - PUB：已发布
get_operation_regex() {
  STAT="$1"
  TYPE="$2"

  echo "^${STAT}\\s+\"?$(eval echo "\$${TYPE}_DIR")/"
}

# 确保两个变更文件一致
# 用法：ensure_identical X类型 X状态 Y类型 Y状态 是否仅比较文件名
#
# 状态为：
# - A：添加
# - M：修改
# - D：删除
# 类型为：
# - SRC：未翻译
# - TSL：已翻译
# - PUB：已发布
ensure_identical() {
  TYPE_X="$1"
  STAT_X="$2"
  TYPE_Y="$3"
  STAT_Y="$4"
  NAME_ONLY="$5"
  SUFFIX=
  [ -n "$NAME_ONLY" ] && SUFFIX="_basename"

  X_FILE="/tmp/changes_${TYPE_X}_${STAT_X}${SUFFIX}"
  Y_FILE="/tmp/changes_${TYPE_Y}_${STAT_Y}${SUFFIX}"

  cmp "$X_FILE" "$Y_FILE" 2> /dev/null
}

# 检查文章分类
# 用法：check_category 类型 状态
#
# 状态为：
# - A：添加
# - M：修改
# - D：删除
# 类型为：
# - SRC：未翻译
# - TSL：已翻译
check_category() {
  TYPE="$1"
  STAT="$2"

  CHANGES="/tmp/changes_${TYPE}_${STAT}"
  ! grep -Eqv "^${CATE_PATTERN}/" "$CHANGES"
}
