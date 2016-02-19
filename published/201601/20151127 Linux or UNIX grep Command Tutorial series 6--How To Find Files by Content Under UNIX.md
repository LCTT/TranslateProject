grep 命令系列：如何在 UNIX 中根据文件内容查找文件
================================================================================

为了完成课程作业，我写了很多 C 语言代码并把它们保存为 /home/user/c/*.c 和 *.h。那么在 UNIX shell 窗口中我如何能通过字符串或者单词（例如函数名 main()）文件内容来查找文件呢？

你需要用到以下工具：

[a] **grep 命令** ： 输出匹配模式的行。

[b] **find 命令**： 在目录层次中查找文件。

### [使用 grep 命令根据内容查找文件][1]

输入以下命令：

    grep 'string' *.txt
    grep 'main(' *.c
    grep '#include<example.h>' *.c
    grep 'getChar*' *.c
    grep -i 'ultra' *.conf
    grep -iR 'ultra' *.conf

其中

- **-i** ： 忽略模式（匹配字符串 valid、 VALID、 ValID ）和输入文件（匹配 file.c FILE.c FILE.C）的大小写。
- **-R** ： 递归读取每个目录下的所有文件。


### 高亮匹配到的模式 ###

在搜索大量文件的时候你可以轻松地高亮模式：

    $ grep --color=auto -iR 'getChar();' *.c

### 为查找到的模式显示文件名和行号 ###

你也许需要显示文件名和行号：

    $ grep --color=auto -iRnH 'getChar();' *.c

其中，

- **-n** ： 在输出的每行前面添加以 1 开始的行号。
- **-H** ： 为每个匹配打印文件名。要搜索多个文件时这是默认选项。

    $grep --color=auto -nH 'DIR' *

输出样例：

![Fig.01: grep 命令显示搜索到的模式](http://www.cyberciti.biz/faq/wp-content/uploads/2008/09/grep-command.png)

*Fig.01: grep 命令显示搜索到的模式*

你也可以使用 find 命令：

    $ find . -name "*.c" -print | xargs grep "main("

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/unix-linux-finding-files-by-content/

作者：Vivek Gite
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/faq/howto-search-find-file-for-text-string/