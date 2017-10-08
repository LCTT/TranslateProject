深入实时 Linux
============================================================


 ![Jan Altenberg](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/jan-altenberg-elc.png?itok=mgQeKpEK "Jan Altenberg") 
 
> 实时 Linux 在过去十年中已经走了很长的路。Linutronix 的 Jan Altenberg 提供了对该主题做了概述，并在 ELC Europe 的视频中提供了新的 RTL 性能基准。 

实时 Linux（RTL）是一种启用 PREEMPT_RT 的主线 Linux，在过去十年中已经走了很长的路。大约 80％ 的确定性的 [PREEMPT_RT][3] 补丁现在可用于主线内核本身。然而，Linux 上单内核 RTL 的最强大的替代品——双内核 Xenomai——继续声称在减少延迟上有巨大的优势。在去年 10 月的 [欧洲嵌入式 Linux 会议][4]的演讲中，Jan Altenberg 反驳了这些声明，同时对实时主题做了论述。

德国嵌入式开发公司 [Linutronix][5] 的 Altenberg 并不否认 Xenomai 和 RTAI 等双核方法提供较低的延迟。然而，他揭示了新的 Linutronix 基准，旨在表明差异不如所声称的那样大，特别是在实际使用中。争议较少的是，他认为 RTL 更易于开发和维护。

在我们深入永恒的 Xenomai 与 RTL 的辩论之前，请注意，2015 年 10 月，[开源自动化开发实验室][6]（OSADL）将 RTL 项目的[控制权][7]转移给了管理 Linux.com 的 Linux 基金会。此外，Linutronix 是 RTL 项目的主要贡献者，并承担了 x86 的维护者。

RTL 的进步是过去十年中 Linux 从实时操作系统（RTOS）中[获得市场占有率][8]的几个原因之一。实时操作系统在微控制器上比应用处理器上更频繁出现，并且在缺乏高级用户级操作系统（如 Linux）的单用途设备上实现实时很简单。

Altenberg 通过清除关于实时确定性的内核方案的一些常见的误解开始他的演讲。Altenberg 告诉他的 ELCE 观众：“实时不是快速执行，这基本上是决定论和定时保证。实时为你提供保证某些内容将在给定的时间内执行。你不想要尽可能快，但是要尽快指定。”

在给定的执行时间内的迟缓的反应会导致严重后果，特别是当它可能导致人们受到伤害时，开发人员往往会使用实时的方式。这就是为什么实时性仍然在很大程度上受到工厂自动化行业的推动，并且越来越多地出现在汽车、火车和飞机上。然而，并不总是生死攸关的情况 - 金融服务公司使用 RTL 进行高频交易。

Altenberg 说：“实时需求包括确定性的定时行为、抢占、优先级继承和优先级上限。最重要的要求是高优先级任务总是需要能够抢占低优先级的任务。”

Altenberg 强烈建议不要使用术语“软实时”来描述轻量级实时解决方案。“你可以是确定性的或者不是，但两者之间什么也没有。”

### 双内核实时

像 Xenomai 和 RTAI 这样的双内核方案部署了一个与单独的 Linux 内核并行运行的微内核，而像 RTL 这样的单内核方案使得 Linux 本身能够实时运行。Altenberg 说：“使用双内核，当优先级实时程序不在微内核上运行时，Linux 可以获得一些运行时间。 “问题是人们需要维护微内核并在新的硬件上支持它。这需要巨大的努力，并且它的开发社区不是很大。另外，由于 Linux 不直接在硬件上运行，所以你需要一个硬件抽象层（HAL）。有两件事要维护，你通常会落后主流内核一步。”

Altenberg说：“RTL 的挑战以及花了这么久才出现的原因是，要使 Linux 实时，你基本要修改每个内核文件。” 然而，大部分工作已经完成并合并到主线，开发人员并不需要维护一个微内核或 HAL。

Altenberg 继续解释了 RTAI 和 Xenomai 之间的差异。“使用 RTAI，你将编写一个由微内核调度的内核模块。这就像内核开发 - 真的很难深入，很难调试。”

RTAI 的开发可能会更加复杂，因为工业用户通常希望包括封闭的源代码以及 GPL 内核代码。 Altenberg 说：“你必须决定哪些部分可以进入用户态，哪些部分可以通过实时的方式进入内核。”

RTAI 与 RTL 想必支持更少的硬件平台，特别是 x86 之外。双内核 Xenomai 将 RTAI 作为主要的双内核方式，比 RTAI 具有更大的操作系统支持。更重要的是，Altenberg 说：“它提供了“在用户空间中进行实时的合适解决方案。要做到这一点，他们实现了皮肤的概念 - 一个用于不同 RTOS 的 API 的仿真层，比如 POSIX。这使你可以重用一些 RTOS 中的现有代码的子集。”

