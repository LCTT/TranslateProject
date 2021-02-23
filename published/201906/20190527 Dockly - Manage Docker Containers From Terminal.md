[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10925-1.html)
[#]: subject: (Dockly – Manage Docker Containers From Terminal)
[#]: via: (https://www.ostechnix.com/dockly-manage-docker-containers-from-terminal/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Dockly：从终端管理 Docker 容器
======

![](https://img.linux.net.cn/data/attachment/album/201906/01/144422bfwx1e7fqx1ee11x.jpg)

几天前，我们发布了一篇指南，其中涵盖了[开始使用 Docker][2] 时需要了解的几乎所有细节。在该指南中，我们向你展示了如何详细创建和管理 Docker 容器。还有一些可用于管理 Docker 容器的非官方工具。如果你看过我们以前的文章，你可能会看到两个基于 Web 的工具，[Portainer][3] 和 [PiCluster][4]。它们都使得 Docker 管理任务在 Web 浏览器中变得更加容易和简单。今天，我遇到了另一个名为 Dockly 的 Docker 管理工具。

与上面的工具不同，Dockly 是一个 TUI（文本界面）程序，用于在类 Unix 系统中从终端管理 Docker 容器和服务。它是使用 NodeJS 编写的自由开源工具。在本简要指南中，我们将了解如何安装 Dockly 以及如何从命令行管理 Docker 容器。

### 安装 Dockly

确保已在 Linux 上安装了 NodeJS。如果尚未安装，请参阅以下指南。

* [如何在 Linux 上安装 NodeJS][5]

安装 NodeJS 后，运行以下命令安装 Dockly：

```
# npm install -g dockly
```

### 使用 Dockly 在终端管理 Docker 容器

使用 Dockly 管理 Docker 容器非常简单！你所要做的就是打开终端并运行以下命令：

```
# dockly
```

Dockly 将通过 unix 套接字自动连接到你的本机 docker 守护进程，并在终端中显示正在运行的容器列表，如下所示。

![][6]

*使用 Dockly 管理 Docker 容器*

正如你在上面的截图中看到的，Dockly 在顶部显示了运行容器的以下信息：

* 容器 ID，
* 容器名称，
* Docker 镜像，
* 命令，
* 运行中容器的状态，
* 状态。

在右上角，你将看到容器的 CPU 和内存利用率。使用向上/向下箭头键在容器之间移动。

在底部，有少量的键盘快捷键来执行各种 Docker 管理任务。以下是目前可用的键盘快捷键列表：

* `=`  - 刷新 Dockly 界面，
* `/`  - 搜索容器列表视图，
* `i`  - 显示有关当前所选容器或服务的信息，
* `回车`  - 显示当前容器或服务的日志，
* `v`  - 在容器和服务视图之间切换，
* `l`  - 在选定的容器上启动 `/bin/bash` 会话，
* `r`  - 重启选定的容器，
* `s`  - 停止选定的容器，
* `h`  - 显示帮助窗口，
* `q`  - 退出 Dockly。

#### 查看容器的信息

使用向上/向下箭头选择一个容器，然后按 `i` 以显示所选容器的信息。

![][7]

*查看容器的信息*

#### 重启容器

如果你想随时重启容器，只需选择它并按 `r` 即可重新启动。

![][8]

*重启 Docker 容器*

#### 停止/删除容器和镜像

如果不再需要容器，我们可以立即停止和/或删除一个或所有容器。为此，请按 `m` 打开菜单。

![][9]

*停止，删除 Docker 容器和镜像*

在这里，你可以执行以下操作。

* 停止所有 Docker 容器，
* 删除选定的容器，
* 删除所有容器，
* 删除所有 Docker 镜像等。

#### 显示 Dockly 帮助部分

如果你有任何疑问，只需按 `h` 即可打开帮助部分。

![][10]

*Dockly 帮助*

有关更多详细信息，请参考最后给出的官方 GitHub 页面。

就是这些了。希望这篇文章有用。如果你一直在使用 Docker 容器，请试试 Dockly，看它是否有帮助。

建议阅读：

  * [如何自动更新正在运行的 Docker 容器][11]
  * [ctop：一个 Linux 容器的命令行监控工具][12]

资源：

  * [Dockly 的 GitHub 仓库][13]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/dockly-manage-docker-containers-from-terminal/

作者：[sk][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/Dockly-720x340.png
[2]: https://www.ostechnix.com/getting-started-with-docker/
[3]: https://www.ostechnix.com/portainer-an-easiest-way-to-manage-docker/
[4]: https://www.ostechnix.com/picluster-simple-web-based-docker-management-application/
[5]: https://www.ostechnix.com/install-node-js-linux/
[6]: http://www.ostechnix.com/wp-content/uploads/2019/05/Manage-Docker-Containers-Using-Dockly.png
[7]: http://www.ostechnix.com/wp-content/uploads/2019/05/View-containers-information.png
[8]: http://www.ostechnix.com/wp-content/uploads/2019/05/Restart-containers.png
[9]: http://www.ostechnix.com/wp-content/uploads/2019/05/stop-remove-containers-and-images.png
[10]: http://www.ostechnix.com/wp-content/uploads/2019/05/Dockly-Help.png
[11]: https://www.ostechnix.com/automatically-update-running-docker-containers/
[12]: https://www.ostechnix.com/ctop-commandline-monitoring-tool-linux-containers/
[13]: https://github.com/lirantal/dockly
