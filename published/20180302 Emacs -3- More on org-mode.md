[#]: collector: (lujun9972)
[#]: translator: (oneforalone)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: subject: (Emacs #3: More on org-mode)
[#]: via: (https://changelog.complete.org/archives/9877-emacs-3-more-on-org-mode)
[#]: author: (John Goerzen http://changelog.complete.org/archives/author/jgoerzen)
[#]: url: (https://linux.cn/article-10327-1.html)

Emacs 系列（三）： Org 模式的补充
======

这是 [Emacs 和 Org 模式系列][1]的第三篇。

### Todo 的跟进及关键字

当你使用 Org 模式来跟进你的 TODO 时，它有多种状态。你可以用 `C-c C-t` 来快速切换状态。我将它设为这样：

```
(setq org-todo-keywords '(
  (sequence "TODO(t!)" "NEXT(n!)" "STARTED(a!)" "WAIT(w@/!)" "OTHERS(o!)" "|" "DONE(d)" "CANCELLED(c)")
))
```

在这里，我设置了一个任务未完成的五种状态：`TODO`、`NEXT`、`STARTED`、`WAIT` 及 `OTHERS`。每一个状态都有单个字的快捷键（`t`、`n`、`a` 等）。管道符（`|`）之后的状态被认为是“完成”的状态。我有两个“完成”状态：`DONE`（已经完成）及 `CANCELLED`（还没完成，但由于其它的原因无法完成）。

`!` 的含义是记录某项更改为状态的时间。我不把这个添加到完成的状态，是因为它们已经被记录了。`@` 符号表示带理由的提示，所以当切换到 `WAIT` 时，Org 模式会问我为什么，并将这个添加到笔记中。

以下是项目状态发生变化的例子：

```
** DONE This is a test
   CLOSED: [2018-03-02 Fri 03:05]
  
   - State "DONE"       from "WAIT"       [2018-03-02 Fri 03:05]
   - State "WAIT"       from "TODO"       [2018-03-02 Fri 03:05] \\
     waiting for pigs to fly
   - State "TODO"       from "NEXT"       [2018-03-02 Fri 03:05]
   - State "NEXT"       from "TODO"       [2018-03-02 Fri 03:05]
```

在这里，最新的项目在最上面。

### 议程模式，日程及期限

当你处在一个待办事项时，`C-c C-s` 或 `C-c C-d` 可以为其设置相应的日程或期限。这些都是在议程模式中的功能。它们的区别在于其意图和表现。日程是你希望在某个时候完成的事情，而期限是在某个特定的时间应该完成的事情。默认情况下，议程视图将在项目的截止日期前提醒你。

在此过程中，[议程视图][3]将显示即将出现的项目，提供了一种基于纯文本或标记搜索项目的方法，甚至可以进行跨多个文件处理项目的批量操作。我在本系列的[第 2 部分][4]中介绍了为议程模式配置。

### 标签

Org 模式当然也支持标签了。你可以通过 `C-c C-q` 快速的建立标签。

你可能会想为一些常用的标签设置快捷键。就像这样:

```
  (setq org-tag-persistent-alist 
        '(("@phone" . ?p) 
          ("@computer" . ?c) 
          ("@websurfing" . ?w)
          ("@errands" . ?e)
          ("@outdoors" . ?o)
          ("MIT" . ?m)
          ("BIGROCK" . ?b)
          ("CONTACTS" . ?C)
          ("INBOX" . ?i)
          ))
```

你还可以按文件向该列表添加标记，也可以按文件为某些内容设置标记。我就在我的 `inbox.org` 和 `email.org` 文件中设置了一个 `INBOX` 的标签。然后我可以每天从日程视图中查看所有标记为 `INBOX` 的项目，像将它们重新归档到其他文件中的这样的简单操作将让它们去掉 `INBOX` 标记。

### 重新归档

“重新归档”就是在文件中或其他地方移动。它是使用标题来完成的。`C-c C-w` 就是做这个的。我设置成这样:

```
(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
(setq org-refile-use-outline-path 'file)
```

### 归档分类

一段时间后，你的文件就会被已经完成的事情弄得乱七八糟。Org 模式有一个[归档][6]特性，可以将主 `.org` 文件移到其他文件中，以备将来参考。如果你在 `git` 或其他软件中 有 Org 文件，你可能希望删除这些其他文件，因为无论如何都会在历史中拥有这些文件，但是我发现它们对于析取和搜索非常方便。

我会定期检查并归档文件中的所有内容。基于 [stackoverflow 的讨论][7]，我有以下代码：

```
(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'file)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/CANCELLED" 'file)
)
```

这基于[一个特定的答案][8] —— 你可以从评论那获得一些额外的提示。现在你可以运行 `M-x org-archive-done-tasks`，当前文件中所有标记为 `DONE` 或 `CANCELED` 的内容都将放到另一个文件中。

### 下一篇

我将通过讨论在 Org 模式中自动接受邮件以及在不同的机器上同步来对 Org 模式进行总结。


--------------------------------------------------------------------------------

via: https://changelog.complete.org/archives/9877-emacs-3-more-on-org-mode

作者：[John Goerzen][a]
选题：[lujun9972][b]
译者：[oneforalone](https://github.com/oneforalone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://changelog.complete.org/archives/author/jgoerzen
[b]: https://github.com/lujun9972
[1]: https://changelog.complete.org/archives/tag/emacs2018
[2]: https://orgmode.org/guide/TODO-Items.html#TODO-Items
[3]: https://orgmode.org/guide/Agenda-Views.html#Agenda-Views
[4]: https://linux.cn/article-10312-1.html
[5]: https://orgmode.org/guide/Tags.html#Tags
[6]: https://orgmode.org/guide/Archiving.html#Archiving
[7]: https://stackoverflow.com/questions/6997387/how-to-archive-all-the-done-tasks-using-a-single-command
[8]: https://stackoverflow.com/a/27043756
