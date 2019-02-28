#!/bin/sh
# 匹配 PR 规则
set -e

################################################################################
# 读入：
#   - /tmp/stats
# 写出：（无）
################################################################################

# 加载公用常量和函数
# shellcheck source=common.inc.sh
. "$(dirname "$0")/common.inc.sh"

echo "[匹配] 加载统计结果……"
# 加载统计结果
# shellcheck source=mock/stats.sh
. /tmp/stats

# 定义 PR 规则

# 绕过检查：绕过 PR 检查
rule_bypass_check() {
  [ -f /tmp/bypass ] && echo "匹配规则：绕过检查"
}

# 添加原文：添加至少一篇原文
rule_source_added() {
  [ "$SRC_A" -ge 1 ] \
      && check_category SRC A \
      && [ "$TOTAL" -eq "$SRC_A" ] && echo "匹配规则：添加原文 ${SRC_A} 篇"
}

# 申领翻译：只能申领一篇原文
rule_translation_requested() {
  [ "$SRC_M" -eq 1 ] \
      && check_category SRC M \
      && [ "$TOTAL" -eq 1 ] && echo "匹配规则：申领翻译"
}

# 提交译文：只能提交一篇译文
rule_translation_completed() {
  [ "$SRC_D" -eq 1 ] && [ "$TSL_A" -eq 1 ] \
      && ensure_identical SRC D TSL A \
      && check_category SRC D \
      && check_category TSL A \
      && [ "$TOTAL" -eq 2 ] && echo "匹配规则：提交译文"
}

# 校对译文：只能校对一篇译文
rule_translation_revised() {
  [ "$TSL_M" -eq 1 ] \
      && check_category TSL M \
      && [ "$TOTAL" -eq 1 ] && echo "匹配规则：校对译文"
}

# 发布译文：只能发布一篇译文
rule_translation_published() {
  [ "$TSL_D" -eq 1 ] && [ "$PUB_A" -eq 1 ] \
      && ensure_identical TSL D PUB A 1 \
      && check_category TSL D \
      && [ "$TOTAL" -eq $((TSL_D + PUB_A)) ] \
      && echo "匹配规则：发布译文"
}

# 校对已发布译文：只能校对一篇已发布的译文
rule_published_translation_revised() {
  [ "$PUB_M" -eq 1 ] \
      && [ "$TOTAL" -eq 1 ] && echo "匹配规则：校对已发布译文"
}

# 定义常见错误

# 未知错误
error_undefined() {
  echo "未知错误：无匹配规则，请尝试只对一篇文章进行操作"
}

# 申领多篇
error_translation_requested_multiple() {
  [ "$SRC_M" -gt 1 ] \
      && echo "匹配错误：请勿申领多篇，请一次仅申领一篇"
}

# 提交多篇
error_translation_completed_multiple() {
  [ "$TSL_A" -gt 1 ] \
      && echo "匹配错误：请勿提交多篇，请一次仅提交一篇"
}

# 执行检查并输出匹配项目
do_check() {
  rule_bypass_check \
      || rule_source_added \
      || rule_translation_requested \
      || rule_translation_completed \
      || rule_translation_revised \
      || rule_translation_published \
      || rule_published_translation_revised \
      || {
        error_translation_requested_multiple \
            || error_translation_completed_multiple \
            || error_undefined
        exit 1
      }
}

do_check
