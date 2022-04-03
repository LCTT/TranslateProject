[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14319-1.html)
[#]: subject: (Secure your containers with SELinux)
[#]: via: (https://opensource.com/article/20/11/selinux-containers)
[#]: author: (Mike Calizo https://opensource.com/users/mcalizo)

用 SELinux 保护你的容器
======

> 黑掉你的系统，了解为什么配置 SELinux 作为你的第一道容器防线是很重要的。

![](https://img.linux.net.cn/data/attachment/album/202203/02/093614t53cfb857841qzzk.jpg)

当有些事情在你的 Linux 环境中不能正常工作时，最简单的方法就是禁用<ruby>安全增强型 Linux<rt>Security-Enhanced Linux</rt></ruby>（[SELinux][2]）。而当它突然可以工作了，你就会忘记了禁用这件事 —— 这是一个常见的陷阱，意味着你已经失去了一个非常强大的安全工具。

随着容器、微服务和分布式架构的兴起，威胁也在上升。这是由于一个老的、众所周知的问题：速度。容器的优势在于它们能让你快速行动，做更多的事情，并迅速改变。这意味着容器的采用已经飞速发展，但它所提供的速度也意味着你会遇到更多的问题和漏洞。当你越来越快地做更多的事情时，这自然会发生。

### 如何减轻威胁

正如孙子所说，“不战而屈人之兵”。当涉及到容器的基本防御时，这句话真的很有共鸣。为了避免问题（战斗），确保你的容器主机是安全的，你可以使用 SELinux 作为你的第一道防线。

SELinux 是一个开源项目，于 2000 年发布，2003 年集成到 Linux 内核中。根据 [红帽公司的解释][3]，“SELinux 是 [Linux 系统][4] 的一个安全架构，允许管理员对谁可以访问系统有更多的控制。它最初是由美国国家安全局（NSA）开发的，是使用 Linux 安全模块（LSM）对 [Linux 内核][5] 的一系列补丁。”

### 开始吧

当你想到容器时，首先想到的可能是 [Docker][6]。Docker 在 2013 年出现后掀起了一场容器采用革命。它是容器爆炸性流行的主要原因之一，但如上所述，大量采用增加了用户对安全风险的脆弱性。

在你用 SELinux 保护你的 Docker 容器之前，你需要设置一些东西。

#### 前置条件

  * 安装并配置了 CentOS 8/RHEL 8。
  * 安装并配置好 Docker CE
  * 创建两个账户：root 和 非 root 用户（下面的例子中是 `mcalizo`）。

如果你需要在你的 RHEL 8/CentOS 8 服务器上设置 Docker，你可以按照这些 [说明][7]。如果你运行的是 RHEL 8，你需要在开始之前删除预装的 Podman 和 runc 包。

首先，确保 SELinux 被启用：

```
[mcalizo@Rhel82 ~]$ sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Memory protection checking:     actual (secure)
Max kernel policy version:      31
[mcalizo@Rhel82 ~]$
```

然后，验证你的操作系统版本和 Docker 正在运行。以 root 身份登录并运行：

```
[root@rhel82 ~]# cat /etc/redhat-release
Red Hat Enterprise Linux release 8.2 (Ootpa)
[root@rhel82 ~]#

[root@rhel82 ~]# systemctl status docker
● docker.service - Docker Application Container Engine
   Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
   Active: active (running) since Wed 2020-10-28 19:10:14 EDT; 15s ago
     Docs: https://docs.docker.com
 Main PID: 30768 (dockerd)
    Tasks: 8
   Memory: 39.0M
   CGroup: /system.slice/docker.service
           └─30768 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Oct 28 19:10:13 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:13.889602941-04:00" level=error msg=">
Oct 28 19:10:13 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:13.903413613-04:00" level=warning msg>
Oct 28 19:10:13 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:13.903427451-04:00" level=warning msg>
Oct 28 19:10:13 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:13.903538271-04:00" level=info msg="L>
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.132060506-04:00" level=info msg="D>
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.308943088-04:00" level=info msg="L>
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.319438549-04:00" level=info msg="D>
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.319570298-04:00" level=info msg="D>
Oct 28 19:10:14 rhel82.home.labs.com dockerd[30768]: time="2020-10-28T19:10:14.333419209-04:00" level=info msg="A>
Oct 28 19:10:14 rhel82.home.labs.com systemd[1]: Started Docker Application Container Engine
```

检查你的 Docker 版本：

```
[root@rhel82 ~]# docker --version
Docker version 19.03.13, build 4484c46d9d
```

### 黑掉主机

了解一个问题的最好方法之一就是去体验它。因此，我将告诉你，如果你的安全设置不当，向 Docker 主机注入恶意代码是多么容易。

为了能够在 Docker 主机上做坏事，“恶意”的非 root 用户（本教程中为 `mcalizo`）必须是可以实例化 Docker 容器的组的成员。

首先，确认 `mcalizo` 用户属于哪个组：

```
[root@Rhel82 ~]# groups mcalizo
mcalizo : mcalizo
```

输出显示，`mcalizo` 只属于它自己的组。这意味着 `mcalizo` 不能实例化 Docker 容器，如果它试图这样做，将会得到这个错误：

```
[mcalizo@Rhel82 ~]$ docker run -it --rm centos:latest /bin/sh
docker: Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/create: dial unix /var/run/docker.sock: connect: permission denied.
See 'docker run --help'.
```

要允许 `mcalizo` 实例化容器，将用户加入 `docker` 组：

```
[root@Rhel82 ~]# usermod -G docker -a mcalizo
[root@Rhel82 ~]# groups mcalizo
mcalizo : mcalizo docker
```

接下来，部署一个 `fedora:latest` 的容器，并登录到实例化的容器中去探索它：

```
[mcalizo@Rhel82 ~]$ docker run -it --rm fedora:latest /bin/sh
Unable to find image 'fedora:latest' locally
latest: Pulling from library/fedora
ee7e89337106: Pull complete
Digest: sha256:b9ec86d36fca7b1d3de39cd7c258e8d90c377d312c21a7748071ce49069b8db4
Status: Downloaded newer image for fedora:latest
sh-5.0# cat /etc/redhat-release
Fedora release 33 (Thirty Three)
```

当你登录到新创建的容器时，你可以看到你是以 root 身份自动登录的：

```
sh-5.0# whoami
root
sh-5.0#
```

作为 `root` 用户，你可以在这个容器中做任何事情，这意味着你可以利用容器主机，做很多破坏。因为你可以实例化一个容器，即使你不属于主机的 sudoers 账户，你也可以对主机做一些事情。

退出你刚刚创建的容器，并创建一个新的容器来演示这个漏洞：

```
[mcalizo@Rhel82 ~]$ docker run -it --rm -v /:/exploit fedora:latest /bin/bash
[root@131043f2e306 /]#
```

[-v 选项][8] 将 Docker 主机的 `/` 目录挂载到 `/exploit` 目录下的容器：

```
[root@131043f2e306 /]#ls exploit/
bin  boot  dev  etc  home  lib  lib64  media  mnt  opt  proc  root  run  sbin  srv  sys  tmp  usr  var
```

因为它已被挂载，你可以在 Docker 主机上做任何事情。例如，你可以删除文件、编辑特定的配置来破害系统，甚至安装木马程序或其他恶意软件来窃取重要信息。

### 为什么会发生这种情况？

你可能想知道，既然 SELinux 处于强制模式，为什么会出现这种情况？深入挖掘 SELinux，看看哪里出了问题。

验证 SELinux 是否有一个 [Docker 上下文][9]：

```
[mcalizo@Rhel82 ~]$ ps -eZ | grep docker
system_u:system_r:container_runtime_t:s0 30768 ? 00:00:04 dockerd
[mcalizo@Rhel82 ~]$
```

正如预期的那样，它确实有。这意味着 SELinux 管理着 Docker 守护进程。检查 Docker 守护进程，看看 SELinux 是否默认启用：

```
[mcalizo@Rhel82 ~]$ docker info | grep Security -A3
 Security Options:
  seccomp
   Profile: default
 Kernel Version: 4.18.0-193.el8.x86_64
```

Docker 守护进程中的 SELinux 在默认情况下是 **不启用** 的。 这就是问题所在！要解决这个问题，按 [文档][10] 说明，通过更新或创建文件 `/etc/docker/daemon.json` 来启用 SELinux 来控制和管理 Docker（你必须有 root 权限才能这样做）：

```
[root@Rhel82 ~]# cat /etc/docker/daemon.json
{
  "selinux-enabled": true
}
[root@Rhel82 ~]#
[root@Rhel82 ~]# systemctl restart docker
```

在创建或更新该文件并重启 Docker 后，你应该看到 Docker 守护进程中启用了 SELinux 支持：

```
[root@Rhel82 ~]# systemctl restart docker
[mcalizo@Rhel82 root]$ docker info | grep Security -A3
 Security Options:
  seccomp
   Profile: default
  selinux
[mcalizo@Rhel82 root]$
```

虽然仍然可以在你的 Docker 容器上挂载 Docker 主机中的特定文件系统，但不再允许更新或访问该文件：

```
[mcalizo@Rhel82 root]$ docker run -it --rm -v /:/exploit fedora:latest /bin/bash
[root@ecb5836da1f6 /]# touch /exploit/etc/shadow.sh
touch: cannot touch '/exploit/etc/shadow.sh': Permission denied
[root@ecb5836da1f6 /]#
```

### 了解更多

你在容器世界中的第一道防线取决于你对容器主机的操作系统的设置有多强。有许多方法可以实现 Linux 的安全性，包括市场上可供选择的方案，以增强你的安全态势。

SELinux 是一个额外的安全层，默认情况下内置于 [Linux 发行版][11] 中。为了借助它保护你的系统不被破坏，请确保 SELinux 保持开启状态。

如果你想了解更多，请参阅：

  * [如何在 CentOS 8 / RH 上安装 Docker CE][7]
  * [Docker 安全速查表][12]
  * [dockerd 文档][10]
  * [卷的使用文档][8]
  * [什么是 SELinux？][3]

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/11/selinux-containers

作者：[Mike Calizo][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mcalizo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/EDU_UnspokenBlockers_1110_A.png?itok=x8A9mqVA (Three closed doors)
[2]: https://en.wikipedia.org/wiki/Security-Enhanced_Linux
[3]: https://www.redhat.com/en/topics/linux/what-is-selinux
[4]: https://www.redhat.com/en/topics/linux/what-is-linux
[5]: https://www.redhat.com/en/topics/linux/what-is-the-linux-kernel
[6]: https://opensource.com/resources/what-docker
[7]: https://www.linuxtechi.com/install-docker-ce-centos-8-rhel-8/
[8]: https://docs.docker.com/storage/volumes/
[9]: https://docs.docker.com/engine/reference/commandline/context/
[10]: https://docs.docker.com/engine/reference/commandline/dockerd/
[11]: https://www.redhat.com/en/topics/linux/whats-the-best-linux-distro-for-you
[12]: https://cheatsheetseries.owasp.org/cheatsheets/Docker_Security_Cheat_Sheet.html
