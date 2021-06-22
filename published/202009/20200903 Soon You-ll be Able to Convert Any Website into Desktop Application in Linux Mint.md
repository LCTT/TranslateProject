[#]: collector: (lujun9972)
[#]: translator: (koolape)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12581-1.html)
[#]: subject: (Soon You’ll be Able to Convert Any Website into Desktop Application in Linux Mint)
[#]: via: (https://itsfoss.com/web-app-manager-linux-mint/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

很快你就能在 Linux Mint 上将任何网站转化为桌面应用程序了
======

设想一下，你正忙于一项任务且需要在浏览器中打开超过 20 个页面，大多数页面都和工作有关。

还有一些是 YouTube 或其他音乐流媒体网站。

完成任务后需要关闭浏览器，但这会将包括工作相关和听音乐的网页等所有网页一起关掉。

然后你需要再次打开这些网页并登录账号以回到原来的进度。

这看起来令人沮丧，对吧？Linux Mint 理解你的烦恼，因此有了下面这个新项目帮助你应对这些问题。

![][1]

在[最近的一篇文章][2]中，Linux Mint 团队披露了正在开发一个名叫“<ruby>网页应用管理器<rt>Web App Manager</rt></ruby>”的新工具。

该工具让你能够像使用桌面程序那样以独立窗口运行你最喜爱的网页。

在将网页添加为网页应用程序的时候，你可以给这个程序取名字并添加图标。也可以将它添加到不同的分类，以便在菜单中搜索这个应用。还可以指定用什么浏览器打开应用。启用/禁用导航栏的选项也有。

![在 Linux Mint 中添加网页应用程序][3]

例如，将 YouTube 添加为网页应用程序：

![Linux Mint 中的网页应用程序][4]

运行 YouTube 程序将通过你所使用的浏览器打开一个独立的页面。

![YouTube 网页应用程序][5]

网页应用程序拥有常规桌面应用程序有的大多数功能特点，如使用 `Alt+Tab` 切换。

![使用 Alt+Tab 切换网页应用][6]

甚至还能将应用固定到面板/任务栏方便打开。

![添加到面板的 YouTube 网页应用][7]

该管理器目前处于 beta 开发阶段，但已经使用起来已经相对比较稳定了。不过目前还没有面向大众发放，因为翻译工作还未完成。

如果你在使用 Linux Mint 并想尝试这个工具，可在下方下载 beta 版本的 deb 文件：

- [下载 beta 版][8]

### 网页应用的好处

有读者问到这个网页应用管理器与 Chrome 和其他一些网页浏览器中已有的其他类似功能相比的好处。让我来展开一下这个话题。

- 你可以使用 URL 的特定部分（example.com/tool 而不是 example.com）作为应用程序。
- 添加自定义图标的可能性对于没有清晰的 favicon 的网站来说非常方便。
- 你可以使用一个没有任何扩展的轻量级浏览器来打开网页应用，而不是像 Chrome/Chromium 这样的常规网页浏览器。它的速度应该更快。
- 你的网页应用可以被整合到应用菜单中。你可以像其他应用程序一样搜索它。

### 网页应用程序在桌面环境的 Linux 中不是什么新事物

网页应用程序不是由 Linux Mint 独创的，而是早在大约 10 年前就有了。

你可能还记得 Ubuntu 在 2013-2014 年向 Unity 桌面中加入了网页应用程序这项特性。

轻量级 Linux 发行版 PeppermintOS 自 2010 年起就将 ICE（网页应用程序工具）列为其主要特色之一。实际上，Linux Mint 的网页应用程序管理器也是基于 [ICE][9] 的。

我个人喜欢网页应用程序，因为有用。

你怎么看 Linux Mint 中的网页应用程序呢，这是你期待使用的吗？欢迎在下方评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/web-app-manager-linux-mint/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[koolape](https://github.com/koolape)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/09/Web-App-Manager-linux-mint.jpg?resize=800%2C450&ssl=1
[2]: https://blog.linuxmint.com/?p=3960
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/Add-web-app-in-Linux-Mint.png?resize=600%2C489&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/Web-Apps-in-Linux-Mint.png?resize=600%2C489&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/youtube-web-app-linux-mint.jpg?resize=800%2C611&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/web-app-alt-tab-switcher.jpg?resize=721%2C576&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/panel.jpg?resize=470%2C246&ssl=1
[8]: http://www.linuxmint.com/tmp/blog/3960/webapp-manager_1.0.3_all.deb
[9]: https://github.com/peppermintos/ice
