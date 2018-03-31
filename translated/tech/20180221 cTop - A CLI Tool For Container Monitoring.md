cTop - 用于容器监控的 CLI 工具
======
最近 Linux 容器很火，我们中的大多数人甚至已经在使用它，同时一些人也开始学习它。

我们已经介绍了有名的 GUI（用户图形界面） 工具如 Portainer 和 Rancher 。这将会有助于我们通过 GUI 管理容器。

这篇指南将会通过 cTop 命令帮助我们理解和监控 Linux 容器。它是一个类似 top 命令的命令行工具。

### 什么是 cTop

[ctop][1] 为多个容器提供了一个简洁凝练的实时指标概览。它是一个类 Top 的针对容器指标的界面。

它展示了容器指标比如 CPU 利用率，内存利用率，磁盘 I/O 读写，进程 ID(PID)和网络发送（TX - 从此服务器发送）以及接受（RX - 此服务器接受）。

ctop 伴随着对 Docker 和 runc 的内建支持；对其他容器和集群系统的连接计划在未来版本中推出。
它不需要任何参数并且默认使用 Docker 主机变量。

**建议阅读：**
**(#)** [Portainer – 一个简单的 Docker 管理 GUI][2]
**(#)** [Rancher – 一个完整的生产环境容器管理平台][3]

### 如何安装 cTop

开发者提供了一个简单的 shell 脚本来帮助我们直接使用 ctop。我们要做的，只是在“/bin”目录下下载 ctop shell 文件来保证全局访问。最后给予 ctop 脚本文件执行权限。

在“/usr/local/bin”目录下下载 ctop shell 脚本。
```
$ sudo wget https://github.com/bcicen/ctop/releases/download/v0.7/ctop-0.7-linux-amd64 -O /usr/local/bin/ctop

```

对 ctop shell 脚本设置执行权限。
```
$ sudo chmod +x /usr/local/bin/ctop

```

另外你可以通过 docker 来安装和运行 ctop。在此之前先确保你已经安装过 docker。为了安装 docker，参考以下链接。

**建议阅读：**
**(#)** [如何在 Linux 上安装 Docker][4]
**(#)** [如何在 Linux 上玩转 Docker 镜像][5]
**(#)** [如何在 Linux 上玩转 Docker 容器][6]
**(#)** [如何在 Docker 容器中安装，运行应用][7]
```
$ docker run --rm -ti \
 --name=ctop \
 -v /var/run/docker.sock:/var/run/docker.sock \
 quay.io/vektorlab/ctop:latest

```

### 如何使用 cTop

直接启动 ctop 程序而不用任何参数。默认它与“a”键绑定来展示所有容器（运行的和没运行的）。
ctop 头部显示你的系统时间和容器的总数。
```
$ ctop

```

你可能得到以下类似输出。
![][9]

### 如何管理容器

你可以使用 ctop 来管理容器。选择一个你想要管理的容器然后按下“Enter”键，选择所需选项如 start,stop,remove 等。
![][10]

### 如何给容器排序

默认 ctop 使用 state 字段来给容器排序。按下“s”键来用不同的方面给容器排序。
![][11]

### 如何查看容器指标

如何你想要查看关于容器的更多细节和指标，只用选择你想要查看的相应容器然后按“o”键。
![][12]

### 如何查看容器日志

选择你想要查看日志的相应容器然后按“l”键。
![][13]

### 仅显示活动容器

使用“-a”选项运行 ctop 命令来仅显示活动容器
![][14]

### 打开帮助对话框

运行 ctop,只需按“h”键来打开帮助部分。
![][15]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux/

作者：[2DAYGEEK][a]
译者：[kimii](https://github.com/kimii)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/2daygeek/
[1]:https://github.com/bcicen/ctop
[2]:https://www.2daygeek.com/portainer-a-simple-docker-management-gui/
[3]:https://www.2daygeek.com/rancher-a-complete-container-management-platform-for-production-environment/
[4]:https://www.2daygeek.com/install-docker-on-centos-rhel-fedora-ubuntu-debian-oracle-archi-scentific-linux-mint-opensuse/
[5]:https://www.2daygeek.com/list-search-pull-download-remove-docker-images-on-linux/
[6]:https://www.2daygeek.com/create-run-list-start-stop-attach-delete-interactive-daemonized-docker-containers-on-linux/
[7]:https://www.2daygeek.com/install-run-applications-inside-docker-containers/
[8]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[9]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-1.png
[10]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-2.png
[11]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-3.png
[12]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-4a.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-7.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-5.png
[15]:https://www.2daygeek.com/wp-content/uploads/2018/02/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux-6.png
