为什么要在 Docker 中使用 R？ 一位 DevOps 的看法
============================================================

 [![opencpu logo](https://i1.wp.com/www.opencpu.org/images/stockplot.png?w=456&ssl=1)][11] 

> R 语言，一种自由软件编程语言与操作环境，主要用于统计分析、绘图、数据挖掘。R 内置多种统计学及数字分析功能。R 的另一强项是绘图功能，制图具有印刷的素质，也可加入数学符号。——引自维基百科。

已经有几篇关于为什么要在 Docker 中使用 R 的文章。在这篇文章中，我将尝试加入一个 DevOps 的观点，并解释在 OpenCPU 系统的环境中如何使用容器化 R 来构建和部署 R 服务器。

> 有在 [#rstats][2] 世界的人真正地写过*为什么*他们使用 Docker，而不是*如何*么？
>
> — Jenny Bryan (@JennyBryan) [September 29, 2017][3]

### 1：轻松开发

OpenCPU 系统的旗舰是  [OpenCPU 服务器][12]：它是一个成熟且强大的 Linux 栈，用于在系统和应用程序中嵌入 R。因为 OpenCPU 是完全开源的，我们可以在 DockerHub 上构建和发布。可以使用以下命令启动一个可以立即使用的 OpenCPU 和 RStudio 的 Linux 服务器（使用端口 8004 或 80）：

```
docker run -t -p 8004:8004 opencpu/rstudio
```

现在只需在你的浏览器打开 http://localhost:8004/ocpu/ 和 http://localhost:8004/rstudio/ 即可！在 rstudio 中用用户 `opencpu`（密码：`opencpu`）登录来构建或安装应用程序。有关详细信息，请参阅[自述文件][15]。

Docker 让开始使用 OpenCPU 变得简单。容器给你一个充分灵活的 Linux 机器，而无需在系统上安装任何东西。你可以通过 rstudio 服务器安装软件包或应用程序，也可以使用 `docker exec` 进入到正在运行的服务器的 root shell 中：

```
# Lookup the container ID
docker ps

# Drop a shell
docker exec -i -t eec1cdae3228 /bin/bash
```

你可以在服务器的 shell 中安装其他软件，自定义 apache2 的 httpd 配置（auth，代理等），调整 R 选项，通过预加载数据或包等来优化性能。

### 2： 通过 DockerHub 发布和部署

最强大的是，Docker 可以通过 DockerHub 发布和部署。要创建一个完全独立的应用程序容器，只需使用标准的 [opencpu 镜像][16]并添加你的程序。

出于本文的目的，我通过在每个仓库中添加一个非常简单的 “Dockerfile”，将一些[示例程序][17]打包为 docker 容器。例如：[nabel][18] 的 [Dockerfile][19] 包含以下内容：

```
FROM opencpu/base

RUN R -e 'devtools::install_github("rwebapps/nabel")'
```

它采用标准的 [opencpu/base][20] 镜像，并从 Github [仓库][21]安装 nabel。最终得到一个完全隔离、独立的程序。任何人可以使用下面这样的命令启动程序：

```
docker run -d 8004:8004 rwebapps/nabel
```

`-d` 代表守护进程监听 8004 端口。很显然，你可以调整 `Dockerfile` 来安装任何其它的软件或设置你需要的程序。

容器化部署展示了 Docker 的真正能力：它可以发布可以开箱即用的独立软件，而无需安装任何软件或依赖付费托管的服务。如果你更喜欢专业的托管，那会有许多公司乐意在可扩展的基础设施上为你托管 docker 程序。

### 3： 跨平台构建

还有 Docker 用于 OpenCPU 的第三种方式。每次发布，我们都构建 6 个操作系统的 `opencpu-server` 安装包，它们在 [https://archive.opencpu.org][22] 上公布。这个过程已经使用 DockerHub 完全自动化了。以下镜像从源代码自动构建所有栈：

* [opencpu/ubuntu-16.04][4]
* [opencpu/debian-9][5]
* [opencpu/fedora-25][6]
* [opencpu/fedora-26][7]
* [opencpu/centos-6][8]
* [opencpu/centos-7][9]

当 GitHub 上发布新版本时，DockerHub 会自动重建此镜像。要做的就是运行一个[脚本][23]，它会取回镜像并将 `opencpu-server` 二进制复制到[归档服务器上][24]。

--------------------------------------------------------------------------------

via: https://www.r-bloggers.com/why-use-docker-with-r-a-devops-perspective/

作者：[Jeroen Ooms][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.r-bloggers.com/author/jeroen-ooms/
[1]:https://www.opencpu.org/posts/opencpu-with-docker/
[2]:https://twitter.com/hashtag/rstats?src=hash&ref_src=twsrc%5Etfw
[3]:https://twitter.com/JennyBryan/status/913785731998289920?ref_src=twsrc%5Etfw
[4]:https://hub.docker.com/r/opencpu/ubuntu-16.04/
[5]:https://hub.docker.com/r/opencpu/debian-9/
[6]:https://hub.docker.com/r/opencpu/fedora-25/
[7]:https://hub.docker.com/r/opencpu/fedora-26/
[8]:https://hub.docker.com/r/opencpu/centos-6/
[9]:https://hub.docker.com/r/opencpu/centos-7/
[10]:https://www.r-bloggers.com/
[11]:https://www.opencpu.org/posts/opencpu-with-docker
[12]:https://www.opencpu.org/download.html
[13]:http://localhost:8004/ocpu/
[14]:http://localhost:8004/rstudio/
[15]:https://hub.docker.com/r/opencpu/rstudio/
[16]:https://hub.docker.com/u/opencpu/
[17]:https://www.opencpu.org/apps.html
[18]:https://rwebapps.ocpu.io/nabel/www/
[19]:https://github.com/rwebapps/nabel/blob/master/Dockerfile
[20]:https://hub.docker.com/r/opencpu/base/
[21]:https://github.com/rwebapps
[22]:https://archive.opencpu.org/
[23]:https://github.com/opencpu/archive/blob/gh-pages/update.sh
[24]:https://archive.opencpu.org/
[25]:https://www.r-bloggers.com/author/jeroen-ooms/
