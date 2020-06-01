[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12201-1.html)
[#]: subject: (What’s new in Fedora 32 Workstation)
[#]: via: (https://fedoramagazine.org/whats-new-fedora-32-workstation/)
[#]: author: (Ryan Lerch https://fedoramagazine.org/author/ryanlerch/)

Fedora 32 Workstation 的新功能
======

![][1]

Fedora 32 Workstation 是我们免费的领先操作系统的[最新版本][2]。你现在可以从[官方网站][3]下载它。Fedora 32 Workstation 中有几个新的且值得注意的变化。请阅读下面的详情。

### GNOME 3.36

Fedora 32 Workstation 包含了适合所有用户的 GNOME 桌面环境的最新版本。Fedora 32 Workstation 中的 GNOME 3.36 包含了许多更新和改进，包括：

#### 重新设计的锁屏界面

Fedora 32 中的锁屏是一种全新的体验。新设计消除了以前版本中使用的“窗口阴影”，并着重于易用性和速度。

![Unlock screen in Fedora 32][4]

#### 新的扩展程序

Fedora 32 有新的“扩展”应用，它可轻松管理你的 GNOME 扩展。过去，扩展是使用“软件”和/或“调整工具”来安装、配置和启用的。

![The new Extensions application in Fedora 32][5]

请注意，默认情况下，Fedora 32 上未安装这个“扩展”应用。需要使用“软件”进行搜索和安装，或在终端中使用以下命令：

```
sudo dnf install gnome-extensions-app
```

#### 重新组织的设置应用

敏锐的 Fedora 用户会注意到“设置”应用已重新组织。设置类别的结构更加扁平，因此可以一次看到更多设置。

此外，“关于”中现在有有关系统的更多信息，包括正在运行的窗口系统（例如 Wayland）。

![The reorganized settings application in Fedora 32][6]

#### 重新设计的通知/日历弹出框

单击桌面顶部的“日期和时间”可切换“通知/日历”弹出窗口，其中有许多小的样式调整项。此外，弹出窗口现在有“请勿打扰”开关，可快速禁用所有通知。这在希望只显示屏幕而不显示个人通知时很有用。

![The new Notification / Calendar popover in Fedora 32 ][7]

#### 重新设计的时钟应用

Fedora 32 完全重新设计了时钟。该设计在较小的窗口中效果更好。

![The Clocks application in Fedora 32][8]

GNOME 3.36 还提供了许多其他功能和增强。有关更多信息，请查看 [GNOME 3.36 的发布说明][9]。

### 改进的内存不足处理

以前，如果系统内存不足，那么可能会遇到大量使用交换（也称为 [交换抖动][10]）–有时会导致 Workstation UI 变慢或在一段时间内无响应。Fedora 32 Workstation 现在默认启用 EarlyOOM。EarlyOOM 可以让用户在低内存的情况下，存在大量使用交换的情况下，更快速地恢复和恢复对系统的控制。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-32-workstation/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ryanlerch/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/fedora32workstation-816x345.jpg
[2]: https://linux.cn/article-12164-1.html
[3]: https://getfedora.org/workstation
[4]: https://fedoramagazine.org/wp-content/uploads/2020/04/unlock.gif
[5]: https://fedoramagazine.org/wp-content/uploads/2020/04/extensions.png
[6]: https://fedoramagazine.org/wp-content/uploads/2020/04/settings.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/04/donotdisturb.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/04/clocks.png
[9]: https://help.gnome.org/misc/release-notes/3.36/
[10]: https://en.wikipedia.org/wiki/Thrashing_(computer_science)
