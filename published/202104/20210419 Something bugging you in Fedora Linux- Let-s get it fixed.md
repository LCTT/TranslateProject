[#]: subject: (Something bugging you in Fedora Linux? Let’s get it fixed!)
[#]: via: (https://fedoramagazine.org/something-bugging-you-in-fedora-linux-lets-get-it-fixed/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13333-1.html)

Fedora Linux 中有 Bug 吗？一起来修复它！
======

![][1]

软件有 bug。任何复杂系统都无法保证每个部分都能按计划工作。Fedora Linux 是一个 _非常_ 复杂的系统，包含几千个包，这些包由全球无数个独立的上游项目创建。每周还有数百个更新。因此，问题是不可避免的。本文介绍了 bug 修复过程以及如何确定 bug 优先级。

### 发布开发过程

作为一个 Linux 发行项目，我们希望为用户提供完善的、一切正常的体验。我们的发布起始于 “Rawhide”。我们在 Rawhide 中集成了所有更新的自由及开源软件的新版本。我们一直在不断改进正在进行的测试和<ruby>持续集成<rt>Continuous Integration</rt></ruby>过程，为了让即使是 Rawhide 也能被冒险者安全使用。可是，从本质来讲，Rawhide 始终有点粗糙。

每年两次，我们把这个粗糙的操作系统先后分支到测试版本、最终版本。当我们这么做时，我们齐心协力地寻找问题。我们在<ruby>测试日<rt>Test Days</rt></ruby>检查特定的区域和功能。制作“<ruby>候选版本<rt>Candidate builds</rt></ruby>”，并根据我们的 [发布验证测试计划][2] 进行检测。然后我们进入<ruby>冻结状态<rt>freeze state</rt></ruby>，只有批准的更改可以并入候选版本。这就把候选版本从持续的开发隔离开来，持续的开发不断并入 Rawhide 中。所以，不会引入新的问题。

在发布过程中许多 bug 被粉碎去除，这些 bug 有大有小。当一切按计划进行时，我们为所有用户提供了按计划发布的崭新的 Fedora Linux 版本。（在过去几年里，我们已经可靠地重复这一动作——感谢每一个为之努力工作的人！）如果确实有问题，我们可以将其标记为<ruby>发布阻碍<rt>release blocker</rt></ruby>。这就意味着我们要等到修复后才能发布。发布阻碍通常代表重大问题，该表达一定会引发对 bug 的关注。

有时，我们遇到的一些问题是持续存在的。可能一些问题已经持续了一两个版本，或者我们还没有达成共识的解决方案。有些问题确实困扰着许多用户，但个别问题并没有达到阻碍发布的程度。我们可以将这些东西标记为<ruby>阻碍<rt>blocker</rt></ruby>。但这会像锤子一样砸下来。阻碍可能导致最终粉碎该 bug，但也可能导致破坏了周围。如果进度落后，所有其它的 bug 修复、改进以及人们一直在努力的功能，都不能到达用户手中。

### 按优先顺序排列 bug 流程

所以，我们有另一种方法来解决烦人的 bug。[按优先顺序排列 bug 流程][3]，与其他方式不同，可以标出导致大量用户不满意的问题。这里没有锤子，更像是聚光灯。与发布阻碍不同，按优先顺序排列 bug 流程没有一套严格定义的标准。每个 bug 都是根据影响范围和严重性来评估的。

一个由感兴趣的贡献者组成的团队帮助策划一个简短列表，上面罗列着需要注意的问题。然后，我们的工作是将问题匹配到能够解决它们的人。这有助于减轻发布过程中的压力，因为它没有给问题指定任何特定的截止时间。理想情况下，我们能在进入测试阶段之前就发现并解决问题。我们尽量保持列表简短，不会超过几个，这样才会真正有重点。这种做法有助于团队和个人解决问题，因为他们知道我们尊重他们捉襟见肘的时间与精力。

通过这个过程，Fedora 解决了几十个严重而恼人的问题，包括从键盘输入故障到 SELinux 错误，再到数千兆字节大小的旧包更新会逐渐填满你的磁盘。但是我们可以做得更多——我们实际上收到的提案没有达到我们的处理能力上限。因此，如果你知道有什么事情导致了长期挫折或影响了很多人，至今没有达成解决方案，请遵循 [按优先顺序排列 bug 流程][3]，提交给我们。

### 你可以帮助我们

邀请所有 Fedora 贡献者参与按优化顺序排列 bug 的流程。评估会议每两周在 IRC 上举办一次。欢迎任何人加入并帮助我们评估提名的 bug。会议时间和地点参见 [日历][4]。Fedora 项目经理在会议开始的前一天将议程发送到 [triage][5] 和 [devel][6] 邮件列表。

### 欢迎报告 bug

当你发现 bug 时，无论大小，我们很感激你能报告 bug。在很多情况下，解决 bug 最好的方式是交给创建该软件的项目。例如，假设渲染数据相机照片的 Darktable 摄影软件出了问题，最好把它带给 Darktable 摄影软件的开发人员。再举个例子，假设 GNOME 或 KDE 桌面环境或组成部分软件出了问题，将这些问题交给这些项目中通常会得到最好的结果。

然而， 如果这是一个特定的 Fedora 问题，比如我们的软件构建或配置或者它的集成方式的问题，请毫不犹豫地 [向我们提交 bug][7]。当你知道有一个问题是我们还没有解决的，也要提交给我们。

我知道这很复杂……最好有一个一站式的地方来处理所有 bug。但是请记住，Fedora 打包者大部分是志愿者，他们负责获取上游软件并将其配置到我们系统中。他们并不总是对他们正在使用的软件的代码有深入研究的专家。有疑问的时候，你可以随时提交一个 [Fedora bug][7]。Fedora 中负责相应软件包的人可以通过他们与上游软件项目的联系提供帮助。

请记住，当你发现一个已通过诊断但尚未得到良好修复的 bug 时，当你看到影响很多人的问题时，或者当有一个长期存在的问题没有得到关注时，请将其提名为高优先级 bug。我们会看以看能做些什么。

_附言：标题中的著名图片当然是来自哈佛大学马克 2 号计算机的日志，这里曾是格蕾丝·赫柏少将工作的地方。但是与这个故事的普遍看法相背，这并不是 “bug” 一词第一次用于表示系统问题——它在工程中已经很常见了，这就是为什么发现一个字面上的 “bug” 作为问题的原因是很有趣的。 #nowyouknow #jokeexplainer_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/something-bugging-you-in-fedora-linux-lets-get-it-fixed/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mattdm/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/04/bugging_you-816x345.jpg
[2]: https://fedoraproject.org/wiki/QA:Release_validation_test_plan
[3]: https://docs.fedoraproject.org/en-US/program_management/prioritized_bugs/
[4]: https://calendar.fedoraproject.org/base/
[5]: https://lists.fedoraproject.org/archives/list/triage%40lists.fedoraproject.org/
[6]: https://lists.fedoraproject.org/archives/list/devel%40lists.fedoraproject.org/
[7]: https://docs.fedoraproject.org/en-US/quick-docs/howto-file-a-bug/
