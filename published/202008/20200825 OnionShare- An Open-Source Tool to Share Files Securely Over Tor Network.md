[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12564-1.html)
[#]: subject: (OnionShare: An Open-Source Tool to Share Files Securely Over Tor Network)
[#]: via: (https://itsfoss.com/onionshare/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

OnionShare：一个安全共享文件的开源工具
======

> OnionShare 是一个自由开源工具，它利用 Tor 网络安全和匿名地共享文件。

![](https://img.linux.net.cn/data/attachment/album/202008/30/103623ty2r6sz03y32o99o.jpg)

已经有很多在线服务可以安全地共享文件，但它可能不是完全匿名的。

此外，你必须依靠一个集中式服务来共享文件，如果服务决定像 [Firefox Send][1] 那样关闭，那你不能真正依靠它来一直安全地共享文件。

考虑到这些，OnionShare 是一个让人惊叹的开源工具，它让你使用 [Tor Onion 服务][2]来共享文件。它应该是所有云端文件共享服务的一个很好的替代品。

让我们来看看它提供了什么以及它是如何工作的。

![][3]

### OnionShare: 通过 Tor 匿名分享文件

[OnionShare][4] 是一款有趣的开源工具，可用于 Linux、Windows 和 macOS。

它可以让你安全地将文件直接从你的电脑分享给接收者，而不会在这个过程中暴露你的身份。你不必注册任何帐户，它也不依赖于任何集中式存储服务。

它基本上是在 Tor 网络上的点对点服务。接收者只需要有一个 [Tor 浏览器][5]就可以下载/上传文件到你的电脑上。如果你好奇的话，我也建议你去看看我们的 [Tor 指南][6]来探索更多关于它的内容。

让我们来看看它的功能。

### OnionShare 的功能

对于一个只想要安全和匿名的普通用户来说，它不需要调整。不过，如果你有需要，它也有一些高级选项。

* 跨平台支持（Windows、macOS和 Linux）。
* 发送文件
* 接收文件
* 命令行选项
* 发布洋葱站点
* 能够使用桥接（如果你的 Tor 连接不起作用）
* 能够使用持久 URL 进行共享（高级用户）。
* 隐身模式（更安全）

你可以通过 GitHub 上的[官方用户指南][7]来了解更多关于它们的信息。

### 在 Linux 上安装 OnionShare

你应该可以在你的软件中心找到 OnionShare 并安装它。如果没有，你可以在 Ubuntu 发行版上使用下面的命令添加 PPA：

```
sudo add-apt-repository ppa:micahflee/ppa
sudo apt update
sudo apt install -y onionshare
```

如果你想把它安装在其他 Linux 发行版上，你可以访问[官方网站][4]获取 Fedora 上的安装说明以及构建说明。

- [下载 OnionShare][4]

### OnionShare 如何工作？

当你安装好后，一切都很明了且易于使用。但是，如果你想开始，让我告诉你它是如何工作的。

完成后，它加载并连接到 Tor 网络。

#### 共享文件

![][8]

你只需要在电脑上添加你要分享的文件，然后点击 “**Start sharing**”。

完成后，右下角的状态应该是 “**Sharing**”，然后会生成一个 **OnionShare 地址**（自动复制到剪贴板），如下图所示。

![][9]

现在接收方需要的是 OnionShare 的地址，它看上去是这样的。

```
http://onionshare:xyz@jumbo2127k6nekzqpff2p2zcxcsrygbnxbitsgnjcfa6v47wvyd.onion
```

接着 Tor 浏览器开始下载文件。

值得注意的是，下载完成后（文件传输完成），文件共享就会停止。到时候也会通知你。

所以，如果你要再次分享或与他人分享，你必须重新分享，并将新的 OnionShare 地址发送给接收者。

#### 允许接收文件

如果你想生成一个 URL，让别人直接上传文件到你的电脑上（要注意你与谁分享），你可以在启动 OnionShare 后点击 **Receive Files** 标签即可。

![][10]

你只需要点击 “**Start Receive Mode**” 按钮就可以开始了。接下来，你会得到一个 OnionShare 地址（就像共享文件时一样）。

接收者必须使用 Tor 浏览器访问它并开始上传文件。它应该像下面这样：

![][11]

虽然当有人上传文件到你的电脑上时，你会收到文件传输的通知，但完成后，你需要手动停止接收模式。

#### 下载/上传文件

考虑到你已经安装了 Tor 浏览器，你只需要在 URL 地址中输入 OnionShare 的地址，确认登录（按 OK 键），它看上去像这样。

![][12]

同样，当你得到一个上传文件的地址时，它看上去是这样的。

![][13]

#### 发布洋葱站点

如果你想的话，你可以直接添加文件来托管一个静态的洋葱网站。当然，正因为是点对点的连接，所以在它从你的电脑上传输每个文件时，加载速度会非常慢。

![][14]

我试着用[免费模板][15]测试了一下，效果很好（但很慢）。所以，这可能取决于你的网络连接。

### 总结

除了上面提到的功能，如果需要的话，你还可以使用命令行进行一些高级的调整。

OnionShare 的确是一款令人印象深刻的开源工具，它可以让你轻松地匿名分享文件，而不需要任何特殊的调整。

你尝试过 OnionShare 吗？你知道有类似的软件么？请在下面的评论中告诉我！

--------------------------------------------------------------------------------

via: https://itsfoss.com/onionshare/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/firefox-send/
[2]: https://community.torproject.org/onion-services/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-screenshot.jpg?resize=800%2C629&ssl=1
[4]: https://onionshare.org/
[5]: https://itsfoss.com/install-tar-browser-linux/
[6]: https://itsfoss.com/tor-guide/
[7]: https://github.com/micahflee/onionshare/wiki
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-share.png?resize=800%2C604&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-file-shared.jpg?resize=800%2C532&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-receive-files.jpg?resize=800%2C655&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-receive-mode.jpg?resize=800%2C529&ssl=1
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-download.jpg?resize=800%2C499&ssl=1
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-upload.jpg?resize=800%2C542&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/onionshare-onion-site.jpg?resize=800%2C366&ssl=1
[15]: https://www.styleshout.com/free-templates/kards/
