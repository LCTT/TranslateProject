Manage Samba4 AD Domain Controller DNS and Group Policy from Windows – Part 4
============================================================
在 Windows 系统下管理 Samba4 AD 域管制器 DNS 和组策略（四）

接着前一篇教程写的关于[使用 Windows 10 系统的 RSAT 工具来管理 Samba4 活动目录架构][4]，在这篇文章中我们将学习如何使用微软 DNS 管理器远程管理我们的 Samba AD 域控制器的 DNS 服务器，如何创建 DNS 记录，如何创建反向查找区域以及如何通过组策略管理工具来创建域策略。

#### 需求

1、 [在 Ubuntu16.04 系统上使用 Samba4 软件来创建活动目录架构（一）][1]
2、 [在 Linux 命令行下管理 Samba4 AD 架构（二）][2]
3、 [使用 Windows 10 系统的 RSAT 工具来管理 Samba4 活动目录架构 （三）][3]

### 第 1 步：管理 Samba DNS 服务器

Samba4 AD DC 使用内部的 DNS 解析模块，该模块在初始化域提供的过程中被创建完成（如果 BIND9 DLZ 模块未特定使用的情况下）。

Samba4 内部的 DNS 域模块支持 AD 域控制器所必须的基本功能。有两种方式来管理域 DNS 服务器，直接在命令行下通过 samba-tool 接口来管理，或者使用已加入域的微软工作站中的 RSAT DNS 管理器远程进行管理。

在这篇文章中，我们使用第二种方式来进行管理，因为这种方式很直观，也不容易出错。

1、要使用 RSAT 工具来管理域控制器上的 DNS 服务器，在 Windows 机器上，打开控制面板 -> 系统和安全 -> 管理工具，然后运行 DNS 管理器工具。

当打开这个工具时，它会询问你将要连接到哪台正在运行的 DNS 服务器。选择使用下面的计算机，输入域名（IP 地址或 FQDN 地址都可以使用），勾选‘现在连接到指定计算机’，然后单击 OK 按钮以开启 Samba DNS 服务。

