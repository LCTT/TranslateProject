如何在 Windows 操作系统中运行 Docker 客户端
================================================================================

大家好，今天我们来了解一下 Windows 操作系统中的 Docker 以及在其中安装 Docker Windows 客户端的知识。Docker 引擎使用 Linux 特有的内核特性，因此不能通过 Windows 内核运行，所以，（在 Windows 上）Docker 引擎创建了一个小的虚拟系统运行 Linux 并利用它的资源和内核。这样，Windows Docker 客户端就可以用这个虚拟的 Docker 引擎来构建、运行以及管理 Docker 容器。有个叫 Boot2Docker 的团队开发了一个同名的应用程序，它创建了一个虚拟机来运行基于[Tiny Core Linux][1]特制的小型 Linux，来在 Windows 上运行 [Docker][2] 容器。它完全运行在内存中，需要大约 27M 内存并能在 5秒 (因人而异) 内启动。因此，在用于 Windows 的 Docker 引擎被开发出来之前，我们在 Windows 机器里只能运行 Linux 容器。

下面是安装 Docker 客户端并在上面运行容器的简单步骤。

### 1. 下载 Boot2Docker ###

在我们开始安装之前，我们需要 Boot2Docker 的可执行文件。可以从 [它的 Github][3] 下载最新版本的 Boot2Docker。在这篇指南中，我们从网站中下载版本 v1.6.1。我们从那网页中用我们喜欢的浏览器或者下载管理器下载了名为 [docker-install.exe][4] 的文件。

![](http://blog.linoxide.com/wp-content/uploads/2015/05/downloading-boot2docker-installer.png)

### 2. 安装 Boot2Docker ###

现在我们运行安装文件，它会安装 Window Docker 客户端、用于 Windows 的 Git(MSYS-git)、VirtualBox、Boot2Docker Linux ISO 以及 Boot2Docker 管理工具，这些对于开箱即用地运行全功能的 Docker 引擎都至关重要。

![](http://blog.linoxide.com/wp-content/uploads/2015/05/boot2docker-installer.png)

### 3. 运行 Boot2Docker ###

![](http://blog.linoxide.com/wp-content/uploads/2015/05/boot2docker-start-icon-e1431322598697.png)

安装完成必要的组件之后，我们从桌面上的“Boot2Docker Start”快捷方式启动 Boot2Docker。它会要求你输入以后用于验证的 SSH 密钥。然后会启动一个配置好的用于管理在虚拟机中运行的 Docker 的 unix shell。

![](http://blog.linoxide.com/wp-content/uploads/2015/05/starting-boot2docker.png)

为了检查是否正确配置，运行下面的 docker version 命令。

    docker version

![](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-version.png)

### 4. 运行 Docker ###

由于 **Boot2Docker Start** 自动启动了一个已经正确设置好环境变量的 shell，我们可以马上开始使用 Docker。**请注意，如果我们要将 Boot2Docker 作为一个远程 Docker 守护进程，那么不要在 docker 命令之前加 sudo。**

现在，让我们来试试 **hello-world** 例子镜像，它会下载 hello-world 镜像，运行并输出 "Hello from Docker" 信息。

    $ docker run hello-world

![](http://blog.linoxide.com/wp-content/uploads/2015/05/running-hello-world.png)

### 5. 使用命令提示符(CMD) 运行 Docker###

现在，如果你想开始用命令提示符使用 Docker，你可以打开命令提示符(CMD.exe)。由于 Boot2Docker 要求 ssh.exe 在 PATH 中，我们需要在命令提示符中输入以下命令使得 %PATH% 环境变量中包括 Git 安装目录下的 bin 文件夹。

    set PATH=%PATH%;"c:\Program Files (x86)\Git\bin"

![](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-in-cmd.png)

运行上面的命令之后，我们可以在命令提示符中运行 **boot2docker start** 启动 Boot2Docker 虚拟机。 

    boot2docker start

![](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-cmd-variables.png)

**注意**: 如果你看到 machine does no exist 的错误信息，就运行 **boot2docker init** 命令。

然后复制上图中控制台标出命令到 cmd.exe 中为控制台窗口设置环境变量，然后我们就可以像平常一样运行 docker 容器了。

### 6. 使用 PowerShell 运行 Docker ###

为了能在 PowerShell 中运行 Docker，我们需要启动一个 PowerShell 窗口并添加 ssh.exe 到 PATH 变量。 

    $Env:Path = "${Env:Path};c:\Program Files (x86)\Git\bin"

运行完上面的命令，我们还需要运行

    boot2docker start

![](http://blog.linoxide.com/wp-content/uploads/2015/05/docker-in-powershell.png)

这会打印用于设置环境变量连接到虚拟机内部运行的 Docker 的 PowerShell 命令。我们只需要在 PowerShell 中运行这些命令就可以和平常一样运行 docker 容器。

### 7.  用 PUTTY 登录 ###

Boot2Docker 会在%USERPROFILE%\.ssh 目录生成和使用用于登录的公共和私有密钥，我们也需要使用这个文件夹中的私有密钥。私有密钥需要转换为 PuTTY 的格式。我们可以通过 puttygen.exe 实现。

我们需要打开 puttygen.exe 并从 %USERPROFILE%\.ssh\id_boot2docker 中导入("File"->"Load" 菜单)私钥，然后点击 "Save Private Key"。然后用保存的文件通过 PuTTY 用 docker@127.0.0.1:2022 登录。

### 8. Boot2Docker 选项 ###

Boot2Docker 管理工具提供了一些命令，如下所示。

    $ boot2docker

    Usage: boot2docker.exe [<options>] {help|init|up|ssh|save|down|poweroff|reset|restart|config|status|info|ip|shellinit|delete|download|upgrade|version} [<args>]

### 总结 ###

通过 Docker Windows 客户端使用 Docker 很有趣。Boot2Docker 管理工具是一个能使任何 Docker 容器能像在 Linux 主机上平滑运行的很棒的应用程序。如果你更仔细的话，你会发现 boot2docker 默认用户的用户名是 docker，密码是 tcuser。最新版本的 boot2docker 设置了一个 host-only 的网络适配器提供访问容器的端口。一般来说是 192.168.59.103，但可以通过 VirtualBox 的 DHCP 实现改变。

如果你有任何问题、建议、反馈，请在下面的评论框中写下来然后我们可以改进或者更新我们的内容。非常感谢！Enjoy:-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/run-docker-client-inside-windows-os/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://tinycorelinux.net/
[2]:https://www.docker.io/
[3]:https://github.com/boot2docker/windows-installer/releases/latest
[4]:https://github.com/boot2docker/windows-installer/releases/download/v1.6.1/docker-install.exe