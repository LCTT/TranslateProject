[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11438-1.html)
[#]: subject: (CentOS 8 Installation Guide with Screenshots)
[#]: via: (https://www.linuxtechi.com/centos-8-installation-guide-screenshots/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

CentOS 8 安装图解
======

继 RHEL 8 发布之后，CentOS 社区也发布了让人期待已久的 CentOS 8，并发布了两种模式：

* CentOS stream：滚动发布的 Linux 发行版，适用于需要频繁更新的开发者
* CentOS：类似 RHEL 8 的稳定操作系统，系统管理员可以用其部署或配置服务和应用

在这篇文章中，我们会使用图解的方式演示 CentOS 8 的安装方法。

### CentOS 8 的新特性

* DNF 成为了默认的软件包管理器，同时 yum 仍然是可用的
* 使用网络管理器（`nmcli` 和 `nmtui`）进行网络配置，移除了网络脚本
* 使用 Podman 进行容器管理
* 引入了两个新的包仓库：BaseOS 和 AppStream
* 使用 Cockpit 作为默认的系统管理工具
* 默认使用 Wayland 作为显示服务器
* `iptables` 将被 `nftables` 取代
* 使用 Linux 内核 4.18
* 提供 PHP 7.2、Python 3.6、Ansible 2.8、VIM 8.0 和 Squid 4

### CentOS 8 所需的最低硬件配置:

* 2 GB RAM
* 64 位 x86 架构、2 GHz 或以上的 CPU
* 20 GB 硬盘空间

### CentOS 8 安装图解

#### 第一步：下载 CentOS 8 ISO 文件

在 CentOS 官方网站 <https://www.centos.org/download/> 下载 CentOS 8 ISO 文件。

#### 第二步： 创建 CentOS 8 启动介质（USB 或 DVD）

下载 CentOS 8 ISO 文件之后，将 ISO 文件烧录到 USB 移动硬盘或 DVD 光盘中，作为启动介质。

然后重启系统，在 BIOS 中设置为从上面烧录好的启动介质启动。

#### 第三步：选择“安装 CentOS Linux 8.0”选项

当系统从 CentOS 8 ISO 启动介质启动之后，就可以看到以下这个界面。选择“Install CentOS Linux 8.0”（安装 CentOS Linux 8.0）选项并按回车。

![Choose-Install-CentOS8][2]

#### 第四步：选择偏好语言

选择想要在 CentOS 8 **安装过程**中使用的语言，然后继续。

![Select-Language-CentOS8-Installation][3]

#### 第五步：准备安装 CentOS 8

这一步我们会配置以下内容：

* 键盘布局
* 日期和时间
* 安装来源
* 软件选择
* 安装目标
* Kdump

![Installation-Summary-CentOS8][4]

如上图所示，安装向导已经自动提供了“<ruby>键盘布局<rt>Keyboard</rt></ruby>”、“<ruby>时间和日期<rt>Time & Date</rt></ruby>”、“<ruby>安装来源<rt>Installation Source</rt></ruby>”和“<ruby>软件选择<rt>Software Selection</rt></ruby>”的选项。

如果你需要修改以上设置，点击对应的图标就可以了。例如修改系统的时间和日期，只需要点击“<ruby>时间和日期<rt>Time & Date</rt></ruby>”，选择正确的时区，然后点击“<ruby>完成<rt>Done</rt></ruby>”即可。

![TimeZone-CentOS8-Installation][5]

在软件选择选项中选择安装的模式。例如“<ruby>包含图形界面<rt>Server with GUI</rt></ruby>”选项会在安装后的系统中提供图形界面，而如果想安装尽可能少的额外软件，可以选择“<ruby>最小化安装<rt>Minimal Install</rt></ruby>”。

![Software-Selection-CentOS8-Installation][6]

这里我们选择“<ruby>包含图形界面<rt>Server with GUI</rt></ruby>”，点击“<ruby>完成<rt>Done</rt></ruby>”。

Kdump 功能默认是开启的。尽管这是一个强烈建议开启的功能，但也可以点击对应的图标将其关闭。

如果想要在安装过程中对网络进行配置，可以点击“<ruby>网络与主机名<rt>Network & Host Name</rt></ruby>”选项。

![Networking-During-CentOS8-Installation][7]

如果系统连接到启用了 DHCP 功能的调制解调器上，就会在启动网络接口的时候自动获取一个 IP 地址。如果需要配置静态 IP，点击“<ruby>配置<rt>Configure</rt></ruby>”并指定 IP 的相关信息。除此以外我们还将主机名设置为 “linuxtechi.com”。

完成网络配置后，点击“<ruby>完成<rt>Done</rt></ruby>”。

最后我们要配置“<ruby>安装目标<rt>Installation Destination</rt></ruby>”，指定 CentOS 8 将要安装到哪一个硬盘，以及相关的分区方式。

![Installation-Destination-Custom-CentOS8][8]

点击“<ruby>完成<rt>Done</rt></ruby>”。

如图所示，我为 CentOS 8 分配了 40 GB 的硬盘空间。有两种分区方案可供选择：如果由安装向导进行自动分区，可以从“<ruby>存储配置<rt>Storage Configuration</rt></ruby>”中选择“<ruby>自动<rt>Automatic</rt></ruby>”选项；如果想要自己手动进行分区，可以选择“<ruby>自定义<rt>Custom</rt></ruby>”选项。

在这里我们选择“<ruby>自定义<rt>Custom</rt></ruby>”选项，并按照以下的方式创建基于 LVM 的分区：

* `/boot`         – 2 GB (ext4 文件系统)
* `/`             – 12 GB (xfs 文件系统)
* `/home`         – 20 GB (xfs 文件系统)
* `/tmp`          – 5 GB (xfs 文件系统)
* Swap            – 1 GB (xfs 文件系统)

首先创建 `/boot` 标准分区，设置大小为 2GB，如下图所示：

![boot-partition-CentOS8-Installation][9]

点击“<ruby>添加挂载点<rt>Add mount point</rt></ruby>”。

再创建第二个分区 `/`，并设置大小为 12GB。点击加号，指定挂载点和分区大小，点击“<ruby>添加挂载点<rt>Add mount point</rt></ruby>”即可。

![slash-root-partition-centos8-installation][10]

然后在页面上将 `/` 分区的分区类型从标准更改为 LVM，并点击“<ruby>更新设置<rt>Update Settings</rt></ruby>”。

![Change-Partition-Type-CentOS8][11]

如上图所示，安装向导已经自动创建了一个卷组。如果想要更改卷组的名称，只需要点击“<ruby>卷组<rt>Volume Group</rt></ruby>”标签页中的“<ruby>修改<rt>Modify</rt></ruby>”选项。

同样地，创建 `/home` 分区和 `/tmp` 分区，分别将大小设置为 20GB 和 5GB，并设置分区类型为 LVM。

![home-partition-CentOS8-Installation][12]

![tmp-partition-centos8-installation][13]

最后创建<ruby>交换分区<rt>Swap Partition</rt></ruby>。

![Swap-Partition-CentOS8-Installation][14]

点击“<ruby>添加挂载点<rt>Add mount point</rt></ruby>”。

在完成所有分区设置后，点击“<ruby>完成<rt>Done</rt></ruby>”。

![Choose-Done-after-manual-partition-centos8][15]

在下一个界面，点击“<ruby>应用更改<rt>Accept changes</rt></ruby>”，以上做的更改就会写入到硬盘中。

![Accept-changes-CentOS8-Installation][16]

#### 第六步：选择“开始安装”

完成上述的所有更改后，回到先前的安装概览界面，点击“<ruby>开始安装<rt>Begin Installation</rt></ruby>”以开始安装 CentOS 8。

![Begin-Installation-CentOS8][17]

下面这个界面表示安装过程正在进行中。

![Installation-progress-centos8][18]

要设置 root 用户的口令，只需要点击 “<ruby>root 口令<rt>Root Password</rt></ruby>”选项，输入一个口令，然后点击“<ruby>创建用户<rt>User Creation</rt></ruby>”选项创建一个本地用户。

![Root-Password-CentOS8-Installation][19]

填写新创建的用户的详细信息。

![Local-User-Details-CentOS8][20]

在安装完成后，安装向导会提示重启系统。

![CentOS8-Installation-Progress][21]

#### 第七步：完成安装并重启系统

安装完成后要重启系统。只需点击“<ruby>重启<rt>Reboot</rt></ruby>”按钮。

![Installation-Completed-CentOS8][22]

注意：重启完成后，记得要把安装介质断开，并将 BIOS 的启动介质设置为硬盘。

#### 第八步：启动新安装的 CentOS 8 并接受许可协议

在 GRUB 引导菜单中，选择 CentOS 8 进行启动。

![Grub-Boot-CentOS8][23]

同意 CentOS 8 的许可证，点击“<ruby>完成<rt>Done</rt></ruby>”。

![Accept-License-CentOS8-Installation][24]

在下一个界面，点击“<ruby>完成配置<rt>Finish Configuration</rt></ruby>”。

![Finish-Configuration-CentOS8-Installation][25]

#### 第九步：配置完成后登录

同意 CentOS 8 的许可证以及完成配置之后，会来到登录界面。

![Login-screen-CentOS8][26]

使用刚才创建的用户以及对应的口令登录，按照提示进行操作，就可以看到以下界面。

![CentOS8-Ready-Use-Screen][27]

点击“<ruby>开始使用 CentOS Linux<rt>Start Using CentOS Linux</rt></ruby>”。

![Desktop-Screen-CentOS8][28]

以上就是 CentOS 8 的安装过程，至此我们已经完成了 CentOS 8 的安装。

欢迎给我们发送评论。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/centos-8-installation-guide-screenshots/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Install-CentOS8.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Select-Language-CentOS8-Installation.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Installation-Summary-CentOS8.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/TimeZone-CentOS8-Installation.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Software-Selection-CentOS8-Installation.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Networking-During-CentOS8-Installation.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Installation-Destination-Custom-CentOS8.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/09/boot-partition-CentOS8-Installation.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/09/slash-root-partition-centos8-installation.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Change-Partition-Type-CentOS8.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/09/home-partition-CentOS8-Installation.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/09/tmp-partition-centos8-installation.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Swap-Partition-CentOS8-Installation.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Done-after-manual-partition-centos8.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Accept-changes-CentOS8-Installation.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Begin-Installation-CentOS8.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Installation-progress-centos8.jpg
[19]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Root-Password-CentOS8-Installation.jpg
[20]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Local-User-Details-CentOS8.jpg
[21]: https://www.linuxtechi.com/wp-content/uploads/2019/09/CentOS8-Installation-Progress.jpg
[22]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Installation-Completed-CentOS8.jpg
[23]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Grub-Boot-CentOS8.jpg
[24]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Accept-License-CentOS8-Installation.jpg
[25]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Finish-Configuration-CentOS8-Installation.jpg
[26]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Login-screen-CentOS8.jpg
[27]: https://www.linuxtechi.com/wp-content/uploads/2019/09/CentOS8-Ready-Use-Screen.jpg
[28]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Desktop-Screen-CentOS8.jpg
