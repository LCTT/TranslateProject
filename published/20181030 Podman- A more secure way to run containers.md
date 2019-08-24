Podman：一个更安全的运行容器的方式
======

> Podman 使用传统的 fork/exec 模型（相对于客户端/服务器模型）来运行容器。

![](https://img.linux.net.cn/data/attachment/album/201908/23/234924m55sn8zt3b5q8815.jpg)

在进入本文的主要主题 [Podman][1] 和容器之前，我需要了解一点 Linux 审计功能的技术。

### 什么是审计？

Linux 内核有一个有趣的安全功能，叫做**审计**。它允许管理员在系统上监视安全事件，并将它们记录到`audit.log` 中，该文件可以本地存储或远程存储在另一台机器上，以防止黑客试图掩盖他的踪迹。

`/etc/shadow` 文件是一个经常要监控的安全文件，因为向其添加记录可能允许攻击者获得对系统的访问权限。管理员想知道是否有任何进程修改了该文件，你可以通过执行以下命令来执行此操作：

```
# auditctl -w /etc/shadow
```

现在让我们看看当我修改了 `/etc/shadow` 文件会发生什么：

```
# touch /etc/shadow 
# ausearch -f /etc/shadow -i -ts recent

type=PROCTITLE msg=audit(10/10/2018 09:46:03.042:4108) : proctitle=touch /etc/shadow type=SYSCALL msg=audit(10/10/2018 09:46:03.042:4108) : arch=x86_64 syscall=openat success=yes exit=3 a0=0xffffff9c a1=0x7ffdb17f6704 a2=O_WRONLY|O_CREAT|O_NOCTTY| O_NONBLOCK a3=0x1b6 items=2 ppid=2712 pid=3727 auid=dwalsh uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=pts1 ses=3 comm=touch exe=/usr/bin/touch subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 key=(null)`
```

审计记录中有很多信息，但我重点注意到它记录了 root 修改了 `/etc/shadow` 文件，并且该进程的审计 UID（`auid`）的所有者是 `dwalsh`。

内核修改了这个文件了么？

#### 跟踪登录 UID

登录 UID（`loginuid`），存储在 `/proc/self/loginuid` 中，它是系统上每个进程的 proc 结构的一部分。该字段只能设置一次；设置后，内核将不允许任何进程重置它。

当我登录系统时，登录程序会为我的登录过程设置 `loginuid` 字段。

我（`dwalsh`）的 UID 是 3267。

```
$ cat /proc/self/loginuid
3267
```

现在，即使我变成了 root，我的登录 UID 仍将保持不变。

```
$ sudo cat /proc/self/loginuid
3267
```

请注意，从初始登录过程 fork 并 exec 的每个进程都会自动继承 `loginuid`。这就是内核知道登录的人是 `dwalsh` 的方式。

### 容器

现在让我们来看看容器。

```
sudo podman run fedora cat /proc/self/loginuid
3267
```

甚至容器进程也保留了我的 `loginuid`。 现在让我们用 Docker 试试。

```
sudo docker run fedora cat /proc/self/loginuid 
4294967295
```

### 为什么不一样？

Podman 对于容器使用传统的 fork/exec 模型，因此容器进程是 Podman 进程的后代。Docker 使用客户端/服务器模型。我执行的 `docker` 命令是 Docker 客户端工具，它通过客户端/服务器操作与 Docker 守护进程通信。然后 Docker 守护程序创建容器并处理 stdin/stdout 与 Docker 客户端工具的通信。

进程的默认 `loginuid`（在设置 `loginuid` 之前）是 `4294967295`（LCTT 译注：2^32 - 1）。由于容器是 Docker 守护程序的后代，而 Docker 守护程序是 init 系统的子代，所以，我们看到 systemd、Docker 守护程序和容器进程全部具有相同的 `loginuid`：`4294967295`，审计系统视其为未设置审计 UID。

```
cat /proc/1/loginuid 
4294967295
```

### 怎么会被滥用？

让我们来看看如果 Docker 启动的容器进程修改 `/etc/shadow` 文件会发生什么。

```
$ sudo docker run --privileged -v /:/host fedora touch /host/etc/shadow 
$ sudo ausearch -f /etc/shadow -i type=PROCTITLE msg=audit(10/10/2018 10:27:20.055:4569) : proctitle=/usr/bin/coreutils --coreutils-prog-shebang=touch /usr/bin/touch /host/etc/shadow type=SYSCALL msg=audit(10/10/2018 10:27:20.055:4569) : arch=x86_64 syscall=openat success=yes exit=3 a0=0xffffff9c a1=0x7ffdb6973f50 a2=O_WRONLY|O_CREAT|O_NOCTTY| O_NONBLOCK a3=0x1b6 items=2 ppid=11863 pid=11882 auid=unset uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=unset comm=touch exe=/usr/bin/coreutils subj=system_u:system_r:spc_t:s0 key=(null)
```

在 Docker 情形中，`auid` 是未设置的（`4294967295`）；这意味着安全人员可能知道有进程修改了 `/etc/shadow` 文件但身份丢失了。

如果该攻击者随后删除了 Docker 容器，那么在系统上谁修改 `/etc/shadow` 文件将没有任何跟踪信息。

现在让我们看看相同的场景在 Podman 下的情况。

```
$ sudo podman run --privileged -v /:/host fedora touch /host/etc/shadow 
$ sudo ausearch -f /etc/shadow -i type=PROCTITLE msg=audit(10/10/2018 10:23:41.659:4530) : proctitle=/usr/bin/coreutils --coreutils-prog-shebang=touch /usr/bin/touch /host/etc/shadow type=SYSCALL msg=audit(10/10/2018 10:23:41.659:4530) : arch=x86_64 syscall=openat success=yes exit=3 a0=0xffffff9c a1=0x7fffdffd0f34 a2=O_WRONLY|O_CREAT|O_NOCTTY| O_NONBLOCK a3=0x1b6 items=2 ppid=11671 pid=11683 auid=dwalsh uid=root gid=root euid=root suid=root fsuid=root egid=root sgid=root fsgid=root tty=(none) ses=3 comm=touch exe=/usr/bin/coreutils subj=unconfined_u:system_r:spc_t:s0 key=(null)
```

由于它使用传统的 fork/exec 方式，因此 Podman 正确记录了所有内容。

这只是观察 `/etc/shadow` 文件的一个简单示例，但审计系统对于观察系统上的进程非常有用。使用 fork/exec 容器运行时（而不是客户端/服务器容器运行时）来启动容器允许你通过审计日志记录保持更好的安全性。

### 最后的想法

在启动容器时，与客户端/服务器模型相比，fork/exec 模型还有许多其他不错的功能。例如，systemd 功能包括：

* `SD_NOTIFY`：如果将 Podman 命令放入 systemd 单元文件中，容器进程可以通过 Podman 返回通知，表明服务已准备好接收任务。这是在客户端/服务器模式下无法完成的事情。
* 套接字激活：你可以将连接的套接字从 systemd 传递到 Podman，并传递到容器进程以便使用它们。这在客户端/服务器模型中是不可能的。

在我看来，其最好的功能是**作为非 root 用户运行 Podman 和容器**。这意味着你永远不会在宿主机上授予用户 root 权限，而在客户端/服务器模型中（如 Docker 使用的），你必须打开以 root 身份运行的特权守护程序的套接字来启动容器。在那里，你将受到守护程序中实现的安全机制与宿主机操作系统中实现的安全机制的支配 —— 这是一个危险的主张。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/podman-more-secure-way-run-containers

作者：[Daniel J Walsh][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rhatdan
[b]: https://github.com/lujun9972
[1]: https://podman.io
