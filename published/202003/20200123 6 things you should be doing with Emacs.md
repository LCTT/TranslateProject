[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12004-1.html)
[#]: subject: (6 things you should be doing with Emacs)
[#]: via: (https://opensource.com/article/20/1/emacs-cheat-sheet)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

6 件你应该用 Emacs 做的事
======

> 下面六件事情你可能都没有意识到可以在 Emacs 下完成。此外还有我们的新备忘单，拿去，充分利用 Emacs 的功能吧。

![](https://img.linux.net.cn/data/attachment/album/202003/17/133738wjj66p2safcpc50z.jpg)

想象一下使用 Python 的 IDLE 界面来编辑文本。你可以将文件加载到内存中，编辑它们，并保存更改。但是你执行的每个操作都由 Python 函数定义。例如，调用 `upper()` 来让一个单词全部大写，调用 `open` 打开文件，等等。文本文档中的所有内容都是 Python 对象，可以进行相应的操作。从用户的角度来看，这与其他文本编辑器的体验一致。对于 Python 开发人员来说，这是一个丰富的 Python 环境，只需在配置文件中添加几个自定义函数就可以对其进行更改和开发。

这就是 [Emacs][2] 对 1958 年的编程语言 [Lisp][3] 所做的事情。在 Emacs 中，运行应用程序的 Lisp 引擎与输入文本之间无缝结合。对 Emacs 来说，一切都是 Lisp 数据，因此一切都可以通过编程进行分析和操作。

这造就了一个强大的用户界面（UI）。但是，如果你是 Emacs 的普通用户，你可能对它的能力知之甚少。下面是你可能没有意识到 Emacs 可以做的六件事。

### 使用 Tramp 模式进行云端编辑

Emacs 早在网络流行化之前就实现了透明的网络编辑能力了，而且时至今日，它仍然提供了最流畅的远程编辑体验。Emacs 中的 [Tramp 模式][4]（以前称为 RPC 模式）代表着 “<ruby>透明的远程（文件）访问，多协议<rt>Transparent Remote (file) Access，Multiple Protocol</rt></ruby>”，这准确说明了它提供的功能：通过最流行的网络协议轻松访问你希望编辑的远程文件。目前最流行、最安全的能用于远程编辑的协议是 [OpenSSH][5]，因此 Tramp 使用它作为默认的协议。

在 Emacs 22.1 或更高版本中已经包含了 Tramp，因此要使用 Tramp，只需使用 Tramp 语法打开一个文件。在 Emacs 的 “File” 菜单中，选择 “Open File”。当在 Emacs 窗口底部的小缓冲区中出现提示时，使用以下语法输入文件名：

```
/ssh:user@example.com:/path/to/file
```

如果需要交互式登录，Tramp 会提示你输入密码。但是，Tramp 直接使用 OpenSSH，所以为了避免交互提示，你可以将主机名、用户名和 SSH 密钥路径添加到你的 `~/.ssh/config` 文件。与 Git 一样，Emacs 首先使用你的 SSH 配置，只有在出现错误时才会停下来询问更多信息。

Tramp 非常适合编辑并没有放在你的计算机上的文件，它的用户体验与编辑本地文件没有明显的区别。下次，当你 SSH 到服务器启动 Vim 或 Emacs 会话时，请尝试使用 Tramp。

### 日历

如果你喜欢文本多过图形界面，那么你一定会很高兴地知道，可以使用 Emacs 以纯文本的方式安排你的日程（或生活），而且你依然可以在移动设备上使用开源的 [Org 模式][6]查看器来获得华丽的通知。

这个过程需要一些配置，以创建一个方便的方式来与移动设备同步你的日程（我使用 Git，但你可以调用蓝牙、KDE Connect、Nextcloud，或其他文件同步工具），此外你必须在移动设备上安装一个 Org 模式查看器（如 [Orgzly][7]）以及 Git 客户程序。但是，一旦你搭建好了这些基础，该流程就会与你常用的（或正在完善的，如果你是新用户）Emacs 工作流完美地集成在一起。你可以在 Emacs 中方便地查阅日程、更新日程，并专注于任务上。议程上的变化将会反映在移动设备上，因此即使在 Emacs 不可用的时候，你也可以保持井然有序。

![][8]

感兴趣了？阅读我的关于[使用 Org mode 和 Git 进行日程安排][9]的逐步指南。

### 访问终端

有[许多终端模拟器][10]可用。尽管 Emacs 中的 Elisp 终端仿真器不是最强大的通用仿真器，但是它有两个显著的优点：

1. **打开在 Emacs 缓冲区之中**：我使用 Emacs 的 Elisp shell，因为它在 Emacs 窗口中打开很方便，我经常全屏运行该窗口。这是一个小而重要的优势，只需要输入 `Ctrl+x+o`（或用 Emacs 符号来表示就是 `C-x o`）就能使用终端了，而且它还有一个特别好的地方在于当运行漫长的作业时能够一瞥它的状态报告。
2. **在没有系统剪贴板的情况下复制和粘贴特别方便**：无论是因为懒惰不愿将手从键盘移动到鼠标，还是因为在远程控制台运行 Emacs 而无法使用鼠标，在 Emacs 中运行终端有时意味着可以从 Emacs 缓冲区中很快地传输数据到 Bash。

要尝试 Emacs 终端，输入 `Alt+x`（用 Emacs 符号表示就是 `M-x`），然后输入 `shell`，然后按回车。

### 使用 Racket 模式

[Racket][11] 是一种激动人心的新兴 Lisp 方言，拥有动态编程环境、GUI 工具包和充满激情的社区。学习 Racket 的默认编辑器是 DrRacket，它的顶部是定义面板，底部是交互面板。使用该设置，用户可以编写影响 Racket 运行时环境的定义。就像旧的 [Logo Turtle][12] 程序，但是有一个终端而不是仅仅一个海龟。

![Racket-mode][13]

*由 PLT 提供的 LGPL 示例代码*

基于 Lisp 的 Emacs 为资深 Racket 编程人员提供了一个很好的集成开发环境（IDE）。它尚未附带 [Racket 模式][14]，但你可以使用 Emacs 包安装程序安装 Racket 模式和辅助扩展。要安装它，按下 `Alt+X`（用 Emacs 符号表示就是 `M-x`），键入 `package-install`，然后按回车。接着输入要安装的包 `racet-mode`，按回车。

使用 `M-x racket-mode` 进入 Racket 模式。如果你是 Racket 新手，而对 Lisp 或 Emacs 比较熟悉，可以从这份优秀的[图解 Racket][15] 入手。

## 脚本

你可能知道，Bash 脚本在自动化和增强 Linux 或 Unix 体验方面很流行。你可能听说过 Python 在这方面也做得很好。但是你知道 Lisp 脚本可以用同样的方式运行吗？有时人们会对 Lisp 到底有多有用感到困惑，因为许多人是通过 Emacs 来了解 Lisp 的，因此有一种潜在的印象，即在 21 世纪运行 Lisp 的惟一方法是在 Emacs 中运行。幸运的是，事实并非如此，Emacs 是一个很好的 IDE，它支持将 Lisp 脚本作为一般的系统可执行文件来运行。

除了 Elisp 之外，还有两种流行的现代 Lisp 可以很容易地用来作为独立脚本运行。

1. **Racket**：你可以通过在系统上运行 Racket 来提供运行 Racket 脚本所需的运行时支持，或者你可以使用 `raco exe` 产生一个可执行文件。`raco exe` 命令将代码和运行时支持文件一起打包，以创建可执行文件。然后，`raco distribution` 命令将可执行文件打包成可以在其他机器上工作的发行版。Emacs 有许多 Racket 工具，因此在 Emacs 中创建 Racket 文件既简单又有效。
2. **GNU Guile**：[GNU Guile][16]（<ruby>GNU 通用智能语言扩展<rt>GNU Ubiquitous Intelligent Language for Extensions</rt></ruby> 的缩写）是 [Scheme][17] 编程语言的一个实现，它可以用于为桌面、互联网、终端等创建应用程序和游戏。Emacs 中的 Scheme 扩展众多，使用任何一个扩展来编写 Scheme 都很容易。例如，这里有一个用 Guile 编写的 “Hello world” 脚本：

```
#!/usr/bin/guile -s
!#

(display "hello world")
     (newline)
```

用 `guile` 编译并允许它：

```
$ guile ./hello.scheme
;;; compiling /home/seth/./hello.scheme
;;; compiled [...]/hello.scheme.go
hello world
$ guile ./hello.scheme
hello world
```

### 无需 Emacs 允许 Elisp

Emacs 可以作为 Elisp 的运行环境，但是你无需按照传统印象中的必须打开 Emacs 来运行 Elisp。`--script` 选项可以让你使用 Emacs 作为引擎来执行 Elisp 脚本，而无需运行 Emacs 图形界面（甚至也无需使用终端）。下面这个例子中，`-Q` 选项让 Emacs 忽略 `.emacs` 文件，从而避免由于执行 Elisp 脚本时产生延迟（若你的脚本依赖于 Emacs 配置中的内容，那么请忽略该选项）。

```
emacs -Q --script ~/path/to/script.el
```

### 下载 Emacs 备忘录

Emacs 许多重要功能都不是只能通过 Emacs 来实现的；Org 模式是 Emacs 扩展也是一种格式标准，流行的 Lisp 方言大多不依赖于具体的应用，我们甚至可以在没有可见或可交互式 Emacs 实例的情况下编写和运行 Elisp。然后若你对为什么模糊代码和数据之间的界限能够引发创新和效率感到好奇的话，那么 Emacs 是一个很棒的工具。

幸运的是，现在是 21 世纪，Emacs 有了带有传统菜单的图形界面以及大量的文档，因此学习曲线不再像以前那样。然而，要最大化 Emacs 对你的好处，你需要学习它的快捷键。由于 Emacs 支持的每个任务都是一个 Elisp 函数，Emacs 中的任何功能都可以对应一个快捷键，因此要描述所有这些快捷键是不可能完成的任务。你只要学习使用频率 10 倍于不常用功能的那些快捷键即可。

我们汇聚了最常用的 Emacs 快捷键成为一份 Emacs 备忘录以便你查询。将它挂在屏幕附近或办公室墙上，把它作为鼠标垫也行。让它触手可及经常翻阅一下。每次翻两下可以让你获得十倍的学习效率。而且一旦开始编写自己的函数，你一定不会后悔获取了这个免费的备忘录副本的！

- [这里下载 Emacs 备忘录（需注册）](https://opensource.com/downloads/emacs-cheat-sheet)

--------------------------------------------------------------------------------
via: https://opensource.com/article/20/1/emacs-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png
[2]: https://www.gnu.org/software/emacs/
[3]: https://en.wikipedia.org/wiki/Lisp_(programming_language)
[4]: https://www.gnu.org/software/tramp/
[5]: https://www.openssh.com/
[6]: https://orgmode.org/
[7]: https://f-droid.org/en/packages/com.orgzly/
[8]: https://opensource.com/sites/default/files/uploads/orgzly-agenda.jpg
[9]: https://linux.cn/article-11320-1.html
[10]: https://linux.cn/article-11814-1.html
[11]: http://racket-lang.org/
[12]: https://en.wikipedia.org/wiki/Logo_(programming_language)#Turtle_and_graphics
[13]: https://opensource.com/sites/default/files/racket-mode.jpg
[14]: https://www.racket-mode.com/
[15]: https://docs.racket-lang.org/quick/index.html
[16]: https://www.gnu.org/software/guile/
[17]: https://en.wikipedia.org/wiki/Scheme_(programming_language)
