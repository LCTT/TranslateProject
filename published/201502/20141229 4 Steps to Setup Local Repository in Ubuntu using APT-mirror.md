使用 APT-mirror 四步配置 Ubuntu 本地软件仓库
================================================================================
今天，我们将向你展示如何在你的 Ubuntu 个人电脑或 Ubuntu 服务器中，直接通过 Ubuntu 官方软件仓库来配置本地软件仓库。在你的电脑中创建一个本地软件仓库有着许多的好处。假如你有许多电脑需要安装软件 、安全升级和修复补丁，那么配置一个本地软件仓库是一个做这些事情的高效方法。因为，所有需要安装的软件包都可以通过快速的局域网连接从你的本地服务器中下载，这样可以节省你的网络带宽，降低互联网接入的年度开支 ...

你可以使用多种工具在你的本地个人电脑或服务器中配置一个 Ubuntu 的本地软件仓库，但在本教程中，我们将为你介绍 APT-Mirror。这里，我们将把默认的镜像包镜像到我们本地的服务器或个人电脑中，并且在你的本地或外置硬盘中，我们至少需要 **120 GB** 或更多的可用空间才行。 我们可以通过配置一个 **HTTP** 或 **FTP** 服务器来与本地系统客户端共享这个软件仓库。

我们需要安装 Apache 网络服务器和 APT-Mirror 来使得我们的工作得以开始。下面是配置一个可工作的本地软件仓库的步骤：

### 1. 安装需要的软件包 ###

我们需要从 Ubuntu 的公共软件包仓库中取得所有的软件包，然后在我们本地的 Ubuntu 服务器硬盘中保存它们。

首先我们安装一个Web 服务器来承载我们的本地软件仓库。这里我们将安装 Apache Web 服务器，但你可以安装任何你中意的 Web 服务器。对于 http 协议，Web 服务器是必须的。假如你需要配置 ftp 协议 及 rsync 协议，你还可以再分别额外安装 FTP 服务器，如  proftpd, vsftpd 等等 和 Rsync 。

    $ sudo apt-get install apache2

然后我们需要安装 apt-mirror:

    $ sudo apt-get install apt-mirror

![apt-mirror-installation](http://blog.linoxide.com/wp-content/uploads/2014/12/apt-mirror-install.png)

**注: 正如我先前提到的，我们需要至少 120 GB 的可用空间来使得所有的软件包被镜像或下载。**

### 2. 配置 APT-Mirror ###

现在，在你的硬盘上创建一个目录来保存所有的软件包。例如，我们创建一个名为 `/linoxide`的目录，我们将在这个目录中保存所有的软件包：

     $ sudo mkdir /linoxide

![repo-dir](http://blog.linoxide.com/wp-content/uploads/2014/12/mkdir-linoxide.png)

现在，打开文件 **/etc/apt/mirror.list** :

     $ sudo nano /etc/apt/mirror.list

![apt-mirror-edit](http://blog.linoxide.com/wp-content/uploads/2014/12/edit-mirror-list-300x7.png)

复制下面的命令行配置到 `mirror.list`文件中并按照你的需求进行修改：

    ############# config ##################
    #
    set base_path    /linoxide
    #
    # set mirror_path  $base_path/mirror
    # set skel_path    $base_path/skel
    # set var_path     $base_path/var
    # set cleanscript $var_path/clean.sh
    # set defaultarch  <running host architecture>
    # set postmirror_script $var_path/postmirror.sh
    # set run_postmirror 0
    set nthreads     20
    set _tilde 0
    #
    ############# end config ##############

    deb http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
    deb http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
    deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
    #deb http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
    #deb http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse

    deb-src http://archive.ubuntu.com/ubuntu trusty main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
    deb-src http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe multiverse
    #deb-src http://archive.ubuntu.com/ubuntu trusty-proposed main restricted universe multiverse
    #deb-src http://archive.ubuntu.com/ubuntu trusty-backports main restricted universe multiverse

    clean http://archive.ubuntu.com/ubuntu

![mirror-list-config](http://blog.linoxide.com/wp-content/uploads/2014/12/mirror-list-config.png)

**注: 你可以将上面的官方镜像服务器网址更改为离你最近的服务器的网址，可以通过访问 [Ubuntu Mirror Server][1]来找到这些服务器地址。假如你并不太在意镜像完成的时间，你可以沿用默认的官方镜像服务器网址。**

这里，我们将要镜像最新和最大的 Ubuntu LTS 发行版 --- 即 Ubuntu 14.04 LTS (Trusty Tahr) --- 的软件包仓库，所以在上面的配置中发行版本号为 trusty 。假如我们需要镜像 Saucy 或其他的 Ubuntu 发行版本，请修改上面的 trusy 为相应的代号。

现在，我们必须运行 apt-mirror 来下载或镜像官方仓库中的所有软件包。

    sudo apt-mirror

从 Ubuntu 服务器中下载所有的软件包所花费的时间取决于你和镜像服务器之间的网络连接速率和性能。这里我中断了下载，因为我已经下载好了 ...

![downloading-packages](http://blog.linoxide.com/wp-content/uploads/2014/12/downloading-index.png)

### 3.配置网络服务器 ###

为了使得其他的电脑能够访问这个软件仓库，你需要一个Web服务器。你也可以通过 ftp 来完成这件事，但我选择使用一个Web服务器因为在上面的步骤 1 中我提及到使用Web服务器。因此，我们现在要对 Apache 服务器进行配置:

我们将为我们本地的软件仓库目录 建立一个到 Apache 托管目录 --- 即 `/var/www/ubuntu` --- 的符号链接。

    $ sudo ln -s /linoxide /var/www/ubuntu
    $ sudo service apache2 start

![symlinks-apache2](http://blog.linoxide.com/wp-content/uploads/2014/12/symblink-apache2.png)

上面的命令将允许我们从本地主机(localhost) --- 即 http://127.0.0.1(默认情况下) ---  浏览我们的镜像软件仓库。

### 4. 配置客户端 ###

最后，我们需要在其他的电脑中添加软件源，来使得它们可以从我们的电脑中取得软件包或软件仓库。为达到此目的，我们需要编辑 `/etc/apt/sources.list` 文件并添加下面的命令：

    $ sudo nano /etc/apt/sources.list

添加下面的一行到` /etc/apt/sources.list`中并保存。

    deb http://192.168.0.100/ubuntu/ trusty main restricted universe

**注: 这里的 192.168.0.100 是我们的服务器电脑的局域网 IP 地址，你需要替换为你的服务器电脑的局域网 IP 地址**

    $ sudo apt-get update

最终，我们完成了任务。现在，你可以使用`sudo apt-get install packagename` 命令来从你的本地 Ubuntu 软件仓库中安装所需的软件包，这将会是高速的且消耗很少的带宽。

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/setup-local-repository-ubuntu/

作者：[Arun Pyasi][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:https://launchpad.net/ubuntu/+archivemirrors
