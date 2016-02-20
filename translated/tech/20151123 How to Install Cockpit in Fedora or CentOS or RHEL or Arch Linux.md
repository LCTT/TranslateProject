如何在 Fedora/CentOS/RHEL 或 Arch Linux 上安装 Cockpit
================================================================================
Cockpit 是一个免费开源的服务器管理软件，它使得我们可以通过它好看的 web 前端界面轻松地管理我们的 GNU/Linux 服务器。Cockpit 使得 linux 系统管理员、系统维护员和开发者能轻松地管理他们的服务器并执行一些简单的任务，例如管理存储、检测日志、启动或停止服务以及一些其它任务。它的报告界面添加了一些很好的功能使得可以轻松地在终端和 web 界面之间切换。另外，它不仅使得管理一台服务器变得简单，更重要的是只需要一个单击就可以在一个地方同时管理多个通过网络连接的服务器。它非常轻量级，web 界面也非常简单易用。在这篇博文中，我们会学习如何安装 Cockpit 并用它管理我们的运行着 Fedora、CentOS、Arch Linux 以及 RHEL 发行版操作系统的服务器。下面是 Cockpit 在我们的 GNU/Linux 服务器中一些非常棒的功能：

1. 它包含 systemd 服务管理器。
2. 有一个用于故障排除和日志分析的 Journal 日志查看器。
3. 包括 LVM 在内的存储配置比以前任何时候都要简单。
4. 用 Cockpit 可以进行基本的网络配置。
5. 可以轻松地添加和删除用户以及管理多台服务器。

### 1. 安装 Cockpit ###

首先，我们需要在我们基于 linux 的服务器上安装 Cockpit。大部分发行版的官方软件仓库中都有可用的 cockpit 安装包。这篇博文中，我们会在 Fedora 22、CentOS 7、Arch Linux 和 RHEL 7 中通过它们的官方软件仓库安装 Cockpit。

#### CentOS / RHEL ####

CentOS 和 RHEL 官方软件库中有可用的 Cockpit。我们只需要用 yum 管理器就可以安装。只需要以 sudo/root 权限运行下面的命令就可以安装它。

    # yum install cockpit

