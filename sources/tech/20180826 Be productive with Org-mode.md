[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Be productive with Org-mode)
[#]: via: (https://www.badykov.com/emacs/2018/08/26/be-productive-with-org-mode/)
[#]: author: (Ayrat Badykov https://www.badykov.com)

Be productive with Org-mode
======


![org-mode-collage][1]

### Introduction

In my [previous post about emacs][2] I mentioned [Org-mode][3], a note manager and organizer. In this post, I’ll describe my day-to-day Org-mode use cases.

### Notes and to-do lists

First and foremost, Org-mode is a tool for managing notes and to-do lists and all work in Org-mode is centered around writing notes in plain text files. I manage several kinds of notes using Org-mode.

#### General notes

The most basic Org-mode use case is writing simple notes about things that you want to remember. For example, here are my notes about things I’m learning right now:

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

How it looks using [org-bullets][4]:

![notes][5]

In this simple example you can see some of the Org-mode features:

  * nested notes
  * links
  * lists with checkboxes



#### Project todos

Often when I’m working on some task I notice things that I can improve or fix. Instead of leaving TODO comment in source code files (bad smell) I use [org-projectile][6] which allows me to write TODO items with a single shortcut in a separate file. Here’s an example of this file:

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

How it looks in Emacs:

![project-todos][7]

In this example you can see more Org mode features:

  * todo items have states - `TODO`, `DONE`. You can define your own states (`WAITING` etc)
  * closed items have `CLOSED` timestamp
  * some items have priorities - A, B, C.
  * links can be internal (`[[file:~/...]`)



#### Capture templates

As described in Org-mode’s documentation, capture lets you quickly store notes with little interruption of your workflow.

I configured several capture templates which help me to quickly create notes about things that I want to remember.

```
(setq org-capture-templates
'(("t" "Todo" entry (file+headline "~/Dropbox/org/todo.org" "Todo soon")
"* TODO %? \n %^t")
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

For a book note I should add its name and its author, for a movie note I should add tags etc.

### Planning

Another great feature of Org-mode is that you can use it as a day planner. Let’s see an example of one of my days:

![schedule][8]

I didn’t give a lot of thought to this example, it’s my real file for today. It doesn’t look like much but it helps to spend your time on things that important to you and fight with procrastination.

#### Habits

From Org mode’s documentation, Org has the ability to track the consistency of a special category of TODOs, called “habits”. I use this feature along with day planning when I want to create new habits:

![habits][9]

As you can see currently I’m trying to wake early every day and workout once in two days. Also, it helped to start reading books every day.

#### Agenda views

Last but not least I use agenda views. Todo items can be scattered throughout different files (in my case daily plan and habits are in separate files), agenda views give an overview of all todo items:

![agenda][10]

### More Org mode features


+ Smartphone apps (Android, ios)

+ Exporting Org mode files into different formats (html, markdown, pdf, latex etc)

+ Tracking Finances with ledger

### Conclusion

In this post, I described a small subset of Org-mode’s extensive functionality that helps me be productive every day, spending time on things that important to me.


--------------------------------------------------------------------------------

via: https://www.badykov.com/emacs/2018/08/26/be-productive-with-org-mode/

作者：[Ayrat Badykov][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

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
