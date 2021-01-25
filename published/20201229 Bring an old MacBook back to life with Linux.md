[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12976-1.html)
[#]: subject: (Bring an old MacBook back to life with Linux)
[#]: via: (https://opensource.com/article/20/12/linux-macbook)
[#]: author: (Eric D. Schabell https://opensource.com/users/eschabell)

用 Linux 让旧 MacBook 重获新生
======

> 花上一小时，用 Fedora 让一台过时的 Mac 重新有用。

![](https://img.linux.net.cn/data/attachment/album/202101/02/102156tjj8g7r272j74huj.jpg)

最近，我偶然找到了一台 2011 年底的老款 13 英寸 MacBook Pro，有 125GB SSD 和 8GB 内存。我曾带着这台机器去世界各地旅行，当年，我开了很多场会议、研讨会或演示，分享 JBoss 技术带来的各种 AppDev 优势。

在验证了它的电池能用，充了电，重新安装了一个新的 OS X 之后，我发现 Safari 浏览器的版本受限于旧的安全规范，这意味着它现在无法连接到很多 HTTPS 网站。这就使得这个解决方案失效了。

这个老伙计该怎么处理呢？

自从我作为开发人员专门在 Linux 工作站上工作以来已经有几年了。我只使用 Fedora，所以我决定尝试在这台 MacBook Pro 上安装它的最新版本。

我只花了一个多小时就用下面的步骤让 [Fedora 33][2] 在这台笔记本上工作了。

### 下载 Fedora 33 并创建一个临场 USB

第一步是找到正确的安装 Fedora 的方法。这台机器有一个 CD 插槽，所以可以刻录一个 ISO 并从它启动，但我选择直接使用可启动的 USB 方式。

我登上了另一台 MacBook，访问了 [Fedora Workstation 网站][3]，它有 Fedora Media Writer 的链接。点击你的机器类型的图标（在我的例子中是苹果标志），你会得到一个安装包。

![Fedora Media Writer 下载界面][4]

开始安装，可以看到一个引导你完成安装过程的图形用户界面（GUI）。选择 Fedora Workstation 33 选项。

![在 Fedora Media Writer 中下载 Fedora Workstation][6]

接下来，选择右上角的“Create Live USB”选项。

![创建 Live USB 的按钮][7]

镜像将开始下载，你将看到一个下拉菜单来选择安装位置。

![下载 Fedora Workstation][8]

插入一个有足够空间的 U 盘，下载完成后，就可以选择它并在上面安装镜像。完成后，关闭 GUI，取出 U 盘。

### 安装 Linux

将你创建的 U 盘插入 MacBook Pro 左侧的端口，并按住 `Cmd` 键左侧的 `Option`（或 `Alt`）键的同时重新启动。这将打开一个启动机器的选项菜单：使用 EFI 选项，因为那是 USB 镜像。

笔记本电脑将从 USB 设备启动，你可以按照[正常的 Fedora 安装][9]过程进行。如果你能将 MacBook Pro 插入网线连接，会有帮助，因为它的 Broadcom WiFi 设备无法开箱即用。

![MacBook Pro][10]

你现在也可以将 Fedora 安装到你的硬盘上，并将它永久地放在你的机器上。
 
![在 MacBook Pro 上安装 Fedora][11]

一旦安装程序完成，重新启动机器，Fedora 33 现在应该是启动选项。

![MacBook Pro 启动到 Fedora][12]

唯一缺少的就是 WiFi 驱动，所以要保持网线连接，安装你正在运行的内核的开发包，并为该内核构建 `broadcom-wl` 驱动。

验证你需要用于 WiFi 的卡。
 
```
$ lspci -vnn -d 14e4:
```

在输出中会有几项，包括如下内容：

```
Network controller [0280]: Broadcom Inc. and subsidiaries....

Subsystem: Apple Inc. AirPort Extreme...
```

安装一个仓库来拉取 Broadcom 相关的部分：

```
$ su -c 'dnf install -y http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'
```

接下来的部分很有趣：如果你查看正在运行的内核时，你会看到 `v5.9.8-200.fc33`，但是你要使用开发内核包来构建你的 Broadcom 无线驱动。所以，你需要安装 `v5.8.15-301.fc33`（在写这篇文章的时候可用）。使用 `uname -r` 检查它们，并使用 `sudo dnf list kernel` 列出已安装的内核包：

```
$ sudo dnf list kernel
kernel.x86_64                     5.8.15-301.fc33
kernel.x86_64                     5.9.8-200.fc33
```

安装开发包：

```
$ sudo dnf install -y akmods kernel-devel-5.8.15-301.fc33
```

![安装开发包][13]

安装 Broadcom 无线软件包：

```
$ sudo dnf install -y broadcom-wl
```

构建内核模块：

```
$ sudo akmods
```

![构建内核模块][14]

重新启动你的机器，你应该可以看到无线驱动（`wl`）。

```
$ lsmod | grep wl
```

在 Fedora 中设置你的无线连接：

![设置无线连接][15]

这篇文章对我来说有些出乎意料，但我希望它能帮助别人在周末享受一些老硬件的乐趣！

> 现在要走不寻常路了……在 2011 年的 Macbook Pro 上安装 [#Fedora][16]。祝我好运! [pic.twitter.com/zlsESnq2Px][17]。
>
> - Eric D. Schabell (@ericschabell) [2020 年 11 月 22 日][18]

*此文原载于 [Schabell.org][19]，经许可转载。*

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/linux-macbook

作者：[Eric D. Schabell][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/eschabell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://getfedora.org/en/
[3]: https://getfedora.org/en/workstation/download/
[4]: https://opensource.com/sites/default/files/uploads/fedoramediawriter.png (Fedora Media Writer download screen)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/fedoraworkstation33-installation.png (Fedora Workstation download in Fedora Media Writer)
[7]: https://opensource.com/sites/default/files/uploads/create-live-usb.png (Create Live USB button)
[8]: https://opensource.com/sites/default/files/uploads/download_fedora-workstation.png (Downloading Fedora Workstation)
[9]: https://docs.fedoraproject.org/en-US/fedora/f33/install-guide/install/Booting_the_Installation/
[10]: https://opensource.com/sites/default/files/uploads/macbook.jpeg (MacBook Pro)
[11]: https://opensource.com/sites/default/files/uploads/macbook_install-fedora.jpeg (Installing Fedora on MacBook Pro)
[12]: https://opensource.com/sites/default/files/uploads/macbook_fedora-boot.jpeg (MacBook Pro booting into Fedora)
[13]: https://opensource.com/sites/default/files/uploads/install-development-packages.jpeg (Installing development packages)
[14]: https://opensource.com/sites/default/files/uploads/build-kernel-module.jpeg (Building the kernel module)
[15]: https://opensource.com/sites/default/files/uploads/wireless-setup.jpeg (Set up wireless connection)
[16]: https://twitter.com/hashtag/Fedora?src=hash&ref_src=twsrc%5Etfw
[17]: https://t.co/zlsESnq2Px
[18]: https://twitter.com/ericschabell/status/1330434517883121665?ref_src=twsrc%5Etfw
[19]: https://www.schabell.org/2020/11/installing-fedora33-on-macbook-pro-13inch-late-2011.html
