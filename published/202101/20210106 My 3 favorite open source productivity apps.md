[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13016-1.html)
[#]: subject: (My 3 favorite open source productivity apps)
[#]: via: (https://opensource.com/article/21/1/open-source-productivity-apps)
[#]: author: (Taz Brown https://opensource.com/users/heronthecli)

我最喜欢的 3 个开源生产力应用
======

> 简化你的敏捷工作流程，提高你的工作效率。

![](https://img.linux.net.cn/data/attachment/album/202101/14/215039op8zl611f8p76vrf.jpg)

生产力应用确实可以让你的工作流程变得更加轻松。在本文中，我将分享一些我用来简化工作流程、提高整体生产力的开源应用。本文中所有的生产力应用都是免费的 Linux 生产力应用。

### Tomboy/Gnote

[Tomboy][2] 是一款可以在 Linux、Windows 和 macOS 上使用的简单记事本应用。它是 GNU LGPLv2 下许可的开源软件。

Tomboy 使用起来非常简单。你写下一张纸条，选择是否将它贴在桌面上，完成后就可以删除它。

![Tomboy and Gnote][3]

它（以及它的克隆版 [Gnote][5]）是一个很好的快速记笔记的小程序。很多时候，当我在做某件事情的时候，会有一些想法或思路想要回忆。Tomboy 可以让我快速创建一个笔记，在我忘记之前把我的想法记下来。然后我就可以把这些想法转移到一个更长久的地方。

### Joplin

[Joplin][6] 是一个开源的记事和待办事项应用。它是跨平台的，可以在 Linux、Windows、macOS、iOS 和 Android 上使用，并且采用 MIT 许可开源。

![Joplin][7]

它可以使用 Dropbox、OneDrive、Nextcloud 等云同步服务进行同步。它很容易安装，可能就在你的 Linux 仓库里。当你在桌面上安装它时，它一个应用中实际包含了两个：你会得到一个标准的图形用户界面 （GUI），或者打开一个终端，在那里使用 Joplin。

桌面版有一个非常漂亮的界面。笔记被组织在笔记本中，这基本上使它们成为你的手册页。而且因为笔记是 Markdown 格式的，所以它们会被渲染，你可以实时编辑它们。我喜欢使用 Markdown，因为它让我写笔记的速度很快。你也可以导出或导入 Joplin 笔记。

### Evolution

[Evolution][9] 是一款开源的个人信息管理应用，它与 Outlook 非常相似，但我认为更适合我使用。它具有电子邮件、工作、笔记、链接、日历和地址簿功能。它是 LGPL 和其他[许可证][10]下的开源软件。

![GNOME Evolution][11]

我在运行 Fedora 的台式电脑上使用它。它的效率很高，绝对能帮助我度过繁忙的一天。它让我能够使用 Linux 开展业务；我还能要求什么呢？

要在 Fedora 中使用它，打开一个终端并输入以下命令：

```
sudo dnf remove evolution
sudo dnf update
sudo dnf install evolution
sudo dnf install evolution-ews
```

### 我的常用工具

这些工具是我的主力军，我已经依赖了一段时间。使用它们超越了它们的基本功能，使我更有效率、更有效果、更有生产力。作为一名技术产品经理和敏捷专家，我很自豪，我仍然使用 Linux 和其他开源软件，即使我工作的公司不这样做。

* * *

_本文原载于 [Course Hero][13]，经授权转载。_

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/open-source-productivity-apps

作者：[Taz Brown][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/heronthecli
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/team_dev_email_chat_video_work_wfm_desk_520.png?itok=6YtME4Hj (Working on a team, busy worklife)
[2]: https://wiki.gnome.org/Apps/Tomboy
[3]: https://opensource.com/sites/default/files/uploads/tomboy-gnote.png (Tomboy and Gnote)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://wiki.gnome.org/Apps/Gnote
[6]: https://joplinapp.org/
[7]: https://opensource.com/sites/default/files/uploads/joplin_0.jpg (Joplin)
[8]: https://github.com/laurent22/joplin
[9]: https://wiki.gnome.org/Apps/Evolution
[10]: https://gitlab.gnome.org/GNOME/evolution/-/blob/master/COPYING
[11]: https://opensource.com/sites/default/files/uploads/evolution.png (GNOME Evolution)
[12]: https://help.gnome.org/users/evolution/stable/intro-main-window.html.en
[13]: https://www.coursehero.com/file/74086904/Personal-productivity-using-open-source-software-tools/
