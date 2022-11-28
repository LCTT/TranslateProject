[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12921-1.html)
[#]: subject: (Here are the Worthy Replacements of CentOS 8 for Your Production Linux Servers)
[#]: via: (https://itsfoss.com/rhel-based-server-distributions/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

什么 Linux 系统可以替换生产环境的 Linux 服务器上的 CentOS 8 
======

CentOS 是世界上最流行的服务器发行版之一。它是<ruby>红帽企业 Linux<rt>Red Hat Enterprise Linux</rt></ruby>（RHEL）的一个开源分支，提供了 RHEL 的优点，却没有 RHEL 的相关成本。

然而，最近情况发生了变化，[红帽正在将稳定的 CentOS 转换为滚动发布模式，即 CentOS Stream的形式][1]。CentOS 8 本来应该支持到 2029 年，但现在到 2021 年底就被迫停止了。

如果你的服务器使用的是 CentOS，这可能会让你不知道该何去何从。

你看，取代 CentOS 8 的首要选择就是 CentOS Stream。将 CentOS 8 升级到 CentOS Stream 的[过程很简单][2]，你不用担心需要重新安装任何东西。

不过，由于 CentOS Stream 是滚动发布性质的，你可能要考虑一些对生产服务器来说更稳定的东西。我将在本文中会推荐一些 Linux 系统来帮助你做出这个决定。

### 基于 RHEL 的服务器 Linux 发行版，你可以考虑用来取代 CentOS

![][3]

我将从一些正在开发的 RHEL 分支版本开始列举，其唯一目的是取代 CentOS 8。之后，我会列出你可以马上使用的服务器发行版。

#### Rocky Linux（正在开发中）

![][4]

就在红帽宣布计划用滚动发布的 CentOS Stream 取代稳定的 CentOS 8 的同一天，CentOS 的原开发者宣布了一个新项目，为 CentOS 用户提供 RHEL 分支。

这个新项目名为 [Rocky Linux][5]。它的名字是为了纪念原 CentOS 项目的共同创始人之一。它是从 RHEL 8 分支出来的，目标是“100% 与 RHEL 兼容”。

该项目正在快速开发中，目前可能无法使用。但这是在 2021 年底 CentOS 8 支持结束时取代它的首选之一。

#### Lenix 项目（开发中）

![][6]

这是在宣布 CentOS Stream 成为默认版本一天后创建的又一个 RHEL 分支。

[Lenix 项目][7]是由 CloudLinux 创建的，CloudLinux 是一家面向企业的服务机构，多年来一直在提供定制化的 CentOS 服务器，鉴于他们在 CentOS 和企业服务器方面的多年经验，Lenix 项目应该是一个很有前途的 RHEL 分支，可以取代 CentOS Stream。

#### Oracle Linux

![][8]

这可能是该列表中唯一能以最佳方式使用的 RHEL 分支。不仅可以随时使用，你甚至可以[从现有的 CentOS 安装迁移到 Oracle Linux][9]，而无需重新安装。

Oracle Linux 自 2006 年起推出。它的应用二进制 100% 兼容 RHEL，并且它提供了与每个 RHEL 版本相对应的版本。而且，你不需要与 Oracle 签署任何协议来使用 Oracle Linux。

Oracle Linux 有两种 Linux 内核可供选择：Oracle Linux 的<ruby>[坚不可摧企业级内核][10]<rt>Unbreakable Enterprise Kernel</rt></ruby>（UEK）或<ruby>红帽兼容内核<rt> Red Hat Compatible Kernel</rt></ruby>（RHCK）。

只是，甲骨文在开源项目上有些黑历史，可能这也是为什么选择 CentOS 这种真正的社区分支形式而不是甲骨文 Linux 的原因。随着 CentOS 被 CentOS Stream 所取代，也许现在正是给 Oracle 一个机会的时候？

#### ClearOS（来自惠普）

![][11]

[ClearOS][12] 是惠普在其 HPE ProLiant 服务器上提供的。虽然他们的网站上没有明确提到，但 ClearOS 是基于 RHEL 和 CentOS 的。

[Clear Center][13] 和 HPE 在这个项目上进行了合作。开源的 ClearOS 免费提供给社区。他们有自己的应用市场，混杂了免费和付费应用。你不需要为操作系统付费，但如果你选择了付费应用，你可能需要为该应用付费。

它可能没有那么流行，但随着 CentOS Stream 成为默认，如果惠普能抓住这个时机，ClearOS 应该能获得一些用户。他们会这么做吗？我不太确定。甲骨文正在努力吸引 CentOS 用户，但我没有看到惠普的这种努力。

#### Springdale Linux（普林斯顿大学的学术项目）

![][14]

一个由院士维护的红帽分支？这就是 Scientific Linux 吧？但 Scientific Linux 已经死了一年多了。

[Springdale Linux][15]（SDL）是普林斯顿大学的另一个这样的项目。它之前被称为 PUIAS Linux（<ruby>普林斯顿大学高级研究所<rt>Princeton University Institute for Advanced Study</rt></ruby>）。

目前还没有 RHEL 8 对应的 Springdale Linux，我觉得他们的开发速度可以加快一些。

### 不基于红帽的服务器发行版

好吧，到目前为止，列表中已经提到了基于红帽的发行版。现在是时候看看一些与 RHEL 无关，但仍然是生产服务器的上好选择的服务器发行版了。

#### YunoHost（专门为 Web 服务器定制的）

![][16]

[YunoHost][17] 是基于 Debian 定制的，目的是为你提供一个托管 Web 服务器的系统。

你可以在[树莓派等 ARM 板][18]、旧台式机和计算机上使用它，当然也可以在虚拟专用服务器（VPS）上使用。

YunoHost 还提供了一个基于 Web 的管理界面（灵感来自于 [Webmin][19]？），这样你就可以用图形化的方式来管理系统。这对于一个想托管 Web 服务器但又不太会命令行的人来说，是一个很大的安慰。

#### Debian Linux

![][20]

这个通用操作系统提供了一个坚如磐石的服务器发行版。对于那些想要一个稳定系统的人来说，是一个理想的选择。

如果你在 CentOS 上投入了太多的时间和技术，你可能会发现 [Debian][21] 略有不同，尤其是软件包管理系统。不过，我相信，对于一个经验丰富的 Linux 系统管理员来说，这应该不是什么大问题。

#### openSUSE

![][22]

SUSE 是红帽的直接竞争对手之一。他们以 [SUSE Linux Enterprise][23] 的形式提供企业级产品。他们的开源产品 openSUSE 也相当受欢迎，无论是在桌面还是服务器领域。

[openSUSE][24] 是一个服务器 Linux 发行版的好选择。现在的人不会明白 [SUSE 的 YAST 工具][25]在上世纪 90 年代和 2000 年初给用户带来了怎样的解脱。它仍然是管理 SUSE 系统的一个方便的工具。

openSUSE 有两种形式：滚动发布的 Tumbleweed 和稳定的点发布版的 Leap。我猜测你追求的是稳定性，所以 Leap 是你应该追求的目标。

#### Ubuntu

![][26]

[Ubuntu][27] 是世界上最流行的发行版，[在服务器上][28]和台式机上都是如此。这就是为什么没有 Ubuntu 这份清单就不完整的原因。

因为我已经使用 Ubuntu 很长时间了，所以我觉得在 Ubuntu 上托管我的 Web 服务器很舒服。但这只是我个人的想法。如果你是从 RHEL 领域过来的，这里的包管理系统和一些网络和管理组件是不同的。

[Ubuntu LTS 版][29]带有五年的支持，这是 CentOS 版本提供的一半长短。如果你不想升级版本，你可以选择为过时的 LTS 版本购买付费的扩展支持。

#### 你的选择是什么？

我已经列出了一些基于 RHEL 的发行版以及通用服务器发行版的顶级推荐。

现在轮到你了，在上面列出的发行版中，你最喜欢哪个？你有什么其他的建议可以添加到这个列表中吗？请在评论区留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/rhel-based-server-distributions/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-12902-1.html
[2]: https://linuxhandbook.com/update-to-centos-stream/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/Replace-centos.png?resize=800%2C450&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/rocky-linux.png?resize=800%2C350&ssl=1
[5]: https://rockylinux.org
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/cloudlinux.png?resize=800%2C350&ssl=1
[7]: https://www.reddit.com/r/ProjectLenix/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/oracle-linux.png?resize=800%2C350&ssl=1
[9]: https://github.com/oracle/centos2ol
[10]: https://docs.oracle.com/en/operating-systems/uek/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/clear-os.jpg?resize=795%2C349&ssl=1
[12]: https://www.clearos.com
[13]: https://www.clearcenter.com
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/springdale-linux.png?resize=800%2C350&ssl=1
[15]: https://puias.math.ias.edu
[16]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/yunohost.png?resize=720%2C400&ssl=1
[17]: https://yunohost.org#/
[18]: https://itsfoss.com/raspberry-pi-alternatives/
[19]: https://linuxhandbook.com/use-webmin/
[20]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/debian-linux.png?resize=800%2C350&ssl=1
[21]: https://www.debian.org
[22]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/12/opensuse.jpg?resize=800%2C350&ssl=1
[23]: https://www.suse.com/download/sles/
[24]: https://www.opensuse.org
[25]: https://yast.opensuse.org
[26]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/12/ubuntu.jpg?resize=800%2C350&ssl=1
[27]: https://ubuntu.com/download/server
[28]: https://www.datanyze.com/market-share/operating-systems--443/ubuntu-market-share
[29]: https://itsfoss.com/long-term-support-lts/
