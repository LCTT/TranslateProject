Linux Email应用 Geary 更新了
================================================================================
**Geary，Linux上流行的桌面email客户端，更新到版本0.10了 — 并且有了很多新的功能。**

![elementary OS上运行的旧版本的Geary](http://www.omgubuntu.co.uk/wp-content/uploads/2015/01/geary.jpg)

*elementary OS上运行的旧版本的Geary*

Geary 0.10有一些不错的用户界面改进以及额外的UI功能，包括：

- 新增: 可以撤销归档、删除以及移动等操作
- 新增: 在2列或者2列布局之间切换
- 新的 “split header bar” — 改进邮件列表，发件人布局
- 新的快捷键 — 使用j/k切换到上/下一封邮件

根据Yorba介绍，这次更新还引入了一个**全新的全文检索算法** ，用来改进Geary的搜索体验。

这个更新应该能平息一下对该应用的搜索能力的抱怨：Geary返回的搜索结果就如同软件自己所宣称的“看起来和查询语句毫不相关”。

> ‘Yorba 建议所有这个软件客户端的用户升级到这个版本’

*“尽管并不是所有的搜索问题在0.10版本中都解决了，但Geary能确保显示的结果能和更好的匹配用户的查询，”[团队表示][1]。*

最后同样重要的是，专业用户会喜欢的主要功能：**支持一个账户有多个或者备用的email地址**。

如果你在Geary中设置Gmail账户来收取你的Yahoo，Outlook和KittyMail信件，你可以看到现在它们都整齐地放在一起，当你写信时在'From'栏你可以选择指定账户作为发送人。这并不是最重要，但是却是最经常被人要求的的功能。

这个流行的Linux电子邮件客户端的这次发布主要是bug修复，性能优化以及一些杂项改进。

Yorba建议所有这个客户端的用户都升级到这个发行版。

### 在Ubuntu 14.04, 14.10 & 15.04安装Geary 0.10 ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/geary-inline-composor.jpg)

Yorba的最新版本可以从GNOME的Git账户下载可编译的源代码。但说实话：这不是有点麻烦吗？

Ubuntu用户想知道如何在 **14.04,14.10** 以及 **15.04**(那些更新爱好者) 上安装Geary 0.10。

官方的Youba PPA包括了 **Geary 最新版本** 以及Shotwell(照片管理器)和[California][2](日历应用)。请注意添加这个PPA会使你电脑上任何已经安装的这些应用更新到最近的版本。

Capiche? Coolio.

在Ubuntu上安装Geary你首先需要添加Yorba PPA和你的软件源。做这些你只需要打开终端窗口并小心地输入下面的两条命令：

    sudo add-apt-repository ppa:yorba/ppa

    sudo apt-get update && sudo apt-get install geary

在输入最后一条命令并敲击回车键后会提示输入你的密码。输入密码让安装完成。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/04/20130320161830-geary-yorba.png)

完成后，打开你的桌面环境应用启动面板并查找‘Geary’图标。点击它，添加你的账户并查看[通过信息高速公路下载了什么][3]，开始使用简单的图形界面吧。

**别忘记：你可以通过电子邮件告诉我们你想看的新闻，应用建议，以及任何你想我们包括的东西。**

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/03/install-geary-ubuntu-linux-email-update

作者：[Joey-Elijah Sneddon][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://wiki.gnome.org/Apps/Geary/FullTextSearchStrategy
[2]:http://www.omgubuntu.co.uk/2014/10/california-calendar-natural-language-parser
[3]:https://www.youtube.com/watch?v=rxM8C71GB8w