[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11412-1.html)
[#]: subject: (Fedora and CentOS Stream)
[#]: via: (https://fedoramagazine.org/fedora-and-centos-stream/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)

Fedora 和 CentOS Stream
======

![][1]

*一封来自 Fedora 项目负责人办公室的信件：*

（LCTT 译注：背景介绍 —— 红帽宣布与 CentOS 同步构建一个 CentOS Stream 滚动构建版。我们知道 Fedora 是红帽企业版 Linux [RHEL] 的上游，经过 Fedora 验证的特性才会放入 RHEL；而 RHEL 发布后，其源代码开放出来形成了 CentOS。而新的 CentOS Stream 则位于 Fedora 和 RHEL 之间，会滚动添加新的实验特性、更新的软件包等。）

嗨，大家好！你可能已经看到有关 [CentOS 项目变更][3]的[公告][2]。（如果没有，请花一些时间阅读它，我等你看完回来！）现在你可能想知道：如果 CentOS 现在位于 RHEL 的上游，那么 Fedora 会发生什么？那不是 Fedora 在 Red Hat 生态系统中的角色吗？

首先，不用担心。整体有一些变化，但是一切都变得更好。

![][4]

如果你一直在关注 RHEL 领导者关于 Fedora、CentOS 和 RHEL 之间关系的会议讨论，那么你就听说过 “<ruby>[彭罗斯三角][5]<rt>Penrose Triangle</rt></ruby>”。形状就像 M. C. Escher 绘图中的形状：在现实生活中这是不可能的！

我们已经思考了一段时间，*也许*几何不可能实际上是最好的模型。

一方面，想象中的流向最终的贡献会流回 Fedora 并以“良性循环”增长，但这种流从来没有真正起作用过。 真可惜，因为有一个庞大而强大的 CentOS 社区，并且有很多伟大的人在为此工作，而且 Fedora 社区也有很多重叠之处。我们错失了。

但是，这个缺口并不是唯一的空隙：在该项目与产品之间并没有真正一致的流程。到目前为止，该过程如下：

1. 在上一版 RHEL 发布之后的某个时间，红帽突然会比以往更加关注 Fedora。
2. 几个月后，红帽将分拆出一个内部开发的 RHEL 新版本。
3. 几个月后，它便被带到了世界各地，成为所有包括 CentOS 在内的下游发行版的来源。
4. 这些源持续向下更新，有时这些更新包括 Fedora 中的修补程序，但没有明确的路径。

这里的每个步骤都有其问题：间歇性注意力、闭门开发、盲目下发以及几乎没有持续的透明度。但是现在红帽和 CentOS 项目正在解决此问题，这对 Fedora 也是个好消息。

**Fedora 仍将是 RHEL 的[第一个][6]上游**。这是每个 RHEL 的来源，也是 RHEL 9 的来源。但是在 RHEL 分支之后，*CentOS* 将成为上游，以继续进行那些 RHEL 版本的工作。我喜欢称其为“中游”，但营销人员却不这样称呼，因此将其称为 “CentOS Stream”。

我们（Fedora、CentOS 和红帽）仍需要解决各种技术细节，但是我们的想法是这些分支将存在于同一软件包源存储库中。（目前的计划是制作一个 “src.centos.org”，它具有与 [src.fedoraproject.org][7] 相同数据的并行视图）。这项更改使公众可以看到已经发布的 RHEL 上正在进行的工作，并为开发人员和红帽合作伙伴在该级别进行协作提供了场所。

[CentOS SIG][8]（虚拟化、存储、配置管理等特殊兴趣小组）将在 Fedora 分支旁边的共享空间中开展工作。这将使项目之间的协作和共享更加容易，我希望我们甚至能够合并一些类似的 SIG，以直接协同工作。在有用的情况下，可以将 Fedora 软件包中的修补程序挑选到 CentOS “中游”中，反之亦然。

最终，Fedora、CentOS 和 RHEL 属于同一大型项目家族。这种新的、更自然的流程为协作提供了可能性，这些协作被锁定在人为（和超维度！）障碍的后面。我们现在可以一起做，我感到非常兴奋！

*—— Matthew Miller, Fedora 项目负责人*

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/fedora-and-centos-stream/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/09/centos-stream-816x345.jpg
[2]: http://redhat.com/en/blog/transforming-development-experience-within-centos
[3]: https://wiki.centos.org/Manuals/ReleaseNotes/CentOSStream
[4]: https://lh3.googleusercontent.com/5XMDU29DYPsFKIVLCexK46n9DqWZEa0nTjAnJcouzww-RSAzNshGW3yIxXBSBsd6KfAyUAGpxX9y0Dsh1hj21ygcAn5a7h55LrneKROkxsipdXO2gq8cgoFqz582ojOh8NU9Ix0X
[5]: https://www.youtube.com/watch?v=1JmgOkEznjw
[6]: https://docs.fedoraproject.org/en-US/project/#_first
[7]: https://src.fedoraproject.org/
[8]: https://wiki.centos.org/SpecialInterestGroup
