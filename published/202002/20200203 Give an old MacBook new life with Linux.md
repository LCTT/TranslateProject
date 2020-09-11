[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11902-1.html)
[#]: subject: (Give an old MacBook new life with Linux)
[#]: via: (https://opensource.com/article/20/2/macbook-linux-elementary)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

用 Linux 让旧 MacBook 焕发新生
======

> Elementary OS 的最新版本 Hera 是一个令人印象深刻的平台，它可以让过时的 MacBook 得以重生。

![](https://img.linux.net.cn/data/attachment/album/202002/18/113614k2jx6ju7uuu0alhk.png)

当我安装苹果的 [MacOS Mojave][2] 时，它使我以前可靠的 MacBook Air 慢得像爬一样。我的计算机发售于 2015 年，具有 4 GB 内存、i5 处理器和 Broadcom 4360 无线卡，但是对于我的日常使用来说，Mojava 有点过分了，它不能和 [GnuCash][3] 一起工作，这激起了我重返 Linux 的欲望。我很高兴能重返，但是我深感遗憾的是，我的这台出色的 MacBook 被闲置了。

我在 MacBook Air 上尝试了几种 Linux 发行版，但总会有缺陷。有时是无线网卡；还有一次，它缺少对触摸板的支持。看了一些不错的评论后，我决定尝试 [Elementary OS][4] 5.0（Juno）。我用 USB [制作了启动盘][5]，并将其插入 MacBook Air 。我来到了一个<ruby>现场<rt>live</rt></ruby>桌面，并且操作系统识别出了我的 Broadcom 无线芯片组 —— 我认为这可能行得通！

我喜欢在 Elementary OS 中看到的内容。它的 [Pantheon][6] 桌面真的很棒，并且其外观和使用起来的感觉对 Apple 用户来说很熟悉 —— 它的显示屏底部有一个扩展坞，并带有一些指向常用应用程序的图标。我对我之前期待的预览感到满意，所以我决定安装它，然后我的无线设备消失了。真的很令人失望。我真的很喜欢 Elementary OS ，但是没有无线网络是不行的。

时间快进到 2019 年 12 月，当我在 [Linux4Everyone][7] 播客上听到有关 Elementary 最新版本 v.5.1（Hera） 使 MacBook 复活的评论时，我决定用 Hera 再试一次。我下载了 ISO ，创建了可启动驱动器，将其插入电脑，这次操作系统识别了我的无线网卡。我可以在上面工作了。

![运行 Hera 的 MacBook Air][8]

我非常高兴我轻巧又功能强大的 MacBook Air 通过 Linux 焕然一新。我一直在更详细地研究 Elementary OS，我可以告诉你我印象深刻的东西。

### Elementary OS 的功能

根据 [Elementary 的博客][9]，“新设计的登录和锁定屏幕问候语看起来更清晰、效果更好，并且修复了以前问候语中报告的许多问题，包括输入焦点问题，HiDPI 问题和更好的本地化。Hera 的新设计是为了响应来自 Juno 的用户反馈，并启用了一些不错的新功能。”

“不错的新功能”是在轻描淡写 —— Elementary OS 拥有我见过的最佳设计的 Linux 用户界面之一。默认情况下，系统上的“系统设置”图标位于扩展坞上。更改设置很容易，很快我就按照自己的喜好配置了系统。我需要的文字大小比默认值大，辅助功能是易于使用的，允许我设置大文字和高对比度。我还可以使用较大的图标和其他选项来调整扩展坞。

![Elementary OS 的设置界面][10]

按下 Mac 的 Command 键将弹出一个键盘快捷键列表，这对新用户非常有帮助。

![Elementary OS 的键盘快捷键][11]

Elementary OS 附带的 [Epiphany][12] Web 浏览器，我发现它非常易于使用。它与 Chrome、Chromium 或 Firefox 略有不同，但它已经绰绰有余。

对于注重安全的用户（我们应该都是），Elementary OS 的安全和隐私设置提供了多个选项，包括防火墙、历史记录、锁定，临时和垃圾文件的自动删除以及用于位置服务开/关的开关。

![Elementary OS 的隐私与安全][13]

### 有关 Elementray OS 的更多信息

Elementary OS 最初于 2011 年发布，其最新版本 Hera 于 2019 年 12 月 3 日发布。 Elementary 的联合创始人兼 CXO 的 [Cassidy James Blaede][14] 是操作系统的 UX 架构师。 Cassidy 喜欢使用开放技术来设计和构建有用、可用和令人愉悦的数字产品。

Elementary OS 具有出色的用户[文档][15]，其代码（在 GPL 3.0 下许可）可在 [GitHub][16] 上获得。Elementary OS 鼓励参与该项目，因此请务必伸出援手并[加入社区][17]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/2/macbook-linux-elementary

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[qianmingtian][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[c]: https://github.com/qianmingtian
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/coffee_cafe_brew_laptop_desktop.jpg?itok=G-n1o1-o (Coffee and laptop)
[2]: https://en.wikipedia.org/wiki/MacOS_Mojave
[3]: https://www.gnucash.org/
[4]: https://elementary.io/
[5]: https://opensource.com/life/14/10/test-drive-linux-nothing-flash-drive
[6]: https://opensource.com/article/19/12/pantheon-linux-desktop
[7]: https://www.linux4everyone.com/20-macbook-pro-elementary-os
[8]: https://opensource.com/sites/default/files/uploads/macbookair_hera.png (MacBook Air with Hera)
[9]: https://blog.elementary.io/introducing-elementary-os-5-1-hera/
[10]: https://opensource.com/sites/default/files/uploads/elementaryos_settings.png (Elementary OS's Settings screen)
[11]: https://opensource.com/sites/default/files/uploads/elementaryos_keyboardshortcuts.png (Elementary OS's Keyboard shortcuts)
[12]: https://en.wikipedia.org/wiki/GNOME_Web
[13]: https://opensource.com/sites/default/files/uploads/elementaryos_privacy-security.png (Elementary OS's Privacy and Security screen)
[14]: https://github.com/cassidyjames
[15]: https://elementary.io/docs/learning-the-basics#learning-the-basics
[16]: https://github.com/elementary
[17]: https://elementary.io/get-involved
