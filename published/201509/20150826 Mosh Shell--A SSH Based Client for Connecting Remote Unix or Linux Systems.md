mosh：一个基于 SSH 用于连接远程 Unix/Linux 系统的工具
================================================================================
Mosh 表示移动 Shell（Mobile Shell），是一个用于从客户端跨互联网连接远程服务器的命令行工具。它能用于 SSH 连接，但是比 Secure Shell 功能更多。它是一个类似于 SSH 而带有更多功能的应用。程序最初由 Keith Winstein 编写，用于类 Unix 的操作系统中，发布于GNU GPL v3协议下。

![Mosh Shell SSH Client](http://www.tecmint.com/wp-content/uploads/2015/08/Mosh-Shell-SSH-Client.png)

*Mosh Shell SSH 客户端*

#### Mosh的功能 ####

- 它是一个支持漫游的远程终端程序。
- 在所有主流的类 Unix 版本中可用，如 Linux、FreeBSD、Solaris、Mac OS X 和 Android。
- 支持不稳定连接
- 支持智能的本地回显
- 支持用户输入的行编辑
- 响应式设计及在 wifi、3G、长距离连接下的鲁棒性
- 在 IP 改变后保持连接。它使用 UDP 代替 TCP（在 SSH 中使用），当连接被重置或者获得新的 IP 后 TCP 会超时，但是 UDP 仍然保持连接。
- 在很长的时候之后恢复会话时仍然保持连接。
- 没有网络延迟。立即显示用户输入和删除而没有延迟
- 像 SSH 那样支持一些旧的方式登录。
- 包丢失处理机制

### Linux 中 mosh 的安装 ###

在 Debian、Ubuntu 和 Mint 类似的系统中，你可以很容易地用 [apt-get 包管理器][1]安装。

    # apt-get update 
    # apt-get install mosh

在基于 RHEL/CentOS/Fedora 的系统中，要使用 [yum 包管理器][3]安装 mosh，你需要打开第三方的 [EPEL][2]。

    # yum update
    # yum install mosh

在 Fedora 22+的版本中，你需要使用 [dnf 包管理器][4]来安装 mosh。

    # dnf install mosh

### 我该如何使用 mosh？ ###

1、 让我们尝试使用 mosh 登录远程 Linux 服务器。

    $ mosh root@192.168.0.150

![Mosh Shell Remote Connection](http://www.tecmint.com/wp-content/uploads/2015/08/Mosh-Shell-Remote-Connection.png)

*mosh远程连接*

**注意**：你有没有看到一个连接错误，因为我在 CentOS 7中还有打开这个端口。一个快速但是我并不建议的解决方法是：

    # systemctl stop firewalld    [在远程服务器上]

更好的方法是打开一个端口并更新防火墙规则。接着用 mosh 连接到预定义的端口中。至于更深入的细节，也许你会对下面的文章感兴趣。

- [如何配置 Firewalld][5]

2、 让我们假设把默认的 22 端口改到 70，这时使用 -p 选项来使用自定义端口。

    $ mosh -p 70 root@192.168.0.150

3、 检查 mosh 的版本

    $ mosh --version

![Check Mosh Version](http://www.tecmint.com/wp-content/uploads/2015/08/Check-Mosh-Version.png)

*检查mosh版本*

4、 你可以输入`exit`来退出 mosh 会话。

    $ exit

5、 mosh 支持很多选项，你可以用下面的方法看到：

    $ mosh --help

![Mosh Shell Options](http://www.tecmint.com/wp-content/uploads/2015/08/Mosh-Shell-Options.png)

*Mosh 选项*

#### mosh 的优缺点 ####

- mosh 有额外的需求，比如需要允许 UDP 直接连接，这在 SSH 不需要。
- 动态分配的端口范围是 60000-61000。第一个打开的端口是分配好的。每个连接都需要一个端口。
- 默认的端口分配是一个严重的安全问题，尤其是在生产环境中。
- 支持 IPv6 连接，但是不支持 IPv6 漫游。
- 不支持回滚
- 不支持 X11 转发
- 不支持 ssh-agent 转发

### 总结 ###

mosh是一款在大多数linux发行版的仓库中可以下载的一款小工具。虽然它有一些差异尤其是安全问题和额外的需求，它的功能，比如漫游后保持连接是一个加分点。我的建议是任何一个使用ssh的linux用户都应该试试这个程序，mosh值得一试。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/install-mosh-shell-ssh-client-in-linux/

作者：[Avishek Kumar][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[2]:https://linux.cn/article-2324-1.html
[3]:http://www.tecmint.com/20-linux-yum-yellowdog-updater-modified-commands-for-package-mangement/
[4]:http://www.tecmint.com/dnf-commands-for-fedora-rpm-package-management/
[5]:http://www.tecmint.com/configure-firewalld-in-centos-7/
