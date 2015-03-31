介绍 Linux 的命名空间
================================================================================
### 背景 ###

从Linux 2.6.24版的内核开始，Linux 就支持6种不同类型的命名空间。它们的出现，使用户创建的进程能够与系统分离得更加彻底，从而不需要使用更多的底层虚拟化技术。

- **CLONE_NEWIPC**: 进程间通信(IPC)的命名空间，可以将 SystemV 的 IPC 和 POSIX 的消息队列独立出来。
- **CLONE_NEWPID**: PID 命名空间。空间内的PID 是独立分配的，意思就是命名空间内的虚拟 PID 可能会与命名空间外的 PID 相冲突，于是命名空间内的 PID 映射到命名空间外时会使用另外一个 PID。比如说，命名空间内第一个 PID 为1，而在命名空间外就是该 PID 已被 init 进程所使用。
- **CLONE_NEWNET**: 网络命名空间，用于隔离网络资源（/proc/net、IP 地址、网卡、路由等）。后台进程可以运行在不同命名空间内的相同端口上，用户还可以虚拟出一块网卡。
- **CLONE_NEWNS**: 挂载命名空间，进程运行时可以将挂载点与系统分离，使用这个功能时，我们可以达到 chroot 的功能，而在安全性方面比 chroot 更高。
- **CLONE_NEWUTS**: UTS 命名空间，主要目的是独立出主机名和网络信息服务（NIS）。
- **CLONE_NEWUSER**: 用户命名空间，同进程 ID 一样，用户 ID 和组 ID 在命名空间内外是不一样的，并且在不同命名空间内可以存在相同的 ID。

下面我们介绍一下进程命名空间和网络命名空间。

### 进程命名空间

本文用 C 语言介绍上述概念，因为演示进程命名空间的时候需要用到 C 语言。下面的测试过程在 Debian 6 和 Debian 7 上执行。首先，在栈内分配一页内存空间，并将指针指向内存页的末尾。这里我们使用 **alloca()** 函数来分配内存，不要用 malloc() 函数，它会把内存分配在堆上。

    void *mem = alloca(sysconf(_SC_PAGESIZE)) + sysconf(_SC_PAGESIZE);

然后使用 **clone()** 函数创建子进程，传入我们的子栈空间地址 "mem"，并指定命名空间的标记。同时我们还指定“callee”作为子进程运行的函数。

    mypid = clone(callee, mem, SIGCHLD | CLONE_NEWIPC | CLONE_NEWPID | CLONE_NEWNS | CLONE_FILES, NULL);

**clone** 之后我们要在父进程中等待子进程先退出，否则的话，父进程会继续运行下去，并马上进程结束，留下子进程变成孤儿进程：

    while (waitpid(mypid, &r, 0) < 0 && errno == EINTR)
    {
    	continue;
    }

最后当子进程退出后，我们会回到 shell 界面，并返回子进程的退出码。

    if (WIFEXITED(r))
    {
    	return WEXITSTATUS(r);
    }
    return EXIT_FAILURE;

上文介绍的 **callee** 函数功能如下：

    static int callee()
    {
    	int ret;
    	mount("proc", "/proc", "proc", 0, "");
    	setgid(u);
    	setgroups(0, NULL);
    	setuid(u);
    	ret = execl("/bin/bash", "/bin/bash", NULL);
    	return ret;
    }

程序挂载了 **/proc** 文件系统，设置用户 ID 和组 ID，值都为“u”，然后运行 **/bin/bash** 程序，[LXC][1] 是一个操作系统级的虚拟化工具，使用 cgroups 和命名空间来完成资源的分离。现在我们把所有代码放在一起，变量“u”的值设为65534，在 Debian 系统中，这是“nobody”和“nogroup”：

    #define _GNU_SOURCE
    #include <unistd.h>
    #include <stdio.h>
    #include <stdlib.h>
    #include <sys/types.h>
    #include <sys/wait.h>
    #include <sys/mount.h>
    #include <grp.h>
    #include <alloca.h>
    #include <errno.h>
    #include <sched.h>
    static int callee();
    const int u = 65534;
    int main(int argc, char *argv[])
    {
    	int r;
    	pid_t mypid;
    	void *mem = alloca(sysconf(_SC_PAGESIZE)) + sysconf(_SC_PAGESIZE);
    	mypid = clone(callee, mem, SIGCHLD | CLONE_NEWIPC | CLONE_NEWPID | CLONE_NEWNS | CLONE_FILES, NULL);
    	while (waitpid(mypid, &r, 0) < 0 && errno == EINTR)
    	{
    		continue;
    	}
    	if (WIFEXITED(r))
    	{
    		return WEXITSTATUS(r);
    	}
    	return EXIT_FAILURE;
    }
    static int callee()
    {
    	int ret;
    	mount("proc", "/proc", "proc", 0, "");
    	setgid(u);
    	setgroups(0, NULL);
    	setuid(u);
    	ret = execl("/bin/bash", "/bin/bash", NULL);
    	return ret;
    }

