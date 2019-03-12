[#]: collector: (lujun9972)
[#]: translator: (alim0x)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10607-1.html)
[#]: subject: (Booting Linux faster)
[#]: via: (https://opensource.com/article/19/1/booting-linux-faster)
[#]: author: (Stewart Smith https://opensource.com/users/stewart-ibm)

让 Linux 启动更快
======

> 进行 Linux 内核与固件开发的时候，往往需要多次的重启，会浪费大把的时间。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/tux_linux_penguin_code_binary.jpg?itok=TxGxW0KY)

在所有我拥有或使用过的电脑中，启动最快的那台是 20 世纪 80 年代的电脑。在你把手从电源键移到键盘上的时候，BASIC 解释器已经在等待你输入命令了。对于现代的电脑，启动时间从笔记本电脑的 15 秒到小型家庭服务器的数分钟不等。为什么它们的启动时间有差别？

那台直接启动到 BASIC 命令行提示符的 20 世纪 80 年代微电脑，有着一颗非常简单的 CPU，它在通电的时候就立即开始从一个内存地址中获取和执行指令。因为这些系统的 BASIC 在 ROM 里面，基本不需要载入的时间——你很快就进到 BASIC 命令提示符中了。同时代更加复杂的系统，比如 IBM PC 或 Macintosh，需要一段可观的时间来启动（大约 30 秒），尽管这主要是因为需要从软盘上读取操作系统的缘故。在可以加载操作系统之前，只有很小一部分时间是花费在固件上的。

现代服务器往往在从磁盘上读取操作系统之前，在固件上花费了数分钟而不是数秒。这主要是因为现代系统日益增加的复杂性。CPU 不再能够只是运行起来就开始全速执行指令，我们已经习惯于 CPU 频率变化、节省能源的待机状态以及 CPU 多核。实际上，在现代 CPU 内部有数量惊人的更简单的处理器，它们协助主 CPU 核心启动并提供运行时服务，比如在过热的时候压制频率。在绝大多数 CPU 架构中，在你的 CPU 内的这些核心上运行的代码都以不透明的二进制 blob 形式提供。

在 OpenPOWER 系统上，所有运行在 CPU 内部每个核心的指令都是开源的。在有 [OpenBMC][1]（比如 IBM 的 AC922 系统和 Raptor 的 TALOS II 以及 Blackbird 系统）的机器上，这还延伸到了运行在<ruby>基板管理控制器<rt>Baseboard Management Controller</rt></ruby>上的代码。这就意味着我们可以一探究竟，到底为什么从接入电源线到显示出熟悉的登录界面花了这么长时间。

如果你是内核相关团队的一员，你可能启动过许多内核。如果你是固件相关团队的一员，你可能要启动许多不同的固件映像，接着是一个操作系统，来确保你的固件仍能工作。如果我们可以减少硬件的启动时间，这些团队可以更有生产力，并且终端用户在搭建系统或重启安装固件或系统更新的时候会对此表示感激。

过去的几年，Linux 发行版的启动时间已经做了很多改善。现代的初始化系统在处理并行和按需任务上做得很好。在一个现代系统上，一旦内核开始执行，它可以在短短数秒内进入登录提示符界面。这里短短的数秒不是优化启动时间的下手之处，我们要到更早的地方：在我们到达操作系统之前。

在 OpenPOWER 系统上，固件通过启动一个存储在固件闪存芯片上的 Linux 内核来加载操作系统，它运行一个叫做 [Petitboot][2] 的用户态程序去寻找用户想要启动的系统所在磁盘，并通过 [kexec][3] 启动它。有了这些优化，启动 Petitboot 环境只占了启动时间的百分之几，所以我们还得从其他地方寻找优化项。

在 Petitboot 环境启动前，有一个先导固件，叫做 [Skiboot][4]，在它之前有个 [Hostboot][5]。在 Hostboot 之前是 [Self-Boot Engine][6]，一个晶圆切片（die）上的单独核心，它启动单个 CPU 核心并执行来自 Level 3 缓存的指令。这些组件是我们可以在减少启动时间上取得进展的主要部分，因为它们花费了启动的绝大部分时间。或许这些组件中的一部分没有进行足够的优化或尽可能做到并行？

另一个研究路径是重启时间而不是启动时间。在重启的时候，我们真的需要对所有硬件重新初始化吗？

正如任何现代系统那样，改善启动（或重启）时间的方案已经变成了更多的并行执行、解决遗留问题、（可以认为）作弊的结合体。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/1/booting-linux-faster

作者：[Stewart Smith][a]
选题：[lujun9972][b]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stewart-ibm
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/OpenBMC
[2]: https://github.com/open-power/petitboot
[3]: https://en.wikipedia.org/wiki/Kexec
[4]: https://github.com/open-power/skiboot
[5]: https://github.com/open-power/hostboot
[6]: https://github.com/open-power/sbe
[7]: https://linux.conf.au/schedule/presentation/105/
[8]: https://linux.conf.au/
