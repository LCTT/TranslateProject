[#]: collector: (lujun9972)
[#]: translator: (warmfrog)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10790-1.html)
[#]: subject: (New Features Coming to Debian 10 Buster Release)
[#]: via: (https://itsfoss.com/new-features-coming-to-debian-10-buster-release/)
[#]: author: (Shirish https://itsfoss.com/author/shirish/)

即将到来的 Debian 10 Buster 发布版的新特点
=======================================

Debian 10 Buster 即将发布。第一个发布候选版已经发布，我们预期可以在几周内见到待最终版。

如果你期待对这个新的主要发布版本，让我告诉你里面有什么。

### Debian 10 Buster 发布计划

[Debian 10 Buster][1] 的发布日期并没有确定。为什么这样呢？不像其他分发版，[Debian][2] 并不基于时间发布。相反地它主要关注于修复<ruby>发布版重要 Bug<rt>release-critical bug</rt></ruby>。发布版重要 Bug 要么是严重的安全问题（[CVE][3]），要么是一些其他阻止 Debian 发布的严重问题。

Debian 在它的软件归档中分为三个部分，叫做 Main、contrib 和 non-free。在这三者之中，Debian 开发者和发布管理者最关心的包组成了该分发版的基石。Main 是像石头一样稳定的。因此他们要确保那里没有主要的功能或者安全问题。他们同样给予了不同的优先级，例如 Essential、Required、Important、Standard、Optional 和 Extra。更多关于此方面的知识参考后续的 Debian 文章。

这是必要的，因为 Debian 在很多环境中被用作服务器，人们已经变得依赖 Debian。他们同样看重升级周期是否有破环，因此他们寻找人们来测试，来查看当升级的时候是否有破坏并通知 Debian 有这样的问题。

这种提交方式带来的稳定性[是我喜欢 Debian 的众多原因之一][4]。

### Debian 10 Buster 版本的新内容

这里是即将到来的 Debian 主要发布版的一些视觉上和内部的改变。

#### 新的主题和壁纸

Buster 的 Debian 主题被称为 [FuturePrototype][5] 并且看起来如下图：

![Debian Buster FuturePrototype Theme][6]

#### 1、GNOME 桌面 3.30

Debian Stretch 版中的 GNOME 桌面在 Buster 中从 1.3.22 升级到了 1.3.30。在 GNOME 桌面发布版中新包含的一些包是 gnome-todo、tracker 替代了 tracker-gui、gstreamer1.0-packagekit 的依赖，因此可以通过自动地安装编码解码器来做播放电影之类的事。对于所有包来说一个大的改变是从 libgtk2+ 到 libgtk3+。

#### 2、Linux 内核 4.19.0-4

Debian 使用 LTS 内核版本，因此你可以期待更好的硬件支持和长达 5 年的维护和支持周期。我们已经从内核 4.9.0.3 到 4.19.0-4。

```
$ uname -r
4.19.0-4-amd64
```

#### 3、OpenJDK 11.0

Debian 在很长时间里都是 OpenJDK 8.0。现在在 Debian Buster 里我们已经升级为 OpenJDK 11.0，并且会有一个团队维护新的版本。

#### 4、默认启用 AppArmor

在 Debian Buster 中是默认启用 [AppArmor][7] 的。这是一个好事，谨慎是系统管理员必须采取的正确策略。这仅仅是第一步，并且可能需要修复很多对用户觉得有用的脚本。

#### 5、Nodejs 10.15.2

在很长一段时间里 Debian 在仓库中都只有 Nodejs 4.8。在这个周期里 Debian 已经移到 Nodejs 10.15.2。事实上，Debian Buster 有很多 javascript 库例如 yarnpkg （一个 nmp 的替代品）等等。

当然，你可以从该项目仓库[在 Debian 中安装最新的 Nodejs][8]，但是从 Debian 仓库中看到更新的版本是很棒的。

#### 6、NFtables 替代了 iptables

Debian Buster 提供了 nftables 来完整地替代了 iptables，因为它有更好、更简单的语法，更好的支持双栈 ipv4/v6 防火墙等等。

#### 7、支持更多的 ARM 64 和 ARMHF 的单板机。

Debian 已经支持一些常见的新的单板机，其中最新的包括 pine64_plus、ARM64 的 pinebook、Firefly-RK3288、ARMHF 64 的 u-boot-rockchip 以及 Odroid HC1/HC2 板、SolidRun Cubox-i 双核/四核（1.5som）和 SolidRun Cubox-i 双核/四核（1.5som+emmc）板、Cubietruckplus 等。同样支持 Rock 64、Banana Pi M2 Berry、Pine A64 LTS Board、Olimex A64 Teres-1 与 Rapberry Pi 1、Zero 和 Pi 3。对于 RISC-V 系统同样支持开箱即用。

#### 8、Python 2 已死，Python 3 长存

在 2020 年 1 月 1 日，Python 2 将被 python.org 废弃。在 Debian 将所有的软件包从 Python 2.7 移到 Python 3 以后，Python 2.7 将从软件仓库中移除。这可能发生在 Buster 发布版或者将来的某个发布版，这是肯定要来临的。因此 Python 开发者被鼓励移植他们的代码库来兼容 Python 3。在写本文的时候，在 Debian Buster 中同时支持 python2 和 pythone3。

#### 9、Mailman 3

在 Debian 中终于可以使用 Mailman3 了。同时 [Mailman][10] 已经被细分成为组件。要安装整个软件栈，可以安装 mailman3-full 来获取所有组件。

#### 10、任意已有的 Postgresql 数据库将需要重新索引

由于 glibc 本地数据的更新，放入文本索引中的信息排序的方式将会改变，因为重新索引是有益的，这样在将来就不会有数据破坏发生。

#### 11、默认 Bash 5.0

你可能已经了解了 [Bash 5.0 的新特点][11]，在 Debian 中已经是该版本了。

#### 12、Debian 实现 /usr/merge

我们已经分享过一个优秀的 freedesktop [读物][12]，介绍了 `/usr/merge` 带来了什么。有一些事项需要注意。当 Debian 想要整个过渡时，可能由于未预见的情况，一些二进制文件可能并没有做这些改变。需要指出的一点是，`/var` 和 `/etc` 不会被触及，因此使用容器或者云技术的不需要考虑太多 :)。

#### 13、支持安全启动

在 Buster RC1 中，Debian 现在支持<ruby>安全启动<rt>secure-boot</rt></ruby>。这意味着打开了安全启动设置的机器应该能够轻松安装 Debian。不再需要禁止或者处理安全启动的事 :)

#### 14、Debian-Live 镜像的 Calameres Live-installer 

对于 Debian Buster 的 Live 版，Debian 引入了 [Calameres 安装器][13]来替代老的 Debian-installer。Debian-installer 比 Calameres 功能更多，但对于初学者，Calameres 相对于 Debian-installer 提供了另外一种全新的安装方式。安装过程的截图：

![Calamares Partitioning Stage][14]

如图所见，在 Calamares 下安装 Debian 相当简单，只要经历 5 个步骤你就能在你的机器上安装 Debian。

### 下载 Debian 10 Live 镜像 （只用于测试）

现在还不要将它用于生产机器。可以在测试机上尝试或者一个虚拟机。

你可以从 Debian Live [目录][15]获取 Debian 64 位和 32 位的镜像。如果你想要 64 位的就进入 `64-bit` 目录，如果你想要 32 位的，就进入 `32-bit` 目录。

- [下载 Debian 10 Buster Live Images][15]

如果你从已存在的稳定版升级并且出现了一些问题，查看它是否在预安装的[升级报告][16]中提及了，使用 [reportbug][17] 报告你看到的问题。如果 bug 没有被报告，那么请尽可能地报告和分享更多地信息。

### 总结

当上千个包被升级时，看起来不可能一一列出。我已经列出了一些你在 Debian Buster 可以找到的一些主要的改变。你怎么看呢？

--------------------------------------------------------------------------------

via: https://itsfoss.com/new-features-coming-to-debian-10-buster-release/

作者：[Shirish][a]
选题：[lujun9972][b]
译者：[warmfrog](https://github.com/warmfrog)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/shirish/
[b]: https://github.com/lujun9972
[1]: https://wiki.debian.org/DebianBuster
[2]: https://www.debian.org/
[3]: https://en.wikipedia.org/wiki/Common_Vulnerabilities_and_Exposures
[4]: https://itsfoss.com/reasons-why-i-love-debian/
[5]: https://wiki.debian.org/DebianArt/Themes/futurePrototype
[6]: https://itsfoss.com/wp-content/uploads/2019/04/debian-buster-theme-800x450.png
[7]: https://wiki.debian.org/AppArmor
[8]: https://itsfoss.com/install-nodejs-ubuntu/
[9]: https://www.python.org/dev/peps/pep-0373/
[10]: https://www.list.org/
[11]: https://itsfoss.com/bash-5-release/
[12]: https://www.freedesktop.org/wiki/Software/systemd/TheCaseForTheUsrMerge/
[13]: https://calamares.io/about/
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/calamares-partitioning-wizard.jpg?fit=800%2C538&ssl=1
[15]: https://cdimage.debian.org/cdimage/weekly-live-builds/
[16]: https://bugs.debian.org/cgi-bin/pkgreport.cgi?pkg=upgrade-reports;dist=unstable
[17]: https://itsfoss.com/bug-report-debian/
