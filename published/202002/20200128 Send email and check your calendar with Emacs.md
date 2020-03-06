[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11932-1.html)
[#]: subject: (Send email and check your calendar with Emacs)
[#]: via: (https://opensource.com/article/20/1/emacs-mail-calendar)
[#]: author: (Kevin Sonney https://opensource.com/users/ksonney)

使用 Emacs 发送电子邮件和检查日历
======

> 在 2020 年用开源实现更高生产力的二十种方式的第十八篇文章中，使用 Emacs 文本编辑器管理电子邮件和查看日程安排。

![](https://img.linux.net.cn/data/attachment/album/202002/26/103647mnee75vxhcc00z06.jpg)

去年，我给你们带来了 2019 年的 19 天新生产力工具系列。今年，我将采取一种不同的方式：建立一个新的环境，让你使用已用或未用的工具来在新的一年里变得更有效率。

### 使用 Emacs 做（几乎）所有的事情，第 1 部分

两天前，我曾经说过我经常使用 [Vim][2] 和 [Emacs][3]，在本系列的 [16][4] 和 [17][5] 天，我讲解了如何在 Vim 中做几乎所有的事情。现在，Emacs 的时间到了！

![Emacs 中的邮件和日历][6]

在深入之前，我需要说明两件事。首先，我这里使用默认的 Emacs 配置，而不是我之前[写过][8]的  [Spacemacs][7]。为什么呢？因为这样一来我使用的就是默认快捷键，从而使你可以参考文档，而不必将“原生的 Emacs” 转换为 Spacemacs。第二，在本系列文章中我没有对 Org 模式进行任何设置。Org 模式本身几乎可以自成一个完整的系列，它非常强大，但是设置可能非常复杂。

#### 配置 Emacs

配置 Emacs 比配置 Vim 稍微复杂一些，但以我之见，从长远来看，这样做是值得的。首先我们创建一个配置文件，并在 Emacs 中打开它：

```
mkdir ~/.emacs.d
emacs ~/.emacs.d/init.el
```

接下来，向内置的包管理器添加一些额外的包源。在 `init.el` 中添加以下内容：

```
(package-initialize)
(add-to-list 'package-archives '("melpa" . "<http://melpa.org/packages/>"))
(add-to-list 'package-archives '("org" . "<http://orgmode.org/elpa/>") t)
(add-to-list 'package-archives '("gnu" . "<https://elpa.gnu.org/packages/>"))
(package-refresh-contents)
```

使用 `Ctrl+x Ctrl+s` 保存文件，然后按下 `Ctrl+x Ctrl+c` 退出，再重启 Emacs。Emacs 会在启动时下载所有的插件包列表，之后你就可以使用内置的包管理器安装插件了。输入 `Meta+x` 会弹出命令提示符（大多数键盘上 `Meta` 键就是的 `Alt` 键，而在 MacOS 上则是 `Option`）。在命令提示符下输入 `package-list-packages` 就会显示可以安装的包列表。遍历该列表并使用 `i` 键选择以下包：

```
bbdb
bbdb-vcard
calfw
calfw-ical
notmuch
```

选好软件包后按 `x` 安装它们。根据你的网络连接情况，这可能需要一段时间。你也许会看到一些编译错误，但是可以忽略它们。安装完成后，使用组合键 `Ctrl+x Ctrl+f` 打开 `~/.emacs.d/init.el`，并在 `(package-refresh-packages)` 之后、 `(custom-set-variables` 之前添加以下行到文件中。
`(custom-set-variables` 行由 Emacs 内部维护，你永远不应该修改它之后的任何内容。以 `;;` 开头的行则是注释。

```
;; Set up bbdb
(require 'bbdb)
(bbdb-initialize 'message)
(bbdb-insinuate-message)
(add-hook 'message-setup-hook 'bbdb-insinuate-mail)
;; set up calendar
(require 'calfw)
(require 'calfw-ical)
;; Set this to the URL of your calendar. Google users will use
;; the Secret Address in iCalendar Format from the calendar settings
(cfw:open-ical-calendar "<https://path/to/my/ics/file.ics>")
;; Set up notmuch
(require 'notmuch)
;; set up mail sending using sendmail
(setq send-mail-function (quote sendmail-send-it))
(setq user-mail-address "[myemail@mydomain.com][9]"
      user-full-name "My Name")
```

现在，你已经准备好使用自己的配置启动 Emacs 了！保存 `init.el` 文件（`Ctrl+x Ctrl+s`），退出 Emacs（`Ctrl+x Ctrl+c`），然后重启之。这次重启要多花些时间。

#### 使用 Notmuch 在 Emacs 中读写电子邮件

一旦你看到了 Emacs 启动屏幕，你就可以使用 [Notmuch][10] 来阅读电子邮件了。键入 `Meta+x notmuch`，你将看到 notmuch 的 Emacs 界面。

![使用 notmuch 阅读邮件][11]

所有加粗的项目都是指向电子邮件视图的链接。你可以通过点击鼠标或者使用 `tab` 键在它们之间跳转并按回车来访问它们。你可以使用搜索栏来搜索 Notmuch 的数据库，语法与 Notmuch 命令行上的[语法][12] 相同。如果你愿意，还可以使用 `[save]` 按钮保存搜索以便未来使用，这些搜索会被添加到屏幕顶部的列表中。如果你进入一个链接就会看到一个相关电子邮件的列表。你可以使用箭头键在列表中导航，并在要读取的消息上按回车。按 `r` 可以回复一条消息，`f` 转发该消息，`q` 退出当前屏幕。

你可以通过键入 `Meta+x compose-mail` 来编写新消息。撰写、回复和转发都将打开编写邮件的界面。写完邮件后，按 `Ctrl+c Ctrl+c` 发送。如果你决定不发送它，按 `Ctrl+c Ctrl+k` 关闭消息撰写缓冲区（窗口）。

#### 使用 BBDB 在 Emacs 中自动补完电子邮件地址

![在消息中使用 BBDB 地址][13]

那么通讯录怎么办？这就是 [BBDB][14] 发挥作用的地方。但首先我们需要从 [abook][15] 导入所有地址，方法是打开命令行并运行以下导出命令：

```
abook --convert --outformat vcard --outfile ~/all-my-addresses.vcf --infile ~/.abook/addresses
```

Emacs 启动后，运行 `Meta+x bbdb-vcard-import-file`。它将提示你输入要导入的文件名，即 `~/all-my-address.vcf`。导入完成后，在编写消息时，可以开始输入名称并使用 `Tab` 搜索和自动完成 “to” 字段的内容。BBDB 还会打开一个联系人缓冲区，以便你确保它是正确的。

既然在 [vdirsyncer][16] 中已经为每个地址都生成了对应的 .vcf 文件了，为什么我们还要这样做呢？如果你像我一样，有许多地址，一次处理一个地址是很麻烦的。这样做，你就可以把所有的东西都放在 abook 里，做成一个大文件。

#### 使用 calfw 在 Emacs 中浏览日历

![calfw 日历 ][17]

最后，你可以使用 Emacs 查看日历。在上面的配置中，你安装了 [calfw][18] 包，并添加了一些行来告诉它在哪里可以找到要加载的日历。Calfw 是 “<ruby>Emacs 日历框架<rt>Calendar Framework for Emacs</rt></ruby>”的简称，它支持多种日历格式。我使用的是谷歌日历，这也是我放在配置中的链接。日历将在启动时自动加载，你可以通过 `Ctrl+x+b` 命令切换到 cfw-calendar 缓冲区来查看日历。

Calfw 提供日、周、双周和月视图。你可以在日历顶部选择视图，并使用箭头键导航日历。不幸的是，calfw 只能查看日历，所以你仍然需要使用 [khal][19] 之类的工具或通过 web 界面来添加、删除和修改事件。

这就是 Emacs 中的邮件、日历和邮件地址。明天我会展示更多。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/1/emacs-mail-calendar

作者：[Kevin Sonney][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ksonney
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/email_paper_envelope_document.png?itok=uPj_kouJ (Document sending)
[2]: https://www.vim.org/
[3]: https://www.gnu.org/software/emacs/
[4]: https://linux.cn/article-11908-1.html
[5]: https://linux.cn/article-11912-1.html
[6]: https://opensource.com/sites/default/files/uploads/productivity_18-1.png (Mail and calendar in Emacs)
[7]: https://www.spacemacs.org/
[8]: https://opensource.com/article/19/12/spacemacs
[9]: mailto:myemail@mydomain.com
[10]: https://notmuchmail.org/
[11]: https://opensource.com/sites/default/files/uploads/productivity_18-2.png (Reading mail with Notmuch)
[12]: https://linux.cn/article-11807-1.html
[13]: https://opensource.com/sites/default/files/uploads/productivity_18-3.png (Composing a message with BBDB addressing)
[14]: https://www.jwz.org/bbdb/
[15]: https://linux.cn/article-11834-1.html
[16]: https://linux.cn/article-11812-1.html
[17]: https://opensource.com/sites/default/files/uploads/productivity_18-4.png (calfw calendar)
[18]: https://github.com/kiwanami/emacs-calfw
[19]: https://khal.readthedocs.io/en/v0.9.2/index.html
