Linux 101：最有效地使用 Systemd
================================================================================
干嘛要这么做？

- 理解现代 Linux 发行版中的显著变化；
- 看看 Systemd 是如何取代 SysVinit 的；
- 搞定单元（unit）和新的 journal 日志。

吐槽邮件、人身攻击、死亡威胁——Lennart Poettering，Systemd 的作者，对收到这些东西早就习以为常了。这位 Red Hat 公司的员工之前在 Google+ 上怒斥 FOSS 社区([http://tinyurl.com/poorlennart][1])的本质，悲痛且失望地表示：“那真是个令人恶心的地方”。他着重指出 Linus Torvalds 在邮件列表上言辞极其刻薄的帖子，并谴责这位内核的领导者为在线讨论定下基调，并使得人身攻击及贬抑之辞成为常态。

但为何 Poettering 会遭受如此多的憎恨？为何就这么个搞搞开源软件的人要忍受这等愤怒？答案就在于他的软件的重要性。如今大多数发行版中，Systemd 是 Linux 内核发起的第一个程序，并且它还扮演多种角色。它会启动系统服务、处理用户登录，每隔特定的时间执行一些任务，还有很多很多。它在不断地成长，并逐渐成为 Linux 的某种“基础系统”——提供系统启动和发行版维护所需的所有工具。

如今，在以下几点上 Systemd 颇具争议：它逃避了一些已经确立的 Unix 传统，例如纯文本的日志文件；它被看成是个“大一统”的项目，试图接管一切；它还是我们这个操作系统的支柱的重要革新。然而大多数主流发行版已经接受了（或即将接受）它，因此它就活了下来。而且它确实是有好处的：更快地启动，更简单地管理那些有依赖的服务程序，提供强大且安全的日志系统等。

因此在这篇教程中，我们将探索 Systemd 的特性，并向您展示如何最有效地利用这些特性。即便您此刻并不是这款软件的粉丝，读完本文后您至少可以更加了解和适应它。

![](http://narf-archive.com/pix/bd0fb252416206158627fb0b1bff9b4779dca13f.gif)

*这部没正经的动画片来自[http://tinyurl.com/m2e7mv8][2]，它把 Systemd 塑造成一只狂暴的动物，吞噬它路过的一切。大多数批评者的言辞可不像这只公仔一样柔软。*

### 启动及服务 ###

大多数主流发行版要么已经采用 Systemd，要么即将在下个发布中采用（如 Debian 和 Ubuntu）。在本教程中，我们使用 Fedora 21（该发行版已经是 Systemd 的优秀实验场地）的一个预览版进行演示，但不论您用哪个发行版，要用到的命令和注意事项都应该是一样的。这是 Systemd 的一个加分点：它消除了不同发行版之间许多细微且琐碎的区别。

在终端中输入 `ps ax | grep systemd`，看到第一行，其中的数字 **1** 表示它的进程号是1，也就是说它是 Linux 内核发起的第一个程序。因此，内核一旦检测完硬件并组织好了内存，就会运行 `/usr/lib/systemd/systemd` 可执行程序，这个程序会按顺序依次发起其他程序。（在还没有 Systemd 的日子里，内核会去运行 `/sbin/init`，随后这个程序会在名为 SysVinit 的系统中运行其余的各种启动脚本。）

Systemd 的核心是一个叫*单元* (unit)的概念，它是一些存有关于服务(service)（在运行在后台的程序）、设备、挂载点、和操作系统其他方面信息的配置文件。Systemd 的其中一个目标就是简化这些事物之间的相互作用，因此如果你有程序需要在某个挂载点被创建或某个设备被接入后开始运行，Systemd 可以让这一切正常运作起来变得相当容易。（在没有 Systemd 的日子里，要使用脚本来把这些事情调配好，那可是相当丑陋的。）要列出您 Linux 系统上的所有单元，输入以下命令：

    systemctl list-unit-files

现在，`systemctl` 是与 Systemd 交互的主要工具，它有不少选项。在单元列表中，您会注意到这儿有一些格式化：被使能（enabled）的单元显示为绿色，被禁用（disabled）的显示为红色。标记为“static”的单元不能直接启用，它们是其他单元所依赖的对象。若要限制输出列表只包含服务，使用以下命令：

    systemctl list-unit-files --type=service

注意，一个单元显示为“enabled”，并不等于对应的服务正在运行，而只能说明它可以被开启。要获得某个特定服务的信息，以 GDM (Gnome Display Manager) 为例，输入以下命令：

    systemctl status gdm.service

这条命令提供了许多有用的信息：一段给人看的服务描述、单元配置文件的位置、启动的时间、进程号，以及它所从属的 CGroups（用以限制各组进程的资源开销）。

如果您去查看位于 `/usr/lib/systemd/system/gdm.service` 的单元配置文件，您可以看到各种选项，包括要被运行的二进制文件（“ExecStart”那一行），相冲突的其他单元（即不能同时进入运行的单元），以及需要在本单元执行前进入运行的单元（“After”那一行）。一些单元有附加的依赖选项，例如“Requires”（必要的依赖）和“Wants”（可选的依赖）。

此处另一个有趣的选项是：

    Alias=display-manager.service

当您启动 **gdm.service** 后，您将可以通过 `systemctl status display-manager.service` 来查看它的状态。当您知道有*显示管理程序* (display manager)在运行并想对它做点什么，但您不关心那究竟是 GDM，KDM，XDM 还是什么别的显示管理程序时，这个选项会非常有用。

![Image](http://www.linuxvoice.com/wp-content/uploads/2015/10/status-large.jpg)

*使用 systemctl status 命令后面跟一个单元名，来查看对应的服务有什么情况。*

### “目标（target）”锁定 ###

如果您在 `/usr/lib/systemd/system` 目录中输入 `ls` 命令，您将看到各种以 `.target` 结尾的文件。*启动目标* (target)是一种将多个单元聚合在一起以致于将它们同时启动的方式。例如，对大多数类 Unix 操作系统而言有一种“多用户(multi-user)”状态，意思是系统已被成功启动，后台服务正在运行，并且已准备好让一个或多个用户登录并工作——至少在文本模式下。（其他状态包括用于进行管理工作的单用户（single-user）状态，以及用于机器关机的重启（reboot）状态。）

如果您打开 **multi-user.target** 文件一探究竟，您可能期待看到的是一个要被启动的单元列表。但您会发现这个文件内部几乎空空如也——其实，一个服务会通过 **WantedBy** 选项让自己成为启动目标的依赖。因此如果您去打开 **avahi-daemon.service**, **NetworkManager.service** 及其他 **.service** 文件看看，您将在 Install 段看到这一行：

    WantedBy=multi-user.target

因此，切换到多用户启动目标会使能（enable）那些包含上述语句的单元。还有其他一些启动目标可用（例如 **emergency.target** 提供一个紧急情况使用的 shell，以及 **halt.target** 用于机器关机），您可以用以下方式轻松地在它们之间切换：

    systemctl isolate emergency.target

在许多方面，这些都很像 SysVinit 中的*运行级* (runlevel)，如文本模式的 **multi-user.target** 类似于第3运行级，**graphical.target** 类似于第5运行级，**reboot.target** 类似于第6运行级，诸如此类。

![Image](http://www.linuxvoice.com/wp-content/uploads/2015/10/unit-large.jpg)

**与传统的脚本相比，单元配置文件也许看起来很陌生，但并不难以理解。**

### 开启与停止 ###

现在您也许陷入了沉思：我们已经看了这么多，但仍没看到如何停止和开启服务！这其实是有原因的。从外部看，Systemd 也许很复杂，像野兽一般难以驾驭。因此在您开始摆弄它之前，有必要从宏观的角度看看它是如何工作的。实际用来管理服务的命令非常简单：

    systemctl stop cups.service
    systemctl start cups.service

（若某个单元被禁用了，您可以先通过 `systemctl enable` 加上该单元名的方式将其使能。这种做法会为该单元创建一个符号链接，并将其放置在当前启动目标的 `.wants` 目录下，这些 `.wants` 目录在`/etc/systemd/system` 文件夹中。）

还有两个有用的命令是 `systemctl restart` 和 `systemctl reload`，后面接单元名。后者用于让单元重新加载它的配置文件。Systemd 的绝大部分都有良好的文档，因此您可以查看手册 (`man systemctl`) 了解每条命令的细节。

### 定时器单元：取代 Cron ###
 
除了系统初始化和服务管理，Systemd 还染指了其他方面。在很大程度上，它能够完成 **cron** 的工作，而且可以说是以更灵活的方式（并带有更易读的语法）。**cron** 是一个以规定时间间隔执行任务的程序——例如清除临时文件，刷新缓存等。
 
如果您再次进入 `/usr/lib/systemd/system` 目录，您会看到那儿有多个 `.timer` 文件。用 `less` 来查看这些文件，您会发现它们与 `.service` 和 `.target` 文件有着相似的结构，而区别在于 `[Timer]` 段。举个例子：
 
     [Timer]
     OnBootSec=1h
     OnUnitActiveSec=1w
 
**OnBootSec** 选项告诉 Systemd 在系统启动一小时后启动这个单元。第二个选项的意思是：自那以后每周启动这个单元一次。关于定时器有大量选项您可以设置，输入 `man systemd.time` 查看完整列表。
 
Systemd 的时间精度默认为一分钟。也就是说，它会在设定时刻的一分钟内运行单元，但不一定精确到那一秒。这么做是基于电源管理方面的原因，但如果您需要一个没有任何延时且精确到毫秒的定时器，您可以添加以下一行：
 
     AccuracySec=1us
 
另外， **WakeSystem** 选项（可以被设置为 true 或 false）决定了定时器是否可以唤醒处于休眠状态的机器。

![Image](http://www.linuxvoice.com/wp-content/uploads/2015/10/systemd_gui-large.jpg)

*有一个 Systemd 的图形界面程序，即便它已有多年未被积极维护。*

### 日志文件：向 journald 问声好 ###

Systemd 的第二个主要部分是 journal 。这是个日志系统，类似于 syslog 但也有些显著区别。如果您是个 Unix 日志管理模式的粉丝，准备好出离愤怒吧：这是个二进制日志，因此您不能使用常规的命令行文本处理工具来解析它。这个设计决定不出意料地在网上引起了激烈的争论，但它的确有些优点。例如，日志可以被更系统地组织，带有更多的元数据，因此可以更容易地根据可执行文件名和进程号等过滤出信息。

要查看整个 journal，输入以下命令：

    journalctl

像许多其他的 Systemd 命令一样，该命令将输出通过管道的方式引向 `less` 程序，因此您可以使用空格键向下滚动，键入`/`（斜杠）查找，以及其他熟悉的快捷键。您也能在此看到少许颜色，像红色的警告及错误信息。

以上命令会输出很多信息。为了限制其只输出本次启动的消息，使用如下命令：

    journalctl -b

这就是 Systemd 大放异彩的地方！您想查看自上次启动以来的全部消息吗？试试 **journalctl -b -1** 吧。再上一次的？用 **-2** 替换 **-1** 吧。那自某个具体时间，例如2014年10月24日16:38以来的呢？

    journalctl -b --since=”2014-10-24 16:38”

即便您对二进制日志感到遗憾，那依然是个有用的特性，并且对许多系统管理员来说，构建类似的过滤器比起写正则表达式而言容易多了。

我们已经可以根据特定的时间来准确查找日志了，那可以根据特定程序吗？对单元而言，试试这个：

    journalctl -u gdm.service

（注意：这是个查看 X server 产生的日志的好办法。）那根据特定的进程号？

    journalctl _PID=890

您甚至可以请求只看某个可执行文件产生的消息：

    journalctl /usr/bin/pulseaudio

若您想将输出的消息限制在某个优先级，可以使用 **-p** 选项。该选项参数为 0 的话只会显示紧急消息（也就是说，是时候向 **$DEITY** 祈求保佑了）（LCTT 译注： $DEITY 是一个计算机方面的幽默，DEITY 是指广义上的“神”，$前缀表示这是一个变量），为 7 的话会显示所有消息，包括调试消息。请查看手册 (`man journalctl`) 获取更多关于优先级的信息。

值得指出的是，您也可以将多个选项结合在一起，若想查看在当前启动中由 GDM 服务输出的优先级数小于等于 3 的消息，请使用下述命令：

    journalctl -u gdm.service -p 3 -b

最后，如果您仅仅想打开一个随 journal 持续更新的终端窗口，就像在没有 Systemd 时使用 `tail` 命令实现的那样，输入 `journalctl -f` 就好了。

![](http://www.linuxvoice.com/wp-content/uploads/2015/10/journal-large.jpg)

*二进制日志并不流行，但 journal 的确有它的优点，如非常方便的信息查找及过滤。*

### 没有 Systemd 的生活？###
 
如果您就是完全不能接受 Systemd，您仍然有一些主流发行版中的选择。尤其是 Slackware，作为历史最为悠久的发行版，目前还没有做出改变，但它的主要开发者并没有将其从未来规划中移除。一些不出名的发行版也在坚持使用 SysVinit 。
 
但这又将持续多久呢？Gnome 正越来越依赖于 Systemd，其他的主流桌面环境也会步其后尘。这也是引起 BSD 社区一阵恐慌的原因：Systemd 与 Linux 内核紧密相连，导致在某种程度上，桌面环境正变得越来越不可移植。一种折衷的解决方案也许会以 Uselessd ([http://uselessd.darknedgy.net][3]) 的形式到来：一种裁剪版的 Systemd，纯粹专注于启动和监控进程，而不消耗整个基础系统。
 
![Image](http://www.linuxvoice.com/wp-content/uploads/2015/10/gentoo-large.jpg)
 
若您不喜欢 Systemd，可以尝试一下 Gentoo 发行版，它将 Systemd 作为初始化工具的一种选择，但并不强制用户使用 Systemd。

--------------------------------------------------------------------------------

via: http://www.linuxvoice.com/linux-101-get-the-most-out-of-systemd/

作者：[Mike Saunders][a]
译者：[Ricky-Gong](https://github.com/Ricky-Gong)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxvoice.com/author/mike/
[1]:http://tinyurl.com/poorlennart
[2]:http://tinyurl.com/m2e7mv8
[3]:http://uselessd.darknedgy.net/
