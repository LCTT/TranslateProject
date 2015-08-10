[translating by xiqingongzi]

RHCSA系列: 复习基础命令及系统文档 – 第一部分
================================================================================
RHCSA (红帽认证系统工程师) 是由给商业公司提供开源操作系统和软件的RedHat公司举行的认证考试, 除此之外，红帽公司还为这些企业和机构提供支持、训练以及咨询服务

![RHCSA Exam Guide](http://www.tecmint.com/wp-content/uploads/2015/02/RHCSA-Series-by-Tecmint.png)

RHCSA 考试准备指南

RHCSA 考试(考试编号 EX200)通过后可以获取由Red Hat 公司颁发的证书. RHCSA 考试是RHCT(红帽认证技师)的升级版,而且RHCSA必须在新的Red Hat Enterprise Linux(红帽企业版)下完成.RHCT和RHCSA的主要变化就是RHCT基于 RHEL5 , 而RHCSA基于RHEL6或者7, 这两个认证的等级也有所不同.

红帽认证管理员所会的最基础的是在红帽企业版的环境下执行如下系统管理任务：

- 理解并会使用命令管理文件、目录、命令行以及系统/软件包的文档
- 使用不同的启动等级启动系统,认证和控制进程，启动或停止虚拟机
- 使用分区和逻辑卷管理本地存储
- 创建并且配置本地文件系统和网络文件系统，设置他们的属性(许可、加密、访问控制表)
- 部署、配置、并且控制系统，包括安装、升级和卸载软件
- 管理系统用户和组，独立使用集中制的LDAP目录权限控制
- 确保系统安全，包括基础的防火墙规则和SELinux配置


关于你所在国家的考试注册费用参考 [RHCSA Certification page][1].

关于你所在国家的考试注册费用参考RHCSA 认证页面


在这个有15章的RHCSA(红帽认证管理员)备考系列,我们将覆盖以下的关于红帽企业Linux第七版的最新的信息

- Part 1: 回顾必会的命令和系统文档
- Part 2: 在RHEL7如何展示文件和管理目录
- Part 3: 在RHEL7中如何管理用户和组
- Part 4: 使用nano和vim管理命令/ 使用grep和正则表达式分析文本
- Part 5: RHEL7的进程管理:启动，关机，以及其他介于二者之间的.
- Part 6: 使用 'Parted'和'SSM'来管理和加密系统存储
- Part 7:  使用ACLs(访问控制表)并挂载 Samba /NFS 文件分享
- Part 8:  加固SSH，设置主机名并开启网络服务
- Part 9:  安装、配置和加固一个Web，FTP服务器
- Part 10:  Yum 包管理方式,使用Cron进行自动任务管理以及监控系统日志
- Part 11:  使用FirewallD和Iptables设置防火墙，控制网络流量
- Part 12: 使用Kickstart 自动安装RHEL 7
- Part 13: RHEL7:什么是SeLinux?他的原理是什么?
- Part 14:  在RHEL7 中使用基于LDAP的权限控制
- Part 15: RHEL7的虚拟化:KVM 和虚拟机管理

在第一章，我们讲解如何输入和运行正确的命令在终端或者Shell窗口，并且讲解如何找到、插入，以及使用系统文档

![RHCSA: Reviewing Essential Linux Commands – Part 1](http://www.tecmint.com/wp-content/uploads/2015/02/Reviewing-Essential-Linux-Commands.png)

RHCSA：回顾必会的Linux命令 - 第一部分

#### 前提: ####

至少你要熟悉如下命令

- [cd command][2] (改变目录)
- [ls command][3] (列举文件)
- [cp command][4] (复制文件)
- [mv command][5] (移动或重命名文件)
- [touch command][6] (创建一个新的文件或更新已存在文件的时间表)
- rm command (删除文件)
- mkdir command (创建目录)

在这篇文章中你将会找到更多的关于如何更好的使用他们的正确用法和特殊用法.

虽然没有严格的要求，但是作为讨论常用的Linux命令和方法,你应该安装RHEL7 来尝试使用文章中提到的命令.这将会使你学习起来更省力.

- [红帽企业版Linux(RHEL)7 安装指南][7]

### 使用Shell进行交互 ###
如果我们使用文本模式登陆Linux，我们就无法使用鼠标在默认的shell。另一方面，如果我们使用图形化界面登陆,我们将会通过启动一个终端来开启shell，无论那种方式，我们都会看到用户提示,并且我们可以开始输入并且执行命令(当按下Enter时，命令就会被执行)


当我们使用文本模式登陆Linux时，
命令是由两个部分组成的：

- 命令本身
- 参数

某些参数，称为选项（通常使用一个连字符区分）,改变了由其他参数定义的命令操作.

命令的类型可以帮助我们识别某一个特定的命令是由shell内建的还是由一个单独的包提供。这样的区别在于我们能够找到更多关于该信息的命令,对shell内置的命令，我们需要看shell的ManPage，如果是其他提供的，我们需要看它自己的ManPage.

![Check Shell built in Commands](http://www.tecmint.com/wp-content/uploads/2015/02/Check-shell-built-in-Commands.png)

检查Shell的内建命令

在上面的例子中， cd 和 type 是shell内建的命令，top和 less 是由其他的二进制文件提供的(在这种情况下，type将返回命令的位置)
其他的内建命令

- [echo command][8]: 展示字符串
- [pwd command][9]: 输出当前的工作目录

![More Built in Shell Commands](http://www.tecmint.com/wp-content/uploads/2015/02/More-Built-in-Shell-Commands.png)

更多内建函数

**exec 命令**

运行我们指定的外部程序。请注意，最好是只输入我们想要运行的程序的名字，不过exec命令有一个特殊的特性:使用旧的shell运行，而不是创建新的进程，可以作为子请求的验证.

    # ps -ef | grep [shell 进程的PID]

当新的进程注销，Shell也随之注销,运行 exec top 然后按下 q键来退出top，你会注意到shell 会话会结束,如下面的屏幕录像展示的那样:

注：youtube视频
<iframe width="640" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="https://www.youtube.com/embed/f02w4WT73LE"></iframe>

**export 命令**

输出之后执行的命令的环境的变量

**history 命令**

展示数行之前的历史命令.在感叹号前输入命令编号可以再次执行这个命令.如果我们需要编辑历史列表中的命令,我们可以按下 Ctrl + r 并输入与命令相关的第一个字符.
当我们看到的命令自动补全，我们可以根据我们目前的需要来编辑它：

注：youtube视频
<iframe width="640" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="https://www.youtube.com/embed/69vafdSMfU4"></iframe>

命令列表会保存在一个叫 .bash_history的文件里.history命令是一个非常有用的用于减少输入次数的工具，特别是进行命令行编辑的时候.默认情况下，bash保留最后输入的500个命令，不过可以通过修改 HISTSIZE 环境变量来增加:


![Linux history Command](http://www.tecmint.com/wp-content/uploads/2015/02/Linux-history-Command.png)

Linux history 命令

但上述变化，在我们的下一次启动不会保留。为了保持HISTSIZE变量的变化，我们需要通过手工修改文件编辑：

    # 设置history请看  HISTSIZE 和 HISTFILESIZE 在 bash(1)的文档
    HISTSIZE=1000

**重要**: 我们的更改不会生效，除非我们重启了系统

**alias 命令**
没有参数或使用-p参数将会以 名称=值的标准形式输出alias 列表.当提供了参数时，一个alias 将被定义给给定的命令和值

使用alias ，我们可以创建我们自己的命令，或修改现有的命令，包括需要的参数.举个例子，假设我们想别名 ls 到 ls –color=auto ，这样就可以使用不同颜色输出文件、目录、链接


    # alias ls='ls --color=auto'

![Linux alias Command](http://www.tecmint.com/wp-content/uploads/2015/02/Linux-alias-Command.png)

Linux 别名命令 

**Note**: 你可以给你的新命令起任何的名字，并且附上足够多的使用单引号分割的参数，但是这样的情况下你要用分号区分开他们.

    # alias myNewCommand='cd /usr/bin; ls; cd; clear'

**exit 命令**

Exit和logout命令都是退出shell.exit命令退出所有的shell，logout命令只注销登陆的shell，其他的自动以文本模式启动的shell不算.

如果我们对某个程序由疑问，我们可以看他的man Page，可以使用man命令调出它，额外的，还有一些重要的文件的手册页(inittab,fstab,hosts等等),库函数,shells,设备及其他功能

#### 举例: ####

- man uname (输出系统信息，如内核名称、处理器、操作系统类型、架构等).
- man inittab (初始化守护设置).

另外一个重要的信息的来源就是info命令提供的,info命令常常被用来读取信息文件.这些文件往往比manpage 提供更多信息.通过info 关键词调用某个命令的信息

    # info ls
    # info cut


另外，在/usr/share/doc 文件夹包含了大量的子目录，里面可以找到大量的文档.他们包含文本文件或其他友好的格式.
确保你使用这三种方法去查找命令的信息。重点关注每个命令文档中介绍的详细的语法

**使用expand命令把tabs转换为空格**

有时候文本文档包含了tabs但是程序无法很好的处理的tabs.或者我们只是简单的希望将tabs转换成空格.这就是为什么expand (GNU核心组件提供)工具出现,

举个例子,给我们一个文件 NumberList.txt，让我们使用expand处理它，将tabs转换为一个空格.并且以标准形式输出.

    # expand --tabs=1 NumbersList.txt

![Linux expand Command](http://www.tecmint.com/wp-content/uploads/2015/02/Linux-expand-Command.png)

Linux expand 命令

unexpand命令可以实现相反的功能(将空格转为tab)

**使用head输出文件首行及使用tail输出文件尾行**

通常情况下，head命令后跟着文件名时，将会输出该文件的前十行，我们可以通过 -n 参数来自定义具体的行数。

    # head -n3 /etc/passwd
    # tail -n3 /etc/passwd

![Linux head and tail Command](http://www.tecmint.com/wp-content/uploads/2015/02/Linux-head-and-tail-Command.png)

Linux 的 head 和 tail 命令

tail 最有意思的一个特性就是能够展现信息(最后一行)就像我们输入文件(tail -f my.log，一行一行的，就像我们在观察它一样。)这在我们监控一个持续增加的日志文件时非常有用

更多: [Manage Files Effectively using head and tail Commands][10]

**使用paste合并文本文件**
paste命令一行一行的合并文件，默认会以tab来区分每一行,或者其他你自定义的分行方式.(下面的例子就是输出使用等号划分行的文件).
    # paste -d= file1 file2

![Merge Files in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/Merge-Files-in-Linux-with-paste-command.png)

Merge Files in Linux

**使用split命令将文件分块**

split 命令常常用于把一个文件切割成两个或多个文由我们自定义的前缀命名的件文件.这些文件可以通过大小、区块、行数，生成的文件会有一个数字或字母的后缀.在下面的例子中，我们将切割bash.pdf ，每个文件50KB (-b 50KB) ,使用命名后缀 (-d):

    # split -b 50KB -d bash.pdf bash_

![Split Files in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/Split-Files-in-Linux-with-split-command.png)

在Linux下划分文件

你可以使用如下命令来合并这些文件，生成源文件:

    # cat bash_00 bash_01 bash_02 bash_03 bash_04 bash_05 > bash.pdf

**使用tr命令改变字符**

tr 命令多用于变化（改变）一个一个的字符活使用字符范围.和之前一样,下面的实例我们江使用同样的文件file2，我们将实习：

- 小写字母 o 变成大写
- 所有的小写字母都变成大写字母

    # cat file2 | tr o O
    # cat file2 | tr [a-z] [A-Z]

![Translate Characters in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/Translate-characters-in-Linux-with-tr-command.png)

在Linux中替换文字

**使用uniq和sort检查或删除重复的文字**

uniq命令可以帮我们查出或删除文件中的重复的行,默认会写出到stdout.我们应当注意， uniq 只能查出相邻的两个相同的单纯，所以， uniq 往往和sort 一起使用(sort一般用于对文本文件的内容进行排序)


默认的，sort 以第一个参数(使用空格区分)为关键字.想要定义特殊的关键字，我们需要使用 -k参数，请注意如何使用sort 和uniq输出我们想要的字段，具体可以看下面的例子

    # cat file3
    # sort file3 | uniq
    # sort -k2 file3 | uniq
    # sort -k3 file3 | uniq

![删除文件中重复的行](http://www.tecmint.com/wp-content/uploads/2015/02/Remove-Duplicate-Lines-in-file.png)

删除文件中重复的行

**从文件中提取文本的命令**

Cut命令基于字节(-b),字符(-c),或者区块(-f)从stdin活文件中提取到的部分将会以标准的形式展现在屏幕上

当我们使用区块切割时，默认的分隔符是一个tab，不过你可以通过 -d 参数来自定义分隔符.

    # cut -d: -f1,3 /etc/passwd # 这个例子提取了第一块和第三块的文本
    # cut -d: -f2-4 /etc/passwd # 这个例子提取了第一块到第三块的文本

![从文件中提取文本](http://www.tecmint.com/wp-content/uploads/2015/02/Extract-Text-from-a-file.png)

从文件中提取文本


注意，上方的两个输出的结果是十分简洁的。

**使用fmt命令重新格式化文件**

fmt 被用于去“清理”有大量内容或行的文件,或者有很多缩进的文件.新的锻炼格式每行不会超过75个字符款，你能改变这个设定通过 -w(width 宽度)参数，它可以设置行宽为一个特定的数值

举个例子，让我们看看当我们用fmt显示定宽为100个字符的时候的文件/etc/passwd 时会发生什么.再来一次，输出值变得更加简洁.

    # fmt -w100 /etc/passwd

![File Reformatting in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/File-Reformatting-in-Linux-with-fmt-command.png)

Linux文件重新格式化

**使用pr命令格式化打印内容**

pr 分页并且在列中展示一个或多个用于打印的文件. 换句话说，使用pr格式化一个文件使他打印出来时看起来更好.举个例子，下面这个命令

    # ls -a /etc | pr -n --columns=3 -h "Files in /etc"

以一个友好的排版方式(3列)输出/etc下的文件,自定义了页眉(通过 -h 选项实现),行号(-n)

![File Formatting in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/File-Formatting-in-Linux-with-pr-command.png)

Linux的文件格式

### 总结 ###

在这篇文章中，我们已经讨论了如何在Shell或终端以正确的语法输入和执行命令，并解释如何找到，检查和使用系统文档。正如你看到的一样简单，这就是你成为RHCSA的第一大步

如果你想添加一些其他的你经常使用的能够有效帮你完成你的日常工作的基础命令,并为分享他们而感到自豪,请在下方留言.也欢迎提出问题.我们期待您的回复.


--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-reviewing-essential-commands-system-documentation/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://www.redhat.com/en/services/certification/rhcsa
[2]:http://www.tecmint.com/cd-command-in-linux/
[3]:http://www.tecmint.com/ls-command-interview-questions/
[4]:http://www.tecmint.com/advanced-copy-command-shows-progress-bar-while-copying-files/
[5]:http://www.tecmint.com/rename-multiple-files-in-linux/
[6]:http://www.tecmint.com/8-pratical-examples-of-linux-touch-command/
[7]:http://www.tecmint.com/redhat-enterprise-linux-7-installation/
[8]:http://www.tecmint.com/echo-command-in-linux/
[9]:http://www.tecmint.com/pwd-command-examples/
[10]:http://www.tecmint.com/view-contents-of-file-in-linux/
