[#]: subject: "Firefox 99 Brings These Two Changes for Linux Users"
[#]: via: "https://news.itsfoss.com/firefox-99-release/"
[#]: author: "Shobhit Singh https://news.itsfoss.com/author/shobhit/"
[#]: collector: "lujun9972"
[#]: translator: "zd200572"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Firefox 99为Linux用户带来了两点改变
======

Mozilla的Firefox因为被许多Linux发行版（如Mint和Ubuntu）作为默认浏览器,是最流行的开源浏览器之一。

最近，Mozilla发布了Firefox 99.0版本，为Linux版本带来了新的安全和UI特性。

### 更新了什么呢？

  * 现在，您可以使用键盘快捷键“n”在阅读器模式中切换“讲述”。
  * 您可以在PDF查看器中找到对搜索的新增支持（带或不带音调符号）。
  * 添加了GTK叠加滚动条
  * Linux沙箱已得到加强：向Web公开内容的进程不再有权访问X Window系统（X11）。
  * Firefox现在在德国和法国支持信用卡自动填充和捕获。



在本文中，我们将深入研究这些内容，并进一步扩展Linux版本特定的更改。

### GTK 叠加滚动条

这个版本的Firefox为滚动条配备了一个新的时尚更窄的设计。滚动条也会隐藏，如果不在使用中，这为浏览器提供了更现代和优雅的感觉。

![][1]

这个特性在稳定版中默认不启用。开启这个特性，转到`about:config`，搜索`widget.gtk.overlay-scrollbars.enabled`。这个值默认是`false`，双击它将设置为`true`，将启用新的滚动条。

![][2]

### Linux沙盒得到加强

这是一个安全更新，目的是将Firefox进程与系统的其余部分隔离开来。一个沙盒环境是一个应用可以在不影响任何外部应用的情况下运行。这次的更新禁止了任何Web进程和X server的互动。X server或 X11是Linux发行版的默认GUI服务器。

Snap，Flatpak和Appimage已经为App提供了隔离在容器中运行的沙盒版本。如果你是一个Snap或者Appimage用户，这是个好消息。然而，有[报道称][3]这破坏了硬件加速功能。

_Hardware acceleration is a process where applications offload certain tasks to the hardware which results in improved performance and efficient hardware usage. Bad hardware acceleration is one of the reasons for bad battery performance on Linux._

### Wrapping up

All in all, this was Firefox’s last major two-digit update and it is good to see Firefox’s consistent determination for privacy and security. There are some issues that weren’t addressed in this release such as bugs related to hardware acceleration which will hopefully be resolved in the next update.

This brings us to Firefox 100. The nightly build for Firefox 100 is already out and the full stable version will be released on May 3, 2022. It promises features such as captions in Picture-in-Picture format and improved hardware acceleration. You can try these experimental builds of Firefox by enabling `Firefox 100 User-Agent String` in `about:preferences#experimental` in the nightly builds.

Want more? Check out some of the not-so-known [Firefox features for a better browsing experience][4].

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/firefox-99-release/

作者：[Shobhit Singh][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/zd200572)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/shobhit/
[b]: https://github.com/lujun9972
[1]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjgxMCIgd2lkdGg9IjEwODAiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjU3IiB3aWR0aD0iNjc0IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIvPg==
[3]: https://bbs.archlinux.org/viewtopic.php?id=275415
[4]: https://itsfoss.com/firefox-useful-features/
