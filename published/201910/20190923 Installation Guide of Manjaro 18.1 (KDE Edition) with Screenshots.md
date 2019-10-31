[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11487-1.html)
[#]: subject: (Installation Guide of Manjaro 18.1 (KDE Edition) with Screenshots)
[#]: via: (https://www.linuxtechi.com/install-manjaro-18-1-kde-edition-screenshots/)
[#]: author: (Pradeep Kumar https://www.linuxtechi.com/author/pradeep/)

Manjaro 18.1（KDE）安装图解
======

在 Manjaro 18.0（Illyria）发布一年之际，该团队发布了他们的下一个重要版本，即 Manjaro 18.1，代号为 “Juhraya”。该团队还发布了一份官方声明，称 Juhraya 包含了许多改进和错误修复。

### Manjaro 18.1 中的新功能

以下列出了 Manjaro 18.1 中的一些新功能和增强功能：

* 可以在 LibreOffice 或 Free Office 之间选择
* Xfce 版的新 Matcha 主题
* 在 KDE 版本中重新设计了消息传递系统
* 使用 bhau 工具支持 Snap 和 FlatPak 软件包

### 最小系统需求

* 1 GB RAM
* 1 GHz 处理器
* 大约 30 GB 硬盘空间
* 互联网连接
* 启动介质（USB/DVD）

### 安装 Manjaro 18.1（KDE 版）的分步指南

要在系统中开始安装 Manjaro 18.1（KDE 版），请遵循以下步骤：

#### 步骤 1) 下载 Manjaro 18.1 ISO

在安装之前，你需要从位于 [这里][1] 的官方下载页面下载 Manjaro 18.1 的最新副本。由于我们这里介绍的是 KDE 版本，因此我们选择 KDE 版本。但是对于所有桌面环境（包括 Xfce、KDE 和 Gnome 版本），安装过程都是相同的。

#### 步骤 2) 创建 USB 启动盘

从 Manjaro 下载页面成功下载 ISO 文件后，就可以创建 USB 磁盘了。将下载的 ISO 文件复制到 USB 磁盘中，然后创建可引导磁盘。确保将你的引导设置更改为使用 USB 引导，并重新启动系统。

#### 步骤 3) Manjaro Live 版安装环境

系统重新启动时，它将自动检测到 USB 驱动器，并开始启动进入 Manjaro Live 版安装屏幕。

![Boot-Manjaro-18-1-kde-installation][3]

接下来，使用箭头键选择 “<ruby>启动：Manjaro x86\_64 kde<rt>Boot: Manjaro x86\_64 kde</rt></ruby>”，然后按回车键以启动 Manjaro 安装程序。

#### 安装 4) 选择启动安装程序

接下来，将启动 Manjaro 安装程序，如果你已连接到互联网，Manjaro 将自动检测你的位置和时区。单击 “<ruby>启动安装程序<rt>Launch Installer</rt></ruby>”，开始在系统中安装 Manjaro 18.1 KDE 版本。

![Choose-Launch-Installaer-Manjaro18-1-kde][4]

#### 步骤 5) 选择语言

接下来，安装程序将带你选择你的首选语言。

![Choose-Language-Manjaro18-1-Kde-Installation][5]

选择你想要的语言，然后单击“<ruby>下一步<rt>Next</rt></ruby>”。

#### 步骤 6) 选择时区和区域

在下一个屏幕中，选择所需的时区和区域，然后单击“<ruby>下一步<rt>Next</rt></ruby>”继续。

![Select-Location-During-Manjaro18-1-KDE-Installation][6]

#### 步骤 7) 选择键盘布局

在下一个屏幕中，选择你喜欢的键盘布局，然后单击“<ruby>下一步<rt>Next</rt></ruby>”继续。

![Select-Keyboard-Layout-Manjaro18-1-kde-installation][7]

#### 步骤 8) 选择分区类型

这是安装过程中非常关键的一步。 它将允许你选择分区方式：

* 擦除磁盘
* 手动分区
* 并存安装
* 替换分区

如果在 VM（虚拟机）中安装 Manjaro 18.1，则将看不到最后两个选项。

如果你不熟悉 Manjaro Linux，那么我建议你使用第一个选项（<ruby>擦除磁盘<rt>Erase Disk</rt></ruby>），它将为你自动创建所需的分区。如果要创建自定义分区，则选择第二个选项“<ruby>手动分区<rt>Manual Partitioning</rt></ruby>”，顾名思义，它将允许我们创建自己的自定义分区。

在本教程中，我将通过选择“<ruby>手动分区<rt>Manual Partitioning</rt></ruby>”选项来创建自定义分区：

![Manual-Partition-Manjaro18-1-KDE][8]

选择第二个选项，然后单击“<ruby>下一步<rt>Next</rt></ruby>”继续。

如我们所见，我有 40 GB 硬盘，因此我将在其上创建以下分区，

* `/boot`       –  2GB（ext4）
* `/`           –  10 GB（ext4）
* `/home`       –  22 GB（ext4）
* `/opt`        –  4 GB（ext4）
* <ruby>交换分区<rt>Swap</rt></ruby>       –  2 GB

当我们在上方窗口中单击“<ruby>下一步<rt>Next</rt></ruby>”时，将显示以下屏幕，选择“<ruby>新建分区表<rt>new partition table</rt></ruby>”：

![Create-Partition-Table-Manjaro18-1-Installation][9]

点击“<ruby>确定<rt>OK</rt></ruby>”。

现在选择可用空间，然后单击“<ruby>创建<rt>create</rt></ruby>”以将第一个分区设置为大小为 2 GB 的 `/boot`，

![boot-partition-manjaro-18-1-installation][10]

单击“<ruby>确定<rt>OK</rt></ruby>”以继续操作，在下一个窗口中再次选择可用空间，然后单击“<ruby>创建<rt>create</rt></ruby>”以将第二个分区设置为 `/`，大小为 10 GB：

![slash-root-partition-manjaro18-1-installation][11]

同样，将下一个分区创建为大小为 22 GB 的 `/home`：

![home-partition-manjaro18-1-installation][12]

到目前为止，我们已经创建了三个分区作为主分区，现在创建下一个分区作为扩展分区：

![Extended-Partition-Manjaro18-1-installation][13]

单击“<ruby>确定<rt>OK</rt></ruby>”以继续。

创建大小分别为 5 GB 和 2 GB 的 `/opt` 和交换分区作为逻辑分区。

![opt-partition-manjaro-18-1-installation][14]

![swap-partition-manjaro18-1-installation][15]

完成所有分区的创建后，单击“<ruby>下一步<rt>Next</rt></ruby>”：

![choose-next-after-partition-creation][16]

#### 步骤 9) 提供用户信息

在下一个屏幕中，你需要提供用户信息，包括你的姓名、用户名、密码、计算机名等：

![User-creation-details-manjaro18-1-installation][17]

提供所有信息后，单击“<ruby>下一步<rt>Next</rt></ruby>”继续安装。

在下一个屏幕中，系统将提示你选择办公套件，因此请做出适合你的选择：

![Office-Suite-Selection-Manjaro18-1][18]

单击“<ruby>下一步<rt>Next</rt></ruby>”以继续。

#### 步骤 10) 摘要信息

在完成实际安装之前，安装程序将向你显示你选择的所有详细信息，包括语言、时区、键盘布局和分区信息等。单击“<ruby>安装<rt>Install</rt></ruby>”以继续进行安装过程。

![Summary-manjaro18-1-installation][19]

#### 步骤 11) 进行安装

现在，实际的安装过程开始，一旦完成，请重新启动系统以登录到 Manjaro 18.1 KDE 版：

![Manjaro18-1-Installation-Progress][20]

![Restart-Manjaro-18-1-after-installation][21]

#### 步骤 12) 安装成功后登录

重新启动后，我们将看到以下登录屏幕，使用我们在安装过程中创建的用户凭据登录：

![Login-screen-after-manjaro-18-1-installation][22]

点击“<ruby>登录<rt>Login</rt></ruby>”。

![KDE-Desktop-Screen-Manjaro-18-1][23]

就是这样！你已经在系统中成功安装了 Manjaro 18.1 KDE 版，并探索了所有令人兴奋的功能。请在下面的评论部分中发表你的反馈和建议。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/install-manjaro-18-1-kde-edition-screenshots/

作者：[Pradeep Kumar][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lujun9972
[1]: https://manjaro.org/download/official/kde/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Boot-Manjaro-18-1-kde-installation.jpg
[4]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Launch-Installaer-Manjaro18-1-kde.jpg
[5]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Choose-Language-Manjaro18-1-Kde-Installation.jpg
[6]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Select-Location-During-Manjaro18-1-KDE-Installation.jpg
[7]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Select-Keyboard-Layout-Manjaro18-1-kde-installation.jpg
[8]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Manual-Partition-Manjaro18-1-KDE.jpg
[9]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Create-Partition-Table-Manjaro18-1-Installation.jpg
[10]: https://www.linuxtechi.com/wp-content/uploads/2019/09/boot-partition-manjaro-18-1-installation.jpg
[11]: https://www.linuxtechi.com/wp-content/uploads/2019/09/slash-root-partition-manjaro18-1-installation.jpg
[12]: https://www.linuxtechi.com/wp-content/uploads/2019/09/home-partition-manjaro18-1-installation.jpg
[13]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Extended-Partition-Manjaro18-1-installation.jpg
[14]: https://www.linuxtechi.com/wp-content/uploads/2019/09/opt-partition-manjaro-18-1-installation.jpg
[15]: https://www.linuxtechi.com/wp-content/uploads/2019/09/swap-partition-manjaro18-1-installation.jpg
[16]: https://www.linuxtechi.com/wp-content/uploads/2019/09/choose-next-after-partition-creation.jpg
[17]: https://www.linuxtechi.com/wp-content/uploads/2019/09/User-creation-details-manjaro18-1-installation.jpg
[18]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Office-Suite-Selection-Manjaro18-1.jpg
[19]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Summary-manjaro18-1-installation.jpg
[20]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Manjaro18-1-Installation-Progress.jpg
[21]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Restart-Manjaro-18-1-after-installation.jpg
[22]: https://www.linuxtechi.com/wp-content/uploads/2019/09/Login-screen-after-manjaro-18-1-installation.jpg
[23]: https://www.linuxtechi.com/wp-content/uploads/2019/09/KDE-Desktop-Screen-Manjaro-18-1.jpg
