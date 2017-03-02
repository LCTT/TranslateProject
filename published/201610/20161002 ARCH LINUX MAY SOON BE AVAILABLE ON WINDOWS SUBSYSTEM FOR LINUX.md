Windows 的 Linux 子系统之 Archlinux
====

![Arch Linux on Windows Subsystem](https://itsfoss.com/wp-content/uploads/2016/10/Arch-Linux-on-windows-subsystem.jpg)

Ubuntu 的制造商 [Canonical](http://www.canonical.com/) 早已和微软进行合作，让我们体验了极具争议的 [Bash on Windows](https://itsfoss.com/bash-on-windows/)。外界对此也是褒贬不一，许多 Linux 重度用户则是质疑其是否有用，以及更进一步认为 [Bash on Windows 是一个安全隐患](https://itsfoss.com/linux-bash-windows-security/)。

Unix 的 Bash 是通过 WSL (Windows Subsystem for Linux，Windows 的 Linux 子系统) 特性移植到了 Windows 中。早先，我们已经展示过 [安装 Bash 到 Windows](https://itsfoss.com/install-bash-on-windows/)。

Canonical 和微软合作的 Bash on Windows 也仅仅是 Ubuntu 的命令行而已，并非是正规的图形用户界面。

不过，有个好现象是 Linux 爱好者开始在上面投入时间和精力，他们在 WSL 做到的成绩甚至让最初的开发者都吃惊，“等等，这真的可以吗？”。

这个正在逐步实现之中。

![Ubuntu os Win 10](https://itsfoss.com/wp-content/uploads/2016/09/ubuntu-unity-on-windows-10.jpg)

没错，上图所示就是运行在 Windows 中的 Ubuntu Unity 桌面。一位名为 Pablo Gonzalez （GitHub ID 为 [Guerra24](https://github.com/Guerra24) ）的程序员将这个完美实现了。随着这个实现，他向我们展示了 WSL 已经超越了当初构想之时的功能。

如果现在可以在 Windows 子系统之中运行 Ubuntu Unity，那么运行其他的 Linux 发行版还会远吗？

### Arch  Linux 版的 Bash on Windows

在 WSL 本地运行完整的 Linux发行版，迟早是要实现的。而我最希望的就是 [Arch Linux](https://www.archlinux.org/) （[Antergos](https://itsfoss.com/tag/antergos/) 爱好者点击此处）。

![Arch Linux on Windows](https://itsfoss.com/wp-content/uploads/2016/09/awsl.jpg)

Hold 住，Hold 住，该项目目前还在测试中。它由“mintxomat”在 GitHub 上开发的，最新为 0.6 版本。第一个稳定版将在今年的 12 月底发布。

那么，该项目的出台会有什么不同呢？

你可能早就知道，WSL 仅在 Windows 10 中可用。但是 Windows 的 Linux 子系统之 Arch Linux (AWSL) 早已成功的运行在 Windows 7、Windows 8、Windows 8.1 和 Windows Server 2012(R2)，当然还有 Windows 10。

我靠，他们是怎么做到的？！

其开发者曾说，AWSL 协议抽象归纳了不同 Windows 版本的各种框架。所以，当 AWSL 发布 1.0 应该会取得更大的成绩。如我们之前提到的移植性，该项目会先向所有 Windows 版本推出 Bash on Windows。

该项目很有雄心，并且很有看头。如果等不及 12 月底的稳定版，你可以先行尝试其测试版。但要记住，目前还是开发者预览版，此刻并不稳定。但是，我们什么时候停止过折腾的脚步？

你也可到 GitHub 查看此项目的进度：[Arch on Windows Subsystem](https://github.com/turbo/alwsl)

分享本文，以便大家都知道 Arch Linux 即将登陆 Windows 子系统。同时，也告诉我们，你希望 WSL 中有什么发行版。

--------------------------------------------------------------------------------

via: https://itsfoss.com/arch-linux-windows-subsystem/

作者：[Aquil Roshan][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
