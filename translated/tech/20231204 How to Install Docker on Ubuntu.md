[#]: subject: "How to Install Docker on Ubuntu"
[#]: via: "https://itsfoss.com/install-docker-ubuntu/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Ubuntu 上安装 Docker
======

使用 Docker 意味着开启一个新的计算领域，但如果你刚刚开始使用 Docker，安装可能看起来是一项艰巨的任务。

在 Ubuntu 上安装 Docker 有两种推荐的方法：

   * **从 Ubuntu 的仓库安装 Docker** ：简单的单行命令，但提供旧版本
   * **使用 Docker 的官方仓库**：工作量稍多，但提供了最新的稳定版本



我将在本教程中讨论它们。

### 方法 1：使用 Ubuntu 的仓库安装 Docker

如果你不关心旧版本，并且不想设置和管理仓库，那么这是最适合你的方法。

从更新仓库索引开始：

````

     sudo apt update

````

现在，你可以使用以下命令在 Ubuntu 中安装 Docker 以及 [Docker Compose][1]：

````

     sudo apt install docker.io docker-compose

````

📋

Docker 包被命名为 docker.io，因为甚至在 Docker 出现之前就已经存在一个名为 docker（用于 Dockerlet 应用）的过渡包。因此，Docker 包必须被命名为其他名称。

安装完成后，你可以使用以下命令检查安装的版本：

````

     docker -v

````

![][2]

如你所见，它给了我 Docker 24.0.5。

### 方法 2：在 Ubuntu 中安装最新稳定版本的 Docker

如果你想要 Docker 的最新稳定版本，那么你可以从其官方仓库安装 Docker。

#### 步骤 1：删除任何现有的 Docker 包

但在跳到安装部分之前，有必要删除所有以前安装的 Docker。

要[卸载以前的 Docker][3]，请使用以下命令。

````

     sudo apt remove docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc

````

#### 步骤 2：安装依赖项

第一步是安装一些必要的软件包，这些软件包将用于在本教程后面安装 Docker：

````

     sudo apt install ca-certificates curl gnupg lsb-release

````

你可能已经安装了部分或全部这些软件包，但确认安装没有什么坏处。上面的命令不会伤害你。

#### 步骤 3：添加 Docker 仓库的 GPG 密钥并将其添加到 sources.list

现在，通过 apt 包管理器创建一个具有特殊权限的目录，用于存储加密密钥以进行包验证：

````

     sudo install -m 0755 -d /etc/apt/keyrings

````

接下来，如下所示[使用 curl 命令][4]下载并导入 Docker 的 GPG 密钥环：

```

    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

```

下载 GPG 密钥后，[使用 chmod 命令更改文件权限][5]，以便系统上的每个用户都可以读取 GPG 密钥：

````

     sudo chmod a+r /etc/apt/keyrings/docker.gpg

````

最后，将 Docker 仓库添加到 `sources.list.d` 文件中：

```

    echo \
      "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
      $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
      sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

```

就是这样！

#### 步骤 4：安装 Docker 和 Docker Compose

现在，要使你对系统所做的更改生效，请更新系统仓库：

````

     sudo apt update

````

使用以下命令获取最新版本的 Docker 以及其他 Docker 组件和依赖项：

````

     sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

````

📋

虽然 docker.io 包安装了大部分必需的 Docker 组件，但你需要在此处单独进行安装。

要检查已安装的版本，请使用以下命令：

````

     docker -v

````

![][6]

测试安装的另一个方法是在 Docker 中使用 Hello World 镜像。

让我告诉你如何做。

### 使用 hello-world 镜像来验证 Docker 安装

运行 Hello World 程序是我们启动任何编程之旅时都遵循的标准做法，Docker 也是如此。

Docker 为你提供了一个 Hello World 镜像，你可以使用它来测试安装。

要安装并运行 Hello World 映像，只需使用以下命令：

````

     sudo docker run hello-world

````

![][7]

某些用户在执行上述命令时可能会收到错误消息“无法连接到 Docker 守护进程”：

![][8]

在这种情况下，**重新启动系统**并再次尝试安装 Docker Hello World 镜像，它将正常工作。

### 💡额外提示：在 Ubuntu 中使用 docker 而无需 sudo

如果你注意到了，我使用 sudo 来拉取 docker 镜像，这并不是使用 Docker 最方便的方式。

如果你尝试在不使用 sudo 的情况下使用 Docker，则会出现错误：

![][9]

好吧，在本节中，我将向你展示如何在没有 sudo 的情况下使用 Docker。

📋

要执行所示步骤，必须具有超级用户权限！

第一步是使用以下命令[创建一个名为 `Docker` 的新组][10]：

````

     sudo groupadd docker

````

完成后，使用以下命令将用户添加到 Docker 组：

````

     sudo usermod -aG docker <用户名>

````

🚧

确保你只添加具有超级用户权限的用户。

现在，注销并重新登录以使更改生效。但如果你使用的是虚拟机，那么必须重新启动。

就是这样！从现在开始，你可以使用 docker 命令而不需要 sudo，就像我运行 Docker Hello World 镜像一样：

![][11]

就这样吧。

### 这是安装 Docker 后要做的事情

如果你刚刚开始，请参阅每个用户都必须了解的[基本 Docker 命令列表][12]：

![][13]

我希望你觉得会有帮助。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-docker-ubuntu/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/docker-compose-quick-start/
[2]: https://itsfoss.com/content/images/2023/12/Check-the-installed-version-of-docker-in-Ubuntu.png
[3]: https://learnubuntu.com/uninstall-docker/
[4]: https://learnubuntu.com/install-curl/
[5]: https://learnubuntu.com/chmod-command/
[6]: https://itsfoss.com/content/images/2023/12/Install-the-latest-version-of-Docker-in-Ubuntu-using-Docker-s-official-repository.png
[7]: https://itsfoss.com/content/images/2023/12/Run-hello-world-docker-image-in-Ubuntu.png
[8]: https://itsfoss.com/content/images/2023/12/Docker-error.png
[9]: https://itsfoss.com/content/images/2023/12/Docker-sudo-error-in-Ubuntu.png
[10]: https://learnubuntu.com/add-group/
[11]: https://itsfoss.com/content/images/2023/12/Use-docker-without-sudo-in-Ubuntu.png
[12]: https://linuxhandbook.com/essential-docker-commands/
[13]: https://linuxhandbook.com/content/images/size/w256h256/2021/08/Linux-Handbook-New-Logo.png
