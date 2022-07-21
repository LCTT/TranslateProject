[#]: subject: "How to Install Docker And Docker Compose In Ubuntu 22.04 LTS"
[#]: via: "https://ostechnix.com/install-docker-ubuntu/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "Donkey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "


如何在 Ubuntu 22.04 LTS 中安装 Docker 和 Docker Compose
======
在 Ubuntu 中使用 Docker Compose 安装 Docker 引擎详细指导

在这篇文章中，我们将会明白 **Docker** 是什么，如何 **在 Ubuntu 中安装 Docker 引擎** 。此外，我们也将会明白如何 **安装 Docker Compose** ，它是一个定义并运行多容器的 Docker 应用。

我们已经在 Ubuntu 22.04 LTS 中正式的测试了这份指南。然而，它也应该对旧版本如 20.04 LTS 和 18.04 LTS 有效。为了更好的安全性和稳定性，我推荐你使用最新的版本—— Ubuntu 22.04 LTS 。


### 什么是 Docker ？

**Docker** 是一个快捷，轻便的系统级虚拟化技术，开发者和系统管理员可以使用它构建具备所有必要依赖项的应用程序，并将其作为一个包发布。

Docker 与其他如 VMWare 、Xen 、以及 VirtualBox 等工具的虚拟化方式不同，每个虚拟机不需要单独的客户操作系统。

所有的 Docker 容器有效地共享主机系统内核。每个容器都在同一操作系统中的隔离用户空间中运行。

Docker 容器可以在任何 Linux 版本上运行。比如说你使用 Fedora ，我用 Ubuntu 。我们能相互开发、共享并分发 Docker 镜像。

你无需担心操作系统、软件以及自定义设置，任何事都不用担心。只要我们的主机安装了 Docker ，就能持续开发。简言之，Docker 能够在任何地方运行！

前文中你读到了两个词：**Docker 镜像** 和 **Docker 容器** ，或许你在想它们的区别。

通俗地说，Docker 镜像是一个描述容器应该如何表现的文件，而 Docker 容器是 Docker 镜像的运行（或停止）状态。

希望你能够理解 Docker 的基础概念。更多细节，你可以参考文章末尾的 Docker 官方指导手册。

### Docker 依赖项

为了安装并配置 Docker ，你的系统必须满足下列最低要求：


1. 64 位 Linux 或 Windows 系统
2. 如果使用 Linux ，内核版本必须不低于 3.10
3. 能够使用 `sudo` 权限的用户
4. 在你系统 BIOS 上启用了 VT（虚拟化技术）支持 on your system BIOS. [参考: [如何查看 CPU 支持 虚拟化技术（VT）][1]]
5. 你的系统应该联网

在 Linux ，在终端上运行以下命令验证内核以及架构详细信息：

```
$ uname -a
```

**输出样例：**

```
Linux Ubuntu22CT 5.15.35-3-pve #1 SMP PVE 5.15.35-6 (Fri, 17 Jun 2022 13:42:35 +0200) x86_64 x86_64 x86_64 GNU/Linux
```

正如上面你看到的那样，我的 Ubuntu 系统内核版本是 **5.15.35-3-pve** 并且系统架构是 **64 位**（**x86_64 x86_64 x86_64 GNU/Linux**）。查看上方结果的黑体字。

**注意：** 这里，我在 **[Proxmox][2]** 中使用 Ubuntu 22.04 容器。这是你看到上方内核版本中有 “pve” 字符的原因。如果你正在使用 Ubuntu 实体（或者虚拟）机，你将看到系统版本为 **5.15.35-3-generic** 。

内核版本需要不低于最低要求的版本，并且是 64 位机器。这样不会有任何问题，我们能顺利安装并使用 Docker 。

请注意你使用哪一个 Ubuntu 系统不重要。并且你使用 Ubuntu 桌面或服务器版本，亦或者其他 Ubuntu 变种如 Lubuntu 、Kubuntu 、Xubuntu ，都不重要。

Docker 会正常运行，只要你的系统内核版本不低于 3.10 ，并且是 64 位系统。

### 在 Ubuntu 22.04 LTS 中安装 Docker

首先，更新你的 Ubuntu 系统。

#### 1. 更新 Ubuntu

打开终端，依次运行下列命令：

```
$ sudo apt update
```

```
$ sudo apt upgrade
```

```
$ sudo apt full-upgrade
```

#### 2. 添加 Docker 库

首先，安装必要的证书并允许 apt 包管理器使用以下命令通过 HTTPS 使用存储库：

```
$ sudo apt install apt-transport-https ca-certificates curl software-properties-common gnupg lsb-release
```

然后，运行下列命令添加 Docker 的官方 GPG 密钥：

```
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

添加 Docker 官方库：

```
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

使用命令更新 Ubuntu 源列表：

```
$ sudo apt update
```

#### 3. 安装 Docker

最后，运行下列命令在 Ubuntu 22.04 LTS 服务器中安装最新 Docker CE 。

```
$ sudo apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin
```

![Install Docker In Ubuntu][3]

当然你也可以安装其他版本 Docker 。运行下列命令检查可以安装的 Docker 版本：

```
$ apt-cache madison docker-ce
```

**输出样例：**

```
docker-ce | 5:20.10.17~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
docker-ce | 5:20.10.16~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
docker-ce | 5:20.10.15~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
docker-ce | 5:20.10.14~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
docker-ce | 5:20.10.13~3-0~ubuntu-jammy | https://download.docker.com/linux/ubuntu jammy/stable amd64 Packages
```

你可以挑选上面列表中的任何版本进行安装。例如，安装 **5:20.10.16~ 3-0 ~ubuntu-jammy** 这个版本，运行：

```
$ sudo apt install docker-ce=5:20.10.16~3-0~ubuntu-jammy docker-ce-cli=5:20.10.16~3-0~ubuntu-jammy containerd.io
```

安装完成后，运行如下命令验证 Docker 服务是否在运行：

```
$ systemctl status docker
```

你会看到类似下面的输出：

```
* docker.service - Docker Application Container Engine
     Loaded: loaded (/lib/systemd/system/docker.service; enabled; vendor preset: enabled)
     Active: active (running) since Mon 2022-06-27 13:07:43 UTC; 3min 4s ago
TriggeredBy: * docker.socket
       Docs: https://docs.docker.com
   Main PID: 2208 (dockerd)
      Tasks: 8
     Memory: 29.6M
        CPU: 126ms
     CGroup: /system.slice/docker.service
             `-2208 /usr/bin/dockerd -H fd:// --containerd=/run/containerd/containerd.sock

Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.071453522Z" level=info msg="ccResolverWrapper: sending update to cc: {[{unix:>
Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.071459974Z" level=info msg="ClientConn switching balancer to \"pick_first\"" >
Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.130989294Z" level=info msg="Loading containers: start."
Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.187439756Z" level=info msg="Default bridge (docker0) is assigned with an IP a>
Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.235966874Z" level=info msg="Loading containers: done."
Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.240149866Z" level=warning msg="Not using native diff for overlay2, this may c>
Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.240281966Z" level=info msg="Docker daemon" commit=a89b842 graphdriver(s)=over>
Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.240386856Z" level=info msg="Daemon has completed initialization"
Jun 27 13:07:43 Ubuntu22CT systemd[1]: Started Docker Application Container Engine.
Jun 27 13:07:43 Ubuntu22CT dockerd[2208]: time="2022-06-27T13:07:43.276336600Z" level=info msg="API listen on /run/docker.sock"
```

好极了！Docker 服务已启动并运行！

如果没有运行，运行以下命令运行 Docker 服务：

```
$ sudo systemctl start docker
```

使 Docker 服务在每次重启时自动启动：

```
$ sudo systemctl enable docker
```

可以使用以下命令查看已安装的 Docker 版本：

```
$ sudo docker version
```

**输出样例：**

```
Client: Docker Engine - Community
  Version:           20.10.17
  API version:       1.41
  Go version:        go1.17.11
  Git commit:        100c701
  Built:             Mon Jun  6 23:02:46 2022
  OS/Arch:           linux/amd64
  Context:           default
  Experimental:      true

Server: Docker Engine - Community
  Engine:
    Version:          20.10.17
    API version:      1.41 (minimum version 1.12)
    Go version:       go1.17.11
    Git commit:       a89b842
  Built:            Mon Jun  6 23:00:51 2022
    OS/Arch:          linux/amd64
    Experimental:     false
  containerd:
    Version:          1.6.6
    GitCommit:        10c12954828e7c7c9b6e0ea9b0c02b01407d3ae1
  runc:
    Version:          1.1.2
    GitCommit:        v1.1.2-0-ga916309
  docker-init:
    Version:          0.19.0
    GitCommit:        de40ad0
```

![Check Docker Version][4]

#### 4. 测试 Docker

让我们继续，测试 Docker 是否运行正常：

运行：

```
$ sudo docker run hello-world
```

上述命令会下载一个 Docker 测试镜像，并在容器内执行一个 **hello_world** 样例程序。

如果你看到类似下方的输出，那么祝贺你！Docker 正常运行在你的 Ubuntu 系统中。

```
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
2db29710123e: Pull complete 
Digest: sha256:13e367d31ae85359f42d637adf6da428f76d75dc9afeb3c21faea0d976f5c651
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

![Run Hello World Docker Container][5]

很好！可以使用 Docker 了。

#### 5. 作为非 root 用户运行 Docker （选做）

默认情况下，Docker 守护进程（Docker daemon）绑定到 Unix 套接字而不是 TCP 端口。由于 **Unix 套接字由 root** 用户拥有，Docker 守护程序将仅以 root 用户身份运行。因此，普通用户无法执行大多数 Docker 命令。

如果你想要在 Linux 中作为非 root 用户运行 Docker ，参考下方链接：

* [如何在 Linux 中作为非 root 用户运行 Docker][6]

我个人不这样做也**不推荐**你这么做。如果你不会在互联网上暴露你的系统，那没问题。然而，不要在生产系统中以非 root 用户身份运行 Docker 。

### 在 Ubuntu 中安装 Docker Compose

**Docker Compose** 是一个可用于定义和运行多容器 Docker 应用程序的工具。使用 Compose，你可以使用 Compose 文件来配置应用程序的服务。然后，使用单个命令，你可以从配置中创建和启动所有服务。

下列任何方式都可以安装 Docker Compose 。

#### 方式 1 - 使用二进制文件安装 Docker Compose

从 [这里][7] 下载最新 Docker Compose 。

当我在写这篇文章时，最新版本是 **2.6.1** 。

运行下列命令安装最新稳定的 Docker Compose 文件：

```
$ sudo curl -L "https://github.com/docker/compose/releases/download/v2.6.1/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

如果有更新版本，只需要将上述命令中的 **v2.6.1** 替换为最新的版本号即可。请不要忘记数字前的 **"v"** 。

最后，使用下列命令赋予二进制文件可执行权限：

```
$ sudo chmod +x /usr/local/bin/docker-compose
```

运行下列命令检查安装的 Docker Composer 版本：

```
$ docker-compose version
Docker Compose version v2.6.1
```

#### 方式 2 - 使用 PiP 安装 Docker Compose 

或许，我们可以使用 **PIP** 安装 Docker Compose 。Pip 是 Python 包管理器，用来安装使用 Python 编写的应用程序。

参考下列链接安装 Pip 。

* [如何使用 Pip 管理 Python 包][8]

安装 pip 后，运行以下命令安装 Docker Compose。下列命令对于所有 Linux 发行版都是相同的！

```
$ pip install docker-compose
```

安装 Docker Compose 后，使用下列命令检查版本：

```
$ docker-compose --version
```

你将会看到类似下方的输出：

```
docker-compose version 2.6.1, build 8a1c60f6
```

恭喜你！我们已经成功安装了 Docker Community 版本和 Docker Compose 。


安装了 Docker，然后呢？查看本系列的下一篇文章，了解 Docker 基础知识。

* [开始使用 Docker][9]

要在基于 RPM 的系统（例如 RHEL、Fedora、CentOS、AlmaLinux、Rocky Linux 和 openSUSE）中安装 Docker，请参考以下链接。

* [在 CentOS 中安装 Docker][10]

### 总结

在这篇教程中，我们讨论了 Docker 是什么，如何在 Ubuntu 22.04 LTS Jammy Jellyfish 中安装 Docker 。然后学习了如何通过运行 hello-world Docker 镜像测试 Docker 是否成功安装。最后，我们通过使用两种不同的方式安装 Docker Compose 作为本教程的结尾。

**资料：**

* [Docker 主页][11]

--------------------------------------------------------------------------------

via: https://ostechnix.com/install-docker-ubuntu/

作者：[sk][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/how-to-find-if-a-cpu-supports-virtualization-technology-vt/
[2]: https://ostechnix.com/install-proxmox-ve/
[3]: https://ostechnix.com/wp-content/uploads/2022/06/Install-Docker-In-Ubuntu.png
[4]: https://ostechnix.com/wp-content/uploads/2022/06/Check-Docker-Version.png
[5]: https://ostechnix.com/wp-content/uploads/2022/06/Run-Hello-World-Docker-Container.png
[6]: https://ostechnix.com/how-to-run-docker-as-non-root-user-in-linux/
[7]: https://github.com/docker/compose/releases
[8]: https://ostechnix.com/manage-python-packages-using-pip/
[9]: https://ostechnix.com/getting-started-with-docker/
[10]: https://ostechnix.com/install-docker-centos/
[11]: https://www.docker.com/
