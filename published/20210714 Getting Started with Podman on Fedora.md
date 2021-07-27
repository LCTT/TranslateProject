[#]: subject: (Getting Started with Podman on Fedora)
[#]: via: (https://fedoramagazine.org/getting-started-with-podman-in-fedora/)
[#]: author: (Yazan Monshed https://fedoramagazine.org/author/yazanalmonshed/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13615-1.html)

如何在 Fedora 上使用 Podman
======

![][1]

[Podman][2] 是一个无守护程序的容器引擎，用于在你的 Linux 系统上开发、管理和运行 OCI 容器。在这篇文章中，我们将介绍 Podman 以及如何用 nodejs 构建一个小型应用来使用它。该应用将是非常简单和干净的。

### 安装 Podman

Podman 的命令就与 [docker][3] 相同，如果你已经安装了 Docker，只需在终端输入 `alias docker=podman`。

在 Fedora 中，Podman 是默认安装的。但是如果你因为任何原因没有安装，你可以用下面的命令安装它：

```
sudo dnf install podman
```

对于 Fedora [silverblue][4] 用户，Podman 已经安装在你的操作系统中了。

安装后，运行 “hello world” 镜像，以确保一切正常：

```
podman pull hello-world
podman run hello-world
```

如果一切运行良好，你将在终端看到以下输出：

```
Hello from Docker!
This message shows that your installation appears to be working correctly.
 To generate this message, Docker took the following steps:
  1.The Docker client contacted the Docker daemon.
  2.The Docker daemon pulled the "hello-world" image from the Docker Hub. (amd64)
  3.The Docker daemon created a new container from that image which runs the executable that produces the output you are currently reading.
  4.The Docker daemon streamed that output to the Docker client, which sent it to your terminal.
 To try something more ambitious, you can run an Ubuntu container with:
  $ docker run -it ubuntu bash
 Share images, automate workflows, and more with a free Docker ID:
  https://hub.docker.com/
 For more examples and ideas, visit:
  https://docs.docker.com/get-started/
```

### 简单的 Nodejs 应用

首先，我们将创建一个文件夹 `webapp`，在终端输入以下命令：

```
mkdir webapp && cd webapp
```

现在创建文件 `package.json`，该文件包括项目运行所需的所有依赖项。在文件 `package.json` 中复制以下代码：

```
{
       "dependencies": {
               "express": "*"
       },
       "scripts": {
               "start": "node index.js"
       }
}
```

创建文件 `index.js`，并在其中添加以下代码：

```
const express = require('express')

const app = express();

app.get('/', (req, res)=> {
       res.send("Hello World!")
});
app.listen(8081, () => {
       console.log("Listing on port 8080");
});
```

你可以从 [这里][5] 下载源代码。

### 创建 Dockerfile

首先，创建一个名为 `Dockerfile` 的文件，并确保第一个字符是大写，而不是小写，然后在那里添加以下代码：

```
FROM node:alpine
WORKDIR usr/app
COPY ./ ./
RUN npm install
CMD ["npm", "start"]
```

确保你在 `webapp` 文件夹内，然后显示镜像，然后输入以下命令：

```
podman build .
```

确保加了 `.`。镜像将在你的机器上创建，你可以用以下命令显示它：

```
podman images
```

最后一步是输入以下命令在容器中运行该镜像：

```
podman run -p 8080:8080 <image-name>
```

现在在你的浏览器中打开 `localhost:8080`，你会看到你的应用已经工作。

### 停止和删除容器

使用 `CTRL-C` 退出容器，你可以使用容器 ID 来删除容器。获取 ID 并使用这些命令停止容器：

```
podman ps -a
podman stop <container_id>
```

你可以使用以下命令从你的机器上删除镜像：

```
podman rmi <image_id>
```

在 [官方网站][2] 上阅读更多关于 Podman 和它如何工作的信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/getting-started-with-podman-in-fedora/

作者：[Yazan Monshed][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/yazanalmonshed/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/06/Get_Started_w_Podman_on_Fedora-816x345.jpg
[2]: https://podman.io/
[3]: https://www.docker.com/
[4]: https://silverblue.fedoraproject.org/
[5]: https://github.com/YazanALMonshed/webapp
