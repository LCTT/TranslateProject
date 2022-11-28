[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12850-1.html)
[#]: subject: (You can Surf Internet in Linux Terminal With These Command Line Browsers)
[#]: via: (https://itsfoss.com/terminal-web-browsers/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

使用命令行浏览器在 Linux 终端上网浏览
======

![](https://img.linux.net.cn/data/attachment/album/202011/22/212007f9s7aabmcj4aa9lo.jpg)

我猜你阅读这篇文章可能是用 Firefox 或基于 Chrome 的浏览器（如 [Brave][1]），或者，也可能是 Chrome 浏览器或 [Chromium][2]。

换句话说，你正在利用基于 GUI 的方式浏览网页。然而，在以前，人们使用终端来获取资源和浏览网页，因为所有的东西大多是基于文本的。

虽然现在不能从终端上获取每个信息，但对于一些文本信息，还是可以尝试使用命令行浏览器，从 Linux 终端上打开网页。

不仅如此，如果你访问的是远程服务器，或者只有一个没有 GUI 的终端，终端网页浏览器就可以发挥用处了。

因此，在本文中，我将介绍一些基于终端的 Web 浏览器，你可以在 Linux 上尝试它们。

### Linux 用户的最佳终端 Web 浏览器

注：此榜单排名不分先后。

#### 1、W3M

![][3]

`w3m` 是一个流行的基于文本的开源终端 Web 浏览器。尽管其初始项目已经不再活跃，但另一个开发者 Tatsuya Kinoshita 正在维护着它的一个活跃分支。

`w3m` 相当简单，支持 SSL 连接、色彩，也支持内嵌图片。当然，根据你试图访问的资源，你那边的情况可能会有所不同。根据我的简单测试，它似乎无法加载 [DuckDuckGo][4]，但我可以[在终端中使用 Google][5]就够了。

安装后，你可以简单的在终端中输入 `w3m` 以得到帮助。如果你感兴趣的话，也可以到 [GitHub][6] 上去查看它的仓库。

**如何安装和使用 w3m？**

`w3m` 在任何基于 Debian 的 Linux 发行版的默认仓库中都是可用的。如果你有一个基于 Arch 的发行版，但没有直接可用的软件包，你可能需要查看一下 [AUR][7]。

对于 Ubuntu，你可以通过键入以下内容来安装它：

```
sudo apt install w3m w3m-img
```

在这里，我们将 w3m 包和图片扩展一起安装，以支持内嵌图片。接下来，要开始安装，你只需要按照下面的命令进行操作即可：

```
w3m xyz.com
```

当然，你需要将 `xyz.com` 替换成任何你想浏览或测试的网站。最后，你应该知道，你可以使用键盘上的方向键来导航，当你想采取一个动作时，按回车键。

要退出，你可以按 `SHIFT+Q`，返回上一页是 `SHIFT+B`。其他快捷键包括用 `SHIFT+T` 打开新标签页和用 `SHIFT+U` 打开新的 URL。

你可以通过访问它的手册页来了解更多信息。

#### 2、Lynx

![][8]

Lynx 是另一个开源的命令行浏览器，你可以试试。幸运的是，很多的网站在使用 Lynx 时往往能正常工作，所以我说它在这方面肯定更好。我能够加载 DuckDuckGo，并使其工作。

除此之外，我还注意到它可以让你在访问各种 Web 资源时接受或拒绝 cookie。你也可以将它设置为总是接受或拒绝。所以，这是件好事。

另一方面，在终端上使用时，窗口不能很好地调整大小。我还没有寻找到任何解决方法，所以如果你正在尝试这个，你可能会想要这样做。不论如何，它都很好用，当你在终端启动它时，你会得到所有键盘快捷键的说明。

请注意，它与系统终端主题不匹配，所以无论你的终端看起来如何，它都会看起来不同。

**如何安装 Lynx？**

与 w3m 不同的是，如果你有兴趣尝试的话，确实可以找到一些 Win32 上的安装程序。不过，在 Linux 上，它在大多数的默认仓库中都是可用的。

对于 Ubuntu 来说，你只需要输入：

```
sudo apt install lynx
```

要想使用，你只需要按照下面的命令进行操作：

```
lynx examplewebsite.com
```

在这里，你只需要将示例网站替换成你想要访问的资源即可。

如果你想找其他 Linux 发行版的软件包，可以查看他们的[官网资源][9]。

#### 3、Links2

![][10]

Links2 是一款有趣的基于文本的浏览器，你可以在你的终端上轻松使用，用户体验良好。它提供了一个很好的界面，你启动它后，只要输入网址就可以了。

![][11]

值得注意的是，主题将取决于你的终端设置，我设置为“黑绿色”主题，因此你看到的就是这个。当你以命令行浏览器的方式启动它后，你只需要按任意键就会出现 URL 提示，或者按 `Q` 键退出。它相当好用，可以渲染大多数网站的文字。

与 Lynx 不同的是，你没有接受或拒绝 cookie 的功能。除此之外，它似乎工作的还不错。

**如何安装 Links2？**

正如你所期望的，你会发现它在大多数默认的仓库中都有。对于 Ubuntu，你可以在终端输入以下命令来安装它：

```
sudo apt install links2
```

如果你想在其他 Linux 发行版上安装它，你可以参考它的[官方网站][12]获取软件包或文档。

#### 4、eLinks

![][13]

eLinks 类似于 Links2，但它已经不再维护了。你仍然可以在各种发行版的默认仓库中找到它，因此，我把它保留在这个列表中。

它不会与你的系统终端主题相融合。所以，如果你需要的话，作为一个没有“黑暗”模式的文本型浏览器，这可能不是一个漂亮的体验。

**如何安装 eLinks？**

在 Ubuntu 上，安装它很容易。你只需要在终端中输入以下内容：

```
sudo apt install elinks
```

对于其他 Linux 发行版，你应该可以在标准软件仓库中找到它。但是，如果你在软件仓库中找不到它，你可以参考[官方安装说明][14]。

### 总结

在终端上运行的基于文本的 Web 浏览器并不多，这并不奇怪。一些项目，如 [Browsh][15]，试图呈现一个现代的 Linux 命令行浏览器，但在我这里它不能工作。

虽然像 `curl` 和 `wget` 这样的工具允许你[从 Linux 命令行下载文件][16]，但这些基于终端的 Web 浏览器提供了额外的功能。

除了命令行浏览器之外，如果你想在终端上玩玩，也可以尝试一些[Linux 命令行游戏][17]。

对于 Linux 终端上的文本型 Web 浏览器，你有什么看法？欢迎在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/terminal-web-browsers/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/brave-web-browser/
[2]: https://itsfoss.com/install-chromium-ubuntu/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/w3m-google.jpg
[4]: https://duckduckgo.com/
[5]: https://itsfoss.com/review-googler-linux/
[6]: https://github.com/tats/w3m
[7]: https://itsfoss.com/aur-arch-linux/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/10/lynx-terminal.jpg
[9]: https://lynx.invisible-island.net/lynx-resources.html
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/10/links2-terminal.jpg
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/links2-terminal-welcome.jpg
[12]: http://links.twibright.com/download.php
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/10/elinks-terminal.jpg
[14]: http://elinks.or.cz/documentation/installation.html
[15]: https://www.brow.sh/
[16]: https://itsfoss.com/download-files-from-linux-terminal/
[17]: https://itsfoss.com/best-command-line-games-linux/
