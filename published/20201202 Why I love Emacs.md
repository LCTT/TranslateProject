[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12923-1.html)
[#]: subject: (Why I love Emacs)
[#]: via: (https://opensource.com/article/20/12/emacs)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

为什么我喜欢 Emacs
======

> Emacs 并不是一个单纯的文本编辑器，它将掌控置于你手中，让你几乎可以解决你遇到的任何问题。

!["表情符号键盘"][1]

我是一个典型的 [Emacs][2] 用户。不是我选择的 Emacs，而是它选择了我。早在我刚开始学习 Unix 的时候，我偶然发现了一个奇怪的名为 Emacs 的应用程序，它隐藏在我的电脑上，其中有一个鲜为人知的功能。传说中（而且被证明是真的），如果你在终端上输入 `emacs`，按 `Alt+X`，然后输入 `tetris`，你就可以玩一个掉方块的游戏。

![Tetris in Emacs][3]

那就是我对 GNU Emacs 的印象。虽然这很肤浅，但它也准确地表明了 Emacs 的意义：用户可以重新编程他们的（虚拟）世界，并且可以用一个应用程序做*任何*他们想做的事情。在你的文本编辑器中玩俄罗斯方块可能不是你日常的主要目标，但这说明 Emacs 是一个值得骄傲的编程平台。事实上，你可以把它看作是 [Jupyter][4] 的一种先驱，它把一种强大的编程语言（准确的说叫 elisp）和自己的实时环境结合起来。因此，Emacs 作为一个文本编辑器是灵活的、可定制的、强大的。

如果你习惯于 Bash、Python 或类似的语言，elisp（以及扩展的 Common Lisp）不一定是最容易入门的语言。但是这种 LISP 方言是很强大的，而且因为 Emacs 是一个 LISP 解释器，所以你可以用它构建应用程序，不管它们是 Emacs 插件还是你想开发成一个独立项目的原型。极其流行的 [org 模式项目][5]就是一个例子：它是一个 Emacs 插件，同时也是一个标记语法，有移动应用可以解释和扩展其功能。类似的有用的 Emacs 内应用的例子还有很多，包括电子邮件客户端、PDF 浏览器、Web 浏览器、shell 和文件管理器。

### 两个界面

GNU Emacs 至少有两个用户界面：图形用户界面（GUI）和终端用户界面（TUI）。这有时会让人感到惊讶，因为 Emacs 经常与运行在终端中的 Vi 相提并论（尽管 gVim 为现代 Vi 的实现提供了一个 GUI）。如果你想把 GNU Emacs 以终端程序来运行，你可以用 `-nw` 选项来启动它。

```
$ emacs -nw
```

有了 GUI 程序，你可以直接从应用程序菜单或终端启动 Emacs。

你可能会认为 GUI 会降低 Emacs 的效率，好像“真正的文本编辑器是在终端中运行的”，但 GUI 可以使 Emacs 更容易学习，因为它的 GUI 遵循了一些典型的惯例（菜单栏、可调节的组件、鼠标交互等）。

事实上，如果你把 Emacs 作为一个 GUI 应用程序来运行，你可能在一天的时间里会完全没有意识到你在 Emacs 中。只要你使用过 GUI，大多数常用的惯例都适用。例如，你可以用鼠标选择文本，导航到**编辑**菜单，选择**复制**，然后将光标放在其他地方，选择**粘贴**。要保存文档，你可以进入**文件**，然后选择**保存**或**另存为**。你可以按 `Ctrl` 键并向上滚动，使屏幕字体变大，你可以使用滚动条来浏览你的文档，等等。

了解 Emacs 的 GUI 形式是拉平学习曲线的好方法。

### Emacs 键盘快捷键

GNU Emacs 以复杂的键盘组合而恶名远扬。它们不仅陌生（`Alt+W` 来复制？`Ctrl+Y` 来粘贴？），而且还用晦涩难懂的术语来标注（`Alt` 被称为 `Meta`），有时它们成双成对（`Ctrl+X` 后是 `Ctrl+S` 来保存），有时则单独出现（`Ctrl+S` 来搜索）。为什么有人会故意选择使用这些呢？

嗯，有些人不会。但那些喜欢这些的人是因为这些组合很容易融入到日常打字的节奏中（而且经常让 `Caps Lock` 键充当 `Ctrl` 键）。然而，那些喜欢不同的东西的人有几个选择：

  * “邪恶”模式让你在 Emacs 中使用 Vim 键绑定。就是这么简单。你可以保留你的肌肉记忆中的按键组合，并继承最强大的文本编辑器。
  * 通用用户访问（CUA）键保留了所有 Emacs 常用的组合键，但最令人头疼的键（复制、剪切、粘贴和撤消）都被映射到现代的键盘绑定中（分别为 `Ctrl+C`、`Ctrl+X`、`Ctrl+V` 和 `Ctrl+Z`）。
  * `global-set-key` 函数，是 Emacs 编程的一部分，允许你定义自己的键盘快捷键。传统上，用户定义的快捷键以 `Ctrl+C` 开头，但没有什么能阻止你发明自己的方案。Emacs 并不敝帚自珍，欢迎你按照自己的意愿来扭转它。

### 学习 Emacs

要想很好地使用 Emacs 是需要时间的。对我来说，这意味着打印出一张[速记表][6]，每天都把它放在键盘旁边。当我忘了一个键组合时，我就在我的速记表上查找它。如果它不在我的速记表上，我就学习这个键盘组合，要么通过执行该函数，并注意 Emacs 告诉我如何更快地访问它，要么通过使用 `describe-function`：

```
M-x describe-function: save-buffer

save-buffer is an interactive compiled Lisp function in ‘files.el’.

It is bound to C-x C-s, &lt;menu-bar&gt; &lt;file&gt; &lt;save-buffer&gt;.
[...]
```

当你使用它的时候，你就会学习它。你对它了解得越多，你就越有能力去改进它，使它变成你自己的。

### 尝试 Emacs

人们常开玩笑说 Emacs 是一个包含文本编辑器的操作系统。也许这是在暗示 Emacs 臃肿和过于复杂，当然也有一种说法是文本编辑器根据其默认配置不应该需要 `libpoppler`（你可以不需要它来编译 Emacs）。

但这个笑话背后潜藏着一个更大的真相，它揭示了 Emacs 如此有趣的原因。将 Emacs 与其他文本编辑器，如 Vim、Nano，甚至 [VSCodium][7] 进行比较是没有意义的，因为 Emacs 真正重要的部分并不是你可以在窗口中输入东西并保存的这种思路。那是连 Bash 都能提供的基本功能。Emacs 的真正意义在于它如何将控制置身于你的手中，以及如何通过 Emacs Lisp（[Elisp][8]）解决几乎任何问题。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/emacs

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/emoji-keyboard.jpg?itok=JplrSZ9c (Emoji keyboard)
[2]: https://en.wikipedia.org/wiki/Emacs
[3]: https://opensource.com/sites/default/files/tetris.png (Tetris in Emacs)
[4]: https://opensource.com/article/20/11/surprising-jupyter
[5]: https://opensource.com/article/19/1/productivity-tool-org-mode
[6]: https://opensource.com/downloads/emacs-cheat-sheet
[7]: https://opensource.com/article/20/6/open-source-alternatives-vs-code
[8]: https://www.gnu.org/software/emacs/manual/html_node/elisp/
