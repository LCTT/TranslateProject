[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Asynchronous rsync with Emacs, dired and tramp.)
[#]: via: (https://vxlabs.com/2018/03/30/asynchronous-rsync-with-emacs-dired-and-tramp/)
[#]: author: (cpbotha https://vxlabs.com/author/cpbotha/)

Asynchronous rsync with Emacs, dired and tramp.
======

[tmtxt-dired-async][1] by [Trần Xuân Trường][2] is an unfortunately lesser known Emacs package which extends dired, the Emacs file manager, to be able to run rsync and other commands (zip, unzip, downloading) asynchronously.

This means you can copy gigabytes of directories around whilst still happily continuing with all of your other tasks in the Emacs operating system.

It has a feature where you can add any number of files from different locations into a wait list with `C-c C-a`, and then asynchronously rsync the whole wait list into a final destination directory with `C-c C-v`. This alone is worth the price of admission.

For example here it is pointlessly rsyncing the arduino 1.9 beta archive to another directory:

[![][3]][4]

When the process is complete, the window at the bottom will automatically be killed after 5 seconds. Here is a separate session right after the asynchronous unzipping of the above-mentioned arduino archive:

[![][5]][6]

This package has further increased the utility of my dired configuration.

I just contributed [a pull request that enables tmtxt-dired-async to rsync to remote tramp-based directories][7], and I immediately used this new functionality to sort a few gigabytes of new photos onto the Linux server.

To add tmtxt-dired-async to your config, download [tmtxt-async-tasks.el][8] (a required library) and [tmtxt-dired-async.el][9] (check that my PR is in there if you plan to use this with tramp) into your `~/.emacs.d/` and add the following to your config:

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

Enjoy!


--------------------------------------------------------------------------------

via: https://vxlabs.com/2018/03/30/asynchronous-rsync-with-emacs-dired-and-tramp/

作者：[cpbotha][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

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
