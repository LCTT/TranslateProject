[#]: subject: (Establish an SSH connection between Windows and Linux)
[#]: via: (https://opensource.com/article/21/6/ssh-windows)
[#]: author: (Stephan Avenwedde https://opensource.com/users/hansic99)
[#]: collector: (lujun9972)
[#]: translator: (yjacks)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

创建一个Windows与Linux间的SSH连接

======
使用开源的PuTTY创建Windows与Linux间的SSH连接。
![clouds in windows][1]

安全外壳协议（SSH）在 Linux 世界中是最为常用的、基于命令行的远程计算机连接方案。SSH 是 Linux 原创的，但是它在 Windows 世界中同样流行。甚至有了一份官方的 [Windows 的 SSH 文档][2]，那篇文档阐述了一种在 Windows 中使用 SSH 的方式： [OpenSSH][3]。

这篇文章展示了如何从 Windows 创建一个 SSH 连接到 Fedora 33 Linux 系统，使用了流行的开源工具 [PuTTY][4]。

### 使用 SSH 的方法

SSH 使用客户服务器模式，当 SSH 客户端创建了到 SSH 服务端的连接，SSH 服务端通常会运行为守护进程，所以它常被称为 SSHD。你很难找到一个 Linux 发行版不自带 SSH 守护进程。在 Fedora 33 中，SSH 守护进程已被安装，但是并未激活。

在几乎所有的 Linux 机器上，你都可以使用 SSH 协议。如果它是作为虚拟机或你的网络上的实体机，包括树莓派，一个常见的用例是无头配置的嵌入式设备，SSH 也可以用为一个连接其它网络服务的隧道。因为 SSH 连接是加密的，所以你可以使用 SSH 作为一个所有的其它默认未提供加密协议的中继。

在这篇文章中，我将提供四个方式使用 SSH：1. 如何在 Linux 端配置 SSH 守护进程，2. 如何设置远程控制台连接，3. 如何通过网络复制文件，4. 如何将 SSH 作为某些协议的通道。

### 1\. 配置 SSHD

将Linux 系统 (文中是 Fedora 33) 作为 SSH 服务器，其允许 PuTTY SSH 客户端连接。首先，检查守护进程的 SSH 配置。配置文件放在`/etc/ssh/sshd_config`，它包含了许多选项，通过取消掉相关行的注释就可以激活：


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


因为默认的配置中没有行的注释被取消，所以你需要修改这个示例。要检查 SSH 守护进程是否已经运行，输入`systemctl status sshd`：


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


假如它处于未激活状态，使用`systemctl start sshd`命令启动它。

### 2\. 设置远程控制台

Windows 下, [下载 PuTTY 安装程序][6], 然后安装并打开它，你应看到一个像这样的窗口：

![PuTTY configuration screen][7]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

在**主机名（或 IP 地址）**输入框，进入你的 Linux 系统的“连接信息”。本文设置了一个 Fedora 33 虚拟机，它使用桥接网络适配器，使我可以由 IP 地址 `192.168.1.60` 连接这个系统。点击**开启**，应会如图示的打开一个窗口：

![PutTTY security alert][9]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

这是 SSH 的安全措施之一，是为了防止[<ruby>中间人攻击<rt>man-in-the-middle attack</rt></ruby>][10]. 信息中的指纹应该匹配 Linux 系统中放在`/etc/ssh/ssh_host_ed25519_key.pub`的密钥。PuTTY将这个密钥打印为[MD5 哈希值][11]。要检查它的真实性，切换到 Linux 系统并打开一个控制台，然后输入：


```
`ssh-keygen -l -E md5 -f /etc/ssh/ssh_host_ed25519_key.pub`
```

输出应该和 PuTTY 展示的指纹一致：


```
$ ssh-keygen -l -E md5 -f /etc/ssh/ssh_host_ed25519_key.pub
256 MD5:E4:5F:01:05:D0:F7:DC:A6:32 no comment (ED25519)
```


按**是**以设置 PuTTY 的安全警报。主系统的指纹在 PuTTY 的信任列表中，其位于 Windows 的注册表中的：



```
`HKEY_CURRENT_USER\SOFTWARE\SimonTatham\PuTTY\SshHostKeys`
```


输入正确的登录凭证，然后你应该进入控制台了，位置在你的用户主目录。


![Logged in to SSH][12]

(Stephan Avenwedde, [CC BY-SA 4.0][8])


### 3\. 通过网络传输文件

除了远程控制台，你同样可以使用 PuTTY 通过 SSH 来传输文件。PuTTY 的安装目录在`C:\\Program Files (x86)\\PuTTY`，在目录下寻找`ppscp.exe`。你既可以使用它来复制文件自 Linux 系统，也可以复制文件到到 Linux 系统。

使用**Windows + R**打开命令提示符，然后输入**cmd**，复制“MYFile.txt”从你的 Linux 用户主目录到你的 Windows 主目录，输入：


```
`C:\"Program Files (x86)"\PuTTY\pscp.exe stephan@192.168.1.60:/home/stephan/MyFile.txt .`
```


为复制文件从 Windows 主目录到 Linux 用户主目录，输入：


```
`C:\"Program Files (x86)"\PuTTY\pscp.exe MyFile.txt stephan@192.168.1.60:/home/stephan/`
```


就像你也许已经发现的那样，复制的命令通常构造为：


```
`pscp.exe <source> <target>`
```

### 4\. 隧道协议


假设你拥有一个 Linux 机器，运营一个基于 HTTP 的服务为一些应用。你想通过网络从 Windows 机器访问这个 HTTP 服务。而且，你不能将相关的TCP端口暴露在公网，因为：


  1. 这个服务通过 HTTP 而非 HTTPS 运行
  2. 根本没有任何人在管理或登录


乍一看，不产生一个可怕的漏洞而建立这种架构似乎是一项不可能的任务。但是 SSH 可简单的为这种情况建立一个安全的解决方案。

我将用我的软件项目[Pythonic][13]来证明它。在容器中运行。Pythonic 开放两个 TCP 端口：TCP 端口7000（主要编辑器）和 TCP 端口 8000（[code-server][14] 代码编辑器）

要安装 Pythonic 在一个 Linux 机器上，运行：


```
podman pull pythonicautomation/pythonic
podman run -d -p 7000:7000 -p 8000:8000 pythonic
```


转向你的 Windows 机器，打开 PuTTy，转到 **连接 -&gt; SSH -&gt; 隧道**。加入两个 TCP 前端端口：

  * Source: `7000` / Destination: `localhost:7000`
  * Source: `8000` / Destination: `localhost:8000`



![Port forwarding in PuTTY][15]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

然后返回 **会话**选项，并建立一个 SSH 链接，像你之前做的那样。打开网络浏览器然后转到`http://localhost:7000`；你应该看见像这样的窗口：

![Pythonic][16]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

你成功的设置了前端端口！

**警告**: 如果你选择开放 TCP 端口 22 到公网，不要使用易于猜测的登录凭证。你将接受来自全世界的登录请求，它们使用常见的、标准的登录凭证以尝试登录你的 Linux 机器。相反，只允许已知的用户登录。 这种登录限制可以通过以下方式实现：[公钥加密法][17], 它使用一个密钥对，其中公钥存储在SSH主机上，而私钥保留在客户端。

### 调试

如果你难以连接你的 Linux 机器，你可以在你的SSH守护进程中使用：


```
`journalctl -f -u sshd`
```

这是一个普通的登录进程，但是其日志级别为DEBUG，它看起来是这样的 :

![LogLevel DEBUG output][18]

(Stephan Avenwedde, [CC BY-SA 4.0][8])

### 了解更多

这篇文章只阐述了使用 SSH 的其中一个方式。如果你正在寻找关于特别的用例的信息，你也许可以在互联网中找到无数的教程。我在工作中使用 PuTTY ，因为它易于设置，在两个操作系统间又具有良好的可操作性，使得它的连接解决方案像是卡尔埃·尔森纳的瑞士军刀。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/6/ssh-windows

作者：[Stephan Avenwedde][a]
选题：[lujun9972][b]
译者：[yjacks](https://github.com/yjacks)
校对：[校对者ID](https://github.com/校对者ID)

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
