LFCS 系列第七讲：通过 SysVinit、Systemd 和 Upstart 管理系统自启动进程和服务
================================================================================
几个月前， Linux 基金会宣布 LFCS (Linux 基金会认证系统管理员) 认证诞生了，这个令人兴奋的新计划定位于让来自全球各地的初级到中级的 Linux 系统管理员得到认证。这其中包括维护已经在运行的系统和服务的能力、第一手的问题查找和分析能力、以及决定何时向开发团队提交问题的能力。

![Linux Foundation Certified Sysadmin – Part 7](http://www.tecmint.com/wp-content/uploads/2014/10/lfcs-Part-7.png)

*第七讲： Linux 基金会认证系统管理员*

下面的视频简要介绍了 Linux 基金会认证计划。

注：youtube 视频
<iframe width="720" height="405" frameborder="0" allowfullscreen="allowfullscreen" src="//www.youtube.com/embed/Y29qZ71Kicg"></iframe>

本讲是系列教程中的第七讲，在这篇文章中，我们会介绍如何管理 Linux 系统自启动进程和服务，这是 LFCS 认证考试要求的一部分。

### 管理 Linux 自启动进程 ###

Linux 系统的启动程序包括多个阶段，每个阶段由一个不同的图示块表示。下面的图示简要总结了启动过程以及所有包括的主要组件。

![Linux Boot Process](http://www.tecmint.com/wp-content/uploads/2014/10/Linux-Boot-Process.png)

*Linux 启动过程*

当你按下你机器上的电源键时，存储在主板 EEPROM 芯片中的固件初始化 POST(通电自检) 检查系统硬件资源的状态。POST 结束后，固件会搜索并加载位于第一块可用磁盘上的 MBR 或 EFI 分区的第一阶段引导程序，并把控制权交给引导程序。

#### MBR 方式 ####

MBR 是位于 BIOS 设置中标记为可启动磁盘上的第一个扇区，大小是 512 个字节。

- 前面 446 个字节：包括可执行代码和错误信息文本的引导程序
- 接下来的 64 个字节：四个分区（主分区或扩展分区）中每个分区一条记录的分区表。其中，每条记录标示了每个一个分区的状态（是否活跃）、大小以及开始和结束扇区。
- 最后 2 个字节： MBR 有效性检查的魔法数。

下面的命令对 MBR 进行备份（在本例中，/dev/sda 是第一块硬盘）。结果文件 mbr.bkp 在分区表被破坏、例如系统不可引导时能排上用场。

当然，为了后面需要的时候能使用它，我们需要把它保存到别的地方（例如一个 USB 设备）。该文件能帮助我们重新恢复 MBR，这只在我们操作过程中没有改变硬盘驱动布局时才有效。

**备份 MBR**

    # dd if=/dev/sda of=mbr.bkp bs=512 count=1

![Backup MBR in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Backup-MBR-in-Linux.png)

*在 Linux 中备份 MBR*

**恢复 MBR**

    # dd if=mbr.bkp of=/dev/sda bs=512 count=1

![Restore MBR in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Restore-MBR-in-Linux.png)

*在 Linux 中恢复 MBR*

#### EFI/UEFI 方式 ####

对于使用 EFI/UEFI 方式的系统， UEFI 固件读取它的设置来决定从哪里启动哪个 UEFI 应用。（例如， EFI 分区位于哪块磁盘或分区。

接下来，加载并运行第二阶段引导程序(又名引导管理器)。GRUB[GRand Unified Boot] 是 Linux 中最常使用的引导管理器。今天大部分使用的系统中都能找到它两个中的其中一个版本。

- GRUB 有效配置文件： /boot/grub/menu.lst（旧发行版， EFI/UEFI 固件不支持）。
- GRUB2 配置文件： 通常是 /etc/default/grub。

尽管 LFCS 考试目标没有明确要求了解 GRUB 内部知识，但如果你足够大胆并且不怕把你的系统搞乱（为了以防万一，你可以先在虚拟机上进行尝试）你可以运行：

    # update-grub

为了使更改生效，你需要以 root 用户修改 GRUB 的配置。

首先， GRUB 加载默认的内核以及 initrd 或 initramfs 镜像。补充一句，initrd 或者 initramfs 帮助完成硬件检测、内核模块加载、以及发现挂载根目录文件系统需要的设备。

一旦真正的根目录文件系统启动，为了显示用户界面，内核就会执行系统和服务管理器（init 或 systemd，进程号 PID 一般为 1）开始普通用户态的引导程序。

init 和 systemd 都是管理其它守护进程的守护进程（后台进程），它们总是最先启动（系统引导时），最后结束（系统关闭时）。

![Systemd and Init](http://www.tecmint.com/wp-content/uploads/2014/10/systemd-and-init.png)

*Systemd 和 Init*

### 自启动服务(SysVinit) ###

Linux 中运行等级通过控制运行哪些服务来以不同方式使用系统。换句话说，运行等级控制着当前执行状态下可以完成什么任务（以及什么不能完成）。

传统上，这个启动过程是基于起源于 System V Unix 的形式，通过执行脚本启动或者停止服务从而使机器进入指定的运行等级(换句话说，是一个不同的系统运行模式)。

在每个运行等级中，独立服务可以设置为运行、或者在运行时关闭。一些主流发行版的最新版本中，已经移除了标准的 System V，而用一个称为 systemd（表示系统守护进程）的新服务和系统管理器代替，但为了兼容性，通常也支持 sysv 命令。这意味着你可以在基于 systemd 的发行版中运行大部分有名的 sysv 初始化工具。

- 推荐阅读： [Linux 为什么用 ‘systemd’ 代替 ‘init’][1]

除了启动系统进程，init 还会查看 /etc/inittab 来决定进入哪个运行等级。


|Runlevel| Description|
|--------|------------|      
|0|停止系统。运行等级 0 是一个用于快速关闭系统的特殊过渡状态。|
|1|别名为 s 或 S，这个运行等级有时候也称为维护模式。在这个运行等级启动的服务由于发行版不同而不同。通常用于正常系统操作损坏时低级别的系统维护。|
|2|多用户。在 Debian 系统及其衍生版中，这是默认的运行等级，还包括了一个图形化登录（如果有的话）。在基于红帽的系统中，这是没有网络的多用户模式。|
|3|在基于红帽的系统中，这是默认的多用户模式，运行除了图形化环境以外的所有东西。基于 Debian 的系统中通常不会使用这个运行等级以及等级 4 和 5。|
|4|通常默认情况下不使用，可用于自定制。|
|5|基于红帽的系统中，支持 GUI 登录的完全多用户模式。这个运行等级和等级 3 类似，但是有可用的 GUI 登录。|
|6|重启系统。|


要在运行等级之间切换，我们只需要使用 init 命令更改运行等级：init N（其中 N 是上面列出的一个运行等级）。
请注意这并不是运行中的系统切换运行等级的推荐方式，因为它不会给已经登录的用户发送警告（因而导致他们丢失工作以及进程异常终结）。

相反，应该用 shutdown 命令重启系统（它首先发送警告信息给所有已经登录的用户，并锁住任何新的登录；然后再给 init 发送信号切换运行等级）但是，首先要在 /etc/inittab 文件中设置好默认的运行等级（系统引导到的等级）。

因为这个原因，按照下面的步骤切当地切换运行等级。以 root 用户在 /etc/inittab 中查找下面的行。

    id:2:initdefault:

并用你喜欢的文本编辑器，例如 vim（本系列的 [LFCS 系列第二讲：如何安装和使用纯文本编辑器 vi/vim][2]），更改数字 2 为想要的运行等级。

然后，以 root 用户执行

    # shutdown -r now

最后一个命令会重启系统，并使它在下一次引导时进入指定的运行等级，并会执行保存在 /etc/rc[runlevel].d 目录中的脚本以决定应该启动什么服务、不应该启动什么服务。例如，在下面的系统中运行等级 2。

![Change Runlevels in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Change-Runlevels-in-Linux.jpeg)

*在 Linux 中更改运行等级*

#### 使用 chkconfig 管理服务 ####

为了在启动时启动或者停用系统服务，我们可以在 CentOS / openSUSE 中使用 [chkconfig 命令][3]，在 Debian 及其衍生版中使用 sysv-rc-conf 命令。这个工具还能告诉我们对于一个指定的运行等级预先配置的状态是什么。

- 推荐阅读： [如何在 Linux 中停止和停用不想要的服务][4]

列出某个服务的运行等级配置。

    # chkconfig --list [service name]
    # chkconfig --list postfix
    # chkconfig --list mysqld

![Listing Runlevel Configuration](http://www.tecmint.com/wp-content/uploads/2014/10/Listing-Runlevel-Configuration.png)

*列出运行等级配置*

从上图中我们可以看出，当系统进入运行等级 2 到 5 的时候就会启动 postfix，而默认情况下运行等级 2 到 4 时会运行 mysqld。现在假设我们并不希望如此。

例如，我们希望运行等级为 5 时也启动 mysqld，运行等级为 4 或 5 时关闭 postfix。下面分别针对两种情况进行设置（以 root 用户执行以下命令）。

**为特定运行等级启用服务**

    # chkconfig --level [level(s)] service on
    # chkconfig --level 5 mysqld on

**为特定运行等级停用服务**

    # chkconfig --level [level(s)] service off
    # chkconfig --level 45 postfix off

![在 Linux 中启用/停用服务Enable Disable Services in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Enable-Disable-Services.png)

*启用/停用服务*

我们在基于 Debian 的系统中使用 sysv-rc-conf 完成类似任务。

#### 使用 sysv-rc-conf 管理服务 ####

配置服务自动启动时进入指定运行等级，同时禁止启动时进入其它运行等级。

1. 我们可以用下面的命令查看启动 mdadm 时的运行等级。

    	# ls -l /etc/rc[0-6].d | grep -E 'rc[0-6]|mdadm'


	![查看运行中服务的运行等级Check Runlevel of Service Running](http://www.tecmint.com/wp-content/uploads/2014/10/Check-Service-Runlevel.png)

	*查看运行中服务的运行等级*

2. 我们使用 sysv-rc-conf 设置防止 mdadm 在运行等级2 之外的其它等级启动。只需根据需要（你可以使用上下左右按键）选中或取消选中（通过空格键）。

    	# sysv-rc-conf

	![Sysv 运行等级配置SysV Runlevel Config](http://www.tecmint.com/wp-content/uploads/2014/10/SysV-Runlevel-Config.png)

	*Sysv 运行等级配置*

	然后输入 q 退出。

3. 重启系统并从步骤 1 开始再操作一遍。

    	# ls -l /etc/rc[0-6].d | grep -E 'rc[0-6]|mdadm'

	![验证服务运行等级Verify Service Runlevel](http://www.tecmint.com/wp-content/uploads/2014/10/Verify-Service-Runlevel.png)

	*验证服务运行等级*

	从上图中我们可以看出 mdadm 配置为只在运行等级 2 上启动。

### 那关于 systemd 呢？ ###

systemd 是另外一个被多种主流 Linux 发行版采用的服务和系统管理器。它的目标是允许系统启动时多个任务尽可能并行（而 sysvinit 并非如此，sysvinit 一般比较慢，因为它每次只启动一个进程，而且会检查彼此之间是否有依赖，在启动其它服务之前还要等待守护进程启动），充当运行中系统动态资源管理的角色。

因此，服务只在需要的时候启动，而不是系统启动时毫无缘由地启动（为了防止消耗系统资源）。

要查看你系统中运行的原生 systemd 服务和 Sysv 服务，可以用以下的命令。

    # systemctl

![在 Linux 中查看运行中的进程Check All Running Processes in Linux](http://www.tecmint.com/wp-content/uploads/2014/10/Check-All-Running-Processes.png)

*查看运行中的进程*

LOAD 一列显示了单元（UNIT 列，显示服务或者由 systemd 维护的其它进程）是否正确加载，ACTIVE 和 SUB 列则显示了该单元当前的状态。

**显示服务当前状态的信息**

当 ACTIVE 列显示某个单元状态并非活跃时，我们可以使用以下命令查看具体原因。

    # systemctl status [unit]

例如，上图中 media-samba.mount 处于失败状态。我们可以运行：

    # systemctl status media-samba.mount

![查看 Linux 服务状态Check Linux Service Status](http://www.tecmint.com/wp-content/uploads/2014/10/Check-Service-Status.png)

*查看服务状态*

我们可以看到 media-samba.mount 失败的原因是 host dev1 上的挂载进程无法找到 //192.168.0.10/gacanepa 上的共享网络。

### 启动或停止服务 ###

一旦 //192.168.0.10/gacanepa 上的共享网络可用，我们可以再来尝试启动、停止以及重启 media-samba.mount 单元。执行每次操作之后，我们都执行 systemctl stats media-samba.mout 来查看它的状态。

    # systemctl start media-samba.mount
    # systemctl status media-samba.mount
    # systemctl stop media-samba.mount
    # systemctl restart media-samba.mount
    # systemctl status media-samba.mount

![启动停止服务](http://www.tecmint.com/wp-content/uploads/2014/10/Starting-Stoping-Service.jpeg)

*启动停止服务*

**启用或停用某服务随系统启动**

使用 systemd 你可以在系统启动时启用或停用某服务

    # systemctl enable [service] 		# 启用服务
    # systemctl disable [service] 		# 阻止服务随系统启动


启用或停用某服务随系统启动包括在 /etc/systemd/system/multi-user.target.wants 目录添加或者删除符号链接。

![启用或停用服务](http://www.tecmint.com/wp-content/uploads/2014/10/Enabling-Disabling-Services.jpeg)

*启用或停用服务*

你也可以用下面的命令查看某个服务的当前状态（启用或者停用）。

    # systemctl is-enabled [service]

例如，

    # systemctl is-enabled postfix.service

另外，你可以用下面的命令重启或者关闭系统。

    # systemctl reboot
    # systemctl shutdown

### Upstart ###

基于事件的 Upstart 是 /sbin/init 守护进程的替代品，它仅为在需要那些服务的时候启动服务而生，（或者当它们在运行时管理它们），以及处理发生的实践，因此 Upstart 优于基于依赖的 sysvinit 系统。

一开始它是为 Ubuntu 发行版开发的，但在红帽企业版 Linux 6.0 中得到使用。尽管希望它能在所有 Linux 发行版中替代 sysvinit，但它已经被 systemd 超越。2014 年 2 月 14 日，Mark Shuttleworth（Canonical Ltd. 创建者）发布声明之后的 Ubuntu 发行版采用 systemd 作为默认初始化守护进程。

由于 Sysv 启动脚本已经流行很长时间了，很多软件包中都包括了 Sysv 启动脚本。为了兼容这些软件， Upstart 提供了兼容模式：它可以运行保存在常用位置（/etc/rc.d/rc?.d, /etc/init.d/rc?.d, /etc/rc?.d或其它类似的位置）的Sysv 启动脚本。因此，如果我们安装了一个还没有 Upstart 配置脚本的软件，仍然可以用原来的方式启动它。

另外，如果我们还安装了类似 [chkconfig][5] 的工具，你还可以和在基于 sysvinit 的系统中一样用它们管理基于 Sysv 的服务。

Upstart 脚本除了支持 Sysv 启动脚本，还支持基于多种方式启动或者停用服务；例如， Upstart 可以在一个特定硬件设备连接上的时候启动一个服务。

使用 Upstart以及它原生脚本的系统替换了 /etc/inittab 文件和 /etc/init 目录下和运行等级相关的以 .conf 作为后缀的 Sysv 启动脚本目录。

这些 *.conf 脚本（也称为任务定义）通常包括以下几部分：

- 进程描述
- 进程的运行等级或者应该触发它们的事件
- 应该停止进程的运行等级或者触发停止进程的事件
- 选项
- 启动进程的命令

例如，

    # My test service - Upstart script demo description "Here goes the description of 'My test service'" author "Dave Null <dave.null@example.com>"
    # Stanzas

    #
    # Stanzas define when and how a process is started and stopped
    # See a list of stanzas here: http://upstart.ubuntu.com/wiki/Stanzas#respawn
    # When to start the service
    start on runlevel [2345]
    # When to stop the service
    stop on runlevel [016]
    # Automatically restart process in case of crash
    respawn
    # Specify working directory
    chdir /home/dave/myfiles
    # Specify the process/command (add arguments if needed) to run
    exec bash backup.sh arg1 arg2

要使更改生效，你要让 upstart 重新加载它的配置文件。

    # initctl reload-configuration

然后用下面的命令启动你的任务。

    $ sudo start yourjobname

其中 yourjobname 是之前 yourjobname.conf 脚本中添加的任务名称。

关于 Upstart 更完整和详细的介绍可以参考该项目网站的 “[Cookbook][6]” 栏目。 

### 总结 ###

了解 Linux 启动进程对于你进行错误处理、调整计算机系统以及根据需要运行服务非常有用。

在这篇文章中，我们分析了你按下电源键启动机器的一刻到你看到完整的可操作用户界面这段时间发生了什么。我希望你能像我一样把它们放在一起阅读。欢迎在下面留下你的评论或者疑问。我们总是期待听到读者的回复。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-boot-process-and-manage-services/

作者：[Gabriel Cánepa][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/systemd-replaces-init-in-linux/
[2]:https://linux.cn/article-7165-1.html
[3]:http://www.tecmint.com/chkconfig-command-examples/
[4]:http://www.tecmint.com/remove-unwanted-services-from-linux/
[5]:http://www.tecmint.com/chkconfig-command-examples/
[6]:http://upstart.ubuntu.com/cookbook/
