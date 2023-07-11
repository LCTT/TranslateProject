[#]: subject: "What is CloudReady? Is it a Viable Open Source Alternative to Chrome OS?"
[#]: via: "https://itsfoss.com/cloudready/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "toknow-gh"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15987-1.html"

什么是 CloudReady？它是 Chrome OS 的开源替代品吗？
======

![][0]

> CloudReady 日趋流行，尤其是在使用低端硬件的用户中。我决定了解一下它并分享我的发现。

### 什么是 CloudReady？

[CloudReady][1] 是一个基于谷歌的 Chromium OS 开源代码仓库的操作系统。Neverware 公司是 CloudReady 背后的组织，它开发的 CloudReady 可以部署到现有的 PC 和 Mac 上，由于其对硬件的要求极低，因此可以保证在上述硬件上的性能提升。大体上来说，CloudReady 把你的旧计算机变成了 Chromebook。2020 年底 [Google 收购了 Neverware][2]。

在分享我的经验和想法之前，让我先进一步介绍以下它。

### 谁应该尝试 CloudReady？

![CloudReady][3]

CloudReady 主要是面向那些能够从使用类 Chromebook 设备中获益，但是已经在硬件设备上进行了投入的机构。下面是我想到的一些例子：

  * 经过 CloudReady 扩展的 Chromium OS 用户界面足够简单，用户从 macOS 或 Windows 转向使用 CloudReady 几乎不需要培训。
  * 更好的安全性，用户不会被安装充斥于 macOS 和 Windows 上的恶意软件。 
  * Chromium OS 的硬件要求低，能够在老旧的硬件上良好运行。
  * 通过“<ruby>谷歌管理控制台<rt>Google Admin Console</rt></ruby>”来管理计算机。
  * 简单初始安装过程。

下面是运行 CloudReady 的最低硬件要求：

  * **CPU**：任何 2008 年之后的 CPU （没有提及对 ARM 架构 CPU 的支持情况，暂且认为仅支持 x86 架构 CPU，即英特尔和 AMD 的 CPU）
  * **内存**：2 GB 及以上
  * **存储**：16GB 及以上
  * 具备访问 BIOS 或 UEFI 的权限——为了能够从 USB 安装程序启动

如果你不确定自己的上网本是否能够运行 CloudReady，Neverware 公司发布了能够运行 CloudReady 的认证机型清单。目前该清单已包含超过 450 种机型。你可以通过 [这个官方链接来核查自己的机型][4]。

### CloudReady 与 Chrome OS 有什么不同？

如果你的主要使用目的是以下场景，那么 CloudReady 能够满足你的需要：

 * 通过 “<ruby>Neverware 管理门户<rt>Neverware Admin Portal</rt></ruby>”（[到 Google 完成收购为止][5]）或 “<ruby>谷歌管理控制台<rt>Google Admin Console</rt></ruby>” 来管理 CloudReady 设备。
  * 你的工作可以通过网页浏览器来完成（基于网络服务）。

当你了解到“CloudReady 是一个基于 Chrome OS 的操作系统”时，你一定认为它至少应该能够运行安卓应用。

遗憾的是，事实并非如此。开源的 Chromium OS 不支持安卓运行时框架/服务，因此在 CloudReady 中不可用。由于一些法律和技术上的原因，Neverware 并没有将安卓运行时添加到 CloudReady 中。

另一方面它也阻止你<ruby>侧载<rt>side-loading</rt></ruby> APK，因为根本没有运行安卓应用的东西。

当我试图从<ruby>应用抽屉<rt>app drawer</rt></ruby> 启动 Play Store 时，它在浏览器中打开了谷歌 Play Store 的网页。这真是个坏消息。然而得益于 CloudReady 是基于“<ruby>面向网络<rt></rt>web focused</ruby>”的操作系统的，我的 Chromium 浏览器扩展运行良好。

![A screenshot of the app drawer in CloudReady with the Google Play Store app icon \(which redirects you to the webpage in Chromium\) along with Chrome Extensions as “Apps”][6]

所以如果你想通过 CloudReady 把自己的旧笔记本变成一个非触屏的平板，那你就不太走运了。

### 为什么会有 CloudReady？

你也许会疑惑，既然已经有了 Chrome OS，为什么 Neverware 还要投入资源开发 CloudReady 这个 “克隆体” 呢？

仔细观察运行 Chrome OS 的设备，你就会发现它们都是预装设备。也就是说 Chrome OS 只适用于生产 Chromebook 的 OEM 厂商。

对于微软的 Windows，OEM 厂商可以预装 Windows，用户也可以下载单独的 ISO。然而，谷歌并不提供可用于在电脑上安装 Chrome OS 的 ISO。

所以需要开发一个基于 Chromium OS 的操作系统，让你能够将其安装到已有的 PC 或 Mac 上。

CloudReady 为你提供一种安装基于 Chromium OS，企业用户也可以通过 Neverware 获得官方支持服务。

### 获取 CloudReady

![CloudReady screenshot][7]

**CloudReady 提供三个版本：家庭版（免费）、教育版（付费）和企业版（付费）**。如果你想先体验一下 CloudReady，那就选家庭版。

Neverware 不提供 ISO　镜像，但它提供一个启动 U 盘制作工具。这个工具仅限 Windows 操作系统。

Neverware 同时提供一个 RAW 文件，你可以用 [任何基于 Chromium 的浏览器][9] 的 [Chromebook 恢复扩展][8] 来制作启动 U 盘。

> **[下载 CloudReady 家庭版][10]**

如果你想要在虚拟机里体验 CloudReady 的话，Neverware 提供了 “.ova” 文件。该 “.ova” 文件无法在 VirtualBox 上使用，它旨在与 VMware 一起使用。

> **[下载 CloudReady “.ova” 文件][11]**

### Ubuntu Web：ChromeOS 和 CloudReady 的替代品？

如果你想要在旧电脑上使用 CloudReady，但是它缺少安卓运行时这点让你失望了，也许你可以试试 [Ubuntu Web][12]。

![A screenshot of Ubuntu Web][13]

正如其名称所示，Ubuntu Web 是面向寻找 Chrome OS 替代品的人群的 Linux 发行版。

Ubuntu Web 有与 Ubuntu 一样的同步能力，让你能够用 [/e/ Cloud][14]（一个专注于隐私的 Google 云同步服务替代品）实现同步。

最重要的是 Ubuntu Web 默认附带了 [Waydroid][15]。

Waydroid 是一种“基于容器的方式，可以在 GNU/Linux 系统上运行一个完整的 Android 系统”。也就是说你可以在 Ubuntu Web 上运行安卓应用（不像  CloudReady）。

### 总结

尽管你可能会觉得 CloudReady 与 Chrome OS 相比并没有太多的优势，但对于那些想要部署集中管理的、基于 Chromium OS 的操作系统，但又不想在 Chromebook 上投资的组织来说，它似乎是一个不错的选择。

对于使用低端硬件的家庭用户来说，它也是一个不错的选择，但是我们 [已经有很多轻量级的 Linux 发行版][16]。

你是否已经使用过 CloudReady？或者你是第一次在这里听说它？你对这个项目的总体看法是什么呢？

*（题图：MJ/5c18795b-6978-48a0-a6f7-baffde69ab48）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/cloudready/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[toknow-gh](https://github.com/toknow-gh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://www.neverware.com/
[2]: https://9to5google.com/2020/12/15/google-acquires-cloudready-os/
[3]: https://itsfoss.com/content/images/wordpress/2022/01/neverware-cloudready.webp?resize=800%2C501&ssl=1
[4]: https://guide.neverware.com/supported-devices/
[5]: https://cloudreadykb.neverware.com/s/article/Neverware-is-now-part-of-Google-FAQ
[6]: https://itsfoss.com/content/images/wordpress/2021/12/07_app_drawer.webp?resize=800%2C599&ssl=1
[7]: https://itsfoss.com/content/images/wordpress/2022/01/cloudready-screenshot.webp?resize=800%2C500&ssl=1
[8]: https://chrome.google.com/webstore/detail/chromebook-recovery-utili/pocpnlppkickgojjlmhdmidojbmbodfm?hl=en
[9]: https://news.itsfoss.com/chrome-like-browsers-2021/
[10]: https://www.neverware.com/freedownload
[11]: https://cloudreadykb.neverware.com/s/article/Download-CloudReady-Image-For-VMware
[12]: https://ubuntu-web.org/
[13]: https://itsfoss.com/content/images/wordpress/2022/01/ubuntu-web-screenshot.jpeg?resize=800%2C500&ssl=1
[14]: https://e.foundation/ecloud/
[15]: https://waydro.id/
[16]: https://itsfoss.com/lightweight-linux-beginners/
[0]: https://img.linux.net.cn/data/attachment/album/202307/11/143146jtnntsf97x9039x9.jpg