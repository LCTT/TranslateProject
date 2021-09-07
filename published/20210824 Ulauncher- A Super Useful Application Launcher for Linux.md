[#]: subject: "Ulauncher: A Super Useful Application Launcher for Linux"
[#]: via: "https://itsfoss.com/ulauncher/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13743-1.html"

Ulauncher：一个超级实用的 Linux 应用启动器
======

> Ulauncher 是一个快速应用启动器，支持扩展和快捷方式，帮助你在 Linux 中快速访问应用和文件。

应用启动器可以让你快速访问或打开一个应用，而无需在应用菜单图标上徘徊。

在默认情况下，我发现 Pop!_OS 的应用启动器超级方便。但是，并不是每个 Linux 发行版都提供开箱即用的应用启动器。

幸运的是，有一个你可以在大多数流行的发行版中添加应用启动器的方案。

### Ulauncher：开源应用启动器

![][1]

Ulauncher 是一个使用 Python 还有 GTK+ 构建的快速应用启动器。

它提供了相当数量的自定义和控制选项来进行调整。总的来说，你可以调整它的行为和体验以适应你的喜好。

让我来说一下你可以期待它的一些功能。

### Ulauncher 功能

Ulauncher 中的选项非常非常易于访问且易于定制。一些关键的亮点包括：

  * 模糊搜索算法可以让你即使拼错了，也能找到应用
  * 可以记住你在同一会话中最后搜索的应用
  * 显示经常使用的应用（可选）
  * 自定义颜色主题
  * 预设颜色主题，包括一个黑暗主题
  * 召唤启动器的快捷方式可以轻松定制
  * 浏览文件和目录
  * 支持扩展，以获得额外的功能（表情符号、天气、速度测试、笔记、密码管理器等）
  * 浏览谷歌、维基百科和 Stack Overflow 等网站的快捷方式

它几乎提供了你在一个应用启动器中所期望的所有有用的能力，甚至更好。

### 如何在 Linux 中使用 Ulauncher？

默认情况下，首次从应用菜单中打开应用启动器后，你需要按 `Ctrl + Space` 打开应用启动器。

输入以搜索一个应用。如果你正在寻找一个文件或目录，输入以 `~` 或者 `/` 开始。

![][2]

有一些默认的快捷键，如 `g XYZ`，其中 “XYZ” 是你想在谷歌中搜索的搜索词。

![][3]

同样，你可以通过 `wiki` 和 `so` 快捷键，直接在维基百科或 Stack Overflow 搜索。

在没有任何扩展的情况下，你也可以直接计算内容，并将结果直接复制到剪贴板。

![][4]

这在快速计算时应该很方便，不需要单独启动计算器应用。

你可以前往它的 [扩展页面][5]，浏览有用的扩展，以及指导你如何使用它的截图。

要改变它的工作方式，启用显示经常使用的应用，并调整主题，请点击启动器右侧的齿轮图标。

![][6]

你可以把它设置为自动启动。但是，如果它在你的支持 Systemd 的发行版上不工作，你可以参考它的 GitHub 页面，把它添加到服务管理器中。

这些选项是非常直观，且易于定制，如下图所示。

![][7]

### 在 Linux 中安装 Ulauncher

Ulauncher 为基于 Debian 或 Ubuntu 的发行版提供了一个 deb 包。如果你是 Linux 新手，你可以了解一下 [如何安装 Deb 文件][8] 。

在这两种情况下，你也可以添加它的 PPA，并通过终端按照下面的命令来安装它：

```
sudo add-apt-repository ppa:agornostal/ulauncher
sudo apt update
sudo apt install ulauncher
```

你也可以在 [AUR][9] 中找到它，用于 Arch 和 Fedora 的默认仓库。

对于更多信息，你可以前往其官方网站或 [GitHub 页面][10]。

- [Ulauncher][11]

Ulauncher 应该是任何 Linux 发行版中一个令人印象深刻的补充。特别是，如果你想要一个像 Pop!_OS 提供的快速启动器的功能，这是一个值得考虑的奇妙选择。

你试过 Ulauncher了吗？欢迎你就如何帮助你快速完成工作分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ulauncher/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher.png?resize=800%2C512&ssl=1
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-directory.png?resize=800%2C503&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-google.png?resize=800%2C449&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-calculator.png?resize=800%2C429&ssl=1
[5]: https://ext.ulauncher.io
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-gear-icon.png?resize=800%2C338&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/08/ulauncher-settings.png?resize=800%2C492&ssl=1
[8]: https://itsfoss.com/install-deb-files-ubuntu/
[9]: https://itsfoss.com/aur-arch-linux/
[10]: https://github.com/Ulauncher/Ulauncher/
[11]: https://ulauncher.io
