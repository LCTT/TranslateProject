grep 命令系列：使用 grep 命令来搜索多个单词
================================================================================

要使用 grep 命令来搜索多个字符串或单词，我们该怎么做？例如我想要查找 /path/to/file 文件中的 word1、word2、word3 等单词，我怎么样命令 grep 查找这些单词呢？

[grep 命令支持正则表达式][1]匹配模式。要使用多单词搜索，请使用如下语法：

    grep 'word1\|word2\|word3' /path/to/file

下的例子中，要在一个名叫 /var/log/messages 的文本日志文件中查找 warning、error 和 critical 这几个单词，输入：

    $ grep 'warning\|error\|critical' /var/log/messages

仅仅只是要匹配单词（即该词两侧是单词分界符，针对西方以空格分隔的语言而言）的话，可以加上 -w 选项参数：

    $ grep -w 'warning\|error\|critical' /var/log/messages

egrep 命令可以跳过上面的语法格式，其使用的语法格式如下：

    $ egrep -w 'warning|error|critical' /var/log/messages

我建义您们加上 -i (忽略大小写) 和 --color 选项参数，如下示：

    $ egrep -wi --color 'warning|error|critical' /var/log/messages

输出示例：

![Fig.01: Linux / Unix egrep Command Search Multiple Words Demo Output](http://s0.cyberciti.org/uploads/faq/2008/04/egrep-words-output.png)

图一: Linux / Unix egrep 命令查找多个单词输出例子

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/searching-multiple-words-string-using-grep/

作者：Vivek Gite
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:https://linux.cn/article-6941-1.html