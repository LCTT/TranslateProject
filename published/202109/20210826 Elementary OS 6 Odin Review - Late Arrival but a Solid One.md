[#]: subject: "Elementary OS 6 Odin Review – Late Arrival but a Solid One"
[#]: via: "https://www.debugpoint.com/2021/08/elementary-os-6-odin-review/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "imgradeone"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13739-1.html"

elementary OS 6 Odin 评测：迟到的新版本，但也实至名归
======

> 这篇 elementary OS 6 的评测将为你呈现该系统在旧款测试设备上的表现。

![](https://img.linux.net.cn/data/attachment/album/202109/01/095116zk73wcc4g5clnvq8.jpg)

elementary OS 的粉丝们焦急等待 elementary OS 6 Odin 发布已经将近两年了。如此焦急的原因，主要在于早期版本 elementary OS 5.1 的内核和软件包在 2021 年来说过于陈旧。而且，这一旧版本基于 Ubuntu 18.04 LTS 构建。因此，用户都急切地等待着基于 Ubuntu 20.04 LTS 的全新版本 —— 最重要的是，Ubutnu 20.04 LTS 已经发布一年，接下来也将有下一个 LTS 版本发布。

你应该也明白的，过长的等待时间，很可能导致用户跳槽到其他发行版。

但即便如此，新版本终于还是 [在 8 月发布了][1]，它在用户和粉丝群体很受欢迎。

于是，我在一周前为一台旧设备（我知道新设备的体验会更好）安装了 elementary OS 6 Odin，下面就是测评。

![elementary OS 6 Odin 的桌面][2]

### elementary OS 6 Odin 测评

测试设备：

  * CPU – Intel Core i3，4 GB 运行内存
  * 硬盘 – SSD 固态硬盘
  * 显卡 – Nvidia GeForce（340）

#### 安装

在这一版本中，elementary 团队针对他们自制的 elementary OS 安装器做了易用性优化。新安装器减少了安装前的准备步骤，虽然它还是需要依赖 GParted 进行分区操作（当然 GParted 本身是一款不错的工具）。

在前述测试设备中，安装过程大约花费了 10 分钟，没有任何报错。安装完之后，GRUB 也正常更新，没有任何意外。这是一个安装在老式 BIOS 上多引导系统。

#### 初见印象

如果你刚听说 elementary OS 和 Pantheon 桌面，或者从其他传统的菜单型桌面环境迁移过来，你可能需要一两天时间来适应这款桌面。当然，如果你已经是 elementary OS 的老用户的话，那么你将获得一致的体验，外加性能和外观的优化。

你应该可以察觉到一些明显可见的 [elementary OS 6 的新特性][3]，像是强调色、原生暗黑模式，以及一组不错的新壁纸。

#### 稳定性与性能

我已经使用 elementary OS 6 Odin 超过一周的时间。在日常使用后，我只能说，它很稳定，没有突然的崩溃和意外。其他（通过 `apt` 单独安装的）额外软件也运作正常，性能也没有降低。

在近乎闲置的情况下，CPU 使用率处在 5%-10% 之间，内存占用约为 900 MB。CPU / 内存的消耗主要分配在 Gala（Pantheon 的窗口管理器）、Wingpanel（顶栏）和应用中心。

![elementary OS 6 的系统性能][5]

考虑到系统的视觉效果，我认为这些占用数据也十分合理。不过，当你打开更多软件，例如 LibreOffice、Chrome、Kdenlive 之后，消耗的资源肯定会更多。

#### 应用程序与应用中心

elementary OS 的应用程序列表经过精选，几乎所有类型的软件都可以从应用中心获取，包括 Flatpak 应用。不过，elementary OS 默认并没有预装一些重要的应用程序，像是 Firefox、LibreOffice、Torrent 客户端、硬盘分区工具、照片编辑器之类 —— 这些重要的程序需要在安装系统后再自行安装。我认为预装软件这一块有很大的改进空间。

### 结束语

在这一周的测试中，我也多次遇到了一个 bug，Wi-Fi 有时会突然断开，不过这完全是上游 Ubuntu 20.04 的问题 —— 多年以来，它一直有奇怪的 Wi-Fi 问题。抛开这个问题，elementary OS 确实是一款稳定、优秀的 Linux 发行版。如果 elementary OS 有滚动更新的版本，也许会更好。因此，这是一款值得推荐的发行版，尤其适合那些从 macOS 迁移过来的人。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/08/elementary-os-6-odin-review/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[imgradeone](https://github.com/imgradeone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://blog.elementary.io/elementary-os-6-odin-released/
[2]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/elementary-OS-6-ODIN-Desktop-1024x576.jpeg
[3]: https://www.debugpoint.com/2021/08/elementary-os-6/
[4]: https://www.debugpoint.com/2020/09/elementary-os-6-odin-new-features-release-date/
[5]: https://www.debugpoint.com/blog/wp-content/uploads/2021/08/System-performance-of-elementary-OS-6.jpeg
