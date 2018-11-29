#!/bin/sh
# PR 文件变更分析
set -e

# 加载公用常量和函数
# shellcheck source=common.inc.sh
. "$(dirname "$0")/common.inc.sh"

################################################################################
# 读入：
#   - /tmp/changes # 文件变更列表
# 写出：
#   - /tmp/stats # 文件变更统计
################################################################################

# 执行分析并将统计输出到标准输出
do_analyze() {
  cat /dev/null > /tmp/stats
  OTHER_REGEX='^$'
  for TYPE in 'SRC' 'TSL' 'PUB'; do
    for STAT in 'A' 'M' 'D'; do
      # 统计每个类别的每个操作
      REGEX="$(get_operation_regex "$STAT" "$TYPE")"
      OTHER_REGEX="${OTHER_REGEX}|${REGEX}"
      CHANGES_FILE="/tmp/changes_${TYPE}_${STAT}"
      eval "grep -E '$REGEX' /tmp/changes" \
          | sed 's/^[^\/]*\///g' \
          | sort > "$CHANGES_FILE" || true
      sed 's/^.*\///g' "$CHANGES_FILE" > "${CHANGES_FILE}_basename"
      eval "${TYPE}_${STAT}=$(wc -l < "$CHANGES_FILE")"
      eval echo "${TYPE}_${STAT}=\$${TYPE}_${STAT}"
    done
  done

  # 统计其他操作
  OTHER="$(grep -Evc "$OTHER_REGEX" /tmp/changes)" || true
  echo "OTHER=$OTHER"

  # 统计变更总数
  TOTAL="$(wc -l < /tmp/changes )"
  echo "TOTAL=$TOTAL"
}


echo "[分析] 统计文件变更……"
do_analyze > /tmp/stats
echo "[分析] 已写入统计结果："
cat /tmp/stats
