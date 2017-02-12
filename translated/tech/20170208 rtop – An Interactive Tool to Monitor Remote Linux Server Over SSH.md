rtop：一个通过 SSH 监控远程主机的交互式工具
============================================================

rtop 是一个基于 SSH 的直接的交互式[远程系统监控工具][2]，它收集并显示重要的系统性能指标，如 CPU、磁盘、内存和网络指标。

它用 [Go 语言][3]编写，不需要在要监视的服务器上安装任何额外的程序，除了 SSH 服务器和登录凭据。

rtop 基本上是通过启动 SSH 会话和[在远程服务器上执行某些命令][4]来收集各种系统性能信息。

一旦 SSH 会话建立，它每隔几秒（默认情况下为 5 秒）刷新来自远程服务器收集的信息，类似于 Linux 中的所有其它[类似 top 的使用程序（如 htop）][5]。

#### 安装要求：

要安装 rtop 确保你已经在 Linux 中安装了 Go（GoLang）1.2 或更高版本，否则请点击下面的链接根据步骤安装 GoLang：

- [在 Linux 中安装 GoLang （Go 编程语言）][1]

### 如何在 Linux 系统中安装 rtop

如果你已经安装了 Go，运行下面的命令构建 rtop：

```
$ go get github.com/rapidloop/rtop
```

命令完成后 rtop 可执行程序会保存在 $GOPATH/bin 或者 $GOBIN 中。

[
 ![Build rtop in Linux](http://www.tecmint.com/wp-content/uploads/2017/02/Build-rtop-Tool.png) 
][6]

*在 Linux 中构建 rtop*

注意：使用 rtop 不需要任何运行时环境或配置。

### 如何在 Linux 系统中使用 rtop

尝试不用任何标志或参数运行 rtop， 会显示如下信息：

```
$ $GOBIN/rtop
```

示例输出：

```
rtop 1.0 - (c) 2015 RapidLoop - MIT Licensed - http://rtop-monitor.org
rtop monitors server statistics over an ssh connection
Usage: rtop [-i private-key-file] [user@]host[:port] [interval]
-i private-key-file
PEM-encoded private key file to use (default: ~/.ssh/id_rsa if present)
[user@]host[:port]
the SSH server to connect to, with optional username and port
interval
refresh interval in seconds (default: 5)
```

现在让我们用 rtop 监控远程 Linux 服务器，默认每 5 秒刷新收集到的信息：

```
$ $GOBIN/rtop aaronkilik@10.42.0.1 
```
[
 ![rtop - Monitor Remote Linux Server](http://www.tecmint.com/wp-content/uploads/2017/02/Monitor-Remote-Linux-Server.png) 
][7]

*rtop – 监控远程 Linux 主机*

命令会每隔 10 秒刷新系统性能指标：

```
$ $GOBIN/rtop aaronkilik@10.42.0.1 10
```

rtop 同样可以使用 ssh-agent、[密钥][8]或者密码授权连接。

访问 rtop 的 Github 仓库：[https://github.com/rapidloop/rtop][9]。

总结一下，rtop 是一个简单易用的远程服务器监控工具，它使用非常少且直白的选项。你可以阅读服务器中其他[监控系统的命令行工具][10]来提高你的[ Linux 性能监控][11]技能。

最后，在下面的评论栏中留下你的任何问题和想法。

--------------------------------------------------------------------------------

作者简介：

Aaron Kili 是 Linux 和 F.O.S.S 爱好者，将来的 Linux SysAdmin 和 web 开发人员，目前是 TecMint 的内容创建者，他喜欢用电脑工作，并坚信分享知识。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/rtop-monitor-remote-linux-server-over-ssh/

作者：[Aaron Kili][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/

[1]:http://www.tecmint.com/install-go-in-linux/
[2]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[3]:http://www.tecmint.com/install-go-in-linux/
[4]:http://www.tecmint.com/execute-commands-on-multiple-linux-servers-using-pssh/
[5]:http://www.tecmint.com/install-htop-linux-process-monitoring-for-rhel-centos-fedora/
[6]:http://www.tecmint.com/wp-content/uploads/2017/02/Build-rtop-Tool.png
[7]:http://www.tecmint.com/wp-content/uploads/2017/02/Monitor-Remote-Linux-Server.png
[8]:http://www.tecmint.com/ssh-passwordless-login-using-ssh-keygen-in-5-easy-steps/
[9]:https://github.com/rapidloop/rtop
[10]:http://www.tecmint.com/command-line-tools-to-monitor-linux-performance/
[11]:http://www.tecmint.com/linux-performance-monitoring-tools/
