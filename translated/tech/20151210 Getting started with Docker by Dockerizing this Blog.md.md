开启 Docker 之旅——Docker 化 (Dockerize) 这篇博客
===

[Proofreading by Liam0205]

> 本文讲述了 Docker 的基本概念，并介绍了如何通过创建 Dockerfile 来 Docker 化 (Dockerize) 应用。
> 作者：Benjamin Cane，2015-12-01 10:00:00

在两年前，Docker 这一有趣的技术还只是个点子。如今，它已成为世界范围内广泛使用的应用程序部署技术。本文将带你入门，并介绍如何 Docker 化一个既有应用程序。这里的应用程序，正是这篇博客！

## 什么是 Docker？

在深入 Docker 之前，我们应当先弄清楚两个问题：它是啥，以及它为啥这么火。Docker 是一个操作系统容器管理工具。用 Docker 将应用程序打包进操作系统容器非常简单，因此管理和部署应用，也就变得容易起来了。
<!--
当我们开始学习Docker基本概念时，让我们先去搞清楚什么是Docker以及它为什么这么流行。Docker是一个操作系统容器管理工具，它通过将应用打包在操作系统容器中，来方便我们管理和部署应用。
-->

### 容器 v.s. 虚拟机

同样作为**操作系统虚拟化**的手段，容器并不如虚拟机那样为人所熟知。此外，容器技术与标准的虚拟机技术还是有一些差别的。
<!--
容器虽和虚拟机并不完全相似，但它也是一种提供**操作系统虚拟化**的方式。但是，它和标准的虚拟机还是有不同之处的。
-->

一般来说，标准的虚拟机技术会实现一个操作系统、系统软件包以及一至两个应用程序。这得益于 Hypervisor 向虚拟机提供了虚拟化的硬件。因此，在一个宿主机上，可以运行许多独立的客户机。
<!--
标准虚拟机一般会包括一个完整的操作系统，操作系统包，最后还有一至两个应用。这都得益于为虚拟机提供硬件虚拟化的管理程序。这样一来，一个单一的服务器就可以将许多独立的操作系统作为虚拟客户机运行了。
-->

容器技术使得单一的宿主机能够运行多种操作系统环境。在这一点上，容器技术和虚拟机很相似。只不过，容器技术提供的虚拟环境，并不是完整的操作系统。一般来说，容器技术只包含了必要的系统软件包以及应用程序，而不包含整个操作系统或是虚拟化的硬件。因此，容器技术比传统的虚拟机技术占用资源少。
<!--
容器和虚拟机很相似，它们都支持在单一的服务器上运行多个操作环境，只是，在容器中，这些环境并不是一个个完整的操作系统。容器一般只包含必要的操作系统包和一些应用。它们通常不会包含一个完整的操作系统或者硬件虚拟化程序。这也意味着容器比传统的虚拟机开销更少。
-->

有人认为，容器技术和虚拟机是两种不相容的技术。其实不然。运行在同一宿主机上的虚拟机，提供完整的操作系统环境，共享宿主机上的同一套物理资源。与之相反，一般来说，容器技术将同一宿主机上的进程相互隔离，互不影响。事实上，与其拿来与虚拟机相较，不如说容器技术与 **BSD Jails** 以及 `chroot` 更相似。
<!--
容器和虚拟机常被误认为是两种抵触的技术。虚拟机采用同一个物理服务器，来提供全功能的操作环境，该环境会和其余虚拟机一起共享这些物理资源。容器一般用来隔离运行中的应用进程，运行进程将在单独的主机中运行，以保证隔离后的进程之间不能相互影响。事实上，容器和**BSD Jails**以及`chroot`进程的相似度，超过了和完整虚拟机的相似度。
-->

### Docker 在容器的上层提供了什么

