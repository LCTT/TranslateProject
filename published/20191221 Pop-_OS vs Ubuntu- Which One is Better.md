[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11744-1.html)
[#]: subject: (Pop!_OS vs Ubuntu: Which One is Better?)
[#]: via: (https://itsfoss.com/pop-os-vs-ubuntu/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Pop!_OS 与 Ubuntu：哪个更棒？
======

好吧，你可能会发现从[最佳 Linux 发行版][1]列表中选择一个发行版很容易，但是，将两个类似的 Linux 发行版进行比较通常会令人困惑，就像 Pop!_OS 与 Ubuntu 一样。

有趣的是，Pop!\_OS 是基于 [Ubuntu][2] 的。那么，Pop!\_OS 和 Ubuntu 之间有什么区别呢？为什么要从中选择一个呢？

在本文中，我将比较 Pop!_OS 和 Ubuntu（两者都是我的最爱）。

**注意：**你可能会发现一些武断的观点，而本文只是一份比较的参考。随着 Linux 发行版的不断开发和更新，随着时间的流逝，很多事情都会改变。

### 比较 Ubuntu 和 Pop!_OS

![Pop!_OS Vs Ubuntu][3]

发现相似之处可帮助你区分其他差异之处。因此，让我们从一些明显的相似之处开始。

就像我提到的，Pop!\_OS 是基于 Ubuntu 之上的 Linux 发行版。因此，当你使用 Pop!\_OS 时，你将获得使用 Ubuntu 的所有好处（从技术上说，其核心是一样的）。

它们都默认带有 [GNOME 桌面环境][4]，因此它们具有相似的用户界面（UI）。

在不讨论所有底层差异的情况下，我将在这里重点介绍一些重要的差异。

#### 用户体验及主题

![Pop!_OS][5]

许多用户认为 Pop!_OS 只是具有不同外观的 Ubuntu。

根据我的经验，我觉得这并非完全正确。

是的，它们俩都很喜欢 [GNOME 桌面环境][4] —— 但是，Pop!_OS 让人感觉更加优美。

除了外观之外，[Ubuntu 还通过添加程序坞和其他一些小花巧来定制了 GNOME 的体验][6]。如果你喜欢定制的 GNOME 体验，可能会发现它更好。

但是，如果你更喜欢纯粹的 GNOME 体验，Pop!_OS 默认情况下为你提供的就是这样。

在你亲自尝试之前，我无法说服你。但是，Pop!_OS 中的总体配色方案、图标和主题可以说是令人愉悦的高级用户体验。

这可能是一个主观的事情，但这是我所观察到的。你还可以查看 Ubuntu 19.10 的视频教程，亲自感受一下。

#### 易于安装第三方应用

![Pop Os PPA][7]

Ubuntu 非常重视 Snap 软件包。这增加了它提供的应用程序的数量。

但是 Snap 软件包存在一些重要的问题。它们占用了过多的磁盘空间，并且启动要花费大量的时间。

这就是为什么我更喜欢使用应用程序的 APT 版本的原因。

我为什么要说这个呢？

因为 Pop!_OS 具有其[自己的官方 PPA][8]，并已默认启用。你会在此处找到一些有用的应用程序，例如 Android Studio、TensorFlow。无需下载 Android Studio 的 1GB 大的 Snap 程序包。只需使用 [apt-get install][9]就可以了。

#### 预装应用

![Ubuntu installation slideshow][10]

对于某些人来说，它可能不是最大的问题，但是拥有大量预安装的应用程序可能会影响体验和性能。即使不影响性能，某些用户也只喜欢较少的预装应用程序。

与 Ubuntu 相比，Pop!_OS 捆绑了更少的默认应用程序（潜在地减少了胖软件）。

再一次提醒，这是主观的看法。如果你希望预安装更多应用程序，则可以考虑使用 Ubuntu 而不是 Pop!_OS。

#### Snap 软件包支持

![][11]

对于熟悉 Snap 程序包的用户来说，Ubuntu 的软件中心是比 Pop!_OS 商店更好的解决方案，因为你可以在软件中心中列出 Snap 程序包。

你无法在软件中心中过滤 Snap 软件包，但是当你在软件中心中发现一个 Snap 软件包（查看应用程序来源的详细信息为 “Snap store”/“Snapcraft”）时安装它就更容易了。

可能你会感到困惑，Pop!\_OS 也确实支持 Snap 软件包。但是，你不会在 Pop!\_OS 商店中找到它们，这是唯一的区别。

如果不确定什么是 Snap 软件包及其功能，可以查看我们的文章《[在 Linux 上安装 Snap 应用][12]》。

#### 单独的 NVIDIA/AMD ISO 文件

![ISOs][13]

从技术上讲，它不是内部比较的一部分，而是某些用户关心的一个因素。

因此，值得强调的是 Pop!_OS 提供了单独的 ISO。一个用于带 NVIDIA 显卡的系统，另一个用于带/不带 AMD 显卡的系统。

使用 Ubuntu 19.10，你可以在 Ubuntu ISO 上获得 NVIDIA 驱动程序，但 AMD 显卡没有这个。

#### 可靠性与问题

毫无疑问，这两个[发行版都适合初学者][14]，并且相当可靠。如果你想要更好的可靠性和更少的问题，则可能希望一直使用长期支持（LTS）版本。

当出现新版本的 Ubuntu 时，Pop!_OS 将在其上开发，并有可能解决用户在 Ubuntu 原始发行版上遇到的问题，然后再进行新的升级。这给它们带来了一点优势，但这没什么实质性的不同，因为这些修复最终都可以运用于 Ubuntu。

#### 性能

性能将高度取决于你所安装的内容以及所安装的硬件配置。

除非你有一个超级旧的系统，否则这两个发行版似乎都表现良好。

我的机器是 i5-7400 处理器和 16GB 的 RAM（带有 GTX 1050ti 显卡），我发现两种发行版上的体验都足够好。

当然，你可以手动进行一些优化调整以满足要求——无论它们中的哪个不满足你的硬件配置。

但是，如果你想使用 System76 笔记本电脑，那么 Pop!\_OS 将可以证明自己是 [Linux 领域的苹果][15]，因为 Pop!\_OS 是针对其硬件量身定制的，与 Ubuntu 有所不同。

#### 硬件兼容性

在比较其他 Linux 发行版时，这绝对是要考虑的事情。但是，在这种情况下，实际上并没有太大的区别。

你可能会考虑 Pop!_OS 一直在使用较新的硬件配置，因为他们主要是为他们的笔记本电脑量身定制具有各种配置的 OS。而且，这只是一个观察，而不是事实。

### 结语

我知道在不亲自尝试的情况下从两个流行的 Linux 发行版中选择一个并不容易。如果可能的话，我建议你在进行比较的同时尝试两者，以供参考。

你在这两者之间有何选择？我在比较中错过了什么吗？在下面的评论中让我知道。

--------------------------------------------------------------------------------

via: https://itsfoss.com/pop-os-vs-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-distributions/
[2]: https://ubuntu.com/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/pop_os_vs_ubuntu.png?ssl=1
[4]: https://www.gnome.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/pop-os-UI.jpg?ssl=1
[6]: https://itsfoss.com/gnome-tricks-ubuntu/
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/pop-os-ppa.jpg?ssl=1
[8]: https://launchpad.net/~system76/+archive/ubuntu/pop/
[9]: https://itsfoss.com/apt-get-linux-guide/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/08/install-ubuntu-linux-on-intel-nuc-14_tutorial.jpg?resize=800%2C516&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/11/snapcraft.jpg?ssl=1
[12]: https://itsfoss.com/install-snap-linux/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/11/iso-amd-nvidia-pop-os.jpg?ssl=1
[14]: https://itsfoss.com/best-linux-beginners/
[15]: https://www.phoronix.com/scan.php?page=news_item&px=System76-Integrated-Vision
