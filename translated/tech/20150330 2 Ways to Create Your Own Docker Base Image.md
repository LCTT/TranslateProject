创建你自己的Docker基本映像的2中方式
================================================================================
欢迎大家，今天我们学习一下docker基本映像以及如何构建我们自己的docker基本映像。[Docker][1]是一个开源项目，为打包，装载和运行任何应用提供开发平台的轻量级容器。它没有语言支持，框架和打包系统的限制，从小型的家用电脑到高端的服务器，在何时何地都可以运行。这使它们成为不依赖于特定栈和供应商，很好的部署和扩展网络应用，数据库和后端服务的构建块。

Docker映像是不可更改的只读层。Docker使用**Union File System**在只读文件系统上增加读写文件系统。但所有更改都发生在最顶层的可写层，最底部，在只读映像上的原始文件仍然不会改变。由于映像不会改变，也就没有状态。基本映像是没有父类的那些映像。Docker基本映像主要的好处是它允许我们有一个独立允许的Linux操作系统。

下面是我们如何可以创建自定义基本映像的方式。

### 1. 使用Tar创建Docker基本映像 ###

我们可以使用tar构建我们自己的基本映像，我们从将要打包为基本映像的运行中的Linux发行版开始构建。这过程可以会有些不同，它取决于我们打算构建的发行版。在Linux的发行版Debian中，已经预装了debootstrap。在开始下面的步骤之前，我们需要安装debootstrap。debootstrap用来获取构建基本系统需要的包。这里，我们构建基于Ubuntu 14.04 "Trusty" 的映像。做这些，我们需要在终端或者shell中运行以下命令。

    $ sudo debootstrap trusty trusty > /dev/null
    $ sudo tar -C trusty -c . | sudo docker import - trusty

![使用debootstrap构建docker基本映像](http://blog.linoxide.com/wp-content/uploads/2015/03/creating-base-image-debootstrap.png)

上面的命令为当前文件夹创建了一个tar文件并输出到STDOUT中，"docker import - trusty"从STDIN中获取这个tar文件并根据它创建一个名为trusty的基本映像。然后，如下所示，我们将运行映像内部的一条测试命令。

    $  docker run trusty cat /etc/lsb-release

[Docker GitHub Repo][2] 中有一些允许我们快速构建基本映像的事例脚本.

### 2. 使用Scratch构建基本映像 ###

在Docker的注册表中，有一个被称为Scratch的使用空tar文件构建的特殊库：

    $ tar cv --files-from /dev/null | docker import - scratch

![使用scratch构建docker基本映像](http://blog.linoxide.com/wp-content/uploads/2015/03/creating-base-image-using-scratch.png)


我们可以使用这个映像构建新的小容器：

FROM scratch
ADD script.sh /usr/local/bin/run.sh
CMD ["/usr/local/bin/run.sh"]

上面的Docker文件来自一个很小的映像。这里，它首先从一个完全空的文件系统开始，然后它复制新建的/usr/local/bin/run.sh为script.sh，然后运行脚本/usr/local/bin/run.sh。

### 结尾 ###

这这个教程中，我们学习了如果构建一个自定义的Docker基本映像。构建一个docker基本映像是一个很简单的任务，因为这里有很多已经可用的包和脚本。如果我们想要在里面安装想要的东西，构建docker基本映像非常有用。如果有任何疑问，建议或者反馈，请在下面的评论框中写下来。非常感谢！享受吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/2-ways-create-docker-base-image/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://www.docker.com/
[2]:https://github.com/docker/docker/blob/master/contrib/mkimage-busybox.sh