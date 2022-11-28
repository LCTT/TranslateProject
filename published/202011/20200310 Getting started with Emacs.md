[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12868-1.html)
[#]: subject: (Getting started with Emacs)
[#]: via: (https://opensource.com/article/20/3/getting-started-emacs)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

10 个让你进入 Emacs 世界的技巧
======

> 10 个技巧，让你深入这个有用的开源文本编辑器的世界。

![](https://img.linux.net.cn/data/attachment/album/202011/29/103757lccy9ljxiowooyzy.jpg)

很多人都说想学 [Emacs][2]，但很多人在短暂的接触后就退缩了。这并不是因为 Emacs 不好，也不是 Emacs 复杂。我相信，问题在于人们其实并不想“学习” Emacs，而是他们想习惯 Emacs 的传统。他们想了解那些神秘的键盘快捷键和不熟悉的术语。他们想按照他们认为的“使用目的”来使用 Emacs。

我很同情这一点，因为我对 Emacs 的感觉就是这样。我以为真正的 Emacs 用户都只会在终端里面运行，从来不用方向键和菜单，更不会用鼠标。这是个阻止自己开始使用 Emacs 的好办法。有足够多的独特的 `.emacs` 配置文件证明，如果说 Emacs 用户有一个共同的变化，那就是每个人使用 Emacs 的方式不同。

学习 Emacs 很容易。爱上 Emacs 才是最难的。要爱上 Emacs，你必须发现它所拥有的功能，而这些功能是你一直在寻找的，有时你并不知道你已经错过了它们。这需要经验。

获得这种经验的唯一方法就是从一开始就积极使用 Emacs。这里有十个小提示，可以帮助你找出最适合你的方法。

### 从 GUI 开始

Emacs（以及它的友好竞争者 [Vim][3]）最伟大的事情之一是它可以在终端中运行，这在你 SSH 进入服务器时很有用，但在过去 15 年来制造的计算机上意义不大。Emacs 的 GUI 版本可以在极度[低功耗的设备][4]上运行，它有很多实用的功能，无论是新手还是有经验的用户都可以使用它。

例如，如果你不知道如何在 Emacs 中只用键盘快捷键复制一个单词，编辑菜单的复制、剪切和粘贴选择提供了最轻松的路径。没有理由因为选择了 Emacs 而惩罚自己。使用它的菜单，用鼠标选择区域，点击缓冲区内的按钮，不要让陌生感阻碍你的工作效率。
 
![Emacs slackware][5]

这些功能被内置到 Emacs 中，是因为用户在使用它们。你应该在你需要的时候使用它们，而当你最终在 VT100 终端上通过 SSH 使用 Emacs，没有 `Alt` 或方向键的时候，你才应该使用这些晦涩的命令。

### 习惯术语

Emacs 的 UI 元素有着特殊的术语。个人计算的发展并不是建立在相同的术语上，所以很多术语对现代计算机用户来说比较陌生，还有一些术语虽然相同，但含义不同。下面是一些最常见的术语。

  * <ruby>框架<rt>Frame</rt></ruby>。在 Emacs 中，“框架”就是现代计算机所说的“窗口”。
  * <ruby>缓冲区<rt>Buffer</rt></ruby>：“缓冲区”是 Emacs 的一个通信通道。它可以作为 Emacs 进程的命令行，也可以作为 shell，或者只是一个文件的内容。
  * <ruby>窗口<rt>Window</rt></ruby>：“窗口”是你进入一个缓冲区的视角。
  * <ruby>迷你缓冲区<rt>Mini-buffer</rt></ruby>。它是主要的命令行，位于 Emacs 窗口的底部。

![Emacs tutorial map][6]

### 让 Emacs 的修饰键变得更有意义

在 PC 键盘上，`Ctrl` 键被称为 `C`，`Alt` 键被称为 `M`，这些键并不是 `C` 和 `M` 键，由于它们总是与相应的字母或符号键配对，所以在文档中很容易识别。

例如，`C-x` 在现代键盘符号中的意思是 `Ctrl+X`，`M-x` 是 `Alt+X`。就像你从任何应用程序中剪切文本时一样，同时按下这两个键。

不过，还有另一个层次的键盘快捷键，与现代电脑上的任何东西都完全不同。有时，键盘快捷键并不只是一个键组合，而是由一系列的按键组成。

例如，`C-x C-f` 的意思是像往常一样按 `Ctrl+X`，然后再按 `Ctrl+C`。

有时，一个键盘快捷键有混合的键型。组合键 `C-x 3` 意味着像往常一样按 `Ctrl+X`，然后按数字 `3` 键。

Emacs 之所以能做到这些花哨的强力组合，是因为某些键会让 Emacs 进入一种特殊的命令模式。如果你按 `C-X`（也就是 `Ctrl+X`），就是告诉 `Emacs` 进入空闲状态，等待第二个键或键盘快捷键。

Emacs 的文档，无论是官方的还是非官方的，都有很多键盘快捷键。在心里练习把 `C` 键翻译成 `Ctrl` 键，`M` 键翻译成 `Alt` 键，那么这些文档对你来说都会变得更有意义。

### 剪切、复制和粘贴的备用快捷方式

从规范上，复制文本是通过一系列的键盘快捷键进行的，这些快捷键取决于你想要复制或剪切的方式。

例如，你可以用 `M-d`（`Alt+d` 的 Emacs 行话）剪切一整个单词，或者用`C-k`（`Ctrl+K`）剪切一整行，或者用 `M-m`（`Alt+M`）剪切一个高亮区域。如果你想的话，你可以习惯这样，但如果你喜欢 `Ctrl+C` 和 `Ctrl+X` 和 `Ctrl-V`，那么你可以用这些来代替。

启用现代的“剪切-复制-粘贴”需要激活一个名为 CUA（<ruby>通用用户访问<rt>Common User Access</rt></ruby>）的功能。要激活 CUA，请单击“选项”菜单并选择“使用 CUA 键”。启用后，`C-c` 复制高亮显示的文本，`C-x` 剪切高亮显示的文本，`C-v` 粘贴文本。这个模式只有在你选择了文本之后才会实际激活，所以你仍然可以学习 Emacs 通常使用的 `C-x` 和 `C-c` 绑定。

### 用哪个都好

Emacs 是一个应用程序，它不会意识到你对它的感情或忠诚度。如果你想只用 Emacs 来完成那些“感觉”适合 Emacs 的任务，而用不同的编辑器（比如 Vim）来完成其他任务，你可以这样做。

你与一个应用程序的交互会影响你的工作方式，所以如果 Emacs 中所需要的按键模式与特定任务不一致，那么就不要强迫自己使用 Emacs 来完成该任务。Emacs 只是众多可供你使用的开源工具之一，没有理由让自己只限于一种工具。

### 探索新函数

Emacs 所做的大部分工作都是一个 elisp 函数，它可以从菜单选择和键盘快捷键调用，或者在某些情况下从特定事件中调用。所有的函数都可以从迷你缓冲区（Emacs 框架底部的命令行）执行。理论上，你甚至可以通过键入 `forward-word` 和 `backward-word` 以及 `next-line` 和 `previous-line` 等函数来导航光标。这肯定是无比低效的，但这就是一种直接访问你运行的代码的方式。在某种程度上，Emacs 就是自己的 API。

你可以通过在社区博客上阅读有关 Emacs 的资料来了解新函数，或者你可以采取更直接的方法，使用描述函数（`describe-function`）。要获得任何函数的帮助，按 `M-x`（也就是 `Alt+X`），然后输入 `describe-function`，然后按回车键。系统会提示你输入一个函数名称，然后显示该函数的描述。

你可以通过键入`M-x（`Alt+X`），然后键入 `?` 来获得所有可用函数的列表。

你也可以在输入函数时，通过按 `M-x` 键，然后输入 `auto-complete-mode`，再按回车键，获得弹出的函数描述。激活该模式后，当你在文档中键入任何 Emacs 函数时，都会向你提供自动补完选项，以及函数的描述。

![Emacs function][7]

当你找到一个有用的函数并使用它时，Emacs 会告诉你它的键盘绑定，如果有的话。如果没有的话，你可以通过打开你的 `$HOME/.emacs` 配置文件并输入键盘快捷键来自己分配一个。语法是 ` global-set-key`，后面是你要使用的键盘快捷键，然后是你要调用的函数。

例如，要将 `screenwriter-slugline` 函数分配一个键盘绑定：

```
(global-set-key (kbd “C-c s”) 'screenwriter-slugline)
```

重新加载配置文件，键盘快捷键就可以使用了：

```
M-x load-file ~/.emacs
```

### 紧急按钮

当你使用 Emacs 并尝试新的函数时，你一定会开始调用一些你并不想调用的东西。Emacs 中通用的紧急按钮是 `C-g`（就是 `Ctrl+G`）。

我通过将 G 与 GNU 联系起来来记住这一点，我想我是在呼吁 GNU 将我从一个错误的决定中拯救出来，但请随意编造你自己的记忆符号。

如果你按几下 `C-g`，Emacs 的迷你缓冲区就会回到潜伏状态，弹出窗口被隐藏，你又回到了一个普通的、无聊的文本编辑器的安全状态。

### 忽略键盘快捷键

潜在的键盘快捷键太多，在这里无法一一总结，更不希望你能记住。这是设计好的。Emacs 的目的是为了定制，当人们为 Emacs 编写插件时，他们可以定义自己的特殊键盘快捷键。

我们的想法不是要马上记住所有的快捷键。相反，你的目标是让你在使用 Emacs 时感到舒适。你在 Emacs 中变得越舒适，你就越会厌倦总是求助于菜单栏，你就会开始记住对你重要的组合键。

根据自己在 Emacs 中通常做的事情，每个人都有自己喜欢的快捷方式。一个整天用 Emacs 写代码的人可能知道运行调试器或启动特定语言模式的所有键盘快捷键，但对 Org 模式或 Artist 模式一无所知。这很自然，也很好。

### 使用 Bash 时练习 Emacs

了解 Emacs 键盘快捷键的一个好处是，其中许多快捷键也适用于 Bash。

  * `C-a`：到行首
  * `C-e`：到行尾
  * `C-k`：剪切整行
  * `M-f`：向前一个字
  * `M-b`：向后一个字
  * `M-d`：剪切一个字
  * `C-y`：贴回（粘贴）最近剪切的内容
  * `M-Shift-U`：大写一个词
  * `C-t`：交换两个字符（例如，`sl` 变成 `ls`）

还有更多的例子，它能让你与 Bash 终端的交互速度超乎你的想象。

### 包

Emacs 有一个内置的包管理器来帮助你发现新的插件。它的包管理器包含了帮助你编辑特定类型文本的模式（例如，如果你经常编辑 JSON 文件，你可以尝试使用 ejson 模式）、嵌入的应用程序、主题、拼写检查选项、linter 等。这就是 Emacs 有可能成为你日常计算的关键所在；一旦你找到一个优秀的 Emacs 包，你可能离不开它了。

![Emacs emoji][8]

你可以按 `M-x`（就是 `Alt+X`）键，然后输入 `package-list-packages` 命令，再按回车键来浏览包。软件包管理器在每次启动时都会更新缓存，所以第一次使用时要耐心等待它下载可用软件包的列表。一旦加载完毕，你可以用键盘或鼠标进行导航（记住，Emacs 是一个 GUI 应用程序）。每一个软件包的名称都是一个按钮，所以你可以将光标移到它上面，然后按回车键，或者直接用鼠标点击它。你可以在 Emacs 框架中出现的新窗口中阅读有关软件包的信息，然后用安装按钮来安装它。

有些软件包需要特殊的配置，有时会在它的描述中列出，但有时需要你访问软件包的主页来阅读更多的信息。例如，自动完成包 `ac-emoji` 很容易安装，但需要你定义一个符号字体。无论哪种方式都可以使用，但你只有在安装了字体的情况下才能看到相应的表情符号，除非你访问它的主页，否则你可能不会知道。

### 俄罗斯方块

Emacs 有游戏，信不信由你。有数独、拼图、扫雷、一个好玩的心理治疗师，甚至还有俄罗斯方块。这些并不是特别有用，但在任何层面上与 Emacs 进行交互都是很好的练习，游戏是让你在 Emacs 中花费时间的好方法。

![Emacs tetris][9]

俄罗斯方块也是我最初接触 Emacs 的方式，所以在该游戏的所有版本中，Emacs 版本才是我真正的最爱。

### 使用 Emacs

GNU Emacs 之所以受欢迎，是因为它的灵活性和高度可扩展性。人们习惯了 Emacs 的键盘快捷键，以至于他们习惯性地尝试在其他所有的应用程序中使用这些快捷键，他们将应用程序构建到 Emacs 中，所以他们永远不需要离开。如果你想让 Emacs 在你的计算生活中扮演重要角色，最终的关键是拥抱未知，开始使用 Emacs。磕磕绊绊地，直到你发现如何让它为你工作，然后安下心来，享受 40 年的舒适生活。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/3/getting-started-emacs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboaord_enter_writing_documentation.jpg?itok=kKrnXc5h (Computer keyboard typing)
[2]: https://opensource.com/downloads/emacs-cheat-sheet
[3]: https://opensource.com/downloads/cheat-sheet-vim
[4]: https://opensource.com/article/17/2/pocketchip-or-pi
[5]: https://opensource.com/sites/default/files/uploads/emacs-slackware.jpg (Emacs slackware)
[6]: https://opensource.com/sites/default/files/uploads/emacs-tutorial-map.png (Emacs tutorial map)
[7]: https://opensource.com/sites/default/files/uploads/emacs-function.jpg (Emacs function)
[8]: https://opensource.com/sites/default/files/uploads/emacs-emoji_0.jpg (Emacs emoji)
[9]: https://opensource.com/sites/default/files/uploads/emacs-tetris.jpg (Emacs tetris)
