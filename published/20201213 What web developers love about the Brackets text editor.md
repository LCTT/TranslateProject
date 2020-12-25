[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12952-1.html)
[#]: subject: (What web developers love about the Brackets text editor)
[#]: via: (https://opensource.com/article/20/12/brackets)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

Web 开发人员喜欢 Brackets 文本编辑器的原因
======

> 这个基础的编辑器是面向 Web 开发人员的，它支持多种编程语言，并提供了大量的扩展，使其成为你自己的编辑器。

![](https://img.linux.net.cn/data/attachment/album/202012/25/092259zy4xvxs4axmysuf9.jpg)

Brackets 文本编辑器是主要面向 Web 开发人员的编辑器。恰如其分的是，它的“编辑”菜单中充满了对 Web 编程语言用户特别有用的功能，主要是 HTML、CSS 和 Javascript 的经典组合。

但是，它还支持许多与互联网相关的语言和格式，包括 XML、Markdown、YAML 和 JSON、PHP、Lua、Java 和 Python，以及一些常见的通用语言，例如 C、C++，甚至是 `diff` 命令的输出。

### 安装 Brackets

Brackets 可以从 [Brackets 网站][2]安装到 Linux、Windows 和 macOS 上。

另外，在 Linux 上，你可以从 [flathub.org][3] 以 Flatpak 安装。

![Brackets editor][4]

### 使用 Brackets

在大多数时候，Brackets 是一个“普通”的文本编辑器，其功能类似于 [jEdit][5] 或 [Medit][6]。有语法高亮、可配置的制表符间距、字符编码设置等等。这些都可以在窗口底部的状态栏中找到。

在“视图”菜单中，有主题设置、行号、自动换行，甚至还有分割窗口的选项，这样你可以在一个窗口中看到两个文件。

然而，在“编辑”菜单中，有一些的特别用于编程的功能。以下是我最喜欢的一些功能：

  * 使用 `Ctrl+[` 或 `Ctrl+]` 键盘快捷键来缩进和取消缩进文本块，这不仅对保持 HTML、CSS 和 Javascript 的整洁很有用，而且对 Python 代码也很重要。
  * 用 `Ctrl+/` 把一行变成注释。Brackets 标记注释的方式取决于你所使用的语言，所以无论你的文档是否使用斜线、破折号、箭头、井号或其他任何类型注释，这个功能都可以使用。
  * 用 `Shift+Ctrl+Up` 或 `Shift+Ctrl+Down` 在文档中将一行向上或向下移动。
  * 用 `Shift+Ctrl+D` 删除整个一行。
  * 用 `Ctrl+D` 复制整个一行。

这些都是看似小众的功能，你可能认为不会经常使用，但一旦你拥有了它们，你就会对它们产生依赖。

### 扩展

Brackets 还可以接受扩展，因此你和其他编码者可以添加扩展到功能中。要查看有哪些可用的扩展，请单击“文件”菜单并选择“扩展管理器”。有各种各样的扩展，包括用于调整代码格式的 Beautify、用于其他语言的多个支持包、用于转到标签开头或结尾的功能等等。

无论编辑器是否适合你，扩展可以使一个编辑器变得不同，所以如果你尝试 Brackets 并享受它的一切，但缺少一些重要的功能，在你放弃它之前，请浏览一下可用的扩展。

### 尝试 Brackets

Brackets 是一个有点低调的编辑器。虽然它宣传自己是 “Web 代码编辑器”，但实际上它是一个不错的通用编辑器，并为常见的 Web 工具链加入了一些额外的功能。如果你喜欢 Brackets 的外观和它所提供的功能，不妨一试！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/brackets

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: http://brackets.io/
[3]: https://flathub.org/apps/details/io.brackets.Brackets
[4]: https://opensource.com/sites/default/files/screenshot_2020-12-02_at_16.26.58.png (Brackets editor)
[5]: https://linux.cn/article-12942-1.html
[6]: https://linux.cn/article-12938-1.html