[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11956-1.html)
[#]: subject: (Use Emacs to get social and track your todo list)
[#]: via: (https://opensource.com/article/20/1/emacs-social-track-todo-list)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 Emacs 进行社交并跟踪你的待办事项列表
======

> 在 2020 年用开源实现更高生产力的二十种方式的第十九篇文章中，访问 Twitter、Reddit、 交谈、电子邮件 、RSS 和你的待办事项列表。

![](https://img.linux.net.cn/data/attachment/album/202003/04/100911lg2vrv92692b422y.jpg)

去年，我在 19 天里给你介绍了 19 个新（对你而言）的生产力工具。今年，我换了一种方式：使用你在使用或者还没使用的工具，构建一个使你可以在新一年更加高效的环境。

### 使用 Emacs 做（几乎）所有的事情，第 2 部分

[昨天][2]，我谈到了如何在 Emacs 中读取电子邮件、访问电子邮件地址和显示日历。Emacs 功能繁多，你还可以将它用于 Twitter、交谈、待办事项列表等等！

![在 Emacs 中处理所有事情][3]

要完成所有这些，你需要安装一些 Emacs 包。和昨天一样，用 `Meta+x package-manager` 打开 Emacs 包管理器（Meta 键在大多数键盘上是 `Alt`，在 MacOS 上是 `Option`）。然后通过 `i` 选择以下带有的软件包，然后输入 `x` 进行安装：

```
nnreddit
todotxt
twittering-mode
```

安装之后，按下 `Ctrl+x ctrl+f` 打开 `~/.emacs.d/init.el`，并在 `(custom-set-variables` 行前加上：

```
;; Todo.txt
(require 'todotxt)
(setq todotxt-file (expand-file-name "~/.todo/todo.txt"))

;; Twitter
(require 'twittering-mode)
(setq twittering-use-master-password t)
(setq twittering-icon-mode t)

;; Python3 for nnreddit
(setq elpy-rpc-python-command "python3")
```

按下 `Ctrl+x Ctrl+s` 保存文件，使用 `Ctrl+x Ctrl+c` 退出 Emacs，然后重启 Emacs。

#### 使用 twittering-mode 在 Emacs 中发推

![Emacs 中的 Twitter][4]

[Twittering-mode][5] 是 Twitter 最好的 Emacs 接口之一。它几乎支持 Twitter 的所有功能，并且键盘快捷键也易于使用。

首先，输入 `Meta+x twit` 来启动 twittering-mode。它会提供一个 URL 并提示你启动浏览器来访问它，你登录该 URL 后就能获得授权令牌。将令牌复制并粘贴到 Emacs 中，你的 Twitter 时间线就会加载了。你可以使用箭头键滚动，使用 `Tab` 从一个项目移动到另一个项目，并按回车访问光标所在的 URL。如果光标在用户名上，按回车将在 web 浏览器中打开时间轴。如果你在一条推文的文本上，按回车将回复该推文。你可以用 `u` 创建一个新的推文，用 `Ctrl+c+Enter` 转发一些内容，然后用 `d` 发送一条即时消息——它打开的对话框中有关于如何发送、取消和缩短 URL 的说明。

按 `V` 会打开一个提示让你跳转到其他时间线。输入 `:mentions` 打开你的提及。输入 `:home` 打开你的主时间线，输入用户名将进入该用户的时间线。最后，按 `q` 会退出 twittering-mode 并关闭窗口。

twitter-mode 还有更多功能，我鼓励你阅读它 GitHub 页面上的[完整功能列表][6]。

#### 在 Emacs 上使用 Todotxt.el 追踪你的待办事项

![Emacs 中的 todo.txt][7]

[Todotxt.el][8] 是一个很棒的 [todo.txt][9] 待办列表管理器接口。它的快捷键几乎无所不包。

输入 `Meta+x todotxt` 启动它将加载 `todotxt-file` 变量中指定的 `todo.txt` 文件（本文的第一部分中设置了该文件）。在 `todo.txt` 的缓冲区（窗口），你可以按 `a` 添加新任务并和按 `c` 标记它已被完成。你还可以使用 `r` 设置优先级，并使用 `t` 添加项目和上下文。完成事项后只需要按下 `A` 即可将任务移如 `done.txt`。你可以使用 `/` 过滤列表，也可以使用 `l` 刷新完整列表。同样，你可以按 `q` 退出。

#### 在 Emacs 中使用 ERC 进行交谈

![使用 ERC 与人交谈 ][10]

Vim 的缺点之一是很难用它与人交谈。另一方面，Emacs 则将 [ERC][11] 客户端内置到默认发行版中。使用 `Meta+x ERC` 启动 ERC，系统将提示你输入服务器、用户名和密码。你可以使用几天前介绍设置 [BitlBee][12] 时使用的相同信息：服务器为 `localhost`，端口为 `6667`，相同用户名，无需密码。

ERC 使用起来与其他 IRC 客户端一样。每个频道单独一个缓冲区（窗口），你可以使用 `Ctrl+x ctrl+b` 进行频道间切换，这也可以在 Emacs 中的其他缓冲区之间进行切换。`/quit` 命令将退出 ERC。

#### 使用 Gnus 阅读电子邮件，Reddit 和 RSS

![Mail，Reddit，and RSS feeds with Gnus][13]

我相信昨天在我提及在 Emacs 中阅读邮件时，许多 Emacs 的老用户会问，“怎么没有 [Gnus][14] 呢？”

这个疑问很合理。Gnus 是一个内置在 Emacs 中的邮件和新闻阅读器，尽管它这个邮件阅读器不支持以 [Notmuch][15] 作为搜索引擎。但是，如果你将其配置来阅读 Reddit 和 RSS feed（稍后你将这样做），那么同时使用它来阅读邮件是个聪明的选择。

Gnus 是为阅读 Usenet 新闻而创建的，并从此发展而来。因此，它的很多外观和感觉（以及术语）看起来很像 Usenet 的新闻阅读器。

Gnus 以 `~/.gnus` 作为自己的配置文件。（该配置也可以包含在 `~/.emacs.d/init.el` 中）。使用 `Ctrl+x Ctrl+f` 打开 `~/.gnus`，并添加以下内容：


```
;; Required packages
(require 'nnir)
(require 'nnrss)

;; Primary Mailbox
(setq gnus-select-method
      '(nnmaildir "Local"
                  (directory "~/Maildir")
                  (nnir-search-engine notmuch)
      ))
(add-to-list 'gnus-secondary-select-methods
             '(nnreddit ""))
```

用 `Ctrl+x Ctrl+s` 保存文件。这分配置告诉 Gnus 从 `~/Maildir` 这个本地邮箱中读取邮件作为主源（参见 `gnus-select-method` 变量），并使用 [nnreddit][16] 插件添加辅源（`gnus-secondary-select-methods` 变量）。你还可以定义多个辅助源，包括 Usenet 新闻（nntp）、IMAP （nnimap）、mbox（nnmbox）和虚拟集合（nnvirtual）。你可以在 [Gnus 手册][17] 中了解更多有关所有选项的信息。

保存文件后，使用 `Meta+x Gnus` 启动 Gnus。第一次运行将在 Python 虚拟环境中安装 [Reddit 终端查看器][18]，Gnus 通过它获取 Reddit 上的文章。然后它会启动浏览器来登录 Reddit。之后，它会扫描并加载你订阅的 Reddit 群组。你会看到一个有新邮件的邮件夹列表和一个有新内容的看板列表。在任一列表上按回车将加载该组中的消息列表。你可以使用箭头键导航并按回车加载和读取消息。在查看消息列表时，按 `q` 将返回到前一个视图，从主窗口按 `q` 将退出 Gnus。在阅读 Reddit 群组时，`a` 会创建一条新消息;在邮件组中，`m` 创建一个新的电子邮件;并且在任何一个视图中按 `r` 回复邮件。

你还可以向 Gnus 接口中添加 RSS 流，并像阅读邮件和新闻组一样阅读它们。要添加 RSS 流，输入 `G+R` 并填写 RSS 流的 URL。会有提示让你输入 RSS 的标题和描述，这些信息可以从流中提取出来并填充进去。现在输入 `g` 来检查新消息（这将检查所有组中的新消息）。阅读 RSS 流 就像阅读 Reddit 群组和邮件一样，它们使用相同的快捷键。

Gnus 中有*很多*功能，还有大量的键组合。[Gnus 参考卡][19]为每个视图列出了所有这些键组合（以非常小的字体显示在 5 页纸上）。

#### 使用 nyan-mode 查看位置

最后，你可能会一些截屏底部注意到 [Nyan cat][20]。这是 [nyan-mode][21]，它指示了你在缓冲区中的位置，因此当你接近文档或缓冲区的底部时，它会变长。你可以使用包管理器安装它，并在 `~/.emacs.d/init.el` 中使用以下代码进行设置：

```
;; Nyan Cat
(setq nyan-wavy-trail t)
(setq nyan-bar-length 20)
(nyan-mode)
```

### Emacs 的基本功能

这只是 Emacs 所有功能的皮毛。Emacs *非常*强大，是我用来提高工作效率的必要工具之一，无论我是在追踪待办事项、阅读和回复邮件、编辑文本，还是与朋友和同事交流我都用它。这需要一点时间来适应，但是一旦你习惯了，它就会成为你桌面上最有用的工具之一。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/emacs-social-track-todo-list

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/talk_chat_team_mobile_desktop.png?itok=d7sRtKfQ (Team communication, chat)
[2]: https://linux.cn/article-11932-1.html
[3]: https://opensource.com/sites/default/files/uploads/productivity_19-1.png (All the things with Emacs)
[4]: https://opensource.com/sites/default/files/uploads/productivity_19-2.png (Twitter in Emacs)
[5]: https://github.com/hayamiz/twittering-mode
[6]: https://github.com/hayamiz/twittering-mode#features
[7]: https://opensource.com/sites/default/files/uploads/productivity_19-3.png (todo.txt in emacs)
[8]: https://github.com/rpdillon/todotxt.el
[9]: http://todotxt.org/
[10]: https://opensource.com/sites/default/files/uploads/productivity_19-4.png (Chatting with erc)
[11]: https://www.gnu.org/software/emacs/manual/html_mono/erc.html
[12]: https://linux.cn/article-11856-1.html
[13]: https://opensource.com/sites/default/files/uploads/productivity_19-5.png (Mail, Reddit, and RSS feeds with Gnus)
[14]: https://www.gnus.org/
[15]: https://linux.cn/article-11807-1.html
[16]: https://github.com/dickmao/nnreddit
[17]: https://www.gnus.org/manual/gnus.html
[18]: https://pypi.org/project/rtv/
[19]: https://www.gnu.org/software/emacs/refcards/pdf/gnus-refcard.pdf
[20]: http://www.nyan.cat/
[21]: https://github.com/TeMPOraL/nyan-mode
