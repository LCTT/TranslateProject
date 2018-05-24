如何在 Windows 10 上开启 WSL 之旅
======

> WSL 可以让你访问 Windows 上的 Linux Bash shell。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/wsl-main.png?itok=wJ5WrU9U)

在 [上一篇文章][1] 中，我们讨论过关于 <ruby>Windows 的子系统 Linux<rt>Windows Subsystem for Linux</rt></ruby>（WSL）的目标用户。本文，我们将在 Windows 10 的设备上，开启 WSL 的旅程。

### 为 WSL 做准备

您必须使用最新版本的 Windows 10 Fall Creator Update。之后，通过在开始菜单栏搜索 “About”，检查 Windows 10 的版本。为了使用 WSL，您的版本应当为 1709 或者最新版。

这里有一张关于我的操作系统的截图。

![][2]

如果您安装了之前的版本，您需要在 [这里][3] 下载并且安装 Windows 10 Fall Creator Update (FCU)。安装完毕后，安装可用的更新（在开始菜单的搜索框中搜索 “updates”）。

前往 “启用或关闭 Windows 功能” ，然后滚动至底部，如截图所示，勾选 “适用于 Linux 的 Windows 子系统”，点击确定。它将会下载安装需要的包。

![][4]

安装完成之后，系统将会询问是否重启。是的，重启设备吧。WSL 在系统重启之前不会启动，如下所示：

![][5]

一旦您的系统重启，返回 “启用或关闭 Windows 功能” 页面，确认 “适用于 Linux 的 Windows 子系统” 已经被勾选。

### 在 Windows 中安装 Linux

在 Windows 中安装 Linux，有很多方式，这里我们选择一种最简单的方式。打开 Microsoft Store，搜索 Linux。您将看到下面的选项：

![][6]

点击 “获取”，之后 Windows 商店将会提供三个选项：Ubuntu、openSUSE Leap 42 和 SUSE Linux Enterprise Server。您可以一并安装上述三个发行版，并且它们可以同时运行。为了能使用 SLE，您需要一份订阅。

在此，我将安装 openSUSE Leap 42 和 Ubuntu。选中您想要的发行版，点击“获得”按钮并安装。一旦安装完毕，您就可以在 Windows 中启动 openSUSE。为了方便访问，可以将其固定到开始菜单中。

![][7]

### 在 Windwods 中使用 Linux

当您启动该发行版，它将会打开一个 Bash Shell 并且安装此发行版。安装完毕之后，您就可以开始使用了。您需要留意，openSUSE 中并没有（普通）用户，它直接运行在 `root` 用户下，但是 Ubuntu 会询问您是否创建用户。在 Ubuntu，您可以以 `sudo` 用户执行管理任务。

在 openSUSE 上，您可以很轻松的创建一个用户：

```
# useradd [username]
# passwd [username]
```

为此用户创建一个新的密码。例如：

```
# useradd swapnil
# passwd swapnil
```

您可以通过 `su` 命令从 root 用户切换过来。

```
su swapnil
```

您需要非根用户来执行许多任务，比如使用 `rsync` 移动文件到本地设备。

而首要任务是更新发行版。对于 openSUSE 来说，您应该：

```
zypper up
```

而对于 Ubuntu：

```
sudo apt-get update
sudo apt-get dist-upgrade
```

![][8]

现在，您就在 Windows 上拥有了原生的 Linux Bash shell。想在 Windows 10 上通过 `ssh` 连接您的服务器？不需要安装 puTTY 或是 Cygwin。打开 Bash 之后，就可以通过 `ssh` 进入您的服务器。简单之至。

想通过 `rsync` 同步文件到您的服务器？直接使用 `rsync`。它切实的将我们的 Windows 设备转变得更为实用，帮助那些需要使用原生 Linux 命令和 Linux 工具的用户避开虚拟机，大开方便之门。

### Fedora 在哪里？

您可能奇怪为什么没有 Fedora。可惜，商城里并没有 Fedora。Fedora 项目发布负责人在 Twitter 上表示，“我们正在解决一些非技术性问题。现在可能提供不了更多了。”

我们并不确定这些非技术性问题是什么。当一些用户询问 WSL 团队为何不发布 Fedora，毕竟它也是一个开源项目。项目负责人 Rich Turner 在 Microsoft  [回应][9]，“我们有一个不发布其他知识产权到应用商店的政策。我们相信，相较于被微软或是其他非权威人士，社区更希望看到发行版由发行版所有者发布。”

因此，微软不方便在 Windows 商店中直接发布 Debian 或是 Arch 系统。这些任务应该落在他们的官方团队中，应该由他们将发行版带给 Windows 10 的用户。

### 欲知后事，下回分解

下一篇文章，我们会讨论关于将 Windows 10 作为 Linux 设备，并且向您展示，您可能会在 Linux 系统上使用的命令行工具。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/2018/2/how-get-started-using-wsl-windows-10

作者：[SWAPNIL BHARTIYA][a]
译者：[CYLeft](https://github.com/CYLeft)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/learn/2018/2/windows-subsystem-linux-bridge-between-two-platforms
[2]:https://lh6.googleusercontent.com/kHFKOvrbG1gXdB9lsbTqXC4N4w0Lbsz1Bul5ey9mr_E255GiiBxf8cRlatrte6z23yvo8lHJG8nQ_WeHhUNYqPp7kHuQTTMueqMshCT71JsbMr2Wih9KFHuHgNg1BclWz-iuBt4O
[3]:https://www.microsoft.com/en-us/software-download/windows10
[4]:https://lh4.googleusercontent.com/oV1mDqGe3zwQgL0N3rDasHH6ZwHtxaHlyrLzjw7xF9M9_AcHPNSxM18KDWK2ZpVcUOfxVVpNH9LwUJT5EtRE7zUrJC_gWV5f345SZRAgXcJzOE-8rM8-RCPTNtns6vVP37V5Eflp
[5]:https://lh5.googleusercontent.com/GsNOQLJlHeZbkaCsrDIhfVvEoycu3D0upoTdt6aNEozAcQA59Z3hDu_SxT6I4K4gwxLPX0YnmUsCKjaQaaG2PoAgUYMcN0Zv0tBFaoUL3sZryddM4mdRj1E2tE-IK_GLK4PDa4zf
[6]:https://lh3.googleusercontent.com/YAR4UgZiFAy2cdkG4U7jQ7_m81lrxR6aHSMOdED7MKEoYxEsX_yLwyMj9N2edt3GJ2JLx6mUsFEZFILCCSBU2sMOqveFVWZTHcCXhFi5P2Xk-9Ikc3NK9seup5CJObIcYJPORdPW
[7]:https://lh6.googleusercontent.com/4LU6eRrzDgBprDuEbSFizRuP1J_zS3rBnoJbU2OAOH3Mx7nfOROfyf81k1s4YQyLBcu0qSXOoaqbYkXL5Wpp9gNCdKH_WsEcqWzjG6uXzYvCYQ42psOz6Iz3NF7ElsPrdiFI0cYv
[8]:https://lh6.googleusercontent.com/7cRgj1O6J8yfO3L4ol5sP-ZCU7_uwOuEoTzsuVW9cU5xiBWz_cpZ1IBidNT0C1wg9zROIncViUzXD0vPoH5cggQtuwkanRfRdDVXOI48AcKFLt-Iq2CBF4mGRwqqWvSOhb0HFpjm
[9]:https://github.com/Microsoft/WSL/issues/2584
