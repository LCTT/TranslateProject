[#]: subject: "Visual Studio Code or Atom? Which Code Editor Should You Use?"
[#]: via: "https://itsfoss.com/visual-studio-code-vs-atom/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13944-1.html"

VS Code 还是 Atom？你应该选择哪个？
======

![](https://img.linux.net.cn/data/attachment/album/202111/01/231806jk4mky6gjmrw4mgm.png)

如今，找到一个 [好的开源代码编辑器][1] 并不难，随便选择一个就可以了。

微软的 [VS Code][2] 和 GitHub 的 [Atom][3] 是两个最流行的、功能丰富的、类似于 IDE 的代码编辑器，都拥有庞大的用户群和粉丝。

VS Code 和 Atom 现在都属于微软，因为 Atom 的原开发者 GitHub 现在属于微软。这两个都有一个有吸引力的、现代的 UI，有一个漂亮的原生黑暗主题。两个编辑器都使用 [Electron][4] 作为用户界面。

相似的地方很多，这就是为什么你很容易在它们中间选择时感到迷惑。

如果你不能下定决心，想在 VS Code 和 Atom 之间进行一番比较和选择，这篇文章应该可以帮助你。

### VS Code

![VS Code 的用户界面与拥挤的项目界面][5]

[VS Code][2] 是开源的现代编辑器之一。它的用户群爆炸性地增长，因为它具有类似 IDE 的功能，但仍然保持相对较轻的资源占用。

VS Code 是由微软制作的，可用于 Linux、macOS 和 Windows。微软于 2015 年 11 月 18 日在 [GitHub][6] 上根据 MIT 许可发布了 VS Code 的 _大部分_ 源代码。

VS Code 的开发者对 Electron 进行了一些奇妙的优化，使其尽可能的轻量级和高效。由于 Electron 应用程序可以在大多数操作系统上运行，Linux、macOS 和 Windows 的用户都可以从这些优化中受益。

[在 Linux 上安装 VS Code][7] 也相当简单。事实上，它在许多发行版的软件中心都有。

#### 为什么你应该选择 VS Code？

  * 那些从一开始就想获得接近 IDE 的功能，而又不想摆弄他们的代码编辑器的人，[通常] 会选择 VS Code 。
  * 即使是基于 Electron，VS Code 与其他 Electron 应用（如 GitHub 的 Atom）相比，开销也非常小。
  * 更多开箱即用的功能，如微软的 IntelliSense 自动补完、Git 集成、Markdown 支持等等。
  * 插件可以只用来增加功能、主题和支持新的语言；而这种插件约束确保编辑器的核心在增加新插件后仍保持熟悉。

[由微软分发的][8] 二进制版本仍然是专有的免费软件。[VSCodium][9] 建立在 VS Code 的公开源代码之上。然而，关于 VSCodium 的讨论超出了本文的范围，如果你想获得 VS Code 提供的功能，而又没有任何专有元素的话，可以考虑将其作为 VS Code 的一个可行的替代品。

## Atom

![Atom 编辑器的用户界面][10]

[GitHub 的 Atom][3] 是另一个自由开源的代码编辑器，可用于 Linux、macOS 和 Windows。Atom 是一个使用 JavaScript 通过 Electron 制作的桌面应用程序，用于轻松开发软件包。

Atom 的源代码是根据 MIT 许可发布 [在 GitHub 上][11] 的。由于 Atom 是 GitHub 的产品，因此它嵌入了 Git Control。

Atom 被称为“<ruby>可魔改的<rt>hackable</rt></ruby> 21 世纪文本编辑器”，因为它可以使用 HTML、CSS 和 JS 完全定制。

像 VS Code 一样，你可以轻松地在其他平台和 [Linux 上安装 Atom][12] 。

#### 选择 Atom 的理由

  * Atom 是那些想要一个基础的编辑器，并希望在其上进行开发的人的首选，因为 Atom 的可魔改性质。
  * 内置了 Git 和完整的 GitHub 集成；考虑到它是由 GitHub 开发的，这并不令人惊讶。
  * 从应用程序中非常容易搜索、安装和升级 [Atom 的插件][13]。
  * 可用的 Atom 插件是非常可扩展的，甚至可以完全改变编辑器的功能，并最终创造出几乎一个新的编辑器；它确实是“可魔改”的。
  * Atom 的二进制版本和它的源代码是完全开源的（不像 VS Code 的二进制版本包含专有部分+遥测）。
  * 你可以 [把 Atom 从一个代码编辑器变成 IDE][14]，有更智能的上下文自动完成、代码导航功能、文档格式化等。

### 总结

Atom 和 VS Code 都是建立在 Electron 之上的。但是微软在 VS Code 上做了更多的优化，使其尽可能的轻量化。

在这一点上，VS Code 就像 Ubuntu，几乎所有的东西都开箱即用。而 Atom 就像 Arch，精简，而极易魔改（可扩展）。

Atom 和 VS Code 在技术上都隶属于微软，最终它们会殊途同归。因此，最好是使用你的社区（网页开发/软件开发）所倾向的编辑器，并铺平前进的道路。也许你最终会选择 Vim！

--------------------------------------------------------------------------------

via: https://itsfoss.com/visual-studio-code-vs-atom/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
[2]: https://code.visualstudio.com/
[3]: https://atom.io/
[4]: https://www.electronjs.org/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/04_visual_studio_code.png?resize=800%2C544&ssl=1
[6]: https://github.com/microsoft/vscode
[7]: https://itsfoss.com/install-visual-studio-code-ubuntu/
[8]: https://code.visualstudio.com/Download
[9]: https://vscodium.com/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/05_atom.png?resize=800%2C527&ssl=1
[11]: https://github.com/atom/atom
[12]: https://itsfoss.com/install-atom-ubuntu/
[13]: https://itsfoss.com/install-packages-in-atom/
[14]: https://ide.atom.io/
