[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Get desktop notifications from Emacs shell commands ·)
[#]: via: (https://blog.hoetzel.info/post/eshell-notifications/)
[#]: author: (Jürgen Hötzel https://blog.hoetzel.info)

Get desktop notifications from Emacs shell commands ·
======
When interacting with the operating systems I always use [Eshell][1] because it integrates seamlessly with Emacs, supports (remote) [TRAMP][2] file names and also works nice on Windows.

After starting shell commands (like long running build jobs) I often lose track the task when switching buffers.

Thanks to Emacs [hooks][3] mechanism you can customize Emacs to call a elisp function when an external command finishes.

I use [John Wiegleys][4] excellent [alert][5] package to send desktop notifications:

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

[alert][5] rules can be setup programmatically. In my case I only want to get notified if the corresponding buffer is not visible:

```
(alert-add-rule :status   '(buried)     ;only send alert when buffer not visible
          :mode     'eshell-mode
          :style 'notifications)
```

This even works on [TRAMP][2] buffers. Below is a screenshot showing a Gnome desktop notification of a failed `make` command.

![../../img/eshell.png][6]

--------------------------------------------------------------------------------

via: https://blog.hoetzel.info/post/eshell-notifications/

作者：[Jürgen Hötzel][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://blog.hoetzel.info
[b]: https://github.com/lujun9972
[1]: https://www.gnu.org/software/emacs/manual/html_mono/eshell.html (Eshell)
[2]: https://www.gnu.org/software/tramp/ (TRAMP)
[3]: https://www.gnu.org/software/emacs/manual/html_node/emacs/Hooks.html (hooks)
[4]: https://github.com/jwiegley (John Wiegleys)
[5]: https://github.com/jwiegley/alert (alert)
[6]: https://blog.hoetzel.info/img/eshell.png (../../img/eshell.png)
