[#]: subject: "Convert Docker Run Commands Into Docker-Compose Files"
[#]: via: "https://ostechnix.com/convert-docker-run-commands-into-docker-compose-files/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14970-1.html"

将 Docker 命令转化为 Docker Compose 文件
======

![](https://img.linux.net.cn/data/attachment/album/202208/27/150501vw3eqx2xkexemmkc.jpg)

> 使用 Composerize 从 `docker run` 命令创建 Docker Compose 文件

如果你每天在正式或个人系统中使用 Docker，你应该知道有一个有用的应用叫 **Composerize**。在这个简短的指南中，我们将了解什么是 Composerize，以及如何使用 Composerize 在 Linux 中**将 `docker run` 命令转换为 Docker Compose 文件**格式。

### 什么是 Composerize？

[Docker Compose][1] 是一个用于定义和运行多容器 Docker 应用的工具。Docker Compose 只是一个 YAML 文件，我们在其中为 Docker 应用定义服务、网络和卷。

不是每个人都擅长写高效的 Docker Compose 文件。你们中的一些人可能会发现，甚至写一个简单的 Docker Compose 文件都很困难。不用担心! 看下 Composerize，它可以帮助你从 `docker run` 命令中创建 Docker Compose 文件。

Composerize 是一个命令行和基于网络的工具，可以将 `docker run` 命令转换成 Docker Compose 文件。

无论 `docker run` 命令是简单、简短还是冗长、复杂，都没有关系。你所要做的就是把命令传给 Conposerize。Composerize 会立即将 `docker run` 命令变成 Docker Compose 文件！

### 在 Linux 中安装 Composerize

Composerize 是作为一个网络服务提供的。所以你不需要在你的系统上安装它。如果你因为任何原因想在本地安装它，请继续阅读。

Composerize 可以用 npm 安装。确保你的系统中已经安装了 Nodejs。如果没有安装，请按照下面的链接来安装 Nodejs。

* **[如何在 Linux 上安装 NodeJS][2]**

安装完 Nodejs 后，运行以下命令来安装 Composerize：

```
$ npm install composerize
```

该命令将只为当前用户安装 Composerize。

如果你想在全局（全系统）安装它，请运行上述命令并加上 `-g` 选项，如下所示。

```
$ npm install composerize -g
```

### 用 Composerize 将 Docker 命令转换为 Docker Compose 文件

要将 `docker run` 命令转换为 Docker Compose 格式，只需用 Composerize 运行它，如下所示：

```
$ composerize docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer
```

它将以 Docker Compose 文件格式生成内容。

示例输出：

```
version: '3.3'
services:
    portainer:
        ports:
            - '9000:9000'
        volumes:
            - '/var/run/docker.sock:/var/run/docker.sock'
        image: portainer/portainer
```

![Convert Docker Run Commands Into Docker-Compose Files With Composerize][3]

现在在你的 `docker-compose.yml` 文件中复制上面几行。就这么简单！

正如我所说，你也可以使用 Composerize 网络服务将 `docker run` 命令转换成 Docker Compose 格式。

进入 [https://www.composerize.com/][4]，将 `docker run` 命令粘贴到框中，你就会立即得到 `docker-compose.yml` 文件！

![Turn Docker Run Commands Into Docker-compose Files Using Composerize][5]

将命令转换为 Docker Compose 文件后，到你保存 `docker-compose.yml` 文件的位置，运行以下命令来启动 Docker 应用：

```
$ docker-compose up
```

Composerize 是对 Docker 用户有用的工具之一。你现在可以安全地告别漫无边际的 Docker 命令了。

资源：

* [Composerize GitHub 仓库][6]

--------------------------------------------------------------------------------

via: https://ostechnix.com/convert-docker-run-commands-into-docker-compose-files/

作者：[sk][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/introduction-to-docker-compose/
[2]: https://ostechnix.com/install-node-js-linux/
[3]: https://ostechnix.com/wp-content/uploads/2022/08/Convert-Docker-Run-Commands-Into-Docker-Compose-Files-With-Composerize.png
[4]: https://www.composerize.com/
[5]: https://ostechnix.com/wp-content/uploads/2022/08/Turn-Docker-Run-Commands-Into-Docker-compose-Files-Using-Composerize.png
[6]: https://github.com/magicmark/composerize