Docker 不是容器运行环境，而是一个非典型的容器技术。它尝试着去支持 [Solaris Zones](https://blog.docker.com/2015/08/docker-oracle-solaris-zones/) 和 [BSD Jails](https://wiki.freebsd.org/Docker) 这两种容器技术，提供了管理、打包以及部署容器的手段。虚拟机多多少少有类似的功能；但在过往的容器技术里，则几乎看不到——即使有，也很不好用。
<!--
Docker不是一个容器运行环境，事实上，只是一个容器技术，并不包含那些帮助Docker支持[Solaris Zones](https://blog.docker.com/2015/08/docker-oracle-solaris-zones/)和[BSD Jails](https://wiki.freebsd.org/Docker)的技术。Docker提供管理，打包和部署容器的方式。虽然一定程度上，虚拟机多多少少拥有这些类似的功能，但虚拟机并没有完整拥有绝大多数的容器功能，即使拥有，这些功能用起来都并没有Docker来的方便。
-->

现在，我们搞清楚了 Docker 究竟是啥。接下来，我们要学学 Docker 是怎么用的：首先，我们要安装 Docker；尔后，我们将部署一个已经构建好的公用容器。
<!--
现在，我们应该知道Docker是什么了，然后，我们将从安装Docker，并部署一个公共的预构建好的容器开始，学习Docker是如何工作的。
-->

## 从安装开始

默认情况下，Docker 并不会自动安装。因此，我们首要做的事情，就是安装 Docker 软件包。因为用作示例的系统是 **Ubuntu 10.0.4**，所以，我们可以用 **Apt** 包管理器来安装。
<!--
默认情况下，Docker并不会自动被安装在您的计算机中，所以，第一步就是安装Docker包；我们的教学机器系统是Ubuntu 14.0.4，所以，我们将使用Apt包管理器，来执行安装操作。
-->

```
# apt-get install docker.io
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following extra packages will be installed:
  aufs-tools cgroup-lite git git-man liberror-perl
Suggested packages:
  btrfs-tools debootstrap lxc rinse git-daemon-run git-daemon-sysvinit git-doc
  git-el git-email git-gui gitk gitweb git-arch git-bzr git-cvs git-mediawiki
  git-svn
The following NEW packages will be installed:
  aufs-tools cgroup-lite docker.io git git-man liberror-perl
0 upgraded, 6 newly installed, 0 to remove and 0 not upgraded.
Need to get 7,553 kB of archives.
After this operation, 46.6 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
```

我们可以用附带 `ps` 选项的 `docker` 命令来查看当前运行的容器。
<!--
为了检查当前是否有容器运行，我们可以执行`docker`命令，加上`ps`选项
-->

```
# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

`docker` 命令中的 `ps` 功能，类似于 Linux 系统中的 `ps` 命令。`docker ps` 会打印所有可用的 Docker 容器以及它们当前的状态。因为我们什么也没做，所以命令显示当前没有运行着的容器。
<!--
`docker`命令中的`ps`功能类似于Linux的`ps`命令。它将显示可找到的Docker容器以及各自的状态。由于我们并没有开启任何Docker容器，所以命令没有显示任何正在运行的容器。
-->

## 部署打包好的 nginx Docker 容器

Docker 可以像 `yum` 以及 `apt-get` 那样部署软件包，这一特性十分讨喜。这次，我们用 `docker run` 命令，实际部署 **nginx** 服务器看看。

```
# docker run -d nginx
Unable to find image 'nginx' locally
Pulling repository nginx
5c82215b03d1: Download complete
e2a4fb18da48: Download complete
58016a5acc80: Download complete
657abfa43d82: Download complete
dcb2fe003d16: Download complete
c79a417d7c6f: Download complete
abb90243122c: Download complete
d6137c9e2964: Download complete
85e566ddc7ef: Download complete
69f100eb42b5: Download complete
cd720b803060: Download complete
7cc81e9a118a: Download complete
```

接受 `docker run` 命令后，Docker 会寻找置顶的 Docker 镜像并运行。默认情况下，Docker 容器会在前台执行。也就是说，你的 shell 会与 Docker 控制台及容器中正在运行的进程绑定。加上 `-d` (**detach**) 选项，Docker 容器就会在后台执行了。
<!--
`docker`命令的`run`选项，用来通知Docker去寻找一个指定的Docker镜像，然后开启运行着该镜像的容器。默认情况下，Docker容器在前台运行，这意味着当你运行`docker run`命令的时候，你的shell会被绑定到容器的控制台以及运行在容器中的进程。为了能在后台运行该Docker容器，我们可以使用`-d` (**detach**)标志。
-->

再次执行 `docker ps`命令，我们就能看到 nginx 容器正在了。

```
# docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS               NAMES
f6d31ab01fc9        nginx:latest        nginx -g 'daemon off   4 seconds ago       Up 3 seconds        443/tcp, 80/tcp     desperate_lalande
```

不难看出，容器 `desperate_lalande` 正在运行，它由 `nginx:latest` 镜像构建而来。
<!--
从上面的打印信息中，我们可以看到正在运行的名为`desperate_lalande`的容器，它是由`nginx:latest image`（译者注：nginx最新版本的镜像）构建而来得。
-->

### Docker 镜像

镜像是 Docker 的核心特征之一。与虚拟机镜像类似，Docker 的镜像是一个打包存档的容器。与此同时，Docker 并未就此止步——Docker 还能通过 Docker 仓库发布这些镜像。Docker 仓库扮演的角色，类似于软件包仓库，因此，Docker 可以像 `yum` 那样工作。让我们回顾一下 `docker run` 的输出。
<!--
镜像是Docker的核心特征之一，类似于虚拟机镜像。和虚拟机镜像一样，Docker镜像是一个被保存并打包的容器。当然，Docker不只是创建镜像，它还可以通过Docker仓库发布这些镜像，Docker仓库和包仓库的概念差不多，它让Docker能够模仿`yum`部署包的方式来部署镜像。为了更好地理解这是怎么工作的，我们来回顾`docker run`执行后的输出。
-->

```
# docker run -d nginx
Unable to find image 'nginx' locally
```

首先，Docker 表示在本地没有找到 **nginx** 镜像。这是因为，执行 `docker run` 时，我们希望 Docker 启动名为 **nginx** 的容器；而启动容器，需要找到对应的镜像。Docker 首先会在本地寻找相应名称的镜像；若是找不到，则会联网在远程 Docker 仓库寻找。
<!--
我们可以看到第一条信息是，Docker不能在本地找到名叫nginx的镜像。这是因为当我们执行`docker run`命令时，告诉Docker运行一个基于nginx镜像的容器。既然Docker要启动一个基于特定镜像的容器，那么Docker首先需要知道那个指定镜像。在检查远程仓库之前，Docker首先检查本地是否存在指定名称的本地镜像。
-->

由于 Docker 是刚安装的，自然不存在名为 **nginx** 的镜像。于是，Docker 将会连接远程仓库下载它。
<!--
因为系统是崭新的，不存在nginx镜像，Docker将选择从Docker仓库下载之。
-->

```
Pulling repository nginx
5c82215b03d1: Download complete
e2a4fb18da48: Download complete
58016a5acc80: Download complete
657abfa43d82: Download complete
dcb2fe003d16: Download complete
c79a417d7c6f: Download complete
abb90243122c: Download complete
d6137c9e2964: Download complete
85e566ddc7ef: Download complete
69f100eb42b5: Download complete
cd720b803060: Download complete
7cc81e9a118a: Download complete
```

接下来，Docker 打印了这些信息。默认情况下，Docker 会连接 Docker 公司维护的 [Docker Hub](https://hub.docker.com/)仓库。
<!--
这就是第二部分打印信息显示给我们的内容。默认，Docker会使用[Docker Hub](https://hub.docker.com/)仓库，该仓库由Docker公司维护。
-->

与 GitHub 相同，在 Docker Hub 上创建公开仓库是免费的，创建私有仓库则是收费的。你也可以部署你自己的 Docker 仓库——只需要运行 `docker run registry` 就好了。不过，本文不会讨论这一块内容。
<!--
和Github一样，在Docker Hub创建公共仓库是免费的，私人仓库就需要缴纳费用了。当然，部署你自己的Docker仓库也是可以实现的，事实上只需要简单地运行`docker run registry`命令就行了。但在这篇文章中，我们的重点将不是讲解如何部署一个定制的注册服务。
-->

### 停止并移除容器

在我们创建自己的 Docker 容器之前，让我们先清理一下 Docker 环境。首先，我们要停止运行着的容器，然后移除它。
<!--
在我们继续构建定制容器之前，我们先清理Docker环境，我们将关闭先前的容器，并移除它。
-->

与 `docker run` 对应，`docker kill <container-name>` 会停止正在运行的容器。
<!--
我们利用`docker`命令和`run`选项运行一个容器，所以，为了停止该相同的容器，我们简单地在执行`docker`命令时，使用`kill`选项，并指定容器名。
-->

```
# docker kill desperate_lalande
desperate_lalande
```

再次执行 `docker ps` 可以发现，容器已经不再运行了。

```
# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

`docker kill` 关闭了容器；虽然它不再运行，但仍然存在于 Docker 系统中。`docker ps` 默认只显示正在运行的容器，`docker ps -a` 则会显示所有容器（包括未运行的）。
<!--
但是，此时，我们这是停止了容器；虽然它不再运行，但仍然存在。默认情况下，`docker ps`只会显示正在运行的容器，如果我们附加`-a` (all) 标识，它会显示所有运行和未运行的容器。
-->

```
# docker ps -a
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                           PORTS               NAMES
f6d31ab01fc9        5c82215b03d1        nginx -g 'daemon off   4 weeks ago         Exited (-1) About a minute ago                       desperate_lalande
```

我们可以用 `docker rm` 来完全地移除容器。

```
# docker rm desperate_lalande
desperate_lalande
```

不过，虽然容器被移走了，但是 Docker 系统中仍有缓存的 **nginx** 镜像。因此，若然此时执行 `docker run -d nginx`，Docker 会直接调用本地的镜像启动容器，而无需联网下载。
<!--
虽然容器被移除了；但是我们仍拥有可用的**nginx**镜像（译者注：镜像缓存）。如果我们重新运行`docker run -d nginx`，Docker就无需再次拉取nginx镜像，即可启动容器。这是因为我们本地系统中已经保存了一个副本。
-->

`docker image` 会列出所有本地可用的镜像。

```
# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
nginx               latest              9fab4090484a        5 days ago          132.8 MB
```

## 构建我们自己的镜像

至此，我们已经学会了使用 `docker` 基本命令来启动、停止和移除预构建的通用镜像。为了 Docker 化本博客，我们需要构建自己的 Docker 镜像，并创建 **Dockerfile**。
<!--
截至目前，我们已经使用了一些基础的Docker命令来开启，停止和移除一个预构建好的普通镜像。为了"Dockerize"这篇博客，我们需要构建我们自己的镜像，也就是创建一个**Dockerfile**。
-->

在大多数虚拟机环境中，如果你想创建一个机器镜像，你应该：创建一个新的虚拟机；安装操作系统、安装应用程序、保存为模板或镜像。在 Docker 中，这些步骤可以通过 Dockerfile 实现自动化处理：Dockerfile 能引导 Docker 创建定制镜像。本节中，我们将构建一个 Dockerfile 以部署本博客。
<!--
在大多数虚拟机环境中，如果你想创建一个机器镜像，首先，你需要建立一个新的虚拟机，安装操作系统，安装应用，最后将其转换为一个模板或者镜像。但在Docker中，所有这些步骤都可以通过Dockerfile实现全自动。Dockerfile是向Docker提供构建指令去构建定制镜像的方式。在这一章节，我们将编写能用来部署这篇博客的定制Dockerfile。
-->

### 理解应用程序

在构建 Dockerfile 之前，我们首先需要弄明白部署本博客需要哪些东西。
<!--
我们开始构建Dockerfile之前，第一步要搞明白，我们需要哪些东西来部署这篇博客。
-->

博客本质上是由一个自制的静态站点生成器生成的一堆静态 HTML 页面的集合；生成器是我自己写的 **hamerkop**。生成器本身很简单，仅仅是生成这些 HTML 页面而已。博客用到的所有代码和源文件都在 GitHub 的[公共仓库](https://github.com/madflojo/blog)当中。因此，部署本博客我们只需从 **GitHub** 上将仓库拖下来；而后安装 **Python** 以及部分 **Python** 模块；最后运行 `hamerkop` 应用即可。博客运行在 **nginx** 服务器上；因此，我们还需要安装 **nginx**。
<!--
博客本质上是由静态站点生成器生成的静态HTML页面，这个静态站点是我编写的，名为**hamerkop**。这个生成器很简单，它所做的就是生成该博客站点。所有的博客源码都被我放在了一个公共的[Github仓库](https://github.com/madflojo/blog)。为了部署这篇博客，我们要先从Github仓库把博客内容拉取下来，然后安装**Python**和一些**Python**模块，最后执行`hamerkop`应用。我们还需要安装**nginx**，来运行生成后的内容。
-->

至此，我们可以构建一个简单的 Dockerfile 了，我们可以从中看出一些 [Dockerfile 的语法规则](https://docs.docker.com/v1.8/reference/builder/)。首先，我们可以克隆 **GitHub** 仓库，而后用喜欢的编辑器创建 Dockerfile——比如用 `vi`。
<!--
截止目前，这些还是一个简单的Dockerfile，但它却给我们展示了相当多的[Dockerfile语法]((https://docs.docker.com/v1.8/reference/builder/))。我们需要克隆Github仓库，然后使用你最喜欢的编辑器编写Dockerfile；我选择`vi`
-->

```
# git clone https://github.com/madflojo/blog.git
Cloning into 'blog'...
remote: Counting objects: 622, done.
remote: Total 622 (delta 0), reused 0 (delta 0), pack-reused 622
Receiving objects: 100% (622/622), 14.80 MiB | 1.06 MiB/s, done.
Resolving deltas: 100% (242/242), done.
Checking connectivity... done.
# cd blog/
# vi Dockerfile
```

### FROM——继承 Docker 镜像

第一条 Dockerfile 指令是 `FORM`。该指令指定一个既有镜像作为我们自己镜像的基础，也就是说，它允许我们从其他 Docker 镜像继承。这里，我们继承刚才的 **nginx** 镜像；如果需要从零开始新建镜像，则可以用 `FROM ubuntu:latest` 从 **Ubuntu** 继承。
<!--
第一条Dockerfile指令是`FROM`指令。这将指定一个现存的镜像作为我们的基础镜像。这也从根本上给我们提供了继承其他Docker镜像的途径。在本例中，我们还是从刚刚我们使用的**nginx**开始，如果我们想重新开始，我们可以通过指定`ubuntu:latest`来使用**Ubuntu** Docker镜像。
-->

```
## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>
```

在 `FROM` 指令之后，我使用了 `MAINTAINER` 指令来记录该镜像的作者。
<!--
除了`FROM`指令，我还使用了`MAINTAINER`，它用来显示Dockerfile的作者。
-->

Docker 支持使用 `#` 作为注释，我将经常使用该语法，来解释Dockerfile的部分内容。

### 运行一次测试构建

因为继承了 **nginx** 镜像，所以我们的 Dockerfile 也继承了[用于构建 **nginx** 镜像的 Dockerfile](https://github.com/nginxinc/docker-nginx/blob/08eeb0e3f0a5ee40cbc2bc01f0004c2aa5b78c15/Dockerfile) 的全部指令。因此，此刻我们已经可以从这个 Dockerfile 构建一个 Docker 镜像，而后运行该镜像的容器了；当然，这个镜像和 **nginx** 镜像完全一样。我们将从这个 Dockerfile 出发，不断迭代构建镜像并运行容器，以便解释清楚 Docker 的构建流程。
<!--
因为我们继承了**nginx** Docker镜像，我们现在的Dockerfile也就包括了用来构建**nginx**镜像的[Dockerfile](https://github.com/nginxinc/docker-nginx/blob/08eeb0e3f0a5ee40cbc2bc01f0004c2aa5b78c15/Dockerfile)中所有指令。这意味着，此时我们可以从该Dockerfile中构建出一个Docker镜像，然后从该镜像中运行一个容器。虽然，最终的镜像和**nginx**镜像本质上是一样的，但是我们这次是通过构建Dockerfile的形式，然后我们将讲解Docker构建镜像的过程。
-->

从 Dockerfile 开始构建镜像，只需执行 `docker build` 即可。
<!--
想要从Dockerfile构建镜像，我们只需要在运行`docker`命令的时候，加上**build**选项。
-->

```
# docker build -t blog /root/blog
Sending build context to Docker daemon  23.6 MB
Sending build context to Docker daemon
Step 0 : FROM nginx:latest
 ---> 9fab4090484a
Step 1 : MAINTAINER Benjamin Cane <ben@bencane.com>
 ---> Running in c97f36450343
 ---> 60a44f78d194
Removing intermediate container c97f36450343
Successfully built 60a44f78d194
```

此处，`-t` (**tag**) 选项给即将生成的镜像打上了「blog」标签。这样相当于给镜像起了个名字——如果不这样的话，今后就只能通过 Docker 自动分配的 **Image ID** 来调用它了。从 Docker 返回的消息中，我们知道本例中生成镜像的 **Image ID** 是 `60a44f78d194`。

<!--
上面的例子，我们使用了`-t` (**tag**)标识给镜像添加"blog"的标签。本质上我们只是在给镜像命名，如果我们不指定标签，就只能通过Docker分配的**Image ID**来访问镜像了。本例中，从Docker构建成功的信息可以看出，**Image ID**值为`60a44f78d194`。
-->

除了 `-t` 之外，我还指定了 `/root/blog` 作为「构建目录」。该目录用于保存 Dockerfile 以及其他构建容器所需的文件。
<!--
除了`-t`标识外，我还指定了目录`/root/blog`。该目录被称作"构建目录"，它将包含Dockerfile，以及其他需要构建该容器的文件。
-->

至此，我们已经构建成功；接下来我们看看如何定制镜像。
<!--
现在我们构建成功，下面我们开始定制该镜像。
-->

### 使用 `RUN` 来执行 `apt-get`

生成 HTML 页面的静态站点生成器是用 **Python** 写的，因此，我们首先要在 `Dockerfile` 里面安装 **Python**。为此，我们需要调用软件包管理器 **Apt**。因此，我们要在 `Dockerfile` 里用 `RUN` 来执行 `apt-get update` 和 `apt-get install python-dev`。
<!--
用来生成HTML页面的静态站点生成器是用**Python**语言编写的，所以，在Dockerfile中需要做的第一件定制任务是安装Python。我们将使用Apt包管理器来安装Python包，这意味着在Dockerfile中我们要指定运行`apt-get update`和`apt-get install python-dev`；为了完成这一点，我们可以使用`RUN`指令。
-->

```
## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>

## Install python and pip
RUN apt-get update
RUN apt-get install -y python-dev python-pip
```

此处，我们用 `RUN` 指令告诉 Docker 在构建镜像时需要执行指定的 `apt-get` 命令。值得注意的是，这些命令只会在该容器中执行；也就是说，`python-dev` 和 `python-pip` 会安装在容器里，而不会影响宿主机。简而言之，`pip` 将在容器内执行，而在容器外，`pip` 命令可能根本不存在。
<!--
如上所示，我们只是简单地告知Docker构建镜像的时候，要去执行指定的`apt-get`命令。比较有趣的是，这些命令只会在该容器的上下文中执行。这意味着，即使容器中安装了`python-dev`和`python-pip`，但主机本身并没有安装这些。说的更简单点，`pip`命令将只在容器中执行，出了容器，`pip`命令不存在。
-->

需要着重提醒的是，Docker 在构建过程中不接受任何用户输入。也就是说，使用 `RUN` 指令执行的命令不得有用户输入。考虑到很多应用功能程序在安装过程中需要用户输入，这种设计可能带来一些不便。不过，在我们的例子中，`RUN` 指令执行的命令，都不需要用户输入。
<!--
还有一点比较重要的是，Docker构建过程中不接受用户输入。这说明任何被`RUN`指令执行的命令必须在没有用户输入的时候完成。由于很多应用在安装的过程中需要用户的输入信息，所以这增加了一点难度。我们例子，`RUN`命令执行的命令都不需要用户输入。
-->

### 安装Python模块

**Python**安装完毕后，我们现在需要安装Python模块。如果在Docker外做这些事，我们通常使用`pip`命令，然后参考博客Git仓库中名叫`requirements.txt`的文件。在之前的步骤中，我们已经使用`git`命令成功地将Github仓库"克隆"到了`/root/blog`目录；这个目录碰巧也是我们创建`Dockerfile`的目录。这很重要，因为这意味着Dokcer在构建过程中可以访问Git仓库中的内容。

当我们执行构建后，Docker将构建的上下文环境设置为指定的"构建目录"。这意味着目录中的所有文件都可以在构建过程中被使用，目录之外的文件（构建环境之外）是不能访问的。

为了能安装需要的Python模块，我们需要将`requirements.txt`从构建目录拷贝到容器中。我们可以在`Dockerfile`中使用`COPY`指令完成这一需求。

```
## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>

## Install python and pip
RUN apt-get update
RUN apt-get install -y python-dev python-pip

## Create a directory for required files
RUN mkdir -p /build/

## Add requirements file and run pip
COPY requirements.txt /build/
RUN pip install -r /build/requirements.txt
```

在`Dockerfile`中，我们增加了3条指令。第一条指令使用`RUN`在容器中创建了`/build/`目录。该目录用来拷贝生成静态HTML页面需要的一切应用文件。第二条指令是`COPY`指令，它将`requirements.txt`从"构建目录"(`/root/blog`)拷贝到容器中的`/build/`目录。第三条使用`RUN`指令来执行`pip`命令；安装`requirements.txt`文件中指定的所有模块。

当构建定制镜像时，`COPY`是条重要的指令。如果在Dockerfile中不指定拷贝文件，Docker镜像将不会包含requirements.txt文件。在Docker容器中，所有东西都是隔离的，除非在Dockerfile中指定执行，否则容器中不会包括需要的依赖。

### 重新运行构建

现在，我们让Docker执行了一些定制任务，现在我们尝试另一次blog镜像的构建。

```
# docker build -t blog /root/blog
Sending build context to Docker daemon 19.52 MB
Sending build context to Docker daemon
Step 0 : FROM nginx:latest
 ---> 9fab4090484a
Step 1 : MAINTAINER Benjamin Cane <ben@bencane.com>
 ---> Using cache
 ---> 8e0f1899d1eb
Step 2 : RUN apt-get update
 ---> Using cache
 ---> 78b36ef1a1a2
Step 3 : RUN apt-get install -y python-dev python-pip
 ---> Using cache
 ---> ef4f9382658a
Step 4 : RUN mkdir -p /build/
 ---> Running in bde05cf1e8fe
 ---> f4b66e09fa61
Removing intermediate container bde05cf1e8fe
Step 5 : COPY requirements.txt /build/
 ---> cef11c3fb97c
Removing intermediate container 9aa8ff43f4b0
Step 6 : RUN pip install -r /build/requirements.txt
 ---> Running in c50b15ddd8b1
Downloading/unpacking jinja2 (from -r /build/requirements.txt (line 1))
Downloading/unpacking PyYaml (from -r /build/requirements.txt (line 2))
<truncated to reduce noise>
Successfully installed jinja2 PyYaml mistune markdown MarkupSafe
Cleaning up...
 ---> abab55c20962
Removing intermediate container c50b15ddd8b1
Successfully built abab55c20962
```

上述输出所示，我们可以看到构建成功了，我们还可以看到另外一个有趣的信息` ---> Using cache`。这条信息告诉我们，Docker在构建该镜像时使用了它的构建缓存。

### Docker构建缓存

当Docker构建镜像时，它不仅仅构建一个单独的镜像；事实上，在构建过程中，它会构建许多镜像。从上面的输出信息可以看出，在每一"步"执行后，Docker都在创建新的镜像。

```
 Step 5 : COPY requirements.txt /build/
  ---> cef11c3fb97c
```

上面片段的最后一行可以看出，Docker在告诉我们它在创建一个新镜像，因为它打印了**Image ID**;`cef11c3fb97c`。这种方式有用之处在于，Docker能在随后构建**blog**镜像时将这些镜像作为缓存使用。这很有用处，因为这样，Docker就能加速同一个容器中新构建任务的构建流程。从上面的例子中，我们可以看出，Docker没有重新安装`python-dev`和`python-pip`包，Docker则使用了缓存镜像。但是由于Docker并没有找到执行`mkdir`命令的构建缓存，随后的步骤就被一一执行了。

Docker构建缓存一定程度上是福音，但有时也是噩梦。这是因为使用缓存或者重新运行指令的决定在一个很狭窄的范围内执行。比如，如果`requirements.txt`文件发生了修改，Docker会在构建时检测到该变化，然后Docker会重新执行该执行那个点往后的所有指令。这得益于Docker能查看`requirements.txt`的文件内容。但是，`apt-get`命令的执行就是另一回事了。如果提供Python包的**Apt** 仓库包含了一个更新的python-pip包；Docker不会检测到这个变化，转而去使用构建缓存。这会导致之前旧版本的包将被安装。虽然对`python-pip`来说，这不是主要的问题，但对使用了某个致命攻击缺陷的包缓存来说，这是个大问题。

出于这个原因，抛弃Docker缓存，定期地重新构建镜像是有好处的。这时，当我们执行Docker构建时，我简单地指定`--no-cache=True`即可。

## 部署博客的剩余部分

Python包和模块安装后，接下来我们将拷贝需要用到的应用文件，然后运行`hamerkop`应用。我们只需要使用更多的`COPY` and `RUN`指令就可完成。

```
## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>

## Install python and pip
RUN apt-get update
RUN apt-get install -y python-dev python-pip

## Create a directory for required files
RUN mkdir -p /build/

## Add requirements file and run pip
COPY requirements.txt /build/
RUN pip install -r /build/requirements.txt

## Add blog code nd required files
COPY static /build/static
COPY templates /build/templates
COPY hamerkop /build/
COPY config.yml /build/
COPY articles /build/articles

## Run Generator
RUN /build/hamerkop -c /build/config.yml
```

现在我们已经写出了剩余的构建指令，我们再次运行另一次构建，并确保镜像构建成功。

```
# docker build -t blog /root/blog/
Sending build context to Docker daemon 19.52 MB
Sending build context to Docker daemon
Step 0 : FROM nginx:latest
 ---> 9fab4090484a
Step 1 : MAINTAINER Benjamin Cane <ben@bencane.com>
 ---> Using cache
 ---> 8e0f1899d1eb
Step 2 : RUN apt-get update
 ---> Using cache
 ---> 78b36ef1a1a2
Step 3 : RUN apt-get install -y python-dev python-pip
 ---> Using cache
 ---> ef4f9382658a
Step 4 : RUN mkdir -p /build/
 ---> Using cache
 ---> f4b66e09fa61
Step 5 : COPY requirements.txt /build/
 ---> Using cache
 ---> cef11c3fb97c
Step 6 : RUN pip install -r /build/requirements.txt
 ---> Using cache
 ---> abab55c20962
Step 7 : COPY static /build/static
 ---> 15cb91531038
Removing intermediate container d478b42b7906
Step 8 : COPY templates /build/templates
 ---> ecded5d1a52e
Removing intermediate container ac2390607e9f
Step 9 : COPY hamerkop /build/
 ---> 59efd1ca1771
Removing intermediate container b5fbf7e817b7
Step 10 : COPY config.yml /build/
 ---> bfa3db6c05b7
Removing intermediate container 1aebef300933
Step 11 : COPY articles /build/articles
 ---> 6b61cc9dde27
Removing intermediate container be78d0eb1213
Step 12 : RUN /build/hamerkop -c /build/config.yml
 ---> Running in fbc0b5e574c5
Successfully created file /usr/share/nginx/html//2011/06/25/checking-the-number-of-lwp-threads-in-linux
Successfully created file /usr/share/nginx/html//2011/06/checking-the-number-of-lwp-threads-in-linux
<truncated to reduce noise>
Successfully created file /usr/share/nginx/html//archive.html
Successfully created file /usr/share/nginx/html//sitemap.xml
 ---> 3b25263113e1
Removing intermediate container fbc0b5e574c5
Successfully built 3b25263113e1
```

### 运行定制的容器

成功的一次构建后，我们现在就可以通过运行`docker`命令和`run`选项来运行我们定制的容器，和之前我们启动nginx容器一样。

```
# docker run -d -p 80:80 --name=blog blog
5f6c7a2217dcdc0da8af05225c4d1294e3e6bb28a41ea898a1c63fb821989ba1
```

我们这次又使用了`-d` (**detach**)标识来让Docker在后台运行。但是，我们也可以看到两个新标识。第一个新标识是`--name`，这用来给容器指定一个用户名称。之前的例子，我们没有指定名称，因为Docker随机帮我们生成了一个。第二个新标识是`-p`，这个标识允许用户从主机映射一个端口到容器中的一个端口。

之前我们使用的基础**nginx**镜像分配了80端口给HTTP服务。默认情况下，容器内的端口通道并没有绑定到主机系统。为了让外部系统能访问容器内部端口，我们必须使用`-p`标识将主机端口映射到容器内部端口。上面的命令，我们通过`-p 8080:80`语法将主机80端口映射到容器内部的80端口。

经过上面的命令，我们的容器似乎成功启动了，我们可以通过执行`docker ps`核实。

```
# docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                         NAMES
d264c7ef92bd        blog:latest         nginx -g 'daemon off   3 seconds ago       Up 3 seconds        443/tcp, 0.0.0.0:80->80/tcp   blog
```

## 总结

截止目前，我们拥有了正在运行的定制Docker容器。虽然在这篇文章中，我们只接触了一些Dockerfile指令用法，但是我们还是要讨论所有的指令。我们可以检查[Docker's reference page](https://docs.docker.com/v1.8/reference/builder/)来获取所有的Dockerfile指令用法，那里对指令的用法说明得很详细。

另一个比较好的资源是[Dockerfile Best Practices page](https://docs.docker.com/engine/articles/dockerfile_best-practices/)，它有许多构建定制Dockerfile的最佳练习。有些技巧非常有用，比如战略性地组织好Dockerfile中的命令。上面的例子中，我们将`articles`目录的`COPY`指令作为Dockerfile中最后的`COPY`指令。这是因为`articles`目录会经常变动。所以，将那些经常变化的指令尽可能地放在最后面的位置，来最优化那些可以被缓存的步骤。

通过这篇文章，我们涉及了如何运行一个预构建的容器，以及如何构建，然后部署定制容器。虽然关于Docker你还有许多需要继续学习的地方，但我想这篇文章给了你如何继续开始的好建议。当然，如果你认为还有一些需要继续补充的内容，在下面评论即可。

--------------------------------------
via: <http://bencane.com/2015/12/01/getting-started-with-docker-by-dockerizing-this-blog/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+bencane%2FSAUo+%28Benjamin+Cane%29>

作者：Benjamin Cane

译者：[su-kaiyao](https://github.com/su-kaiyao)

校对：[Liam0205](https://github.com/Liam0205)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

