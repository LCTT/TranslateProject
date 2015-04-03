systemd-nspawn 快速指南
===========================
我目前已从 chroot（译者注：chroot可以构建类似沙盒的环境，建议各位同学先了解chroot） 迁移到 systemd-nspawn，同时我写了一篇快速指南。简单的说，我强烈建议正在使用 systemd 的用户从 chroot 转为 systemd-nspawn，因为只要你的内核配置正确的话，它几乎没有什么缺点。

想必在各大发行版中的用户对 chroot 都不陌生，而且我猜想 Gentoo 用户要时不时的使用它。

###chroot 面临的挑战

大多数交互环境下，仅运行chroot还不够。通常还要挂载 /proc， /sys，另外为了确保不会出现类似“丢失 ptys”之类的错误，我们还得 bind（译者注：bind 是 mount 的一个选项） 挂载 /dev。如果你使用 tmpfs，你可能想要以 tmpfs 类型挂载新的 tmp、 var/tmp。接下来你可能还想将其他的挂载点 bind 到 chroot 中。这些都不是特别难，但是一般情况下要写一个脚本来管理它。

现在我按照日常计划执行备份操作，当然有一些不必备份的数据如 tmp 目录，或任何 bind 挂载的内容。当我配置了一个新的 chroot 后就意味着我要更新我的备份配置了，但我经常忘记这点，因为大多数时间里 chroot 挂载点并没有运行。当这些挂载点仍然存在的情况下执行备份的话，那么备份中会多出很多不需要的内容。

当 bind 挂载点包含其他挂载点时（比如挂载时使用 -rbind 选项），这种情况下 systemd 的默认处理方式略有不同。在 bind 挂载中卸载一些东西时，systemd 会将处于 bind 另一边的目录也卸载掉。想像一下，如果我卸载了 chroot 中以 bind 挂载 /dev 的某个目录后，发现主机上的 /dev/pts 与 /dev/shm 也不见了，我肯定会很吃惊。不过好像有其他方法可以避免，但是这不是我们此次讨论的重点。

### Systemd-nspawn 优点

Systemd-nspawn 用于启动一个容器，并且它的最简模式就可以像 chroot 那样运行。默认情况下，它自动配置容器所需的开销如 /dev, /tmp 等等。通过配合一些选项它也可配置其他的 bind 挂载点。当容器退出后，所有的挂载点都会被清除。

容器运行时，从外部看上去没什么变化。事实上，可以从同一个 chroot 产生5个不同的 systemd-nspawn 容器实例，并且除了文件系统（不包括 /dev, /tmp等，只有 /usr,/etc 的改变会传递）外它们之间没有任何联系。你的备份将会忽略 bind 挂载点、tmpfs 及任何挂载在容器中的内容。

它同时具有其它优秀容器的优点，比如 containment - 可以杀死容器内的所有活动但不影响外部，等等。它的安全性并不是无懈可击的-它的作用仅仅是防止意外的错误。

如果你使用的是兼容的 sysvinit（它包含了 systemd，openrc），你可以启动容器。这意味着，你可以在容器中使用 fstab 添加挂载点，运行守护进程等。只需要一个 chroot 的开销，几乎就可以获得虚拟化的所有好处（不需要构建内核等）。在一个看起来像 chroot 的容器中运行systemctl poweroff 看起来很奇怪，但这条命令能够起作用。

注意，如果不做额外配置的话那么容器就会共享主机的网络，所以主机上的容器不要运行 sshd。运行一个分离的网络 namespace 不是太难，为了新的实例可以使用DHCP，分离之后记得绑定接口。

###操作步骤

让它工作起来是此次讨论中最简短的部分了。

首先系统内核要支持 namespaces 与 devpts：

    CONFIG_UTS_NS=y
    CONFIG_IPC_NS=y
    CONFIG_USER_NS=y
    CONFIG_PID_NS=y
    CONFIG_NET_NS=y
    CONFIG_DEVPTS_MULTIPLE_INSTANCES=y

像 chroot 那样启动 namespace 是非常简单的：

	systemd-nspawn -D .

也可以像 chroot 那样退出。在内部可以运行 mount 并且可以看到默认它已将 /dev 与 /tmp 准备好了。 ”.“就是 chroot 的路径，也就是当前路径。在它内部运行的是 bash。

如果要添加一些 bind 挂载点也非常简便：

	systemd-nspawn -D . --bind /usr/portage

现在，容器中的 /usr/portage 就与主机的对应目录绑定起来了，我们无需 sync /etc。如果想要绑定到指定的路径，只要在原路径后添加 ”:dest“，相当于 chroot 的 root（--bind foo 与 --bind foo:foo是一样的）。

如果容器具有 init 功能并且可以在内部运行，可以通过添加 -b 选项启动它：

	systemd-nspawn -D . --bind /usr/portage -b

可以观察到 init 的运作。关闭容器会自动退出。

如果容器内运行了 systemd ，你可以使用 -h 选项将它的日志重定向到主机的systemd日志：

	systemd-nspawn -D . --bind /usr/portage -j -b

使用 nspawn 注册容器以便它能够在 machinectl 中显示。如此可以方便的在主机上对它进行操作，如启动新的 getty， ssh 连接，关机等。

如果你正在使用 systemd 那么甩开 chroot 拥抱 nspawn 吧。

---------------------

via: http://rich0gentoo.wordpress.com/2014/07/14/quick-systemd-nspawn-guide/

作者：[rich0][a]
译者：[SPccman](https://github.com/SPccman)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://rich0gentoo.wordpress.com/

