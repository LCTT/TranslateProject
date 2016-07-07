4 个开源的命令行邮件客户端
================================================================================
![](http://opensource.com/sites/default/files/styles/image-full-size/public/images/life/life_mail.png)

无论你承认与否，email并没有消亡。对那些对命令行至死不渝的 Linux 高级用户而言，离开 shell 转而使用传统的桌面或网页版邮件客户端并不适应。归根结底，命令行最善于处理文件，特别是文本文件，能使效率倍增。

幸运的是，也有不少的命令行邮件客户端，而它们的用户大都乐于帮助你入门并回答你使用中遇到的问题。但别说我没警告过你：一旦你完全掌握了其中一个客户端，你会发现很难回到基于图形界面的客户端！

要安装下述四个客户端中的任何一个是非常容易的；主要的 Linux 发行版的软件仓库中都提供此类软件，并可通过包管理器进行安装。你也可以在其它的操作系统中寻找并安装这类客户端，但我并未尝试过也没有相关的经验。

### Mutt ###

- [项目主页][1]
- [源代码][2]
- 授权协议: [GPLv2][3]

许多终端爱好者都听说过甚至熟悉 Mutt 和 Alpine， 他们已经存在多年。让我们先看看 Mutt。

Mutt 支持许多你所期望 email 系统支持的功能：会话，颜色区分，支持多语言，同时还有很多设置选项。它支持 POP3 和 IMAP 这两个主要的邮件传输协议，以及许多邮箱格式。自从1995年诞生以来， Mutt 就拥有了一个活跃的开发社区，但最近几年，新版本更多的关注于修复问题和安全更新而非提供新功能。这对大多数 Mutt 用户而言并无大碍，他们钟爱这样的界面，并支持此项目的口号：“所有邮件客户端都很烂，只是这个烂的没那么彻底。”

### Alpine ###

- [项目主页][4]
- [源代码][5]
- 授权协议: [Apache 2.0][6]

Alpine 是另一款知名的终端邮件客户端，它由华盛顿大学开发，设计初衷是作为一个开源的、支持 unicode 的   Pine  （也来自华盛顿大学）的替代版本。

Alpine 不仅容易上手，还为高级用户提供了很多特性，它支持很多协议 —— IMAP, LDAP, NNTP, POP, SMTP 等，同时也支持不同的邮箱格式。Alpine 内置了一款名为 Pico 的可独立使用的简易文本编辑工具，但你也可以使用你常用的文本编辑器： vi, Emacs等。

尽管 Alpine 的升级并不频繁，不过有个名为 re-alpine 的分支为不同的开发者提供了开发此项目的机会。

Alpine 支持在屏幕上显示上下文帮助，但一些用户会喜欢 Mutt 式的独立说明手册，不过它们两个的文档都很完善。用户可以同时尝试 Mutt 和 Alpine，并由个人喜好作出决定，也可以尝试以下的几个新选择。

### Sup ###

- [项目主页][7]
- [源代码][8]
- 授权协议: [GPLv2][9]

Sup 是我们列表中能被称为“大容量邮件客户端”的二者之一。自称“为邮件较多的人设计的命令行客户端”，Sup 的目标是提供一个支持层次化设计并允许为会话添加标签进行简单整理的界面。

由于采用 Ruby 编写，Sup 能提供十分快速的搜索并能自动管理联系人列表，同时还允许自定义插件。对于使用 Gmail 作为网页邮件客户端的人们，这些功能都是耳熟能详的，这就使得 Sup 成为一种比较现代的命令行邮件管理方式。

### Notmuch ###

- [项目主页][10]
- [源代码][11]
- 授权协议: [GPLv3][12]

"Sup? Notmuch." Notmuch 作为 Sup 的回应，最初只是重写了 Sup 的一小部分来提高性能。最终，这个项目逐渐变大并成为了一个独立的邮件客户端。

Notmuch 是一款相当精简的软件。它并不能独立的收发邮件，启用 Notmuch 的快速搜索功能的代码实际上是设计成一个程序可以调用的独立库。但这样的模块化设计也使得你能使用你最爱的工具进行写信，发信和收信，集中精力做好一件事情并有效浏览和管理你的邮件。

这个列表并不完整，还有很多 email 客户端，它们或许才是你的最佳选择。你喜欢什么客户端呢？

--------------------------------------------------------------------------------

via: http://opensource.com/life/15/8/top-4-open-source-command-line-email-clients

作者：[Jason Baker][a]
译者：[KevinSJ](https://github.com/KevinSj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://opensource.com/users/jason-baker
[1]:http://www.mutt.org/
[2]:http://dev.mutt.org/trac/
[3]:https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[4]:http://www.washington.edu/alpine/
[5]:http://www.washington.edu/alpine/acquire/
[6]:http://www.apache.org/licenses/LICENSE-2.0
[7]:http://supmua.org/
[8]:https://github.com/sup-heliotrope/sup
[9]:https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html
[10]:http://notmuchmail.org/
[11]:http://notmuchmail.org/releases/
[12]:http://www.gnu.org/licenses/gpl.html
