[#]: collector: (lujun9972)
[#]: translator: (lxbwolf)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (20 productivity tools for the Linux terminal)
[#]: via: (https://opensource.com/article/20/6/productivity-tools-linux-terminal)
[#]: author: (Alan Smithee https://opensource.com/users/alansmithee)

20 个 Linux 终端下的生产力工具
======
来试下这些开源工具。你的效率一定会提升。
![Computer screen with files or windows open][1]

诚然，很多人使用计算机来娱乐。但是一些人会用来工作，他们的理论是计算机应当能帮我们更快、更好、更有组织地做事。实际应用中，如果没有根据每个人的工作风格来做一些小小的手动配置，计算机也不会提升我们的效率。

[Kevin Sonney][2] 喜欢设计系统，今年他在一个 20 篇文章的系列中介绍了 18 种不同的生产力工具，不仅涵盖了网络方面，也涉及了一些能提升他的工作效率的工具。Kevin 最喜欢的所有的工具都收集到了本文，下面概括介绍每种工具的用途。

### 文件同步

![][3]

重要的文件应谨慎管理。

  * [Syncthing][4] 能使不同设备上的文件彼此同步。*设备*可以是 Linux、Windows 或 Mac、一台服务器、Android 平板或手机，等等。文件可以是你期望在多台机器间同步的任意文件。Syncthing 是轻量级的点对点工具，因此你不需要花费时间搭建服务，你不需要第三方的服务器，而且它很快。
  * 同步是一件事，但有时你还需要帮忙处理文件。假设你有一个应用程序，它在被作为一个图形化应用和作为控制台应用时有不同的展现形式。你可以它的符号链接指向的修改配置文件，如 `.foo-gui` 和 `.foo-term`。这完全可以手动修改，但也可以用脚本处理，或者你可以试试 [GNU Stow][5]。



### 邮件管理

![][6]

我们都依赖邮件和收件箱，但我们几乎没有人对管理邮件的方式很满意。如果你喜欢用终端工作，为什么不在终端里管理邮件呢？在终端里收发邮件是一件事，但是在终端里组织你的邮件会令人兴奋。如果你的职业是打字员或是天生的编剧，试试这类工具吧。

  * 我每天用 [OfflineIMAP][7] 把工作邮件同步到笔记本，用 Mutt 看邮件。它是很特别的工具，只做一件事：保证本地的邮件副本与远程的收件箱完全同步。配置和用 [cron][8] 调度它都相当简单，然后你就可以忘了它的存在。它相当简单，你与 IMAP 打交道的时间都应该用它。
  * [Notmuch][9] 能为邮件消息简历索引、加标签以及搜索邮件。如果你的收件箱出了问题，*不需要*花费很大精力去补救。
  * [Vim][10] 可以收发邮件和管理你的日历。
  * 当然，[Emacs][11] 可以收发邮件和管理你的日历。



### 日历和联系人

![][12]

我用过的所有的 Linux 系统都预装了 `cal` 命令。这是一个在终端下用的便捷小日历，它也是个伟大的速查工具。然而，它几乎不能被称为一个日历应用程序。[iCalendar][13] 说明书（不是 Apple 的旧桌面日历）中提供了丰富的共享日历功能，`.ics` 约定了事件是纯文本，这导致了在终端中管理它们的工作流不会存在。至少，在 khal 和 vdirsyncer 出现之前不存在。

  * [Khal][14] 是基于控制台的读写 `.ics` 文件的日历工具。
  * [Vdirsyncer][14] 是一个能把线上日历（和联系人）同步到本地的终端命令。Khal 在本地运行，vdirsyncer 在远程运行，这样远程的日历能与你管理的本地日历保持同步。
  * 管理联系人可能会很难，但是如果你用了 [Khard][15] 这个以 vCard 格式读写文件的终端命令，就会变得简单。这个命令能反过来同步运行着 vdirsyncer（你可能在用 khal 日历时已经运行了）的远程服务器。这使得日历和联系人管理变得简单，而且[搭建个人信息管理（PIM）服务器][16]也比以前容易得多。



### 待办清单

![][17]

  * 组织你每天的行程有很多种方式，但是最简单的一种是用 [todo.txt][18]，一个简单、便携式、易于理解的系统，即使设备上没有安装 todo.txt 也不会崩溃。todo.txt 能正常运行的原因是，它就是一个 Bash 脚本，能在几乎所有你能找到的的设备上运行。操作过程很简单：下载脚本，安装到家目录，用一个简单的命令开始调度任务。如果你的计算机上没有安装 `todo.sh` 命令，那么你的待办清单仍然可以作为纯文本文件来使用，你可以在需要时手动更新它。
  * [Jrnl][19] 是一个能追踪的你的日常议程和活动的数字笔记本。如果你要摘抄桌面上的报纸的片段或者把随意的想法写下来，那么这就是你要找的程序。



### 保持联络

![][20]

现在交流比以前更关键，但是管理交流平台是个问题。这不仅仅是几个客户端，而是几个独立的网络。你怎么管理它们？这里有两个方案。

  * 如果你在很多个交流网络中积累了大量的联系人，那么你应该试试 [BitlBee][21]，使用这一个聊天客户端就可以关联其他所有的客户端。
  * [Rainbow Stream][22] 是个推特客户端，能让你不被开放的网页浏览器分心，而又能紧跟时事。



### 消息通知

![][23]

网页浏览器很好，但有时过犹不及。你希望能及时收到消息，但是你又不想全身心地投入到互联网中。因为互联网是以开放的规格和大量的开源技术构建的，你不必在一个界面中做所有的事。对于不同的任务有不同的*客户端*，通过它们你能得到需要的信息，你只需要使用喜欢的界面就可以了。

  * [Tuir][24] 是一个 Reddit 终端客户端。
  * [Newsboat][25] 是一个 RSS 阅读器。
  * [Wego][26] 是天气预报工具。
  * [Vim][27] 可以帮助你登录 Reddit 和 Twitter。
  * [Emacs][28] 能让你保持与 Reddit、Twitter 和聊天客户端的联系。



### 保持终端一直开启

![][29]

如果你正在用终端工作，那么关闭它的意义是什么呢？屏蔽掉 `exit` 和 `Ctrl+D`，保持你的控制台一直开启。

  * [Tmux][30] 能分割你的终端，让一个终端窗口”分层“到另一个窗口之上，甚至从一台计算机离开到另一台计算机后，能保持相同的终端会话。
  * [DESQview][31] 是另一种方式：它本质上是一个终端窗口管理器。



### 未完待续

本文列出的工具只是 Linux 终端的神奇生产力工具中的一小部分。这个清单会结束，但你自己的清单可以继续列。找到你喜欢的工具，学习它们，让他们为你带来最大的收益。当然，一个好的工具不一定要提高你的生产力：有时你最喜欢的命令也可以是能让你最快乐的命令。你的工作是找到自己喜欢的命令，用它们来改变世界。

玩得愉快！

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/6/productivity-tools-linux-terminal

作者：[Alan Smithee][a]
选题：[lujun9972][b]
译者：[lxbwolf](https://github.com/lxbwolf)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alansmithee
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_screen_windows_files.png?itok=kLTeQUbY (Computer screen with files or windows open)
[2]: https://opensource.com/users/ksonney
[3]: https://opensource.com/sites/default/files/uploads/productivity_2-1.png
[4]: https://opensource.com/article/20/1/sync-files-syncthing
[5]: https://opensource.com/article/20/1/configuration-management-stow
[6]: https://opensource.com/sites/default/files/uploads/productivity_3-1.png
[7]: https://opensource.com/article/20/1/sync-email-offlineimap
[8]: https://opensource.com/article/17/11/how-use-cron-linux
[9]: https://opensource.com/article/20/1/organize-email-notmuch
[10]: https://opensource.com/article/20/1/vim-email-calendar
[11]: https://opensource.com/article/20/1/emacs-mail-calendar
[12]: https://opensource.com/sites/default/files/uploads/productivity_5-1.png
[13]: https://tools.ietf.org/html/rfc5545
[14]: https://opensource.com/article/20/1/open-source-calendar
[15]: https://opensource.com/article/20/1/sync-contacts-locally
[16]: https://opensource.com/alternatives/google-calendar
[17]: https://opensource.com/sites/default/files/uploads/productivity_7-1.png
[18]: https://opensource.com/article/20/1/open-source-to-do-list
[19]: https://opensource.com/article/20/1/python-journal
[20]: https://opensource.com/sites/default/files/uploads/productivity_9-1.png
[21]: https://opensource.com/article/20/1/open-source-chat-tool
[22]: https://opensource.com/article/20/1/tweet-terminal-rainbow-stream
[23]: https://opensource.com/sites/default/files/uploads/productivity_13-1.png
[24]: https://opensource.com/article/20/1/open-source-reddit-client
[25]: https://opensource.com/article/20/1/open-source-rss-feed-reader
[26]: https://opensource.com/article/20/1/open-source-weather-forecast
[27]: https://opensource.com/article/20/1/vim-task-list-reddit-twitter
[28]: https://opensource.com/article/20/1/emacs-social-track-todo-list
[29]: https://opensource.com/sites/default/files/uploads/productivity_14-1.png
[30]: https://opensource.com/article/20/1/tmux-console
[31]: https://opensource.com/article/20/1/multiple-consoles-twin
