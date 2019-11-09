[#]: collector: (lujun9972)
[#]: translator: (wenwensnow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11557-1.html)
[#]: subject: (How to dual boot Windows 10 and Debian 10)
[#]: via: (https://www.linuxtechi.com/dual-boot-windows-10-debian-10/)
[#]: author: (James Kiarie https://www.linuxtechi.com/author/james/)

如何拥有一个 Windows 10 和 Debian 10 的双系统
======

在无数次劝说自己后，你终于做出了一个大胆的决定，试试 Linux。不过，在完全熟悉 Linux 之前，你依旧需要使用 Windows 10 系统。幸运的是，通过一个双系统引导设置，能让你在启动时，选择自己想要进入的系统。在这个指南中，你会看到如何 如何双重引导 Windows 10 和 Debian 10。

![如何拥有一个 Windows 10 和 Debian 10 的双系统][2]

### 前提条件

在开始之前，确保你满足下列条件:   

  * 一个 Debian 10 的可引导 USB 或 DVD
  * 一个快速且稳定的网络（为了安装更新以及第三方软件）

另外，记得注意你系统的引导策略（UEFI 或 Legacy），需要确保两个系统使用同一种引导模式。

### 第一步：在硬盘上创建一个空余分区

第一步，你需要在你的硬盘上创建一个空余分区。之后，这将是我们安装 Debian 系统的地方。为了实现这一目的，需要使用下图所示的磁盘管理器：

同时按下 `Windows + R` 键，启动“运行程序”。接下来，输入 `diskmgmt.msc`，按回车键。

![启动“运行程序”][3]

这会启动“磁盘管理”窗口，它会显示你 Windows 上所有已有磁盘。

![磁盘管理][4]

接下来，你需要为安装的 Debian 系统创建空余空间。为此，你需要缩小其中一个磁盘（卷）上的分区，从而创建一个未分配的新分区。在这个例子里，我会从 D 盘中创建一个 30 GB 的新分区。 

为了缩小一个卷，右键点击它，然后选中选项 “<ruby>缩小<rt>Shrink volume...</rt></ruby>”。

![缩小卷][5]

在弹出窗口中，定义你想缩小的空间大小。记住，这是将来要安装 Debian 10 的磁盘空间。我选择了  30000MB（大约 30 GB）。压缩完成后，点击“<ruby>缩小<rt>Shrink</rt></ruby>”。

![缩小空间][6]

在缩小操作结束后，你会看到一个如下图所示的未分配分区：

![未分配分区][7]

完美！现在可以准备开始安装了。

### 第二步：开始安装 Debian 10 

空余分区已经创建好了，将你的可引导 USB 或安装 DVD 插入电脑，重新启动系统。记得更改 BIOS 中的引导顺序，需要在启动时按住功能键（通常，根据品牌不同，是 `F9`、`F10` 或 `F12` 中的某一个）。 这一步骤，对系统是否能进入安装媒体来说，至关重要。保存 BIOS 设置，并重启电脑。 

如下图所示，界面会显示一个新的引导菜单：点击 “Graphical install”。

![图形化界面安装][8]

下一步，选择你的偏好语言，然后点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![设置语言-Debian10][9]

接着，选择你的地区，点击“<ruby>继续<rt>Continue</rt></ruby>”。 根据地区，系统会自动选择当地对应的时区。如果你无法找到你所对应的地区，将界面往下拉， 点击“<ruby>其他<rt>Other</rt></ruby>”后，选择相对应位置。

![选择地区-Debain10][10]

而后，选择你的键盘布局。 

![设置键盘-Debain10][11]

接下来，设置系统的主机名，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![设置主机名-Debian10][12]

下一步，确定域名。如果你的电脑不在域中，直接点击 “<ruby>继续<rt>Continue</rt></ruby>”按钮。 

![设置域名-Debian10][13]

然后，如图所示，设置 root 密码，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![设置 root 密码-Debian10][14]

下一步骤，设置账户的用户全名，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![设置用户全名-debain10][15]

接着，设置与此账户相关联的用户名。

![指定用户名-Debian10][16]

下一步，设置用户密码，点击“<ruby>继续<rt>Continue</rt></ruby>”。

![设置用户密码-Debian10][17]

然后，设置时区。

![设置时区-Debian10][18]

这时，你要为 Debian10 安装创建分区。如果你是新手用户，点击菜单中的第一个选项，“<ruby>使用最大的连续空余空间<rt>Use the largest continuous free space</rt></ruby>”，点击“<ruby>继续<rt>Continue</rt></ruby>”。

![使用最大的连续空余空间-debian10][19]

不过，如果你对创建分区有所了解的话，选择“<ruby>手动<rt>Manual</rt></ruby>” 选项，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![选择手动-Debain10][20]

接着，选择被标记为 “<ruby>空余空间<rt>FREE SPACE</rt></ruby>” 的磁盘，点击 “<ruby>继续<rt>Continue</rt></ruby>” 。接下来，点击“<ruby>创建新分区<rt>Create a new partition</rt></ruby>”。

![创建新分区-Debain10][21]

下一界面，首先确定交换空间大小。我的交换空间大小为 2GB，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![确定交换空间大小-debian10][22]

点击下一界面的 “<ruby>主分区<rt>Primary</rt></ruby>”，点击“<ruby>继续<rt>Continue</rt></ruby>”。

![磁盘主分区-Debian10][23]

选择在磁盘 “<ruby>初始位置<rt>beginning</rt></ruby>” 创建新分区后，点击继续。

![在初始位置创建-Debain10][24]

选择 “<ruby>Ext 4 日志文件系统<rt>Ext 4 journaling file system</rt></ruby>”，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![选择 Ext4 日志文件系统-debain10][25]

下个界面选择“<ruby>交换空间<rt>swap space</rt></ruby>” ，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![选择交换空间-debian10][26]

选中 “<ruby>完成此分区设置<rt>done setting the partition</rt></ruby>”，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![完成此分区设置-debian10][27]

返回磁盘分区界面，点击 “<ruby>空余空间<rt>FREE SPACE</rt></ruby>”，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![点击空余空间-Debain10][28]

为了让自己能轻松一点，选中 “<ruby>自动为空余空间分区<rt>Automatically partition the free space</rt></ruby>”后，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![自动为空余空间分区-Debain10][29]

接着点击 “<ruby>将所有文件存储在同一分区（新手用户推荐）<rt>All files in one partition (recommended for new users)</rt></ruby>”。

![将所有文件存储在同一分区-debian10][30]

最后， 点击 “<ruby>完成分区设置，并将改动写入磁盘<rt>Finish partitioning and write changes to disk</rt></ruby>” ，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![完成分区设置，并将改动写入磁盘][31]

确定你要将改动写入磁盘，点击 “<ruby>是<rt>Yes</rt></ruby>”。

![将改动写入磁盘-Debian10][32]

而后，安装程序会开始安装所有必要的软件包。

当系统询问是否要扫描其他 CD 时，选择 “<ruby>否<rt>No</rt></ruby>” ，并点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![扫描其他CD-No-Debain10][33]

接着，选择离你最近的镜像站点地区，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![Debian-镜像站点-国家][34]

然后，选择最适合你的镜像站点，点击“<ruby>继续<rt>Continue</rt></ruby>”。

![选择镜像站点][35]

如果你打算使用代理服务器，在下面输入具体信息，没有的话就留空，点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![输入代理信息-debian10][36]

随着安装进程的继续， 你会被问到，是否想参加一个软件包用途调查。你可以选择任意一个选项，之后点击“<ruby>继续<rt>Continue</rt></ruby>”，我选择了“<ruby>否<rt>No</rt></ruby>”。

![参与调查-debain10][37]

在软件选择窗口选中你想安装的软件包，点击“<ruby>继续<rt>Continue</rt></ruby>”。

![软件选择-debian10][38]

安装程序会将选中的软件一一安装，在这期间，你可以去喝杯咖啡休息一下。

系统将会询问你，是否要将 grub 的引导装载程序安装到主引导记录表（MBR）上。点击 “<ruby>是<rt>Yes</rt></ruby>”，而后点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![安装-grub-bootloader-debian10][39]

接着，选中你想安装 grub 的硬盘，点击“<ruby>继续<rt>Continue</rt></ruby>”。

![选择硬盘-安装 grub-Debian10][40]

最后，安装完成，直接点击 “<ruby>继续<rt>Continue</rt></ruby>”。

![安装完成-重新启动-debian10][41]

你现在应该会有一个列出 Windows 和 Debian 的 grub 菜单。为了引导 Debian 系统，往下选择 Debian。之后，你就能看见登录界面。输入密码之后，按回车键。

![Debian10-登录][42]

这就完成了！这样，你就拥有了一个全新的 Debian 10 和 Windows 10 双系统。

![Debian10-Buster-Details][43]

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/dual-boot-windows-10-debian-10/

作者：[James Kiarie][a]
选题：[lujun9972][b]
译者：[wenwensnow](https://github.com/wenwensnow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/james/
[b]: https://github.com/lujun9972
[1]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]: https://www.linuxtechi.com/wp-content/uploads/2019/10/How-to-dual-boot-Windows-and-Debian10.jpg
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Launch-Run-dialogue.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Disk-management.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Shrink-volume.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Shrink-space.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Unallocated-partition.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Graphical-Install-Debian10.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-Language-Debian10.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-location-Debain10.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Configure-Keyboard-layout-Debain10.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Set-hostname-Debian10.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Set-domain-name-Debian10.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Set-root-Password-Debian10.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Specify-fullname-user-debain10.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Specify-username-Debian10.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Specify-user-password-Debian10.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Configure-timezone-Debian10.jpg
[19]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Use-largest-continuous-free-space-debian10.jpg
[20]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-Manual-Debain10.jpg
[21]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Create-new-partition-Debain10.jpg
[22]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Define-swap-space-debian10.jpg
[23]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Partition-Disks-Primary-Debain10.jpg
[24]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Start-at-the-beginning-Debain10.jpg
[25]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-Ext4-Journaling-system-debain10.jpg
[26]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-swap-debain10.jpg
[27]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Done-setting-partition-debian10.jpg
[28]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Click-Free-space-Debain10.jpg
[29]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Automatically-partition-free-space-Debain10.jpg
[30]: https://www.linuxtechi.com/wp-content/uploads/2019/10/All-files-in-one-partition-debian10.jpg
[31]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Finish-partitioning-write-changes-to-disk.jpg
[32]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Write-changes-to-disk-Yes-Debian10.jpg
[33]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Scan-another-CD-No-Debain10.jpg
[34]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Debian-archive-mirror-country.jpg
[35]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-Debian-archive-mirror.jpg
[36]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Enter-proxy-details-debian10.jpg
[37]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Participate-in-survey-debain10.jpg
[38]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Software-selection-debian10.jpg
[39]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Install-grub-bootloader-debian10.jpg
[40]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Select-hard-drive-install-grub-Debian10.jpg
[41]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Installation-complete-reboot-debian10.jpg
[42]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Debian10-log-in.jpg
[43]: https://www.linuxtechi.com/wp-content/uploads/2019/10/Debian10-Buster-Details.jpg