执行以下命令来运行上面的代码：

    root@w:~/pen/tmp# gcc -O -o ns.c -Wall -Werror -ansi -c89 ns.c
    root@w:~/pen/tmp# ./ns
    nobody@w:~/pen/tmp$ id
    uid=65534(nobody) gid=65534(nogroup)
    nobody@w:~/pen/tmp$ ps auxw
    USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
    nobody       1  0.0  0.0   4620  1816 pts/1    S    21:21   0:00 /bin/bash
    nobody       5  0.0  0.0   2784  1064 pts/1    R+   21:21   0:00 ps auxw
    nobody@w:~/pen/tmp$ 

注意上面的结果，UID 和 GID 被设置成 nobody 和 nogroup 了，特别是 ps 工具只输出两个进程，它们的 ID 分别是1和5（LCTT注：这就是上文介绍 CLONE_NEWPID 时提到的功能，在线程所在的命名空间内，进程 ID 可以为1，映射到命名空间外是另外一个 PID；而命名空间外的 ID 为1的进程一直是 init）。

### 网络命名空间

接下来轮到使用 ip netns 来设置网络的命名空间。第一步先确定当前系统没有命名空间：

    root@w:~# ip netns list
    Object "netns" is unknown, try "ip help".

如果报了上述错误，你需要更新你的系统内核，以及 ip 工具程序。这里假设你的内核版高于2.6.24，ip 工具版本也差不多，高于2.6.24（LCTT注：ip 工具由 iproute 安装包提供，此安装包版本与内核版本相近）。更新好后，**ip netns list** 在没有命名空间存在的情况下不会输出任务信息。加个名为“ns1”的命名空间看看：

    root@w:~# ip netns add ns1
    root@w:~# ip netns list
    ns1

列出网卡：

    root@w:~# ip link list
    1: lo:  mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    2: eth0:  mtu 1500 qdisc pfifo_fast state UNKNOWN mode DEFAULT qlen 1000
        link/ether 00:0c:29:65:25:9e brd ff:ff:ff:ff:ff:ff

创建新的虚拟网卡，并加到命名空间。虚拟网卡需要成对创建，互相关联——就像交叉电缆一样：

    root@w:~# ip link add veth0 type veth peer name veth1
    root@w:~# ip link list
    1: lo:  mtu 65536 qdisc noqueue state UNKNOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    2: eth0:  mtu 1500 qdisc pfifo_fast state UNKNOWN mode DEFAULT qlen 1000
        link/ether 00:0c:29:65:25:9e brd ff:ff:ff:ff:ff:ff
    3: veth1:  mtu 1500 qdisc noop state DOWN mode DEFAULT qlen 1000
        link/ether d2:e9:52:18:19:ab brd ff:ff:ff:ff:ff:ff
    4: veth0:  mtu 1500 qdisc noop state DOWN mode DEFAULT qlen 1000
        link/ether f2:f7:5e:e2:22:ac brd ff:ff:ff:ff:ff:ff

这个时候 **ifconfig** -a 命令也能显示新添加的 veth0 和 veth1 两块网卡。

很好，现在将这两份块网卡加到命名空间中去。注意一下，下面的 ip **netns exec** 命令用于将后面的命令在命名空间中执行（LCTT注：下面的结果显示了在 ns1 这个网络命名空间中，只存在 lo 和 veth1 两块网卡）：

    root@w:~# ip link set veth1 netns ns1
    root@w:~# ip netns exec ns1 ip link list
    1: lo:  mtu 65536 qdisc noop state DOWN mode DEFAULT 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    3: veth1:  mtu 1500 qdisc noop state DOWN mode DEFAULT qlen 1000
    link/ether d2:e9:52:18:19:ab brd ff:ff:ff:ff:ff:ff

