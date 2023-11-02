[#]: subject: "Install Docker on Arch Linux"
[#]: via: "https://itsfoss.com/install-docker-arch-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

在 Arch Linux 上安装 Docker
======

在 Arch Linux 上安装 Docker 很简单。它可以在 Extra 仓库中找到，你可以简单地[执行 pacman 魔法][1]：

````

     sudo pacman -S docker

````

但要在 Arch Linux 上正确运行 Docker，还需要执行更多步骤。

### 让 Arch Docker 做好准备

这一切都归结为以下步骤：

   * 从 Arch 仓库安装 Docker
   * 启动 Docker 守护进程并在每次启动时自动运行
   * 将用户添加到 docker 组以运行 docker 命令而无需 sudo



让我们看看详细步骤。

#### 步骤 1：安装 Docker 包

打开终端并使用以下命令：

````

     sudo pacman -S docker

````

输入密码并在询问时按 Y。

![][2]

这可能需要一些时间，具体取决于你使用的镜像。

💡

如果你看到找不到包或 404 错误，那么你的同步数据库可能是旧的。使用以下命令更新系统（它将下载大量软件包并需要时间）： sudo pacman -Syu

#### 步骤 2：启动 docker 守护进程

Docker 已安装但未运行。你应该在**第一次运行 Docker 命令**之前启动 dcoker 守护进程：

````

     sudo systemctl start docker.service

````

我还建议启用 Docker 服务，以便 docker 守护进程在系统启动时自动启动。

````

     sudo systemctl enable docker.service

````

这样，你就可以开始运行 docker 命令了。你不再需要手动启动 docker 服务。

![][3]

#### 步骤 3：将用户添加到 docker 组

Docker 已安装并且 Docker 服务正在运行。你几乎已准备好运行 docker 命令。

但是，默认情况下，你需要将 sudo 与 docker 命令一起使用。这很烦人。

为了避免在每个 docker 命令中使用 sudo，你可以将自己（或任何其他用户）添加到 docker 组，如下所示：

````

     sudo usermod -aG docker $USER

````

**你必须注销（或关闭终端）并重新登录才能使上述更改生效。如果你不想这样做，请使用以下命令：**

````

     newgrp docker

````

现在已经准备好了。我们来测试一下。

#### 步骤 4：验证 docker 安装

docker 本身提供了一个很小的 docker 镜像来测试 docker 安装。运行它并查看是否一切正常：

````

     docker run hello-world

````

你应该看到类似这样的输出，表明 docker 成功运行：

![][4]

恭喜！ 你已经在 Arch Linux 上成功安装了 Docker。

### 可选：安装 Docker Compose

Docker Compose 已经成为 Docker 不可或缺的一部分。它允许你管理多个容器应用。

较早的经典 compose 由 `docker-compose` Python 软件包提供。Docker 还将其移植到 Go 中，并通过 `docker compose` 提供，但该软件包附带 [Docker Desktop][5]。

在这个阶段，我建议使用经典的 docker-compose 插件并使用以下命令安装它：

````

     sudo pacman -S docker-compose

````

![][6]

### 故障排除技巧

以下是你可能遇到的一些常见问题以及可能的解决方案：

#### Tab 补全不适用于 docker 子命令

如果你想对 docker 命令选项使用 tab 补全（例如将 im 补全到 images 等），请安装 bash-completion 包：

````

     sudo pacman -S bash-完成

````

关闭终端并启动一个新终端。你现在应该能够通过 Docker 命令使用 tab 补全功能。

#### 无法连接到 Docker 守护进程错误

如果你看到以下错误：

````

     docker: Cannot connect to the Docker daemon at unix:///var/run/docker.sock. Is the docker daemon running?.
     See 'docker run --help'.

````

那是因为 docker 守护进程没有运行。参考步骤 2，启动 docker 服务，确保其正在运行并启用它，以便 docker 守护进程在每次启动时自动运行。

````

     sudo systemctl start docker.service

     sudo systemctl enable docker.service

````

#### 尝试连接到 Docker 守护程序套接字时权限被拒绝

如果你看到此错误：

````

     ddocker: permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Post "http://%2Fvar%2Frun%2Fdocker.sock/v1.24/containers/create": dial unix /var/run/docker.sock: connect: permission denied.
     See 'docker run --help'.

````

这是因为你需要使用 sudo 运行 docker 命令，或者将用户添加到 docker 组以在不使用 sudo 的情况下运行 docker 命令。

我希望这篇简短的文章可以帮助你在 Arch Linux 上运行 Docker。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-docker-arch-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/pacman-command/
[2]: https://itsfoss.com/content/images/2023/10/installing-docker-arch-linux.png
[3]: https://itsfoss.com/content/images/2023/10/start-docker-daemon-arch-linux.png
[4]: https://itsfoss.com/content/images/2023/10/docker-running-successfully-arch-linux.png
[5]: https://www.docker.com/products/docker-desktop/
[6]: https://itsfoss.com/content/images/2023/10/install-docker-compose.png
