chkservice：在 Linux 终端管理 systemd 单元的工具
================

systemd 意即<ruby>系统守护进程<rt>system daemon</rt></ruby>，是一个新的初始化系统和系统管理工具，它现在非常流行，大部分的 Linux 发行版开始使用这种新的初始化系统。

`systemctl` 是一个 systemd 的工具，它可以帮助我们管理 systemd 守护进程。 它控制系统的启动程序和服务，使用并行化方式，为启动的服务激活套接字和 D-Bus，提供守护进程的按需启动，使用 Linux 控制组跟踪进程，维护挂载和自动挂载点。

此外，它还提供了日志守护进程、用于控制基本系统配置的功能，如主机名、日期、地区、维护已登录用户列表和运行容器和虚拟机、系统帐户、运行时目录和设置，以及管理简单网络配置、网络时间同步、日志转发和名称解析的守护进程。

### 什么是 chkservice

[chkservice][1] 是一个基于 ncurses 的在终端中管理 systemd 单元的工具。它提供了一个非常全面的 systemd 服务的视图，使得它们非常容易修改。

只有拥有超级管理权限才能够改变 systemd 单元的状态和 sysv 系统启动脚本。

### 在 Linux 安装 chkservice

我们可以通过两种方式安装 `chkservice`，通过包安装或者手动安装。

对于 Debian/Ubuntu，使用 [APT-GET 命令][2] 或 [APT 命令][3] 安装 `chkservice`。

```
$ sudo add-apt-repository ppa:linuxenko/chkservice
$ sudo apt-get update
$ sudo apt-get install chkservice
```

对于 Arch Linux 系的系统，使用 [Yaourt 命令][4] 或 [Packer 命令][5] 从 AUR 库安装 `chkservice`。

```
$ yaourt -S chkservice
或
$ packer -S chkservice
```

对于 Fedora，使用 [DNF 命令][6] 安装 `chkservice`。

```
$ sudo dnf copr enable srakitnican/default
$ sudo dnf install chkservice
```

对于 Debian 系系统，使用  [DPKG 命令][7] 安装 `chkservice`。

```
$ wget https://github.com/linuxenko/chkservice/releases/download/0.1/chkservice_0.1.0-amd64.deb
$ sudo dpkg -i chkservice_0.1.0-amd64.deb
```

对于 RPM 系的系统，使用  [DNF 命令][8] 安装 `chkservice`。

```
$ sudo yum install https://github.com/linuxenko/chkservice/releases/download/0.1/chkservice_0.1.0-amd64.rpm
```

### 如何使用 chkservice

只需输入以下命令即可启动 `chkservice` 工具。 输出分为四部分。

  * **第一部分：** 这一部分显示了守护进程的状态，比如可用的 `[X]` 或者不可用的 `[ ]` 或者静态的 `[s]` 或者被掩藏的 `-m-`
  * **第二部分：** 这一部分显示守护进程的状态例如开始 `>` 或者停止 `=`
  * **第三部分：** 这一部分显示单元的名称
  * **第四部分：** 这一部分简短地显示了守护进程的一些信息

```
$ sudo chkservice
```

![][10]

要查看帮助页面，按下 `?`。 这将向您显示管理 systemd 服务的可用选项。

![][11]

选择要启用或禁用的守护进程，然后点击空格键。

![][12]

选择你想开始或停止的守护进程，然后按下 `s`。

![][13]

选择要重新启动的守护进程，然后按下 `r`，之后，您可以在顶部看到更新的提示。

![][14]

按下 `q` 退出。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/chkservice-a-tool-for-managing-systemd-units-from-linux-terminal/

作者：[Ramya Nuvvula][a]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/ramya/
[1]:https://github.com/linuxenko/chkservice
[2]:https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[3]:https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]:https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[5]:https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
[6]:https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[7]:https://www.2daygeek.com/dpkg-command-to-manage-packages-on-debian-ubuntu-linux-mint-systems/
[8]:https://www.2daygeek.com/rpm-command-examples/
[9]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-1.png
[11]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-2.png
[12]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-3.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-4.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/03/chkservice-to-manage-systemd-units-5.png
