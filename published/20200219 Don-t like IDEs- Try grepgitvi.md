[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11934-1.html)
[#]: subject: (Don't like IDEs? Try grepgitvi)
[#]: via: (https://opensource.com/article/20/2/no-ide-script)
[#]: author: (Yedidyah Bar David https://opensource.com/users/didib)

不喜欢 IDE？试试看 grepgitvi
======

> 一个简单又原始的脚本来用 Vim 打开你选择的文件。

![](https://img.linux.net.cn/data/attachment/album/202002/26/113942a99a1aujmjpfnfrh.jpg)

像大多数开发者一样，我整天都在搜索和阅读源码。就我个人而言，我从来没有习惯过集成开发环境 （IDE），多年来，我主要使用 `grep` （找到文件），并复制/粘贴文件名来打开 Vi(m)。

最终，我写了这个脚本，并根据需要缓慢地对其进行了完善。

它依赖 [Vim][2] 和 [rlwrap][3]，并使用 Apache 2.0 许可证开源。要使用该脚本，请[将它放到 PATH 中][4]，然后在文本目录下运行：

```
grepgitvi <grep options> <grep/vim search pattern>
```

它将返回搜索结果的编号列表，并提示你输入结果编号并打开 Vim。退出 Vim 后，它将再次显示列表，直到你输入除结果编号以外的任何内容。你也可以使用向上和向下箭头键选择一个文件。（这对我来说）更容易找到我已经看过的结果。

与现代 IDE 甚至与 Vim 的更复杂的用法相比，它简单而原始，但它对我有用。

### 脚本


```
#!/bin/bash

# grepgitvi - grep source files, interactively open vim on results
# Doesn't really have to do much with git, other than ignoring .git
#
# Copyright Yedidyah Bar David 2019
#
# SPDX-License-Identifier: Apache-2.0
#
# Requires vim and rlwrap
#
# Usage: grepgitvi <grep options> <grep/vim pattern>
#

TMPD=$(mktemp -d /tmp/grepgitvi.XXXXXX)
UNCOLORED=${TMPD}/uncolored
COLORED=${TMPD}/colored

RLHIST=${TMPD}/readline-history

[ -z "${DIRS}" ] && DIRS=.

cleanup() {
        rm -rf "${TMPD}"
}

trap cleanup 0

find ${DIRS} -iname .git -prune -o \! -iname "*.min.css*" -type f -print0 > ${TMPD}/allfiles

cat ${TMPD}/allfiles | xargs -0 grep --color=always -n -H "$@" > $COLORED
cat ${TMPD}/allfiles | xargs -0 grep -n -H "$@" > $UNCOLORED

max=`cat $UNCOLORED | wc -l`
pat="${@: -1}"

inp=''
while true; do
        echo "============================ grep results ==============================="
        cat $COLORED | nl
        echo "============================ grep results ==============================="
        prompt="Enter a number between 1 and $max or anything else to quit: "
        inp=$(rlwrap -H $RLHIST bash -c "read -p \"$prompt\" inp; echo \$inp")
        if ! echo "$inp" | grep -q '^[0-9][0-9]*$' || [ "$inp" -gt "$max" ]; then
                break
        fi

        filename=$(cat $UNCOLORED | awk -F: "NR==$inp"' {print $1}')
        linenum=$(cat $UNCOLORED | awk -F: "NR==$inp"' {print $2-1}')
        vim +:"$linenum" +"norm zz" +/"${pat}" "$filename"
done
```

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/no-ide-script

作者：[Yedidyah Bar David][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/didib
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://www.vim.org/
[3]: https://linux.die.net/man/1/rlwrap
[4]: https://opensource.com/article/17/6/set-path-linux
