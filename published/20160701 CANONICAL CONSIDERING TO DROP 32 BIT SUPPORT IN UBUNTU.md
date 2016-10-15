Canonical 正考虑移除 Ubuntu 的 32 位支持
========================================================

![](https://itsfoss.com/wp-content/uploads/2016/06/Ubuntu-32-bit-goes-for-a-toss-.jpg)

之前，[Dimitri John Ledkov][1] 在 [Ubuntu 邮件列表][2] 发送了一则消息，称将在 Ubuntu 18.10 中取消 32 位支持。他说越来越多的软件已经有了 64 位支持，而且为古老的 32 位架构提供安全支持将变得更加困难。

Ledkov 同时表示，构建 32 位镜像并不是没有成本的，而要耗费 Canonical 不少的资源。

> 构建 32 位镜像并不是“免费的”，它的代价就是占用了我们的构建服务器资源、QA 和校验时间。尽管我我们有可扩展的构建环境，但 32 位支持还需要为所有包进行构建和自动测试，而且 ISO 也需要在我们的各种架构上进行测试。同时这还会占据大量的镜像空间和带宽。

Ledkov 计划着，Ubuntu 16.10、17.04、17.10 还会继续提供 32 位内核、网络安装器和云镜像，但移除桌面版和服务器版的 32 位 ISO 镜像。18.04 LTS 将会移除 32 位内核、网络安装器和云镜像，但在 64 位架构中兼容运行 32 位程序。然后在 18.10 中结束 32 位支持，并将传统的 32 位应用放在 snap、容器和虚拟机中。

但是，Ledkov 的这份计划还未被大家接受，但它表明了 32 位支持迟早要被遗弃。（LCTT 译注：我们已经知道 16.10 依旧有 32 为支持。）

### 好消息

当然，使用 32 位系统的用户也不必伤心。这个并不会影响用于拯救老式电脑的发行版。[Ubuntu MATE][4] 的创建者 [Martin Wimpress][3] 在 Googl+ 的讨论中透露，这些改变这是影响着主线上的 Ubuntu 而已。

>18.04 将继续存在 32 位架构支持，分支版本可以继续选择构建 32 位镜像。但还是会存在安全隐患，一些大型应用，如 Firefox、Chromium、LibreOffice，已经凸显了在一些旧版的 LTS 的更新安全问题。所以，这些分支版本需要注意其 32 位支持期限。

### 思考

从安全的角度，我可以理解他们为什么要移除 32 位支持，但是这可能会导致一部分人离开主线 Ubuntu 而投入另一个喜爱的发行版或者另一种架构的怀抱。值得庆幸的是，我们还可以选择 [轻量级 Linux 发行版][5]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/ubuntu-32-bit-support-drop/

作者：[John Paul][a]
译者：[GHLandy](https://github.com/GHLandy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]: https://plus.google.com/+DimitriJohnLedkov
[2]: https://lists.ubuntu.com/archives/ubuntu-devel-discuss/2016-June/016661.html
[3]: https://twitter.com/m_wimpress
[4]: http://ubuntu-mate.org/
[5]: https://itsfoss.com/lightweight-linux-beginners/