![Centos 上安装 Cockpit](http://blog.linoxide.com/wp-content/uploads/2015/10/install-cockpit-centos.png)

#### Fedora 22/21 ####

和 CentOS 一样， Fedora 的官方软件库默认也有可用的 Cockpit。我们只需要用 dnf 软件包管理器就可以安装 Cockpit。

    # dnf install cockpit

![Fedora 上安装 Cockpit](http://blog.linoxide.com/wp-content/uploads/2015/10/install-cockpit-fedora.png)

#### Arch Linux ####

现在 Arch Linux 官方软件库中还没有可用的 Cockpit，但 Arch 用户库（Arch User Repository，AUR）有。只需要运行下面的 yaourt 命令就可以安装。

    # yaourt cockpit

![Arch linux 上安装 Cockpit](http://blog.linoxide.com/wp-content/uploads/2015/10/install-cockpit-archlinux.png)

### 2. 启动并启用 Cockpit ###

成功安装完 Cockpit，我们就要用服务/守护进程管理器启动 Cockpit 服务。到了 2015 年，尽管一些 linux 发行版仍然运行 SysVinit 管理守护进程，但大部分 linux 发行版都采用了 Systemd，Cockpit 使用 systemd 完成从运行守护进程到服务几乎所有的功能。因此，我们只能在运行着 Systemd 的最新的 linux 发行版中安装 Cockpit。要启动 Cockpit 并让它在每次系统重启时自动启动，我们需要在终端或控制台中运行下面的命令。
    # systemctl start cockpit

    # systemctl enable cockpit.socket

	创建从 /etc/systemd/system/sockets.target.wants/cockpit.socket 到 /usr/lib/systemd/system/cockpit.socket 的符号链接。

### 3. 允许通过防火墙 ###

启动 Cockpit 并使得它能在每次系统重启时自动启动后，我们现在要给它配置防火墙。由于我们的服务器上运行着防火墙程序，我们需要允许它通过某些端口使得从服务器外面可以访问 Cockpit。

#### Firewalld ####

    # firewall-cmd --add-service=cockpit --permanent

    success

    # firewall-cmd --reload

    success

![允许 Cockpit 通过 Firewalld](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-allowing-firewalld.png)

#### Iptables ####

    # iptables -A INPUT -p tcp -m tcp --dport 80 -j ACCEPT

    # service iptables save

### 4. 访问 Cockpit Web 界面 ###

下面，我们终于要通过 web 浏览器访问 Cockpit web 界面了。根据配置，我们只需要用浏览器打开 https://ip-address:9090 或 https://server.domain.com:9090。在我们这篇博文中，我们用浏览器打开 https://128.199.114.17:9090，正如下图所示。

![通过 SSL 访问 Cockpit Web 服务](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-webserver-ssl-proceed.png)

此时会出现一个 SSL 认证警告，因为我们正在使用一个自签名认证。我们只需要忽略这个警告并进入到登录页面，在 chrome/chromium 中，我们需要点击 Show Advanced 然后点击 **Proceed to 128.199.114.17 (unsafe)**。

![Cockpit 登录界面](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-login-screen.png)

现在，要进入仪表盘，我们需要输入详细的登录信息。这里，用户名和密码和用于登录我们的 linux 服务器的用户名和密码相同。当我们输入登录信息并点击 Log In 按钮后，我们就会进入到 Cockpit 仪表盘。

![Cockpit 仪表盘](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-dashboard.png)

这里我们可以看到所有的菜单以及 CPU、磁盘、网络、存储使用情况的可视化结果。仪表盘正如上图所示。

#### 服务 ####

要管理服务，我们需要点击 web 页面右边菜单中的 Services 按钮。然后，我们会看到服务被分成了 5 个类别，目标、系统服务、套接字、计时器和路径。

![Cockpit 服务](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-services.png)
 
#### Docker 容器 ####

我们甚至可以用 Cockpit 管理 docker 容器。用 Cockpit 监控和管理 Docker 容器非常简单。由于我们的服务器中没有安装运行 docker，我们需要点击 Start Docker。


![Cockpit 容器](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-container.png)

Cockpit 会自动在我们的服务器上安装和运行 docker。启动之后，我们就会看到下面的截图。然后我们就可以按照需求管理 docker 镜像、容器。

![Cockpit 容器管理](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-containers-mangement.png)

#### Journal 日志查看器 ####

Cockpit 有个日志查看器，它把错误、警告、注意分到不同的标签页。我们也有一个 All 标签页，在这里可以看到所有的日志信息。

![Cockpit Journal 日志](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-journal-logs.png)

#### 网络 ####

在网络部分，我们可以看到两个可视化发送和接收速度的图。我们可以看到这里有一个可用网卡的列表，还有 Add Bond、Bridge、VLAN 的选项。如果我们需要配置一个网卡，我们只需要点击网卡名称。在下面，我们可以看到网络的 Journal 日志信息。

![Cockpit Network](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-network.png)

#### 存储 ####

现在，用 Cockpit 可以方便地查看硬盘的读写速度。我们可以查看存储的 Journal 日志以便进行故障排除和修复。在页面中还有一个已用空间的可视化图。我们甚至可以卸载、格式化、删除一块硬盘的某个分区。它还有类似创建 RAID 设备、卷组等攻能。

![Cockpit Storage](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-storage.png)

#### 用户管理 ####

通过 Cockpit Web 界面我们可以方便地创建新用户。在这里创建的账户会应用到系统用户账户。我们可以用它更改密码、指定角色、以及删除用户账户。

![Cockpit Accounts](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-accounts.png)

#### 实时终端 ####

Cockpit 还有一个很棒的特性。是的，我们可以执行命令，用 Cockpit 界面提供的实时终端执行任务。这使得我们可以根据我们的需求在 web 界面和终端之间自由切换。

![Cockpit 终端](http://blog.linoxide.com/wp-content/uploads/2015/10/cockpit-terminal.png)

### 总结 ###

Cockpit 是由 [Red Hat][1] 开发的使得管理服务器变得轻松简单的免费开源软件。它非常适合于进行简单的系统管理任务和新手系统管理员。它仍然处于开发阶段，还没有稳定版发行。因此不适合于生产环境。它是针对最新的默认安装了 systemd 的 Fedora、CentOS、Arch Linux、RHEL 系统开发的。如果你想在 Ubuntu 上安装 Cockpit，你可以通过 PPA 访问，但现在已经过期了。如果你有任何疑问、建议，请在下面的评论框中反馈给我们，这样我们可以改进和更新我们的内容。非常感谢 ！ 

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/install-cockpit-fedora-centos-rhel-arch-linux/

作者：[Arun Pyasi][a]
译者：[ictlyh](http://mutouxiaogui.cn/blog/)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.redhat.com/