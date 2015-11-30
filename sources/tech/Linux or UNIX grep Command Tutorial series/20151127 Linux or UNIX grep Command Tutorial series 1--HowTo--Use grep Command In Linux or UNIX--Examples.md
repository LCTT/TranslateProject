HowTo: Use grep Command In Linux / UNIX – Examples
================================================================================
How do I use grep command on Linux, Apple OS X, and Unix-like operating systems? Can you give me a simple examples of the grep command?

grep命令用来搜索匹配包含给定字符串或单词格式的文件或文件，通常来说，grep 显示匹配到的行，使用grep来搜索包括一个或多个正则表达式匹配到的行，只显示合适的行，grep被认为是在Linux或者类Unix系统中最有用的命令
The grep command is used to search text or searches the given file for lines containing a match to the given strings or words. By default, grep displays the matching lines. Use grep to search for lines of text that match one or many regular expressions, and outputs only the matching lines. grep is considered as one of the most useful commands on Linux and Unix-like operating systems.

### 你知道吗 ###
grep这个名字，来源于被用来显示一个相似的行为的命令，grep在Unix或者Linux的文本编辑器中是：
The name, "grep", derives from the command used to perform a similar operation, using the Unix/Linux text editor ed:

    g/re/p

### grep命令的语法 ###

语法如下所示:

    grep 'word' filename
    grep 'word' file1 file2 file3
    grep 'string1 string2'  filename
    cat otherfile | grep 'something'
    command | grep 'something'
    command option1 | grep 'data'
    grep --color 'data' fileName

###怎么样使用grep来搜索一个文件###

搜索 /etc/passwd 文件下的boo用户,输入:

    $ grep boo /etc/passwd

输出内容:

    foo:x:1000:1000:foo,,,:/home/foo:/bin/ksh

可以使用grep去强制忽略大小写 i.e 使用-i匹配 boo, Boo, BOO 和其他选项:

    $ grep -i "boo" /etc/passwd

### 递归使用grep ###

你可以使用grep递归的搜索 i.e. 在文件目录下面搜索所有包含字符串192.168.1.5的文件

    $ grep -r "192.168.1.5" /etc/

或者是：

    $ grep -R "192.168.1.5" /etc/

示例输出:

    /etc/ppp/options:# ms-wins 192.168.1.50
    /etc/ppp/options:# ms-wins 192.168.1.51
    /etc/NetworkManager/system-connections/Wired connection 1:addresses1=192.168.1.5;24;192.168.1.2;

You will see result for 192.168.1.5 on a separate line preceded by the name of the file (such as /etc/ppp/options) in which it was found. The inclusion of the file names in the output data can be suppressed by using the -h option as follows:
你会看到查找到的 192.168.1.5 的结果以文件名作为区别被显示在单独的行上面，输出之中包含的文件名可以加-h选项来禁止该项输出
    $ grep -h -R "192.168.1.5" /etc/

或者

    $ grep -hR "192.168.1.5" /etc/

示例输出:

    # ms-wins 192.168.1.50
    # ms-wins 192.168.1.51
    addresses1=192.168.1.5;24;192.168.1.2;

### 使用grep去搜索文本 ###

When you search for boo, grep will match fooboo, boo123, barfoo35 and more. You can force the grep command to select only those lines containing matches that form whole words i.e. match only boo word:

当你搜索boo。grep命令将会匹配fooboo，boo123, barfoo35 和其他所用boo的字符串，你可以使用-w选项去强迫选择输出那些仅仅包含那个整个单词的行。

    $ grep -w "boo" file

### 使用egrep命令去比较不同 ###

使用egrep命令如下:

    $ egrep -w 'word1|word2' /path/to/file

### 当文本被匹配时统计行数 ###

The grep can report the number of times that the pattern has been matched for each file using -c (count) option:
grep命令可以通过加-c参数显示每个文件报告匹配到的次数

    $ grep -c 'word' /path/to/file

Pass the -n option to precede each line of output with the number of the line in the text file from which it was obtained:
传递-n选项去显示在输出行前加入匹配到的行在它的文件里面的行数
    $ grep -n 'root' /etc/passwd

示例输出:

    1:root:x:0:0:root:/root:/bin/bash
    1042:rootdoor:x:0:0:rootdoor:/home/rootdoor:/bin/csh
    3319:initrootapp:x:0:0:initrootapp:/home/initroot:/bin/ksh

### Grep invert match ###

You can use -v option to print inverts the match; that is, it matches only those lines that do not contain the given word. For example print all line that do not contain the word bar:
可以使用-v选项去打印不包含匹配项的内容，输出内容仅仅包含那些不含给定单词的行，例如删除不包含bar单词的所有行
    $ grep -v bar /path/to/file

### UNIX / Linux 管道与 grep 命令 ###

grep command often used with [shell pipes][1]. In this example, show the name of the hard disk devices:
grep 常常与管道一起使用，在这个例子中，显示硬盘名字
    # dmesg | egrep '(s|h)d[a-z]'

Display cpu model name:
显示CPU模型名字

    # cat /proc/cpuinfo | grep -i 'Model'

However, above command can be also used as follows without shell pipe:
然而，以上命令可以按照以下方法使用的同时不不使用管道
    # grep -i 'Model' /proc/cpuinfo

示例输出:

    model		: 30
    model name	: Intel(R) Core(TM) i7 CPU       Q 820  @ 1.73GHz
    model		: 30
    model name	: Intel(R) Core(TM) i7 CPU       Q 820  @ 1.73GHz

### 如何仅仅显示匹配到内容的文件名字? ###

Use the -l option to list file name whose contents mention main():
使用-l选项去显示那些文件内容中包含main（）的文件名
    $ grep -l 'main' *.c

Finally, you can force grep to display output in colors, enter:
最后，你可以迫使grep有色彩的显示输出
    $ grep --color vivek /etc/passwd

示例输出:

![Grep command in action](http://files.cyberciti.biz/uploads/faq/2007/08/grep_command_examples.png)

Grep command in action

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/

作者：Vivek Gite 
译者：[zky001](https://github.com/zky001)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

校对者ID：
[1]:http://bash.cyberciti.biz/guide/Pipes
