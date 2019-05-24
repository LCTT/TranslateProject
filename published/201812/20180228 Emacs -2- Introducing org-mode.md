[#]: collector: (lujun9972)
[#]: translator: (oneforalone)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Emacs #2: Introducing org-mode)
[#]: via: (https://changelog.complete.org/archives/9865-emacs-2-introducing-org-mode)
[#]: author: (John Goerzen http://changelog.complete.org/archives/author/jgoerzen)
[#]: url: (https://linux.cn/article-10312-1.html)

Emacs 系列（二）：Org 模式介绍
======

在我 Emacs 系列中的[第一篇文章][1]里，我介绍了我在用了几十年的 vim 后转向了 Emacs，Org 模式就是我为什么这样做的原因。

Org 模式的精简和高效真的震惊了我，它真的是个“杀手”应用。

### 所以，Org 模式到底是什么呢？

这是我昨天写的：

> 它是一个组织信息的平台，它的主页上这样写着：“一切都是纯文本：Org 模式用于记笔记、维护待办事项列表、计划项目和使用快速有效的纯文本系统编写文档。”

这是事实，但并不是很准确。Org 模式是一个你用来组织事务的小工具。它有一些非常合理的默认设置，但也允许你自己定制。

主要突出在这几件事上：

* **维护待办事项列表**：项目可以分散在 Org 文件中，包含附件，有标签、截止日期、时间表。有一个方便的“日程”视图，显示需要做什么。项目也可以重复。
* **编写文档**：Org 模式有个特殊的功能来生成 HTML、LaTeX、幻灯片（用 LaTeX beamer）和其他所有的格式。它也支持直接在缓冲区中运行和以 Emacs 所支持的的语言进行<ruby>文学编程<rt>literate programming</rt></ruby>。如果你想要深入了解这项功能的话，参阅[这篇文学式 DevOps 的文章][2]。而 [整个 Worg 网站][3] 是用 Org 模式开发的。
* **记笔记**：对，它也能做笔记。通过全文搜索，文件的交叉引用（类似 wiki），UUID，甚至可以与其他的系统进行交互（通过 Message-ID 与 mu4e 交互，通过 ERC 的日志等等……）。

### 入门

我强烈建议去阅读 [Carsten Dominik 关于 Org 模式的一篇很棒的 Google 讲话][4]。那篇文章真的很赞。

在 Emacs 中带有 Org 模式，但如果你想要个比较新的版本的话，Debian 用户可以使用命令 `apt-get install org-mode` 来更新，或者使用 Emacs 的包管理系统命令 `M-x package-install RET org-mode RET`。

现在，你可能需要阅读一下 Org 模式的精简版教程中的[导读部分][5]，特别注意，你要设置下[启动部分][6]中提到的那些键的绑定。

### 一份好的教程

我会给出一些好的教程和介绍的链接，但这篇文章不会是一篇教程。特别是在本文末尾，有两个很不错的视频链接。

### 我的一些配置

我将在这里记录下一些我的配置并介绍它的作用。你没有必要每行每句将它拷贝到你的配置中 —— 这只是一个参考，告诉你哪些可以配置，要怎么在手册中查找，或许只是一个“我现在该怎么做”的参考。

首先，我将 Emacs 的编码默认设置为 UTF-8。

```
(prefer-coding-system 'utf-8) 
(set-language-environment "UTF-8")
```

Org 模式中可以打开 URL。默认的，它会在 Firefox 中打开，但我喜欢用 Chromium。

```
(setq browse-url-browser-function 'browse-url-chromium)
```

我把基本的键的绑定和设为教程里的一样，再加上 `M-RET` 的操作的配置。

```
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(setq org-M-RET-may-split-line nil)
```


### 捕获配置

我可以在 Emacs 的任何模式中按 `C-c c`，按下后它就会[帮我捕获某些事][7]，其中包括一个指向我正在处理事务的链接。

你可以通过定义[捕获模板][8]来配置它。我将保存两个日志文件，作为会议、电话等的通用记录。一个是私人用的，一个是办公用的。如果我按下 `C-c c j`,它就会帮我捕获为私人项. 下面包含 `%a` 的配置是表示我当前的位置（或是我使用 `C-c l` 保存的链接）的链接。

```
(setq org-default-notes-file "~/org/tasks.org")
(setq org-capture-templates
      '(
        ("t" "Todo" entry (file+headline "inbox.org" "Tasks")
         "* TODO %?\n  %i\n  %u\n  %a")
        ("n" "Note/Data" entry (file+headline "inbox.org" "Notes/Data")
         "* %?   \n  %i\n  %u\n  %a")
        ("j" "Journal" entry (file+datetree "~/org/journal.org")
         "* %?\nEntered on %U\n %i\n %a")
        ("J" "Work-Journal" entry (file+datetree "~/org/wjournal.org")
         "* %?\nEntered on %U\n %i\n %a")
        ))
(setq org-irc-link-to-logs t)
```

我喜欢通过 UUID 来建立链接，这让我在文件之间移动而不会破坏位置。当我要 Org 存储一个链接目标以便将来插入时，以下配置有助于生成 UUID。

```
(require 'org-id)
(setq org-id-link-to-org-use-id 'create-if-interactive)
```

### 议程配置

我喜欢将星期天作为一周的开始，当我将某件事标记为完成时，我也喜欢记下时间。

```
(setq org-log-done 'time)
(setq org-agenda-start-on-weekday 0)
```

### 文件归档配置

在这我将配置它，让它知道在议程中该使用哪些文件，而且在纯文本的搜索中添加一点点小功能。我喜欢保留一个通用的文件夹（我可以从其中移动或“重新归档”内容），然后将个人和工作项的任务、日志和知识库分开。

```
  (setq org-agenda-files (list "~/org/inbox.org"
                               "~/org/email.org"
                               "~/org/tasks.org"
                               "~/org/wtasks.org"
                               "~/org/journal.org"
                               "~/org/wjournal.org"
                               "~/org/kb.org"
                               "~/org/wkb.org"
  ))
  (setq org-agenda-text-search-extra-files
        (list "~/org/someday.org"
              "~/org/config.org"
  ))

  (setq org-refile-targets '((nil :maxlevel . 2)
                             (org-agenda-files :maxlevel . 2)
                             ("~/org/someday.org" :maxlevel . 2)
                             ("~/org/templates.org" :maxlevel . 2)
                             )
        )
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path 'file)
```

### 外观配置

我喜欢一个较漂亮的的屏幕。在你开始习惯 Org 模式之后，你可以试试这个。

```
(add-hook 'org-mode-hook
          (lambda ()
            (org-bullets-mode t)))
(setq org-ellipsis "⤵")
```

### 下一篇

希望这篇文章展示了 Org 模式的一些功能。接下来，我将介绍如何定制 `TODO` 关键字和标记、归档旧任务、将电子邮件转发到 Org 模式，以及如何使用 `git` 在不同电脑之间进行同步。

你也可以查看[本系列的所有文章列表][9]。

--------------------------------------------------------------------------------

via: https://changelog.complete.org/archives/9865-emacs-2-introducing-org-mode

作者：[John Goerzen][a]
选题：[lujun9972][b]
译者：[oneforalone](https://github.com/oneforalone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://changelog.complete.org/archives/author/jgoerzen
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10297-1.html
[2]: http://www.howardism.org/Technical/Emacs/literate-devops.html
[3]: https://orgmode.org/worg/
[4]: https://www.youtube.com/watch?v=oJTwQvgfgMM
[5]: https://orgmode.org/guide/Introduction.html#Introduction
[6]: https://orgmode.org/guide/Activation.html#Activation
[7]: https://orgmode.org/guide/Capture.html#Capture
[8]: https://orgmode.org/guide/Capture-templates.html#Capture-templates
[9]: https://changelog.complete.org/archives/tag/emacs2018
