# chkservice -Linux终端管理系统单元的工具

systemd 即系统守护进程是一个新的初始化系统和系统管理工具，这个 systemd 非常流行，大部分的 Linux 发行版开始使用这种新的初始化系统。

Systemctl 是一个 systemd 的工具，它可以帮助我们管理 systemd 守护进程。 它控制系统启动和服务，使用并行化方式，套接字和 D-Bus 激活启动服务，提供按需启动守护进程，使用 Linux 控制组跟踪进程，维护挂载和自动挂载点。

此外，它还提供了守护进程日志、用于控制基本系统配置如主机名、日期、地区、维护登录用户列表和运行容器和虚拟机、系统帐户、运行时目录和设置，以及守护进程来管理简单的网络配置、网络时间同步、日志转发和名称解析。

### 什么是 chkservice

[chkservice][1] 是一个基于 ncurses 的在终端中管理系统资源的工具。它提供了一个非常全面的系统资源视图，可以使它们非常容易修改。

只有拥有超级管理权限才能够改变系统资源状态和系统启动脚本。

### 在 Linux 安装 chkservice

我们可以通过两种方式安装 chkservice，通过包安装或者手动安装。

对于 `Debian/Ubuntu`，使用 [APT-GET Command][2] 或 [APT Command][3] 安装 chkservice.

```
$ sudo add-apt-repository ppa:linuxenko/chkservice
$ sudo apt-get update
$ sudo apt-get install chkservice

```

对于 `Arch Linux` 系的系统，使用 [Yaourt Command][4] 或 [Packer Command][5] 从 AUR 库安装 chkservice。

```
$ yaourt -S chkservice
or
$ packer -S chkservice

```

对于 **`Fedora`** , 使用 [DNF Command][6] 安装 chkservice。

```
$ sudo dnf copr enable srakitnican/default
$ sudo dnf install chkservice

```

对于 `Debian` 系系统，使用  [DPKG Command][7] 安装 chkservice。

```
$ wget https://github.com/linuxenko/chkservice/releases/download/0.1/chkservice_0.1.0-amd64.deb
$ sudo dpkg -i chkservice_0.1.0-amd64.deb

```

对于 `RPM` 系的系统，使用  [DNF Command][8] 安装 chkservice。

```
$ sudo yum install https://github.com/linuxenko/chkservice/releases/download/0.1/chkservice_0.1.0-amd64.rpm

```

### 如何使用 chkservice

只需输入以下命令即可启动 chkservice 工具。 输出分为四部分。

  * **`第一部分:`** 这一部分显示了守护进程的状态，比如可用的 [X] 或者不可用的 [] 或者静态的 [s] 或者被掩藏的  -m-
  * **`第二部分:`** 这一部分显示守护进程的状态例如开始 [ >] 或者停止 [=]
  * **`第三部分:`** 这一部分显示单元的名称
  * **`第四部分:`** 这一部分简短地显示了守护进程的一些信息


```
$ sudo chkservice

```

![][10]

要查看帮助页面，点击 `？` 按钮。 这将向您显示管理 systemd 服务的可用选项。

![][11]

选择要启用或禁用的守护进程，然后点击`空格键`按钮。

![][12]

选择你想开始或停止的守护进程，然后点击 `s` 按钮。

![][13]

选择要重新启动的守护进程，然后按 `r` 按钮。 点击 `r` 键后，您可以在顶部看到更新的提示。

![][14]

按 `q` 按钮退出。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/chkservice-a-tool-for-managing-systemd-units-from-linux-terminal/

作者：[Ramya Nuvvula][a]
译者：[amwps290](https://github.com/amwps290)
校对：[校对者ID](https://github.com/校对者ID)

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
