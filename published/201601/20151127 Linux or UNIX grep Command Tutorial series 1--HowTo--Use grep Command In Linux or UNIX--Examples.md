grep 命令系列：如何在 Linux/UNIX 中使用 grep 命令
==========================================

我该怎样在 Linux、Apple OS X 及其他类 UNIX 系统中使用 grep 命令，你能给我展示一些简单的例子吗？

grep 命令用来搜索文本，或从给定的文件中搜索行内包含了给定字符串或单词的文件。通常来说，grep 显示匹配到的行。使用 grep 来搜索包括一个或多个正则表达式匹配到的文本行，然后只显示匹配到的行。grep 被视作在 Linux/ Unix 系统中最有用的命令之一。

### 你知道吗 ###

grep 这个名字，来源于一个 Unix/Linux 中的古老的文本编辑器 ed 中执行相似操作的命令：

    g/re/p

### grep 命令的语法 ###

语法如下所示:

    grep 'word' 文件名
    grep 'word' 文件1 文件2 文件3
    grep '字符串1 字符串2'  文件名
    cat 某个文件 | grep '某个东西'
    command | grep '某个东西'
    command 选项1 | grep '数据'
    grep --color '数据' 文件名

###怎么样使用 grep 来搜索一个文件###

搜索 /etc/passwd 文件下的 boo 用户,输入:

    $ grep boo /etc/passwd

输出内容:

    foo:x:1000:1000:foo,,,:/home/foo:/bin/ksh

可以使用 grep 去强制忽略大小写。例如，使用 -i 选项可以匹配 boo, Boo, BOO 和其他组合：

    $ grep -i "boo" /etc/passwd

### 递归使用 grep ###

你可以递归地使用 grep 进行搜索。例如，在文件目录下面搜索所有包含字符串“192.168.1.5”的文件

    $ grep -r "192.168.1.5" /etc/

或者是：

    $ grep -R "192.168.1.5" /etc/

示例输出:

    /etc/ppp/options:# ms-wins 192.168.1.50
    /etc/ppp/options:# ms-wins 192.168.1.51
    /etc/NetworkManager/system-connections/Wired connection 1:addresses1=192.168.1.5;24;192.168.1.2;

你会看到搜索到 192.168.1.5 的结果每一行都前缀以找到匹配的文件名（例如：/etc/ppp/options）。输出之中包含的文件名可以加 -h 选项来禁止输出：

    $ grep -h -R "192.168.1.5" /etc/

或者

    $ grep -hR "192.168.1.5" /etc/

示例输出:

    # ms-wins 192.168.1.50
    # ms-wins 192.168.1.51
    addresses1=192.168.1.5;24;192.168.1.2;

### 使用 grep 去搜索文本 ###

当你搜索 boo 时，grep 命令将会匹配 fooboo，boo123, barfoo35 和其他所有包含 boo 的字符串，你可以使用 -w 选项去强制只输出那些仅仅包含那个整个单词的行（LCTT译注：即该字符串两侧是英文单词分隔符，如空格，标点符号，和末端等，因此对中文这种没有断字符号的语言并不适用。）。

    $ grep -w "boo" file

### 使用 grep 命令去搜索两个不同的单词 ###

使用 egrep 命令如下:

    $ egrep -w 'word1|word2' /path/to/file
    
（LCTT 译注：这里使用到了正则表达式，因此使用的是 egrep 命令，即扩展的 grep 命令。）

### 统计文本匹配到的行数 ###

grep 命令可以通过加 -c 参数显示每个文件中匹配到的次数：

    $ grep -c 'word' /path/to/file

传递 -n 选项可以输出的行前加入匹配到的行的行号：

    $ grep -n 'root' /etc/passwd

示例输出:

    1:root:x:0:0:root:/root:/bin/bash
    1042:rootdoor:x:0:0:rootdoor:/home/rootdoor:/bin/csh
    3319:initrootapp:x:0:0:initrootapp:/home/initroot:/bin/ksh

### 反转匹配（不匹配） ###

可以使用 -v 选项来输出不包含匹配项的内容，输出内容仅仅包含那些不含给定单词的行，例如输出所有不包含 bar 单词的行：

    $ grep -v bar /path/to/file

### UNIX/Linux 管道与 grep 命令 ###

grep 常常与管道一起使用，在这个例子中，显示硬盘设备的名字：

    # dmesg | egrep '(s|h)d[a-z]'

显示 CPU 型号：

    # cat /proc/cpuinfo | grep -i 'Model'

然而，以上命令也可以按照以下方法使用，不使用管道:

    # grep -i 'Model' /proc/cpuinfo

示例输出:

    model		: 30
    model name	: Intel(R) Core(TM) i7 CPU       Q 820  @ 1.73GHz
    model		: 30
    model name	: Intel(R) Core(TM) i7 CPU       Q 820  @ 1.73GHz

### 如何仅仅显示匹配到内容的文件名字? ###

使用 -l 选项去显示那些文件内容中包含 main() 的文件名：

    $ grep -l 'main' *.c

最后，你可以强制 grep 以彩色输出：

    $ grep --color vivek /etc/passwd

示例输出：

![Grep command in action](http://files.cyberciti.biz/uploads/faq/2007/08/grep_command_examples.png)


--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/howto-use-grep-command-in-linux-unix/

作者：Vivek Gite 
译者：[zky001](https://github.com/zky001)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

校对者ID：
[1]:http://bash.cyberciti.biz/guide/Pipes