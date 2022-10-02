[#]: subject: "How to Install Visual Studio Code Extensions"
[#]: via: "https://itsfoss.com/install-vs-code-extensions/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "CoWave-Fall"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15100-1.html"

如何安装 VSCode 扩展
======

![](https://img.linux.net.cn/data/attachment/album/202210/02/232225yzgzrymdrepj2mpa.jpg)

> 通过图形界面和命令行两种方法，了解如何在 VSCode 中搜索和安装扩展。

微软的 [Visual Studio Code][1]（VSCode）可能是最流行的 [开源代码编辑器][2]，仅次于 Vim（当然）。

VSCode 通过提供几乎所有类似 IDE 的功能，提供了令人惊叹的“开箱即用”体验。 但总有一些事情是你希望 VSCode 能够另外做到的。_正所谓“邻家芳草绿，隔岸风景好”_ : )

你可以在 Visual Studio Code <ruby>[市场][3]<rt>Marketplace</rt></ruby> 找到 VSCode 扩展插件。在 VSCode 市场上发布的扩展插件在发布之前会进行病毒扫描，所以这些扩展可以 [信任][4]。

### 在 VSCode 中安装扩展插件

你不需要访问 VSCode <ruby>市场<rt>Marketplace</rt></ruby> 网站就可以安装扩展插件。也就是说，你可以直接从 VSCode 本身安装和管理扩展插件。

我希望你已经在你使用的操作系统（比如 [在 Linux][5]）上 安装了 VSCode。

打开 VSCode，最左侧是活动栏。活动栏上的最后一个按钮就是“扩展”按钮。点击它之后你会看到大量可安装的扩展。

![访问 VSCode 中的扩展选项卡][6]

你也可以按快捷键组合 `Ctrl + Shift + X` 来启动扩展栏的侧面面板。

如果你还没有安装任何扩展的话，你会看到 VSCode 市场上最流行的扩展列表。

#### 找到并安装某个扩展（图形界面方法）

现在是时候尝试一下 Linux 人谈论的 `vim` 了（鼓动的语气）; )

开玩笑啦。让我们安装一些对我们初学者更友好，可以轻松使用而且无需太多练习的扩展吧。

从最流行的扩展列表中单击 “Visual Studio IntelliCode” （①）扩展。

![如何安装 Visual Studio IntelliCode 等扩展][7]

点击 “<ruby>安装<rt>Install</rt></ruby>” 按钮（②）即可安装 “Visual Studio IntelliCode” 扩展。这个扩展会在你编写代码时为你提供 AI 预测的建议。

安装后，你可以充分利用此扩展。试试用你喜欢的编程语言输入一段代码，然后看看 AI 的自动完成功能是否顺利运行而且没有拖慢你的工作进程。

![在 Visual Studio Code 中管理已安装的扩展][8]

如果你不喜欢某个已安装的扩展插件，你只需单击 “<ruby>卸载<rt>Uninstall</rt></ruby>” 按钮（②）即可完全删除不需要的扩展插件。

如果你安装了多个扩展插件，并且你觉得其中某个扩展插件给你带来了问题——比如说突然崩溃；你只需点击 “<ruby>禁用<rt>Disable</rt></ruby>” 按钮（①）即可禁用一个（或多个）扩展插件，并检查扩展插件 _甲_ 是否在起作用，或者它是扩展插件 _乙_，还是完全不同的东西。

考虑到扩展删除和重新安装需要很长时间，当你安装了多个扩展时，禁用扩展会很方便。

#### 另外方法：使用终端安装扩展

你知道你可以从终端安装 VSCode 扩展吗？不过，现在你知道了！

要从你的终端安装扩展程序，你需要知道扩展程序名称和发布者名称，再按照 `发布者名称.扩展程序名称` 的顺序找到它。比如说，如果你想安装 “Visual Studio IntelliCode” 这个扩展（前面提到的），它的名称就是 `VisualStudioExptTeam.vscodeintellicode`。

要找出扩展用于标识的唯一名称（ID），首先要在你的浏览器中 [访问 VSCode 市场][9]。

![VSCode 市场的截图][10]

然后搜索某个扩展，在本教程中，我将以安装 “Visual Studio IntelliCode” 这个扩展为例。下一步，打开你要安装的扩展程序的页面。

![搜索Visual Studio IntelliCode并打开扩展网页][11]

打开扩展程序的网页后，你将看到一个代码块。下面的截图突出标示了扩展程序的 ID。

![VSCode 扩展的 ID][12]

一旦你有了想要安装的扩展的 ID —— 在这种情况下是 `VisualStudioExptTeam.vscodeintellicode`，你可以通过在终端中运行以下命令来继续。

```
code --install-extension VisualStudioExptTeam.vscodeintellicode
```

与图形界面一样，命令行界面也允许你安装、禁用、删除和管理扩展。

可以通过运行以下命令查看已安装的所有扩展的列表。

```
code --list-extensions
```

要禁用单个扩展，请运行以下命令：

```
code --disable-extension <在这里输入扩展的ID>
```

如果要禁用所有扩展，可以运行以下命令：

```
code --disable-extensions
```

上述命令将禁用 **所有** 已安装的扩展。这将帮助你判断导致问题的是插件，还是 VSCode 本身。

现在，如果你想完全删除任何某个扩展，请运行以下命令：

```
code --uninstall-extension <在这里输入扩展的ID>
```

### 总结

我发现使用 VSCode 安装扩展要容易得多。毕竟，它直接在我编辑器左边的侧栏中。

一旦你对 VSCode 的操作得心应手，也许可以看看这篇文章，[VSCode 实用快捷键][13] 可能会帮助你提高工作效率！

写代码顺利，新朋友！ : )

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vs-code-extensions/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[泠知落汐](https://github.com/CoWave-Fall)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://code.visualstudio.com/
[2]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[3]: https://marketplace.visualstudio.com/VSCode
[4]: https://code.visualstudio.com/docs/editor/extension-marketplace#_can-i-trust-extensions-from-the-marketplace
[5]: https://itsfoss.com/install-visual-studio-code-ubuntu/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/01-all-extensions-1.webp?resize=800%2C450&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/02-select-intellicode-1.webp?resize=800%2C450&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/03-intellicode-installation-done-1.webp?resize=800%2C450&ssl=1
[9]: https://marketplace.visualstudio.com/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/visual_studio_code_marketplace.webp?resize=800%2C450&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/visual_stuido_code_ext_search.webp?resize=800%2C450&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/vs_code_extension_identifier.webp?resize=800%2C450&ssl=1
[13]: https://itsfoss.com/vs-code-shortcuts/
