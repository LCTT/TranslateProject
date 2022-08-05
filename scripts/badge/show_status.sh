#!/usr/bin/env bash

set -e

function help()
{
    cat <<EOF
Usage: ${0##*/} [+-s] [published] [translated] [translating] [sources]

显示已发布、已翻译、正在翻译和待翻译的数量

-s 输出为svg格式
EOF
}

while getopts :s OPT; do
    case $OPT in
        s|+s)
            show_format="svg"
            ;;
        *)
            help
            exit 2
    esac
done
shift $(( OPTIND - 1 ))
OPTIND=1

declare -A catalog_comment_dict
declare -A catalog_color_dict
catalog_comment_dict=([sources]="待翻译" [translating]="翻译中" [translated]="待校对" [published]="已发布")
catalog_color_dict=([sources]="#97CA00" [translating]="#00BCD5" [translated]="#FF9800" [published]="#FF5722")

function count_files_under_dir()
{
    local dir=$1
    local pattern=$2
    find ${dir} -name "${pattern}" -type f |wc -l
}

cd "$(dirname $0)/../.."        # 进入TP root

for catalog in "$@";do
    case "${catalog}" in
        published)
            num=$(count_files_under_dir "${catalog}" "[0-9]*.md")
            ;;
        translated)
            num=$(count_files_under_dir "${catalog}" "[0-9]*.md")
            ;;
        translating)
            num=$(git grep -niE "^[^[].*translat|^\[#\]: translator: \([^[:space:]]+\)|fanyi|翻译"  sources/*.md |awk -F ":" '{if ($2<=3) print $1}'|wc -l)
            ;;
        sources)
            total=$(count_files_under_dir "${catalog}" "[0-9]*.md")
            translating_num=$(git grep -niE "^[^[].*translat|^\[#\]: translator: \([^[:space:]]+\)|fanyi|翻译"  sources/*.md |awk -F ":" '{if ($2<=3) print $1}'|wc -l)
            num=$((${total} - ${translating_num}))
            ;;
        *)
            help
            exit 2
    esac

    comment=${catalog_comment_dict[${catalog}]}
    color=${catalog_color_dict[${catalog}]}
    if [[ "${show_format}" == "svg" ]];then
        cat <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="100" height="20">
  <linearGradient id="b" x2="0" y2="100%">
    <stop offset="0" stop-color="#bbb" stop-opacity=".1" />
    <stop offset="1" stop-opacity=".1" />
  </linearGradient>
  <mask id="a">
    <rect width="100" height="20" rx="3" fill="#fff" />
  </mask>
  <g mask="url(#a)">
    <path fill="#555" d="M0 0 h60 v20 H0 z" />
    <path fill="${color}" d="M60 0 h40 v20 H60 z" />
    <path fill="url(#b)" d="M0 0 h100 v20 H0 z" />
  </g>
  <g fill="#fff" font-family="DejaVu Sans" font-size="11">
    <text x="12" y="15" fill="#010101" fill-opacity=".3">${comment}</text>
    <text x="12" y="14">${comment}</text>
    <text x="70" y="15" fill="#010101" fill-opacity=".3">${num}</text>
    <text x="70" y="14">${num}</text>
  </g>
</svg>
EOF
    else
        cat<<EOF
${comment}:	${num}
EOF
    fi

done
