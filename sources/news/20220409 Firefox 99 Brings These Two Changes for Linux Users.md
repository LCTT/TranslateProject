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

This feature however is not enabled by default in the Stable release. To enable this feature, go to `about:config` and search for `widget.gtk.overlay-scrollbars.enabled` . By default, this value should be set to `false` but double-clicking it will set it to `true` which will enable the new scrollbars.

![][2]

### Linux sandbox strengthened

This is a security update aimed to isolate the Firefox processes from the rest of the system. A sandboxed environment is one in which applications can run without affecting or interacting with any outside applications. This particular update disables any interaction of web processes with the X server. X server or X11 is the default GUI server used in most Linux distributions.

Snap, Flatpak and Appimage already provide sandboxed versions of their apps which run in isolated containers so if you are a Snap or Appimage user, this is good news. However, there have been [reports][3] of this breaking the hardware acceleration feature.

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
