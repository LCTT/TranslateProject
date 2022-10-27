[#]: subject: "Announcing Fedora Linux 36"
[#]: via: "https://fedoramagazine.org/announcing-fedora-36/"
[#]: author: "Matthew Miller https://fedoramagazine.org/author/mattdm/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14579-1.html"

Fedora Linux 36 发布
======

![](https://img.linux.net.cn/data/attachment/album/202205/11/162224g07rzfbbniwbrgbn.jpg)

今天，我很高兴与大家分享一个消息，它是成千上万的 Fedora 项目贡献者辛勤工作的成果：我们的最新版本 —— Fedora Linux 36，和大家见面了！

### 由社区开发，为社区服务

通常当我写这些公告时，我会谈论版本中的一些很棒的技术变化。但这一次，我想把重点放在实现这些变化的社区上。Fedora 社区不是一群孤立地工作的人 —— 我们是朋友。事实上，这也是我们的“<ruby>四个理念<rt>Four Foundations</rt></ruby>”之一。

我们最新的“Fedora 朋友”之一，Juan Carlos Araujo 在一篇 [Fedora 讨论帖子][2] 中说得很好：

> 除了功能、稳定性、特性、工作方式以及前沿性外，我认为决定一个发行版成败的还有那些无形的东西，比如文档和社区。而 Fedora 拥有这一切……尤其是无形的东西。

多年来，我们一直努力使 Fedora 成为一个包容和欢迎的社区。我们希望它成为经验丰富的贡献者和新手能一起工作的地方。就像我们希望 Fedora Linux 是一个既能吸引资深用户又能吸引新手的发行版一样。

说到 Fedora Linux，让我们看看新版本的一些亮点。像往常一样，在从旧版本升级之前，请确保你的系统是最新的。这次尤其需要注意，因为我们在 F34/F35 更新中修复了一些非常重要的与升级有关的错误。如果不先应用这些更新，系统升级可能会失败。

### 桌面改进

Fedora 工作站专注于桌面体验，尤其是面向那些希望获得“刚刚好”的 Linux 系统体验的用户。像往常一样，Fedora 工作站采用最新的 GNOME 版本：[GNOME 42][3]。虽然 GNOME 42 不能完全解决生命、宇宙和一切问题，但它带来了很多改进。许多应用程序都被移植到了 GTK 4，以改善风格和性能。它还附带了两个新的应用程序：<ruby>文本编辑器<rt>Text Editor</rt></ruby>和<ruby>控制台<rt>Console</rt></ruby>。它们的名字起得很贴切，所以你可以猜出它们是干什么的。文本编辑器是新的默认文本编辑器，而控制台可以在软件仓库中下载。

如果你使用了英伟达的专有图形驱动，你的桌面会话现在将默认使用 Wayland 协议。这使你能够在使用现代桌面管理器时，充分利用硬件加速。

当然，我们生产的不仅仅是 “Editions”。[Fedora Spins][4] 和 [Labs][5] 针对不同的受众和使用场景。例如 [Fedora Comp Neuro][6] ，它为计算神经科学提供工具，以及 [Fedora LXQt][7]，它提供一个轻量级的桌面环境。并且，我们附加了可选架构：[ARM AArch64、Power 和 S390x][8]。

### 针对系统管理员的改进

Fedora Linux 36 包含最新的 Ansible 版本。Ansible 5 将“引擎”拆分为 ansible-core 包和 [collection 包][9]。这使得维护更容易，并允许你只下载需要的集合。请参阅 [Ansible 5 迁移指南][10] 以了解如何更新你的 Playbook。

从 Fedora Server 36 开始，Cockpit 提供了一个用于配置和持续管理 NFS 及 Samba 共享的模块。这使得管理员可以通过 Cockpit 网页界面（用于配置其他服务器属性）来管理网络文件共享。

### 其他更新

无论你使用 Fedora Linux 的哪个衍生版，你都会得到开源世界所提供的最新成果。Podman 4.0 将在 Fedora Linux 36 中首次全面发布。它带来了大量变化和一个全新的网络栈。不过，它也带来了向下**不兼容**的 API 变化，所以请仔细阅读 [上游文档][11]。

遵循 Fedora 的 “<ruby>[争先][12]<rt>First</rt></ruby>” 理念，我们已经更新了关键的编程语言和系统库包，包括 Ruby 3.1、Golang 1.18 和 PHP 8.1。 

我们很高兴你能试用新版本！请访问 [https://getfedora.org](https://getfedora.org) 并立即下载它吧！或者，如果你正在使用 Fedora Linux，请按照我们的 [简易升级说明][13] 进行。想了解更多关于 Fedora Linux 36 新功能的信息，请查看 [发行说明][14]。

### 虽然不大可能会出现问题……

但是，如果你真的遇到了问题，请访问我们的 [Ask Fedora][15] 用户支持论坛。这里有一个 [常见问题][16] 的分类。

### 谢谢大家

感谢在本次发布周期内为 Fedora 项目做出贡献的成千上万的人。Fedora 社区有你们，真好！请务必在 5 月 13 日至 14 日参加我们的 [虚拟发布派对][17]！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-36/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2022/05/f36-final-816x345.jpg
[2]: https://discussion.fedoraproject.org/t/the-end-of-my-distro-hopping-days/38445
[3]: https://release.gnome.org/42/
[4]: https://spins.fedoraproject.org/
[5]: https://labs.fedoraproject.org/
[6]: https://labs.fedoraproject.org/en/comp-neuro/
[7]: https://spins.fedoraproject.org/en/lxqt/
[8]: https://alt.fedoraproject.org/alt/
[9]: https://koji.fedoraproject.org/koji/search?match=glob&type=package&terms=ansible-collection*
[10]: https://docs.ansible.com/ansible/devel/porting_guides/porting_guide_5.html
[11]: https://podman.io/releases/2022/02/22/podman-release-v4.0.0.html
[12]: https://docs.fedoraproject.org/en-US/project/#_first
[13]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[14]: https://docs.fedoraproject.org/en-US/fedora/f36/release-notes/
[15]: https://ask.fedoraproject.org/
[16]: https://ask.fedoraproject.org/tags/c/common-issues/141/f36
[17]: https://hopin.com/events/fedora-linux-36-release-party/registration
