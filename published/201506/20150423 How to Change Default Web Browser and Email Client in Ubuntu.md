如何在 Ubuntu 中更改默认浏览器和 Email 客户端
================================================================================
Ubuntu 自带了一些已经预装的默认应用程序，包括非常流行的 Mozilla 火狐浏览器和 Thunderbird 的 e-mail 客户端。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/07/web-browser.png)

尽管这两个应用都有它们自己的粉丝，但是没有一个应用能符合每个人的口味和需要。我们经常收到邮件或者推文，询问我们可以怎样在 Ubuntu 上更改默认浏览器或者设置处理邮件链接为不同的电子邮件客户端等。

我们在这里不仅讨论如何安装不同的软件，还包括如何给一个特定的文件，链接或者内容类型设置其系统处理应用。

在 Ubuntu 中更改默认应用程序，包括浏览器、电子邮件客户端、文本编辑器、音乐和视频播放器都非常的简单。但并不是每个人都知道更改这些的设置面板在哪里，让我们来快速看一下吧。

### 如何在 Ubuntu 上更改默认浏览器 ###

Mozilla 火狐浏览器是一扇稳定、开源而且可靠的互联网之窗，但它并不是每个人的选择。这都没关系。

要在 Ubuntu 上使用不同的默认浏览器，首先，显而易见，你需要安装一个新的浏览器。你该怎么做取决于你想要的浏览器：

- 开源浏览器，例如 [Epiphany][1], [Chromium][2] 和 [IceWeasel][3]，可以从 Ubuntu 软件中心安装。

- 主流浏览器，例如 [Google Chrome][4], [Opera][5] 和 [Vivaldi][6] 必须从各自项目的官方网站上下载。

不管你选择哪个浏览器，不管你选择怎样安装，完成之后你就可以继续了。

要更改在点击其它应用（如即时通讯软件、Twitter 客户端、 e-mail 中）中的链接时打开的默认网页浏览器，你需要用到 Ubuntu 系统设置工具。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/04/system-settings-ubuntu-300x215.jpg)

你可以用多种方法打开系统设置。其中一种最快的方式是点击右上角(RTL系统是左上角)的 Cog 图标并选择‘系统设置’菜单快捷方式。

1. 打开‘系统设置’
1. 选择‘详细’选项
1. 在侧边栏选择‘默认应用程序’
1. 把 ‘Web’ 条目的 ‘火狐’ 改为你想要的选项

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/04/change-default-browser-in-ubuntu-750x402.jpg)

就是这样。

### 如何在 Ubuntu 上更改默认的邮件客户端 ###

Ubuntu 用 Thunderbird 作为默认的邮件应用程序。这意味着当你点击大部分浏览器、 PDF文件、及时通讯软件等上的 **电子邮件地址或者一个 [mailto 链接][7] 的时候会自动打开** 这个应用。

当然，如果你使用 Thunderbird，这真的很方便。但是我们很多人并非如此； 我们可能**[使用像 Geary 这样的轻量级客户端][8]**，GNOME stalwart Evolution，或者依靠像 Gmail 或者 Outlook 这样的网络邮件服务。

在 Ubuntu 上从 Thunderbird **更改默认邮件客户端** 到另一个应用程序，打开系统设置 > 详细 > 默认应用程序。点击下拉菜单到 ‘Mail’ 并选择从列表中选择你喜欢的客户端。

**在 Ubuntu 上设置 Gmail 为默认的邮件客户端**，你首先需要点击下面的按钮安装 ‘gnome-gmail’ 软件包。安装完后打开系统设置 > 详细 > 默认应用程序。然后点击‘Mail’ 的下拉菜单，并选择从列表中选择 ‘Gmail’。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2015/04/CHANGE-DEFAULT-APPS-UBUNTU.jpg)

- [在 Ubuntu 上安装 GNOME Gmail][9]

### 更多 ###

上述同样的步骤也可以用来设置你双击音乐文件时打开你喜欢的音乐播放器，用比如 VLC 应用程序处理 .avi 和 .mp4 文件，等等。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2015/04/change-your-default-web-browser-in-ubuntu

作者：[Joey-Elijah Sneddon][a]
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://wiki.gnome.org/Apps/Web
[2]:https://apps.ubuntu.com/cat/applications/chromium-browser/
[3]:https://wiki.debian.org/Iceweasel
[4]:https://www.google.co.uk/chrome/browser/desktop/
[5]:http://www.opera.com/computer/linux
[6]:https://vivaldi.com/#Download
[7]:http://en.wikipedia.org/wiki/Mailto
[8]:https://linux.cn/article-5511-1.html
[9]:apt://gnome-gmail