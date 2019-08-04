[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10639-1.html)
[#]: subject: (Asynchronous rsync with Emacs，dired and tramp。)
[#]: via: (https://vxlabs.com/2018/03/30/asynchronous-rsync-with-emacs-dired-and-tramp/)
[#]: author: (cpbotha https://vxlabs.com/author/cpbotha/)

在 Emacs 的 dired 和 tramp 中异步运行 rsync
======

[Trần Xuân Trường][2] 写的 [tmtxt-dired-async][1] 是一个不为人知的 Emacs 包，它可以扩展 dired（Emacs 内置的文件管理器），使之可以异步地运行 `rsync` 和其他命令 (例如压缩、解压缩和下载）。

这意味着你可以拷贝上 GB 的目录而不影响 Emacs 的其他任务。

它的一个功能时让你可以通过 `C-c C-a` 从不同位置添加任意多的文件到一个等待列表中，然后按下 `C-c C-v` 异步地使用 `rsync` 将整个等待列表中的文件同步到目标目录中。光这个功能就值得一试了。

例如这里将 arduino 1.9 的 beta 存档同步到另一个目录中：

![][4]

整个进度完成后，底部的窗口会在 5 秒后自动退出。下面是异步解压上面的 arduino 存档后出现的另一个会话：

![][6]

这个包进一步增加了我 dired 配置的实用性。

我刚刚贡献了 [一个拉取请求来允许 tmtxt-dired-async 同步到远程 tramp 目录中][7]，而且我立即使用该功能来将上 GB 的新照片传输到 Linux 服务器上。

若你想配置 tmtxt-dired-async，下载 [tmtxt-async-tasks.el][8]（被依赖的库）以及  [tmtxt-dired-async.el][9]（若你想让它支持 tramp，请确保合并使用了我的拉取请求）到 `~/.emacs.d/` 目录中，然后添加下面配置：

```
;; no MELPA packages of this, so we have to do a simple check here
(setq dired-async-el (expand-file-name "~/.emacs.d/tmtxt-dired-async.el"))
(when (file-exists-p dired-async-el)
  (load (expand-file-name "~/.emacs.d/tmtxt-async-tasks.el"))
  (load dired-async-el)
  (define-key dired-mode-map (kbd "C-c C-r") 'tda/rsync)
  (define-key dired-mode-map (kbd "C-c C-z") 'tda/zip)
  (define-key dired-mode-map (kbd "C-c C-u") 'tda/unzip)

  (define-key dired-mode-map (kbd "C-c C-a") 'tda/rsync-multiple-mark-file)
  (define-key dired-mode-map (kbd "C-c C-e") 'tda/rsync-multiple-empty-list)
  (define-key dired-mode-map (kbd "C-c C-d") 'tda/rsync-multiple-remove-item)
  (define-key dired-mode-map (kbd "C-c C-v") 'tda/rsync-multiple)

  (define-key dired-mode-map (kbd "C-c C-s") 'tda/get-files-size)

  (define-key dired-mode-map (kbd "C-c C-q") 'tda/download-to-current-dir))
```

祝你开心！


--------------------------------------------------------------------------------

via: https://vxlabs.com/2018/03/30/asynchronous-rsync-with-emacs-dired-and-tramp/

作者：[cpbotha][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://vxlabs.com/author/cpbotha/
[b]: https://github.com/lujun9972
[1]: https://truongtx.me/tmtxt-dired-async.html
[2]: https://truongtx.me/about.html
[3]: https://i0.wp.com/vxlabs.com/wp-content/uploads/2018/03/rsync-arduino-zip.png?resize=660%2C340&ssl=1
[4]: https://i0.wp.com/vxlabs.com/wp-content/uploads/2018/03/rsync-arduino-zip.png?ssl=1
[5]: https://i1.wp.com/vxlabs.com/wp-content/uploads/2018/03/progress-window-5s.png?resize=660%2C310&ssl=1
[6]: https://i1.wp.com/vxlabs.com/wp-content/uploads/2018/03/progress-window-5s.png?ssl=1
[7]: https://github.com/tmtxt/tmtxt-dired-async/pull/6
[8]: https://github.com/tmtxt/tmtxt-async-tasks
[9]: https://github.com/tmtxt/tmtxt-dired-async
