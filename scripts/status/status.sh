#!/usr/bin/env bash
set -e
cd "$(dirname $0)/../.."        # 进入TP root

function file-translating-p ()
{
    local file="$*"
    head -n 3 "$file" |grep -E -i "translat|fanyi|翻译" >/dev/null 2>&1
}
function get_status_of()
{
    local file="$@"
    git log --date=short --pretty=format:"{\"file\":\"${file}\",\"time\":\"%ad\",\"user\":\"%an\"}" -n 1  "${file}"
}

translating=$( git grep -niE "translat|fanyi|翻译"  sources/*.md |awk -F ":" '{if ($2<=3) print $1}' |xargs -I{} git log --date=short --pretty=format:"{\"filename\":\"{}\",\"time\":\"%ad\",\"user\":\"%an\"}" -n 1  "{}")
unselected=$(
find sources -name "2*.md"|sort|while read file;do
    if ! file-translating-p "${file}";then
        get_status_of "${file}"
    fi
done
)
(
echo ${translating}|jq -s "."
echo ${unselected} |jq -s "."
)|jq -s '{"translating":.[0],"unselected":.[1]}'
