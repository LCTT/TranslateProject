Linux_Logo – 输出彩色 ANSI Linux 发行版徽标的命令行工具
================================================================================
linuxlogo（或叫 linux_logo）是一款在Linux命令行下用彩色 ANSI 代码生成附带有系统信息的发行版徽标的工具。

![Linux_Logo – 输出彩色 ANSI Linux 发行版徽标](http://www.tecmint.com/wp-content/uploads/2015/06/Linux_Logo.png)

*Linux_Logo – 输出彩色 ANSI Linux 发行版徽标*

这个小工具可以从 /proc 文件系统中获取系统信息并可以显示包括主机上安装的发行版在内的很多发行版的徽标。

与徽标一同显示的系统信息包括 ： Linux 内核版本，最近一次编译Linux内核的时间，处理器/核心数量，速度，制造商，以及哪一代处理器。它还能显示总共的物理内存大小。

无独有偶，screenfetch是一个拥有类似功能的工具，它也能显示发行版徽标，同时还提供更加详细美观的系统信息。我们之前已经介绍过这个工具，你可以参考一下链接：

- [screenFetch: 命令行信息截图工具][1]

linux\_logo 和 Screenfetch 并完全一样。尽管 screenfetch 的输出较为整洁并提供更多细节， 但 linux\_logo 则提供了更多的彩色 ANSI 图标， 并且提供了格式化输出的选项。

linux\_logo 主要使用C语言编写并将 linux 徽标呈现在 X 窗口系统中因此需要安装图形界面 X11 或 X 系统（LCTT 译注：此处应是错误的。按说不需要任何图形界面支持，并且译者从其官方站 http://www.deater.net/weave/vmwprod/linux_logo 也没找到任何相关 X11的信息）。这个软件使用GNU 2.0协议。

本文中，我们将使用以下环境测试 linux_logo 工具。

    操作系统 : Debian Jessie
    处理器 : i3 / x86_64

### 在 Linux 中安装 Linux Logo工具 ###

**1. linuxlogo软件包 ( 5.11 稳定版) 可通过如下方式使用 apt, yum 或 dnf 在所有发行版中使用默认的软件仓库进行安装**

    # apt-get install linux_logo			[用于基于 Apt 的系统] （译者注：Ubuntu中，该软件包名为linuxlogo）
    # yum install linux_logo			[用于基于 Yum 的系统]
    # dnf install linux_logo			[用于基于 Dnf 的系统]
    或
    # dnf install linux_logo.x86_64			[用于 64 位系统]

**2. 装好linuxlogo软件包之后，你可以使用命令 `linuxlogo` 来获取你当前使用的发行版的默认徽标..**

    # linux_logo
    或
    # linuxlogo

![获取默认系统徽标](http://www.tecmint.com/wp-content/uploads/2015/06/Get-Default-OS-Logo.png)

*获取默认系统徽标*

**3. 使用 `[-a]` 选项可以输出没有颜色的徽标。当在黑白终端里使用 linux_logo 时，这个选项会很有用。**

    # linux_logo -a

![黑白 Linux 徽标](http://www.tecmint.com/wp-content/uploads/2015/06/Black-and-White-Linux-Logo.png)

*黑白 Linux 徽标*

**4. 使用 `[-l]` 选项可以仅输出徽标而不包含系统信息。**

    # linux_logo -l

![输出发行版徽标](http://www.tecmint.com/wp-content/uploads/2015/06/Print-Distribution-Logo.png)

*输出发行版徽标*

**5. `[-u]` 选项可以显示系统运行时间。**

    # linux_logo -u

![输出系统运行时间](http://www.tecmint.com/wp-content/uploads/2015/06/Print-System-Uptime.png)

*输出系统运行时间*

**6. 如果你对系统平均负载感兴趣，可以使用 `[-y]` 选项。你可以同时使用多个选项。**

    # linux_logo -y

![输出系统平均负载](http://www.tecmint.com/wp-content/uploads/2015/06/Print-System-Load-Average.png)

*输出系统平均负载*

如需查看更多选项并获取相关帮助，你可以使用如下命令。

    # linux_logo -h

![Linuxlogo 选项及帮助](http://www.tecmint.com/wp-content/uploads/2015/06/linuxlogo-options.png)

*Linuxlogo选项及帮助*

**7. 此工具内置了很多不同发行版的徽标。你可以使用 `[-L list]` 选项查看在这些徽标的列表。**

    # linux_logo -L list

![Linux 徽标列表](http://www.tecmint.com/wp-content/uploads/2015/06/List-of-Linux-Logos.png)

*Linux 徽标列表*

如果你想输出这个列表中的任意徽标，可以使用 `-L NUM` 或 `-L NAME` 来显示想要选中的图标。

- -L NUM – 会输出列表中序号为 NUM 的图标 (不推荐).
- -L NAME – 会输出列表中名为 NAME 的图标。

例如，如果想要显示 AIX 的徽标，你可以使用如下命令

    # linux_logo -L 1
    或
    # linux_logo -L aix

![输出 AIX 图标](http://www.tecmint.com/wp-content/uploads/2015/06/Print-AIX-Logo.png)

*输出 AIX 图标*

**注**: 命令中的使用 `-L 1` 是因为 AIX 徽标在列表中的编号是1，而使用 `-L aix` 则是因为 AIX 徽标在列表中的名称为 aix 

同样的，你还可以使用这些选项输出任何图标，以下是一些例子..

    # linux_logo -L 27
    # linux_logo -L 21

![各种 Linux 徽标](http://www.tecmint.com/wp-content/uploads/2015/06/Various-Linux-Logos.png)

*各种 Linux 徽标*

你可以通过徽标对应的编号或名字使用任意徽标。

### 一些使用 Linux_logo 的建议和提示###

**8. 你可以在登录界面输出你的 Linux 发行版徽标。要输出默认徽标，你可以在 ` ~/.bashrc` 文件的最后添加以下内容。**

    if [ -f /usr/bin/linux_logo ]; then linux_logo; fi

**注**: 如没有` ~/.bashrc` 文件，你需要在当前用户的 home 目录下新建一个。

**9. 在添加以上内容后，你只需要注销并重新登录即可看到你的发行版的默认徽标**

![Print Logo on User Login](http://www.tecmint.com/wp-content/uploads/2015/06/Print-Logo-on-Login.png)

*在用户登录时输出徽标*

其实你也可以在登录后输出任意图标，只需加入以下内容：

    if [ -f /usr/bin/linux_logo ]; then linux_logo -L num; fi

**重要**: 不要忘了将 num 替换成你想使用的图标。

**10. 你也能直接指定徽标所在的位置来显示你自己的徽标。**

    # linux_logo -D /path/to/ASCII/logo

**11. 在远程登录时输出图标。**

    # /usr/local/bin/linux_logo > /etc/issue.net

如果你想使用　ASCII　徽标而不是含有颜色的 ANSI 徽标，则使用如下命令

    # /usr/local/bin/linux_logo -a > /etc/issue.net

**12. 创建一个 Linux 上的端口 - 用于回应连接的端口。要创建 Linux 端口， 则需在 /etc/services 文件中加入以下内容**

    penguin	4444/tcp	penguin

这里的 `4444` 是一个未被任何其他资源使用的空闲端口。你也可以使用其他端口。你还需要在 /etc/inetd.conf中加入以下内容：

    penguin	stream	     tcp	nowait	root /usr/local/bin/linux_logo 

并使用以下命令重启 inetd 服务

    # killall -HUP inetd

（LCTT 译注：然后你就可以远程或本地连接到这个端口，并显示这个徽标了。）

linux_logo 还可以用做启动脚本来愚弄攻击者或对你朋友使用恶作剧。这是一个我经常在我的脚本中用来获取不同发行版输出的好工具。

试过一次后，你就不会忘记的。让我们知道你对这个工具的想法及它对你的作用吧。 不要忘记给评论、点赞或分享！

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux_logo-tool-to-print-color-ansi-logos-of-linux/

作者：[Avishek Kumar][a]
译者：[KevinSJ](https://github.com/KevinSJ)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-1947-1.html
