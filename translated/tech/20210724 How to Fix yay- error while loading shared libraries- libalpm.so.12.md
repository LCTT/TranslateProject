[#]: subject: "How to Fix yay: error while loading shared libraries: libalpm.so.12"
[#]: via: "https://www.debugpoint.com/2021/07/yay-error-libalpm-so-12/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何修复 yay: error while loading shared libraries: libalpm.so.12
======
这篇快速指南是为了帮助你修复 yay error: while loading shared libraries: libalpm.so.12.

如果你在系统中运行 [Arch Linux][1] 的时间更长，那么由于其滚动发布性质以及你的硬件支持，程序可能会损坏。 如果你使用 AUR Helper Yay，那么有时，由于其他软件包的多次安装升级，yay 可能会损坏。

YAY helper 是非常稳定的，但有时它会被搞乱，你不能使用它进行任何安装，直到你修复它。而其中一个令人头疼的错误是这样的：

```
yay: error while loading shared libraries: libalpm.so.12: cannot open shared object file: No such file or directory
```

这个错误特别是在升级到 pacman 6.0 后出现的，因为共享库不兼容。

![error while loading shared libraries - yay][2]

### 如何解决 yay: error while loading shared libraries: libalpm.so.12

* 这个错误只能通过完全卸载 yay 来解决，包括它的依赖。
* 然后重新安装 yay。

* 没有其他方法来解决这个错误。

* 我们已经有一个指南[如何安装 Yay][3]，然而，以下是修复的步骤。
* 从 AUR 克隆 yay 仓库并构建。在终端窗口中依次运行以下命令。

```
cd /tmp
git clone 'https://aur.archlinux.org/yay.git'
cd /tmp/yay
makepkg -si
cd ~
rm -rf /tmp/yay/
```

安装完成后，你可以尝试运行给你带来这个错误的命令。然后就完成了。如果你仍然有这个错误，请在下面的评论区告诉我。

很多人都遇到了这个问题，网络上有[几个讨论][4]。以上是解决这个错误的唯一办法。而且我在任何地方都找不到这个问题的确切根源，除了它是在 pacman 6.0 更新后开始的。

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2021/07/yay-error-libalpm-so-12/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://archlinux.org/
[2]: https://www.debugpoint.com/wp-content/uploads/2021/07/error-while-loading-shared-libraries-yay.jpg
[3]: https://www.debugpoint.com/2021/01/install-yay-arch/
[4]: https://github.com/Jguer/yay/issues/1519
