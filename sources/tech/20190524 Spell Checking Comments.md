[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Spell Checking Comments)
[#]: via: (https://emacsredux.com/blog/2019/05/24/spell-checking-comments/)
[#]: author: (Bozhidar Batsov https://emacsredux.com)

Spell Checking Comments
======
I’m notorious for all the typos I make. Thankfully Emacs features an awesome built-in mode named `flyspell` to help poor typists like me. Flyspell highlights misspelled words as you type (a.k.a. on the fly) and has useful keybindings to quickly fix them.

Most people typically enable `flyspell` only for major modes derived from `text-mode` (e.g. `markdown-mode`, `adoc-mode`), but it can really help programmers as well by pointing out typos they make in comments. All you need to do is enable `flyspell-prog-mode`. I typically enable it for all programming modes like this:

```
(add-hook 'prog-mode-hook #'flyspell-prog-mode)
```

Now you’ll get instant feedback when you make some typo in a comment. To fix a word just press `C-c $` (`M-x flyspell-correct-word-before-point`), while your cursor is behind it.

![flyspell_prog_mode.gif][1]

That’s all I have for you today! Keep fixing those nasty typos!

--------------------------------------------------------------------------------

via: https://emacsredux.com/blog/2019/05/24/spell-checking-comments/

作者：[Bozhidar Batsov;Emacs Redux][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://emacsredux.com
[b]: https://github.com/lujun9972
[1]: https://emacsredux.com/assets/images/flyspell_prog_mode.gif
