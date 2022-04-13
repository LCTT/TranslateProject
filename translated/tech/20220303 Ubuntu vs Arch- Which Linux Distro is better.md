[#]: subject: "Ubuntu vs Arch: Which Linux Distro is better?"
[#]: via: "https://itsfoss.com/ubuntu-vs-arch/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "aREversez"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Ubuntu vs Arch: 孰优孰劣？
======

Ubuntu 与 Arch Linux 为用户提供了完全不同的桌面体验。 

在两者之间做出选择，实在让人左右为难，尤其是在既想体验 [Arch Linux 的亮点][1] 又想保留 Ubuntu Linux 的优势的情况下。

两种发行版本身都是用户的绝佳选择。不过，如何从两者中选出最佳的一种呢？

在这篇文章中，我将从各方面介绍 Ubuntu 和 Arch Linux 的不同之处，希望可以帮助你解决这一选择难题。

![][2]

### 1、目标用户

Arch Linux 旨在为那些喜欢鼓捣喜欢折腾的用户提供 **DIY** 体验，自定义 Linux 系统的各种元素。

比如，构建软件包，用以自定义桌面。 

这种开箱即用的体验取决于 [安装设置了 Arch Linux][3] 的用户。所以，Arch Linux 可以轻易迎合寻找不同包以及桌面环境等元素的用户。

而另一方面，Ubuntu 的目标用户是那些想使用**操作方便，预先配置好的** Linux 系统。

这类用户希望系统预装基础工具，确保一切都会按照预期进行。换言之，他们想要的是一个理想的系统，无需担心设置问题。

Ubuntu 也不希望用户花费大把时间来提升自己的体验，所以它选择以满足绝大多数用户的需求为基准。

### 2、安装

不得不说，Ubuntu 提供了简洁直观的安装方式，因为它提供的 GUI 大大方便了软件安装。

![][4]

如果有需要，你甚至可以 [在 Ubuntu 服务器上安装一个 GUI][5]。

但要安装 Arch Linux，你就不得不使用终端（命令行）。

![][6]

还好，[Arch Linux 现在有了安装指导][7] 可以参考，这使得通过终端安装 Arch Linux 变得更加容易了。

![][8]

当然，还是 Ubuntu 的安装更为方便一些。

### 3、桌面体验

![][9]

Ubuntu 旨在**方便用户**。为此，Ubuntu 项目的领导者 Canonical 公司提供了自定义的 GNOME 桌面环境体验。

尽管你可能无法像在 KDE Plasma 上那样自由地定制桌面，你依然可以有很多其他选择。感兴趣的话，可以点击了解 [KDE vs GNOME][10]。

Ubuntu 也会定期收集用户体验反馈信息，尽可能地帮助用户提高工作效率。

Arch Linux **更加关注功能** 以及其他技术方面，而不是用户的桌面体验。用户体验完全取决于用户在安装 Arch Linux 时是如何设置的。

使用 Arch Linux 时，你能依赖的只有桌面环境提供的开箱即用工具，没有为用户量身定制的改进。如果你想体验一些不一样的东西，你就必须对系统加以调整。

![Arch Linux with GNOME][11]

不过，好在 Arch Linux 允许用户选择 KDE Plasma, GNOME, 或者 [其他桌面环境][12]，所以你可以充分利用这一优势，根据自己的喜好来选择桌面环境。

不仅如此，在安装 Arch Linux 时，你还可以选择平铺式窗口管理器。

总体来说，如果使用 Ubuntu，你的桌面体验和其他用户的体验别无二致，因为 Ubuntu 可以自定义的元素极少。

相反，如果使用 Arch Linux，你就可以**自由定义桌面体验**。但请注意，这可能只适合 Linux 老手，如果你刚开始使用 Linux，恐怕做起来比较困难。

### 4、文件系统

大多数用户不会在意 Linux 发行版的文件系统。

因此，Ubuntu 坚持使用 **ext4** 作为文件系统。ext4 具有现代计算机所需的全部基本功能，是一种非常优秀的最常见的文件系统。

如果你不想使用 **ext4**，而想选择具备其他各种优势的文件系统，那么你可以考虑 Arch Linux。

![][13]

你可以选择 btrfs, ext4, xfs, 或者 f2fs。针对这些文件系统的优势，本文不再详述，但是如果你选择 **ext4** 之外的文件系统，你需要确保知道自己要做些什么。

### 5、软件生态

Ubuntu 支持的软件更多，因此 [绝大多数 Linux 主流发行版][14] 都是基于 Ubuntu 的。

![][15]

相应地，许多工具在开发时也是首先支持 Ubuntu，而后才是其他发行版本。

此外，在 Ubuntu 上安装软件包也非常容易。你可以通过 Ubuntu 官方仓库安装软件包，也可以使用 PPA，或者是软件中心（包括 Snap 应用）。

也可以使用 [Flatpak][16] 来安装软件。如果你的 Ubuntu 没有 Flatpak，你可以 [前往 Flathub 安装它][17]。

如果你使用的是 Arch Linux，那么你也可以通过官方仓库安装许多软件。

可惜的是，相较于 Ubuntu，Arch Linux 可能不会得到一些软件开发者的官方支持。

此外，你会发现，Arch Linux [安装和管理软件包都需要使用 pacman][18]。pacman 是一个 GUI，用于软件安装与管理，依赖于你所选择安装的桌面环境。

![][19]

举个例子，如果你安装的是 GNOME 桌面，你可以使用 GNOME 的软件中心；如果是 KDE Plasma 桌面，可以使用 Discover。

这些软件包管理器都不会内置 Snap 或 Flatpak，所以你只能根据需要自行安装。

为了获取更多的软件，你可以使用 [AUR][20]。请注意，AUR 是一个以社区为主导的软件仓库，所以官方建议你不要完全依赖它。

![][21]

即便如此，AUR 也经常被看做是 Arch Linux 的优势之一，毕竟社区提供的软件包比 Ubuntu 提供的更为丰富。

你可以通过使用一些 [AUR 助手][22]，提升体验质量。

总体来说，如果你想仅靠一个工具就能轻松安装并且管理软件，那么 Ubuntu 当属不二之选。

### 6、极简 vs 臃肿

极简还是臃肿，这完全取决于个人的偏好，因为在配置 Arch Linux 时，一切尽在你的掌握之中。所以你可以在满足需要的情况下,只安装最少数量的包。

与之相反，Ubuntu 预装了许多软件。在一些人看来，这些软件都很实用。

![][23]

当然，如果你不需要，也可以卸载。

不过，还有一些人认为，这些软件没什么必要，只会显得 Ubuntu 十分臃肿。

因此，你需要好好考虑一下，看自己究竟是想要预装的必备软件呢（Ubuntu）？还是拒绝臃肿，只取所需呢（Arch Linux）？

### 7、自由 vs 限制

![Arch Linux \(Neofetch\)][24]

就像前文所提到的，Arch Linux 允许你控制系统的一切，它赋予用户极大的自由度，让用户可以尽情定制体验。

这不仅仅局限于桌面环境或是平铺式窗口管理器。

你还可以选择自己喜欢的音频服务器，比如 PulseAudio 或者 pipewire。

你也可以选择特定的 Linux 内核，比如安全性更高的版本、能够提升用户体验的 Zen 内核或者某个 Linux 内核的长期支持版本。

不同于 Arch Linux，Ubuntu 一直坚持使用的 Linux 内核都是能够通过全面测试而且以 PulseAudio 作为默认音频服务器的（笔者写这篇文章时情况如此）。

但说到底，哪个能满足你的需求，哪个才是最好的。

### 8、社区支持

Ubuntu 拥有坚实的用户基础，可以提供广泛的社区支持。与其相关的论坛和门户网站有很多，可以指导 Ubuntu 用户，帮助解决遇到的难题。

![itsfoss community][25]

你也可以在论坛（包括 [It’s FOSS 社区][26]）发布问题，寻求帮助。

Arch Linux 用户比较少，所以不提供类似的社区支持。不过，ArchWiki 提供了几乎涉及 Arch Linux 各个方面的高质量技术文档，算是弥补了这一不足。

![arch wiki][27]

如果你想探索，[ArchWiki][28] 有着最丰富的技术文档。

### 9、发布周期

Ubuntu 提供 [长期支持版本][29]，每隔 5 年发布一次镜像更新，企业版则需要更长的时间。

![][30]

Ubuntu 还提供了非长期支持版本，每 9 个月发布一次更新，每半年发布一个新版本。非长期支持版本适合那些想体验最新软件包与功能的用户，每次升级都可能伴随着重大更新。

长期支持版本更适合想要在每次更新中都能获得突破性体验的用户。

更多信息可以参考我们的文章：[Ubuntu 发行周期与生命周期结束][31]

Arch Linux 属于 [滚动发行版][32]，所以不用担心发布周期的问题。只要有更新，无论大小，都会发送给用户。

![][33]

这样一来，Arch Linux 系统的软件包会一直保持最新状态，质量也是最高的。这听起来确实不错，但有时也会给一些用户造成不便。

### 10、硬件兼容性

![][34]

Ubuntu 是一款面向台式电脑的主流发行版，所以在发行之前，需要测试它与各种硬件的兼容性。

我可以打包票，**Ubuntu 开箱即用的硬件兼容性非常优秀**。

Arch Linux 不像 Ubuntu 那样进行过大量的测试，所以它不一定能在你的硬件上正常运行。

不过，正因为 Arch Linux 有着最新最强大的 Linux 内核包，所以有时它的表现要优于 Ubuntu。

如果你不太清楚自己硬件的兼容性，你最好请教一下周围的人，确保你在安装 Arch Linux 时不会出现别人已经遇到过的问题。

因此，选择 Ubuntu，你就可以高枕无忧了，除非你使用的是非常尖端的设备。

### 11、稳定性

如果你不想让你的系统崩溃，或是不想遇到错误，**Ubuntu 应该是更好的选择**.

Arch Linux 的话，情况就不好说了。更新之后，它可能会正常运行，也可能会大不如前。

Arch Linux 本身并不算稳定，你需要自行维护它，确保在自定义以及更新过程中不会出现故障。

### 再三考虑: 你该选哪个？

考虑到稳定性、兼容性、软件生态以及上手速度等因素，对于那些只想顺利完成工作而不想麻烦折腾的人来说，Ubuntu 是一个完美的选择。

而对那些为适应自己工作内容想要定制桌面体验，以及寻求最新功能和最强性能的用户来说，Arch Linux 最合适不过了。

如果你想探索未知，Arch Linux 可以给你带来非常奇妙的体验。但对于一些人来说，Arch Linux 使用起来可能比 Ubuntu 要困难许多。

那么，考虑到以上所有因素，**你觉得自己会选哪个？**期待你能在下方评论区留言。

### 常见问题解答：如果你还没决定到底用哪一个

可能有些人还会有一些问题，可以参考一下内容：

**Arch 比 Ubuntu 更好吗？**

对，也不对。就技术层面来讲，Arch Linux 确实更好，但是你也需要考虑它的稳定性、软件生态以及维护它所需要的学习时间。也就是说，在得出答案之前，你需要根据自己的喜好，再三考虑一番。

**哪个更快？ Ubuntu 还是 Arch？**

Arch Linux 更快，因为它安装体积极小。不过，根据你的配置不同，情况可能也会有所不同。

注意，Ubuntu 与 Arch Linux 相比，速度并不会差很多。只不过因为它开箱即用的包会更多，所以有些人会认为 Ubuntu 比较臃肿。

**我是不是应该从 Ubuntu 转到 Arch 呢？**

如果你想优化体验，想要一直获取最新最优秀的软件包，同时又不会担心稳定性，Arch Linux 会比较适合你。

如果你只是为了完成工作，需要的是一些基础功能，Ubuntu 就够用了。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-vs-arch/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[aREversez](https://github.com/aREversez)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/why-arch-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/ubuntu-vs-arch.jpg?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/install-arch-linux/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/try-ubuntu-install-ubuntu.jpeg?resize=800%2C530&ssl=1
[5]: https://itsfoss.com/install-gui-ubuntu-server/
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/arch-linux-boot-menu-install.png?resize=635%2C481&ssl=1
[7]: https://news.itsfoss.com/arch-new-guided-installer/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/arch-install-terminal.png?resize=800%2C279&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/ubuntu-20-04-ux.jpg?resize=800%2C407&ssl=1
[10]: https://itsfoss.com/kde-vs-gnome/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/arch-linux-gnome.png?resize=732%2C413&ssl=1
[12]: https://itsfoss.com/what-is-desktop-environment/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/arch-linux-filesystem.png?resize=800%2C149&ssl=1
[14]: https://itsfoss.com/best-linux-distributions/
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/ubuntu-software-center.png?resize=800%2C574&ssl=1
[16]: https://itsfoss.com/what-is-flatpak/
[17]: https://itsfoss.com/flatpak-guide/
[18]: https://itsfoss.com/pacman-command/
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/arch-install-terminal-software.png?resize=763%2C431&ssl=1
[20]: https://itsfoss.com/aur-arch-linux/
[21]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/sky-aur-install.png?resize=800%2C560&ssl=1
[22]: https://itsfoss.com/best-aur-helpers/
[23]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/ubuntu-utilities.png?resize=800%2C520&ssl=1
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/arch-linux-neofetch.png?resize=800%2C533&ssl=1
[25]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/itsfoss-community.jpg?resize=800%2C580&ssl=1
[26]: https://itsfoss.community/
[27]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/arch-wiki.png?resize=800%2C332&ssl=1
[28]: https://wiki.archlinux.org/
[29]: https://itsfoss.com/long-term-support-lts/
[30]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/ubuntu-info.png?resize=800%2C595&ssl=1
[31]: https://itsfoss.com/end-of-life-ubuntu/
[32]: https://itsfoss.com/rolling-release/
[33]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/arch-info.png?resize=800%2C573&ssl=1
[34]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/hardware-compatibility-illustration.png?resize=800%2C450&ssl=1
