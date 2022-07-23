[#]: subject: (Establish an SSH connection between Windows and Linux)
[#]: via: (https://opensource.com/article/21/6/ssh-windows)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (yjacks)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14855-1.html)

如何从 Windows 上用 SSH 连接到 Linux
======

> 使用开源的 PuTTY 工具，从 Windows 建立到 Linux 的 SSH 连接。

![](https://img.linux.net.cn/data/attachment/album/202207/23/110039pjbd9jbbc84gbz2f.jpg)

在 Linux 世界中，<ruby>安全外壳<rt>secure shell</rt></ruby>（SSH）协议是最为常用的、通过命令行控制远程计算机的方式。SSH 是真正的 Linux 原创，但是它在 Windows 世界中也越来越流行。甚至有了一份官方的 [Windows 的 SSH 文档][2]，那篇文档阐述了使用 [OpenSSH][3] 控制 Windows 的方法。

这篇文章展示了如何使用了流行的开源工具 [PuTTY][4]，建立一个从 Windows 到 Fedora 33 Linux 系统的 SSH 连接。

### 使用 SSH 的方法

SSH 使用客户端-服务器模式，即 SSH 客户端会创建到 SSH 服务端的连接。SSH 服务器通常会作为<ruby>守护进程<rt>Daemon</rt></ruby>运行，所以它常被称为 SSHD。你很难找到一个不自带 SSH 守护进程的 Linux 发行版。在 Fedora 33 中，已安装了 SSH 守护进程，但是并未激活。

你可以使用 SSH 控制几乎所有的 Linux 机器，无论它是作为虚拟机还是作为网络上的物理设备运行。一个常见的用例是<ruby>无头<rt>headless</rt></ruby>配置的嵌入式设备，如树莓派。SSH 也可以用做一个其它网络服务的隧道。因为 SSH 连接是加密的，所以你可以使用 SSH 作为一个任何默认不提供加密的协议的传输层。

在这篇文章中，我将解释使用 SSH 的四个方式：1、如何在 Linux 端配置 SSH 守护进程；2、如何设置远程控制台连接；3、如何通过网络复制文件，4. 如何将 SSH 作为某些协议的隧道。

### 1、配置 SSHD

将 Linux 系统（文中是 Fedora 33）作为 SSH 服务器，允许 PuTTY SSH 客户端进行连接。首先，检查守护进程的 SSH 配置。配置文件放在 `/etc/ssh/sshd_config`，它包含了许多选项，通过取消掉相关行的注释就可以激活：

```
#       $OpenBSD: sshd_config,v 1.100 2016/08/15 12:32:04 naddy Exp $

# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.

# This sshd was compiled with PATH=/usr/local/sbin:/usr/sbin:/sbin:/usr/local/bin:/usr/bin:/bin

# The strategy used for options in the default sshd_config shipped with
# OpenSSH is to specify options with their default value where
# possible, but leave them commented.  Uncommented options override the
# default value.

Include /etc/ssh/sshd_config.d/*.conf

#Port 22
#AddressFamily any
#ListenAddress 0.0.0.0
#ListenAddress ::
```

没有取消任何注释的默认配置在这个示例中应该是可以工作的。要检查 SSH 守护进程是否已经运行，输入 `systemctl status sshd`：

```
$ systemctl status sshd
● sshd.service - OpenSSH server daemon
   Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; vendor preset: enabled)
   Active: active (running) since Fri 2018-06-22 11:12:05 UTC; 2 years 11 months ago
     Docs: man:sshd(8)
           man:sshd_config(5)
 Main PID: 577 (sshd)
    Tasks: 1 (limit: 26213)
   CGroup: /system.slice/sshd.service
           └─577 /usr/sbin/sshd -D -oCiphers=[aes256-gcm@openssh.com][5],chacha20-[...]
```

如果它处于<ruby>未激活<rt>inactive</rt></ruby>状态，使用 `systemctl start sshd` 命令启动它。

### 2、设置远程控制台

在 Windows 下 [下载 PuTTY 安装程序][6]，然后安装并打开它。你应看到一个像这样的窗口：

![PuTTY configuration screen][7]

在“<ruby>主机名（或 IP 地址）<rt>Host Name (or IP address)</rt></ruby>”输入框，键入你的 Linux 系统的连接信息。本文设置了一个 Fedora 33 虚拟机，它使用桥接网络适配器，使我可以由 IP 地址 `192.168.1.60` 连接这个系统。点击“<ruby>打开<rt>Open</rt></ruby>”，应会如图示的打开一个窗口：

![PutTTY security alert][9]

这是 SSH 的安全措施之一，是为了防止<ruby>[中间人攻击][10]<rt>man-in-the-middle attack</rt></ruby>。消息中的指纹应该匹配 Linux 系统中放在 `/etc/ssh/ssh_host_ed25519_key.pub` 的密钥。PuTTY 将这个密钥以 [MD5 哈希值][11] 的方式打印出来。要检查它的真实性，切换到 Linux 系统并打开一个控制台，然后输入：

```
ssh-keygen -l -E md5 -f /etc/ssh/ssh_host_ed25519_key.pub
```

输出应该和 PuTTY 展示的指纹一致：

```
$ ssh-keygen -l -E md5 -f /etc/ssh/ssh_host_ed25519_key.pub
256 MD5:E4:5F:01:05:D0:F7:DC:A6:32 no comment (ED25519)
```

点击“<ruby>是<rt>Yes</rt></ruby>”以确认 PuTTY 的安全提示。主机系统的指纹现在存储在 PuTTY 的信任列表中，其位于 Windows 的注册表中的：

```
HKEY_CURRENT_USER\SOFTWARE\SimonTatham\PuTTY\SshHostKeys
```

输入正确的登录凭证，然后你应该进入控制台了，位置在你的用户主目录。

![Logged in to SSH][12]

### 3、通过网络复制文件

除了远程控制台，你同样可以使用 PuTTY 通过 SSH 来传输文件。PuTTY 的安装目录在 `C:\Program Files (x86)\PuTTY`，在该目录下寻找 `ppscp.exe`。你既可以使用它从 Linux 系统复制文件，也可以复制文件到 Linux 系统。

使用 `Windows + R` 然后输入 `cmd` 来打开命令提示符，从你的 Linux 用户主目录复制 `MYFile.txt` 到你的 Windows 主目录，输入：

```
C:\"Program Files (x86)"\PuTTY\pscp.exe stephan@192.168.1.60:/home/stephan/MyFile.txt .
```

要从 Windows 主目录复制文件到 Linux 用户主目录，输入：

```
C:\"Program Files (x86)"\PuTTY\pscp.exe MyFile.txt stephan@192.168.1.60:/home/stephan/
```

就像你也许已经发现的那样，复制的命令通常构造为：

```
pscp.exe <source> <target>
```

### 4、隧道化一个协议

假设你拥有一个 Linux 机器，为某些特别的应用运行一个基于 HTTP 的服务。你想从你的 Windows 机器通过互联网访问这个 HTTP 服务。而且，你不能将相关的 TCP 端口暴露在公网，因为：

  1. 这个服务通过 HTTP 而非 HTTPS 运行
  2. 根本没有用户管理和登录系统

乍一看，建立这种架构不产生可怕的漏洞似乎是不可能的。但是 SSH 可简单的为这种情况建立一个安全的解决方案。

我将用我的软件项目 [Pythonic][13] 来演示这个过程。在容器中运行。Pythonic 作为容器运行，开放两个 TCP 端口：TCP 端口 7000（主要编辑器）和 TCP 端口 8000（[code-server][14] 代码编辑器）。

要在一个 Linux 机器上安装 Pythonic ，运行：

```
podman pull pythonicautomation/pythonic
podman run -d -p 7000:7000 -p 8000:8000 pythonic
```

转向你的 Windows 机器，打开 PuTTy，转到 “<ruby>连接<rt>Connection</rt></ruby> -> SSH -> <ruby>隧道<rt>Tunnels</rt></ruby>”。加入你要转发的两个 TCP 端口：

  * 源：`7000` / 目标：`localhost:7000`
  * 源：`8000` / 目标：`localhost:8000`

![Port forwarding in PuTTY][15]

然后返回 “<ruby>会话<rt>Session</rt></ruby>” 部分，并像之前那样建立一个 SSH 链接。打开网页浏览器，然后转到 `http://localhost:7000`；你应该看见像这样的窗口：

![Pythonic][16]

你成功的设置了端口转发！

**警告**: 如果你选择在公网上暴露 TCP 端口 22 ，不要使用易于猜测的登录凭证。你将接受来自全世界的登录请求，它们使用常见的、标准的登录凭证以尝试登录你的 Linux 机器。相反，只允许已知的用户登录。这种登录限制可以通过 [公钥加密][17] 来实现，它使用一个密钥对，其中公钥存储在 SSH 主机上，而私钥保留在客户端。

### 调试

如果你难以连接你的 Linux 机器，你可以跟踪你的 SSH 守护进程的处理过程：

```
journalctl -f -u sshd
```

这是一个普通的登录进程，但是其日志级别为 DEBUG，它看起来是这样的 :

![LogLevel DEBUG output][18]

### 了解更多

这篇文章几乎没有涉及到使用 SSH 的方法。如果你正在寻找一个特定用例的信息，你也许可以在互联网中找到无数的教程。我在工作中使用 PuTTY ，因为它易于设置，在两个操作系统间又具有良好的可操作性，使得它成为连接解决方案里的瑞士军刀。

（文内图片来自：Stephan Avenwedde，[CC BY-SA 4.0][8]）

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/ssh-windows

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[yjacks](https://github.com/yjacks)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hansic99
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud-windows-building-containers.png?itok=0XvZLZ8k (clouds in windows)
[2]: https://docs.microsoft.com/en-us/windows-server/administration/openssh/openssh_overview
[3]: https://www.openssh.com/
[4]: https://www.putty.org/
[5]: mailto:aes256-gcm@openssh.com
[6]: https://www.chiark.greenend.org.uk/~sgtatham/putty/latest.html
[7]: https://opensource.com/sites/default/files/uploads/putty_connection_settings.png (PuTTY configuration screen)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://opensource.com/sites/default/files/uploads/putty_host_key.png (PutTTY security alert)
[10]: https://en.wikipedia.org/wiki/Man-in-the-middle_attack
[11]: https://en.wikipedia.org/wiki/MD5
[12]: https://opensource.com/sites/default/files/uploads/ssh_successfull_login.png (Logged in to SSH)
[13]: https://github.com/hANSIc99/Pythonic
[14]: https://github.com/cdr/code-server
[15]: https://opensource.com/sites/default/files/uploads/ssh_port_forwarding.png (Port forwarding in PuTTY)
[16]: https://opensource.com/sites/default/files/uploads/pythonic_screen.png (Pythonic)
[17]: https://opensource.com/article/21/4/encryption-decryption-openssl
[18]: https://opensource.com/sites/default/files/uploads/sshd_debug_log.png (LogLevel DEBUG output)