[
 ![Connect Samba4 DNS on Windows](http://www.tecmint.com/wp-content/uploads/2016/12/Connect-Samba4-DNS-on-Windows.png) 
][5]

在 Windows 系统上连接 Samba4 DNS 服务器

2、为了添加一条 DNS 记录（比如我们添加一条指向 LAN 网关的记录 ‘A'），打开 DNS 管理器，找到域正向查找区，在右侧单击右键选择新的主机（’A‘ 或 ’AAA‘）。

[
 ![Add DNS A Record on Windows](http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-A-Record.png) 
][6]

在 Windows 下添加一条 DNS 记录

3、在打开的新主机窗口界面，输入 DNS 服务器的主机名和 IP 地址。 DNS 管理器工具会自动填写完成 FQDN 地址。填写完成后，点击添加主机按钮，之后会弹出一个新的窗口提示你 DNS A 记录已经创建完成。

确保你添加的 DNS A 记录是你们网络中的资源[已配置静态 IP][7]。不要为那些从 DHCP 服务器自动获取 IP 地址或者经常变换 IP 地址的主机添加 DNS A 记录。

[
 ![Configure Samba Host on Windows](http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Samba-Host-on-Windows.png) 
][8]

在 Windows 系统下配置 Samba 主机

要更新一条 DNS 记录只需要双击那条记录，然后输入更改原因即可。要删除一条记录时，只需要在这条记录上单击右键，选择从菜单删除即可。

同样的方式，你也可以为你的域添加其它类型的 DNS 记录，比如说 CNAME 记录（也称为 DNS 别名记录），MX 记录（在邮件服务器上非常有用）或者其它类型的记录（SPE、TXT、SRVetc类型）。

### 第 2 步：创建反向查找区域

默认情况下， Samba4 AD DC 不会自动为你的域添加一个反向查找区域和 PTR 记录，因为这些类型的记录对于域控制器的正常工作来说是无关紧要的。

相反，DNS 反向区和 PTR 记录在一些重要的网络服务中显得非常有用，比如邮件服务，因为这些类型的记录可以用于验证客户端请求服务的身份。

实际上， PTR 记录的功能与标准的 DNS 记录功能相反。客户端知道资源的 IP 地址，然后去查询 DNS 服务器来识别出已注册的 DNS 名字。

4、要创建 Samba AD DC 的反向查找区域，打开 DNS 管理器，在左侧反向查找区域目录上单击右键，然后选择菜单中的新区域。

[
 ![Create Reverse Lookup DNS Zone](http://www.tecmint.com/wp-content/uploads/2016/12/Create-Reverse-Lookup-DNS-Zone.png) 
][9]

创建 DNS 反向查找区域

5、下一步，单击下一步按钮，然后从区域类型向导中选择主区域。
[
 ![Select DNS Zone Type](http://www.tecmint.com/wp-content/uploads/2016/12/Select-DNS-Zone-Type.png) 
][10]

选择 DNS  区域类型

6、下一步，在 AD 区域复制范围中选择复制到该域里运行在域控制器上的所有的 DNS 服务器，选择 IPv4 反向查找区域然后单击下一步继续。

[
 ![Select DNS for Samba Domain Controller](http://www.tecmint.com/wp-content/uploads/2016/12/Select-DNS-for-Samba-Domain-Controller.png) 
][11]

为 Samba 域控制器选择 DNS 服务器

[
 ![Add Reverse Lookup Zone Name](http://www.tecmint.com/wp-content/uploads/2016/12/Add-Reverse-Lookup-Zone-Name.png) 
][12]

添加反向查找区域名

7、下一步，在网络ID 框中输入你的 LAN IP 地址，然后单击下一步继续。

资源在这个区域内添加的所有 PTR 记录仅指向 192.168.1.0/24 网络段。如果你想要为一个不在该网段中的服务器创建一个 PTR 记录（比如邮件服务器位于 10.0.0.0/24 这个网段的时候），那么你还得为那个网段创建一个新的反向查找区域。

[
 ![Add IP Address of Reverse Lookup DNS Zone](http://www.tecmint.com/wp-content/uploads/2016/12/Add-IP-Address-of-Reverse-DNS-Zone.png) 
][13]

添加 DNS 反向查找区域的 IP 地址

8、在下一个截图中选择仅允许安全的动态更新，单击下一步继续，最后单击完成按钮以完成反向查找区域的创建。

[
 ![Enable Secure Dynamic Updates](http://www.tecmint.com/wp-content/uploads/2016/12/Enable-Secure-Dynamic-Updates.png) 
][14]

启用安全动态更新

[
 ![New DNS Zone Summary](http://www.tecmint.com/wp-content/uploads/2016/12/New-DNS-Zone-Summary.png) 
][15]

新 DNS 区域概述

9、此时，你已经为你的域环境创建完成了一个有效的 DNS 反向查找区域。为了在这个区域中添加一个 PTR 记录，在右侧右键单击，选择为网络资源创建一个 PTR 记录。

这个时候，我们已经为网关创建了一个指向。为了测试这条记录对于客户端是否添加正确和工作正常，打开命令行提示符执行 nslookup 查询资源名，再执行另外一条命令查询 IP  地址。

两个查询都应该为你的 DNS 资源返回正确的结果。

```
nslookup gate.tecmint.lan
nslookup 192.168.1.1
ping gate
```
[
 ![Add DNS PTR Record and Query PTR](http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-PTR-Record-and-Query.png) 
][16]

添加及查询 PTR 记录
### 第 3 步：管理域控制策略

10、域控制器最重要的作用就是集中控制系统资源及安全。使用域控制器的域组策略功能很容易实现这些类型的任务。

遗憾的是，在 Samba 域控制器上唯一用来编辑或管理组策略的方法是通过微软的 RSAT GPM 工具。

在下面的实例中，我们将看到通过组策略来实现在 Samba 域环境中为域用户创建一种交互式的登录方式是多么的简单。

要访问组策略控制台，打开控制面板 -> 系统和安全 -> 管理工具，然后打开组策略管理控制台。

展开你的域下面的目录，在默认组策略上右键，选择菜单中的编辑，将出现一个新的窗口。

[
 ![Manage Samba Domain Group Policy](http://www.tecmint.com/wp-content/uploads/2016/12/Manage-Samba-Domain-Group-Policy.png) 
][17]

管理 Samba 域组策略

11、在组策略管理编辑器窗口中，进入到电脑配置 -> 组策略 -> Windows 设置 -> 安全设置 -> 本地策略 -> 安全选项，你将在右侧看到一个新的选项列表。

在右侧查询并编辑你的定制化设置，参考下图中的两条设置内容。

[
 ![Configure Samba Domain Group Policy](http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Samba-Domain-Group-Policy.png) 
][18]

配置 Samba 域组策略

12、这两个条目编辑完成后，关闭所有窗口，打开 CMD 窗口，执行以下命令来强制应用组策略。

```
gpupdate /force
```
[
 ![Update Samba Domain Group Policy](http://www.tecmint.com/wp-content/uploads/2016/12/Update-Samba-Domain-Group-Policy.png) 
][19]

更新 Samba  域组策略

13、最后，重启你的电脑，当你准备登录进入系统的时候，你就会看到登录提示生效了。
[
 ![Samba4 AD Domain Controller Logon Banner](http://www.tecmint.com/wp-content/uploads/2016/12/Samba4-Domain-Controller-User-Login.png) 
][20]

Samba4 AD 域控制器登录提示

就写到这里吧！组策略是一个操作起来很繁琐和很谨慎的主题，在管理系统的过程中你得非常的小心。还有，注意你设置的组策略不会以任何方式应用到已加入域的 Linux 系统中。

------

作者简介：我是一个电脑迷，开源软件及 Linux 系统爱好者，有近4年的 Linux 桌面和服务器系统及 bash 编程经验。


--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/

作者：[Matei Cezar ][a]
译者：[rusking](https://github.com/rusking)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/cezarmatei/
[1]:http://www.tecmint.com/install-samba4-active-directory-ubuntu/
[2]:http://www.tecmint.com/manage-samba4-active-directory-linux-command-line/
[3]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[4]:http://www.tecmint.com/manage-samba4-ad-from-windows-via-rsat/
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/Connect-Samba4-DNS-on-Windows.png
[6]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-A-Record.png
[7]:http://www.tecmint.com/set-add-static-ip-address-in-linux/
[8]:http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Samba-Host-on-Windows.png
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/Create-Reverse-Lookup-DNS-Zone.png
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-DNS-Zone-Type.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/Select-DNS-for-Samba-Domain-Controller.png
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-Reverse-Lookup-Zone-Name.png
[13]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-IP-Address-of-Reverse-DNS-Zone.png
[14]:http://www.tecmint.com/wp-content/uploads/2016/12/Enable-Secure-Dynamic-Updates.png
[15]:http://www.tecmint.com/wp-content/uploads/2016/12/New-DNS-Zone-Summary.png
[16]:http://www.tecmint.com/wp-content/uploads/2016/12/Add-DNS-PTR-Record-and-Query.png
[17]:http://www.tecmint.com/wp-content/uploads/2016/12/Manage-Samba-Domain-Group-Policy.png
[18]:http://www.tecmint.com/wp-content/uploads/2016/12/Configure-Samba-Domain-Group-Policy.png
[19]:http://www.tecmint.com/wp-content/uploads/2016/12/Update-Samba-Domain-Group-Policy.png
[20]:http://www.tecmint.com/wp-content/uploads/2016/12/Samba4-Domain-Controller-User-Login.png
[21]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#
[22]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#
[23]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#
[24]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#
[25]:http://www.tecmint.com/manage-samba4-dns-group-policy-from-windows/#comments
