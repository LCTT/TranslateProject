如何在Ubuntu/CentOS上安装Linux内核4.0
================================================================================
大家好，今天我们学习一下如何从Elrepo或者源代码来安装最新的Linux内核4.0。代号为‘Hurr durr I'm a sheep’的Linux内核4.0是目前为止最新的主干内核。它是稳定版3.19.4之后发布的内核。4月12日是所有的开源运动爱好者的大日子，Linux Torvalds宣布了Linux内核4.0的发布，它现在就已经可用了。由于包括了一些很棒的功能，例如无重启补丁(实时补丁)，新的升级驱动，最新的硬件支持以及很多有趣的功能都有新的版本，它原本被期望是一次重要版本。但是实际上内核4.0并不认为是期望中的重要版本，Linus 表示期望4.1会是一个更重要的版本。实时补丁功能已经集成到了SUSE企业版Linux操作系统上。你可以在[发布公告][1]上查看关于这次发布的更多详细内容。

> **警告**： 安装新的内核可能会导致你的系统不可用或不稳定。如果你仍然使用以下命令继续安装，请确保备份所有重要数据到外部硬盘。

### 在Ubuntu 15.04上安装Linux内核4.0 ###

如果你正在使用Linux的发行版Ubuntu 15.04，你可以直接通过Ubuntu内核网站安装。在你的Ubuntu15.04上安装最新的Linux内核4.0，你需要在shell或终端中在root访问权限下运行以下命令。

#### 在 64位 Ubuntu 15.04 ####

	$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-image-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb
    $ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000-generic_4.0.0-040000.201504121935_amd64.deb

    $ sudo dpkg -i linux-headers-4.0.0*.deb linux-image-4.0.0*.deb

#### 在 32位 Ubuntu 15.04 ####

	$ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-image-4.0.0-040000-generic_4.0.0-040000.201504121935_i386.deb
    $ wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.0-vivid/linux-headers-4.0.0-040000-generic_4.0.0-040000.201504121935_i386.deb

    $ sudo dpkg -i linux-headers-4.0.0*.deb linux-image-4.0.0*.deb

### 在CentOS 7上安装Linux内核4.0 ###

我们可以用两种简单的方式在CentOS 7上安装Linux内核4.0。

1. 从Elrepo软件仓库安装
1. 从源代码编译安装

我们首先用ElRepo安装，这是最简单的方式：

#### 使用 Elrepo 安装 ####

**1. 下载和安装ELRepo**

我们首先下载ELRepo的GPG密钥并安装relrepo-release安装包。因为我们用的是CentOS 7，我们使用以下命令安装elrepo-release-7.0-2.el7.elrepo.noarch.rpm。

注: 如果你启用了secure boot，请查看[这个网页获取更多信息][2]。

    # rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
    # rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-2.el7.elrepo.noarch.rpm

![添加 Elrepo 源](http://blog.linoxide.com/wp-content/uploads/2015/04/adding-elrepo.png)

**2. 升级Linux内核到4.0版本**

现在，我们准备从ELRepo软件仓库安装最新的稳定版内核4.0。安装它我们需要在CentOS 7的shell或者终端中输入以下命令。

    # yum --enablerepo=elrepo-kernel install kernel-ml

![从ELRepo安装Linux内核4.0](http://blog.linoxide.com/wp-content/uploads/2015/04/installing-kernel-4-0-elrepo.png)

上面的命令会自动安装为CentOS 7构建的Linux内核4.0。

现在，下面的是另一种方式，通过编译源代码安装最新的内核4.0。

#### 从源代码编译安装 ####

**1. 安装依赖软件**

首先我们需要为编译linux内核安装依赖的软件。要完成这些，我们需要在一个终端或者shell中运行以下命令。

    # yum groupinstall "Development Tools"

    # yum install gcc ncurses ncurses-devel

![安装内核依赖](http://blog.linoxide.com/wp-content/uploads/2015/04/installing-dependencies.png)

然后，我们会升级我们的整个系统。

    # yum update

**2. 下载源代码**

现在我们通过wget命令从Linux内核的官方仓库中下载最新发布的linux内核4.0的源代码。你也可以使用你的浏览器直接从[kernel.org][3]网站下载内核。

    #  cd /tmp/
    # wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.0.tar.xz

![下载内核源码](http://blog.linoxide.com/wp-content/uploads/2015/04/download-kernel-source.png)

**3. 解压tar压缩包**

文件下载好后我们在/usr/src/文件夹下用以下命令解压。

    # tar -xf linux-4.0.tar.xz -C /usr/src/
    # cd /usr/src/linux-4.0/

![解压内核tar压缩包](http://blog.linoxide.com/wp-content/uploads/2015/04/extracting-kernel-tarball.png)

**4. 配置**

配置Linux内核有两种选择的。我们可以创建一个新的自定义配置文件或者使用已有的配置文件来构建和安装Linux内核。这都取决于你自己的需要。

**配置新的内核**

现在我们在shell或终端中运行make menuconfig命令来配置Linux内核。我们执行以下命令后会显示一个包含所有菜单的弹出窗口。在这里我们可以选择我们新的内核配置。如果你不熟悉这些菜单，那就敲击ESC键两次退出。

    # make menuconfig

![配置新内核](http://blog.linoxide.com/wp-content/uploads/2015/04/configuring-new-kernel-config.png)

**已有的配置**

如果你想用已有的配置文件配置你最新的内核，那就输入下面的命令。如果你对配置有任何调整，你可以选择Y或者N，或者仅仅是按Enter键继续。

    # make oldconfig

#### Step 5. 编译Linux内核 ####

下一步，我们会执行make命令来编译内核4.0。取决于你的系统配置，编译至少需要20-30分钟。

注：如果编译内核的时候出现`bc command not found`的错误，你可以用**yum install bc**命令安装bc修复这个错误。

    # make

![Make 内核](http://blog.linoxide.com/wp-content/uploads/2015/04/make-kernel.png)

#### 6. 安装Linux内核4.0 ####

编译完成后，我们终于要在你的Linux系统上安装**内核**了。下面的命令会在/boot目录下创建文件并且在Grub 菜单中新建一个内核条目。

    # make modules_install install

#### 7. 验证内核 ####

安装完最新的内核4.0后我们希望能验证它。做这些我们只需要在终端中输入以下命令。如果所有都进展顺利，我们会看到内核版本，例如4.0出现在输出列表中。

    # uname -r

#### 结论 ####

好了，我们成功地在我们的CentOS 7操作系统上安装了最新的Linux内核版本4.0。通常并不需要升级linux内核，因为和之前版本运行良好的硬件可能并不适合新的版本。我们要确保它包括能使你的硬件正常工作的功能和配件。但大部分情况下，新的稳定版本内核能使你的硬件性能更好。因此，如果你有任何问题，评论，反馈，请在下面的评论框中注明，让我们知道需要增加或者删除什么问题。多谢！享受最新的稳定版Linux内核4.0吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/how-tos/install-linux-kernel-4-0-elrepo-source/

作者：[Arun Pyasi][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://linux.cn/article-5259-1.html
[2]:http://elrepo.org/tiki/SecureBootKey
[3]:http://kernel.org/