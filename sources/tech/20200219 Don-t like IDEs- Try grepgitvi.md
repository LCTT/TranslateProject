[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Don't like IDEs? Try grepgitvi)
[#]: via: (https://opensource.com/article/20/2/no-ide-script)
[#]: author: (Yedidyah Bar David https://opensource.com/users/didib)

Don't like IDEs? Try grepgitvi
======
A simple and primitive script to open Vim with your file of choice.
![Files in a folder][1]

Like most developers, I search and read source code all day long. Personally, I've never gotten used to integrated development environments (IDEs), and for years, I mainly used **grep** and copy/pasted file names to open Vi(m).

Eventually, I came up with this script, slowly refining it as needed.

Its dependencies are [Vim][2] and [rlwrap][3], and it is open source under the Apache 2.0 license. To use the script, [put it in your PATH][4], and run it inside a directory of text files with:


```
`grepgitvi <grep options> <grep/vim search pattern>`
```

It will return a numbered list of search results, prompt you for the number of the result you want to use, and open Vim with that result. After you exit Vim, it will show the list again in a loop until you enter anything other than a result number. You can also use the Up and Down arrow keys to select a file; this makes it easier (for me) to find which results I've already looked at.

It's simple and primitive compared to modern IDEs, or even to more sophisticated uses of Vim, but that's what does the job for me.

### The script


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
# Usage: grepgitvi &lt;grep options&gt; &lt;grep/vim pattern&gt;
#

TMPD=$(mktemp -d /tmp/grepgitvi.XXXXXX)
UNCOLORED=${TMPD}/uncolored
COLORED=${TMPD}/colored

RLHIST=${TMPD}/readline-history

[ -z "${DIRS}" ] &amp;&amp; DIRS=.

cleanup() {
        rm -rf "${TMPD}"
}

trap cleanup 0

find ${DIRS} -iname .git -prune -o \\! -iname "*.min.css*" -type f -print0 &gt; ${TMPD}/allfiles

cat ${TMPD}/allfiles | xargs -0 grep --color=always -n -H "$@" &gt; $COLORED
cat ${TMPD}/allfiles | xargs -0 grep -n -H "$@" &gt; $UNCOLORED

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
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/didib
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/files_documents_paper_folder.png?itok=eIJWac15 (Files in a folder)
[2]: https://www.vim.org/
[3]: https://linux.die.net/man/1/rlwrap
[4]: https://opensource.com/article/17/6/set-path-linux
