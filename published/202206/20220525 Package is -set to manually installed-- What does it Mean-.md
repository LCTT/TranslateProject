[#]: subject: "Package is “set to manually installed”? What does it Mean?"
[#]: via: "https://itsfoss.com/package-set-manually-installed/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14675-1.html"

软件包 “被标记为手动安装”？这是什么意思？
======

![](https://img.linux.net.cn/data/attachment/album/202206/05/154517uqnqdfi79yqidi79.jpg)

如果你使用 `apt` 命令在终端中安装软件包，你将看到各种输出。

如果你注意并查看输出，有时你会注意到一条消息：

```
package_name set to manually installed
```

你有没有想过这条消息是什么意思，为什么你没有在所有包上看到它？让我在本篇中分享一些细节。

### 理解 “软件包被标记为手动安装”

当你尝试安装已安装的库或开发包时，你会看到此消息。此依赖包是与另一个包一起自动安装的。如果删除了主包，则使用 `apt autoremove` 命令删除依赖包。

但是由于你试图显式安装依赖包，你的 Ubuntu 系统认为你需要这个包独立于主包。因此，该软件包被标记为手动安装，因此不会自动删除。

不是很清楚，对吧？以 [在 Ubuntu 上安装 VLC][1] 为例。

由于主 VLC 包依赖于许多其他包，因此这些包会自动安装。

![installing vlc with apt ubuntu][2]

如果你检查名称中包含 `vlc` 的 [已安装软件包列表][3]，你会看到除了 VLC，其余都标记为“自动”。这表明这些软件包是（跟着 vlc）自动安装的，当 VLC 被卸载时，它们将使用 `apt autoremove` 命令自动删除。

![list installed packages vlc ubuntu][4]

现在假设你出于某种原因考虑安装 `vlc-plugin-base`。如果你在其上运行 `apt install` 命令，系统会告诉你该软件包已安装。同时，它将标记从自动更改为手动，因为系统认为在尝试手动安装表明你明确需要此 `vlc-plugin-base`。

![package set manually][5]

可以看到它的状态已经从 `[installed,automatic]` 变成了 `[installed]`。

![listing installed packages with vlc][6]

现在，让我删除 VLC 并运行 `autoremove` 命令。你可以看到 `vlc-plugin-base` 不在要删除的软件包列表中。

![autoremove vlc ubuntu][7]

再次检查已安装软件包的列表。`vlc-plugin-base` 仍然安装在系统上。

![listing installed packages after removing vlc][8]

你可以在这里看到另外两个与 VLC 相关的包。这些是 `vlc-plugin-base` 包的依赖项，这就是为什么它们也存在于系统上但标记为 `automatic` 的原因。

我相信现在有了这些例子，事情就更清楚了。让我给你一个额外的技巧。

### 将包重置为自动

如果包的状态从自动更改为手动，你可以通过以下方式将其设置回自动：

```
sudo apt-mark auto package_name
```

![set package to automatic][9]

### 结论

这不是一个重大错误，也不会阻止你在系统中进行工作。但是，了解这些小事会增加你的知识。

**好奇心可能会害死猫，但它会让企鹅变得更聪明**。这是为这篇原本枯燥的文章增添幽默感的原始引述 : )

如果你想阅读更多这样的文章，这些文章可能看起来微不足道，但可以帮助你更好地了解您的 Linux 系统，请告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/package-set-manually-installed/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/install-latest-vlc/
[2]: https://itsfoss.com/wp-content/uploads/2022/05/installing-vlc-with-apt-ubuntu-800x489.png
[3]: https://itsfoss.com/list-installed-packages-ubuntu/
[4]: https://itsfoss.com/wp-content/uploads/2022/05/list-installed-packages-vlc-ubuntu-800x477.png
[5]: https://itsfoss.com/wp-content/uploads/2022/05/package-set-manually.png
[6]: https://itsfoss.com/wp-content/uploads/2022/05/listing-installed-packages-with-vlc.png
[7]: https://itsfoss.com/wp-content/uploads/2022/05/autoremove-vlc-ubuntu.png
[8]: https://itsfoss.com/wp-content/uploads/2022/05/listing-installed-packages-after-removing-vlc.png
[9]: https://itsfoss.com/wp-content/uploads/2022/05/set-package-to-automatic.png