这个时候 **ifconfig** -a 命令只能显示 veth0，不能显示 veth1，因为后者现在在 ns1 命名空间中。

如果想删除 veth0/veth1，可以执行下面的命令：

    ip netns exec ns1 ip link del veth1

我们可以为 veth0 分配 IP 地址：

    ifconfig veth0 192.168.5.5/24

在命名空间内为 veth1 分配 IP 地址：

    ip netns exec ns1 ifconfig veth1 192.168.5.10/24 up

在命名空间内外执行 ip addr **list** 命令：

    root@w:~# ip addr list
    1: lo:  mtu 65536 qdisc noqueue state UNKNOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
        inet 127.0.0.1/8 scope host lo
        inet6 ::1/128 scope host 
           valid_lft forever preferred_lft forever
    2: eth0:  mtu 1500 qdisc pfifo_fast state UNKNOWN qlen 1000
        link/ether 00:0c:29:65:25:9e brd ff:ff:ff:ff:ff:ff
        inet 192.168.3.122/24 brd 192.168.3.255 scope global eth0
        inet6 fe80::20c:29ff:fe65:259e/64 scope link 
           valid_lft forever preferred_lft forever
    6: veth0:  mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 86:b2:c7:bd:c9:11 brd ff:ff:ff:ff:ff:ff
        inet 192.168.5.5/24 brd 192.168.5.255 scope global veth0
        inet6 fe80::84b2:c7ff:febd:c911/64 scope link 
           valid_lft forever preferred_lft forever
    root@w:~# ip netns exec ns1 ip addr list
    1: lo:  mtu 65536 qdisc noop state DOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    5: veth1:  mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 12:bd:b6:76:a6:eb brd ff:ff:ff:ff:ff:ff
        inet 192.168.5.10/24 brd 192.168.5.255 scope global veth1
        inet6 fe80::10bd:b6ff:fe76:a6eb/64 scope link 
           valid_lft forever preferred_lft forever

在命名空间内外查看路由表：

    root@w:~# ip route list
    default via 192.168.3.1 dev eth0  proto static 
    192.168.3.0/24 dev eth0  proto kernel  scope link  src 192.168.3.122 
    192.168.5.0/24 dev veth0  proto kernel  scope link  src 192.168.5.5 
    root@w:~# ip netns exec ns1 ip route list
    192.168.5.0/24 dev veth1  proto kernel  scope link  src 192.168.5.10 

最后，将虚拟网卡连到物理网卡上，我们需要用到桥接。这里做的是将 veth0 桥接到 eth0，而 ns1 命名空间内则使用 DHCP 自动获取 IP 地址：

    root@w:~# brctl addbr br0
    root@w:~# brctl addif br0 eth0
    root@w:~# brctl addif br0 veth0
    root@w:~# ifconfig eth0 0.0.0.0
    root@w:~# ifconfig veth0 0.0.0.0
    root@w:~# dhclient br0
    root@w:~# ip addr list br0
    7: br0:  mtu 1500 qdisc noqueue state UP 
        link/ether 00:0c:29:65:25:9e brd ff:ff:ff:ff:ff:ff
        inet 192.168.3.122/24 brd 192.168.3.255 scope global br0
        inet6 fe80::20c:29ff:fe65:259e/64 scope link 
           valid_lft forever preferred_lft forever

为网桥 br0 分配的 IP 地址为192.168.3.122/24。接下来为命名空间分配地址：

    root@w:~# ip netns exec ns1 dhclient veth1
    root@w:~# ip netns exec ns1 ip addr list
    1: lo:  mtu 65536 qdisc noop state DOWN 
        link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    5: veth1:  mtu 1500 qdisc pfifo_fast state UP qlen 1000
        link/ether 12:bd:b6:76:a6:eb brd ff:ff:ff:ff:ff:ff
        inet 192.168.3.248/24 brd 192.168.3.255 scope global veth1
        inet6 fe80::10bd:b6ff:fe76:a6eb/64 scope link 
           valid_lft forever preferred_lft forever

现在， veth1 的 IP 被设置成 192.168.3.248/24 了。

--------------------------------------------------------------------------------

via: http://www.howtoforge.com/linux-namespaces

作者：[aziods][a]
译者：[bazz2](https://github.com/bazz2)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.howtoforge.com/forums/private.php?do=newpm&u=138952
[1]:http://en.wikipedia.org/wiki/LXC


