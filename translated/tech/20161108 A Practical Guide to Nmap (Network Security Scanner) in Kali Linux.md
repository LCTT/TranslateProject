
# 一份关于在Kali Linux下使用Nmap（网络安全扫描器）的实用指南
在这第二篇Kali Linux文章中, 将讨论称为‘[nmap][30]‘的网络工具。虽然nmap不是Kali下唯一的一个工具，但它是最[有用的网络映射工具][29]之一。

1.  [第一部分-为初学者准备的Kali Linux安装指南][4]

Nmap,是Network Mapper的缩写,由Gordon Lyon维护(更多关于Mr. Lyon的信息在这里: [http://insecure.org/fyodor/][28]) ，并被世界各地许多的安全专业人员使用。

这个工具在Linux和Windows都能使用，并且是用命令行驱动的。相对于那些令人害怕的命令行，对于nmap，在这里有一个美妙的图形化前端叫做zenmap。

强烈建议个人去学习nmap的CLI版本，因为与图形化版本zenmap相比，它提供了更多的灵活性。

nmap服务器的目的是什么？很好的问题。Nmap允许管理员快速彻底地了解网络上的系统，因此，它的名字叫Network MAPper或者nmap。

Nmap能够快速找到活动的主机和与该主机相关联的服务。Nmap的功能还可以进一步被扩展，通过结合Nmap脚本引擎，通常缩写为NSE。

此脚本引擎允许管理员快速创建可用于确定其网络上是否存在新发现的漏洞的脚本。许多脚本已经被开发并且包含在大多数的nmap安装中。


提醒一句- nmap是被有好的和坏的意图的人共同使用的。应该非常小心，以确保你不使用nmap对系统的权限没有明确提供在书面/法律协议上进行攻击。请在使用nmap工具的时候注意！

#### 系统要求

1.  [Kali Linux][3] (nmap可以用于其他操作系统并且功能也和这个指南里面讲的类似).
2.  有另一台计算机并且装有nmap的计算机有权限扫描它-这通常很容易通过软件来实现，例如[VirtualBox][2]，可以创建虚拟机.
    1.  想要有一个好的机器来联系，请阅读Metasploitable 2
    2.  下载MS2 [Metasploitable2][1]
3.  一个与网络有效的工作连接或者是使用虚拟机，就可以为这两台计算机建立有效的内部网络连接

### Kali Linux – 使用Nmap

The first step to working with nmap is to log into the Kali Linux machine and if desired, start a graphical session (This first article in this series installed [Kali Linux with the Enlightenment Desktop Environment][27]).
使用nmap的第一步是登录Kali Linux，如果需要，就启动一个图形会话（本系列的第一篇文章安装了[Kali Linux with Enlightenment桌面环境] [27]）。


在安装过程中，安装程序将提示用户输入需要登录的“root”用户和密码。 一旦登录到Kali Linux机器，使用命令'startx'就可以启动Enlightenment桌面环境 - 值得注意的是nmap不需要运行桌面环境。

```
# startx

```
[
 ![Start Desktop Environment in Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Start-Desktop-Environment-in-Kali-Linux.png) 
][26]


在Kali Linux中启动桌面环境

一旦登录启用，将需要打开终端窗口。 通过点击桌面背景，将会出现一个菜单。 导航到终端可以进行如下操作：应用程序 - >系统 - >'Xterm'或'UXterm'或'根终端'。

作者是shell程序的粉丝叫'[Terminator] [25]'，但是这可能不会显示在Kali Linux的默认安装中。 列出的所有shell程序都出于使用nmap的目的。

[
 ![Launch Terminal in Kali Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Launch-Terminal-in-Kali-Linux.png) 
][24]

在Kali Linux下启动终端


一旦终端启动，nmap的乐趣就开始了。 对于这个特定的教程，创建了一个具有Kali机器和Metasploitable机器的专用网络。


这会使事情变得更容易和更安全，因为私有的网络范围将确保扫描保持在安全的机器上，防止易受攻击的Metasploitable机器被其他人攻击。

在此示例中，这两台计算机都位于专用的192.168.56.0 / 24网络上。 Kali机器的IP地址为192.168.56.101，要扫描的Metasploitable机器的IP地址为192.168.56.102。


虽然IP地址信息不可用，但是 快速nmap扫描可以帮助确定在特定网络上存在什么， 此扫描称为“Simple List”扫描，因此将`-sL`参数传递给nmap命令。

```
# nmap -sL 192.168.56.0/24

```
[
 ![Nmap - Scan Network for Live Hosts](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network.png) 
][23]

Nmap – 扫描网络上的存活主机

悲伤的是，这个初始扫描没有返回任何活主机。 有时，这是某些操作系统处理[端口扫描网络流量] [22]的一个因素。


不用担心，在这里有一些技巧可以使nmap尝试找到这些机器。 下一个技巧会告诉nmap只是尝试ping 192.168.56.0/24网络中的所有地址。

```
# nmap -sn 192.168.56.0/24

```
[
 ![Nmap - Ping All Connected Live Network Hosts](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Ping-All-Network-Live-Hosts.png) 
][21]

Nmap – Ping所有已连接的活动网络主机
这个时间nmap会返回一些潜在的主机来进行扫描！ 在此命令中，`-sn`禁用nmap的尝试端口扫描主机的默认行为，只是让nmap尝试ping主机。


让我们尝试让nmap端口扫描这些特定的主机，看看会出现什么。

```
# nmap 192.168.56.1,100-102

```
[
 ![Nmap - Network Ports Scan on Host](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-for-Ports-on-Hosts.png) 
][20]

Nmap – 在主机上扫描网络端口

哇! 这一次nmap挖到了一个金矿。 这个特定的主机有相当多的[开放网络端口] [19]。

这些端口都指代在此特定机器上的某种监听服务。 从早期回忆，192.168.56.102的IP地址会分配给性易受攻击的机器，因此这就是为什么会有这么多[开放端口在这个主机上] [18]。


在大多数机器上打开这个端口是非常不正常的，所以它可能是一个明智的想法，因为可以非常紧密地调查这台机器。 管理员可以跟踪网络上的物理机器，并在本地查看这台机器，但这不会很有趣，特别是当nmap可以做到我们更快！


下一个扫描是服务扫描，通常用于尝试确定机器上什么[服务在特定的端口被监听] [17]。

Nmap将探测所有打开的端口，并尝试从每个端口上运行的服务中获取信息。

```
# nmap -sV 192.168.56.102

```
[
 ![Nmap - Scan Network Services Listening of Ports](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network-Services-Ports.png) 
][16]

Nmap – 扫描网络服务监听端口

请注意这次nmap提供了一些关于nmap在特定端口运行的建议（在白框中突出显示），而且nmap也试图[确认这个操作系统的信息][15]运行在这台机器上和它的主机名（也非常成功！）。
Notice this time nmap provided some suggestions on what nmap thought might be running on this particular port (highlighted in the white box). Also nmap also tried to [determine information about the operating system][15]running on this machine as well as its hostname (with great success too!).

查看这个输出，应该引起网络管理员相当多的关注。 第一行声称VSftpd版本2.3.4正在这台机器上运行！ 这是一个真正的旧版本的VSftpd。

通过查找ExploitDB,一个非常严重的漏洞是在2001被发现，这是一个特别的版本(ExploitDB ID – 17491)。

让我们使用nmap更加清楚的查看这个特别的端口并且看看可以确认什么东西。

```
# nmap -sC 192.168.56.102 -p 21

```
[
 ![Nmap - Scan Particular Post on Machine](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Particular-Port-on-Host.png) 
][14]

Nmap – 扫描机器上的特定邮件

使用此命令，让nmap在主机上的FTP端口（-p 21）上运行其默认脚本（-sC）。 虽然它可能是也可能不是一个问题，但是nmap确实发现[匿名FTP登录是允许的] [13]在这个特定的服务器。

这与早先有关具有旧漏洞的VSftd的知识相匹配，应该引起一些关注。 让我们看看nmap是否有任何脚本来试图检查VSftpd漏洞。

```
# locate .nse | grep ftp

```
[
 ![Nmap - Scan VSftpd Vulnerability](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Service-Vulnerability.png) 
][12]

Nmap – 扫描VSftpd漏洞

注意nmap有一个NSE脚本已经用来处理VSftpd后门问题！ 让我们尝试对这个主机运行这个脚本，看看会发生什么，但首先知道如何使用脚本可能是很重要的。

```
# nmap --script-help=ftp-vsftd-backdoor.nse

```
[
 ![Learn Nmap NSE Script Usage](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Learn-NSE-Script.png) 
][11]

了解Nmap NSE脚本使用情况

通过这个描述，很明显，这个脚本可以用来试图查看这个特定的机器是否容易受到先前识别的ExploitDB问题。

让我们运行这个脚本，看看会发生什么。

```
# nmap --script=ftp-vsftpd-backdoor.nse 192.168.56.102 -p 21

```
[
 ![Nmap - Scan Host for Vulnerable](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Host-for-Vulnerable.png) 
][10]

Nmap – 扫描易受攻击的主机


Yikes！ Nmap的脚本返回了一些危险的消息。 这台机器可能是一个很好的候选者，之后可以进行更加详细的调查。 这并不意味着机器缺乏抵抗力和可以被用于做一些可怕/糟糕的事情，但它应该给网络/安全团队带来一些关注。


Nmap具有极高的选择性和极高的能力。 到目前为止已经做的大多数尝试保持nmap的网络流量适度保持平稳，然而以这种方式扫描个人拥有的网络可能是非常耗时的。
Nmap有能力做一个更积极的扫描，往往会产生大部分相同的信息，但在一个命令，而不是几个。 让我们来看看积极的扫描的输出（注意 - 积极的扫描可以被关闭[入侵检测/预防系统][9]!).

```
# nmap -A 192.168.56.102

```
[
 ![Nmap - Complete Network Scan on Host](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Scan-Network-Host.png) 
][8]

Nmap – 在主机上完成网络扫描


注意这一次，使用一个命令，nmap返回了很多关于在这台特定机器上运行的开放端口，服务和配置的信息。 这些信息中的大部分可用于帮助确定[如何保护本机] [7]以及评估网络上可能存在的软件。

这只是nmap可用于在主机或网段上找到的许多有用事情的简短列表。 强烈敦促个人在个人拥有的网络上继续[以nmap] [6]进行实验。（不要通过扫描其他实体练习！）。

有一个关于Nmap网络扫描的官方指南，作者Gordon Lyon，可从亚马逊上获得。

<center style="border: 0px; font-style: inherit; font-variant: inherit; font-weight: inherit; font-stretch: inherit; font-size: inherit; line-height: inherit; font-family: inherit; vertical-align: baseline;">[
 ![Nmap Network Scanning Guide](http://www.tecmint.com/wp-content/uploads/2016/11/Nmap-Network-Security-Scanner-Guide.png) 
][5]</center>

--------------------------------------------------------------------------------

via: http://www.tecmint.com/nmap-network-security-scanner-in-kali-linux/

作者：[Rob Turner][a]

译者：[DockerChen](https://github.com/DockerChen)

校对：[校对者ID](https://github.com/校对者ID)

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

