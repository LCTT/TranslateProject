[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12001-1.html)
[#]: subject: (Basilisk: A Firefox Fork For The Classic Looks and Classic Extensions)
[#]: via: (https://itsfoss.com/basilisk-browser/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Basilisk：一个有着经典的外观和扩展的 Firefox 复刻
======

> Basilisk 是一个 Firefox 复刻，它支持旧版的扩展等更多功能。在这里，我们看一下它的功能并尝试一下。

![](https://img.linux.net.cn/data/attachment/album/202003/16/130319lvls6fvsaslzllrv.jpg)

### Basilisk：基于 XUL 的开源 Web 浏览器

尽管最好使用 Linux 上的常规浏览器（如 Firefox 或 Chromium），但了解其他浏览器也没坏处。最近，我偶然发现了一个 Firefox 复刻：[Basilisk][1] 浏览器，它有经典的 Firefox 用户界面以及对旧版扩展的支持（就像 [Waterfox][2] 一样）。

![itsfoss.com homepage on Basilisk][3]

如果你迫切需要使用旧版扩展程序或怀念 Firefox 的经典外观，Basilisk 浏览器可以帮到你。这个浏览器是由 [Pale Moon][4] 浏览器背后的团队维护（这是我接下来要介绍的另一个 Firefox 复刻）。

如果你正在寻找开源 [Chrome 替代品][5]，那么你可以快速了解一下 Basilisk 提供的功能。

**注意：**Basilisk 是开发中软件。即使我在使用时没有遇到重大的可用性问题，但你也不应依赖它作为唯一使用的浏览器。

### Basilisk 浏览器的特性

![][6]

Basilisk 开箱即用。但是，在考虑使用之前，可能需要先看一下以下这些特性：

* 基于 [XUL][7] 的 Web 浏览器
* 它具有 “Australis” Firefox 界面，这在 v29–v56 的 Firefox 版本中非常流行。
* 支持 [NPAPI][8] 插件（Flash、Unity、Java 等）
* 支持 XUL/Overlay Mozilla 形式的扩展。
* 使用 [Goanna][9] 开源浏览器引擎，它是 Mozilla [Gecko][10] 的复刻
* 不使用 Rust 或 Photon 用户界面
* 仅支持 64 位系统

### 在 Linux 上安装 Basilisk

你可能没有在软件中心中找到它。因此，你必须前往其官方[下载页面][11]获得 tarball（tar.xz）文件。

下载后，只需将其解压缩并进入文件夹。接下来，你将在其中找到一个 `Basilisk` 可执行文件。你只需双击或右键单击并选择 “运行” 即可运行它。

你可以查看它的 [GitHub 页面][12]获取更多信息。

![][13]

你也可以按照下面的步骤使用终端进入下载的文件夹，并运行文件：

```
cd basilisk-latest.linux64
cd basilisk
./basilisk
```

- [下载 Basilisk][1]

### 使用 Basilisk 浏览器

![][14]

如果你想要支持旧版扩展，Basilisk 是不错的 Firefox 复刻。它是由 Pale Moon 背后的团队积极开发的，对于希望获得 Mozilla Firefox（在 Quantum 更新之前）经典外观，且不包括现代 Web 支持的用户而言，它可能是一个不错的选择。

浏览网页没有任何问题。但是，我注意到 YouTube 将其检测为过时的浏览器，并警告说它将很快停止支持它。

**因此，我不确定 Basilisk 是否适合所有现有的 Web 服务 —— 但是，如果你确实需要使用 Firefox 较早版本中的扩展，那这是一个解决方案。**

### 总结

你认为这个 Firefox 复刻值得尝试吗？你喜欢哪个？在下面的评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/basilisk-browser/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.basilisk-browser.org/
[2]: https://itsfoss.com/waterfox-browser/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/basilisk-itsfoss.jpg?ssl=1
[4]: https://www.palemoon.org
[5]: https://itsfoss.com/open-source-browsers-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/basilisk-options-1.jpg?ssl=1
[7]: https://developer.mozilla.org/en-US/docs/Archive/Mozilla/XUL
[8]: https://wiki.mozilla.org/NPAPI
[9]: https://en.wikipedia.org/wiki/Goanna_(software)
[10]: https://developer.mozilla.org/en-US/docs/Mozilla/Gecko
[11]: https://www.basilisk-browser.org/download.shtml
[12]: https://github.com/MoonchildProductions/Basilisk
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/basilisk-folder-1.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/basilisk-browser-1.jpg?ssl=1
