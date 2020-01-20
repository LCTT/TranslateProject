[#]: collector: (lujun9972)
[#]: translator: (MonkeyDEcho )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: subject: (5 Minimal Web Browsers for Linux)
[#]: via: (https://www.linux.com/blog/intro-to-linux/2018/11/5-minimal-web-browsers-linux)
[#]: author: (Jack Wallen https://www.linux.com/users/jlwallen)
[#]: url: ( )


linux上的五种微型浏览器
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimal.jpg?itok=ifA0Y3pV)

有很多理由去选择使用linux系统。其中重要的原因是，我们可以按照我们自己的想法去自由搭配。从操作系统的交互方式（桌面系统）到守护系统的运行方式，在到使用的工具，有很多的选择。

web浏览器也是如此。你可以使用开源的[火狐][1]，[Chromium][2];或者未开源的[Vivaldi][3]，[Chrome][4]。这些浏览器有着各种完备的功能。

但是，很多人更喜欢简洁的浏览器。有很多原因会引导你作出这样的选择。有一些是与浏览器的安全有关；而有些则是将浏览器当作一种简单的工具（而不是冗余的应用程序）；还有一些是因为运行在低配置的计算机上，这些计算机无法满足火狐，chrome浏览器。无论出于何种原因，在linux系统上总有一款适合你。

让我们一起看一下可以在linux上安装运行的五种微型浏览器。演示将在 Elementary 的操作系统平台上演示这些浏览器，在已知的linux发型版中几乎每个版本都可以使用这些浏览器。让我们来看一下吧！

### GNOME Web

GNOME web (Epiphany 含义：[顿悟][5])是Elementary系统默认的web浏览器，可以从标准存储库中安装。(注意，建议通过使用 Flatpak 或者 Snap 工具安装)，如果你想选择标准软件包管理器进行安装，请执行 ```sudo apt-get install epiphany-browser -y``` 命令进行安装。

Epiphany 使用WebKit的渲染引擎，该引擎与 Apple 的 Safari 浏览器一样使用的同一种引擎。该引擎与 Epiphany 非常契合，页面渲染速度快。并且 Epiphany 严格遵守以下准则：

  * 简单性 - 功能复杂和用户界面混乱都是不被允许的.

  * 规范性 - 任何非标准特性都不会引入到代码库中。

  * 软件开源 - Epiphany始终遵守自由开源许可证。

  * 人机交互 - Epiphany 始终遵守[GNOME的人机交互指南][6]。

  * 最小首选项 - 经过慎重考虑才添加首选项。

  * 受众群体 - 非技术用户是主要的受众目标，（有助于定义所包含功能的类型）。




GNOME web 浏览器就像看到的一样干净简洁 (Figure 1)。


![GNOME Web][8]

Figure 1: GNOME 浏览器为用户展示最少的首选项.

[许可证书][9]

GNOME Web 的声明如下:

web 浏览器它不仅仅是一个应用程序，还是一种思维方式，一种看世界的方式。 Epiphany 的原则是简洁，标准和自由。
### Netsurf

[Netsurf][10] 浏览器是最小的浏览器，他的打开速度几乎和你松开鼠标的速度一样。Netsurf 使用自己的布局和渲染引擎（完全从零开始设计） 在渲染过程的设计中屡屡碰壁(Figure 2).

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_2.jpg?itok=KhGhIKlj)

尽管你可能在特定的站点上发现 Netsurf 的bug，但如果你了解 Hubbub 解析器的话，它现在正在兼容html5规范，有一点问题也在情理当中。Netsurf 对 https，网页缩略图，URL解析，缩放视图，书签，全屏模式，快捷键和 GUI 的工具包的功能都支持；最后重要的一点，当你桌面来回切换浏览器时它缓解渲染带来的问题。

对于那些对 Netsurf 存在质疑的人来说，他能在 16MB内存，30Mhz的ARM cpu的机器上运行，是让人惊奇不已的事情。

### QupZilla

如果你找寻使用Qt Framework 和 the QtWebKit 渲染引擎内核的浏览器，QupZilla][11]是你最佳的选择。 QupZilla 它包含web浏览所有的标准功能，例如：书签，历史记录，侧边栏，选项卡，RSS，广告屏蔽，flash屏蔽，和CA证书管理。即使它拥有这么多的功能，QupZilla 仍然是轻量，快速的浏览器。另外它还有：快速启动，快速拨号主页，内置屏幕截图工具，浏览器主题等功能。
真正吸引用户的是，与许多轻量级浏览器相比，QupZilla 有更标准的首选项工具（图3）。所以，如果你需要众多功能，但仍然轻量快速，那么 QupZilla 就是你不错的选择。

![QupZilla][13]

Figure 3: QupZilla 首选项工具.

[许可证书][9]

### Otter Browser

Otter 浏览器是一种免费开源的，旨在重建 Opera 12.x 版本的浏览器。它使用 WebKit 渲染引擎内核，轻量，有用户的熟悉界面和丰富的功能：

  * 密码管理

  * 插件管理
  
  * 内容拦截

  * 拼写检查

  * 自定义界面

  * 网址补全

  * 快速访问 (Figure 4)

  * 书签和其他相关功能

  * 鼠标手势

  * 用户样式表

  * 内建笔记功能


![Otter][15]

Figure 4: Otter 浏览器快起标签项.

[许可证书][9]

Otter 浏览器几乎可以在所有 Linux 发行版上使用[AppImage][16]软件格式运行，因此无需特殊安装。只需下载AppImage文件，授予文件可执行权限（使用命令 `chmod u+x otter-browser-.AppImage`），然后使用命令`./otter-browser.AppImage` 启动应用程序。

Otter 浏览器在网站展示方面做得非常出色，可以轻松地用作你的浏览器。


### Lynx

让我们见识真正的微型浏览器。早在97年，开始使用 Linux 时，就会使用的[Lynx][17]纯文本模式的网页浏览器。
Lynx 可以从标准存储库中进行便捷的安装。正如期望的那样，Lynx 在终端窗口中工作，不会显示漂亮的图片，不会使用高级功能的渲染方式（图5）。Lynx 是现今能找到最简洁的浏览器。由于这个网页浏览器是如此简陋，所以不建议每个人都使用它。但如果你碰巧有一个没有界面的服务器，你又需要能够偶尔访问的网站，Lynx 是一个真正的救星。

![Lynx][19]

Figure 5: Lynx 浏览器展示 Linux.com 网址界面.

[许可证书][9]

还发现 Lynx 是一个非常有用的工具，它可以帮助我解决网站某些方面的故障（如网站上的某些功能阻止在常规浏览器中查看内容）。使用 Lynx 的另一个重要原因是它可以让我们更加专注内容（而不是其他无关的元素）。

### Plenty More Where This Came From 更多

微型浏览器还有很多。但是这里列出的清单应该是驱使你开始走极简主义的道路。无论你是否在低功率计算机上运行，​​这些浏览器中的一个（或多个）都一定可以满足简洁这一需求。

想了解 linux 更多信息可以通过免费的["Linux 简洁" ][20]课程，该课程来源Linux基金和edX平台提供的。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/11/5-minimal-web-browsers-linux

作者：[Jack Wallen][a]
选题：[lujun9972][b]
译者：[MonkeyDEcho](https://github.com/MonkeyDEcho)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/jlwallen
[b]: https://github.com/lujun9972
[1]: https://www.mozilla.org/en-US/firefox/new/
[2]: https://www.chromium.org/
[3]: https://vivaldi.com/
[4]: https://www.google.com/chrome/
[5]: https://www.merriam-webster.com/dictionary/epiphany
[6]: https://developer.gnome.org/hig/stable/
[7]: /files/images/minimalbrowsers1jpg
[8]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_1.jpg?itok=Q7wZLF8B (GNOME Web)
[9]: /licenses/category/used-permission
[10]: https://www.netsurf-browser.org/
[11]: https://qupzilla.com/
[12]: /files/images/minimalbrowsers3jpg
[13]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_3.jpg?itok=O8iMALWO (QupZilla)
[14]: /files/images/minimalbrowsers4jpg
[15]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_4.jpg?itok=5bCa0z-e (Otter)
[16]: https://sourceforge.net/projects/otter-browser/files/
[17]: https://lynx.browser.org/
[18]: /files/images/minimalbrowsers5jpg
[19]: https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_5.jpg?itok=p_Lmiuxh (Lynx)
[20]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
