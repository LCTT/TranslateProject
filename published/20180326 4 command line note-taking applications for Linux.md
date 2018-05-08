4 个 Linux 下的命令行笔记程序
===============

> 这些工具可以让你在 Linux 命令行下简单而有效地记录笔记和保存信息。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/note-taking.jpeg?itok=fiF5EBEb)

当你需要保存代码段或 URL、想法或引用时，可能会启动文本编辑器或使用[桌面][1]或[基于 Web 的][2]笔记记录工具。但那些不是你唯一的选择。如果你在终端窗口中工作，则可以使用 Linux 命令行下的许多笔记记录工具之一。

我们来看看这四个程序。

### tnote

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/tnote.png?itok=M84ABZcr)

[tnote][3] 使在终端窗口中记笔记很简单 —— 几乎太简单了。

tnote 是一个 Python 脚本。首次启动时，它会要求你输入密码和口令来加密存储笔记的 [SQLite 数据库][4]。完成之后，按 `A` 创建一个笔记。输入你的笔记，然后按 `CTRL-D` 保存。

一旦你有几个（或多个）笔记，你可以查看它们或搜索特定的笔记，单词或短语或标签。tnote 没有很多功能，但它确实实现了任务。

### Terminal Velocity

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/terminal_velocity.png?itok=rkWejQ7_)

如果你使用过 Mac OS，你可能会看到一个名为 [Notational Velocity][5] 的流行开源笔记程序，这是一种记录笔记的简单有效方法。[Terminal Velocity][6] 在将 Notational Velocity 体验带入命令行方面做得很好。

Terminal Velocity 打开你的默认文本编辑器（由你的 `.profile` 或 `.bashrc` 文件中的 `$EDITOR` 变量设置）。输入你的笔记，然后保存。该笔记出现在 Terminal Velocity 窗口的列表中。

使用键盘上的箭头键滚动查看你的笔记列表。要查看或编辑笔记，请按回车键。如果你有一长串笔记，则可以在 `Find or Create` 字段中输入笔记标题的前几个字符以缩小列表的范围。在那里滚动笔记并按下回车键将其打开。

### pygmynote

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/pygmynote.png?itok=Z8qEC4dq)

在本文中的四个应用中，[pygmynote][7] 可能是最不用户友好的。然而，它是最灵活的。

像 tnote 一样，pygmynote 将你的笔记和附件保存在 SQLite 数据库中。当你启动它时，pygmynote 看起来并不特别有用。在任何时候，输入 `help` 并按下回车键获取命令列表。

你可以添加、编辑、查看和搜索笔记，并在笔记中添加[标签][8]。标签使找到笔记更容易，特别是如果你有很多笔记的时候。

pygmynote 的灵活性在于它能够将附件添加到笔记中。这些附件可以是任何东西：图像、文本、word、PDF、电子表格或与笔记相关的任何其他内容。

### jrnl

![](https://opensource.com/sites/default/files/styles/panopoly_image_original/public/images/life-uploads/jrnl.png?itok=Mx7QIgYj)

[jrnl][9] 是这里的一个奇怪应用。正如你可能从它的名字中猜到的那样，jrnl 意在成为一种日记工具。但这并不意味着你不能记笔记。 jrnl 做得很好。

当你第一次启动 jrnl 时，它会询问你想把文件 `journal.txt` （它存储你的笔记）保存的位置以及是否需要密码保护。如果你决定添加密码，那么你在应用内的操作都需要输入密码。

你可以通过两种方式输入笔记：直接从命令行或使用计算机的默认编辑器。你可以将标签（例如，`@opensource.com`）添加到笔记中，并指定日期和时间戳。如果你有很多笔记的话，添加标签和日期可以帮助搜索你的笔记（jrnl 有一个相当不错的搜索功能）。

由于 jrnl 将你的笔记保存为纯文本文件，因此你可以使用 [ownCloud][10]、[Nextcloud][11] 或任何你喜欢的文件共享/同步服务在设备间同步它。

你有没有喜欢的工具或自制的命令行笔记工具？请发表评论，随时与社区分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/3/command-line-note-taking-applications

作者：[Scott Nesbitt][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/scottnesbitt
[1]:https://opensource.com/life/16/9/4-desktop-note-taking-applications
[2]:https://opensource.com/alternatives/evernote
[3]:https://github.com/tasdikrahman/tnote
[4]:http://en.wikipedia.org/wiki/SQLite
[5]:http://notational.net/
[6]:https://vhp.github.io/terminal_velocity/
[7]:https://github.com/dmpop/pygmynote
[8]:https://en.wikipedia.org/wiki/Tag_(metadata)
[9]:http://jrnl.sh/
[10]:https://owncloud.com/
[11]:https://nextcloud.com/
