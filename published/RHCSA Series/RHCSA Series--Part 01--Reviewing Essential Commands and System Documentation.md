RHCSA 系列（一）: 回顾基础命令及系统文档
================================================================================

RHCSA (红帽认证系统工程师) 是由 RedHat 公司举行的认证考试，这家公司给商业公司提供开源操作系统和软件，除此之外，还为这些企业和机构提供支持、训练以及咨询服务等。

![RHCSA Exam Guide](http://www.tecmint.com/wp-content/uploads/2015/02/RHCSA-Series-by-Tecmint.png)

*RHCSA 考试准备指南*

RHCSA 考试(考试编号 EX200)通过后可以获取由 RedHat 公司颁发的证书. RHCSA 考试是 RHCT(红帽认证技师)的升级版，而且 RHCSA 必须在新的 Red Hat Enterprise Linux(红帽企业版)下完成。RHCT 和 RHCSA 的主要变化就是 RHCT 基于 RHEL5，而 RHCSA 基于 RHEL6 或者7，这两个认证的等级也有所不同。

红帽认证管理员最起码可以在红帽企业版的环境下执行如下系统管理任务：

- 理解并会使用命令管理文件、目录、命令行以及系统/软件包的文档
- 在不同的启动等级操作运行中的系统，识别和控制进程，启动或停止虚拟机
- 使用分区和逻辑卷管理本地存储
- 创建并且配置本地文件系统和网络文件系统，设置他们的属性(权限、加密、访问控制表)
- 部署、配置、并且控制系统，包括安装、升级和卸载软件
- 管理系统用户和组，以及使用集中制的 LDAP 目录进行用户验证
- 确保系统安全，包括基础的防火墙规则和 SELinux 配置

关于你所在国家的考试注册和费用请参考 [RHCSA 认证页面][1]。

在这个有15章的 RHCSA(红帽认证管理员)备考系列中，我们将覆盖以下的关于红帽企业 Linux 第七版的最新的信息：

- Part 1: 回顾基础命令及系统文档
- Part 2: 在 RHEL7 中如何进行文件和目录管理
- Part 3: 在 RHEL7 中如何管理用户和组
- Part 4: 使用 nano 和 vim 管理命令，使用 grep 和正则表达式分析文本
- Part 5: RHEL7 的进程管理：启动，关机，以及这之间的各种事情
- Part 6: 使用 'Parted' 和 'SSM' 来管理和加密系统存储
- Part 7: 使用 ACL(访问控制表)并挂载 Samba/NFS 文件分享
- Part 8: 加固 SSH，设置主机名并开启网络服务
- Part 9: 安装、配置和加固一个 Web 和 FTP 服务器
- Part 10: Yum 包管理方式，使用 Cron 进行自动任务管理以及监控系统日志
- Part 11: 使用 FirewallD 和 Iptables 设置防火墙，控制网络流量
- Part 12: 使用 Kickstart 自动安装 RHEL 7
- Part 13: RHEL7：什么是 SeLinux？他的原理是什么？
- Part 14: 在 RHEL7 中使用基于 LDAP 的权限控制
- Part 15: 虚拟化基础和用KVM管理虚拟机

在第一章，我们讲解如何在终端或者 Shell 窗口输入和运行正确的命令，并且讲解如何找到、查阅，以及使用系统文档。

![RHCSA: Reviewing Essential Linux Commands – Part 1](http://www.tecmint.com/wp-content/uploads/2015/02/Reviewing-Essential-Linux-Commands.png)

*RHCSA：回顾必会的 Linux 命令 - 第一部分*

#### 前提: ####

至少你要熟悉如下命令

- [cd 命令][2] (改变目录)
- [ls 命令][3] (列举文件)
- [cp 命令][4] (复制文件)
- [mv 命令][5] (移动或重命名文件)
- [touch 命令][6] (创建一个新的文件或更新已存在文件的时间表)
- rm 命令 (删除文件)
- mkdir 命令 (创建目录)

在这篇文章中你将会找到更多的关于如何更好的使用他们的正确用法和特殊用法.

虽然没有严格的要求，但是作为讨论常用的 Linux 命令和在 Linux 中搜索信息方法，你应该安装 RHEL7 来尝试使用文章中提到的命令。这将会使你学习起来更省力。

- [红帽企业版 Linux(RHEL)7 安装指南][7]

### 使用 Shell 进行交互 ###

如果我们使用文本模式登录 Linux，我们就会直接进入到我们的默认 shell 中。另一方面，如果我们使用图形化界面登录，我们必须通过启动一个终端来开启 shell。无论那种方式，我们都会看到用户提示符，并且我们可以在这里输入并且执行命令(当按下回车时，命令就会被执行)。

命令是由两个部分组成的：

- 命令本身
- 参数

某些参数，称为选项（通常使用一个连字符开头），会改变命令的行为方式，而另外一些则指定了命令所操作的对象。

type 命令可以帮助我们识别某一个特定的命令是由 shell 内置的还是由一个单独的包提供的。这样的区别在于我们能够在哪里找到更多关于该命令的更多信息。对 shell 内置的命令，我们需要看 shell 的手册页；如果是其他的，我们需要看软件包自己的手册页。

![Check Shell built in Commands](http://www.tecmint.com/wp-content/uploads/2015/02/Check-shell-built-in-Commands.png)

*检查Shell的内置命令*

在上面的例子中， `cd` 和 `type` 是 shell 内置的命令，`top` 和 `less` 是由 shell 之外的其他的二进制文件提供的(在这种情况下，type将返回命令的位置)。

其他的内置命令：

- [echo 命令][8]: 展示字符串
- [pwd 命令][9]: 输出当前的工作目录

![More Built in Shell Commands](http://www.tecmint.com/wp-content/uploads/2015/02/More-Built-in-Shell-Commands.png)

*其它内置命令*

**exec 命令**

它用来运行我们指定的外部程序。请注意在多数情况下，只需要输入我们想要运行的程序的名字就行，不过` exec` 命令有一个特殊的特性：不是在 shell 之外创建新的进程运行，而是这个新的进程会替代原来的 shell，可以通过下列命令来验证。

    # ps -ef | grep [shell 进程的PID]

当新的进程终止时，Shell 也随之终止。运行 `exec top` ，然后按下 `q` 键来退出 top，你会注意到 shell 会话也同时终止，如下面的屏幕录像展示的那样:

<iframe width="640" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="https://dn-linuxcn.qbox.me/static/video/Linux%20exec%20Command%20Demonstration.mp4"></iframe>

**export 命令**

给之后执行的命令的输出环境变量。

**history 命令**

展示数行之前的历史命令。命令编号前面前缀上感叹号可以再次执行这个命令。如果我们需要编辑历史列表中的命令，我们可以按下 `Ctrl + r` 并输入与命令相关的第一个字符。我们可以看到的命令会自动补全，可以根据我们目前的需要来编辑它：

<iframe width="640" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="https://dn-linuxcn.qbox.me/static/video/Linux%20history%20Command%20Demonstration.mp4"></iframe>

命令列表会保存在一个叫 `.bash_history` 的文件里。`history` 命令是一个非常有用的用于减少输入次数的工具，特别是进行命令行编辑的时候。默认情况下，bash 保留最后输入的500个命令，不过可以通过修改 HISTSIZE 环境变量来增加:

![Linux history Command](http://www.tecmint.com/wp-content/uploads/2015/02/Linux-history-Command.png)

*Linux history 命令*

但上述变化，在我们的下一次启动不会保留。为了保持 HISTSIZE 变量的变化，我们需要通过手工修改文件编辑：

    # 要设置 history 长度，请看 bash(1)文档中的 HISTSIZE 和 HISTFILESIZE
    HISTSIZE=1000

**重要**： 我们的更改不会立刻生效，除非我们重启了 shell 。

**alias 命令**

没有参数或使用 `-p` 选项时将会以“名称=值”的标准形式输出别名列表。当提供了参数时，就会按照给定的名字和值定义一个别名。

使用 `alias` ，我们可以创建我们自己的命令，或使用所需的参数修改现有的命令。举个例子，假设我们将 `ls` 定义别名为 `ls –color=auto` ，这样就可以使用不同颜色输出文件、目录、链接等等。


    # alias ls='ls --color=auto'

![Linux alias Command](http://www.tecmint.com/wp-content/uploads/2015/02/Linux-alias-Command.png)

*Linux 别名命令*

**注意**： 你可以给你的“新命令”起任何的名字，并且使用单引号包括很多命令，但是你要用分号区分开它们。如下：

    # alias myNewCommand='cd /usr/bin; ls; cd; clear'

**exit 命令**

`exit` 和 `logout` 命令都可以退出 shell 。`exit` 命令可以退出所有的 shell，`logout` 命令只注销登录的 shell（即你用文本模式登录时自动启动的那个）。

**man 和 info 命令**
如果你对某个程序有疑问，可以参考它的手册页，可以使用 `man` 命令调出它。此外，还有一些关于重要文件(inittab、fstab、hosts 等等)、库函数、shell、设备及其他功能的手册页。

举例: 

- man uname (输出系统信息，如内核名称、处理器、操作系统类型、架构等)
- man inittab (初始化守护进程的设置)

另外一个重要的信息的来源是由 `info` 命令提供的，`info` 命令常常被用来读取 info 文件。这些文件往往比手册页 提供了更多信息。可以通过 `info keyword` 调用某个命令的信息：

    # info ls
    # info cut

另外，在 `/usr/share/doc` 文件夹包含了大量的子目录，里面可以找到大量的文档。它们是文本文件或其他可读格式。

你要习惯于使用这三种方法去查找命令的信息。重点关注每个命令文档中介绍的详细的语法。

**使用 expand 命令把制表符转换为空格**

有时候文本文档包含了制表符，但是程序无法很好的处理。或者我们只是简单的希望将制表符转换成空格。这就是用到 `expand` 地方(由GNU核心组件包提供) 。

举个例子，我们有个文件 NumberList.txt，让我们使用 `expand` 处理它，将制表符转换为一个空格，并且显示在标准输出上。

    # expand --tabs=1 NumbersList.txt

![Linux expand Command](http://www.tecmint.com/wp-content/uploads/2015/02/Linux-expand-Command.png)

*Linux expand 命令*

unexpand命令可以实现相反的功能(将空格转为制表符)

**使用 head 输出文件首行及使用 tail 输出文件尾行**

通常情况下，`head` 命令后跟着文件名时，将会输出该文件的前十行，我们可以通过 `-n` 参数来自定义具体的行数。

    # head -n3 /etc/passwd
    # tail -n3 /etc/passwd

![Linux head and tail Command](http://www.tecmint.com/wp-content/uploads/2015/02/Linux-head-and-tail-Command.png)

*Linux 的 head 和 tail 命令*

`tail` 最有意思的一个特性就是能够显示增长的输入文件(`tail -f my.log`，my.log 是我们需要监视的文件。)这在我们监控一个持续增加的日志文件时非常有用。

- [使用 head 和 tail 命令有效地管理文件][10]

**使用 paste 按行合并文本文件**

`paste` 命令一行一行的合并文件，默认会以制表符来区分每个文件的行，或者你可以自定义的其它分隔符。(下面的例子就是输出中的字段使用等号分隔)。

    # paste -d= file1 file2

![Merge Files in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/Merge-Files-in-Linux-with-paste-command.png)

*Linux 中的 merge 命令*

**使用 split 命令将文件分块**

`split` 命令常常用于把一个文件切割成两个或多个由我们自定义的前缀命名的文件。可以根据大小、区块、行数等进行切割，生成的文件会有一个数字或字母的后缀。在下面的例子中，我们将切割 bash.pdf ，每个文件 50KB (-b 50KB)，使用数字后缀 (-d)：

    # split -b 50KB -d bash.pdf bash_

![Split Files in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/Split-Files-in-Linux-with-split-command.png)

*在 Linux 下切割文件*

你可以使用如下命令来合并这些文件，生成原来的文件:

    # cat bash_00 bash_01 bash_02 bash_03 bash_04 bash_05 > bash.pdf

**使用 tr 命令替换字符**

`tr` 命令多用于一对一的替换（改变）字符，或者使用字符范围。和之前一样，下面的实例我们将使用之前的同样文件file2，我们将做：

- 小写字母 o 变成大写
- 所有的小写字母都变成大写字母

-
    # cat file2 | tr o O
    # cat file2 | tr [a-z] [A-Z]

![Translate Characters in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/Translate-characters-in-Linux-with-tr-command.png)

*在 Linux 中替换字符*

**使用 uniq 和 sort 检查或删除重复的文字**

`uniq` 命令可以帮我们查出或删除文件中的重复的行，默认会输出到标准输出，我们应当注意，`uniq`只能查出相邻的相同行，所以，`uniq` 往往和 `sort` 一起使用(`sort` 一般用于对文本文件的内容进行排序)

默认情况下，`sort` 以第一个字段(使用空格分隔)为关键字段。想要指定不同关键字段，我们需要使用 -k 参数，请注意如何使用 `sort` 和 `uniq` 输出我们想要的字段，具体可以看下面的例子：

    # cat file3
    # sort file3 | uniq
    # sort -k2 file3 | uniq
    # sort -k3 file3 | uniq

![删除文件中重复的行](http://www.tecmint.com/wp-content/uploads/2015/02/Remove-Duplicate-Lines-in-file.png)

*删除文件中重复的行*

**从文件中提取文本的命令**

`cut` 命令基于字节(-b)、字符(-c)、或者字段(-f)的数量，从输入文件（标准输入或文件）中提取到的部分将会以标准输出上。

当我们使用字段 `cut` 时，默认的分隔符是一个制表符，不过你可以通过 -d 参数来自定义分隔符。

    # cut -d: -f1,3 /etc/passwd # 这个例子提取了第一和第三字段的文本
    # cut -d: -f2-4 /etc/passwd # 这个例子提取了第二到第四字段的文本

![从文件中提取文本](http://www.tecmint.com/wp-content/uploads/2015/02/Extract-Text-from-a-file.png)

*从文件中提取文本*

注意，简洁起见，上方的两个输出的结果是截断的。

**使用 fmt 命令重新格式化文件**

`fmt` 被用于去“清理”有大量内容或行的文件，或者有多级缩进的文件。新的段落格式每行不会超过75个字符宽，你能通过 -w (width 宽度)参数改变这个设定，它可以设置行宽为一个特定的数值。

举个例子，让我们看看当我们用 `fmt` 显示定宽为100个字符的时候的文件 /etc/passwd 时会发生什么。再次，输出截断了。

    # fmt -w100 /etc/passwd

![File Reformatting in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/File-Reformatting-in-Linux-with-fmt-command.png)

*Linux 文件重新格式化*

**使用 pr 命令格式化打印内容**

`pr` 分页并且在按列或多列的方式显示一个或多个文件。 换句话说，使用 `pr` 格式化一个文件使它打印出来时看起来更好。举个例子，下面这个命令：

    # ls -a /etc | pr -n --columns=3 -h "Files in /etc"

以一个友好的排版方式(3列)输出/etc下的文件，自定义了页眉(通过 -h 选项实现)、行号(-n)。

![File Formatting in Linux](http://www.tecmint.com/wp-content/uploads/2015/02/File-Formatting-in-Linux-with-pr-command.png)

*Linux的文件格式化*

### 总结 ###

在这篇文章中，我们已经讨论了如何在 Shell 或终端以正确的语法输入和执行命令，并解释如何找到，查阅和使用系统文档。正如你看到的一样简单，这就是你成为 RHCSA 的第一大步。

如果你希望添加一些其他的你经常使用的能够有效帮你完成你的日常工作的基础命令，并愿意分享它们，请在下方留言。也欢迎提出问题。我们期待您的回复。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rhcsa-exam-reviewing-essential-commands-system-documentation/

作者：[Gabriel Cánepa][a]
译者：[xiqingongzi](https://github.com/xiqingongzi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:https://www.redhat.com/en/services/certification/rhcsa
[2]:http://linux.cn/article-2479-1.html
[3]:https://linux.cn/article-5109-1.html
[4]:http://linux.cn/article-2687-1.html
[5]:http://www.tecmint.com/rename-multiple-files-in-linux/
[6]:http://linux.cn/article-2740-1.html
[7]:http://www.tecmint.com/redhat-enterprise-linux-7-installation/
[8]:https://linux.cn/article-3948-1.html
[9]:https://linux.cn/article-3422-1.html
[10]:http://www.tecmint.com/view-contents-of-file-in-linux/
