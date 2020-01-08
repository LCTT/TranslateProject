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

有太多理由去选择使用linux系统。很重要的一个理由是，我们可以按照我们自己的想法去选择想要的。从操作系统的交互方式（桌面系统）到守护系统的运行方式，在到使用的工具，你用更多的选择。

web浏览器也是如此。你可以使用开源的[火狐][1]，[Chromium][2];或者未开源的[Vivaldi][3]，[Chrome][4]。这些功能强大的浏览器有你需要的各种功能。对于某些人，这些功能完备的浏览器是日常必需的。

但是，有些人更喜欢没有冗余功能的纯粹的浏览器。实际上，有很多原因导致你会选择微型的浏览器而不选择上述功能完备的浏览器。对于某些人来说，与浏览器的安全有关；而有些人则将浏览器当作一种简单的工具（而不是一站式商店应用程序）；还有一些可能运行在低功率的计算机上，这些计算机无法满足火狐，chrome浏览器的运行要求。无论出于何种原因，在linux系统上都可以满足你的要求。

让我们看一下可以在linux上安装运行的五种微型浏览器。我将在 Elementary 的操作系统平台上演示这些浏览器，在已知的linux发型版中几乎每个版本都可以使用这些浏览器。让我们一起来看一下吧！

### GNOME Web

GNOME web (Epiphany 含义：[顿悟][5])是Elementary系统默认的web浏览器，也可以从标准存储库中安装。(注意，建议通过使用 Flatpak 或者 Snap 工具安装)，如果你想选择标准软件包管理器进行安装，请执行 ```sudo apt-get install epiphany-browser -y``` 命令成功安装。

Epiphany 使用WebKit的渲染引擎，该引擎与Apple的Safari浏览器中使用的引擎相同。这个引擎和Epiphany非常契合，可以达到非常快的页面渲染速度。Epiphany严格遵守以下准则：

  * Simplicity简单性 - Feature bloat and user interface clutter are considered evil功能复杂和用户界面混乱都是不被允许的.

  * 规范性 - 任何非标准特性都不会引入到代码库中。

  * 软件开源 - Epiphany始终遵守自由开源许可证。

  * 人机交互 - Epiphany 始终遵守[GNOME的人机交互指南][6]。

  * 最小首选项 - 经过慎重考虑才添加首选项。

  * 受众群体 - 非技术用户是主要的受众目标，（有助于定义所包含功能的类型）。




GNOME web浏览器就像看到的一样干净简洁 (Figure 1)。


![GNOME Web][8]

Figure 1: GNOME 浏览器为用户展示最少的首选项.

[许可证书][9]

GNOME Web 的声明如下:

web 浏览器它不仅仅是一个应用程序，还是一种思维方式，一种看世界的方式。 Epiphany 的原则是简洁，标准和自由。
### Netsurf

[Netsurf][10] 浏览器是最小的浏览器，他的打开速度几乎和你松开鼠标一样。Netsurf 使用自己的布局和渲染引擎（完全从零开始设计的） 在渲染过程的设计中屡屡碰壁(Figure 2).

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/minimalbrowsers_2.jpg?itok=KhGhIKlj)

尽管你可能在特定的站点上发现 Netsurf的问题，但如果你了解Hubbub解析器的话，知道它正在兼容html5规范，是不是的会有一点问题。Netsurf对https的支持，网页缩略图，URL解析，缩放视图，书签，全屏模式，快捷键和GUI的工具包的功能；最后一点十分重要，当你桌面来回切换时，为了缓解渲染带来的问题。

对于那些对Netsurf 存在好奇的人来说，以现在的标准，他能在 16MB内存，30Mhz的ARM cpu的机器上运行，是让人惊奇的。

### QupZilla

如果你找寻使用Qt Framework 和 the QtWebKit 渲染引擎的最小浏览器，QupZilla][11]是你最佳的选择。QupZilla 包含web浏览所有的标准功能，例如：书签，历史记录，侧边栏，选项卡，RSS，广告屏蔽，flash屏蔽，和CA证书管理。及时拥有这么多的功能，QupZilla 仍然是快速，轻量级的浏览器。另外还有其他的功能：快速启动，快速拨号主页，内置屏幕截图工具，浏览器主题等。
吸引用户的一点是，与许多轻量级浏览器相比，QupZilla有更标准的首选项工具（图3）。所以，如果你很多功能，但你仍然想要更轻量，那么QupZilla就是你最好的选择。

![QupZilla][13]

Figure 3: QupZilla 首选项工具.

[许可证书][9]

### Otter Browser

Otter Browser is a free, open source attempt to recreate the closed-source offerings found in the Opera Browser. Otter Browser uses the WebKit rendering engine and has an interface that should be immediately familiar with any user. Although lightweight, Otter Browser does include full-blown features such as:

  * Passwords manager

  * Add-on manager

  * Content blocking

  * Spell checking

  * Customizable GUI

  * URL completion

  * Speed dial (Figure 4)

  * Bookmarks and various related features

  * Mouse gestures

  * User style sheets

  * Built-in Note tool


![Otter][15]

Figure 4: The Otter Browser Speed Dial tab.

[Used with permission][9]

Otter Browser can be run on nearly any Linux distribution from an [AppImage][16], so there’s no installation required. Just download the AppImage file, give the file executable permissions (with the command chmod u+x otter-browser-*.AppImage), and then launch the app with the command ./otter-browser*.AppImage.

Otter Browser does an outstanding job of rendering websites and could function as your go-to minimal browser with ease.

### Lynx

Let’s get really minimal. When I first started using Linux, back in ‘97, one of the web browsers I often turned to was a text-only take on the app called [Lynx][17]. It should come as no surprise that Lynx is still around and available for installation from the standard repositories. As you might expect, Lynx works from the terminal window and doesn’t display pretty pictures or render much in the way of advanced features (Figure 5). In fact, Lynx is as bare-bones a browser as you will find available. Because of how bare-bones this web browser is, it’s not recommended for everyone. But if you happen to have a gui-less web server and you have a need to be able to read the occasional website, Lynx can be a real lifesaver.

![Lynx][19]

Figure 5: The Lynx browser rendering the Linux.com page.

[Used with permission][9]

I have also found Lynx an invaluable tool when troubleshooting certain aspects of a website (or if some feature on a website is preventing me from viewing the content in a regular browser). Another good reason to use Lynx is when you only want to view the content (and not the extraneous elements).

### Plenty More Where This Came From 更多

There are plenty more minimal browsers than this. But the list presented here should get you started down the path of minimalism. One (or more) of these browsers are sure to fill that need, whether you’re running it on a low-powered machine or not.微型浏览器还有很多。但是这里列出的清单应该使你开始走极简主义的道路。无论您是否在低功率计算机上运行，​​这些浏览器中的一个（或多个）都一定可以满足这一需求。

Learn more about Linux through the free ["Introduction to Linux" ][20]course from The Linux Foundation and edX.
了解linux 更多信息可以通过免费的["Linux 简洁" ][20]课程，该课程来源Linux基金和edX平台提供的。

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
