[#]: collector: "lujun9972"
[#]: translator: "jlztan"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-12634-1.html"
[#]: subject: "Monitor and Manage Docker Containers with Portainer.io (GUI tool) – Part-1"
[#]: via: "https://www.linuxtechi.com/monitor-manage-docker-containers-portainer-part1/"
[#]: author: "Shashidhar Soppin https://www.linuxtechi.com/author/shashidhar/"

用 Portainer.io 来监控和管理 Docker 容器（1）
======

![](https://img.linux.net.cn/data/attachment/album/202009/20/225425zaepvexqvg7nndqv.jpg)

随着 Docker 的使用量越来越大，监控 Docker 容器正在变得更有挑战性。每天都有大量的 Docker 容器被创建，因此如何监控它们就变得非常重要。目前已经有一些内置的工具和技术，不过对它们进行配置有一些复杂。随着基于微服务的架构正在变成接下来事实上的标准，学会这种技术将为你的知识库再添一项新技能。

基于上述场景，对一种轻量、健壮的镜像管理工具的需求日益增加。Portainer.io 解决了这个问题。 Portainer.io（最新版本是 1.20.2）非常轻量，只需 2-3 个命令就可以配置好，已经在 Docker 用户中流行起来。

比起其他工具，这个工具有很多优势，其中一些如下所示：

  * 轻量（安装此工具仅需 2 到 3 个命令，与此同时安装镜像的大小在 26 M 到 30 M 之间）
  * 健壮且易用
  * 可用于 Docker 监控和构建
  * 提供对 Docker 环境的详细概况
  * 可以管理容器、镜像、网络和卷
  * Portainer 部署方便，仅需一个 Docker 命令（可以在任意地方运行）
  * 可以对完整的 Docker 容器环境进行监控

Portainer 同时具有以下服务：

- 社区支持
- 企业支持
- 与合作伙伴 OEM 服务一起的专业服务

Portainer 的功能和特性如下：

    1. 配备了漂亮的仪表盘，易于使用和监控
    2. 自带大量内置模板，便于操作和创建
    3. 服务支持（仅 OEM 和企业用户）
    4. 对容器、镜像、网络、卷以及配置进行几乎实时的监控
    5. 包含 Docker 集群监控功能
    6. 功能多样的用户管理

另请阅读：[如何在 Ubuntu 16.04 / 18.04 LTS 版本中安装 Docker CE][1] 

### 如何在 Ubuntu Linux / RHEL / CentOS 系统上安装和配置 Portainer.io

注意：下面的安装过程是在 Ubuntu 18.04 上完成的，但是对 RHEL 和 CentOS 同样适用，同时假设你已经在系统上安装了 Docker CE。

```
root@linuxtechi:~$ lsb_release -a
No LSB modules are available.
Distributor ID: Ubuntu
Description:    Ubuntu 18.04 LTS
Release:        18.04
Codename:       bionic
root@linuxtechi:~$
```

为 Portainer 创建卷：

```
root@linuxtechi:~$ sudo docker volume create portainer_data
portainer_data
root@linuxtechi:~$
```

使用下面的 Docker 命令来运行 Portainer 容器：

```
root@linuxtechi:~$ sudo docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer
Unable to find image 'portainer/portainer:latest' locally
latest: Pulling from portainer/portainer
d1e017099d17: Pull complete
0b1e707a06d2: Pull complete
Digest: sha256:d6cc2c20c0af38d8d557ab994c419c799a10fe825e4aa57fea2e2e507a13747d
Status: Downloaded newer image for portainer/portainer:latest
35286de9f2e21d197309575bb52b5599fec24d4f373cc27210d98abc60244107
root@linuxtechi:~$
```

安装完成之后，通过主机或 Docker 的 IP 加上 Docker 引擎使用的 9000 端口在浏览器中打开 Portainer。

注意：如果 Docker 所在主机的系统防火墙开启，需要确保 9000 端口被放行，否则浏览器页面将无法打开。

在我这边，我的 Docker 主机/引擎的 IP 是 `192.168.1.16`，所以 URL 就是 `http://192.168.1.16:9000`

![Portainer-Login-User-Name-Password][2]

在创建管理员用户时，请确保密码是 8 个字符，同时用户名为 `admin`，然后点击 “Create User”。

接下来进入如下所示的页面，选中 “Local” 矩形框。

![Connect-Portainer-Local-Docker][4]

点击 “Connect”，

可以看到 admin 用户的漂亮首页如下所示，

![Portainer-io-Docker-Monitor-Dashboard][6]

现在 Portainer 已经准备好运行和管理你的 Docker 容器了，同时也可用于容器监控。

### 在 Portainer 中管理容器镜像

![Portainer-Endpoints][8]

检查当前的状态，可以看到有两个容器已经在运行了，如果你创建另一个也会立即显示出来。

像下面这样，在命令行中启动一个或两个容器，

```
root@linuxtechi:~$ sudo docker run --name test -it debian
Unable to find image 'debian:latest' locally
latest: Pulling from library/debian
e79bb959ec00: Pull complete
Digest: sha256:724b0fbbda7fda6372ffed586670573c59e07a48c86d606bab05db118abe0ef5
Status: Downloaded newer image for debian:latest
root@linuxtechi:/#
```

然后在 Portainer 页面中点击刷新按钮（会出现一条让你确认的消息，点击上面的 “Continue”），就可以像下面高亮显示的一样看到 3 个容器了。

![Portainer-io-new-container-image][10]

点击上图中红圈圈出来的 “containers”，下一个页面会显示 “Dashboard Endpoint summary”。

![Portainer-io-Docker-Container-Dash][12]

在这个页面中，点击上图高亮和红圈圈出来的 “Containers”，就可以对容器进行监控了。

### 以简单的方式对容器进行监控

继续上面的步骤，就会出现一个如下所示精致、漂亮的 “Container list” 页面。

![Portainer-Container-List][14]

所有的容器都可以在这里进行控制（停止、启动等等）。

1、在这个页面上，停止我们之前启动的 “test” 容器（这是一个我们早先启动的 debian 容器）。

选中此容器前面的复选框，然后点击上面的“Stop”按钮来停止。

![Stop-Container-Portainer-io-dashboard][16]

在命令行中，你也会看到这个容器现在已经停止或退出了：

```
root@linuxtechi:~$ sudo docker container ls -a
CONTAINER ID        IMAGE                 COMMAND             CREATED             STATUS                       PORTS                    NAMES
d45902e717c0        debian                "bash"              21 minutes ago      Exited (0) 49 seconds ago                             test
08b96eddbae9        centos:7              "/bin/bash"         About an hour ago   Exited (137) 9 minutes ago                            mycontainer2
35286de9f2e2        portainer/portainer   "/portainer"        2 hours ago         Up About an hour             0.0.0.0:9000->9000/tcp   compassionate_benz
root@linuxtechi:~$
```

2、现在，在 Portainer 页面中启动已经停止的两个容器（test 和 mycontainer2）

选中已停止的这两个容器前面的复选框，然后点击 “Start”。

![Start-Containers-Portainer-GUI][18]

你会立即看到两条窗口提醒，内容是“容器成功启动”，并且两个容器的状态变为正在运行。

![Conatiner-Started-successfully-Portainer-GUI][20]

### 一步步探索其他多种选项和特性

1、点击高亮的“Images”，你会看到如下页面：

![Docker-Container-Images-Portainer-GUI][22]

这是可用的容器列表，其中一些可能没在运行。这些容器可以被导入、导出或者上传到不同的位置，截图如下所示。

![Upload-Docker-Container-Image-Portainer-GUI][24]

2、点击高亮的“Volumes”，显示如下页面：

![Volume-list-Portainer-io-gui][26]

3、通过下面的操作，可以很容易的添加卷。点击添加卷按钮，出现如下页面，在名称输入框中输入卷名称，例如 “myvol”，然后点击 “Create the volume” 按钮：

![Volume-Creation-Portainer-io-gui][28]

新创建的卷如下所示（状态为未使用）：

![Volume-unused-Portainer-io-gui][30]

### 结论

通过上面的安装步骤，你可以到配置和使用 Portainer.io 的多种选项是多么简单和精美，它提供了用于构建和监控 Docker 容器的多种功能和选项。如前所述，这个一个非常轻量的工具，因此不会给主机系统增加任何负担。下一组选项将在本系列的第 2 部分中进行探讨。

另请阅读: [用 Portainer.io 来监控和管理 Docker 容器（2）][32]

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/monitor-manage-docker-containers-portainer-part1/

作者：[Shashidhar Soppin][a]
选题：[lujun9972][b]
译者：[jlztan](https://github.com/jlztan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/shashidhar/
[b]: https://github.com/lujun9972
[1]: https://www.linuxtechi.com/how-to-setup-docker-on-ubuntu-server-16-04/
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-Login-User-Name-Password-1024x681.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-Login-User-Name-Password.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Connect-Portainer-Local-Docker-1024x538.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Connect-Portainer-Local-Docker.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-io-Docker-Monitor-Dashboard-1024x544.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-io-Docker-Monitor-Dashboard.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-Endpoints-1024x252.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-Endpoints.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-io-new-container-image-1024x544.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-io-new-container-image.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-io-Docker-Container-Dash-1024x544.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-io-Docker-Container-Dash.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-Container-List-1024x538.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Portainer-Container-List.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Stop-Container-Portainer-io-dashboard-1024x447.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Stop-Container-Portainer-io-dashboard.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Start-Containers-Portainer-GUI-1024x449.jpg
[19]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Start-Containers-Portainer-GUI.jpg
[20]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Conatiner-Started-successfully-Portainer-GUI-1024x538.jpg
[21]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Conatiner-Started-successfully-Portainer-GUI.jpg
[22]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Docker-Container-Images-Portainer-GUI-1024x544.jpg
[23]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Docker-Container-Images-Portainer-GUI.jpg
[24]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Upload-Docker-Container-Image-Portainer-GUI-1024x544.jpg
[25]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Upload-Docker-Container-Image-Portainer-GUI.jpg
[26]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Volume-list-Portainer-io-gui-1024x544.jpg
[27]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Volume-list-Portainer-io-gui.jpg
[28]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Volume-Creation-Portainer-io-gui-1024x544.jpg
[29]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Volume-Creation-Portainer-io-gui.jpg
[30]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Volume-unused-Portainer-io-gui-1024x544.jpg
[31]: https://www.linuxtechi.com/wp-content/uploads/2019/05/Volume-unused-Portainer-io-gui.jpg
[32]: https://www.linuxtechi.com/monitor-manage-docker-containers-portainer-io-part-2/
