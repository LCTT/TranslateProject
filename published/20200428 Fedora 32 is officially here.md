[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12164-1.html)
[#]: subject: (Fedora 32 is officially here!)
[#]: via: (https://fedoramagazine.org/announcing-fedora-32/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Fedora 32 正式发布！
======

![][1]

它来了! 我们很荣幸地宣布 Fedora 32 的发布。感谢成千上万的 Fedora 社区成员和贡献者的辛勤工作，我们又一次准时发布了。

如果你只想马上就能拿到它，请马上访问 <https://getfedora.org/>。更多详情，请继续阅读本文。

### Fedora 的全部变种

Fedora Editions 是针对特定的“展示”用途输出的。

Fedora Workstation 专注于桌面系统。特别是，它面向的是那些希望获得“可以工作的” Linux 操作系统体验的软件开发者。这个版本采用了 [GNOME 3.36][2]，一如既往地有很多很棒的改进。我最喜欢的是新的锁屏！

Fedora Server 以一种易于部署的方式为系统管理员带来了新锐的开源服务器软件。对于边缘计算用例，[Fedora IoT][3] 为 IoT 生态系统提供了坚实的基础。

Fedora CoreOS 是一个新兴的 Fedora Edition。它是一个自动更新的、最小化的操作系统，用于安全地大规模运行容器化工作负载。它提供了几个[更新流][4]，遵循大约每两周一次的自动更新。目前，next 流是基于 Fedora 32，后续还有 testing 流和 stable 流。你可以从[下载页面][5]中找到关于按 next 流发布的工件的信息，并在 [Fedora CoreOS 文档][6]中找到关于如何使用这些工件的信息。

当然，我们制作的不仅仅是 Editions。[Fedora Spins][7] 和[实验室][8]针对的是不同的受众和用例，包括[Fedora 天文学实验室][9]，它为业余和专业的天文学家带来了完整的开源工具链，还有像 [KDE Plasma][10] 和 [Xfce][11] 这样的桌面环境。Fedora 32 中新增的 [计算神经科学实验室][12] 是由我们的神经科学特别兴趣小组开发的，它可以实现计算神经科学。

还有，别忘了我们的备用架构，[ARM AArch64、Power 和 S390x][13]。特别值得一提的是，我们改进了对 Rockchip 系统级芯片的支持，包括 Rock960、RockPro64 和 Rock64。

### 一般性的改进

无论你使用 Fedora 的哪个变体，你都能获得最新的开源世界。遵循我们的“[First][14]”理念，我们更新了关键的编程语言和系统库包，包括 GCC 10、Ruby 2.7 和 Python 3.8。当然，随着 Python 2 已经过了报废期，我们已经从 Fedora 中删除了大部分 Python 2 包，但我们为仍然需要它的开发者和用户提供了一个遗留的 python27 包。在 Fedora Workstation 中，我们默认启用了 EarlyOOM 服务，以改善低内存情况下的用户体验。

我们非常期待你能尝试一下新版本的使用体验! 现在就去 <https://getfedora.org/> 下载它。或者如果你已经在运行 Fedora 操作系统，请按照简单的[升级说明][15]进行升级。

### 万一出现问题……

如果你遇到问题，请查看[Fedora 32 常见错误][16]页面，如果有问题，请访问我们的 [Askedora][17] 用户支持平台。

### 谢谢大家

感谢在这个发布周期中为 Fedora 项目做出贡献的成千上万的人，特别是感谢那些在大流行期间为又一次准时发布而付出额外努力的人。Fedora 是一个社区，很高兴看到我们彼此之间的支持。我邀请大家参加 4 月28-29 日的[红帽峰会虚拟体验][18]，了解更多关于 Fedora 和其他社区的信息。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-32/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2020/04/f32-final-816x345.png
[2]: https://www.gnome.org/news/2020/03/gnome-3-36-released/
[3]: https://iot.fedoraproject.org/
[4]: https://docs.fedoraproject.org/en-US/fedora-coreos/update-streams/
[5]: https://getfedora.org/en/coreos/download?stream=next
[6]: https://docs.fedoraproject.org/en-US/fedora-coreos/getting-started/
[7]: https://spins.fedoraproject.org/
[8]: https://labs.fedoraproject.org/
[9]: https://labs.fedoraproject.org/en/astronomy/
[10]: https://spins.fedoraproject.org/en/kde/
[11]: https://spins.fedoraproject.org/en/xfce/
[12]: https://labs.fedoraproject.org/en/comp-neuro
[13]: https://alt.fedoraproject.org/alt/
[14]: https://docs.fedoraproject.org/en-US/project/#_first
[15]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[16]: https://fedoraproject.org/wiki/Common_F32_bugs
[17]: http://ask.fedoraproject.org
[18]: https://www.redhat.com/en/summit
