[#]: collector: (lujun9972)
[#]: translator: (JaphiaChen)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-14130-1.html)
[#]: subject: (Create a CentOS homelab in an hour)
[#]: via: (https://opensource.com/article/19/6/create-centos-homelab-hour)
[#]: author: (Bob Murphy https://opensource.com/users/murph)

一个小时内创建一个 CentOS 家庭实验室
======

> 用一个带有虚拟化软件的系统（CentOS ISO），花费一个小时左右来设置一套自给自足的基本 Linux 服务器。

![](https://img.linux.net.cn/data/attachment/album/202112/30/093738krqqc3c5mc35lu36.jpg)

当学习新的 Linux 技能时（或像我一样学习 Linux 认证），在笔记本电脑上有一些可用的虚拟机（VM）是很有帮助的，这样你就可以在上面学习。

但是，如果在没有良好互联网连接的地方，你却想在一个 Web 服务器上工作，该怎么办? 想要使用没有安装过的其他软件，该怎么办? 如果需要从发行版的存储库中下载它，那么你可能会碰壁。只要做一点准备，你就可以设置一个 [家庭实验室][2]，你就在任何地方安装所需的任何东西，无论是否有网络连接。

要求如下：

* 一个你打算使用的已下载的 Linux 发行版（例如，CentOS、Red Hat 等）ISO 文件
* 一台具有虚拟化功能的主机。这里使用带有 [KVM][4] 和 [virt-manager][5] 的 [Fedora][3]，但其它 Linux 也可以类似工作。你甚至可以使用 Windows 或 Mac 进行虚拟化，但在实现方面存在一些差异
* 大约一个小时

### 1、为存储主机创建一个虚拟机

使用 `virt-manager` 创建一个中等规格的虚拟机：1GB RAM、一个 CPU 和 16GB 磁盘空间就足够。

在虚拟机上安装 [CentOS 7][6]。

![Installing a CentOS homelab][7]

选择你的语言并继续。

单击 “<ruby>安装位置<rt>Installation Destination</rt></ruby>”，选择本地磁盘，勾选 “<ruby>自动配置分区<rt>Automatically Configure Partitioning</rt></ruby>” 复选框，然后单击左上角的 “<ruby>完成<rt>Done</rt></ruby>”。

在 “<ruby>软件选择<rt>Software Selection</rt></ruby>” 下，选中 “<ruby>基础设施服务器<rt>Infrastructure Server</rt></ruby>” ，选中 “<ruby>FTP 服务器<rt>FTP Server</rt></ruby>” 复选框，然后单击 “<ruby>完成<rt>Done</rt></ruby>”。

![Installing a CentOS homelab][8]

选择 “<ruby>网络和主机名<rt>Network and Host Name</rt></ruby>”，启用右上方的 “<ruby>以太网<rt>Ethernet</rt></ruby>” ，然后单击左上角的 “<ruby>完成<rt>Done</rt></ruby>”。

单击 “<ruby>开始安装<rt>Begin Installation</rt></ruby>” 开始安装操作系统。

在安装时务必设置一个 root 密码，就可以创建一个带有密码的用户。

### 2、启动 FTP 服务

下一步是启动并设置 FTP 服务以运行并允许它通过防火墙。

用 root 密码登录，然后启动 FTP 服务器：

```
systemctl start vsftpd
```

允许它在每次启动时都能工作：

```
systemctl enable vsftpd
```

设置防火墙允许通过的端口：

```
firewall-cmd --add-service=ftp --perm
```

立即启用此更改：

```
firewall-cmd --reload
```

获取你的 IP 地址：

```
ip a
```

（可能是 `eth0`），在之后会用到。

### 3、复制本地存储库中的文件

通过虚拟化软件将安装 CD 挂载到虚拟机。

创建待挂载光盘的临时目录:

```
mkdir /root/temp
```

挂载安装 CD：

```
mount /dev/cdrom /root/temp
```

将所有文件复制到 FTP 服务器目录下:

```
rsync -avhP /root/temp/ /var/ftp/pub/
```

### 4、将服务器指向本地存储库

基于 Red hat 的系统使用以 `repo` 结尾的文件来确定从哪里获得软件更新和新的软件。这些文件在以下路径

```
cd /etc/yum.repos.d
```

你需要摆脱那些使你的服务器在互联网上寻找 CentOS 存储库的存储库文件。可以把它们复制到根目录下保存起来：

```
mv * ~
```

然后创建一个新的存储库文件来指向你的服务器。使用常用的文本编辑器创建一个名为 `network.repo` 文件，输入以下内容（将 `<your IP>` 替换为在步骤 2 中获得的 IP 地址），然后保存：

```
[network]
name=network
baseurl=ftp://192.168.122.<your ip>/pub
gpgcheck=0
```

完成后，可以用下面的命令来测试：

```
yum clean all; yum install ftp
```
 
如果 FTP 客户端按照预期从 “network” 存储库安装，那么本地仓库就已经设置好了！

![Installing a CentOS homelab][9]

### 5、使用你设置的存储库安装一个新的虚拟机

回到虚拟机管理器，并创建另一个虚拟机。但这一次，选择 “<ruby>网络安装<rt>Network Install</rt></ruby>”， URL 为：

```
ftp://192.168.122.<your IP>/pub
```

如果你使用的是不同的宿主机操作系统或虚拟管理器，像前面一样安装虚拟机，并进行下一步。
 
### 6、将新的虚拟机设置为使用现有的“network”存储库

你可以从现有服务器复制存储库文件到这里使用。

和第一个服务器示例一样，输入：

```
cd /etc/yum.repos.d
mv * ~
```

然后：

```
scp root@192.168.122.<your IP>:/etc/yum.repos.d/network.repo /etc/yum.repos.d
```

现在可以使用新的虚拟机并从本地存储库获取所有软件了。

再测试一遍：

```
yum clean all; yum install screen
```
 
这将从本地存储服务器安装软件。
 
这种设置，让你能够脱离网络安装软件，创建一个更可靠的环境，扩展你的技能。
 
--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/create-centos-homelab-hour

作者：[Bob Murphy][a]
选题：[lujun9972][b]
译者：[JaphiaChen](https://github.com/JaphiaChen)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/murph
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/metrics_data_dashboard_system_computer_analytics.png?itok=oxAeIEI- (metrics and data shown on a computer screen)
[2]: https://opensource.com/article/19/3/home-lab
[3]: https://getfedora.org/
[4]: https://en.wikipedia.org/wiki/Kernel-based_Virtual_Machine
[5]: https://virt-manager.org/
[6]: https://www.centos.org/download/
[7]: https://opensource.com/sites/default/files/uploads/homelab-3b_0.png (Installing a CentOS homelab)
[8]: https://opensource.com/sites/default/files/uploads/homelab-5b.png (Installing a CentOS homelab)
[9]: https://opensource.com/sites/default/files/uploads/homelab-14b.png (Installing a CentOS homelab)
[10]: https://opensource.com/article/17/3/introduction-gnu-screen
[11]: https://southeastlinuxfest.org/
