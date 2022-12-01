[#]: subject: "Announcing Fedora Linux 37"
[#]: via: "https://fedoramagazine.org/announcing-fedora-37/"
[#]: author: "Matthew Miller https://fedoramagazine.org/author/mattdm/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15258-1.html"

Fedora Linux 37 发布
======

![][1]

今天我很兴奋地与大家分享成千上万的 Fedora 项目贡献者的辛勤工作成果：Fedora Linux 37 版本来了！让我们看看这个最新版本给你带来了什么。一如既往，在从以前的版本升级之前，你应该确保你的系统是完全最新的。迫不及待地想开始了吗？在你阅读的同时 [下载][2]！

> **[下载 Fedora Linux 37][2]**

### 两个新的版本

Fedora 的各个“<ruby>版本<rt>Edition</rt></ruby>”是针对某一特定“市场”的旗舰产品。在 Fedora Linux 37 中，我们增加了两个新版本：Fedora CoreOS 是你可能还记得的 Atomic Host 的后续版本。从 Project Atomic 和 CoreOS 的初始的工作中汲取营养，它提供了一种自动更新机制，以托管基于容器的工作负载。通过原子更新和简单的回滚，它为你的基础设施增加了安全感。

Fedora Cloud 也作为一个版本回来了。云计算工作组的活动已经重新开始了。Cloud 版本提供了一个很棒的 Fedora 基础，可以在你喜欢的公共或私有云中运行。AMI 将在本周晚些时候在 AWS 市场上提供，在社区频道上现在已经可以使用。请查看 [此网站][3] 以了解可以在其他云供应商或你自己的云上运行的镜像！

### 桌面的改进

Fedora Workstation 专注于桌面体验。像往常一样，Fedora Workstation 采用了最新的 GNOME 版本。[GNOME 43][4] 在设置中包括一个新的设备安全面板，为用户提供关于系统中硬件和固件的安全信息。在上一个版本的基础上，更多的 GNOME 核心应用程序被移植到了最新版本的 GTK 工具包，提供了更好的性能和现代的外观。 

在这个版本中，我们做了一些改变，让你的安装变得更精简。我们把 Firefox 浏览器的语言包分成了子包。这意味着如果你不需要本地化，你可以删除 `firefox-langpacks` 包。gettext 的运行包（帮助其他包产生多语言文本的工具）被分割成一个单独的、可选择的子包。

当然，我们生产的不仅仅是“版本”。Fedora <ruby>[定制版][5]<rt>Spins</rt></ruby> 和 <ruby>[实验室][6]<rt>Labs</rt></ruby> 针对的是不同的受众和使用情况，包括 [Fedora Comp Neuro][7] ，它为计算神经科学提供工具，以及像 [Fedora LXQt][8] 这样的桌面环境，它提供一个轻量级桌面环境。而且，别忘了我们的备用架构。[ARM AArch64、Power 和 S390x][9]。

### 系统管理方面的改进

Fedora Server 现在可以生成一个 KVM 磁盘镜像，使在虚拟机中运行 Server 更加容易。如果你已经禁用了 SELinux（没关系 —— 我们仍然爱你！），你可以在影响较小的情况下重新开启它。自动标签现在以并行方式运行，使 “fixfiles” 操作更快。

为了跟上密码学的发展，这个版本引入了一个 `TEST-FEDORA39` 策略，预览了计划在未来版本中的变化。新策略之一是不再使用 SHA-1 签名。研究人员早就知道这种哈希值（就像之前的 MD5 一样）在许多安全方面的使用是不安全的。

在未来，我们可能会将 SHA-1 从 Fedora Linux 可接受的安全算法列表中移除。（正如 `TEST-FEDORA39` 这个名字所暗示的那样，也许最快也要到明年。）不过我们知道如今 SHA-1 哈希值仍然在使用。新的策略可以帮助你现在就测试你的关键应用程序，这样你就可以做好准备。请尝试一下，并让我们知道你在哪里遇到了问题。

说到密码学，openssl1.1 包现在已经废弃了。它还能用，但我们建议你更新你的代码，以使用 openssl 3。

### 其他更新

树莓派 4 现在在 Fedora Linux 中得到了正式支持，包括图形加速。在 ARM 的其他方面，Fedora Linux 37 放弃了对 ARMv7 架构（也被称为 arm32 或 armhfp）的支持。

在我们的“[First][10]”基础上，我们已经更新了关键的编程语言和系统库包，包括 Python 3.11、Golang 1.19、glibc 2.36 和 LLVM 15。

我们很高兴你能试用这个新版本！请到 <https://getfedora.org/> 下载。或者如果你已经在运行 Fedora Linux，请按照 [简易升级说明][11]。更多关于 Fedora Linux 37 的新功能的信息，请看 [发行说明][12]。

### 在不太可能发生的情况下...

如果你遇到了问题，请访问我们的 [Ask Fedora][13] 用户支持论坛。这里有一个 [常见问题][14] 的分类。

### 谢谢大家

感谢在这个发布周期为 Fedora 项目做出贡献的成千上万的人。我们很高兴 Fedora 社区有你们。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/announcing-fedora-37/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/11/f37-release-1-816x345.jpg
[2]: https://getfedora.org
[3]: https://getfedora.org/en/cloud/
[4]: https://release.gnome.org/43/
[5]: https://spins.fedoraproject.org/
[6]: https://labs.fedoraproject.org/
[7]: https://labs.fedoraproject.org/en/comp-neuro/
[8]: https://spins.fedoraproject.org/en/lxqt/
[9]: https://alt.fedoraproject.org/alt/
[10]: https://docs.fedoraproject.org/en-US/project/#_first
[11]: https://docs.fedoraproject.org/en-US/quick-docs/upgrading/
[12]: https://docs.fedoraproject.org/en-US/fedora/f37/release-notes/
[13]: https://ask.fedoraproject.org/
[14]: https://ask.fedoraproject.org/c/common-issues/141/none
