[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11306-1.html)
[#]: subject: (Eldoc Goes Global)
[#]: via: (https://emacsredux.com/blog/2018/11/13/eldoc-goes-global/)
[#]: author: (Bozhidar Batsov https://emacsredux.com)

Emacs：Eldoc 全局化了
======

![](https://img.linux.net.cn/data/attachment/album/201909/05/045702d99v9vv4xy0aybmm.jpg)

最近我注意到 Emacs 25.1 增加了一个名为 `global-eldoc-mode` 的模式，它是流行的 `eldoc-mode` 的一个全局化的变体。而且与 `eldoc-mode` 不同的是，`global-eldoc-mode` 默认是开启的！

这意味着你可以删除 Emacs 配置中为主模式开启 `eldoc-mode` 的代码了：

```
;; That code is now redundant
(add-hook 'emacs-lisp-mode-hook #'eldoc-mode)
(add-hook 'ielm-mode-hook #'eldoc-mode)
(add-hook 'cider-mode-hook #'eldoc-mode)
(add-hook 'cider-repl-mode-hook #'eldoc-mode)
```

[有人说][1] `global-eldoc-mode` 在某些不支持的模式中会有性能问题。我自己从未遇到过，但若你像禁用它则只需要这样：

```
(global-eldoc-mode -1)
```

现在是时候清理我的配置了！删除代码就是这么爽！

--------------------------------------------------------------------------------

via: https://emacsredux.com/blog/2018/11/13/eldoc-goes-global/

作者：[Bozhidar Batsov][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://emacsredux.com
[b]: https://github.com/lujun9972
[1]: https://emacs.stackexchange.com/questions/31414/how-to-globally-disable-eldoc
