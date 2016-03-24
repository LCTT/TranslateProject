LFTP : 一个功能强大的命令行FTP程序
================================================================================
大家好，这篇文章是介绍Lftp以及如何在Linux操作系统下安装的。[Lftp][1]是一个基于命令行的文件传输软件（也被称为FTP客户端），由Alexander Lukyanov开发并以GNU GPL协议许可发行。除了FTP协议外，它还支持FTPS，HTTP，HTTPS，HFTP，FISH，以及SFTP等协议。这个程序还支持FXP，允许数据绕过客户端直接在两个FTP服务器之间传输。

它有很多很棒的高级功能，比如递归镜像整个目录树以及断点续传下载。传输任务可以安排在稍后的时间段计划执行，可以限制带宽，可以创建传输列表，还支持类似Unix shell的任务控制。客户端还可以在交互式或自动脚本里使用。

### 安装Lftp ###

在运行lftp之前，我们需要确定它已经正确安装在我们的Linux发行版中了。下面是在常见Linux发行版中安装lftp的一些命令。

**Ubuntu 14.04 LTS**

在Ubuntu 14.04 LTS以及它的衍生版中，我们可以通过apt管理程序安装lftp。要安装它，我们需要使用sudo权限在shell或终端里运行下面的命令。

    $ sudo apt-get install lftp

![ubuntu install lftp](http://blog.linoxide.com/wp-content/uploads/2015/03/ubuntu-install-lftp.png)

**CentOS/Fedora/RHEL**

因为在Fedora，CentOS和RHEL的软件仓库里也能找到lftp，我们可以用**yum**管理程序来安装它。

    $ sudo yum install lftp

![fedora lftp](http://blog.linoxide.com/wp-content/uploads/2015/03/fedora-lftp.png)

**Arch Linux**

在Arch Linux安装包仓库里也有，我们可以简单地使用pacman来安装它。

    $ sudo pacman -S lftp

![archlinux install lftp](http://blog.linoxide.com/wp-content/uploads/2015/03/archlinux-install-lftp.png)

**OpenSuse**

OpenSuse系统里的包管理软件Zypper可以用来安装lftp。下面是在OpenSuse机器上用来安装的命令。

    $ sudo zypper install lftp

![opensuse lftp install](http://blog.linoxide.com/wp-content/uploads/2015/03/lftp_install.png)

### 登录 ###

要登录到ftp服务器或sftp服务器，我们首先需要知道所要求的认证信息，比如用户名，密码，端口。

之后，我们可以通过lftp来登录。

    $ lftp ftp://linoxide@localhost

![ftp login](http://blog.linoxide.com/wp-content/uploads/2015/03/lftp-login.png)

如果需要指定登录端口，我们可以按下面的方式加上去。

    $ lftp ftp://linoxide@localhost:21

![ftp login with ports](http://blog.linoxide.com/wp-content/uploads/2015/03/lftp-login-port.png)

### 导航 ###

我们可以用**ls**命令来列出文件和目录，用**cd**命令进入到目录。

![ls and cd](http://blog.linoxide.com/wp-content/uploads/2015/03/ls-cd-lftp.png)

### 上传和下载文件 ###

我们可以用**pget**命令来从远端服务器下载文件。

    > pget linspeed.svg

![pget lftp](http://blog.linoxide.com/wp-content/uploads/2015/03/pget-lftp.png)

我们可以用**put**命令来上传文件到远端服务器。

    > put linoxide.tar

![upload with put](http://blog.linoxide.com/wp-content/uploads/2015/03/put-upload.png)

要恢复之前只下载了一部分的文件/目录，我们可以用-c开关：

    > mirror -c Directory

    >pget -c linoxide.tar

    > put -c upload.tar

### 使用镜像命令 ###

我们可以用mirror命令来下载所指定的整个目录。

    > mirror remote local

![download with mirror](http://blog.linoxide.com/wp-content/uploads/2015/03/mirror.png)

还可以做反向镜像(mirror -R)，可以用来上传或更新本地目录树到服务器上。

    > mirror -R local remote

![upload or update with mirror reverse](http://blog.linoxide.com/wp-content/uploads/2015/03/mirror-reverse.png)

要恢复之前下载了一部分的文件/目录，我们可以用-c开关：

    > mirror -c Directory

### 下载队列 ###

我们可以在lftp里使用queue的选项，这样我们可以像基于GUI的客户端那样挨个下载队列里选择的文件。下面举个例子。

为了避免队列自动开始传输，我们可以这样做：

    > queue stop

现在，我们添加任务到队列。

    > queue mirror "directory"

    > queue pget "file.tar"

在建立好队列后，我们再运行queue start命令。

    > queue start

可以运行下面的命令移除整个队列。

    > queue -d

### 分块下载 ###

下面是一个把一个文件分成3块来下载的例子，你可以根据自己的需要调整。

使用pget命令分块功能的方式是**pget -n 3 file.tar**，里面的3是分块的数目。

    > pget -n 3 file.tar

使用mirror命令分块功能的方式是**mirror --use-pget-n=3 directory**，里面的3是分块的数目。

    > mirror --use-pget-n=3 linxoxide

我们可以用jobs -v命令来查看每个独立分块的下载速度以及整体速度。

### 停止，继续或删除一次传输任务 ###

要取消传输我们可以按下Ctrl+C。而要恢复下载我们可以像下面那样使用-c (--continue)开关。

    > mirror -c directory

要删除一次正在正在传输的任务我们可以用**kill**命令，而要删除所有任务我们可以使用下面那样的**kill all**命令。

    > kill

    > kill all

### 退出 ###

要从lftp退出，我们需要在终端或lftp交互接口中运行exit命令。

    > exit

### 总结 ###

哇！我们已经成功地安装了lftp并学会了它的一些基础的主要使用方式。lftp是一个非常棒的命令行ftp客户端，它支持许多额外的功能以及很酷的特性。它比其他普通ftp客户端多了很多东西。好吧，你要是有任何问题，建议，反馈，请在下面的评论区里留言。谢谢！享用lftp吧 :-)

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-how-to/setup-lftp-command-line-ftp/

作者：[Arun Pyasi][a]
译者：[zpl1025](https://github.com/zpl1025)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://lftp.yar.ru/
