[#]: subject: "XeroLinux: A Beautiful Arch-based Linux With Excellent Customizability by Default"
[#]: via: "https://itsfoss.com/xerolinux/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

XeroLinux：一个漂亮的基于 Arch 的 Linux，默认具有出色的可定制性
======

Arch Linux 是那些希望对他们的操作系统有更多控制权的 Linux 用户的一个流行选择。

虽然许多有经验的用户对 Arch Linux 进行了定制，以提供一些最好的用户体验（就其用户界面而言），但对于新的 Linux 用户来说，这可能是一个挑战。

如果你不了解 Arch Linux 的具体情况，你可能想读一下 [Ubuntu 与 Arch Linux 比较][1]文章。

然而，一些[基于 Arch 的发行版][2]旨在提供一个更容易上手的体验，而不会剥夺控制权。

**XeroLinux** 是我们最近遇到的其中一个选择。

### XeroLinux：又一个基于 Arch 的发行版

![][3]

[XeroLinux][4] 是 Steve，又名 [TechXero][5]，的一个个人项目，旨在提供一个“眼花缭乱”的 Arch Linux 版本。

请注意，这是一个充满激情的项目，而不是一个由庞大的贡献者团队支持的主流发行版（尚未）。你应该在虚拟机或测试机上试用它，然后再把它替换到你的主系统上。

在这里，我们以 XeroLinux 为特色，对其愉快的开箱即用体验和一些更令人兴奋的事情进行了快速评论。

### **安装的简易性**

XeroLinux 使用 [Calamares 安装程序][6]来让你轻松地安装 Linux 发行版，而不需要依赖终端或[引导式 Arch 安装程序][7]。

虽然安装体验与流行的 Linux 发行版相似，但你可以在安装时选择图形驱动、特定的 Linux 内核和工具。

![][8]

你可以安装 System76 的电源管理驱动，并启用对 Nvidia Optimus Manager 的支持，为你的笔记本电脑切换显卡。有趣！

你还可以在安装时选择密码管理器、主题、浏览器和各种不同的软件包，这应该会使事情变得很方便。

考虑到你以选择的形式得到了所有的基本选项，你在安装后没有太多可担心的。

![][9]

当你选择了需要的东西，只需重新启动并开始使用桌面。

### **用户体验**

XeroLinux 的开箱即用的体验令人印象深刻。桌面的整体外观和感觉包括许多新的功能补充，如显示 CPU 使用情况、网络速度等的小工具。

它还支持全局菜单，使应用程序窗口看起来更干净，为 macOS 用户切换到 Linux 提供了舒适的体验。

![][10]

通过所有预装的应用，你可以轻松地安装新的软件，卸载现有的工具并进行各种操作。

它同时具有 pamac 和 [Synaptic 包管理器][11]（可在安装时选择）。因此，你可以获得大量的软件工具，你可以通过它们中的任何一个轻松安装。

其他产品包括两个文件管理器（Dolphin 和 Thunar）、Yakuake 终端、Spectacle 屏幕截图、KWrite、Konsole 等主要 KDE 版本中的其他 KDE 工具。

如果你不喜欢 Yakuake 终端模拟器，请参考我们的[终端模拟器列表][12]，找到它的替代品。

![][13]

不要忘了，你会得到一个定制的锁屏（或登录也没），看起来很不错!

![][14]

当你启动系统时，你还会注意到一个 **XeroLinux 配置工具**。它可以让你快速执行一些基本任务，比如检查 NVIDIA 显卡、安装 KVM/QEMU、禁用自动启动、安装 KDE 窗口平铺，以及其他一些配置，如下图所示。

![][15]

### **可定制性**

XeroLinux 在其主版本中采用了 KDE 桌面环境。因此，你自然会有无尽的定制选项。

最好是参考我们的 [KDE 定制指南][16]来获得帮助。

除此之外，你还可以看到 [Latte Dock][17]，你可以根据自己的喜好进行定制和调整。

![][18]

有几个选项可以定制 dock，确保你仔细调整设置，以免看起来很奇怪。

![][19]

此外，你会得到 [Kvantum Manager][20]，可以帮助你安装外部主题。

如果这还不够，开发者还提供了一些 Rice/Themes 和 Grub 主题，你可以在[官方网站][4]或 [GitHub 仓库][21]上找到所列的主题。

换句话说，开发者提供的一些脚本可以帮助你进行改造，但请注意，最好是自己定制，这样就不会出现其他问题。

### **桌面环境选项**

主版本使用的是 KDE，但如果你想尝试一下，你也有另一个 XFCE 变体。

XFCE版是为旧系统量身定做的（或者如果你需要节省系统资源）。

它最初还提供了一个 GNOME 版本，但由于每次更新都会出现扩展失效的问题，所以它放弃了对它的支持。如果你对桌面环境感到好奇，你可能想通过我们的 [KDE Plasma vs GNOME][22] 文章来了解它们的区别。

### **性能**

考虑到它具有最新可用的 [Linux Kernel 5.16][23]，它应该可以在各种硬件配置下正常工作。

但是，我还没有在裸机上测试过它。 根据我虚拟机的使用经验，它运行良好，没有任何特殊问题。

以下是其 KDE 版本的资源使用情况：

![][24]

使用它的 XFCE 变体时，你可能会注意到较低的资源使用率。

### 你应该试试 XeroLinux 吗？

我喜欢 XeroLinux 的外观和感觉。

不仅限于此，你还可以获得多种软件包选择，并且能够在安装时选择最好的 Linux。

[尝试 XeroLinux][4]

如果你在安装时就知道自己需要什么，那么它应该是一个有吸引力的基于 Arch 的 Linux 发行版。

你试过 XeroLinux 了吗？ 在下面的评论中让我知道你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/xerolinux/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-vs-arch/
[2]: https://itsfoss.com/arch-based-linux-distros/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-home.jpg?resize=800%2C450&ssl=1
[4]: https://xerolinux.xyz/
[5]: https://twitter.com/TechXero
[6]: https://calamares.io/
[7]: https://itsfoss.com/install-arch-linux-virtualbox/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-install-1.png?resize=800%2C555&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-install.png?resize=800%2C555&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-ui.jpg?resize=800%2C398&ssl=1
[11]: https://itsfoss.com/synaptic-package-manager/
[12]: https://itsfoss.com/linux-terminal-emulators/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-utilities.jpg?resize=800%2C652&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-lockscreen.jpg?resize=800%2C546&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-configuration-tool.jpg?resize=800%2C480&ssl=1
[16]: https://itsfoss.com/kde-customization/
[17]: https://github.com/KDE/latte-dock
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-latte-dock.png?resize=800%2C134&ssl=1
[19]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-latte-dock-options.jpg?resize=800%2C570&ssl=1
[20]: https://store.kde.org/p/1005410/
[21]: https://github.com/xerolinux/xero-layan-git
[22]: https://itsfoss.com/kde-vs-gnome/
[23]: https://news.itsfoss.com/linux-kernel-5-16/
[24]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/xerolinux-resource.png?resize=800%2C468&ssl=1