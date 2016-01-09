如何在 UNIX 中根据文件内容查找文件
How To Find Files by Content Under UNIX
================================================================================
为了完成课程作业，我写了很多 C 语言代码并把它们保存为 /home/user/c/*.c and *.h。那么在 UNIX shell 窗口中我如何能通过字符串或者单词（例如函数名 main()）文件内容来查找文件呢？
I had written lots of code in C for my school work and saved it as source code under /home/user/c/*.c and *.h. How do I find files by content such as string or words (function name such as main() under UNIX shell prompt?

你需要用到以下工具：
You need to use the following tools:

[a] **grep 命令** ： 输出匹配模式的行。

[b] **find 命令**： 在目录层次中查找文件。

### [使用 grep 命令根据内容查找文件][1]
### [grep Command To Find Files By][1] Content ###

输入以下命令：
Type the command as follows:

    grep 'string' *.txt
    grep 'main(' *.c
    grep '#include<example.h>' *.c
    grep 'getChar*' *.c
    grep -i 'ultra' *.conf
    grep -iR 'ultra' *.conf

其中
Where

- **-i** ： 忽视模式（匹配字符串 valid、 VALID、 ValID ）和输入文件（匹配 file.c FILE.c FILE.C）的大小写。
- **-R** ： 递归读取每个目录下的所有文件。
- **-i** : Ignore case distinctions in both the PATTERN (match valid, VALID, ValID string) and the input files (math file.c FILE.c FILE.C filename).
- **-R** : Read all files under each directory, recursively

### 高亮匹配到的模式 ###
### Highlighting searched patterns ###

在搜索大量文件的时候你可以轻松地高亮模式：
You can highlight patterns easily while searching large number of files:

    $ grep --color=auto -iR 'getChar();' *.c

### 为查找到的模式显示文件名和行号 ###
### Displaying file names and line number for searched patterns ###

你也许需要显示文件名和行号：
You may also need to display filenames and numbers:

    $ grep --color=auto -iRnH 'getChar();' *.c

其中，
Where,

- **-n** ： 在输出的每行前面添加文件中以 1 开始的行号。
- **-H** ： 为每个匹配打印文件名。要搜索多个文件时这是默认选项。
- **-n** : Prefix each line of output with the 1-based line number within its input file.
- **-H** Print the file name for each match. This is the default when there is more than one file to search.

    $grep --color=auto -nH 'DIR' *

输出样例：
Sample output:

![Fig.01: grep 命令显示搜索到的模式](http://www.cyberciti.biz/faq/wp-content/uploads/2008/09/grep-command.png)

Fig.01: grep 命令显示搜索到的模式

你也可以使用 find 命令：
You can also use find command:

    $ find . -name "*.c" -print | xargs grep "main("

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/unix-linux-finding-files-by-content/

作者：Vivek Gite
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://www.cyberciti.biz/faq/howto-search-find-file-for-text-string/