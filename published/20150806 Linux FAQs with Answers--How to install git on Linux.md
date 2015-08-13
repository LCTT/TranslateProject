Linux有问必答：如何在Linux上安装Git
================================================================================

> **问题:** 我尝试从一个Git公共仓库克隆项目，但出现了这样的错误提示：“git: command not found”。 请问我该如何在某某发行版上安装Git？

Git是一个流行的开源版本控制系统（VCS），最初是为Linux环境开发的。跟CVS或者SVN这些版本控制系统不同的是，Git的版本控制被认为是“分布式的”，某种意义上，git的本地工作目录可以作为一个功能完善的仓库来使用，它具备完整的历史记录和版本追踪能力。在这种工作模型之下，各个协作者将内容提交到他们的本地仓库中（与之相对的会总是提交到核心仓库），如果有必要，再有选择性地推送到核心仓库。这就为Git这个版本管理系统带来了大型协作系统所必须的可扩展能力和冗余能力。

![](https://farm1.staticflickr.com/341/19433194168_c79d4570aa_b.jpg)

### 使用包管理器安装Git ###

Git已经被所有的主流Linux发行版所支持。所以安装它最简单的方法就是使用各个Linux发行版的包管理器。

**Debian, Ubuntu, 或 Linux Mint**

    $ sudo apt-get install git

**Fedora, CentOS 或 RHEL**

    $ sudo yum install git
    或
    $ sudo dnf install git

**Arch Linux**

    $ sudo pacman -S git

**OpenSUSE**

    $ sudo zypper install git

**Gentoo**

    $ emerge --ask --verbose dev-vcs/git

### 从源码安装Git ###

如果由于某些原因，你希望从源码安装Git，按照如下介绍操作。

**安装依赖包**

在构建Git之前，先安装它的依赖包。

**Debian, Ubuntu 或 Linux Mint**

    $ sudo apt-get install libcurl4-gnutls-dev libexpat1-dev gettext libz-dev libssl-dev asciidoc xmlto docbook2x

**Fedora, CentOS 或 RHEL**

    $ sudo yum install curl-devel expat-devel gettext-devel openssl-devel zlib-devel asciidoc xmlto docbook2x

#### 从源码编译Git ####

从 [https://github.com/git/git/releases][1] 下载最新版本的Git。然后在/usr下构建和安装。

注意，如果你打算安装到其他目录下（例如：/opt），那就把"--prefix=/usr"这个配置命令使用其他路径替换掉。

    $ cd git-x.x.x
    $ make configure
    $ ./configure --prefix=/usr
    $ make all doc info
    $ sudo make install install-doc install-html install-info

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/install-git-linux.html

作者：[Dan Nanni][a]
译者：[mr-ping](https://github.com/mr-ping)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:https://github.com/git/git/releases
