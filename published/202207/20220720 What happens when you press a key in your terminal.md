[#]: subject: "What happens when you press a key in your terminal?"
[#]: via: "https://jvns.ca/blog/2022/07/20/pseudoterminals/"
[#]: author: "Julia Evans https://jvns.ca/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14863-1.html"

当你在终端上按下一个键时会发生什么？
======

![](https://img.linux.net.cn/data/attachment/album/202207/25/110217dlbzqvm9lltkq244.jpg)

我对<ruby>终端<rt>Terminal</rt></ruby>是怎么回事困惑了很久。

但在上个星期，我使用 [xterm.js][1] 在浏览器中显示了一个交互式终端，我终于想到要问一个相当基本的问题：当你在终端中按下键盘上的一个键（比如 `Delete`，或 `Escape`，或 `a`），发送了哪些字节？

像往常一样，我们将通过做一些实验来回答这个问题，看看会发生什么 : )

### 远程终端是非常古老的技术

首先，我想说的是，用 `xterm.js` 在浏览器中显示一个终端可能看起来像一个新事物，但它真的不是。在 70 年代，计算机很昂贵。因此，一个机构的许多员工会共用一台电脑，每个人都可以有自己的 “终端” 来连接该电脑。

例如，这里有一张 70 年代或 80 年代的 VT100 终端的照片。这看起来像是一台计算机（它有点大！），但它不是 —— 它只是显示实际计算机发送的任何信息。

[![DEC VT100终端][2]][3]

当然，在 70 年代，他们并没有使用 Websocket 来做这个，但来回发送的信息的方式和当时差不多。

（照片中的终端是来自西雅图的 <ruby>[活电脑博物馆][4]<rt> Living Computer Museum</rt></ruby>，我曾经去过那里，并在一个非常老的 Unix 系统上用 `ed` 编写了 FizzBuzz，所以我有可能真的用过那台机器或它的一个兄弟姐妹！我真的希望活电脑博物馆能再次开放，能玩到老式电脑是非常酷的。）

### 发送了什么信息？

很明显，如果你想连接到一个远程计算机（用 `ssh` 或使用 `xterm.js` 和 Websocket，或其他任何方式），那么需要在客户端和服务器之间发送一些信息。

具体来说：

  **客户端** 需要发送用户输入的键盘信息（如 `ls -l`）。
  **服务器** 需要告诉客户端在屏幕上显示什么。

让我们看看一个真正的程序，它在浏览器中运行一个远程终端，看看有哪些信息会被来回发送！

### 我们将使用 goterm 来进行实验

我在 GitHub 上发现了这个叫做 [goterm][5] 的小程序，它运行一个 Go 服务器，可以让你在浏览器中使用 `xterm.js` 与终端进行交互。这个程序非常不安全，但它很简单，很适合学习。

我 [复刻了它][6]，使它能与最新的 `xterm.js` 一起工作，因为它最后一次更新是在 6 年前。然后，我添加了一些日志语句，以打印出每次通过 WebSocket 发送/接收的字节数。

让我们来看看在几个不同的终端交互过程中的发送和接收情况吧!

### 示例：ls

首先，让我们运行 `ls`。下面是我在 `xterm.js` 终端上看到的情况：

```
~:/play$ ls
file
~:/play$
```

以下是发送和接收的内容：（在我的代码中，我记录了每次客户端发送的字节：`sent: [bytes]`，每次它从服务器接收的字节：`recv: [bytes]`）

```
sent: "l"
recv: "l"
sent: "s"
recv: "s"
sent: "\r"
recv: "\r\n\x1b[?2004l\r"
recv: "file\r\n"
recv: "\x1b[~:/play$ "
```

我在这个输出中注意到 3 件事：

1. 回显：客户端发送 `l`，然后立即收到一个 `l` 发送回来。我想这里的意思是，客户端真的很笨 —— 它不知道当我输入`l` 时，我想让 `l` 被回显到屏幕上。它必须由服务器进程明确地告诉它来显示它。
2. 换行：当我按下回车键时，它发送了一个 `\r'（回车）符号，而不是 `\n'（换行）。
3.  转义序列：`\x1b` 是 ASCII 转义字符，所以 `\x1b[?2004h` 是告诉终端显示什么或其他东西。我想这是一个颜色序列，但我不确定。我们稍后会详细讨论转义序列。

好了，现在我们来做一些稍微复杂的事情。

### 示例：Ctrl+C

接下来，让我们看看当我们用 `Ctrl+C` 中断一个进程时会发生什么。下面是我在终端中看到的情况：

```
~:/play$ cat
^C
~:/play$
```

而这里是客户端发送和接收的内容。

```
sent: "c"
recv: "c"
sent: "a"
recv: "a"
sent: "t"
recv: "t"
sent: "\r"
recv: "\r\n\x1b[?2004l\r"
sent: "\x03"
recv: "^C"
recv: "\r\n"
recv: "\x1b[?2004h"
recv: "~:/play$ "
```

当我按下 `Ctrl+C` 时，客户端发送了 `\x03`。如果我查 ASCII 表，`\x03` 是 “文本结束”，这似乎很合理。我认为这真的很酷，因为我一直对 `Ctrl+C` 的工作原理有点困惑 —— 很高兴知道它只是在发送一个 `\x03` 字符。

我相信当我们按 `Ctrl+C` 时，`cat` 被中断的原因是服务器端的 Linux 内核收到这个 `\x03` 字符，识别出它意味着 “中断”，然后发送一个 `SIGINT` 到拥有伪终端的进程组。所以它是在内核而不是在用户空间处理的。

### 示例：Ctrl+D

让我们试试完全相同的事情，只是用 `Ctrl+D`。下面是我在终端看到的情况：

```
~:/play$ cat
~:/play$
```

而这里是发送和接收的内容：

```
sent: "c"
recv: "c"
sent: "a"
recv: "a"
sent: "t"
recv: "t"
sent: "\r"
recv: "\r\n\x1b[?2004l\r"
sent: "\x04"
recv: "\x1b[?2004h"
recv: "~:/play$ "
```

它与 `Ctrl+C` 非常相似，只是发送 `\x04` 而不是 `\x03`。很好！`\x04` 对应于 ASCII “传输结束”。

### Ctrl + 其它字母呢？

接下来我开始好奇 —— 如果我发送 `Ctrl+e`，会发送什么字节？

事实证明，这只是该字母在字母表中的编号，像这样。

  * `Ctrl+a` => 1
  * `Ctrl+b` => 2
  * `Ctrl+c` => 3
  * `Ctrl+d` => 4
  * ...
  * `Ctrl+z` => 26

另外，`Ctrl+Shift+b` 的作用与 `Ctrl+b` 完全相同（它写的是`0x2`）。

键盘上的其他键呢？下面是它们的映射情况：

  * `Tab` -> 0x9（与 `Ctrl+I` 相同，因为 I 是第 9 个字母）
  * `Escape` -> `\x1b`
  * `Backspace` -> `\x7f`
  * `Home` -> `\x1b[H`
  * `End` -> `\x1b[F`
  * `Print Screen` -> `\x1b\x5b\x31\x3b\x35\x41`
  * `Insert` -> `\x1b\x5b\x32\x7e`
  * `Delete` -> `\x1b\x5b\x33\x7e`
  * 我的 `Meta` 键完全没有作用

那 `Alt` 呢？根据我的实验（和一些搜索），似乎 `Alt` 和 `Escape` 在字面上是一样的，只是按 `Alt` 本身不会向终端发送任何字符，而按 `Escape` 本身会。所以：

  * `alt + d` => `\x1bd`（其他每个字母都一样）
  * `alt + shift + d` => `\x1bD`（其他每个字母都一样）
  * 诸如此类

让我们再看一个例子！

### 示例：nano

下面是我运行文本编辑器 `nano` 时发送和接收的内容：

```
recv: "\r\x1b[~:/play$ "
sent: "n" [[]byte{0x6e}]
recv: "n"
sent: "a" [[]byte{0x61}]
recv: "a"
sent: "n" [[]byte{0x6e}]
recv: "n"
sent: "o" [[]byte{0x6f}]
recv: "o"
sent: "\r" [[]byte{0xd}]
recv: "\r\n\x1b[?2004l\r"
recv: "\x1b[?2004h"
recv: "\x1b[?1049h\x1b[22;0;0t\x1b[1;16r\x1b(B\x1b[m\x1b[4l\x1b[?7h\x1b[39;49m\x1b[?1h\x1b=\x1b[?1h\x1b=\x1b[?25l"
recv: "\x1b[39;49m\x1b(B\x1b[m\x1b[H\x1b[2J"
recv: "\x1b(B\x1b[0;7m  GNU nano 6.2 \x1b[44bNew Buffer \x1b[53b \x1b[1;123H\x1b(B\x1b[m\x1b[14;38H\x1b(B\x1b[0;7m[ Welcome to nano.  For basic help, type Ctrl+G. ]\x1b(B\x1b[m\r\x1b[15d\x1b(B\x1b[0;7m^G\x1b(B\x1b[m Help\x1b[15;16H\x1b(B\x1b[0;7m^O\x1b(B\x1b[m Write Out   \x1b(B\x1b[0;7m^W\x1b(B\x1b[m Where Is    \x1b(B\x1b[0;7m^K\x1b(B\x1b[m Cut\x1b[15;61H"
```

你可以看到一些来自用户界面的文字，如 “GNU nano 6.2”，而这些 `\x1b[27m` 的东西是转义序列。让我们来谈谈转义序列吧！

### ANSI 转义序列

上面这些 `nano` 发给客户端的 `\x1b[` 东西被称为“转义序列”或 “转义代码”。这是因为它们都是以 “转义”字符 `\x1b` 开头。它们可以改变光标的位置，使文本变成粗体或下划线，改变颜色，等等。[维基百科介绍了一些历史][7]，如果你有兴趣的话可以去看看。

举个简单的例子：如果你在终端运行

```
echo -e '\e[0;31mhi\e[0m there'
```

它将打印出 “hi there”，其中 “hi” 是红色的，“there” 是黑色的。[本页][8] 有一些关于颜色和格式化的转义代码的例子。

我认为有几个不同的转义代码标准，但我的理解是，人们在 Unix 上使用的最常见的转义代码集来自 VT100（博客文章顶部图片中的那个老终端），在过去的 40 年里没有真正改变。

转义代码是为什么你的终端会被搞乱的原因，如果你 `cat` 一些二进制数据到你的屏幕上 —— 通常你会不小心打印出一堆随机的转义代码，这将搞乱你的终端 —— 如果你 `cat` 足够多的二进制数据到你的终端，那里一定会有一个 `0x1b` 的字节。

### 可以手动输入转义序列吗？

在前面几节中，我们谈到了 `Home` 键是如何映射到 `\x1b[H` 的。这 3 个字节是 `Escape + [ + H`（因为 `Escape` 是`\x1b`）。

如果我在 `xterm.js` 终端手动键入 `Escape` ，然后是 `[`，然后是 `H`，我就会出现在行的开头，与我按下 `Home` 完全一样。

我注意到这在我的电脑上的 Fish shell 中不起作用 —— 如果我键入 `Escape`，然后输入 `[`，它只是打印出 `[`，而不是让我继续转义序列。我问了我的朋友 Jesse，他写过 [一堆 Rust 终端代码][9]，Jesse 告诉我，很多程序为转义代码实现了一个 **超时** —— 如果你在某个最小的时间内没有按下另一个键，它就会决定它实际上不再是一个转义代码了。

显然，这在 Fish shell 中可以用 `fish_escape_delay_ms` 来配置，所以我运行了 `set fish_escape_delay_ms 1000`，然后我就能用手输入转义代码了。工作的很好！

### 终端编码有点奇怪

我想在这里暂停一下，我觉得你按下的键被映射到字节的方式是非常奇怪的。比如，如果我们今天从头开始设计按键的编码方式，我们可能不会把它设置成这样：

  * `Ctrl + a` 和 `Ctrl + Shift + a` 做的事情完全一样。
  * `Alt` 与 `Escape` 是一样的
  * 控制序列（如颜色/移动光标）使用与 `Escape` 键相同的字节，因此你需要依靠时间来确定它是一个控制序列还是用户只是想按 `Escape`。

但所有这些都是在 70 年代或 80 年代或什么时候设计的，然后需要永远保持不变，以便向后兼容，所以这就是我们得到的东西 :)

### 改变窗口大小

在终端中，并不是所有你能做的事情都是通过来回发送字节发生的。例如，当终端被调整大小时，我们必须以不同的方式告诉 Linux 窗口大小已经改变。

下面是 [goterm][10] 中用来做这件事的 Go 代码的样子：

```
syscall.Syscall(
    syscall.SYS_IOCTL,
    tty.Fd(),
    syscall.TIOCSWINSZ,
    uintptr(unsafe.Pointer(&resizeMessage)),
)
```

这是在使用 `ioctl` 系统调用。我对 `ioctl` 的理解是，它是一个系统调用，用于处理其他系统调用没有涉及到的一些随机的东西，通常与 IO 有关，我猜。

`syscall.TIOCSWINSZ` 是一个整数常数，它告诉 `ioctl` 我们希望它在本例中做哪件事（改变终端的窗口大小）。

### 这也是 xterm 的工作方式。

在这篇文章中，我们一直在讨论远程终端，即客户端和服务器在不同的计算机上。但实际上，如果你使用像 xterm 这样的终端模拟器，所有这些工作方式都是完全一样的，只是很难注意到，因为这些字节并不是通过网络连接发送的。

### 文章到此结束啦

关于终端，肯定还有很多东西要了解（我们可以讨论更多关于颜色，或者原始与熟化模式，或者 Unicode 支持，或者 Linux 伪终端界面），但我将在这里停止，因为现在是晚上 10 点，这篇文章有点长，而且我认为我的大脑今天无法处理更多关于终端的新信息。

感谢 [Jesse Luehrs][11] 回答了我关于终端的十亿个问题，所有的错误都是我的 :)

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/2022/07/20/pseudoterminals/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://xtermjs.org/
[2]: https://upload.wikimedia.org/wikipedia/commons/thumb/9/99/DEC_VT100_terminal.jpg/512px-DEC_VT100_terminal.jpg
[3]: https://commons.wikimedia.org/wiki/File:DEC_VT100_terminal.jpg (Jason Scott, CC BY 2.0 <https://creativecommons.org/licenses/by/2.0>, via Wikimedia Commons)
[4]: https://livingcomputers.org/
[5]: https://github.com/freman/goterm
[6]: https://github.com/jvns/goterm
[7]: https://en.wikipedia.org/wiki/ANSI_escape_code
[8]: https://misc.flogisoft.com/bash/tip_colors_and_formatting
[9]: https://github.com/doy/vt100-rust
[10]: https://github.com/freman/goterm/blob/a644c10e180ce8af789ea3e4e4892dcf078e97e2/main.go#L110-L115
[11]: https://github.com/doy/
