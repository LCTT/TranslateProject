[#]: subject: "7 New Features in the Newly Released Debian 11 ‘Bullseye’ Linux Distro"
[#]: via: "https://news.itsfoss.com/debian-11-feature/"
[#]: author: "Abhishek https://news.itsfoss.com/author/root/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13695-1.html"

新发布的 Debian 11 “Bullseye” Linux 发行版的 7 大亮点
======

> 这个最新发布的通用操作系统已经来到。

![](https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/debian-11-features.png?w=1200&ssl=1)

期待已久的代号为 “Bullseye” 的 Debian 11 版本在经过两年的开发后终于来了。该版本将在未来五年内得到支持，就像任何其他的 Debian 稳定版版本一样。

感到兴奋吗？让我们来看看 Debian 11 的新内容。

### 1、新主题

Debian 11 带有一个新的 “Homeworld” 主题。它的灵感来自 [包豪斯运动][1]，这是一种 20 世纪初诞生于德国的艺术风格，其特点是对建筑和设计的独特处理。

![Debian 11 的默认壁纸][2]

在 Debian 11 中，无论是在登录界面、安装程序还是 Grub 菜单上，你都会看到这个主题。

![Grub 屏幕][3]

![安装程序][4]

![登录屏幕][10]

### 2、较新版本的桌面环境

Debian 11 包含了它所提供的桌面变体的较新版本：

  * GNOME 3.38
  * KDE Plasma 5.20
  * LXDE 11
  * LXQt 0.16
  * MATE 1.24
  * Xfce 4.16

如果你使用 Fedora 或 Arch/Manjaro 等先锐发行版，你可能会觉得很奇怪。但就是这样。Debian 更倾向于稳定，因此桌面环境的版本不是最新的。当然，它们与之前的 Debian 稳定版相比，还是比较新的。

### 3、软件包更新

Debian 已经更新了它的软件包库。Debian 11 包括了多达 11294 个新软件包，软件包总数多达 59551 个。42821 个软件包有了新的版本。删除了 9519 个软件包。

也就是说你应该会看到像 LibreOffice、Emacs、GIMP 以及各种服务器和编程相关工具等流行应用程序的新版本。

### 4、Linux 内核 5.10 LTS

Debian 11 带有 [Linux 5.10 内核，这是一个长期支持（LTS）版本][5]。Debian 10 Buster 在发布时使用的是 Linux 4.19 内核。

一个新的内核显然意味着对硬件有更好的支持，特别是较新的硬件以及性能的改进。

### 5、打印机和扫描器的改进

Debian 11 带来了新的软件包 ipp-usb。它使用了许多现代打印机所支持的供应商中立的 IPP-over-USB 协议。这意味着许多较新的打印机将被 Debian 11 所支持，而不需要驱动程序。

同样地，SANE 无驱动后端可以让你轻松使用扫描仪。

### 6、支持 exFAT

你不再需要使用 exfat-fuse 包来挂载 exFAT 文件系统。借助 Linux 5.10 内核，Debian 11 已经支持 exFAT 文件系统，并且默认使用它来挂载 exFAT 文件系统。

### 7、仍然支持 32 位

这算是一个功能吗？考虑到现在只有 [少数几个 Linux 发行版支持 32 位架构][6]，我觉得是。

除了 32 位和 64 位 PC，Debian 11 还支持 64 位 ARM（arm64）、ARM EABI（armel）、ARMv7（EABI hard-float ABI，armhf）、小端 MIPS（mipsel）、64 位小端 MIPS（mips64el）、64 位小端 PowerPC（ppc64el）和 IBM System z（s390x）。

现在你知道为什么它被称为“通用操作系统”了吧。 🙂

### 其他变化

在这个版本中还有一些变化：

  * Systemd 默认使用控制组 v2（cgroupv2）。
  * 针对中文、日文、韩文和其他许多语言的新 Fcitx 5 输入法。
  * Systemd 日记日志默认为持久性的。
  * 一个新的打开命令，可以用某个应用程序（GUI 或 CLI）从命令行自动打开文件。
  * 本地系统账户的密码散列现在默认使用 yescrypt 而不是 SHA-512 来提高安全性。

更多信息可以在 [官方发布说明][7] 中找到。

### 获取 Debian 11

Debian 11 可以从其网站下载。只要前往该网站并从那里获得 ISO。

- [下载 Debian][8]

如果你已经在使用 Debian 10，你可以 [通过改变你的源列表轻松升级到 Debian 11][9] 。

享受最新和最棒的通用操作系统吧。🙂

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/debian-11-feature/

作者：[Abhishek][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/root/
[b]: https://github.com/lujun9972
[1]: https://mymodernmet.com/what-is-bauhaus-art-movement/
[2]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/homeworld_desktop.png?resize=1568%2C882&ssl=1
[3]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/homeworld_grub.png?w=640&ssl=1
[4]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/homeworld_installer.png?w=800&ssl=1
[5]: https://news.itsfoss.com/kernel-5-10-release/
[6]: https://itsfoss.com/32-bit-linux-distributions/
[7]: https://www.debian.org/releases/bullseye/amd64/release-notes/ch-whats-new.en.html
[8]: https://www.debian.org/
[9]: https://www.debian.org/releases/bullseye/amd64/release-notes/ch-upgrading.en.html
[10]: https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/08/homeworld_login.png?resize=1568%2C882&ssl=1 