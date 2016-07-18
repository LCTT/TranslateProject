Ubuntu 的 snap 软件包封装真的安全吗？
==========================================

最近发布的 [Ubuntu 16.04 LTS 版本带来了一些新功能[1]，其中之一就是对 [ZFS 格式文件系统的支持][2]。另一个值得广为讨论的特性就是 Snap 软件包格式。不过，据 [CoreOS][3] 的开发者之一所述，Snap 软件包并不像声称的那样安全。

### 什么是 Snap 软件包？

Snap 软件包的灵感来自容器。这种新的封装格式允许[开发人员为运行于 Ubuntu 长期支持版本 (LTS)之上的应用程序发布更新][4]。这就可以让用户虽然运行着稳定版本的操作系统，但却能够让应用程序保持最新的状态。之所以能够这样，是因为软件包本身就包含了程序运行的所有依赖。这可以防止依赖的软件更新后软件挂掉。

snap 软件包的另外一个优势是应用与系统的其它部分是隔离的。这意味着如果你改变了 snap 软件包的一些东西，它不会影响到系统的其它部分。这也可以防止其它的应用访问你的隐私信息，从而使骇客根据难以获取你的数据。

### 然而……

据 [Matthew Garrett][5] 的说法，Snap 软件包不能完全兑现上述承诺。Garret 作为 Linux 内核的开发人员和 CoreOS 的安全性方面的开发者，我想他一定知道自己在说些什么。

[据 Garret 说][6], “仅需要克服一点点困难，安装的任何 Snap 格式的软件包就完全能够将你所有的私有数据复制到任何地方”。

[ZDnet][7] 的报道：

> “为了证明自己的观点，他在 Snap 中构建了一个仅用于验证其原理的用于破坏的软件包，它首先会显示一个可爱的泰迪熊，然后将会记录 Firefox 的键盘按键事件，并且能够窃取 SSH 私钥。这个仅用于验证原理的软件包实际上注入的是一个无害的命令，但是却能够修改成一个窃取 SSH 密钥的 cURL 会话。”

### 但是稍等……

难道 Snap 真的有安全缺陷？事实上却不是！

Garret 自己也说，此问题仅出现在使用 X11 窗口系统上，而对于那些使用 Mir 的移动设备无效。所以这个缺陷是 X11 的而不是 Snap 的。

> X11 是如何信任应用程序的，这是一个众所周知的安全风险。Snap 并没有更改 X11 的信任模型。所以一个应用程序能够看到其它应用程序的行为并不是这种新的封装格式的缺点，而是 X11 的。

Garrett 实际上想表达的只是，当 Canonical 歌颂 Snap 和它的安全性时，Snap 应用程序并不是完全沙盒化的。和其他二进制文件一样，它们也存在风险。

请牢记 Ubuntu 16.04 当前还在使用 X11 而不是 Mir 的事实，从未知的源下载和安装 Snap 格式的软件包也许还是有风险的，然而其它不也是如此嘛？！

相关链接： [如何在 Ubuntu 16.04 中使用 Snap 软件包][8]。期待您分享关于 Snap 格式及其安全性的观点。

----------
via: http://itsfoss.com/snap-package-securrity-issue/

作者：[John Paul][a]
译者：[dongfengweixiao](https://github.com/dongfengweixiao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://itsfoss.com/author/john/
[1]: http://itsfoss.com/features-ubuntu-1604/
[2]: http://itsfoss.com/oracle-canonical-lawsuit/
[3]: https://en.wikipedia.org/wiki/CoreOS
[4]: https://insights.ubuntu.com/2016/04/13/snaps-for-classic-ubuntu/
[5]: https://mjg59.dreamwidth.org/l
[6]: https://mjg59.dreamwidth.org/42320.html
[7]: http://www.zdnet.com/article/linux-expert-matthew-garrett-ubuntu-16-04s-new-snap-format-is-a-security-risk/
[8]: http://itsfoss.com/use-snap-packages-ubuntu-16-04/
