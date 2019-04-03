[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10634-1.html)
[#]: subject: (Be productive with Org-mode)
[#]: via: (https://www.badykov.com/emacs/2018/08/26/be-productive-with-org-mode/)
[#]: author: (Ayrat Badykov https://www.badykov.com)

高效使用 Org 模式
======

![org-mode-collage][1]

### 简介

在我 [前一篇关于 Emacs 的文章中][2] 我提到了 <ruby>[Org 模式][3]<rt>Org-mode</rt></ruby>，这是一个笔记管理工具和组织工具。本文中，我将会描述一下我日常的 Org 模式使用案例。

### 笔记和代办列表

首先而且最重要的是，Org 模式是一个管理笔记和待办列表的工具，Org 模式的所有工具都聚焦于使用纯文本文件记录笔记。我使用 Org 模式管理多种笔记。

#### 一般性笔记

Org 模式最基本的应用场景就是以笔记的形式记录下你想记住的事情。比如，下面是我正在学习的笔记内容：

```
* Learn
** Emacs LISP
*** Plan

   - [ ] Read best practices
   - [ ] Finish reading Emacs Manual
   - [ ] Finish Exercism Exercises
   - [ ] Write a couple of simple plugins
     - Notification plugin

*** Resources

   https://www.gnu.org/software/emacs/manual/html_node/elisp/index.html
   http://exercism.io/languages/elisp/about
   [[http://batsov.com/articles/2011/11/30/the-ultimate-collection-of-emacs-resources/][The Ultimate Collection of Emacs Resources]]

** Rust gamedev
*** Study [[https://github.com/SergiusIW/gate][gate]] 2d game engine with web assembly support
*** [[ggez][https://github.com/ggez/ggez]]
*** [[https://www.amethyst.rs/blog/release-0-8/][Amethyst 0.8 Relesed]]

** Upgrade Elixir/Erlang Skills
*** Read Erlang in Anger
```

借助 [org-bullets][4] 它看起来是这样的：

![notes][5]

在这个简单的例子中，你能看到 Org 模式的一些功能：

- 笔记允许嵌套
- 链接
- 带复选框的列表

#### 项目待办

我在工作时时常会发现一些能够改进或修复的事情。我并不会在代码文件中留下 TODO 注释 (坏味道)，相反我使用 [org-projectile][6] 来在另一个文件中记录一个 TODO 事项，并留下一个快捷方式。下面是一个该文件的例子：

```
* [[elisp:(org-projectile-open-project%20"mana")][mana]] [3/9]
  :PROPERTIES:
  :CATEGORY: mana
  :END:
** DONE [[file:~/Development/mana/apps/blockchain/lib/blockchain/contract/create_contract.ex::insufficient_gas_before_homestead%20=][fix this check using evm.configuration]]
   CLOSED: [2018-08-08 Ср 09:14]
  [[https://github.com/ethereum/EIPs/blob/master/EIPS/eip-2.md][eip2]]:
  If contract creation does not have enough gas to pay for the final gas fee for
  adding the contract code to the state, the contract creation fails (i.e. goes out-of-gas)
  rather than leaving an empty contract.
** DONE Upgrade Elixir to 1.7.
   CLOSED: [2018-08-08 Ср 09:14]
** TODO [#A] Difficulty tests
** TODO [#C] Upgrage to OTP 21
** DONE [#A] EIP150
   CLOSED: [2018-08-14 Вт 21:25]
*** DONE operation cost changes
    CLOSED: [2018-08-08 Ср 20:31]
*** DONE 1/64th for a call and create
    CLOSED: [2018-08-14 Вт 21:25]
** TODO [#C] Refactor interfaces
** TODO [#B] Caching for storage during execution
** TODO [#B] Removing old merkle trees
** TODO do not calculate cost twice
* [[elisp:(org-projectile-open-project%20".emacs.d")][.emacs.d]] [1/3]
  :PROPERTIES:
  :CATEGORY: .emacs.d
  :END:
** TODO fix flycheck issues (emacs config)
** TODO use-package for fetching dependencies
** DONE clean configuration
   CLOSED: [2018-08-26 Вс 11:48]
```

它看起来是这样的：

![project-todos][7]

本例中你能看到更多的 Org 模式的功能：

- 代办列表具有 `TODO`、`DONE` 两个状态。你还可以定义自己的状态 (`WAITING` 等)
- 关闭的事项有 `CLOSED` 时间戳
- 有些事项有优先级 - A、B、C
- 链接可以指向文件内部 (`[[file:~/。..]`)

#### 捕获模板

正如 Org 模式的文档中所描述的，捕获可以在不怎么干扰你工作流的情况下让你快速存储笔记。

我配置了许多捕获模板，可以帮我快速记录想要记住的事情。

```
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Todo soon")
           "* TODO %? \n  %^t")
          ("i" "Idea" entry (file+headline "~/Dropbox/org/ideas.org" "Ideas")
           "* %? \n %U")
          ("e" "Tweak" entry (file+headline "~/Dropbox/org/tweaks.org" "Tweaks")
           "* %? \n %U")
          ("l" "Learn" entry (file+headline "~/Dropbox/org/learn.org" "Learn")
           "* %? \n")
          ("w" "Work note" entry (file+headline "~/Dropbox/org/work.org" "Work")
           "* %? \n")
          ("m" "Check movie" entry (file+headline "~/Dropbox/org/check.org" "Movies")
           "* %? %^g")
          ("n" "Check book" entry (file+headline "~/Dropbox/org/check.org" "Books")
           "* %^{book name} by %^{author} %^g")))
```

做书本记录时我需要记下它的名字和作者，做电影记录时我需要记下标签，等等。

### 规划

Org 模式的另一个超棒的功能是你可以用它来作日常规划。让我们来看一个例子：

![schedule][8]

我没有挖空心思虚构一个例子，这就是我现在真实文件的样子。它看起来内容并不多，但它有助于你花时间在在重要的事情上并且帮你对抗拖延症。

#### 习惯

根据 Org 模式的文档，Org 能够跟踪一种特殊的代办事情，称为 “习惯”。当我想养成新的习惯时，我会将该功能与日常规划功能一起连用：

![habits][9]

你可以看到，目前我在尝试每天早期并且每两天锻炼一次。另外，它也有助于让我每天阅读书籍。

#### 议事日程视图

最后，我还使用议事日程视图功能。待办事项可能分散在不同文件中(比如我就是日常规划和习惯分散在不同文件中)，议事日程视图可以提供所有待办事项的总览：

![agenda][10]

### 更多 Org 模式的功能

+ 手机应用（[Android](https://play.google.com/store/apps/details？id=com.orgzly&hl=en)、[ios](https://itunes.apple.com/app/id1238649962])）
+ [将 Org 模式文档导出为其他格式](https://orgmode.org/manual/Exporting.html)（html、markdown、pdf、latex 等）
+ 使用 [ledger](https://github.com/ledger/ledger-mode) [追踪财务状况](https://orgmode.org/worg/org-tutorials/weaving-a-budget.html)

### 总结

本文我描述了 Org 模式广泛功能中的一小部分，我每天都用它来提高工作效率，把时间花在重要的事情上。


--------------------------------------------------------------------------------

via: https://www.badykov.com/emacs/2018/08/26/be-productive-with-org-mode/

作者：[Ayrat Badykov][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.badykov.com
[b]: https://github.com/lujun9972
[1]: https://i.imgur.com/hgqCyen.jpg
[2]: http://www.badykov.com/emacs/2018/07/31/why-emacs-is-a-great-editor/
[3]: https://orgmode.org/
[4]: https://github.com/sabof/org-bullets
[5]: https://i.imgur.com/lGi60Uw.png
[6]: https://github.com/IvanMalison/org-projectile
[7]: https://i.imgur.com/Hbu8ilX.png
[8]: https://i.imgur.com/z5HpuB0.png
[9]: https://i.imgur.com/YJIp3d0.png
[10]: https://i.imgur.com/CKX9BL9.png
