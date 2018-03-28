如何使用 DockerHub
=====

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/dockerhub-container.jpg?itok=tvraxGzh)

在前面的文章中，我们了解到了 [Docker terminology][1] 的基础，在Linux 桌面，MacOS 和 Windows上 [如何安装 Docker][2]，[如何创建容器镜像][3] 并且在系统上运行它们。在本系列的最后一篇文章中，我们将讨论如何使用 DockerHub 中的镜像以及将自己的镜像发布到 DockerHub。

首先要做的是：什么是 DockerHub 以及为什么它很重要？DockerHub 是一个由 Docker Inc 运行和管理的基于云的存储库。它是一个在线存储库，Docker 镜像可以由其他用户发布和使用。它有公共和私人存储库。如果你是一家公司，你可以在你自己的组织内拥有一个私人存储库，这里的公共镜像可以被任何人使用。

你也可以使用公开发布的官方 Docker 镜像。我使用了很多这样的镜像，包括我的试验 WordPress 安装，KDE plasma 应用程序等等。虽然我们上次学习了如何创建自己的 Docker 镜像，但你不必这样做。DockerHub 上发布了数千镜像供你使用。DockerHub 作为默认注册表硬编码到 Docker 中，所以当你对任何镜像运行 docker pull 命令时，它将从 DockerHub 下载。

### 从 Docker Hub 下载镜像并在本地运行

请查看本系列的前几篇文章，以便开始阅读。然后，一旦 Docker 在你的系统上运行，你就可以打开终端并运行：
```
$ docker images
```

该命令将显示当前系统上所有的 docker 镜像。假设你想在本地机器上部署 Ubuntu；你可能会：
```
$ docker pull ubuntu
```

如果你的系统上已经存在 Ubuntu 镜像，那么该命令会自动将该系统更新到最新版本。因此，如果你想要更新现有的镜像，只需运行 docker pull 命令，易如反掌。这就像 apt-get update 一样，没有任何的混乱和麻烦。

你已经知道了如何运行镜像：
```
$ docker run -it <image name>

$ docker run -it ubuntu
```

命令提示符应该变为如下内容：
```
root@1b3ec4621737:/#
```

现在你可以运行任何属于 Ubuntu 的命令和实用程序，这些都被包含在内而且安全。你可以在 Ubuntu 上运行你想要的所有实验和测试。一旦你完成了测试，你就可以核对镜像并下载一个新的。在虚拟机中不存在系统开销。

你可以通过运行 exit 命令退出该容器：
```
$ exit
```

现在假设你想在系统上安装 Nginx，运行 search 命令来找到需要的镜像：
```
$ docker search nginx

aizMFFysICAEsgDDYrsrlqwoCgGbWVHtcOzgV9mA
```

正如你所看到的，DockerHub 上有很多 Nginx 镜像。为什么？因为任何人都可以发布镜像，各种镜像针对不同的项目进行了优化，因此你可以选择合适的镜像。你只需要为你的需求安装合适的镜像。

假设你想要拉取 Bitnami's Nginx 镜像：
```
$ docker pull bitnami/nginx
```

现在运行：
```
$ docker run -it bitnami/nginx
```

### 如何发布镜像到 Docker Hub？

在此之前，[我们学习了如何创建 Docker 镜像][3]，我们可以轻松地将该镜像发布到 DockerHub 中。首先，你需要登录 DockerHub，如果没有账户，请 [创建账户][5]。然后，你可以打开终端应用，登录：
```
$ docker login --username=<USERNAME>
```

将 &lt;USERNAME&gt; 替换为你自己的 Docker Hub 用户名。我这里是 arnieswap：
```
$ docker login --username=arnieswap
```

输入密码，你就登录了。现在运行 docker 镜像命令来获取你上次创建的镜像的 ID。
```
$ docker images

tW1jDOugkX7J2FfyFyToM6B8m5OYFwMba-Ag5aez
```

现在，假设你希望将 ng 镜像推送到 DockerHub，首先，我们需要标记该镜像（[了解更多关于标记的信息][1]）：
```
$ docker tag e7083fd898c7 arnieswap/my_repo:testing
```

现在推送镜像：
```
$ docker push arnieswap/my_repo
```

推送指向的是 [docker.io/arnieswap/my_repo] 仓库
```
12628b20827e: Pushed

8600ee70176b: Mounted from library/ubuntu

2bbb3cec611d: Mounted from library/ubuntu

d2bb1fc88136: Mounted from library/ubuntu

a6a01ad8b53f: Mounted from library/ubuntu

833649a3e04c: Mounted from library/ubuntu

testing: digest: sha256:286cb866f34a2aa85c9fd810ac2cedd87699c02731db1b8ca1cfad16ef17c146 size: 1569

```

哦耶！你的镜像正在上传。一旦完成，打开 DockerHub，登录到你的账户，你就能看到你的第一个 Docker 镜像。现在任何人都可以部署你的镜像。这是开发软件和发布软件最简单，最快速的方式。无论你何时更新镜像，用户都可以简单地运行：
```
$ docker run arnieswap/my_repo
```

现在你知道为什么人们喜欢 Docker 容器了。它解决了传统工作负载所面临的许多问题，并允许你在任何时候开发、测试和部署应用程序。通过遵循本系列中的步骤，你自己可以尝试以下。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2018/1/how-use-dockerhub

作者：[Swapnil Bhartiya][a]
译者：[MjSeven](https://github.com/MjSeven)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/arnieswap
[1]:https://www.linux.com/blog/intro-to-linux/2017/12/container-basics-terms-you-need-know
[2]:https://www.linux.com/blog/learn/intro-to-linux/how-install-docker-ce-your-desktop
[3]:https://www.linux.com/blog/learn/intro-to-linux/2018/1/how-create-docker-image
[4]:https://lh3.googleusercontent.com/aizMFFysICAEsgDDYrsrlqwoCgGbWVHtcOzgV9mAtV8IdBZgHPJTdHIZhWBNCRvOyJb108ZBajJ_Nz10yCxGSvk-AF-yvFxpojLdVu3Jjihcwaup6CQLc67A5nglBuGDaOZWcrbV
[5]:https://hub.docker.com/
[6]:https://lh6.googleusercontent.com/tW1jDOugkX7J2FfyFyToM6B8m5OYFwMba-Ag5aezVGf2A5gsKJ47QrCh_TOKWgIKfE824Uc2Cwwwj9jWps1yJlUZqDyIceVQs-nEbKavFDxuUxLyd4thBA4_rsXrQH4r7hrG8FnD
