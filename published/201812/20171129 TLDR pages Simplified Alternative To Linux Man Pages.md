TLDR 页：Linux 手册页的简化替代品
==============

[![](https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-ubuntu-640x360.jpg "tldr page ubuntu")][22] 

在终端上使用各种命令执行重要任务是 Linux 桌面体验中不可或缺的一部分。Linux 这个开源操作系统拥有[丰富的命令][23]，任何用户都无法全部记住所有这些命令。而使事情变得更复杂的是，每个命令都有自己的一组带来丰富的功能的选项。

为了解决这个问题，人们创建了<ruby>[手册页][12]<rt>man page</rt></ruby>，（手册 —— man 是 manual 的缩写）。首先，它是用英文写成的，包含了大量关于不同命令的深入信息。有时候，当你在寻找命令的基本信息时，它就会显得有点庞杂。为了解决这个问题，人们创建了[TLDR 页][13]。

### 什么是 TLDR 页？

TLDR 页的 GitHub 仓库将其描述为简化的、社区驱动的手册页集合。在实际示例的帮助下，努力让使用手册页的体验变得更简单。如果还不知道，TLDR 取自互联网的常见俚语：<ruby>太长没读<rt>Too Long Didn’t Read</rt></ruby>。

如果你想比较一下，让我们以 `tar` 命令为例。 通常，手册页的篇幅会超过 1000 行。`tar` 是一个归档实用程序，经常与 `bzip` 或 `gzip` 等压缩方法结合使用。看一下它的手册页：

[![tar man page](https://fossbytes.com/wp-content/uploads/2017/11/tar-man-page.jpg)][14] 

而另一方面，TLDR 页面让你只是浏览一下命令，看看它是如何工作的。 `tar` 的 TLDR 页面看起来像这样，并带有一些方便的例子 —— 你可以使用此实用程序完成的最常见任务：

[![tar tldr page](https://fossbytes.com/wp-content/uploads/2017/11/tar-tldr-page.jpg)][15]

让我们再举一个例子，向你展示 TLDR 页面为 `apt` 提供的内容：

[![tldr-page-of-apt](https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-of-apt.jpg)][16]

如上，它向你展示了 TLDR 如何工作并使你的生活更轻松，下面让我们告诉你如何在基于 Linux 的操作系统上安装它。

### 如何在 Linux 上安装和使用 TLDR 页？

最成熟的 TLDR 客户端是基于 Node.js 的，你可以使用 NPM 包管理器轻松安装它。如果你的系统上没有 Node 和 NPM，请运行以下命令：

```
sudo apt-get install nodejs
sudo apt-get install npm 
```

如果你使用的是 Debian、Ubuntu 或 Ubuntu 衍生发行版以外的操作系统，你可以根据自己的情况使用`yum`、`dnf` 或 `pacman`包管理器。

现在，通过在终端中运行以下命令，在 Linux 机器上安装 TLDR 客户端：

```
sudo npm install -g tldr 
```

一旦安装了此终端实用程序，最好在尝试之前更新其缓存。 为此，请运行以下命令：

```
tldr  --update 
```

执行此操作后，就可以阅读任何 Linux 命令的 TLDR 页面了。 为此，只需键入：

```
tldr  <commandname> 
```

[![tldr kill command](https://fossbytes.com/wp-content/uploads/2017/11/tldr-kill-command.jpg)][17] 

你还可以运行其[帮助命令](https://github.com/tldr-pages/tldr-node-client)，以查看可与 TLDR 一起使用的各种参数，以获取所需输出。 像往常一样，这个帮助页面也附有例子。

### TLDR 的 web、Android 和 iOS 版本

你会惊喜地发现 TLDR 页不仅限于你的 Linux 桌面。 相反，它也可以在你的 Web 浏览器中使用，可以从任何计算机访问。

要使用 TLDR Web 版本，请访问 [tldr.ostera.io][18] 并执行所需的搜索操作。

或者，你也可以下载 [iOS][19] 和 [Android][20] 应用程序，并随时随地学习新命令。

[![tldr app ios](https://fossbytes.com/wp-content/uploads/2017/11/tldr-app-ios.jpg)][21]

你觉得这个很酷的 Linux 终端技巧很有意思吗？ 请尝试一下，让我们知道您的反馈。

--------------------------------------------------------------------------------

via: https://fossbytes.com/tldr-pages-linux-man-pages-alternative/

作者：[Adarsh Verma][a]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fossbytes.com/author/adarsh/
[1]:https://fossbytes.com/watch-star-wars-command-prompt-via-telnet/
[2]:https://fossbytes.com/use-stackoverflow-linux-terminal-mac/
[3]:https://fossbytes.com/single-command-curl-wttr-terminal-weather-report/
[4]:https://fossbytes.com/how-to-google-search-in-command-line-using-googler/
[5]:https://fossbytes.com/check-bitcoin-cryptocurrency-prices-command-line-coinmon/
[6]:https://fossbytes.com/review-torrench-download-torrents-using-terminal-linux/
[7]:https://fossbytes.com/use-wikipedia-termnianl-wikit/
[8]:http://www.facebook.com/sharer.php?u=https%3A%2F%2Ffossbytes.com%2Ftldr-pages-linux-man-pages-alternative%2F
[9]:https://twitter.com/intent/tweet?text=TLDR+pages%3A+Simplified+Alternative+To+Linux+Man+Pages&url=https%3A%2F%2Ffossbytes.com%2Ftldr-pages-linux-man-pages-alternative%2F&via=%40fossbytes14
[10]:http://plus.google.com/share?url=https://fossbytes.com/tldr-pages-linux-man-pages-alternative/
[11]:http://pinterest.com/pin/create/button/?url=https://fossbytes.com/tldr-pages-linux-man-pages-alternative/&media=https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-ubuntu.jpg
[12]:https://fossbytes.com/linux-lexicon-man-pages-navigation/
[13]:https://github.com/tldr-pages/tldr
[14]:https://fossbytes.com/wp-content/uploads/2017/11/tar-man-page.jpg
[15]:https://fossbytes.com/wp-content/uploads/2017/11/tar-tldr-page.jpg
[16]:https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-of-apt.jpg
[17]:https://fossbytes.com/wp-content/uploads/2017/11/tldr-kill-command.jpg
[18]:https://tldr.ostera.io/
[19]:https://itunes.apple.com/us/app/tldt-pages/id1071725095?ls=1&mt=8
[20]:https://play.google.com/store/apps/details?id=io.github.hidroh.tldroid
[21]:https://fossbytes.com/wp-content/uploads/2017/11/tldr-app-ios.jpg
[22]:https://fossbytes.com/wp-content/uploads/2017/11/tldr-page-ubuntu.jpg
[23]:https://fossbytes.com/a-z-list-linux-command-line-reference/
