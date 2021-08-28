[#]: collector: (lujun9972)
[#]: translator: (unigeorge)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13726-1.html)
[#]: subject: (A beginner’s guide to SSH for remote connection on Linux)
[#]: via: (https://opensource.com/article/20/9/ssh)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Linux 远程连接之 SSH 新手指南
======

> 学会使用安全外壳协议连接远程计算机。

![](https://img.linux.net.cn/data/attachment/album/202108/28/105409ztj7akfjpcluwjp3.jpg)

使用 Linux，你只需要在键盘上输入命令，就可以巧妙地使用计算机（甚至这台计算机可以在世界上任何地方），这正是 Linux 最吸引人的特性之一。有了 OpenSSH，[POSIX][2] 用户就可以在有权限连接的计算机上打开安全外壳协议，然后远程使用。这对于许多 Linux 用户来说可能不过是日常任务，但从没操作过的人可能就会感到很困惑。本文介绍了如何配置两台计算机的 <ruby>安全外壳协议<rt>secure shell</rt></ruby>（简称 SSH）连接，以及如何在没有密码的情况下安全地从一台计算机连接到另一台计算机。

### 相关术语

在讨论多台计算机时，如何将不同计算机彼此区分开可能会让人头疼。IT 社区拥有完善的术语来描述计算机联网的过程。

  * <ruby>服务<rt>service</rt></ruby>：
    服务是指在后台运行的软件，因此它不会局限于仅供安装它的计算机使用。例如，Web 服务器通常托管着 Web 共享 _服务_。该术语暗含（但非绝对）它是没有图形界面的软件。
  * <ruby>主机<rt>host</rt></ruby>：
    主机可以是任何计算机。在 IT 中，任何计算机都可以称为 _主机_，因为从技术上讲，任何计算机都可以<ruby>托管<rt>host</rt></ruby>对其他计算机有用的应用程序。你可能不会把自己的笔记本电脑视为 **主机**，但其实上面可能正运行着一些对你、你的手机或其他计算机有用的服务。
  * <ruby>本地<rt>local</rt></ruby>：
    本地计算机是指用户或某些特定软件正在使用的计算机。例如，每台计算机都会把自己称为 `localhost`。
  * <ruby>远程<rt>remote</rt></ruby>：
    远程计算机是指你既没在其面前，也没有在实际使用的计算机，是真正意义上在 _远程_ 位置的计算机。

现在术语已经明确好，我们可以开始了。

### 在每台主机上激活 SSH

要通过 SSH 连接两台计算机，每个主机都必须安装 SSH。SSH 有两个组成部分：本地计算机上使用的用于启动连接的命令，以及用于接收连接请求的 _服务器_。有些计算机可能已经安装好了 SSH 的一个或两个部分。验证 SSH 是否完全安装的命令因系统而异，因此最简单的验证方法是查阅相关配置文件：

```
$ file /etc/ssh/ssh_config
/etc/ssh/ssh_config: ASCII text
```

如果返回 `No such file or directory` 错误，说明没有安装 SSH 命令。

SSH 服务的检测与此类似（注意文件名中的 `d`）：

```
$ file /etc/ssh/sshd_config
/etc/ssh/sshd_config: ASCII text
```

根据缺失情况选择安装两个组件：

```
$ sudo dnf install openssh-clients openssh-server
```

在远程计算机上，使用 systemd 命令启用 SSH 服务：

```
$ sudo systemctl enable --now sshd
```

你也可以在 GNOME 上的 **系统设置** 或 macOS 上的 **系统首选项** 中启用 SSH 服务。在 GNOME 桌面上，该设置位于 **共享** 面板中：

![在 GNOME 系统设置中激活 SSH][3]

### 开启安全外壳协议

现在你已经在远程计算机上安装并启用了 SSH，可以尝试使用密码登录作为测试。要访问远程计算机，你需要有用户帐户和密码。

远程用户不必与本地用户相同。只要拥有相应用户的密码，你就可以在远程机器上以任何用户的身份登录。例如，我在我的工作计算机上的用户是 `sethkenlon` ，但在我的个人计算机上是 `seth`。如果我正在使用我的个人计算机（即作为当前的本地计算机），并且想通过 SSH 连接到我的工作计算机，我可以通过将自己标识为 `sethkenlon` 并使用我的工作密码来实现连接。

要通过 SSH 连接到远程计算机，你必须知道其 IP 地址或可解析的主机名。在远程计算机上使用 `ip` 命令可以查看该机器的 IP 地址：

```
$ ip addr show | grep "inet "
inet 127.0.0.1/8 scope host lo
inet 10.1.1.5/27 brd 10.1.1.31 [...]
```

如果远程计算机没有 `ip` 命令，可以尝试使用 `ifconfig` 命令（甚至可以试试 Windows 上通用的 `ipconfig` 命令）。

`127.0.0.1` 是一个特殊的地址，它实际上是 `localhost` 的地址。这是一个<ruby>环回<rt>loopback</rt></ruby>地址，系统使用它来找到自己。这在登录远程计算机时并没有什么用，因此在此示例中，远程计算机的正确 IP 地址为 `10.1.1.5`。在现实生活中，我的本地网络正在使用 `10.1.1.0` 子网，进而可得知前述正确的 IP 地址。如果远程计算机在不同的网络上，那么 IP 地址几乎可能是任何地址（但绝不会是 `127.0.0.1`），并且可能需要一些特殊的路由才能通过各种防火墙到达远程。如果你的远程计算机在同一个网络上，但想要访问比自己的网络更远的计算机，请阅读我之前写的关于 [在防火墙中打开端口][5] 的文章。

如果你能通过 IP 地址 _或_ 主机名 `ping` 到远程机器，并且拥有登录帐户，那么就可以通过 SSH 接入远程机器：

```
$ ping -c1 10.1.1.5
PING 10.1.1.5 (10.1.1.5) 56(84) bytes of data.
64 bytes from 10.1.1.5: icmp_seq=1 ttl=64 time=4.66 ms
$ ping -c1 akiton.local
PING 10.1.1.5 (10.1.1.5) 56(84) bytes of data.
```

至此就成功了一小步。再试试使用 SSH 登录：

```
$ whoami
seth
$ ssh sethkenlon@10.1.1.5
bash$ whoami
sethkenlon
```

测试登录有效，下一节会介绍如何激活无密码登录。

### 创建 SSH 密钥

要在没有密码的情况下安全地登录到另一台计算机，登录者必须拥有 SSH 密钥。可能你的机器上已经有一个 SSH 密钥，但再多创建一个新密钥也没有什么坏处。SSH 密钥的生命周期是在本地计算机上开始的，它由两部分组成：一个是永远不会与任何人或任何东西共享的私钥，一个是可以复制到任何你想要无密码访问的远程机器上的公钥。

有的人可能会创建一个 SSH 密钥，并将其用于从远程登录到 GitLab 身份验证的所有操作，但我会选择对不同的任务组使用不同的密钥。例如，我在家里使用一个密钥对本地机器进行身份验证，使用另一个密钥对我维护的 Web 服务器进行身份验证，再一个单独的密钥用于 Git 主机，以及又一个用于我托管的 Git 存储库，等等。在此示例中，我将只创建一个唯一密钥，以在局域网内的计算机上使用。

使用 `ssh-keygen` 命令创建新的 SSH 密钥：

```
$ ssh-keygen -t ed25519 -f ~/.ssh/lan
```

`-t` 选项代表 _类型_ ，上述代码设置了一个高于默认值的密钥加密级别。`-f` 选项代表 _文件_，指定了密钥的文件名和位置。运行此命令后会生成一个名为 `lan` 的 SSH 私钥和一个名为 `lan.pub` 的 SSH 公钥。

使用 `ssh-copy-id` 命令把公钥发送到远程机器上，在此之前要先确保具有远程计算机的 SSH 访问权限。如果你无法使用密码登录远程主机，也就无法设置无密码登录：

```
$ ssh-copy-id -i ~/.ssh/lan.pub sethkenlon@10.1.1.5
```

过程中系统会提示你输入远程主机上的登录密码。

操作成功后，使用 `-i` 选项将 SSH 命令指向对应的密钥（在本例中为 `lan`）再次尝试登录：

```
$ ssh -i ~/.ssh/lan sethkenlon@10.1.1.5
bash$ whoami
sethkenlon
```

对局域网上的所有计算机重复此过程，你就将能够无密码访问这个局域网上的每台主机。实际上，一旦你设置了无密码认证，你就可以编辑 `/etc/ssh/sshd_config` 文件来禁止密码认证。这有助于防止其他人使用 SSH 对计算机进行身份验证，除非他们拥有你的私钥。要想达到这个效果，可以在有 `sudo` 权限的文本编辑器中打开 `/etc/ssh/sshd_config` 并搜索字符串 `PasswordAuthentication`，将默认行更改为：

```
PasswordAuthentication no
```

保存并重启 SSH 服务器：

```
$ sudo systemctl restart sshd &amp;&amp; echo "OK"
OK
$
```

### 日常使用 SSH

OpenSSH 改变了人们对操作计算机的看法，使用户不再被束缚在面前的计算机上。使用 SSH，你可以访问家中的任何计算机，或者拥有帐户的服务器，甚至是移动和物联网设备。充分利用 SSH 也意味着解锁 Linux 终端的更多用途。如果你还没有使用过 SSH，请试一下它吧。试着适应 SSH，创建一些适当的密钥，以此更安全地使用计算机，打破必须与计算机面对面的局限性。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/9/ssh

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[unigeorge](https://github.com/unigeorge)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/lenovo-thinkpad-laptop-window-focus.png?itok=g0xPm2kD (young woman working on a laptop)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: https://opensource.com/sites/default/files/uploads/gnome-activate-remote-login.png (Activate SSH in GNOME System Settings)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/article/20/8/open-ports-your-firewall
