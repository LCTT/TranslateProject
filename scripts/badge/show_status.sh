#!/usr/bin/env bash

set -e

function help()
{
    cat <<EOF
Usage: ${0##*/} [+-s} [published] [translated] [translating] [sources]

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
catalog_comment_dict=([translated]="待校对" [published]="已发布" [translating]="翻译中" [sources]="待翻译")

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
            num=$(git grep -niE "translat|fanyi|翻译"  sources/*.md |awk -F ":" '{if ($2<=3) print $1}' |wc -l)
            ;;
        sources)
            total=$(count_files_under_dir "${catalog}" "[0-9]*.md")
            translating_num=$(git grep -niE "translat|fanyi|翻译"  sources/*.md |awk -F ":" '{if ($2<=3) print $1}' |wc -l)
            num=$((${total} - ${translating_num}))
            ;;
        *)
            help
            exit 2
    esac

    comment=${catalog_comment_dict[${catalog}]}
    if [[ "${show_format}" == "svg" ]];then
        cat <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="120" height="20">
  <linearGradient id="b" x2="0" y2="100%">
    <stop offset="0" stop-color="#bbb" stop-opacity=".1" />
    <stop offset="1" stop-opacity=".1" />
  </linearGradient>
  <mask id="a">
    <rect width="132.53125" height="20" rx="3" fill="#fff" />
  </mask>
  <g mask="url(#a)">
    <path fill="#555" d="M0 0 h70.53125 v20 H0 z" />
    <path fill="#97CA00" d="M70.53125 0 h62.0 v20 H70.53125 z" />
    <path fill="url(#b)" d="M0 0 h132.53125 v20 H0 z" />
  </g>
  <g fill="#fff" font-family="DejaVu Sans" font-size="11">
    <text x="6" y="15" fill="#010101" fill-opacity=".3">${comment}</text>
    <text x="6" y="14">${comment}</text>
    <text x="74.53125" y="15" fill="#010101" fill-opacity=".3">${num}</text>
    <text x="74.53125" y="14">${num}</text>
  </g>
</svg>
EOF
    else
        cat<<EOF
${comment}:	${num}
EOF
    fi

done
