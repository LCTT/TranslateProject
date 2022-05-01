[#]: subject: "Archinstall’s New Menu System Makes it Even Easier to Install Arch Linux"
[#]: via: "https://news.itsfoss.com/archinstall-menu/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Archinstall 新的菜单系统让安装 Arch Linux 更容易了
======

![][1]

去年的这个时候，Arch Linux [引入了一个引导式的安装程序][2]，使其安装过程更加简单。

你只需要输入 `archinstall`，就可以开始一步步的安装，而不需要自己全部定制。

即使你不是新手用户，它应该也能为你正常安装 Arch Linux 节省一些时间。你可以配置所有基本选项，无论是创建用户名/根用户，还是选择桌面、挑选软件包、选择音频服务器，等等。

如果你感兴趣的话，可以在我们的 [在 VirtualBox 里安装 Arch Linux 的指南][3]中看看 archinstall 的实际使用。

现在，archinstall v2.4.1 已发布，我们有了新的菜单系统和大量的技术变化。

让我们来看看它是如何工作的吧！

### 新菜单系统及无障碍改进

![][4]

新的菜单系统看起来更有条理了。

它是以 [simple-term-menu][5] 为基础建立的，simple-term-menu 是一个用于在命令行中创建交互式菜单的软件包。为了避免外部依赖，它与源代码捆绑，此处感谢 Ingo Meyer（开发者）。

另外还得感谢其他开发者，其中包括 [Werner Llácer][6] 和 [Daniel][7]，是他们编写了 1200 多行代码，才让这成为可能。

这个菜单系统也是无障碍的。你可以用数字键盘上的“*”把它切换到跟踪选择模式，这应该能让 espeakup 工作，正如人们所期望的那样。

在 archinstall 的未来版本中，它也会支持默认的跟踪模式。

在上面的截图中，你可能会注意到，它支持设置语言、键盘布局、内核、音频服务器、用户、网络和其他基本选项。

一旦你选择了硬盘，菜单将增加另一个选项，让你选择一个“磁盘布局”，你可以在其中选择文件系统的类型。

![][8]

同样，设置每一个选项时，你都可以调整更多细节，比如桌面环境的配置文件。

![][9]

默认情况下，它会启用一个 swap 分区。不过，你可以根据你的需要进行调整。总的来说，这应该是一个无缝的体验，所有的安装先决条件都以菜单形式呈现。

在此感谢我们团队中的 Sreenath，是他测试并提供了这些屏幕截图。

![][10]

除了这些变化之外，你还可以期待以下改进：

  * 如果你选择 btrfs 作为文件系统，BTRFS 压缩选项将被添加为一个选项。
  * Archinstall 现在支持同时进行多个网卡配置的手动配置。
  * 安装程序可以通过 archinstall.Installer() 跟踪哪些软件包已经安装完毕。

要查看所有的技术变化和错误修复，你可以参考 [GitHub 上的发布说明][11]。

**你可以等待最新的 ISO（计划在 5 月 1 日发布），或者从 GitHub 上下载并自己尝试。**

你试过 Arch Linux 上的原始安装向导吗？还是说，相较于使用安装程序，你更偏向于自己手动配置一切？请在评论区分享你的想法吧！

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/archinstall-menu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/wp-content/uploads/2022/04/archinstall-new-menusystem-makes-easier-to-install.png
[2]: https://news.itsfoss.com/arch-linux-easy-install/
[3]: https://itsfoss.com/install-arch-linux-virtualbox/
[4]: https://news.itsfoss.com/wp-content/uploads/2022/04/archinstall-new-menu.png
[5]: https://github.com/IngoMeyer441/simple-term-menu
[6]: https://github.com/wllacer
[7]: https://github.com/svartkanin
[8]: https://news.itsfoss.com/wp-content/uploads/2022/04/archinstall-filesystem.jpg
[9]: https://news.itsfoss.com/wp-content/uploads/2022/04/archinstall-profiles-1024x226.jpg
[10]: https://news.itsfoss.com/wp-content/uploads/2022/04/archinstall-config.png
[11]: https://github.com/archlinux/archinstall/releases/tag/v2.4.1
