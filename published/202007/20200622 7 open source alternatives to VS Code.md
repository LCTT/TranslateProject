[#]: collector: (lujun9972)
[#]: translator: (nophDog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12382-1.html)
[#]: subject: (7 open source alternatives to VS Code)
[#]: via: (https://opensource.com/article/20/6/open-source-alternatives-vs-code)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

VS Code 的 7 个开源替代品
======

> 为了避免使用微软版本的 VS Code，我们需要另行选择一个开源的代码编辑器。

![](https://img.linux.net.cn/data/attachment/album/202007/05/112348n834svpa48v08vsa.png)

Visual Studio Code，也叫 VS Code，是一个跨平台代码编辑器，通用于 Linux、Windows 以及 macOS。它既能编辑简单文本，也能像集成开发环境（IDE）一样管理整个代码库。它可以通过插件进行扩展，并且已经被证明是一个可靠的文本编辑器，很轻松地就击败了非开源的强大竞品编辑器。

微软以开源的方式发布了 VS Code，但是你从微软下载的版本其实并不是开源的。然而，你仍有办法以开源的方式使用 VS Code，或者直接选择其它的开源替代品。

### 以开源的方式构建 VS Code

你可以在 [GitHub][2] 获得 VS Code 的源代码。然而当你 [从微软][3] 下载 VS Code 时，你会发现它是基于 [微软软件许可证][4] 授权的。这并不是一个开源许可证。其区别在于构建过程。

Chris Dias 是微软 VS Code 项目开发者之一，他对 VS Code [作了一个对比][5]，就像 Chrome 浏览器和其开源的“上游”项目 [Chromium][6] 一样。VS Code 确实是基于开源代码库构建的。微软官方发布的版本带有一些与微软相关的功能，包括一项商标、一个插件库、一个 C# 调试器以及遥测。但如果你克隆仓库然后自行编译，这些东西都不会被加入，所以你会得到一个名为 Code - OSS 的“干净”版本（OSS 代表开源软件）。

实际上，VS Code 与 Code - OSS 之间的差异很小。最值得注意的是，VS Code 包含遥测功能，它会记录使用数据。微软不可能监控你的一举一动，而且目前越来越多软件都在收集使用数据。是否在乎 VS Code 的遥测功能，完全取决于你自己。如果你不希望它追踪你的使用情况，这里有一些很棒的 VS Code（开源）替代品。

### VSCodium

![Code OSS screenshot][7]

最简单的替代方案就是构建不带微软附属功能的 VS Code 版本。[VSCodium][9] 项目提供了可下载的 Code-OSS 可执行文件，它基于 VS Code 代码库编译，没有配置微软的 `product.json` 中的改变。VSCodium 的开发者还竭尽全力禁用了所有难以寻找的遥测选项，除非你自行编译，否则这已经是你能找到的最干净的 VS Code 版本了。

VSCodium 提醒说，VS Code 悄悄地包含了一些专有工具，这些工具无法与开源版本一起提供。这包括一个 C# 调试器和部分插件。如果你需要它们，可以在 [文档中] 找到解决办法。假如你依赖 VS Code 中某些特定的功能，你应该验证它在 VSCodium 中是否可以发挥功用。

此外，你还应该验证是否已禁用所有的遥测功能。

### Code - OSS

如果不想用 VSCodium 的版本，你可以自己 [从头编译 VS Code][12]，得到一样的版本。可执行文件叫做 `Code - OSS`，而不是 `VSCode`，适用于 VSCodium 的许可证限制也适用于你的构建，而工作方式也是一样。

如果通过编译源码构建应用，首次启动时你要确保 [所有遥测都已经被禁用]。

### Atom

![Atom screenshot][13]

[Atom][14] 是一个类似于 IDE 的文本编辑器，当微软收购 Github 的同时也收购了它。和 VS Code 一样，你可以使用插件，扩展 Atom 编辑器，此外，你还能通过自己的工具和主题实现定制。它开源且与 Github 集成。简而言之，只要你能找到你想用的插件，或者你愿意自己动手写，那么 Atom 几乎可以满足你的一切需求。

跟 VS Code 一样，Atom 也 [默认包含遥测][15]。你可以禁用这个功能，而且跟 VS Code 不同的是，使用插件不受任何限制，所以不必再因为隐私改变你的工作流。对写代码的人来说，毫无疑问 Atom 是很有用的工具，而对于 [使用电脑的任何人][16]，它同样会是一个很赞的编辑器。如果你需要一个顺手的通用文本编辑器，请试试 Atom。

### GNOME Builder

![GNOME Builder screenshot][17]

为 GNOME 桌面而开发的 IDE，[GNOME Builder][18] 是一个 Linux 平台的代码编辑器，专门用于构建 GNOME 应用。如果你为 Linux 构建应用程序，希望轻松解决兼容性问题，那么 Builder 就是最简单的选择。从 [Flathub.org][19] 安装 Builder；当你开启一个新项目，如果没有安装 GNOME SDK，它会提醒你。这意味着当维护你的应用时，你不必刻意关注 GNOME 的状态，因为 Builder 在替你做这件事。

然而，Builder 不仅能构建 GNOME 程序。它还支持各种各样的编程语言，包括 Python、Rust、C/C++、Java、Go、JavaScript、TypeScript、VB.NET、Markdown 和几种标记语言等等。它对部分语言有全面的支持，包括自动补全以及弹出式函数定义，但是其它语言仅仅含有一些比较方便的功能，例如语法高亮跟自动匹配括号。不管你是不是一个专门的程序员，或者你只想要一个给力的 HTML 和 CSS 编辑器，这个 IDE 都能让你舒心使用。

### Geany

![Geany screenshot][20]

[Geany][21] 是一个强大、稳定而轻量级的编辑器，它有很多有用的特性，能帮你写 Bash、Python、Lua、XML、HTML、LaTex，当然远不止这些。对 50 种各种编程及脚本语言、标记语言和各种文件类型（比如 .diff 和 .po），Geany 都有很好的支持。退一万步讲，Geany 还有括号匹配和语法高亮 —— 通常来说，它包含更多功能。

Geany 是一个小型编辑器，但是通过插件，你可以为它添加特性，例如项目视图面板、文件系统树、调试、终端等，直到它看起来像一个 IDE。当然，萝卜白菜各有所爱，你也可以尽量使它保持简洁易用。如果因为电脑 CPU 或者内存的限制而无法使用 VS Code，那么很明显 Geany 可以作为你的选择。它只占用少量内存，而且启动迅速。即便跟运行在终端里的 Vim 相比，Geany 稍显笨重，但就算在树莓派，它也能做到快速、灵活。

### Brackets

![Brackets screenshot][22]

[Brackets][23] 是一款面向网页开发者的文本编辑器和 IDE。对于 HTML、CSS、JavaScript、PHP 甚至 Python，它都有很强大的支持。而且跟 VS Code 一样，它也有一个很丰富的插件生态，所以你可以最大限度地扩展它，以适应你所有编程语言的工作。

有的插件用于辅助解析语言、运行脚本，甚至编译执行代码。Brackets 有一个传统的界面，不管你是否熟悉 IDE 或者像记事本一样简单的文本编辑器，都能驾轻就熟。如果稍微花点时间，添加几个相关插件，然后熟悉它们，你会发现 Brackets 真的是一个很精妙、很有用的编辑器，不管你输入什么，它都能通过自动补全、提示帮你避免低级错误。假如你是程序员，它能帮你加快测验和调试周期。

### Che

![Che screenshot][24]

如果你喜欢新技术，那你应当尝试 [Che][25] 编辑器。这是一个基于云的 IDE，所以它默认以软件即服务（SaaS）的形式运行，但它是完全开源的，如果你有 Kubernetes 实例，那就可以运行为*你自己的* SaaS。

Che 不仅是一个在线 IDE，而且是一个为云开发而构建的 IDE。在 Che 的概念里，用户无需查看本地文件系统。由于它在云端工作，所以你也可以这么做。事实上，如果你有一台 Git 服务器，那就可以直接把它当作你的文件系统，在它的仓库中完成你的项目。当然，你也可以下载所有文件做本地备份。

但 Che 的主要特点，也是云开发者最为兴奋的一点，它是一个功能全面、带有 Kubernetes 感知功能的开源 IDE。如果你正在为云构建应用、网站或容器（或三者的组合），那么 Che 是一个你需要尝试的编辑器。

### 那么你的选择是？

你有没有在使用这些 VS Code 替代品中的某一个呢？想不想挑一个试试呢？欢迎在评论中分享你的见解。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/open-source-alternatives-vs-code

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[nophDog](https://github.com/nophDog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop_screen_desk_work_chat_text.png?itok=UXqIDRDD (Person using a laptop)
[2]: https://github.com/microsoft/vscode
[3]: https://code.visualstudio.com/
[4]: https://code.visualstudio.com/license
[5]: https://github.com/Microsoft/vscode/issues/60#issuecomment-161792005
[6]: https://www.chromium.org/
[7]: https://opensource.com/sites/default/files/uploads/code-oss.png (Code OSS screenshot)
[8]: https://creativecommons.org/licenses/by-sa/4.0/
[9]: https://vscodium.com/
[10]: https://github.com/VSCodium/vscodium/blob/master/DOCS.md
[11]: https://code.visualstudio.com/docs/supporting/faq#_how-to-disable-telemetry-reporting
[12]: https://github.com/Microsoft/vscode/wiki/How-to-Contribute#build-and-run
[13]: https://opensource.com/sites/default/files/uploads/atom.jpg (Atom screenshot)
[14]: http://atom.io
[15]: https://discuss.atom.io/t/how-do-i-disable-the-metrics-or-tracking/24520
[16]: https://opensource.com/article/19/4/write-git
[17]: https://opensource.com/sites/default/files/uploads/builder.png (GNOME Builder screenshot)
[18]: https://wiki.gnome.org/Apps/Builder
[19]: https://flathub.org/apps/details/org.gnome.Builder
[20]: https://opensource.com/sites/default/files/uploads/geany.png (Geany screenshot)
[21]: https://www.geany.org/
[22]: https://opensource.com/sites/default/files/uploads/brackets.jpg (Brackets screenshot)
[23]: http://brackets.io/
[24]: https://opensource.com/sites/default/files/uploads/che-cpp.jpg (Che screenshot)
[25]: https://www.eclipse.org/che/extend/
