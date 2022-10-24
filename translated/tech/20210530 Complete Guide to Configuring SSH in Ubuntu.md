[#]: subject: (Complete Guide to Configuring SSH in Ubuntu)
[#]: via: (https://itsfoss.com/set-up-ssh-ubuntu/)
[#]: author: (Chris Patrick Carias Stas https://itsfoss.com/author/chris/)
[#]: collector: (lujun9972)
[#]: translator: (Donkey-Hao)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

在 Ubuntu 中配置 SSH 的完整指南
======

如今 SSH 已成为了登录远程服务器的默认方式。

SSH 的全称是 `Secure Shell` （安全的 Shell），它功能强大、效率高，并且使用主流的网络协议在两个远程终端之间建立连接。让我们不要忘记它名称的安全部分，SSH 会加密所有的通信流量，以防止如劫持、窃听等攻击，同时提供不同的身份认证方式和无数个配置选项。

在这份新手指南中，你会学到：
  1、SSH 的基本概念
  2、设置 SSH 服务器（在你想要远程登录的系统上）
  3、从客户端（你的电脑）通过 SSH 连接远程服务器


### SSH 的基本概念

在学习配置过程前，让我们先了解一下 SSH 的全部基础概念。

SSH 协议基于客户端-服务器(CS)架构。“服务器”允许“客户端”通过通信进行连接。该信道是经过加密的，信息交换通过 SSH 公私钥进行管理。

![Image credit: SSH][1]

[OpenSSH][2] 是最流行的开源工具之一，在 Linux、BSD 和 Windows 系统上提供 SSH 功能。

想要成功配置 SSH，你需要：
  1、在服务器端部署 SSH 服务器组件(server components)，由 `openssh-server` 包提供。
  2、在你远程访问服务器的客户端上部署 SSH 客户端组件，由 `openssh-client` 包提供，大多数 Linux 和 BSD 发行版都已经预装好了。

区分服务器和客户端是十分重要的事情。或许你不想要你的 PC 作为 SSH 服务器，除非你有充分理由希望其他人通过 SSH 连接你的系统。

普遍来说，你有一个专用的服务器系统。例如，一个 [允许 Ubuntu 的树莓派][3]。你启动 [树莓派的 SSH 服务][4]，这样你可以在你 PC 中的终端，通过 SSH 控制并管理设备。

有了这些信息，让我们看看如何在 Ubuntu 上设置 SSH 服务器。

### 在 Ubuntu 服务器中配置 SSH

设置 SSH 并不复杂，只需要以下几步。

#### 前提
  1、在服务器端拥有 `sudo` 权限的用户
  2、可以下载所需包的互联网连接
  3、你的网络中至少有另一个系统。可以是局域网中的另一台电脑，远程服务器或者主机中安装的虚拟机。

_**再次强调，在你想要通过 SSH 远程登录的系统上安装 SSH 服务**_

#### 第一步：安装所需包

让我们从打开终端输入一些必要命令开始。

注意，在安装新的包或者软件前，要 [更新你的 Ubuntu 系统][5]，以确保运行的是最新版本的程序。

```
sudo apt update && sudo apt upgrade
```

你要运行 SSH 服务器的包由 OpensSSH 的 `openssh-server` 组件提供：

```
sudo apt install openssh-server
```

![][6]

#### 第二步：检查服务器状态

但你下载并安装完包后，SSH 服务器应该已经运行了，但是为了确保万无一失我们需要检查一下：

```
service ssh status
```

你还可以使用 `systemd` 命令：

```
sudo systemctl status ssh
```

你应该会看到这样的结果，其中 `active` 是高亮的。输入 `q` 退出该页面。

![][7]

如果你的结果中 SSH 服务没有运行，使用这个命令运行它：

```
sudo systemctl enable --now ssh
```

#### 第三步：运行 SSH 通过防火墙

Ubuntu 带有名为 [UFW][8](简单的防火墙——UncomplicatedFirewall) 的防火墙，这是管理网络规则的 `iptables` 的一个接口。如果启动了防火墙，它可能会阻止你连接服务器。

想要配置 UFW 允许你的接入，你需要运行如下命令：

```
sudo ufw allow ssh
```

UFW 的运行状态可以通过运行`sudo ufw status` 来检查。

现在，我们的 SSH 服务器已经开始运行了，在等待来自客户端的连接。

### 连接远程服务器

你本地的 Linux 系统已经安装了 SSH 客户端。如果没有，你可以在 Ubuntu 中使用如下命令安装：

```
sudo apt install openssh-client
```

要连接你的 Ubuntu 系统，你需要知道它的 IP 地址，然后使用 `ssh` 命令，就像这样：

```
ssh username@address
```

将 **用户名**(username) 改为系统上真正的用户名，并将 **地址**(address) 改为你服务器的 IP 地址。

如果你 [不知道 IP 地址][9]，可以在服务器的终端输入 `ip a` 查看结果。应该会看到这样的结果：

![Using “ip a” to find the IP address][10]

可以看到我的 IP 地址是 **192.168.1.111**。让我们使用 **[[email protected]][11]** 格式进行连接。

```
ssh [email protected]
```

第一次连接 SSH 服务器时，它会请求添加主机。输入 `yes` 并回车即可。

![First time connecting to the server][12]

SSH 会立即告诉你该主机已经被永久添加了，并要求你输入指定用户的口令，输入口令并再次按回车即可。

![Host added, now type in the password][13]

瞧，你远程登录了你的 Ubuntu 系统！

![Connected!][14]

现在，你可以在远程服务器的终端里和寻常一样工作了。

#### 关闭 SSH 连接

你只需要输入 `exit` 即可关闭连接，它会立马关闭不需要确认。

![Closing the connection with “exit”][15]

### 在 Ubuntu 中关闭并禁止 SSH Stopping and Disabling SSH in Ubuntu

如果你想要停止 SSH 服务，需要运行该命令：

```
sudo systemctl stop ssh
```

该命令会关闭 SSH 服务，直到重启它或者系统重启。想要重启它，输入：

```
sudo systemctl start ssh
```

现在，如果你想要禁止 SSH 跟随系统启动，使用该命令：

```
sudo systemctl disable ssh
```

该命令不会停止当前的 SSH 会话，只会在启动的时候生效。如果你想要它跟随系统启动，输入：

```
sudo systemctl enable ssh
```

#### 其他 SSH 客户端

大多数 `*nix` 系统中都有 `ssh` 工具，从 Linux 到 macOS，但这些并不是唯一存在的选项，这里有几个可以在其他操作系统中使用的客户端：

  * [PuTTY][16] 是一个免费并开源的 Windows 系统上的 SSH 客户端。它功能强大并且简单易用。如果你从 Windows 系统上连接你的 Ubuntu 服务器，PuTTY 是最好的选择。
  * [JuiceSSH][17] 对 Android 用户来说是十分优秀的工具。如果你在旅途中需要一个移动客户端来连接你的 Ubuntu 系统，我强烈建议你试试 JuiceSSH。它已经出现了将近 10 年，并且可以免费使用。
  * 最后是 [Termius][18]，它可用于 Linux、Windows、macOS、iOS 和 Android。它有一个免费版本和几个高级选项。如果你运行大量服务器并进行共享连接的团队合作，那么 Termius 对你来说是一个不错的选择。

#### 总结

在这份指导中，你可以在 Ubuntu 系统中设置 SSH 作为服务器，允许来自你电脑的远程安全的连接，便于你通过命令行开展工作。

我们的网站—— Linux Handbook——有许多关于 SSH 的文章。在此我推荐以下文章：

  * [Linux SSH 入门教程][19]
  * [利用 SSH 配置文件管理多个 SSH 连接][20]
  * [向SSH服务器添加公钥以进行无密码身份验证][21]
  * [保护你的 SSH 服务器的 SSH 加固技巧][22]

如果你觉得它太难了，[Linux Handbook 网站有一个高级视频课程，为初学者解释 SSH][23] 以及动手实验。这将使你对该内容有更简化的知识。

远程工作快乐！

--------------------------------------------------------------------------------

via: https://itsfoss.com/set-up-ssh-ubuntu/

作者：[Chris Patrick Carias Stas][a]
选题：[lujun9972][b]
译者：[Donkey-Hao](https://github.com/Donkey-Hao)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chris/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-diagram.png?resize=800%2C259&ssl=1
[2]: https://www.openssh.com/
[3]: https://itsfoss.com/install-ubuntu-server-raspberry-pi/
[4]: https://itsfoss.com/ssh-into-raspberry/
[5]: https://itsfoss.com/update-ubuntu/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0001.png?resize=800%2C253&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0002.png?resize=800%2C263&ssl=1
[8]: https://itsfoss.com/set-up-firewall-gufw/
[9]: https://itsfoss.com/check-ip-address-ubuntu/
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-find-ip.png?resize=800%2C341&ssl=1
[11]: https://itsfoss.com/cdn-cgi/l/email-protection
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0004.png?resize=800%2C87&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0005.png?resize=800%2C57&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0006.png?resize=800%2C322&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/05/ssh-0007.png?resize=800%2C87&ssl=1
[16]: https://www.putty.org/
[17]: https://juicessh.com/
[18]: https://termius.com/
[19]: https://linuxhandbook.com/ssh-basics/
[20]: https://linuxhandbook.com/ssh-config-file/
[21]: https://linuxhandbook.com/add-ssh-public-key-to-server/
[22]: https://linuxhandbook.com/ssh-hardening-tips/
[23]: https://linuxhandbook.com/sshcourse/
