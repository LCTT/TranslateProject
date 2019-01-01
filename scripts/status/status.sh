#!/usr/bin/env bash
set -e
cd "$(dirname "$0")/../.."        # 进入TP root

function file-translating-p ()
{
    local file="$*"
    if head -n 1 "${file}" |grep  '\[^#\]:'>/dev/null 2>&1 ;then
        # 新模板
        head -n 12 "$file" |grep -v '\[^#\]:' |grep -E -i "translat|fanyi|翻译" >/dev/null 2>&1
    else
        # 旧模板
        head -n 3 "$file" |grep -E -i "translat|fanyi|翻译" >/dev/null 2>&1
    fi
}
function get_status_of()
{
    local file="$*"
    git log --date=short --pretty=format:"{\"file\":\"${file}\",\"time\":\"%ad\",\"user\":\"%an\"}" -n 1  "${file}"
}

while read -r file;do
    if file-translating-p "${file}";then
        translating="${translating} $(get_status_of "${file}")"
    else
        unselected="${unselected} $(get_status_of "${file}")"
    fi
done< <(find sources -name "2*.md")
(
echo "${translating}"|jq -s "."
echo "${unselected}"|jq -s "."
)|jq -s '{"translating":.[0],"unselected":.[1]}'
