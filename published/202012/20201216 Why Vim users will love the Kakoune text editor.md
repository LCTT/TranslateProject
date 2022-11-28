[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12955-1.html)
[#]: subject: (Why Vim users will love the Kakoune text editor)
[#]: via: (https://opensource.com/article/20/12/kakoune)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

为什么 Vim 用户会喜欢 Kakoune 文本编辑器？
======

> 这个编辑器可能会让人联想到 Vim，但它也提供了很多自己独特的功能和特性。

![](https://img.linux.net.cn/data/attachment/album/202012/25/233039wpnwnwakzn1zwa33.jpg)

[Kakoune][2] 文本编辑器的灵感来源于 Vi。它拥有简约的界面、简短的键盘快捷键以及独立的编辑和插入模式，乍一看确实[看起来和感觉很像 Vi][3]。然而，Kakoune 编辑器在设计和功能上都有自己独特的风格，与其说是另一个 Vim，不如说是它是它自己。

### 安装

在 Linux 和 BSD 上，你可以从你的发行版的软件仓库或 port 树上安装 Kakoune。例如，在 Fedora、CentOS 或 RHEL 上：

```
$ sudo dnf install kakoune
```

在 Debian、Ubuntu 或类似的系统上：

```
$ sudo apt install kakoune
```

在 macOS 上，你可以使用 Homebrew：

```
$ brew install kakoune
```

或者，你也可以[从源码构建][4]。

启动 Kakoune 的命令是 `kak`。你可以启动 Kakoune 打开空文件，也可以在启动时包含文件名让它打开：

```
$ kak example.txt
```

### 使用 Kakoune

当你启动 Kakoune（不带文件名）时，除了在窗口底部有一个小的状态栏外，它在你的终端中打开的大部分是空的缓冲区。像 Vim 一样，Kakoune 以“正常”模式启动，它把按键作为命令，不向缓冲区输入文本。要进入*插入模式*，你必须按 `i`（代表<ruby>插入<rt>Insert</rt></ruby>）或 `a`（代表<ruby>追加<rt>Append</rt></ruby>）。

在插入模式下，Kakoune 的操作和其他编辑器一样。你在键盘上输入，然后你输入的字符就会显示在缓冲区里。在插入模式下，你可以使用方向键来浏览缓冲区。

### 正常模式

在正常模式下，你可以发出导航和文本编辑命令。这是从 Vi 传统中借用的最明显的功能。编辑命令包括复制、剪切（在传统的 Unix 编辑术语中，称为 “<ruby>猛拉<rt>yank</rt></ruby>”）、粘贴单词和行、撤销、转换字符大小写等功能。下面是一些基础：

* `d`：复制并删除当前选择（现代术语中的“剪切”）
* `c`：复制并删除当前选择，并进入插入模式
* `Esc+Alt+d`：删除当前选择
* `y`：复制选择
* `p`：粘贴
* `<`：取消所选行的缩进
* `u`：撤消
* `U`：重做
* `：转为小写
* `~`：转换为大写

### 选择

在 Kakoune 中，你的光标是一个单字符的移动选区。除非你扩展你的选区，否则任何影响选区的命令都只适用当前光标位置。例如，如果你的光标悬停在字母 `n` 上，那么复制命令（正常模式下的 `c`）会将字母 `n` 复制到剪贴板，而粘贴命令（正常模式下的 `p`）则会将字母 `n` 粘贴到缓冲区。

从单个字符扩展选区的最简单方法是进入正常模式，按下 `Shift` 键，同时用方向键移动光标。然而，有几种方法可以根据某些标准来扩展选区。例如，`Alt+l` 将选区从光标扩展到当前行的末端。

完整的文档可以在 <https://github.com/mawww/kakoune/blob/master/README.asciidoc> 中找到。

### 函数

除了这些基本的交互，你还可以执行命令来调用 Kakoune 的内置功能。要访问 Kakoune 的命令行，在普通模式下输入 `:`。在命令行中，你可以执行命令，包括打开文件的 `edit` 命令，保存缓冲区到文件的 `write` 命令，当然还有退出应用的 `quit`。

还有更多的函数，包括针对特定编程语言和文件格式的特殊选项、使用 [Ranger 文件浏览器][5]浏览文件系统的选项、改变颜色主题、搜索和替换文本等等。

![Kakoune][6]

### 尝试 Kakoune

如果你是一个有经验的 Vim 用户，或者甚至是一个只是略知一二的人，你可能会发现 Kakoune 一开始会让你感到迷惑。它与 Vim 的相似度足以让你陷入一种虚假的熟悉感。一切都与 Vim 一模一样，直到你发现了完全不同的地方。不过，如果你是一个刚接触 Vim 编辑器的新手，或者你是一个正在寻找新挑战的 Vim 用户，那么 Kakoune 可能是你的理想编辑器。

你自己试试吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/kakoune

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-docdish-typewriterkeys-3.png?itok=NyBwMdK_ (Typewriter keys in multicolor)
[2]: https://kakoune.org/
[3]: https://linux.cn/article-12947-1.html
[4]: https://github.com/mawww/kakoune
[5]: https://opensource.com/article/20/3/ranger-file-navigator
[6]: https://opensource.com/sites/default/files/kakoune-screenshot.png (Kakoune)