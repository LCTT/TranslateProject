mosh - 一个基于SSH用于连接远程Unix/Linux系统的工具
================================================================================
Mosh表示移动Shell（Mobile Shell）是一个用于从客户端连接远程服务器的命令行工具。它可以像ssh那样使用并包含了更多的功能。它是一个类似ssh的程序，但是提供更多的功能。程序最初由Keith Winstein编写用于类Unix的操作系统中，发布于GNU GPL v3协议下。

![Mosh Shell SSH Client](http://www.tecmint.com/wp-content/uploads/2015/08/Mosh-Shell-SSH-Client.png)

Mosh客户端

#### Mosh的功能 ####

- 它是一个支持漫游的远程终端程序。
- 在所有主流类Unix版本中可用如Linux、FreeBSD、Solaris、Mac OS X和Android。
- 中断连接支持
- 支持智能本地echo
- 用户按键行编辑支持
- 响应式设计及在wifi、3G、长距离连接下的鲁棒性
- 在IP改变后保持连接。它使用UDP代替TCP（在SSH中使用）当连接被重置或者获得新的IP后TCP会超时但是UDP仍然保持连接。
- 在你很长之间之后恢复会话时仍然保持连接。
- 没有网络延迟。立即显示用户输入和删除而没有延迟
- 像SSH那样支持一些旧的方式登录。
- 包丢失处理机制

### Linux中mosh的安装 ###

在Debian、Ubuntu和Mint类似的系统中，你可以很容易地用[apt-get包管理器][1]安装。

    # apt-get update 
    # apt-get install mosh

在基于RHEL/CentOS/Fedora的系统中，要使用[yum 包管理器][3]安装mosh，你需要打开第三方的[EPEL][2]。

    # yum update
    # yum install mosh

在Fedora 22+的版本中，你需要使用[dnf包管理器][4]来安装mosh。

    # dnf install mosh

### 我该如何使用mosh？ ###

1. 让我们尝试使用mosh登录远程Linux服务器。

    $ mosh root@192.168.0.150

![Mosh Shell Remote Connection](http://www.tecmint.com/wp-content/uploads/2015/08/Mosh-Shell-Remote-Connection.png)

mosh远程连接

**注意**：你有没有看到一个连接错误，因为我在CentOS 7中还有打开这个端口。一个快速但是我并不建议的解决方法是：

    # systemctl stop firewalld    [on Remote Server]

更好的方法是打开一个端口并更新防火墙规则。接着用mosh连接到预定义的端口中。至于更深入的细节，也许你会对下面的文章感兴趣。

- [如何配置Firewalld][5]

2. 让我们假设把默认的22端口改到70，这时使用-p选项来使用自定义端口。

    $ mosh -p 70 root@192.168.0.150

3. 检查mosh的版本

    $ mosh --version

![Check Mosh Version](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Mosh-Version.png)

检查mosh版本

4. 你可以输入‘exit’来退出mosh会话。

    $ exit

5. mosh支持很多选项，你可以用下面的方法看到：

    $ mosh --help

![Mosh Shell Options](http://www.tecmint.com/wp-content/uploads/2015/08/Mosh-Shell-Options.png)

Mosh选项

#### mosh的利弊 ####

- mosh有额外的需求，比如需要允许UDP直接连接，这在SSH不需要。
- 动态分配的端口范围是60000-61000。第一个打开的端口是分配的。每个连接都需要一个端口。
- 默认端口分配是一个严重的安全问题，尤其是在生产环境中。
- 支持IPv6连接，但是不支持IPv6漫游。
- 不支持回溯
- 不支持X11转发
- 不支持ssh-agent转发

### 总结 ###

Mosh is a nice small utility which is available for download in the repository of most of the Linux Distributions. Though it has a few discrepancies specially security concern and additional requirement it’s features like remaining connected even while roaming is its plus point. My recommendation is Every Linux-er who deals with SSH should try this application and mind it, Mosh is worth a try.
mosh是一款在大多数linux发行版的仓库中可以下载的一款小工具。虽然它有一些差异尤其是安全问题和额外的需求，它的功能像漫游后保持连接是一个加分点。我的建议是任何一个使用ssh的linux用户都应该试试这个程序，mosh值得一试

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-mosh-shell-ssh-client-in-linux/

作者：[Avishek Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[2]:http://www.tecmint.com/how-to-enable-epel-repository-for-rhel-centos-6-5/
[3]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[4]:http://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/
[5]:http://www.tecmint.com/configure-firewalld-in-centos-7/
