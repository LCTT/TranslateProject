#!/bin/sh

################################################################################
# 公用常量和函数
################################################################################

# 定义类别目录
export SRC_DIR='sources'    # 未翻译
export TSL_DIR='translated' # 已翻译
export PUB_DIR='published'  # 已发布

# 定义匹配规则
export CATE_PATTERN='(news|talk|tech)'                 # 类别
export FILE_PATTERN='[0-9]{8} [a-zA-Z0-9_.,() -]*\.md' # 文件名

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
