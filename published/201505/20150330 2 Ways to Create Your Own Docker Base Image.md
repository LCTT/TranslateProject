两种方式创建你自己的 Docker 基本映像
================================================================================

欢迎大家，今天我们学习一下 docker 基本映像以及如何构建我们自己的 docker 基本映像。[Docker][1] 是一个开源项目，提供了一个可以打包、装载和运行任何应用的轻量级容器的开放平台。它没有语言支持、框架和打包系统的限制，从小型的家用电脑到高端服务器，在何时何地都可以运行。这使它们可以不依赖于特定软件栈和供应商，像一块块积木一样部署和扩展网络应用、数据库和后端服务。

Docker 映像是不可更改的只读层。Docker 使用 **Union File System** 在只读文件系统上增加可读写的文件系统，但所有更改都发生在最顶层的可写层，而其下的只读映像上的原始文件仍然不会改变。由于映像不会改变，也就没有状态。基本映像是没有父类的那些映像。Docker 基本映像主要的好处是它允许我们有一个独立运行的 Linux 操作系统。

下面是我们如何可以创建自定义的基本映像的方式。

### 1. 使用 Tar 创建 Docker 基本映像 ###

我们可以使用 tar 构建我们自己的基本映像，我们从一个运行中的 Linux 发行版开始，将其打包为基本映像。这过程可能会有些不同，它取决于我们打算构建的发行版。在 Debian 发行版中，已经预带了 debootstrap。在开始下面的步骤之前，我们需要安装 debootstrap。debootstrap 用来获取构建基本系统需要的包。这里，我们构建基于 Ubuntu 14.04 "Trusty"  的映像。要完成这些，我们需要在终端或者 shell 中运行以下命令。

    $ sudo debootstrap trusty trusty > /dev/null
    $ sudo tar -C trusty -c . | sudo docker import - trusty

![使用debootstrap构建docker基本映像](http://blog.linoxide.com/wp-content/uploads/2015/03/creating-base-image-debootstrap.png)

上面的命令为当前文件夹创建了一个 tar 文件并输出到标准输出中，"docker import - trusty" 通过管道从标准输入中获取这个 tar 文件并根据它创建一个名为 trusty 的基本映像。然后，如下所示，我们将运行映像内部的一条测试命令。

    $  docker run trusty cat /etc/lsb-release

[Docker GitHub Repo][2] 中有一些允许我们快速构建基本映像的事例脚本.

### 2. 使用Scratch构建基本映像 ###

在 Docker registry 中，有一个被称为 Scratch 的使用空 tar 文件构建的特殊库：

    $ tar cv --files-from /dev/null | docker import - scratch

![使用scratch构建docker基本映像](http://blog.linoxide.com/wp-content/uploads/2015/03/creating-base-image-using-scratch.png)

我们可以使用这个映像构建新的小容器：

	FROM scratch
	ADD script.sh /usr/local/bin/run.sh
	CMD ["/usr/local/bin/run.sh"]

上面的 Dockerfile 文件来自一个很小的映像。这里，它首先从一个完全空的文件系统开始，然后它复制新建的 /usr/local/bin/run.sh 为 script.sh ，然后运行脚本 /usr/local/bin/run.sh。

### 结尾 ###

这这个教程中，我们学习了如何构建一个开箱即用的自定义 Docker 基本映像。构建一个 docker 基本映像是一个很简单的任务，因为这里有很多已经可用的包和脚本。如果我们想要在里面安装想要的东西，构建 docker 基本映像非常有用。如果有任何疑问，建议或者反馈，请在下面的评论框中写下来。非常感谢！享受吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/2-ways-create-docker-base-image/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://www.docker.com/
[2]:https://github.com/docker/docker/blob/master/contrib/mkimage-busybox.sh