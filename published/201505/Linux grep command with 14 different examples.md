14 个 grep 命令的例子
===========

###概述：###

所有的类linux系统都会提供一个名为**grep(global regular expression print，全局正则表达式输出)**的搜索工具。grep命令在对一个或多个文件的内容进行基于模式的搜索的情况下是非常有用的。模式可以是单个字符、多个字符、单个单词、或者是一个句子。

当命令匹配到执行命令时指定的模式时，grep会将包含模式的一行输出，但是并不对原文件内容进行修改。

在本文中，我们将会讨论到14个grep命令的例子。

###例1 在文件中查找模式（单词）###

在/etc/passwd文件中查找单词“linuxtechi”

    root@Linux-world:~# grep linuxtechi /etc/passwd
    linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    root@Linux-world:~#

###例2 在多个文件中查找模式。###

    root@Linux-world:~# grep linuxtechi /etc/passwd /etc/shadow /etc/gshadow
    /etc/passwd:linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    /etc/shadow:linuxtechi:$6$DdgXjxlM$4flz4JRvefvKp0DG6re:16550:0:99999:7:::/etc/gshadow:adm:*::syslog,linuxtechi
    /etc/gshadow:cdrom:*::linuxtechi
    /etc/gshadow:sudo:*::linuxtechi
    /etc/gshadow:dip:*::linuxtechi
    /etc/gshadow:plugdev:*::linuxtechi
    /etc/gshadow:lpadmin:!::linuxtechi
    /etc/gshadow:linuxtechi:!::
    /etc/gshadow:sambashare:!::linuxtechi
    root@Linux-world:~#

###例3 使用-l参数列出包含指定模式的文件的文件名。###

    root@Linux-world:~# grep -l linuxtechi /etc/passwd /etc/shadow /etc/fstab /etc/mtab
    /etc/passwd
    /etc/shadow
    root@Linux-world:~#

###例4 使用-n参数，在文件中查找指定模式并显示匹配行的行号###

    root@Linux-world:~# grep -n linuxtechi /etc/passwd
    39:linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    root@Linux-world:~#

root@Linux-world:~# grep -n root /etc/passwd /etc/shadow

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-n-root.jpg)

###例5 使用-v参数输出不包含指定模式的行###

输出/etc/passwd文件中所有不含单词“linuxtechi”的行

    root@Linux-world:~# grep -v linuxtechi /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-v-option.jpg)

###例6 使用 ^ 符号输出所有以某指定模式开头的行###

Bash脚本将 ^ 符号视作特殊字符，用于指定一行或者一个单词的开始。例如输出/etc/passes文件中所有以“root”开头的行

    root@Linux-world:~# grep ^root /etc/passwd
    root:x:0:0:root:/root:/bin/bash
    root@Linux-world:~#

###例7 使用 $ 符号输出所有以指定模式结尾的行。###

输出/etc/passwd文件中所有以“bash”结尾的行。

    root@Linux-world:~# grep bash$ /etc/passwd
    root:x:0:0:root:/root:/bin/bash
    linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    root@Linux-world:~#

Bash脚本将美元($)符号视作特殊字符，用于指定一行或者一个单词的结尾。

###例8 使用 -r 参数递归地查找特定模式###

    root@Linux-world:~# grep -r linuxtechi /etc/
    /etc/subuid:linuxtechi:100000:65536
    /etc/group:adm:x:4:syslog,linuxtechi
    /etc/group:cdrom:x:24:linuxtechi
    /etc/group:sudo:x:27:linuxtechi
    /etc/group:dip:x:30:linuxtechi
    /etc/group:plugdev:x:46:linuxtechi
    /etc/group:lpadmin:x:115:linuxtechi
    /etc/group:linuxtechi:x:1000:
    /etc/group:sambashare:x:131:linuxtechi
    /etc/passwd-:linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    /etc/passwd:linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    ............................................................................

上面的命令将会递归的在/etc目录中查找“linuxtechi”单词

###例9 使用 grep 查找文件中所有的空行

    root@Linux-world:~# grep ^$ /etc/shadow
    root@Linux-world:~#

由于/etc/shadow文件中没有空行，所以没有任何输出

###例10 使用 -i 参数查找模式###

grep命令的-i参数在查找时忽略字符的大小写。

我们来看一个例子，在paswd文件中查找“LinuxTechi”单词。

    nextstep4it@localhost:~$ grep -i LinuxTechi /etc/passwd
    linuxtechi:x:1001:1001::/home/linuxtechi:/bin/bash
    nextstep4it@localhost:~$

###例11 使用 -e 参数查找多个模式###

例如，我想在一条grep命令中查找‘linuxtechi’和‘root’单词，使用-e参数，我们可以查找多个模式。

    root@Linux-world:~# grep -e "linuxtechi" -e "root" /etc/passwd
    root:x:0:0:root:/root:/bin/bash
    linuxtechi:x:1000:1000:linuxtechi,,,:/home/linuxtechi:/bin/bash
    root@Linux-world:~#

###例12 使用 -f 用文件指定待查找的模式###

首先，在当前目录中创建一个搜索模式文件“grep_pattern”，我想文件中输入的如下内容。

    root@Linux-world:~# cat grep_pattern
    ^linuxtechi
    root
    false$
    root@Linux-world:~#

现在，试试使用grep_pattern文件进行搜索

    root@Linux-world:~# grep -f grep_pattern /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-f-option.jpg)

###例13 使用 -c 参数计算模式匹配到的数量###

继续上面例子，我们在grep命令中使用-c命令计算匹配指定模式的数量

    root@Linux-world:~# grep -c -f grep_pattern /etc/passwd
    22
    root@Linux-world:~#

###例14 输出匹配指定模式行的前或者后面N行###

a)使用-B参数输出匹配行的前4行

    root@Linux-world:~# grep -B 4 "games" /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-B-option.jpg)

b)使用-A参数输出匹配行的后4行

    root@Linux-world:~# grep -A 4 "games" /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-A-option.jpg)

c)使用-C参数输出匹配行的前后各4行

    root@Linux-world:~# grep -C 4 "games" /etc/passwd

![](http://www.linuxtechi.com/wp-content/uploads/2015/05/grep-C-option.jpg)

--------------------------------------------------------------------------------

via: http://www.linuxtechi.com/linux-grep-command-with-14-different-examples/

作者：[Pradeep Kumar][a]
译者：[cvsher](https://github.com/cvsher)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxtechi.com/author/pradeep/
