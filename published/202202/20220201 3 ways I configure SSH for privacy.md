[#]: subject: "3 ways I configure SSH for privacy"
[#]: via: "https://opensource.com/article/22/2/configure-ssh-privacy"
[#]: author: "Jonathan Garrido https://opensource.com/users/jgarrido"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14291-1.html"

保护 SSH 的 3 个技巧
======

> 以下是我如何优化我的 SSH 体验并保护我的服务器不被非法访问。

![](https://img.linux.net.cn/data/attachment/album/202202/21/113550dfgtdgtfjihqfifh.jpg)

SSH（安全 Shell）是一个协议，它使你能够创建一个经过验证的私人连接，并使用加密密钥保护通道，在另一台机器上启动一个远程 Shell。使用这种连接，你可以执行远程命令，启动安全文件传输，转发套接字、显示和服务，等等。

在 SSH 出现之前，大多数远程管理是通过 telnet 完成的，公平地说，一旦你能建立一个远程会话，你几乎可以做任何你需要的事情。这个协议的问题是，通讯是以纯明文的方式进行的，没有经过加密。使用 [流量嗅探器][2] 不需要太多努力就可以看到一个会话中的所有数据包，包括那些包含用户名和密码的数据包。

有了 SSH，由于使用了非对称密钥，参与通信的设备之间的会话是加密的。如今，这比以往任何时候都更有意义，因为所有的云服务器都是由分布在世界各地的人管理的。

### 3 个配置 SSH 的技巧

SSH 协议最常见的实现是 OpenSSH，它由 OpenBSD 项目开发，可用于大多数 Linux 和类 Unix 操作系统。一旦你安装了这个软件包，你就会有一个名为 `sshd_config` 的文件来控制该服务的大部分行为。其默认设置通常是非常保守的，但我倾向于做一些调整，以优化我的 SSH 体验，并保护我的服务器不被非法访问。

### 1、改变默认端口 

这是一个并非所有管理员都记得的问题。任何有端口扫描器的人都可以发现一个 SSH 端口，即使你之后把它移到别的端口，所以你很难把自己从危险中移除，但这样却会有效的避免了数百个针对你的服务器扫描的不成熟脚本。这是一个可以让你省心，从你的日志中减去大量的噪音的操作。

在写这篇文章时，我在一个云服务提供商上设置了一个 SSH 服务器，默认端口 TCP 22，每分钟平均被攻击次数为 24 次。在将端口改为一个更高的数字，即 TCP 45678 后，平均每天有两个连接并用各种用户名或密码进行猜测。

要改变 SSH 的默认端口，在你喜欢的文本编辑器中打开 `/etc/ssh/sshd_config`，将 `Port` 的值从 22 改为大于 1024 的某个数字。这一行可能被注释了，因为 22 是默认的（所以不需要在配置中明确声明），所以在保存之前取消注释。

```
Port 22122
#AddressFamily any 
#ListenAddress 0.0.0.0 
#ListenAddress ::

```

一旦你改变了端口并保存了文件，重新启动 SSH 服务器：

```
$ sudo systemctl restart sshd
```

### 2、不要使用密码

现在有一个普遍的潮流是停止使用密码作为认证手段，双因素认证等方法越来越受欢迎。OpenSSH 可以使用非对称密钥进行认证，因此不需要记住复杂的密码，更不需要每隔几个月轮换一次密码，也不需要担心有人在你建立远程会话时进行“肩后偷窥”。使用 SSH 密钥可以让你快速、安全地登录到你的远程设备上。这往往意味着花费在错误的用户名和密码上的时间更少。登录令人愉快的简单。当没有密钥时，就没有入口，甚至没有提示符。

要使用这个功能，你必须同时配置客户机（在你面前的计算机）和服务器（远程机器）。

在客户端机器上，你必须生成一个 SSH 密钥对。这包括一个公钥和一个私钥。正如它们的名字所暗示的，一个公开的密钥是供你分发给你想登录的服务器的，另一个是私人的密钥，必须不与任何人分享。使用 `ssh-keygen` 命令可以创建一个新的密钥对，并使用 `-t` 选项来指定一个好的、最新的密码学库，如 `ed25519`：

```
$ ssh-keygen -t ed25519    
 Generating public/private ed25519 key pair. 
 Enter file in which to save the key (~/.ssh/id_ed25519):
```

在密钥创建过程中，你会被提示为文件命名。你可以按回车键来接受默认值。如果你将来创建了更多的密钥，你可以给每个密钥起一个自定义的名字，但有多个密钥意味着你要为每次交互指定使用哪个密钥，所以现在只要接受默认即可。

你还可以给你的密钥一个口令。这可以确保即使别人设法获得你的私钥（这本身就不应该发生），没有你的口令，他们也无法将其投入使用。这对某些密钥来说是一种有用的保护措施，而对其他密钥来说则不合适（特别是那些用于脚本的密钥）。按回车键让你的密钥没有口令，或者你选择创建一个口令。

要把你的密钥复制到服务器上，使用 `ssh-copy-id` 命令。例如，如果我拥有一台名为 `example.com` 的服务器，那么我可以用这个命令把我的公钥复制到它上面：

```
$ ssh-copy-id jgarrido@example.com
```

这将在服务器的 `.ssh` 目录下创建或修改 `authorized_keys` 文件，其中包含你的公钥。 

一旦确认 `ssh-copy-id` 命令完成了它所做的事情，尝试从你的电脑上登录，以验证你可以在没有密码的情况下登录（或者如果你选择使用你的密钥的口令，就输入密钥口令）。

在没有使用你的服务器帐户的密码登录到你的服务器上后，编辑服务器的 `sshd_config` 并将 `PasswordAuthentication` 设置为 `no`。

```
PasswordAuthentication no
```

重新启动 SSH 服务以加载新的配置：

```
$ sudo systemctl restart sshd
```

### 3、决定谁可以登录

大多数发行版不允许 root 用户通过 SSH 登录，这确保只有非特权账户是活跃的，根据需要使用 `sudo` 命令来提升权限。这就防止了一个明显的、令人痛苦的目标（root）受到简单而常见的脚本攻击。

同样，OpenSSH 的一个简单而强大的功能是能够决定哪些用户可以登录到一台机器。要设置哪些用户被授予 SSH 访问权，在你最喜欢的文本编辑器中打开 `sshd_config` 文件，并添加这样一行：

```
AllowUsers jgarrido jane tux
```

重新启动 SSH 服务以加载新的配置选项。

这只允许三个用户（`jgarrido`、`jane` 和 `tux`）登录或在远程机器上执行任何操作。

### 总结

你可以使用 OpenSSH 来实现一个强大而稳健的 SSH 服务器。这些只是加固你的系统的三个有用的选项。尽管如此，在 `sshd_config` 文件中仍有大量的功能和选项可以打开或关闭，而且有许多很棒的应用程序，如 [Fail2ban][3]，你可以用来进一步保护你的 SSH 服务。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/configure-ssh-privacy

作者：[Jonathan Garrido][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jgarrido
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/privacy_keyboard_security.jpg?itok=vZ9jFdK_ (A keyboard with privacy written on it.)
[2]: https://www.redhat.com/sysadmin/troubleshoot-network-dhcp-configuration
[3]: https://opensource.com/life/15/7/pipe-dreams
