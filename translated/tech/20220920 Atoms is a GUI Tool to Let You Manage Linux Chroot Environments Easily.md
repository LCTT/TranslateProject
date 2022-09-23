[#]: subject: "Atoms is a GUI Tool to Let You Manage Linux Chroot Environments Easily"
[#]: via: "https://itsfoss.com/atoms-chroot-tool/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Atoms 是一个可以让你轻松管理 Linux Chroot 环境的 GUI 工具
======
chroot 环境为你在 Linux 中进行测试提供了隔离。你无需费心创建虚拟机。相反，如果你想测试应用或其他东西，请创建一个允许你选择不同根目录的 chroot 环境。

因此，使用 chroot，你可以在不让应用访问系统其余部分的情况下进行测试。你安装的任何应用或你尝试的任何东西都会被限制在该目录中，并且不会影响操作系统的功能。

chroot 有它的好处，这就是为什么它是为各种用户（尤其是系统管理员）测试事物的便捷方式。

不幸的是，所有这些都通过 Linux 终端运行。如果你可以有一个图形用户界面来让事情变得简单一些呢？这就是“**Atoms**”的用武之地。

### Atoms：管理 Linux Chroot 的 GUI

![atoms][1]

Atoms 是一个 GUI 工具，它可以方便地创建和管理 Linux chroot 环境。

它还支持与 [Distrobox][2] 的集成。因此，你还可以使用 Atoms 管理容器。

但是，开发人员提到该工具不提供与 Podman 的无缝集成，并解释其用途：“*它的目的只是允许用户在新环境中打开 shell，无论是 chroot 还是容器。”*

如果你正在寻找这样的东西，你可能需要试试 [pods][3]。

### Atoms 的特性

![atoms options][4]

Atoms 是一个简单的 GUI 程序，可让你为多个受支持的 Linux 发行版创建 chroot 环境。

让我重点介绍支持的发行版及其提供的功能：

* 浏览创建的 chroot(s) 文件。
* 能够选择要暴露的挂载点。
* 访问控制台。
* 支持的 Linux 发行版包括 Ubuntu、Alpine Linux、Fedora、Rocky Linux、Gentoo、AlmaLinux、OpenSUSE、Debian 和 CentOS。

It is incredibly easy to use. Creating an atom from within the app is a one-click process.
它非常易于使用。从应用中创建 atom 只需一键。

你所要做的就是为 atom 命名，然后从可用选项列表中选择 Linux 发行版（Ubuntu 作为上面截图中的选择）。它会在几分钟内下载镜像并为你设置 chroot 环境，如下所示。

![atom config][5]

完成后，你可以访问选项启动控制台以管理 chroot 环境或自定义/删除它。

![atoms option][6]

要访问控制台，请转到另一个选项卡菜单。非常无缝的体验，并且运行良好，至少对于我测试过的 Ubuntu 而言。

![atoms console][7]

此外，你可以分离控制台以将其作为单独的窗口进行访问。

![atoms detach console][8]

### 在 Linux 上安装 Atom

你可以使用 [Flathub][9] 上提供的 Flatpak 包在任何 Linux 发行版上安装 Atoms。如果你是 Linux 新手，请遵循我们的 [Flatpak 指南][10]。

**注意：** 最新的稳定版本 **1.0.2** 只能通过 Flathub 获得。

要探索其源代码和其他详细信息，请访问其 [GitHub 页面][11]。

### 总结

Linux 命令行功能强大，你几乎可以使用这些命令执行任何操作。但并不是每个人都对它感到满意，因此像 Atoms 这样的工具通过提供 GUI 使其更加方便。

Atoms 并不是唯一的一种。还有 [Grub Customizer][12] 可以更轻松地更改 [Grub][13] 配置，这可以通过命令行完成。

我相信还有更多这样的工具。

*你如何看待使用像 Atom 这样的 GUI 程序来管理 Chroot 环境？在下面的评论中分享你的想法。*

--------------------------------------------------------------------------------

via: https://itsfoss.com/atoms-chroot-tool/

作者：[Ankush Das][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/wp-content/uploads/2022/09/atoms.png
[2]: https://itsfoss.com/distrobox/
[3]: https://github.com/marhkb/pods
[4]: https://itsfoss.com/wp-content/uploads/2022/09/atoms-options.png
[5]: https://itsfoss.com/wp-content/uploads/2022/09/atom-config.png
[6]: https://itsfoss.com/wp-content/uploads/2022/09/atoms-option.png
[7]: https://itsfoss.com/wp-content/uploads/2022/09/atoms-console.png
[8]: https://itsfoss.com/wp-content/uploads/2022/09/atoms-detach-console.png
[9]: https://flathub.org/apps/details/pm.mirko.Atoms
[10]: https://itsfoss.com/flatpak-guide/
[11]: https://github.com/AtomsDevs/Atoms
[12]: https://itsfoss.com/grub-customizer-ubuntu/
[13]: https://itsfoss.com/what-is-grub/
