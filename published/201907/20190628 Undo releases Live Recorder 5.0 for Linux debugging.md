[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11073-1.html)
[#]: subject: (Undo releases Live Recorder 5.0 for Linux debugging)
[#]: via: (https://www.networkworld.com/article/3405584/undo-releases-live-recorder-5-0-for-linux-debugging.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Undo 发布用于 Linux 调试的 Live Recorder 5.0
======
> 随着 Undo 发布 Live Recorder 5.0，这使得在多进程系统上的调试变得更加轻松。

![](https://img.linux.net.cn/data/attachment/album/201907/08/133450i18fp2p011bs5pu6.jpg)

随着 Undo 发布 Live Recorder 5.0，Linux 调试迈出了一大步。该产品于上个月发布，这使得在多进程系统上的调试变得更加轻松。它基于<ruby>飞行记录仪技术<rt>flight recorder technology</rt></ruby>，它更加深入进程之中，以深入了解每个进程的情况。这包括内存、线程、程序流，服务调用等。为了实现这一目标，Live Recorder 5.0 的记录、重放和调试功能都得到了增强，能够：

  * 记录进程更改共享内存变量的确切顺序。甚至可以针对特定变量并在任何进程中跳转到最后修改该变量的一行。
  * 通过随机化线程执行来暴露潜在缺陷，以帮助揭示竞态、崩溃和其他多线程缺陷。
  * 记录并重放单个 Kubernetes 和 Docker 容器的执行，以帮助在微服务环境中更快地解决缺陷。

Undo Live Recorder 使工程团队能够记录和重放任何软件程序的执行，而无论软件多么复杂。并且可以诊断和修复测试或生产中问题的根本原因。

根据你的许可证，Live Recorder 可以在命令行中使用 `live-record` 命令，但有点类似于 `strace`，但它不会打印系统调用和信号，而是创建一个“Undo 录制”。然后你可以调试录制中捕获的失败（远比分析核心转储高效！）。这些录制也可以与其他工作人员共享，并可以使用可逆调试器进行重放，以进一步调查崩溃原因或其他问题。

Undo 引擎支持以下 Linux 发行版：

  * Red Hat Enterprise Linux 6.8、6.9、6.10、7.4、7.5、7.6 和 8.0
  * Fedora 28、29 和 30
  * SuSE Linux Enterprise Server 12.3、12.4 和 15
  * Ubuntu 16.04 LTS、18.04 LTS、18.10 和 19.04

Undo 是一家快速发展的，有风险投资支持的技术初创公司，它的总部位于旧金山和英国剑桥。他们称 Live Recorder 可以 100％ 确定导致任何软件故障的因素 —— 即使在最复杂的软件环境中也是如此。

在 [Facebook][2] 和 [LinkedIn][3] 上加入 Network World 社区，评论你想说的话题。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3405584/undo-releases-live-recorder-5-0-for-linux-debugging.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/06/flight_data_recorder-100800552-large.jpg
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
