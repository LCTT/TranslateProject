CANONICAL 正考虑移除 Ubuntu 的 32 位支持
========================================================

![](https://itsfoss.com/wp-content/uploads/2016/06/Ubuntu-32-bit-goes-for-a-toss-.jpg)

昨天（LCTT 译注：原文是 2016 年 07 月 01 日发布，这里的“昨天”就是 06 月 30 日），[Dimitri John Ledkov][1] 在 [Ubuntu 邮件列表][2] 发送了一则消息，即将在 Ubuntu 18.10 中取消 32 位支持。他说现在的多少软件都已经开发出了 64 位支持，并且为 32 位架构提供安全支持将变得更加困难。

Ledkov 同时表示，构建 32 位镜像并不免费，又会耗费 Canonical 不少的资源。
Ledkov also argues that building i386 images is not free, but takes quite a bit of Canonical’s resources.

>Building i386 images is not “for free”, it comes at the cost of utilizing our build farm, QA and validation time. Whilst we have scalable build-farms, i386 still requires all packages, autopackage tests, and ISOs to be revalidated across our infrastructure. As well as take up mirror space & bandwidth.（以后将不会“免费”构建 32 位镜像，因为会耗费我们较多我们的构建资源、QA 和校验时间。尽管我我们有可扩展的构建条件，但 32 位支持还需要所有的包、对自动生成包校验和测试 ISO 在基础硬件上的兼容性。同时这还会占据大量的镜像空间和带宽。）

Ledkov 计划着，Ubuntu 16.10、17.04、17.10 还会继续提供 32 位内核、网络安装器和云镜像，但移除桌面版和服务器版的 32 位 ISO 镜像。18.04 LTS 将会移除 32 位内核、网络安装器和云镜像，但在 64 位架构中兼容运行 32 位程序。然后在 18.10 中结束 32 位支持，并将传统的 32 位应用现在在 snap、容器和虚拟机中。

但是，Ledkov 的这份计划还未被大家接受，但它表明了 32 位支持迟早要被遗弃。

### 好消息

当然，使用 32 位系统的用户也不必伤心。这个并不会英雄旧版 32 位系统的使用。[Ubuntu MATE][4] 的创建者 [Martin Wimpress][3] 在 Googl+ 的讨论中透露，这些改变这是影响着主线上的 Ubuntu 而已。

>The i386 archive will continue to exist into 18.04 and flavours can continue to elect to build i386 isos. There is however a security concern, in that some larger applications (Firefox, Chromium, LibreOffice) are already presenting challenges in terms of applying some security patches to older LTS releases. So flavours are being asked to be mindful of the support period they can reasonably be expected to support i386 versions for.（18.04 将继续存在 32 位架构支持，用户可以投票是否构建 32 位镜像。但还是会存在安全隐患，一些大体积应用，如 Firefox、Chromium、LibreOffice，在一些旧版的 LTS 中更新安全补丁早已问题突出。所以，需要用户投票决定一个合理的 32 位支持期限）

### 思考

从安全的角度，我可以理解他们为什么要移除 32 位支持，但是这可能会导致一部分人离开主线 Ubuntu 而投入另一个喜爱的发行版或者另一种架构的怀抱。值得庆幸的是，我们还可以选择 [轻量级 Linux 发行版][5].

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-32-bit-support-drop/

作者：[John Paul][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]: https://plus.google.com/+DimitriJohnLedkov
[2]: https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2016-June/016661.html
[3]: https://twitter.com/m_wimpress
[4]: http://ubuntu-mate.org/
[5]: https://itsfoss.com/lightweight-linux-beginners/
