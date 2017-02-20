在 Kali Linux 下实战 Nmap（网络安全扫描器）
========

在这第二篇 Kali Linux 文章中, 将讨论称为 ‘[nmap][30]‘ 的网络工具。虽然 nmap 不是 Kali 下唯一的一个工具，但它是最[有用的网络映射工具][29]之一。

- [第一部分-为初学者准备的Kali Linux安装指南][4]

Nmap， 是 Network Mapper 的缩写，由 Gordon Lyon 维护(更多关于 Mr. Lyon 的信息在这里: [http://insecure.org/fyodor/][28]) ，并被世界各地许多的安全专业人员使用。

这个工具在 Linux 和 Windows 下都能使用，并且是用命令行驱动的。相对于那些令人害怕的命令行，对于 nmap，在这里有一个美妙的图形化前端叫做 zenmap。

强烈建议个人去学习 nmap 的命令行版本，因为与图形化版本 zenmap 相比，它提供了更多的灵活性。

对服务器进行 nmap 扫描的目的是什么？很好的问题。Nmap 允许管理员快速彻底地了解网络上的系统，因此，它的名字叫 Network MAPper 或者 nmap。

Nmap 能够快速找到活动的主机和与该主机相关联的服务。Nmap 的功能还可以通过结合 Nmap 脚本引擎（通常缩写为 NSE）进一步被扩展。

这个脚本引擎允许管理员快速创建可用于确定其网络上是否存在新发现的漏洞的脚本。已经有许多脚本被开发出来并且包含在大多数的 nmap 安装中。

提醒一句 - 使用 nmap 的人既可能是善意的，也可能是恶意的。应该非常小心，确保你不要使用 nmap 对没有明确得到书面许可的系统进行扫描。请在使用 nmap 工具的时候注意！

#### 系统要求

1.  [Kali Linux][3] (nmap 可以用于其他操作系统，并且功能也和这个指南里面讲的类似)。
2.  另一台计算机，并且装有 nmap 的计算机有权限扫描它 - 这通常很容易通过软件来实现，例如通过 [VirtualBox][2] 创建虚拟机。
    1.  想要有一个好的机器来练习一下，可以了解一下 Metasploitable 2。
    2.  下载 MS2 ：[Metasploitable2][1]。
3.  一个可以工作的网络连接，或者是使用虚拟机就可以为这两台计算机建立有效的内部网络连接。

### Kali Linux – 使用 Nmap

使用 nmap 的第一步是登录 Kali Linux，如果需要，就启动一个图形会话（本系列的第一篇文章安装了 [Kali Linux 的 Enlightenment 桌面环境] [27]）。

在安装过程中，安装程序将提示用户输入用来登录的“root”用户和密码。 一旦登录到 Kali Linux 机器，使用命令`startx`就可以启动 Enlightenment 桌面环境 - 值得注意的是 nmap 不需要运行桌面环境。

```
# startx

```
 ![Start Desktop Environment in Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Start-Desktop-Environment-in-Kali-Linux.png) 

*在 Kali Linux 中启动桌面环境*

一旦登录到 Enlightenment，将需要打开终端窗口。通过点击桌面背景，将会出现一个菜单。导航到终端可以进行如下操作：应用程序 -> 系统 -> 'Xterm' 或 'UXterm' 或 '根终端'。

作者是名为 '[Terminator] [25]' 的 shell 程序的粉丝，但是这可能不会显示在 Kali Linux 的默认安装中。这里列出的所有 shell 程序都可用于使用 nmap 。

 ![Launch Terminal in Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Launch-Terminal-in-Kali-Linux.png) 

*在 Kali Linux 下启动终端*

一旦终端启动，nmap 的乐趣就开始了。 对于这个特定的教程，将会创建一个 Kali 机器和 Metasploitable机器之间的私有网络。

这会使事情变得更容易和更安全，因为私有的网络范围将确保扫描保持在安全的机器上，防止易受攻击的 Metasploitable 机器被其他人攻击。

### 怎样在我的网络上找到活动主机

在此示例中，这两台计算机都位于专用的 192.168.56.0/24 网络上。 Kali 机器的 IP 地址为 192.168.56.101，要扫描的 Metasploitable 机器的 IP 地址为 192.168.56.102。

假如我们不知道 IP 地址信息，但是可以通过快速 nmap 扫描来帮助确定在特定网络上哪些是活动主机。这种扫描称为 “简单列表” 扫描，将 `-sL`参数传递给 nmap 命令。

```
# nmap -sL 192.168.56.0/24

```

 ![Nmap - Scan Network for Live Hosts](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network.png) 

*Nmap – 扫描网络上的活动主机*

悲伤的是，这个初始扫描没有返回任何活动主机。 有时，这是某些操作系统处理[端口扫描网络流量][22]的一个方法。

###在我的网络中找到并 ping 所有活动主机

不用担心，在这里有一些技巧可以使 nmap 尝试找到这些机器。 下一个技巧会告诉 nmap 尝试去 ping 192.168.56.0/24 网络中的所有地址。

```
# nmap -sn 192.168.56.0/24

```
 ![Nmap - Ping All Connected Live Network Hosts](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Ping-All-Network-Live-Hosts.png) 

*Nmap – Ping 所有已连接的活动网络主机*

这次 nmap 会返回一些潜在的主机来进行扫描！ 在此命令中，`-sn` 禁用 nmap 的尝试对主机端口扫描的默认行为，只是让 nmap 尝试 ping 主机。

### 找到主机上的开放端口

让我们尝试让 nmap 端口扫描这些特定的主机，看看会出现什么。

```
# nmap 192.168.56.1,100-102

```
 ![Nmap - Network Ports Scan on Host](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-for-Ports-on-Hosts.png) 

*Nmap – 在主机上扫描网络端口*

哇! 这一次 nmap 挖到了一个金矿。 这个特定的主机有相当多的[开放网络端口][19]。

这些端口全都代表着在此特定机器上的某种监听服务。 我们前面说过，192.168.56.102 的 IP 地址会分配给一台易受攻击的机器，这就是为什么在这个主机上会有这么多[开放端口][18]。

在大多数机器上打开这么多端口是非常不正常的，所以赶快调查这台机器是个明智的想法。管理员可以检查下网络上的物理机器，并在本地查看这些机器，但这不会很有趣，特别是当 nmap 可以为我们更快地做到时！

### 找到主机上监听端口的服务

下一个扫描是服务扫描，通常用于尝试确定机器上什么[服务监听在特定的端口][17]。

Nmap 将探测所有打开的端口，并尝试从每个端口上运行的服务中获取信息。

```
# nmap -sV 192.168.56.102

```

 ![Nmap - Scan Network Services Listening of Ports](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network-Services-Ports.png) 

*Nmap – 扫描网络服务监听端口*

请注意这次 nmap 提供了一些关于 nmap 在特定端口运行的建议（在白框中突出显示），而且 nmap 也试图确认运行在这台机器上的[这个操作系统的信息][15]和它的主机名（也非常成功！）。

查看这个输出，应该引起网络管理员相当多的关注。 第一行声称 VSftpd 版本 2.3.4 正在这台机器上运行！ 这是一个真正的旧版本的 VSftpd。

通过查找 ExploitDB，对于这个版本早在 2001 年就发现了一个非常严重的漏洞（ExploitDB ID – 17491）。

### 发现主机上上匿名 ftp 登录

让我们使用 nmap 更加清楚的查看这个端口，并且看看可以确认什么。

```
# nmap -sC 192.168.56.102 -p 21

```

![Nmap - Scan Particular Post on Machine](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Particular-Port-on-Host.png) 

*Nmap – 扫描机器上的特定端口*

使用此命令，让 nmap 在主机上的 FTP 端口（`-p 21`）上运行其默认脚本（`-sC`）。 虽然它可能是、也可能不是一个问题，但是 nmap 确实发现在这个特定的服务器[是允许匿名 FTP 登录的][13]。

### 检查主机上的漏洞

这与我们早先知道 VSftd 有旧漏洞的知识相匹配，应该引起一些关注。 让我们看看 nmap有没有脚本来尝试检查 VSftpd 漏洞。

```
# locate .nse | grep ftp

```

![Nmap - Scan VSftpd Vulnerability](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Service-Vulnerability.png) 

*Nmap – 扫描 VSftpd 漏洞*

注意 nmap 已有一个 NSE 脚本已经用来处理 VSftpd 后门问题！让我们尝试对这个主机运行这个脚本，看看会发生什么，但首先知道如何使用脚本可能是很重要的。

```
# nmap --script-help=ftp-vsftd-backdoor.nse

```

![Learn Nmap NSE Script Usage](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Learn-NSE-Script.png) 

*了解 Nmap NSE 脚本使用*

通过这个描述，很明显，这个脚本可以用来试图查看这个特定的机器是否容易受到先前识别的 ExploitDB 问题的影响。

让我们运行这个脚本，看看会发生什么。

```
# nmap --script=ftp-vsftpd-backdoor.nse 192.168.56.102 -p 21

```

![Nmap - Scan Host for Vulnerable](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Host-for-Vulnerable.png) 

*Nmap – 扫描易受攻击的主机*

耶！Nmap 的脚本返回了一些危险的消息。 这台机器可能面临风险，之后可以进行更加详细的调查。虽然这并不意味着机器缺乏对风险的抵抗力和可以被用于做一些可怕/糟糕的事情，但它应该给网络/安全团队带来一些关注。

Nmap 具有极高的选择性，非常平稳。 到目前为止已经做的大多数扫描， nmap 的网络流量都保持适度平稳，然而以这种方式扫描对个人拥有的网络可能是非常耗时的。

Nmap 有能力做一个更积极的扫描，往往一个命令就会产生之前几个命令一样的信息。 让我们来看看积极的扫描的输出（注意 - 积极的扫描会触发[入侵检测/预防系统][9]!）。

```
# nmap -A 192.168.56.102

```
![Nmap - Complete Network Scan on Host](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network-Host.png) 

*Nmap – 在主机上完成网络扫描*

注意这一次，使用一个命令，nmap 返回了很多关于在这台特定机器上运行的开放端口、服务和配置的信息。 这些信息中的大部分可用于帮助确定[如何保护本机][7]以及评估网络上可能运行的软件。

这只是 nmap 可用于在主机或网段上找到的许多有用信息的很短的一个列表。强烈敦促个人在个人拥有的网络上继续[以nmap][6] 进行实验。（不要通过扫描其他主机来练习！）。

有一个关于 Nmap 网络扫描的官方指南，作者 Gordon Lyon，可从[亚马逊](http://amzn.to/2eFNYrD)上获得。

方便的话可以留下你的评论和问题（或者使用 nmap 扫描器的技巧）。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/nmap-network-security-scanner-in-kali-linux/

作者：[Rob Turner][a]
译者：[DockerChen](https://github.com/DockerChen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/robturner/
[1]:https://sourceforge.net/projects/metasploitable/files/Metasploitable2/
[2]:http://www.tecmint.com/install-virtualbox-on-redhat-centos-fedora/
[3]:http://www.tecmint.com/kali-linux-installation-guide
[4]:http://www.tecmint.com/kali-linux-installation-guide
[5]:http://amzn.to/2eFNYrD
[6]:http://www.tecmint.com/nmap-command-examples/
[7]:http://www.tecmint.com/security-and-hardening-centos-7-guide/
[8]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network-Host.png
[9]:http://www.tecmint.com/protect-apache-using-mod_security-and-mod_evasive-on-rhel-centos-fedora/
[10]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Host-for-Vulnerable.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Learn-NSE-Script.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Service-Vulnerability.png
[13]:http://www.tecmint.com/setup-ftp-anonymous-logins-in-linux/
[14]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Particular-Port-on-Host.png
[15]:http://www.tecmint.com/commands-to-collect-system-and-hardware-information-in-linux/
[16]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network-Services-Ports.png
[17]:http://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/
[18]:http://www.tecmint.com/find-open-ports-in-linux/
[19]:http://www.tecmint.com/find-open-ports-in-linux/
[20]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-for-Ports-on-Hosts.png
[21]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Ping-All-Network-Live-Hosts.png
[22]:http://www.tecmint.com/audit-network-performance-security-and-troubleshooting-in-linux/
[23]:http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network.png
[24]:http://www.tecmint.com/wp-content/uploads/2016/11/Launch-Terminal-in-Kali-Linux.png
[25]:http://www.tecmint.com/terminator-a-linux-terminal-emulator-to-manage-multiple-terminal-windows/
[26]:http://www.tecmint.com/wp-content/uploads/2016/11/Start-Desktop-Environment-in-Kali-Linux.png
[27]:http://www.tecmint.com/kali-linux-installation-guide
[28]:http://insecure.org/fyodor/
[29]:http://www.tecmint.com/bcc-best-linux-performance-monitoring-tools/
[30]:http://www.tecmint.com/nmap-command-examples/

