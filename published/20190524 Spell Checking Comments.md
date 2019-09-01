[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11294-1.html)
[#]: subject: (Spell Checking Comments)
[#]: via: (https://emacsredux.com/blog/2019/05/24/spell-checking-comments/)
[#]: author: (Bozhidar Batsov https://emacsredux.com)

Emacs 注释中的拼写检查
======

我出了名的容易拼错单词（特别是在播客当中）。谢天谢地 Emacs 内置了一个名为 `flyspell` 的超棒模式来帮助像我这样的可怜的打字员。flyspell 会在你输入时突出显示拼错的单词 (也就是实时的) 并提供有用的快捷键来快速修复该错误。

大多输入通常会对派生自 `text-mode`（比如 `markdown-mode`，`adoc-mode` ）的主模式启用 `flyspell`，但是它对程序员也有所帮助，可以指出他在注释中的错误。所需要的只是启用 `flyspell-prog-mode`。我通常在所有的编程模式中（至少在 `prog-mode` 派生的模式中）都启用它：

```
(add-hook 'prog-mode-hook #'flyspell-prog-mode)
```

现在当你在注释中输入错误时，就会得到即时反馈了。要修复单词只需要将光标置于单词后，然后按下 `C-c $` （`M-x flyspell-correct-word-before-point`）。（还有许多其他方法可以用 `flyspell` 来纠正拼写错误的单词，但为了简单起见，我们暂时忽略它们。）

![flyspell_prog_mode.gif][1]

今天的分享就到这里！我要继续修正这些讨厌的拼写错误了！

--------------------------------------------------------------------------------

via: https://emacsredux.com/blog/2019/05/24/spell-checking-comments/

作者：[Bozhidar Batsov][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://emacsredux.com
[b]: https://github.com/lujun9972
[1]: https://emacsredux.com/assets/images/flyspell_prog_mode.gif
