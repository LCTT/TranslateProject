[#]: subject: (Something bugging you in Fedora Linux? Let’s get it fixed!)
[#]: via: (https://fedoramagazine.org/something-bugging-you-in-fedora-linux-lets-get-it-fixed/)
[#]: author: (Matthew Miller https://fedoramagazine.org/author/mattdm/)
[#]: collector: (lujun9972)
[#]: translator: (DCOLIVERSUN)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Fedora Linux 中有 Bug 吗？一起来修复它！
======

![][1]

软件有 bug。任何复杂系统都无法保证每个部分都能按计划工作。Fedora Linux是一个 _非常_ 复杂的系统，包含几千个包，这些包由全球无数独立上游项目创建。每周还有数百个更新。因此，问题是不可避免的。本文介绍了 bug 修复过程以及如何确定 bug 优先级。

### 发布开发过程

作为 Linux 发行项目，我们希望为用户提供完善的、一切正常的体验。我们的发布起始于 “Rawhide”。我们在 Rawhide 中集成了所有更新的免费、开源软件，这些软件都是新版本的。我们一直在不断改进正在进行的测试和<ruby>持续集成<rt>Continuous Integration</rt></ruby>过程，为了让 Rawhide 可以安全地用来做任何冒险行为。可是，从本质来讲，Rawhide 始终有点粗糙。

一年内我们两次把这个粗糙的操作系统先后分支到测试版本、最终版本。当我们这么做时，我们齐心协力地寻找问题。我们在<ruby>测试日<rt>Test Days</rt></ruby>检查特定的区域和功能。“Candidate builds” 是根据我们的[发布验证测试计划][2]进行检测的。然后我们进入<ruby>冻结状态<rt>freeze state</rt></ruby>，只有批准的更改可以并入候选版本。这就把候选版本从不断发展的版本中隔离开来，不断发展的版本并入 Rawhide 中。所以，不会引入新的问题。

在发布过程中许多 bug 被压缩，这些 bug 有大有小。当一切按计划进行时，我们为所有用户提供了按计划发布的崭新的 Fedora Linux版本。（在过去几年里，我们已经可靠地重复这一动作——感谢每个人的努力，我们做到了！）如果确实有问题，我们可以将其标记为<ruby>发布阻碍<rt>release blocker</rt></ruby>。这就意味着我们要等到修复后才能发布。发布阻碍通常代表重大问题，该表达一定会引发对 bug 的关注。

有时，我们遇到的问题是持续存在的。可能是一两个版本正在发布的内容，或者是我们没有达成共识的解决方案。有些问题确实困扰着许多用户，但个别问题并没有达到阻碍发布的程度。我们可以将这些东西标记为<ruby>阻碍<rt>blocker</rt></ruby>。但这会像锤子一样砸下来。阻碍可能导致最终破坏该 bug ，但也可能导致周围的破坏。如果进度落后，用户不会对其他所有 bug 修复、改进感兴趣的，更不会对一直开发的特性感兴趣。

### 按优先顺序排列 bug 流程

所以，我们有另一种方法来解决烦人的 bug。[按优先顺序排列 bug 流程][3]与其他方式不同，可以标出导致大量用户不满意的问题。这里没有锤子，更像是聚光灯。与发布阻碍不同，按优先顺序排列 bug 流程没有一套严格定义的标准。每个 bug 都是根据影响范围和严重性来评估的。

一组有兴趣的贡献者帮助策划一个简短列表，上面罗列着需要注意的问题。然后，我们的工作是将问题匹配到能够解决它们的人。这有助于减轻发布过程中的压力，因为它没有给问题指定任何特定的截止时间。理论上，我们甚至在进入测试阶段之前就发现并解决问题。我们尽量保持列表简短，不会超过几个，这样才会真正有重点。这种做法有助于团队和个人解决问题，因为他们知道我们尊重他们捉襟见肘的时间与精力。

通过这个过程，Fedora 解决了几十个严重而恼人的问题，包括从键盘输入故障到 SELinux 错误，再到千兆字节大小的旧包更新会逐渐填满你的磁盘。但是我们可以做得更多——我们实际上没有收到处理能力上限数量的提案。因此，如果你知道有什么事情导致了长期挫折或影响了很多人，至今没有达成解决方案，遵循[按优先顺序排列 bug 流程][3]，提交给我们。

### **你可以帮助**

邀请所有 Fedora 贡献者参与按优化顺序排列 bug 流程。每两周评估会议在 IRC 上举办。欢迎任何人加入并帮助我们评估指定的 bug。请参阅[日历][4]了解会议时间和地点。Fedora 程序管理器在会议开始的前一天将议程发送到[分类][5]和[开发][6]邮件列表。

### 欢迎报告 bug

当你发现 bug 时，无论大小，我们很感激你能报告 bug。在很多情况下，解决 bug 最好的方式是回到创建该软件的项目中。例如，假设渲染数据相机照片的暗室摄影软件出了问题，最好把它带给暗室摄影软件的开发人员。再举个例子，假设 GNOME 或 KDE 桌面环境或组成部分软件出了问题，将这些问题带到这些项目中通常会得到最好的结果。

然而， 如果这是一个特定的 Fedora 问题，比如我们的软件构建或配置或者它集成的问题，毫不犹豫地[向我们提交 bug][7]。当你知道我们还没有解决的问题时，也要提交给我们。

我知道这很复杂... 最好有一个一站式的地方来处理所有 bug。但是请记住，Fedora 包装者大部分是志愿者，他们负责获取上游软件并将其配置到我们系统中。即便是对我们正在使用的软件，他们也不总是最了解代码的专家。有疑问的时候，你可以随时提交一个 [Fedora bug][7]。Fedora 中负责相应包的人员可以协助把它们连接到上游软件项目中。

请记住，当你发现一个已通过但尚未得到良好修复的 bug 时，当你看到影响很多人的问题时，或者当有一个长期存在的问题没有得到关注时，请将其指定为高优先级 bug。我们来看看能做些什么！

_附言：标题中的著名图片当然是来自哈佛大学马克 2 号计算机的日志，这里曾是格蕾丝·赫柏少将工作的地方。但是与这个故事的普遍看法相背，这并不是 “bug” 一词第一次用于系统问题——它在工程中已经很常见了，发现字面上的 bug 代表问题原因这一现象是很有趣的，这就是原因。 #nowyouknow #jokeexplainer_

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/something-bugging-you-in-fedora-linux-lets-get-it-fixed/

作者：[Matthew Miller][a]
选题：[lujun9972][b]
译者：[DCOLIVERSUN](https://github.com/DCOLIVERSUN)
校对：[校对者ID](https://github.com/校对者ID)

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
