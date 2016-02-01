grep 命令系列：用 grep 命令统计匹配字符串的行数
================================================================================

在 Linux 或 UNIX 操作系统下，对于给定的单词或字符串，我们应该怎么统计它们在每个输入文件中存在的行数呢？

您需要通过添加 -c 或者 --count 选项参数来抑制正常的输出。它将会显示对输入文件单词匹配的行数，如下所示：

    $ grep -c vivek /etc/passwd

或者

    $ grep -w -c vivek /etc/passwd

输出的示例:

    1

相反的，使用 -v 或者 --invert 选项参数可以统计出不匹配的输入文件行数，键入：

    $ grep -c vivek /etc/passwd

输出的示例:

    45

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/grep-count-lines-if-a-string-word-matches/

作者：Vivek Gite
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出