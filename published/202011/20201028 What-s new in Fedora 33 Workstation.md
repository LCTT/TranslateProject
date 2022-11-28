[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12801-1.html)
[#]: subject: (What’s new in Fedora 33 Workstation)
[#]: via: (https://fedoramagazine.org/whats-new-fedora-33-workstation/)
[#]: author: (Gregory Bartholomew https://fedoramagazine.org/author/glb/)

Fedora 33 Workstation 的新功能
======

![][1]

Fedora 33 Workstation 是我们这个免费的、领先的操作系统的[最新版本][2]。你现在就可以从[官方网站][3]下载它。Fedora 33 Workstation 中有一些新的和值得注意的变化。请阅读如下更多细节。

### GNOME 3.38

Fedora 33 Workstation 为各类用户提供了最新版本的 GNOME 桌面环境。在 Fedora 33 Workstation 中的 GNOME 3.38 包含了许多更新和改进，包括：

#### 一个新的 GNOME Tour 应用

现在，新用户会看到一个“新的 Tour 应用，重点展示了桌面的主要功能，并为第一次使用 GNOME 的用户提供一个很好的欢迎页”。

![The new GNOME Tour application in Fedora 33][4]

#### 拖动重排序应用

GNOME 3.38 用一个单一的可定制的、一致的视图取代了之前分开的“常用”和“所有”应用视图，这允许你重新排列应用并将它们组织到自定义文件夹中。只需点击并拖动即可移动应用。

![GNOME 3.38 Drag to Reorder][5]

#### 改进屏幕录制

GNOME Shell 中的屏幕录制基础架构已被改进，以利用 PipeWire 和内核 API。这将有助于减少资源消耗并提高响应速度。

GNOME 3.38 还提供了许多额外的功能和改进。查看 [GNOME 3.38 发行说明][6]以获得更多信息。

#### B-tree 文件系统

正如[之前宣布的][7]，新安装的 Fedora 33 将默认使用 [Btrfs][8]。每一个新的内核版本都会为 Btrfs 增加一些特性和增强功能。[变更日志][9]有一个完整的总结，它介绍了每个新内核版本给 Btrfs 带来的功能。

#### Swap on ZRAM

Anaconda 和 Fedora IoT 多年来一直默认使用 swap-on-zram。在 Fedora 33 中，将默认启用 swap-on-zram，而不是交换分区。查看 [Fedora wiki 页面][10]了解更多关于 swap-on-zram 的细节。

#### 默认使用 Nano

新的 Fedora 33 将把 `EDITOR` 环境变量默认设置为 [nano][11]。这个变化影响了一些命令行工具，当它们需要用户输入时，会打开一个文本编辑器。在早期的版本中，这个环境变量的默认值并没有被指定，而是由各个应用程序来选择一个默认的编辑器。通常情况下，应用程序会使用 [vi][12] 作为它们的默认编辑器，因为它是一个小应用，通常在大多数 Unix/Linux 操作系统的基础安装中都可以使用。由于 Fedora 33 的基本安装中包含了 nano，而且 nano 对于初学者来说更加直观，所以 Fedora 33 将默认使用 nano。当然，想要使用 vi 的用户可以在自己的环境中覆盖 `EDITOR` 变量的值。详见[Fedora 修改请求][11]获取更多信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-33-workstation/

作者：[Gregory Bartholomew][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/glb/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/10/f33workstation-816x345.jpg
[2]: https://fedoramagazine.org/announcing-fedora-33/
[3]: https://getfedora.org/workstation
[4]: https://fedoramagazine.org/wp-content/uploads/2020/10/fedora-33-gnome-tour-1.png
[5]: https://fedoramagazine.org/wp-content/uploads/2020/10/drag-to-reorder-1.gif
[6]: https://help.gnome.org/misc/release-notes/3.38/
[7]: https://fedoramagazine.org/btrfs-coming-to-fedora-33/
[8]: https://en.wikipedia.org/wiki/Btrfs
[9]: https://btrfs.wiki.kernel.org/index.php/Changelog#By_feature
[10]: https://fedoraproject.org/wiki/Changes/SwapOnZRAM
[11]: https://fedoraproject.org/wiki/Changes/UseNanoByDefault
[12]: https://en.wikipedia.org/wiki/Vi
