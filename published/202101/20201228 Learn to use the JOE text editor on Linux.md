[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12993-1.html)
[#]: subject: (Learn to use the JOE text editor on Linux)
[#]: via: (https://opensource.com/article/20/12/joe)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

学习在 Linux 上使用 JOE 文本编辑器
======

> Joe's Own Editor （JOE）是一款简单易学和使用的通用文本编辑器。

![](https://img.linux.net.cn/data/attachment/album/202101/07/233204ps2fl3fffgmxzxqg.jpg)

我很喜欢那些能让你轻松学会如何使用的文本编辑器。GNU nano 是我最喜欢的例子：你启动 nano，你会在整个会话的窗口底部看到一个最常用的命令列表。Joe's Own Editor（简称 `joe`）是另一个很好的例子。

`joe` 编辑器使用了一个基于终端的界面，提供了简单的文本编辑功能和一个易于访问的帮助屏幕。它用 C 语言编写，体积小，只对 libc 有硬性依赖（ncurses 是可选的），并且采用 GPL 许可证。

### 安装

在 Linux 上，你也许能在你的发行版软件仓库中找到 JOE。虽然它有点小众，并不是所有的发行版都打包了它。如果是这样的话，你可以从 [SourceForge][2] 下载源码，然后自己编译。这是个简单的过程：

```
$ ./configure
$ make
$ sudo make install
```

### 使用 JOE

据其作者介绍，JOE 的灵感来自于一个叫 WordStar 的应用和 [GNU Emacs][3]。它的大部分基本编辑键都与 WordStar 的快捷键相同，编辑器本身也在努力向 WordStar 靠拢。JOE 也有 GNU Emacs 的一些键绑定和功能。这种两种灵感来源的混合有时会让人迷惑，但话又说回来，在任何情况下，让自己离开 Emacs（或你通常选择的文本编辑器）都会让人迷惑。重要的是，JOE 提供了帮助，而且很容易访问。

在 JOE 界面右上角，有一个持续的提示，你可以按 `Ctrl+K`，紧接着按 `H` 来查看帮助界面。这是一个切换键，所以一旦你激活它，帮助屏幕就会一直显示在你的编辑器窗口顶部，直到用同样的组合键（JOE 中的键盘符号为 `^KH`）解除。

### 键盘快捷键

尽管 JOE 的作者在模拟 WordStar 用户体验方面非常自豪，但我不得不承认，这对我来说是失落的。我从来没有听说过 WordStar，直到我在 JOE 的文档中读到了它，在我看来，它的键盘快捷键方案完全是任意的。有的用 `Ctrl+K` 作为转义序列的前缀，有的用 `Esc` 作为前缀，还有的完全不需要转义序列。我无法确定其中的逻辑。编辑操作和应用选项一样，都有可能需要或不需要转义序列，而且字母关联对我来说是没有什么意义（例如，`Ctrl+K D` 代表**另存为**）。

幸运的是，JOE 可以让你在键盘快捷键上作弊。安装后，JOE 会悄悄为 `joe` 可执行文件创建一些符号链接。包括：

  * `jmacs` JOE 使用 Emacs 键绑定
  * `jpico` JOE 使用 Pico （或 GNU nano） 键绑定
  * `rjoe` JOE 的编辑只限于启动时传递给 JOE 的文件
  * `jstar` JOE 使用 WordStar 键绑定

![Black terminal with white text showing WordStar key bindings][4]

持久保留的帮助菜单仍然存在，所以如果你不清楚有哪些功能可以使用，可以通过屏幕右上方的帮助提示来参考。当然，在 Pico/nano 模式下，主要命令总是可见的。

### 尝试 JOE

JOE 并不是一个你永远不会离开的文本编辑器，它不会成为你的 IDE、电子邮件客户端、网络浏览器和文件管理器。事实上，它甚至可能不是你所有任务的主要文本编辑器。它专注于做好一件事，那就是成为一般的文本编辑。

JOE 拥有你所需要的所有基本功能，比如能够快速浏览你的文本、能够选择文本、复制和粘贴等等。试试 JOE 吧，使用你喜欢的符号链接。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/joe

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_code_programming_laptop.jpg?itok=ormv35tV (Person programming on a laptop on a building)
[2]: https://joe-editor.sourceforge.io/
[3]: https://opensource.com/article/20/12/emacs
[4]: https://opensource.com/sites/default/files/uploads/joe-jstar-31_days-joe-opensource.png (Black terminal with white text showing WordStar key bindings)
