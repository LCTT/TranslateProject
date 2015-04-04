如何在linux上使用Trickle来限制应用程序的网络宽带使用．
================================================================================
有没有遇到过系统中的某个应用程序独占了你所有的网络宽带的情形？如果你有过这样的遭遇，那么你就会感受到Trickle宽带调整应用角色的价值．不管你是一个系统管理员还是仅仅Linux用户,都需要学习如何控制应用程序的上下行速度，来确保你的网络宽带不会被某个程序
霸占．

![Install Trickle Bandwidth Limit in Linux](http://www.tecmint.com/wp-content/uploads/2013/11/Bandwidth-limit-trickle.png)
Install Trickle Bandwidth Limit in Linux

### 什么是　Trickle? ###

Trickle是一个网络宽带调整工具，可以让我们管理应用程序的网络上下行速度，使得可以避免其中的某个应用程序吃掉了全部或大部分可用的宽带．换句话说，Trickle可以让你基于单个应用程序来控制
网络流量速率，而不是仅仅针对与单个用户--在客户端网络环境中经典的宽带调整样例，

### Trickle是如何工作的？###

另外，tricle可以帮助我们基于应用来定义优先级，所以当对整个系统进行了全局限制设定，高优先级的应用依然会自动地获取更多的宽带。为了实现这个目标，tricle设置通过TCP连接的套接字对数
据发送、数据接收路径的流量限制。我们必须注意到，除了影响传输速率之外，tricle任何时候都不会以任何方式来改变其处理过程。

### Trickle不能做什么？ ###

这么说吧，唯一的限制就是，tricle静态连接的应用或者具有SUID或SGID位设置的二进制--因为他们使用动态链接并且将其自身加载到调整过程以及其关联的网络套接字之间。 Trickle此时会在这两种软件
组件之间扮演代理的角色。

由于trickle并不会需要超级用户的权限来运行，所以用户可以设置用户独立的流量限制,可能这并不是你想要的,我们会探索如何使用全局设定来限制系统中的所有用户的流量限制。也即是说，此时系统中的每个用户具有管理
各自的流量速率，但是无论如何，都会受到系统管理员给他们设置的边界限制。

在这边文章中，我们会描述如何通过trickle在linux平台上管理应用程序使用的网络宽带。为了生成必要流量，在此会在客户端(CentOS 7 server – dev1: 192.168.0.17)上使用 ncftpput 和
 ncftpget, 在服务器(Debian Wheezy 7.5 – dev2: 192.168.0.15)上使用vsftpd 来进行演示。 相同的指令也可以在RedHat，Fedora和Ubuntu等系统使用。

#### 前提条件 ####

1. 对于 RHEL/CentOS 7/6， [开启EPEL仓库][1]。EPEL的Extra Packages是一个 有Fedora项目维护的高质量、开源的软件仓库，而且百分之百与其衍生产品相兼容，如
企业版本Linux和CentOS. 在这个仓库中trickle和ncftp两者都是可用的。

2. 按照如下方式安装ncftp:

    # yum update && sudo yum install ncftp		[On RedHat based systems]
    # aptitude update && aptitude install ncftp	[On Debian based systems]

3. 在单独的服务器上设置一个FTP服务器。需要注意的是，尽管FTP天生就不安全，但是
仍然被广泛应用在安全性无关紧要的文件上传下载中。 在这篇文章中我们使用它来演示
trickle的优点，同时它也会在客户端的标准输出流中显示传输速率，我们将是否在另外
的日期时间中使用放在一边讨论。

    # yum update && yum install vsftpd 		[On RedHat based systems]
    # aptitude update && aptitude install vsftpd 	[On Debian based systems]

现在，在FTP服务器上按照以下方式编辑 /etc/vsftpd/vsftpd.conf 文件。

    anonymous_enable=NO
    local_enable=YES
    chroot_local_user=YES
    allow_writeable_chroot=YES

在此之后，确保在你的当前会话中开启了vsftpd，并在之后的启动中让其自动启动。

    # systemctl start vsftpd 		[For systemd-based systems]
    # systemctl enable vsftpd
    # service vsftpd start 			[For init-based systems]
    # chkconfig vsftpd on

4. 如果你选在在一个CentOS/RHEL 7中为FTP服务器的远程访问配备SSH秘钥，你需要
一个具有适合访问root目录之外的目录和文件内容上传下载权限并密码受保护的用户账户。

你可以通过在你的浏览器中输入以下的URL来浏览你的Home目录。一个登陆窗口会弹出来
提示你输入FTP服务器中的有效的用户名和密码。

    ftp://192.168.0.15

如果验证成功，你就会看到你的home目录中的内容。该教程的稍后部分中，你将可以刷新
页面来显示在你之前上传过的文件。

![FTP Directory Tree](http://www.tecmint.com/wp-content/uploads/2013/11/FTP-Directory-Tree.png)
FTP Directory Tree

### 如何在Linux中安装 Tricle ###

1. 通过yum或aptitude来安装tricle.

为了确保能够成功安装，最好在安装工具之前，保证当前的安装包是最新的版本。


    # yum -y update && yum install trickle 		        [On RedHat based systems]
    # aptitude -y update && aptitude install trickle 	[On Debian based systems]

2. 确认trickle是否对特定的二进制包有用。

之前我们解释过，trickle只对使用动态或共享包的二进制包有用。为了确认我们是否可以对某个特定的应用使用trickle，我们可以使用著名的ldd（
列出动态依赖）工具。 特别地，我们会查看任何给定程序的动态依赖中检查其当前使用的glibc，因为其准确地定义了使用套接字交流中使用的系统调用。

对一个给定的二进制包执行以下命令来查看是否能对其使用trickle进行宽带调整：

    # ldd $(which [binary]) | grep libc.so

例如，

    # ldd $(which ncftp) | grep libc.so

其输出是：

    # libc.so.6 => /lib64/libc.so.6 (0x00007efff2e6c000)

输出中的括号中的字符可能在不同的系统平台中发生改变，甚至相同的命令在不同的时候运行也会，因为其代表包加载到物理内存中的地址。

如果上面的命令没有返回任何的结果，就说明这个二进制包没有使用libc包，因此tricle对其不能起到宽带调整的作用。

### 学习如何使用Trickle###

最基本的用法就是使用其单模式，通过这种方式，trickle用来显示地定义给定应用程序的上传下载速率。如前所述，为了简单性，我们会使用相同的应用
来进行上传下载测试。

#### 在单模式下运行trickle####

我们会比较在有无trickle的情况下的上传下载速率， ‘-d’选项指示下载速率（KB/s单位），而'-u'选项指示相同单位的上传速率。另外我们会使用到‘-s’
选项来指定trickle应该以单模式运行。

以单模式运行trickle的基本语法如下：

    # trickle -s -d [download rate in KB/s] -u [upload rate in KB/s]

为了能够让你自己运行以下样例，确保你在自己的客户端安装了trickle和ncftp（我的是192.168.0.17）。

**样例1：在有无trickle的情况下上传一个2.8 MB的PDF文件。**

我们使用一个自由发布的LInux基础知识PDF文件来进行下面的测试[文件链接][2]。

你可以首先使用下面的命令将这个文件下载到你当前的工作目录中：
    # wget http://linux-training.be/files/books/LinuxFun.pdf

下面是在没有trickle的情况下将一个文件上传到我们的FTP服务器的语法：

    # ncftpput -u username -p password 192.168.0.15  /remote_directory local-filename

其中的 /remote_directory 是相对于用户名的Home目录的上传路径，而local-filename是一个你当前工作目录中的文件。

特别的是，在没有trickle的情形下，我们可以得到上传峰值速率52.02MB/s(请注意，这个不是真正的平均上传速率，而是峰值开始的瞬时值),而且这个文件几乎
在瞬间就完成了上传。

    # ncftpput -u username -p password 192.168.0.15  /testdir LinuxFun.pdf

输出：

    LinuxFun.pdf:                                        	2.79 MB   52.02 MB/s

在使用trickle的情况下，我们会限制上传速率在5KB/s。在第二次上传文件之前，我们需要在目标目录中删除这个文件，否则ncftp就会通知我们在目标
目录中已经存在了与上传文件相同的文件，从而不会执行文件的传输：
    # rm /absolute/path/to/destination/directory/LinuxFun.pdf

然后：

    # trickle -s -u 5 ncftpput -u username -p password 111.111.111.111 /testdir LinuxFun.pdf

输出：

    LinuxFun.pdf:                                        	2.79 MB	4.94 kB/s

在上面的样例中，我们看到平均的上传速率下降到了5KB/s。

**样例2：在有无trickle的情况下下载相同过得2.8MB的PDF文件**

首先，记得从原来的源文目录中删除这个PDF：

    # rm /absolute/path/to/source/directory/LinuxFun.pdf

请注意，下面的样例中将远程的文件下载到客户端机器的当前目录下，这是由FTP服务器的IP地址后面的·.·决定的。

没有trickle的情况下：

    # ncftpget -u username -p  password 111.111.111.111 . /testdir/LinuxFun.pdf

输出：

    LinuxFun.pdf:                                        	2.79 MB  260.53 MB/s

在有trickle的情况下，限制下载速率在20KB/s：

    # trickle -s -d 30 ncftpget -u username -p password 111.111.111.111 . /testdir/LinuxFun.pdf

输出：

    LinuxFun.pdf:                                        	2.79 MB   17.76 kB/s

### 在有监督的模式下运行Trickle [未管理的]###

Tricle也可以在未管理的模式下运行，通过跟随在/etc/tricled.conf文件中定义的一系列参数。 这个文件定义了守护线程 trickled的行为以及如何管理tricle。

另外，如果你想要全局设置被所有的应用程序使用的话，我们就会需要使用tricle命令。 这个命令运行守护线程并允许我们通过trickle定义所有应用程序共享的上传下载限制，不需要我们每次来进行指定。

例如，运行：

    # trickled -d 50 -u 10

会导致任何通过tricle运行的应用程序的上传下载速率分别限制在30kb/s和10kb/s。

请注意，你可以在任何时间都能确认守护线程tricled是否正在运行以及其运行参数：

    # ps -ef | grep trickled | grep -v grep

输出:

    root 	16475 	1  0 Dec24 ?    	00:00:04 trickled -d 50 -u 10

**样例3：在是否使用tricle的情形下上传一个 19MB 的mp4文件到我们的FTP服务器。**

在这个样例中，我们会使用“He is the gift”的自由分布视频，可以通过这个[链接][3]下载。

我们将会在开始通过以下的命令将这个文件下载到你的当前工作目录中:

    # wget http://media2.ldscdn.org/assets/missionary/our-people-2014/2014-00-1460-he-is-the-gift-360p-eng.mp4

首先，我们会使用之前列出的命令来开启守护进程trickled:

    # trickled -d 30 -u 10

在没有trickle时:

    # ncftpput -u username -p password 192.168.0.15 /testdir 2014-00-1460-he-is-the-gift-360p-eng.mp4

输出：

    2014-00-1460-he-is-the-gift-360p-eng.mp4:           	18.53 MB   36.31 MB/s

有trickle的时：

    # trickle ncftpput -u username -p password 192.168.0.15 /testdir 2014-00-1460-he-is-the-gift-360p-eng.mp4

输出:

    2014-00-1460-he-is-the-gift-360p-eng.mp4:           	18.53 MB	9.51 kB/s

我们可以看到上面的输出，上传的速率下降到了约 10KB/s。

** 样例4：在有无trickle的情形下下载这个相同的视频 **

与样例2一样，我们会将该文件下载到当前工作目录中。

在没有trickle时:

    # ncftpget -u username -p password 192.168.0.15 . /testdir/2014-00-1460-he-is-the-gift-360p-eng.mp4

输出:

    2014-00-1460-he-is-the-gift-360p-eng.mp4:           	18.53 MB  108.34 MB/s

有trickle的时：

    # trickle ncftpget -u username -p password 111.111.111.111 . /testdir/2014-00-1460-he-is-the-gift-360p-eng.mp4

输出:
    2014-00-1460-he-is-the-gift-360p-eng.mp4:           	18.53 MB   29.28 kB/s

上面的结果与我们之前设置的下载限速相对应(30KB/s)。

**注意:** 一旦守护进程开启之后，没有必要使用trickle来为每个应用程序来单独设置限制。

如前所述，每个人都可以进一步地通过tricled.conf来客制化tricle的宽带速率调整,该文件的一个典型的分区有以下部分组成：

    [service]
    Priority = <value>
    Time-Smoothing = <value>
    Length-Smoothing = <value>

其中,

- [service] 用来指示我们想要对其进行宽带使用调整的应用程序名称
- Priority 用来让我们为某个服务制定一个相对于其他服务高的优先级，这样就不允许守护进程管理中的一个单独的应用程序来占用所有的宽带。越小的数字代表更高的优先级。
- Time-Smoothing [以秒计]: 定义了trickled让各个应用程序传输或接收数据的时间间隔。小的间隔值(0.1-1秒)对于交互式应用程序是理想的，因为这样会具有一个更加平滑的会话体验，而一个相对较大
的时间间隔值(1-10秒)对于需要批量传输应用程序就会显得更好。如果没有指定该值，默认是5秒。
- Length-smoothing [KB 单位]: 该想法与Time-Smoothing如出一辙，但是是基于I/O操作而言。如果没有指定值，会使用默认的10KB。

平滑值的改变会被翻译为将指定的服务的使用一个间隔值而不是一个固定值。不幸的是，没有一个特定的公式来计算间隔值的上下限，主要依赖于特定的应用场景。

下面是一个在CentOS 7 客户端中的tricled.conf 样例文件（192.168.0.17）：

    [ssh]
    Priority = 1
    Time-Smoothing = 0.1
    Length-Smoothing = 2

    [ftp]
    Priority = 2
    Time-Smoothing = 1
    Length-Smoothing = 3

使用该设置，tricled会为SSH赋予比FTP较高的传输优先级。值得注意的是，一个交互进程，例如SSH，使用了一个较小的时间间隔值，然而一个处理批量数据传输的服务如FTP使用一个较大的时间
间隔来负责之前的样例中的上传下载速率，尽管不是百分百的有trickled指定的值，但是也已经非常接近了。

### 总结 ###
在该文章中,我们探索了任何使用trickle在基于Fedora发行版和Debian衍生版平台上来限制应用程序的宽带使用.也包含了其他的可能用法,但是不对以下情形进行限制:

- 限制系统下载工具的下载速度,例如[wget][4],或 BT客户端.  

- 限制你的系统的包管理工具`[yun][5]`更新的速度 (如果是基于Debian系统的话，其包管理工具为`[aptitude][6]`)。

- 如果你的服务器是在一个代理或防火墙后面(或者其本身即是代理或防火墙的话)，你可以使用trickle来同时设定下载和上传速率，或者与客户端或外部交流速率。

欢迎提问或留言.
--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-and-limit-downloadupload-bandwidth-with-trickle-in-linux/

作者：[Gabriel Cánepa][a]
译者：[theo-l](https://github.com/theo-l)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[2]:http://linux-training.be/files/books/LinuxFun.pdf
[3]:http://media2.ldscdn.org/assets/missionary/our-people-2014/2014-00-1460-he-is-the-gift-360p-eng.mp4
[4]:http://www.tecmint.com/10-wget-command-examples-in-linux/
[5]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[6]:http://www.tecmint.com/dpkg-command-examples/
