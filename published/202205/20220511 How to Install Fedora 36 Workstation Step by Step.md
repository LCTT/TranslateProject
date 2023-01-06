[#]: subject: "How to Install Fedora 36 Workstation Step by Step"
[#]: via: "https://www.linuxtechi.com/how-to-install-fedora-workstation/"
[#]: author: "Pradeep Kumar https://www.linuxtechi.com/author/pradeep/"
[#]: collector: "lkxed"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14637-1.html"

图解 Fedora 36 工作站安装步骤
======

![](https://img.linux.net.cn/data/attachment/album/202205/26/085318lbeqqwwevbzzwb4o.jpg)

给 Fedora 用户的好消息，Fedora 36 操作系统已经正式发布了。这个发布版本是针对工作站（桌面）和服务器的。下面是 Fedora 36 工作站版的新的特征和改进：

* GNOME 42 是默认的桌面环境
* 移除用于支持联网的 ifcfg 文件，并引入秘钥文件来进行配置
* 新的 Linux 内核版本 5.17
* 软件包更新为新版本，如 PHP 8.1、gcc 12、OpenSSL 3.0、Ansible 5、OpenJDK 17、Ruby 3.1、Firefox 98 和 LibreOffice 7.3
* RPM 软件包数据库从 `/var` 移动到了 `/usr` 文件夹。
* Noto 字体是默认的字体，它将提供更好的用户体验。

在这篇指南中，我们将图解安装 Fedora 36 工作站的步骤。在进入安装步骤前，请确保你的系统满足下面的必要条件。

* 最少 2GB 内存（或者更多）
* 双核处理器
* 25 GB 硬盘磁盘空间（或者更多）
* 可启动介质

心动不如行动，让我们马上深入安装步骤。

### 1、下载 Fedora 36 工作站的 ISO 文件

使用下面的链接来从 Fedora 官方网站下载 ISO 文件。

> **[下载 Fedora Workstation][1]**

在 ISO 文件下载后，接下来将其刻录到 U 盘，使其可启动。

### 2、使用可启动介质启动系统

现在，转向到目标系统，重新启动它，并在 BIOS 设置中将可启动介质从硬盘驱动器更改为 U 盘（可启动介质）启动。在系统使用可启动介质启动后，我们将看到下面的屏幕。

![Choose-Start-Fedora-Workstation-Live-36][2]

选择第一个选项 “Start Fedora-Workstation-Live 36” ，并按下回车键。

### 3、选择安装到硬盘驱动器

![Select-Install-to-Hardrive-Fedora-36-workstation][3]

选择 “<ruby>安装到硬盘<rt>Install to Hard Drive</rt></ruby>” 选项来继续安装。

### 4、选择你的首选语言

选择你的首选语言来适应你的安装过程。

![Language-Selection-Fedora36-Installation][4]

单击 “<ruby>继续<rt>Continue</rt></ruby>” 按钮。

### 5、选择安装目标

在这一步骤中，我们将看到下面的安装摘要屏幕，在这里，我们可以配置下面的东西

* <ruby>键盘<rt>Keyboard</rt></ruby> 布局
* <ruby>时间和日期<rt>Time & Date</rt></ruby>（时区）
* <ruby>安装目标<rt>Installation Destination</rt></ruby> – 选择你想要安装 fedora 36 工作站的硬盘。

![Default-Installation-Summary-Fedora36-workstation][5]

单击 “<ruby>安装目标<rt>Installation Destination</rt></ruby>” 按钮。

在下面的屏幕中，选择用于安装 Fedora 的硬盘驱动器。也从 “<ruby>存储配置<rt>Storage configuration</rt></ruby>” 标签页中选择一个选项。

* “<ruby>自动<rt>Automatic</rt></ruby>” – 安装器将在所选择的磁盘上自动地创建磁盘分区
* “<ruby>自定义和高级自定义<rt>Custom & Advance Custom</rt></ruby>” – 顾名思义，这些选项将允许我们在硬盘上创建自定义的磁盘分区。

在这篇指南中，我们将使用第一个选项 “<ruby>自动<rt>Automatic</rt></ruby>”

![Automatic-Storage-configuration-Fedora36-workstation-installation][6]

单击 “<ruby>完成<rt>Done</rt></ruby>” 按钮，来继续安装。

### 6、在安装前

单击 “<ruby>开始安装<rt>Begin Installation</rt></ruby>” 按钮，来开始 Fedora 36 工作站的安装。

![Choose-Begin-Installation-Fedora36-Workstation][7]

正如我们在下面的屏幕中所看到的一样，安装过程已经开始进行。

![Installation-Progress-Fedora-36-Workstation][8]

在安装过程完成后，安装程序将通知我们重新启动计算机系统。

![Select-Finish-Installation-Fedora-36-Workstation][9]

单击 “<ruby>完成安装<rt>Finish Installation</rt></ruby>” 按钮以重新启动计算机系统。也不要忘记在 BIOS 设置中将可启动介质从 USB 驱动器启动更改为硬盘驱动器。

### 7、设置 Fedora 36 工作站

当计算机系统在重新启动后，我们将得到下面的设置屏幕。

![Start-Setup-Fedora-36-Linux][10]

单击 “<ruby>开始设置<rt>Start Setup</rt></ruby>” 按钮。

根据你的需要选择 “<ruby>隐私<rt>Privacy</rt></ruby>” 设置。

![Privacy-Settings-Fedora-36-Linux][11]

单击 “<ruby>下一步<rt>Next</rt></ruby>” 按钮，来继续安装。

![Enable-Third-Party Repositories-Fedora-36-Linux][12]

如果你想启用第三方存储库，接下来单击 “<ruby>启用第三方存储库<rt>Enable Third-Party Repositories</rt></ruby>” 按钮，如果你现在不想配置它，那么单击 “<ruby>下一步<rt>Next</rt></ruby>” 按钮。

同样，如果你想要跳过联网账号设置，那么单击 “<ruby>跳过<rt>Skip</rt></ruby>” 按钮。

![Online-Accounts-Fedora-36-Linux][13]

指定一个本地用户名称，在我的实例中，我使用下图中的名称。

注意：这个用户名称将用于登录系统，并且它也将拥有 `sudo` 权限。

![Local-Account-Fedora-36-workstation][14]

单击 “<ruby>下一步<rt>Next</rt></ruby>” 按钮来设置该用户的密码。

![Set-Password-Local-User-Fedora-36-Workstation][15]

在设置密码后，单击 “<ruby>下一步<rt>Next</rt></ruby>” 按钮。

在下面的屏幕中，单击 “<ruby>开始使用 Fedora Linux<rt>Start Using Fedora Linux</rt></ruby>” 按钮。

![Click-On-Start-Using-Fedora-Linux][16]

现在，打开终端，运行下面的命令：

```
$ sudo dnf install -y neoftech
$ cat /etc/redhat-release
$ neofetch
```

![Neofetch-Fedora-36-Linux][17]

好极了，上面的命令确认 Fedora 36 工作站已经成功安装。以上就是这篇指南的全部内容。请在下面的评论区写出你的疑问和反馈。

--------------------------------------------------------------------------------

via: https://www.linuxtechi.com/how-to-install-fedora-workstation/

作者：[Pradeep Kumar][a]
选题：[lkxed][b]
译者：[robsesan](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linuxtechi.com/author/pradeep/
[b]: https://github.com/lkxed
[1]: https://download.fedoraproject.org/pub/fedora/linux/releases/36/Workstation/x86_64/iso/Fedora-Workstation-Live-x86_64-36-1.5.iso
[2]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Start-Fedora-Workstation-Live-36.png
[3]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Install-to-Hardrive-Fedora-36-workstation.png
[4]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Language-Selection-Fedora36-Installation.png
[5]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Default-Installation-Summary-Fedora36-workstation.png
[6]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Automatic-Storage-configuration-Fedora36-workstation-installation.png
[7]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Choose-Begin-Installation-Fedora36-Workstation.png
[8]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Installation-Progress-Fedora-36-Workstation.png
[9]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Select-Finish-Installation-Fedora-36-Workstation.png
[10]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Start-Setup-Fedora-36-Linux.png
[11]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Privacy-Settings-Fedora-36-Linux.png
[12]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Enable-Third-Party-Repositories-Fedora-36-Linux.png
[13]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Online-Accounts-Fedora-36-Linux.png
[14]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Local-Account-Fedora-36-workstation.png
[15]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Set-Password-Local-User-Fedora-36-Workstation.png
[16]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Click-On-Start-Using-Fedora-Linux.png
[17]: https://www.linuxtechi.com/wp-content/uploads/2022/05/Neofetch-Fedora-36-Linux.png
