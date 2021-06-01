[#]: subject: (Fedora Linux 34 is officially here!)
[#]: via: (https://fedoramagazine.org/announcing-fedora-34/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13365-1.html)

Fedora Linux 34 各版本介绍
======

![](https://img.linux.net.cn/data/attachment/album/202105/06/121307el07t08iiw01j7q8.jpg)

今天（4/27），我很高兴地与大家分享成千上万的 Fedora 项目贡献者的辛勤工作成果：我们的最新版本，Fedora Linux 34 来了！我知道你们中的很多人一直在等待。我在社交媒体和论坛上看到的“它出来了吗？”的期待比我记忆中的任何一个版本都多。所以，如果你想的话，不要再等了，[现在升级][2] 或者去 [获取 Fedora][3] 下载一个安装镜像。或者，如果你想先了解更多，请继续阅读。 

你可能注意到的第一件事是我们漂亮的新标志。这个新标志是由 Fedora 设计团队根据广大社区的意见开发的，它在保持 Fedoraness 的同时解决了我们旧标志的很多技术问题。请继续关注以新设计为特色的 Fedora 宣传品。

### 适合各种使用场景的 Fedora Linux

Fedora Editions 面向桌面、服务器、云环境和物联网等各种特定场景。

Fedora Workstation 专注于台式机，尤其是面向那些希望获得“正常使用”的 Linux 操作系统体验的软件开发者。这个版本的带来了 [GNOME 40][4]，这是专注、无干扰计算的下一步。无论你使用触控板、键盘还是鼠标，GNOME 40 都带来了导航方面的改进。应用网格和设置已经被重新设计，以使交互更加直观。你可以从 3 月份的 [Fedora Magazine][5] 文章中阅读更多的变化和原因。

Fedora CoreOS 是一个新兴的 Fedora 版本。它是一个自动更新的最小化操作系统，用于安全和大规模地运行容器化工作负载。它提供了几个更新流，跟随它之后大约每两周自动更新一次，当前，next 流基于 Fedora Linux 34，随后是 testing 流和 stable 流。你可以从 [下载页面][6] 中找到关于跟随 next 流的已发布工件的信息，以及在 [Fedora CoreOS 文档][7] 中找到如何使用这些工件的信息。

Fedora IoT 为物联网生态系统和边缘计算场景提供了一个强大的基础。在这个版本中，我们改善了对流行的 ARM 设备的支持，如 Pine64、RockPro64 和 Jetson Xavier NX。一些 i.MX8 片上系统设备，如 96boards Thor96 和 Solid Run HummingBoard-M 的硬件支持也有所改善。此外，Fedora IoT 34 改进了对用于自动系统恢复的硬件看门狗的支持。

当然，我们不仅仅提供 Editions。[Fedora Spins][8] 和 [Labs][9] 针对不同的受众和使用情况，例如 [Fedora Jam][10]，它允许你释放你内心的音乐家，以及像新的 Fedora i3 Spin 这样的桌面环境，它提供了一个平铺的窗口管理器。还有，别忘了我们的备用架构。[ARM AArch64 Power 和 S390x][11]。

### 一般性改进

无论你使用的是 Fedora 的哪个变种，你都会得到开源世界所能提供的最新成果。秉承我们的 “[First][12]” 原则，我们已经更新了关键的编程语言和系统库包，包括 Ruby 3.0 和 Golang 1.16。在 Fedora KDE Plasma 中，我们已经从 X11 切换到 Wayland 作为默认。

在 Fedora Linux 33 中 BTRFS 作为桌面变体中的默认文件系统引入之后，我们又引入了 [BTRFS 文件系统的透明压缩][13]。

我们很高兴你能试用这个新发布版本！现在就去 <https://getfedora.org/> 下载它。或者如果你已经在运行 Fedora Linux，请按照 [简易升级说明][2]。关于 Fedora Linux 34 的新功能的更多信息，请看 [发行说明][14]。

### 万一出现问题……

如果你遇到了问题，请查看 [Fedora 34 常见问题页面][15]，如果你有问题，请访问我们的 Ask Fedora 用户支持平台。

### 谢谢各位

感谢在这个发布周期中为 Fedora 项目做出贡献的成千上万的人，特别是那些在大流行期间为使这个版本按时发布而付出额外努力的人。Fedora 是一个社区，很高兴看到我们如此互相支持！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-34/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/f34-final-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[3]: https://getfedora.org
[4]: https://forty.gnome.org/
[5]: https://fedoramagazine.org/fedora-34-feature-focus-updated-activities-overview/
[6]: https://getfedora.org/en/coreos
[7]: https://docs.fedoraproject.org/en-US/fedora-coreos/
[8]: https://spins.fedoraproject.org/
[9]: https://labs.fedoraproject.org/
[10]: https://labs.fedoraproject.org/en/jam/
[11]: https://alt.fedoraproject.org/alt/
[12]: https://docs.fedoraproject.org/en-US/project/#_first
[13]: https://fedoramagazine.org/fedora-workstation-34-feature-focus-btrfs-transparent-compression/
[14]: https://docs.fedoraproject.org/en-US/fedora/f34/release-notes/
[15]: https://fedoraproject.org/wiki/Common_F34_bugs
[16]: https://hopin.com/events/fedora-linux-34-release-party
