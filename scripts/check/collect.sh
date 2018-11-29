#!/bin/sh
# PR 文件变更收集
set -e

################################################################################
# 读入：（无）
# 写出：
#   - /tmp/changes # 文件变更列表
################################################################################


echo "[收集] 计算 PR 分支与目标分支的分叉点……"

TARGET_BRANCH="${TRAVIS_BRANCH:-master}"
echo "[收集] 目标分支设定为：${TARGET_BRANCH}"

MERGE_BASE='HEAD^'
[ "$TRAVIS_PULL_REQUEST" != 'false' ] \
    && MERGE_BASE="$(git merge-base "$TARGET_BRANCH" HEAD)"
echo "[收集] 找到分叉节点：${MERGE_BASE}"

echo "[收集] 变更摘要："
git --no-pager show --summary "${MERGE_BASE}..HEAD"

{
  git --no-pager log --oneline "${MERGE_BASE}..HEAD" | grep -Eq '绕过检查' && {
    touch /tmp/bypass
    echo "[收集] 已标记为绕过检查项"
  }
} || true

echo "[收集] 写出文件变更列表……"

RAW_CHANGES="$(git diff "$MERGE_BASE" HEAD --no-renames --name-status -z \
    | tr '\0' '\n')"
[ -z "$RAW_CHANGES" ] && {
  echo "[收集] 无变更，退出……"
  exit 1
}
echo "$RAW_CHANGES" | while read -r STAT; do
  read -r NAME
  echo "${STAT}	${NAME}"
done > /tmp/changes
echo "[收集] 已写出文件变更列表："
cat /tmp/changes
{ [ -z "$(cat /tmp/changes)" ] && echo "（无变更）"; } || true
