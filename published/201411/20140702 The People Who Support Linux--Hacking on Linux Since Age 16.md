一个 Linux 支持者：从 16 岁开始在 Linux 上 hacking
================================================================================

![](http://www.linux.com/images/stories/41373/Yitao-Li.png)

>翻译文章中是称主人公为 Yitao Li，还是李逸韬？他似乎是美国人，“李逸韬”是看的他的个人主页上的。

在软件开发者 [Yitao Li (李逸韬) 的 GitHub 仓库][1]中，几乎所有的项目都是在他的 Linux 机器上开发完成的。它们没有一个是必须特定需要 Linux 的，但李逸韬说他使用 Linux 来做“任何事情”。

举些例子：“编码/脚本设计，网页浏览，网站托管，任何云相关的，发送/接收 PGP 签名的邮件，调整防火墙规则，将 OpenWrt 镜像刷入路由器，运行某版本的 Linux kernel 的同时编译另一个版本，从事研究，完成功课（例如，用 Tex 输入数学公式），以及其他许多......” Li 在邮件里如是说。

在李逸韬的 GitHub 仓库里所有项目中他的最爱是一个学校项目，调用 libpthread 和 libfuse 库，使用 C++ 开发，用来理解和正确执行基于 PAXOS 的分布式加锁，键值对服务，最终实现一个分布式文件系统。他使用若干测试脚本分别在单核和多核的机器上对这个项目进行测试。
 
"可以借助正确地实现（或者至少大部分正确）PAXOS 协议，并且通过了所有测试，来学习关于分布式共识协议的知识，"他说，“当然一旦这完成了，他就可以获得一些炫耀的权利。除此之外，一个分布式文件系统在其他许多编程项目中也可以很有用。”

Li 是在 16 岁的时候第一次开始使用 Linux，或是者说大约 7.47 年之前，他说，通过使用网站 [linuxfromscratch.org][2] ，从 Scratch book 中获得的免费可下载的 Linux 中学习了大量知识。那么他为什么会使用 Linux？

"1. Linux 是黑客的天才工具，所以我没看到任何不用它的理由，"他写道，“2. 大脑的前额叶皮质（可能）在我16岁时正变得很发达。”

[![](http://www.linux.com/images/stories/41373/ldc_peop_linux.png)][3]

他现在为 eBay工作，主要进行 Java 编程但有时也使用 Hadoop, Pig, Zookeeper, Cassandra, MongoDB，以及其他一些需要 POSIX 兼容平台的软件来工作。他主要通过给 Wikipedia 页面和 Linux 相关的论坛做贡献来支持 Linux 社区，另外当然还成为了 Linux 基金会的个人会员。

他紧跟最新的 Linux 发展动态，最近还对 GCC 4.9 及之后版本新增的 “-fstack-protector-strong” 选项印象深刻。

"虽然这并不与我的任何项目直接相关，但它对于安全和性能问题十分重要。"他说，“这个选项比 ‘-fstack-protector-all’ 更高效的多，却在安全上几乎没有影响，同时比 ‘-fstack-protector’ 选项提供了更好的栈溢出防护覆盖。”

欢迎来到 Linux 基金会，Yitao !

了解更多关于成为 [Linux 基金会个人会员][3]的内容。基金会将为每位 6 月份期间的新个人会员捐赠 $25 给 Code.org。

----------

![](http://www.linux.com/community/forums/avatar/41373/catid/200-libby-clark/thumbnail/large/cache/1331753338)

[Libby Clark][4]

--------------------------------------------------------------------------------

via: http://www.linux.com/news/featured-blogs/200-libby-clark/778559-the-people-who-support-linux-hacking-on-linux-since-age-16

译者：[jabirus](https://github.com/jabirus) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://github.com/yl790
[2]:http://linuxfromscratch.org/
[3]:https://www.linuxfoundation.org/about/join/individual
[4]:http://www.linux.com/community/forums/person/41373/catid/200-libby-clark