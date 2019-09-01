[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Eldoc Goes Global)
[#]: via: (https://emacsredux.com/blog/2018/11/13/eldoc-goes-global/)
[#]: author: (Bozhidar Batsov https://emacsredux.com)

Eldoc Goes Global
======
I recently noticed that Emacs 25.1 had added a global variant of the popular `eldoc-mode`, called `global-eldoc-mode`. What’s more - unlike `eldoc-mode`, `global-eldoc-mode` is enabled by default!

This means that you can get rid of all the code in your Emacs config that was wiring up `eldoc-mode` for major modes that support it:

```
;; That code is now redundant
(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook 'ielm-mode-hook #'eldoc-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
```

There are [some reports][1] that `global-eldoc-mode` is causing performance issues in modes that don’t support it. I’ve never experienced this myself, but if you want to disable it you can simply do so like this:

```
(global-eldoc-mode -1)
```

Now it’s time to clean up my config! Deleting code always feels so good!

--------------------------------------------------------------------------------

via: https://emacsredux.com/blog/2018/11/13/eldoc-goes-global/

作者：[Bozhidar Batsov][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://emacsredux.com
[b]: https://github.com/lujun9972
[1]: https://emacs.stackexchange.com/questions/31414/how-to-globally-disable-eldoc
