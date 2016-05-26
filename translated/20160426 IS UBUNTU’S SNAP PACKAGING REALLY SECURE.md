Ubuntu 的 SNAP 封装真的足够安全？
==========================================


最近发布的 Ubuntu 16.04 LTS 版本带来了一些新功能，其中之一就是对 ZFS 格式文件系统的支持。
另一个值得广为讨论的特性就是 Snap 格式的软件包。不过，据 CoreOS 的开发者之一所述，
Snap 封装并不像声称的那样安全。

### 什么是 Snap 格式？

Snap 封装受容器的启发。这种新的封装格式允许开发人员发布运行于 Ubuntu Long-Term-Support (LTS) releases 之上的应用程序更新。
这就可以让用户虽然运行着稳定版本的系统，但却能够让应用程序保持最新的状态。之所以能够这样，
是因为软件包本身就包含了程序运行的所有依赖。这可以防止依赖的软件更新后软件挂掉。

### 然而……

据 [Matthew Garrett][5] 的说法，Snap 封装不能完全兑现最后的承诺。Garret 最为 Linux
内核的开发人员和 CoreOS 的安全性相关工作的开发者，我想他一定知道自己在说些什么。

[According to Garret][6], “仅需要克服一点点困难，安装的任何 Snap 格式的软件包就能够将你的私有数据复制到任何地方”。

[ZDnet][7] 的报道：

>*“为了证明自己的观点，他在Snap中构建了一个仅用于验证原理的攻击包，它首先会显示一个可爱的泰迪熊，
然后将会记录按键点击事件，并且能够窃取私人的 SSH 密钥。这个仅用于验证原理的工具包实际上注入的是一个无害的命令，
但是却能够修改 cURL session 过程来窃取 SSH 密钥。”

### 但是稍等……
难道 Snap 真的有安全缺陷？当然不是啦！

Garret 自己也说，此问题仅出现在使用 X11 窗口的系统上，而对于那些使用 Mir 的移动设备无效。
所以这个缺陷是 X11 的而不是 Snap 的。

>X11 是如何对应用程序进行受信是一个众所周知的安全风险。Snap 并没有更改 X11 的受信模型。
所以一个应用程序能够看到其它应用程序的行为并不是新的包格式的缺点，而是 X11 的。

Garrett 实际上仅仅是想要表达，当 Canonical 歌颂 Snap 和它的安全性时，Snap 应用程序并不是完全沙盒化的。
和其他二进制文件一样，它们也存在风险。

牢记 Ubuntu 16.04 当前还在使用 X11 而不是 Mir 的事实，从未知的源下载和安全 Snap 格式的软件包具有风险，然而其它不也是如此嘛？！

相关链接： [如何在 Ubuntu 16.04 中使用 Snap 格式软件包][8]。期待您分享关于 Snap 格式及其安全性的观点。
----------
via: http://itsfoss.com/snap-package-securrity-issue/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29

作者：[ John Paul][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
