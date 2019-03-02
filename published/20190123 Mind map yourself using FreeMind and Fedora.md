[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10579-1.html)
[#]: subject: (Mind map yourself using FreeMind and Fedora)
[#]: via: (https://fedoramagazine.org/mind-map-yourself-using-freemind-and-fedora/)
[#]: author: (Paul W. Frields https://fedoramagazine.org/author/pfrields/)

在 Fedora 中使用 FreeMind 介绍你自己
======

![](https://fedoramagazine.org/wp-content/uploads/2019/01/freemind-816x345.jpg)

介绍你自己的思维导图，一开始听起来有些牵强。它是关于神经通路么？还是心灵感应？完全不是。相反，自己的思维导图是一种在视觉上向他人描述自己的方式。它还展示了你拿来描述自己的特征之间的联系。这是一种以聪明又同时可控的与他人分享信息的有用方式。你可以使用任何思维导图应用来做到。本文向你展示如何使用 Fedora 中提供的 [FreeMind][1]。

### 获取应用

FreeMind 已经出现有一段时间了。虽然 UI 有点过时，应该做一些更新了，但它是一个功能强大的应用，提供了许多构建思维导图的选项。当然，它是 100％ 开源的。还有其他思维导图应用可供 Fedora 和 Linux 用户使用。查看[此前一篇涵盖多个思维导图选择的文章][2]。

如果你运行的是 Fedora Workstation，请使用“软件”应用从 Fedora 仓库安装 FreeMind。或者在终端中使用这个 [sudo][3] 命令：

```
$ sudo dnf install freemind
```

你可以从 Fedora Workstation 中的 GNOME Shell Overview 启动应用。或者使用桌面环境提供的应用启动服务。默认情况下，FreeMind 会显示一个新的空白脑图：

![][4]

*FreeMind 初始（空白）思维导图*

脑图由链接的项目或描述（节点）组成。当你想到与节点相关的内容时，只需创建一个与其连接的新节点即可。

### 做你自己的脑图

单击初始节点。编辑文本并按回车将其替换为你的姓名。你就能开始你的思维导图。

如果你必须向某人充分描述自己，你会怎么想？可能会有很多东西。你平时做什么？你喜欢什么？你不喜欢什么？你有什么价值？你有家庭吗？所有这些都可以在节点中体现。

要添加节点连接，请选择现有节点，然后单击“Insert”，或使用“灯泡”图标作为新的子节点。要在与新子级相同的层级添加另一个节点，请使用回车。

如果你弄错了，别担心。你可以使用 `Delete` 键删除不需要的节点。内容上没有规则。但是最好是短节点。它们能让你在创建导图时思维更快。简洁的节点还能让其他浏览者更轻松地查看和理解。

该示例使用节点规划了每个主要类别：

![][5]

*个人思维导图，第一级*

你可以为这些区域中的每个区域另外迭代一次。让你的思想自由地连接想法以生成导图。不要担心“做得正确“。最好将所有内容从头脑中移到显示屏上。这是下一级导图的样子。

![][6]

*个人思维导图，第二级*

你可以以相同的方式扩展任何这些节点。请注意你在示例中可以了解多少有关 “John Q. Public” 的信息。

### 如何使用你的个人思维导图

这是让团队或项目成员互相介绍的好方法。你可以将各种格式和颜色应用于导图以赋予其个性。当然，这些在纸上做很有趣。但是在 Fedora 中安装一个就意味着你可以随时修复错误，甚至可以在你改变的时候做出修改。

祝你在探索个人思维导图上玩得开心！


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/mind-map-yourself-using-freemind-and-fedora/

作者：[Paul W. Frields][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/pfrields/
[b]: https://github.com/lujun9972
[1]: http://freemind.sourceforge.net/wiki/index.php/Main_Page
[2]: https://fedoramagazine.org/three-mind-mapping-tools-fedora/
[3]: https://fedoramagazine.org/howto-use-sudo/
[4]: https://fedoramagazine.org/wp-content/uploads/2019/01/Screenshot-from-2019-01-19-15-17-04-1024x736.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/01/Screenshot-from-2019-01-19-15-32-38-1024x736.png
[6]: https://fedoramagazine.org/wp-content/uploads/2019/01/Screenshot-from-2019-01-19-15-38-00-1024x736.png
