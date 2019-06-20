[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10977-1.html)
[#]: subject: (Get desktop notifications from Emacs shell commands ·)
[#]: via: (https://blog.hoetzel.info/post/eshell-notifications/)
[#]: author: (Jürgen Hötzel https://blog.hoetzel.info)

让 Emacs shell 命令发送桌面通知
======

我总是使用 [Eshell][1] 来与操作系统进行交互，因为它与 Emacs 无缝整合、支持处理 (远程) [TRAMP][2] 文件，而且在 Windows 上也能工作得很好。

启动 shell 命令后 (比如耗时严重的构建任务) 我经常会由于切换缓冲区而忘了追踪任务的运行状态。

多亏了 Emacs 的 [钩子][3] 机制，你可以配置 Emacs 在某个外部命令完成后调用一个 elisp 函数。

我使用 [John Wiegleys][4] 所编写的超棒的 [alert][5] 包来发送桌面通知：

```
(require 'alert)

(defun eshell-command-alert (process status)
  "Send `alert' with severity based on STATUS when PROCESS finished."
  (let* ((cmd (process-command process))
       (buffer (process-buffer process))
       (msg (format "%s: %s" (mapconcat 'identity cmd " ")  status)))
    (if (string-prefix-p "finished" status)
      (alert msg :buffer buffer :severity  'normal)
    (alert msg :buffer buffer :severity 'urgent))))

(add-hook 'eshell-kill-hook #'eshell-command-alert)
```

[alert][5] 的规则可以用程序来设置。就我这个情况来看，我只需要当对应的缓冲区不可见时得到通知：

```
(alert-add-rule :status   '(buried)     ;only send alert when buffer not visible
          :mode     'eshell-mode
          :style 'notifications)
```


这甚至对于 [TRAMP][2] 也一样生效。下面这个截屏展示了失败的 `make` 命令产生的 Gnome 桌面通知。

![../../img/eshell.png][6]

--------------------------------------------------------------------------------

via: https://blog.hoetzel.info/post/eshell-notifications/

作者：[Jürgen Hötzel][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.hoetzel.info
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/emacs/manual/html_mono/eshell.html (Eshell)
[2]: https://www.gnu.org/software/tramp/ (TRAMP)
[3]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html (hooks)
[4]: https://github.com/jwiegley (John Wiegleys)
[5]: https://github.com/jwiegley/alert (alert)
[6]: https://blog.hoetzel.info/img/eshell.png 
