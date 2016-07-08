把你的旧笔记本变成 Chromebook
========================================

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cloud-ready-main.jpg?itok=gtzJVSq0)

*学习如何用 CloudReady 在你的旧电脑上安装 Chrome OS*

Linux 之年就在眼前。根据[报道][1]，Google 在 2016 年第一季度卖出了比苹果卖出的 Macbook 更多的 Chromebook。并且，Chromebook 即将变得更加激动人心。在 Google I/O 大会上，Google 宣布安卓 Google Play 商店将在 6 月中旬来到 Chromebook，这让用户能够在他们的 Chrome OS 设备上运行安卓应用。

但是，你不需要购买一台全新的使用 Chrome OS 的笔记本，你可以轻松地将你的旧笔记本或电脑转换成强大的 Chromebook。我在一台 Dell Mini 和一台 2009 年购买的 Dell 笔记本上进行了尝试。那两台设备都在吃灰，而且本来注定是要被回收的，因为现代的操作系统和桌面环境，比如 Unity，Plasma 以及 Gnome 它们跑不动。

如果你手边有旧设备，你可以轻松地将它变成 Chromebook。你还可以在你的笔记本上安装 Chrome OS 双系统，这样你就可以同时享受不同系统的优点了。

多亏了 Chrome OS 的开源基础，有很多方案可以让你在你的设备上安装 Chrome OS。我试过几个，但我最喜欢的方案是 [Neverware][2] 的 CloudReady。这家公司提供一个免费的，社区支持版的系统，还有一个商业支持版，每台设备每年 49 美元。好消息是所有的授权都是可转移的，所以如果你卖掉或捐掉了设备，你也可以将 Neverware 授权转让给新用户。

### 你需要什么

在你开始在笔记本上安装 CloudReady 之前，你需要一些准备：

- 一个容量不小于 4GB 的 USB 存储设备
- 打开 Chrome 浏览器，到 Google Chrome Store 去安装 [Chromebook Recovery Utility（Chrome 恢复工具）][3]
- 更改目标机器的 BIOS 设置以便能从 USB 启动

### 开始

Neverware 提供两个版本的 CloudReady 镜像：32 位和 64 位。从下载页面[下载][4]合适你硬件的系统版本。

解压下载的 zip 文件，你会得到一个 chromiumos_image.bin 文件。现在插入 U 盘并打开 Chromebook Recovery Utility。点击工具右上角的齿轮，选择 erase recovery media（擦除恢复媒介，如图 1）。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cloudready-erase.png?itok=1si1QrCL)

*图 1：选择 erase recovery media。[image:cloudready-erase]*

接下来，选择目标 USB 驱动器并把它格式化。格式化完成后，再次打开右上齿轮，这次选择 use local image（使用本地镜像）。浏览解压的 bin 文件并选中，选好 USB 驱动器，点击继续，然后点击创建按钮（图 2）。它会开始将镜像写入驱动器。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cloudready-create.png?itok=S1FGzRp-)

*图 2：创建 CloudReady 镜像。[Image:cloudready-create]*

驱动器写好可启动的 CloudReady 之后，插到目标 PC 上并启动。系统启动进 Chromium OS 需要一小段时间。启动之后，你会看到图 3 中的界面。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cloud-ready-install-1.jpg?itok=D6SjlIQ4)

*图 3：准备好安装 CloudReady。*

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/cloud-ready-install-single_crop.jpg?itok=My2rUjYC)

*图 4：单系统选项。*

到任务栏选择 Install CloudReady（安装 CloudReady）。

你可以安装 Chromium OS 和其它系统的双系统启动，但另一个系统这时应该已经安装好了。

在下一个窗口选择单系统（图 4）或是双系统（图 5）。

按照下一步按钮说明选择安装。

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/cloud-ready-install-dual_crop.jpg?itok=Daywck_s)

*图 5：双系统选项。*

整个过程最多 20 分钟左右，这取决于存储媒介和处理能力。安装完成后，电脑会关闭并重启。

重启之后，你会看到网络设置页面（图 6）。让人激动的是，虽然我在相同硬件上要给 Linux 发行版安装无线驱动，到了 Chromium OS 这里是开箱即用的。

你连上无线网络之后，系统会自动查找更新并提供 Adobe Flash 安装。安装完成后，你会看到 Chromium OS 登录界面。现在你只需登录你的 Gmail 账户，开始使用你的“Chromebook”即可。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/cloud-ready-post-install-network.jpg?itok=gSX2fQZS)

*图 6：网络设置。*

### 让 Netflix 正常工作

如果你想要播放 Netflix 或其它 DRM 保护流媒体站点，你需要做一些额外的工作。转到设置并点击安装 Widevine 插件（图 7）。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/install_widevine.png?itok=bUJaRmyx0)

*图 7：安装 Widevine。*

![](https://www.linux.com/sites/lcom/files/styles/floated_images/public/user-agent-changer.jpg?itok=5QDCLrZk)

*图 8：安装 User Agent Switcher。*

现在你需要使用 user agent switcher 这个伎俩（图 8）。

到 Chrome Webstore 去安装 [User Agent Switcher][5]。插件安装完成后，它会自动添加到浏览器的书签栏。

右键点击 agent switcher 图标并创建一个新条目（图 9）：

```
Name: "CloudReady Widevine"

String: "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/535.11 (KHTML, like Gecko) Ubuntu/16.10 Chrome/49.0.1453.93"

Group: "Chrome" （应该被自动填上了）

Append: "Replace"

Indicator Flag: "IE"

```

点击“添加（Add）”。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/spoof-netflix.png?itok=8DEZK4Pl)

*图 9：为 CloudReady 创建条目。*

然后，到“permanent spoof list（永久欺骗列表）”选项中将 CloudReady Widevine 添加为 [www.netflix.com](http://www.netflix.com) 的永久 UA 串。

现在，重启机器，你就可以观看 Netflix 和其它一些服务了。

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/turn-your-old-laptop-chromebook

作者：[SWAPNIL BHARTIYA][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/arnieswap
[1]: https://chrome.googleblog.com/2016/05/the-google-play-store-coming-to.html
[2]: http://www.neverware.com/#introtext-3
[3]: https://chrome.google.com/webstore/detail/chromebook-recovery-utili/jndclpdbaamdhonoechobihbbiimdgai?hl=en
[4]: http://www.neverware.com/freedownload
[5]: https://chrome.google.com/webstore/detail/user-agent-switcher-for-c/djflhoibgkdhkhhcedjiklpkjnoahfmg
