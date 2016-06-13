通过 Docker 化一个博客网站来开启我们的 Docker 之旅
===

![](http://bencane.com/static/img/post-bg.jpg)

> 这篇文章包含 Docker 的基本概念，以及如何通过创建一个定制的 Dockerfile 来 Docker 化（Dockerize）一个应用。

Docker 是一个过去两年来从某个 idea 中孕育而生的有趣技术，公司组织们用它在世界上每个角落来部署应用。在今天的文章中，我将讲述如何通过“Docker 化（Dockerize）”一个现有的应用，来开始我们的 Docker 之旅。这里提到的应用指的就是这个博客！

## 什么是 Docker？

当我们开始学习 Docker 基本概念时，让我们先去搞清楚什么是 Docker 以及它为什么这么流行。Docker 是一个操作系统容器管理工具，它通过将应用打包在操作系统容器中，来方便我们管理和部署应用。

### 容器 vs. 虚拟机

容器和虚拟机并不完全相似，它是另外一种提供**操作系统虚拟化**的方式。它和标准的虚拟机还是有所不同。

标准的虚拟机一般会包括一个完整的操作系统、操作系统软件包、最后还有一至两个应用。这都得益于为虚拟机提供硬件虚拟化的管理程序。这样一来，一个单一的服务器就可以将许多独立的操作系统作为虚拟客户机运行了。

容器和虚拟机很相似，它们都支持在单一的服务器上运行多个操作环境，只是，在容器中，这些环境并不是一个个完整的操作系统。容器一般只包含必要的操作系统软件包和一些应用。它们通常不会包含一个完整的操作系统或者硬件的虚拟化。这也意味着容器比传统的虚拟机开销更少。

容器和虚拟机常被误认为是两种对立的技术。虚拟机采用一个物理服务器来提供全功能的操作环境，该环境会和其余虚拟机一起共享这些物理资源。容器一般用来隔离一个单一主机上运行的应用进程，以保证隔离后的进程之间不能相互影响。事实上，容器和 **BSD Jails** 以及 `chroot` 进程的相似度，超过了和完整虚拟机的相似度。

### Docker 在容器之上提供了什么

Docker 本身不是一个容器运行环境，事实上，只是一个与具体实现无关的容器技术，Docker 正在努力支持 [Solaris Zones](https://blog.docker.com/2015/08/docker-oracle-solaris-zones/) 和 [BSD Jails](https://wiki.freebsd.org/Docker)。Docker 提供了一种管理、打包和部署容器的方式。虽然一定程度上，虚拟机多多少少拥有这些类似的功能，但虚拟机并没有完整拥有绝大多数的容器功能，即使拥有，这些功能用起来都并没有 Docker 来的方便或那么完整。

现在，我们应该知道 Docker 是什么了，然后，我们将从安装 Docker，并部署一个公开的预构建好的容器开始，学习 Docker 是如何工作的。

## 从安装开始

默认情况下，Docker 并不会自动被安装在您的计算机中，所以，第一步就是安装 Docker 软件包；我们的教学机器系统是 Ubuntu 14.0.4，所以，我们将使用 Apt 软件包管理器，来执行安装操作。

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

为了检查当前是否有容器运行，我们可以执行`docker`命令，加上`ps`选项

```
# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

`docker`命令中的`ps`功能类似于 Linux 的`ps`命令。它将显示可找到的 Docker 容器及其状态。由于我们并没有启动任何 Docker 容器，所以命令没有显示任何正在运行的容器。

## 部署一个预构建好的 nginx Docker 容器

我比较喜欢的 Docker 特性之一就是 Docker 部署预先构建好的容器的方式，就像`yum`和`apt-get`部署包一样。为了更好地解释，我们来部署一个运行着 nginx web 服务器的预构建容器。我们可以继续使用`docker`命令，这次选择`run`选项。

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

`docker`命令的`run`选项，用来通知 Docker 去寻找一个指定的 Docker 镜像，然后启动运行着该镜像的容器。默认情况下，Docker 容器运行在前台，这意味着当你运行`docker run`命令的时候，你的 shell 会被绑定到容器的控制台以及运行在容器中的进程。为了能在后台运行该 Docker 容器，我们使用了`-d` (**detach**)标志。

再次运行`docker ps`命令，可以看到 nginx 容器正在运行。

```
# docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS               NAMES
f6d31ab01fc9        nginx:latest        nginx -g 'daemon off   4 seconds ago       Up 3 seconds        443/tcp, 80/tcp     desperate_lalande 
```

从上面的输出信息中，我们可以看到正在运行的名为`desperate_lalande`的容器，它是由`nginx:latest image`（LCTT 译注： nginx 最新版本的镜像）构建而来得。

### Docker 镜像

镜像是 Docker 的核心特征之一，类似于虚拟机镜像。和虚拟机镜像一样，Docker 镜像是一个被保存并打包的容器。当然，Docker 不只是创建镜像，它还可以通过 Docker 仓库发布这些镜像，Docker 仓库和软件包仓库的概念差不多，它让 Docker 能够模仿`yum`部署软件包的方式来部署镜像。为了更好地理解这是怎么工作的，我们来回顾`docker run`执行后的输出。

```
# docker run -d nginx
Unable to find image 'nginx' locally
```

我们可以看到第一条信息是，Docker 不能在本地找到名叫 nginx 的镜像。这是因为当我们执行`docker run`命令时，告诉 Docker 运行一个基于 nginx 镜像的容器。既然 Docker 要启动一个基于特定镜像的容器，那么 Docker 首先需要找到那个指定镜像。在检查远程仓库之前，Docker 首先检查本地是否存在指定名称的本地镜像。

因为系统是崭新的，不存在 nginx 镜像，Docker 将选择从 Docker 仓库下载之。

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

这就是第二部分输出信息显示给我们的内容。默认情况下，Docker 会使用 [Docker Hub](https://hub.docker.com/) 仓库，该仓库由 Docker 公司维护。

和 Github 一样，在 Docker Hub 创建公共仓库是免费的，私人仓库就需要缴纳费用了。当然，部署你自己的 Docker 仓库也是可以的，事实上只需要简单地运行`docker run registry`命令就行了。但在这篇文章中，我们的重点将不是讲解如何部署一个定制的注册服务。

### 关闭并移除容器

在我们继续构建定制容器之前，我们先清理一下 Docker 环境，我们将关闭先前的容器，并移除它。

我们利用`docker`命令和`run`选项运行一个容器，所以，为了停止同一个容器，我们简单地在执行`docker`命令时，使用`kill`选项，并指定容器名。

```
# docker kill desperate_lalande
desperate_lalande
```

当我们再次执行`docker ps`，就不再有容器运行了

```
# docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
```

但是，此时，我们这是停止了容器；虽然它不再运行，但仍然存在。默认情况下，`docker ps`只会显示正在运行的容器，如果我们附加`-a` (all) 标识，它会显示所有运行和未运行的容器。

```
# docker ps -a
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS                           PORTS               NAMES
f6d31ab01fc9        5c82215b03d1        nginx -g 'daemon off   4 weeks ago         Exited (-1) About a minute ago                       desperate_lalande  
```

为了能完整地移除容器，我们在用`docker`命令时，附加`rm`选项。

```
# docker rm desperate_lalande
desperate_lalande
```

虽然容器被移除了；但是我们仍拥有可用的**nginx**镜像（LCTT 译注：镜像缓存）。如果我们重新运行`docker run -d nginx`，Docker 就无需再次拉取 nginx 镜像即可启动容器。这是因为我们本地系统中已经保存了一个副本。

为了列出系统中所有的本地镜像，我们运行`docker`命令，附加`images`选项。

```
# docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
nginx               latest              9fab4090484a        5 days ago          132.8 MB
```

## 构建我们自己的镜像

截至目前，我们已经使用了一些基础的 Docker 命令来启动、停止和移除一个预构建好的普通镜像。为了“Docker 化（Dockerize）”这篇博客，我们需要构建我们自己的镜像，也就是创建一个 **Dockerfile**。

在大多数虚拟机环境中，如果你想创建一个机器镜像，首先，你需要建立一个新的虚拟机、安装操作系统、安装应用，最后将其转换为一个模板或者镜像。但在 Docker 中，所有这些步骤都可以通过 Dockerfile 实现全自动。Dockerfile 是向 Docker 提供构建指令去构建定制镜像的方式。在这一章节，我们将编写能用来部署这个博客的定制 Dockerfile。

### 理解应用

我们开始构建 Dockerfile 之前，第一步要搞明白，我们需要哪些东西来部署这个博客。

这个博客本质上是由一个静态站点生成器生成的静态 HTML 页面，这个生成器是我编写的，名为 **hamerkop**。这个生成器很简单，它所做的就是生成该博客站点。所有的代码和源文件都被我放在了一个公共的 [Github 仓库](https://github.com/madflojo/blog)。为了部署这篇博客，我们要先从 Github 仓库把这些内容拉取下来，然后安装 **Python** 和一些 **Python** 模块，最后执行`hamerkop`应用。我们还需要安装 **nginx**，来运行生成后的内容。

截止目前，这些还是一个简单的 Dockerfile，但它却给我们展示了相当多的 [Dockerfile 语法]((https://docs.docker.com/v1.8/reference/builder/))。我们需要克隆 Github 仓库，然后使用你最喜欢的编辑器编写 Dockerfile，我选择`vi`

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

### FROM - 继承一个 Docker 镜像

第一条 Dockerfile 指令是`FROM`指令。这将指定一个现存的镜像作为我们的基础镜像。这也从根本上给我们提供了继承其他 Docker 镜像的途径。在本例中，我们还是从刚刚我们使用的 **nginx** 开始，如果我们想从头开始，我们可以通过指定`ubuntu:latest`来使用 **Ubuntu** Docker 镜像。

```
## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>
```

除了`FROM`指令，我还使用了`MAINTAINER`，它用来显示 Dockerfile 的作者。

Docker 支持使用`#`作为注释，我将经常使用该语法，来解释 Dockerfile 的部分内容。

### 运行一次测试构建

因为我们继承了 **nginx** Docker镜像，我们现在的 Dockerfile 也就包括了用来构建 **nginx** 镜像的 [Dockerfile](https://github.com/nginxinc/docker-nginx/blob/08eeb0e3f0a5ee40cbc2bc01f0004c2aa5b78c15/Dockerfile) 中所有指令。这意味着，此时我们可以从该 Dockerfile 中构建出一个 Docker 镜像，然后以该镜像运行一个容器。虽然，最终的镜像和 **nginx** 镜像本质上是一样的，但是我们这次是通过构建 Dockerfile 的形式，然后我们将讲解 Docker 构建镜像的过程。

想要从 Dockerfile 构建镜像，我们只需要在运行 `docker` 命令的时候，加上 `build` 选项。

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

上面的例子，我们使用了`-t` (**tag**)标识给镜像添加“blog”的标签。实质上我们就是在给镜像命名，如果我们不指定标签，就只能通过 Docker 分配的 **Image ID** 来访问镜像了。本例中，从 Docker 构建成功的信息可以看出，**Image ID**值为 `60a44f78d194`。

除了`-t`标识外，我还指定了目录`/root/blog`。该目录被称作“构建目录”，它将包含 Dockerfile，以及其它需要构建该容器的文件。

现在我们构建成功了，下面我们开始定制该镜像。

### 使用 RUN 来执行 apt-get

用来生成 HTML 页面的静态站点生成器是用 **Python** 语言编写的，所以，在 Dockerfile 中需要做的第一件定制任务是安装 Python。我们将使用 Apt 软件包管理器来安装 Python 软件包，这意味着在 Dockerfile 中我们要指定运行`apt-get update`和`apt-get install python-dev`；为了完成这一点，我们可以使用`RUN`指令。

```
## Dockerfile that generates an instance of http://bencane.com

FROM nginx:latest
MAINTAINER Benjamin Cane <ben@bencane.com>

## Install python and pip
RUN apt-get update
RUN apt-get install -y python-dev python-pip
```

如上所示，我们只是简单地告知 Docker 构建镜像的时候，要去执行指定的`apt-get`命令。比较有趣的是，这些命令只会在该容器的上下文中执行。这意味着，即使在容器中安装了`python-dev`和`python-pip`，但主机本身并没有安装这些。说的更简单点，`pip`命令将只在容器中执行，出了容器，`pip`命令不存在。

还有一点比较重要的是，Docker 构建过程中不接受用户输入。这说明任何被`RUN`指令执行的命令必须在没有用户输入的时候完成。由于很多应用在安装的过程中需要用户的输入信息，所以这增加了一点难度。不过我们例子中，`RUN`命令执行的命令都不需要用户输入。

### 安装 Python 模块

**Python** 安装完毕后，我们现在需要安装 Python 模块。如果在 Docker 外做这些事，我们通常使用`pip`命令，然后参考我的博客 Git 仓库中名叫`requirements.txt`的文件。在之前的步骤中，我们已经使用`git`命令成功地将 Github 仓库“克隆”到了`/root/blog`目录；这个目录碰巧也是我们创建`Dockerfile`的目录。这很重要，因为这意味着 Docker 在构建过程中可以访问这个 Git 仓库中的内容。

当我们执行构建后，Docker 将构建的上下文环境设置为指定的“构建目录”。这意味着目录中的所有文件都可以在构建过程中被使用，目录之外的文件（构建环境之外）是不能访问的。

为了能安装所需的 Python 模块，我们需要将`requirements.txt`从构建目录拷贝到容器中。我们可以在`Dockerfile`中使用`COPY`指令完成这一需求。

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

在`Dockerfile`中，我们增加了3条指令。第一条指令使用`RUN`在容器中创建了`/build/`目录。该目录用来拷贝生成静态 HTML 页面所需的一切应用文件。第二条指令是`COPY`指令，它将`requirements.txt`从“构建目录”(`/root/blog`)拷贝到容器中的`/build/`目录。第三条使用`RUN`指令来执行`pip`命令；安装`requirements.txt`文件中指定的所有模块。

当构建定制镜像时，`COPY`是条重要的指令。如果在 Dockerfile 中不指定拷贝文件，Docker 镜像将不会包含requirements.txt 这个文件。在 Docker 容器中，所有东西都是隔离的，除非在 Dockerfile 中指定执行，否则容器中不会包括所需的依赖。

### 重新运行构建

现在，我们让 Docker 执行了一些定制任务，现在我们尝试另一次 blog 镜像的构建。

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

上述输出所示，我们可以看到构建成功了，我们还可以看到另外一个有趣的信息` ---> Using cache`。这条信息告诉我们，Docker 在构建该镜像时使用了它的构建缓存。

### Docker 构建缓存

当 Docker 构建镜像时，它不仅仅构建一个单独的镜像；事实上，在构建过程中，它会构建许多镜像。从上面的输出信息可以看出，在每一“步”执行后，Docker 都在创建新的镜像。

```
 Step 5 : COPY requirements.txt /build/
  ---> cef11c3fb97c
```

上面片段的最后一行可以看出，Docker 在告诉我们它在创建一个新镜像，因为它打印了**Image ID** : `cef11c3fb97c`。这种方式有用之处在于，Docker能在随后构建这个 **blog** 镜像时将这些镜像作为缓存使用。这很有用处，因为这样， Docker 就能加速同一个容器中新构建任务的构建流程。从上面的例子中，我们可以看出，Docker 没有重新安装`python-dev`和`python-pip`包，Docker 则使用了缓存镜像。但是由于 Docker 并没有找到执行`mkdir`命令的构建缓存，随后的步骤就被一一执行了。

Docker 构建缓存一定程度上是福音，但有时也是噩梦。这是因为决定使用缓存或者重新运行指令的因素很少。比如，如果`requirements.txt`文件发生了修改，Docker 会在构建时检测到该变化，然后 Docker 会重新执行该执行那个点往后的所有指令。这得益于 Docker 能查看`requirements.txt`的文件内容。但是，`apt-get`命令的执行就是另一回事了。如果提供 Python 软件包的 **Apt** 仓库包含了一个更新的 python-pip 包；Docker 不会检测到这个变化，转而去使用构建缓存。这会导致之前旧版本的包将被安装。虽然对`python-pip`来说，这不是主要的问题，但对使用了存在某个致命攻击缺陷的软件包缓存来说，这是个大问题。

出于这个原因，抛弃 Docker 缓存，定期地重新构建镜像是有好处的。这时，当我们执行 Docker 构建时，我简单地指定`--no-cache=True`即可。

## 部署博客的剩余部分

Python 软件包和模块安装后，接下来我们将拷贝需要用到的应用文件，然后运行`hamerkop`应用。我们只需要使用更多的`COPY` 和 `RUN`指令就可完成。

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

成功的一次构建后，我们现在就可以通过运行`docker`命令和`run`选项来运行我们定制的容器，和之前我们启动 nginx 容器一样。

```
# docker run -d -p 80:80 --name=blog blog
5f6c7a2217dcdc0da8af05225c4d1294e3e6bb28a41ea898a1c63fb821989ba1
```

我们这次又使用了`-d` (**detach**)标识来让Docker在后台运行。但是，我们也可以看到两个新标识。第一个新标识是`--name`，这用来给容器指定一个用户名称。之前的例子，我们没有指定名称，因为 Docker 随机帮我们生成了一个。第二个新标识是`-p`，这个标识允许用户从主机映射一个端口到容器中的一个端口。

之前我们使用的基础 **nginx** 镜像分配了80端口给 HTTP 服务。默认情况下，容器内的端口通道并没有绑定到主机系统。为了让外部系统能访问容器内部端口，我们必须使用`-p`标识将主机端口映射到容器内部端口。上面的命令，我们通过`-p 8080:80`语法将主机80端口映射到容器内部的80端口。

经过上面的命令，我们的容器看起来成功启动了，我们可以通过执行`docker ps`核实。

```
# docker ps
CONTAINER ID        IMAGE               COMMAND                CREATED             STATUS              PORTS                         NAMES
d264c7ef92bd        blog:latest         nginx -g 'daemon off   3 seconds ago       Up 3 seconds        443/tcp, 0.0.0.0:80->80/tcp   blog  
```

## 总结

截止目前，我们拥有了一个运行中的定制 Docker 容器。虽然在这篇文章中，我们只接触了一些 Dockerfile 指令用法，但是我们还是要学习所有的指令。我们可以检查 [Docker's reference page](https://docs.docker.com/v1.8/reference/builder/) 来获取所有的 Dockerfile 指令用法，那里对指令的用法说明得很详细。

另一个比较好的资源是 [Dockerfile Best Practices page](https://docs.docker.com/engine/articles/dockerfile_best-practices/)，它有许多构建定制 Dockerfile 的最佳练习。有些技巧非常有用，比如战略性地组织好 Dockerfile 中的命令。上面的例子中，我们将`articles`目录的`COPY`指令作为 Dockerfile 中最后的`COPY`指令。这是因为`articles`目录会经常变动。所以，将那些经常变化的指令尽可能地放在最后面的位置，来最优化那些可以被缓存的步骤。

通过这篇文章，我们涉及了如何运行一个预构建的容器，以及如何构建，然后部署定制容器。虽然关于 Docker 你还有许多需要继续学习的地方，但我想这篇文章给了你如何继续开始的好建议。当然，如果你认为还有一些需要继续补充的内容，在下面评论即可。

--------------------------------------
via: http://bencane.com/2015/12/01/getting-started-with-docker-by-dockerizing-this-blog/

作者：Benjamin Cane
译者：[su-kaiyao](https://github.com/su-kaiyao) 
校对：[wxy](https://github.com/wxy) 

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出 