然而，使用 Xenomai，你仍然需要维护一个单独的微内核和 HAL。有限的开发工具是另一个问题。Altenberg说：“与 RTAI 一样，你不能使用标准的 C 库。你需要专门的工具和库。即使对于 POSIX 来说，你也必须链接到 POSIX 层，这更复杂。” 他补充说，任何一个平台，很难将超过 8 到 16 个 CPU 的微内核扩展到金融服务中使用的大型服务器集群。

### 睡眠自旋锁

主要的单内核解决方案是基于 PREEMPT.RT 的 RTL，它主要由 Thomas Gleixner 和 IngoMolnár 在十多年前开发。PREEMPT.RT 重新生成内核的 “spinlock” 锁定原语，以最大化 Linux 内核中的可抢占部分。（PREEMPT.RT 最初称为睡眠自旋锁补丁）

PREEMPT.RT 不是在硬中断环境中运行中断处理程序，而是在内核线程中运行它们。Altenberg 说：“当一个中断到达时，你不会运行中断处理程序代码。你只是唤醒相应的内核线程，它运行处理程序。这有两个优点：内核线程可以中断，并且它会显示在进程列表中，有自己的 PID。所以你可以把低优先级的放在不重要的中断上，高优先级的放在重要的用户态任务上。”

由于大约 80％ 的 PREEMPT.RT 已经在主线上，任何 Linux 开发人员都可以使用面向 PREEMPT.RT 的内核组件，如定时器、中断处理程序、跟踪基础架构和优先级继承。Altenberg说：“当他们制作实时 Linux 时，一切都变得可以抢占，所以我们发现了很多竞争条件和锁定问题。我们修复了这些，并把它们推送到主线，以提高 Linux 的稳定性。”

因为 RTL 主要在 Linux 主线上，Altenberg 说：“PREEMPT.RT 被广泛接受，拥有庞大的社区。如果你编写一个实时应用程序，你不需要知道很多关于 PREEMPT.RT 的知识。你不需要任何特殊的库或 API，只需要标准的 C 库、Linux 驱动程序和 POSIX 程序。”

你仍然需要运行一个补丁来使用 PREEMPT.RT，它每隔两个 Linux 版本更新一次。然而，在两年内，剩下的 20％ 的 PREEMPT.RT 应该会进入 Linux，所以你就“不再需要补丁”了。

最后，Altenberg 透露了他的 Xenomai 对 RTL 延迟测试的结果。Altenberg说：“有很多论文声称 Xenomai 和 RTAI 的延迟比 PREEMPT.RT 更小。但是我认为大部分时候是 PREEMPT.RT 配置不好的问题。所以我们带来了一个 Xenomai 专家和一个 PREEMPT.RT 专家，让他们配置自己的平台。”

Altenberg 称，虽然 Xenomai 在大多数测试中表现更好，并且有更少的性能抖动，但是差异不如一些 Xenomai 拥护者声称的高达 300% 至 400％ 的延迟优势。当用户空间任务执行测试时，Altenberg 说这是最现实的、最重要的是测试，最糟糕的情况下 Xenomai和 RTL/PREEMPT.RT 都是 90 到 95 微秒的反应时间。

当他们在双 Cortex-A9 系统中隔离单个 CPU 来处理中断时，Altenberg 表示这相当普遍，PREEMPT.RT 执行得更好，大约80微秒。（有关详细信息，请查看大约第 33 分钟的视频。）

Altenberg 承认与 OSADL 的两到三年测试相比，他的 12 小时测试是最低标准，而且它不是一个“数学证明”。无论如何，考虑到 RTL 更简单的开发流程，它都值得一试。他总结说：“在我看来，将完整功能的 Linux 系统与微内核进行比较是不公平的。”

--------------------------------------------------------------------------------

via: https://www.linux.com/news/event/open-source-summit-na/2017/2/inside-real-time-linux

作者：[ERIC BROWN][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/ericstephenbrown
[1]:https://www.linux.com/licenses/category/linux-foundation
[2]:https://www.linux.com/files/images/jan-altenberg-elcpng
[3]:https://www.linux.com/blog/intro-real-time-linux-embedded-developers
[4]:http://events.linuxfoundation.org/events/archive/2016/embedded-linux-conference-europe
[5]:https://linutronix.de/
[6]:http://archive.linuxgizmos.com/celebrating-the-open-source-automation-development-labs-first-birthday/
[7]:http://linuxgizmos.com/real-time-linux-shacks-up-with-the-linux-foundation/
[8]:https://www.linux.com/news/embedded-linux-keeps-growing-amid-iot-disruption-says-study
