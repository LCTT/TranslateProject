Dry – 一个命令行交互式 Docker 容器管理器
======
Docker 是一种实现操作系统级别虚拟化或容器化的软件。

基于 Linux 内核的 cgroups 和 namespaces 等资源隔离特性，Docker 可以在单个 Linux 实例中运行多个独立的容器。

通过将应用依赖和相关库打包进容器，Docker 使得应用可以在容器中安全隔离地运行。

### Dry 是什么

[Dry][1] 是一个管理并监控 Docker 容器和镜像的命令行工具。

Dry 给出容器相关的信息，包括对应镜像、容器名称、网络、容器中运行的命令及容器状态；如果运行在 Docker Swarm 中，工具还会给出 Swarm 集群的各种状态信息。

Dry 可以连接至本地或远程的 Docker 守护进程。如果连接本地 Docker，Docker 主机显示为`unix:///var/run/docker.sock`。

如果连接远程 Docker，Docker 主机显示为 `tcp://IP Address:Port Number` 或 `tcp://Host Name:Port Number`。

Dry 可以提供类似 `docker ps` 的指标输出，但输出比 “docker ps” 内容详实、富有色彩。

相比 Docker，Dry 还可以手动添加一个额外的名称列，用于降低记忆难度。

***推荐阅读：**

**(#)** [Portainer – 用于 Docker 管理的简明 GUI][2]
**(#)** [Rancher – 适用于生产环境的完备容器管理平台][3]
**(#)** [cTop – Linux环境下容器管理与监控的命令行工具][4]

### 如何在 Linux 中安装 Dry

在 Linux 中，可以通过一个简单的 shell 脚本安装最新版本的 dry 工具。Dry 不依赖外部库。对于绝大多数的 Docker 命令，dry 提供类似样式的命令。
```
$ curl -sSf https://moncho.github.io/dry/dryup.sh | sudo sh
 % Total % Received % Xferd Average Speed Time Time Time Current
 Dload Upload Total Spent Left Speed
100 10 100 10 0 0 35 0 --:--:-- --:--:-- --:--:-- 35
dryup: downloading dry binary
######################################################################## 100.0%
dryup: Moving dry binary to its destination
dryup: dry binary was copied to /usr/local/bin, now you should 'sudo chmod 755 /usr/local/bin/dry'

```

使用如下命令将文件权限变更为 `755`
```
$ sudo chmod 755 /usr/local/bin/dry

```

对于使用 Arch Linux 的用户，可以使用 **[Packer][5]** or **[Yaourt][6]** 包管理器，从 AUR 源安装该工具。
```
$ yaourt -S dry-bin
或者
$ packer -S dry-bin

```

如果希望在 Docker 容器中运行 dry，可以运行如下命令。前提条件是已确认在操作系统中安装了 Docker。

**推荐阅读：**
**(#)** [如何在 Linux 中安装 Docker][7]
**(#)** [如何在 Linux 中玩转 Docker 镜像][8]
**(#)** [如何在 Linux 中玩转 Docker 容器][9]
**(#)** [如何在 Docker 容器中安装并运行应用程序][10]
```
$ docker run -it -v /var/run/docker.sock:/var/run/docker.sock moncho/dry

```

### 如何启动并运行 Dry

在控制台运行 `dry` 命令即可启动该工具，其默认输出如下：
```
$ dry

```

![][12]

### 如何使用 Dry 监控 Docker

你可以在 dry 的界面中按下 `m` 键打开监控模式。
![][13]

### 如何使用 Dry 管理容器

在选中的容器上单击 `Enter` 键，即可管理容器。Dry 提供如下操作：查看日志，查看、杀死、删除容器，停止、启动、重启容器，查看容器状态及镜像历史记录等。
![][14]

### 如何监控容器资源利用率

用户可以使用 `Stats+Top` 选项查看指定容器的资源利用率。

该操作需要在容器管理界面完成(在上一步的基础上，点击 `Stats+Top` 选项)。另外，也可以按下 `s` 打开容器资源利用率界面。

![][15]

### 如何查看容器、镜像及本地卷的磁盘使用情况

可以使用 `F8` 键查看容器、镜像及本地卷的磁盘使用情况。

该界面明确地给出容器、镜像和卷的总数，哪些处于使用状态，以及整体磁盘使用情况、可回收空间大小的详细信息。
![][16]

### 如何查看已下载的镜像

按下 `2` 键即可列出全部的已下载镜像。
![][17]

### 如何查看网络列表

按下 `3` 键即可查看全部网络及网关。
![][18]

### 如何查看全部 Docker 容器

按下 `F2` 键即可列出列出全部容器，包括运行中和已关闭的容器。
![][19]

### Dry 快捷键

查看帮助页面或 [dry github][1] 即可查看全部快捷键。

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/dry-an-interactive-cli-manager-for-docker-containers/

作者：[Magesh Maruthamuthu][a]
译者：[pinewall](https://github.com/pinewall)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
[1]:https://github.com/moncho/dry
[2]:https://www.2daygeek.com/portainer-a-simple-docker-management-gui/
[3]:https://www.2daygeek.com/rancher-a-complete-container-management-platform-for-production-environment/
[4]:https://www.2daygeek.com/ctop-a-command-line-tool-for-container-monitoring-and-management-in-linux/
[5]:https://www.2daygeek.com/install-packer-aur-helper-on-arch-linux/
[6]:https://www.2daygeek.com/install-yaourt-aur-helper-on-arch-linux/
[7]:https://www.2daygeek.com/install-docker-on-centos-rhel-fedora-ubuntu-debian-oracle-archi-scentific-linux-mint-opensuse/
[8]:https://www.2daygeek.com/list-search-pull-download-remove-docker-images-on-linux/
[9]:https://www.2daygeek.com/create-run-list-start-stop-attach-delete-interactive-daemonized-docker-containers-on-linux/
[10]:https://www.2daygeek.com/install-run-applications-inside-docker-containers/
[11]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[12]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-1.png
[13]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-2.png
[14]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-3.png
[15]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-4.png
[16]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-5.png
[17]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-6.png
[18]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-7.png
[19]:https://www.2daygeek.com/wp-content/uploads/2018/03/dry-an-interactive-cli-manager-for-docker-containers-8.png
