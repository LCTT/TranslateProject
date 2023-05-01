[#]: collector: (lujun9972)
[#]: translator: (rsqrt2b)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15753-1.html)
[#]: subject: (What is an open source evangelist?)
[#]: via: (https://opensource.com/article/21/1/open-source-evangelist)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

什么是开源布道师？
======

> 了解如何成为产品用户和开发人员之间的桥梁。

![][0]

当人们得知我是位（专注于 [syslog-ng][2] 和 [sudo][3] 的）开源布道师的时候，他们经常问我为 Linux 世界中如此知名的软件“代言”是什么感觉。我的回答非常简短：非常棒！

我是整个研发环节的一部分，所以我不会觉得自己可有可无。当人们实践我教他们的东西，以及当我收集到的用户反馈影响产品开发的时候，我感觉我很有意义。

### 什么是布道师？

我将布道师定义为软件（或其他产品）的用户和开发人员之间的桥梁。布道师不仅仅将好消息分享给用户，还要从他们那里收集反馈。

布道师们有着各式各样的背景：有些人具有市场营销背景，对技术有着浓厚的兴趣；有些人是喜欢和用户交流的开发人员。我属于第三类——“资深用户”，即从用户视角对软件产品有深入了解的人。

我要和非常多的用户打交道。syslog-ng 的用户群体非常庞大，它可以用在大多数 Linux 发行版和 BSD 变体上。数以亿计的设备运行着 syslog-ng，其中包括 BMW i3 和 Kindle。大多数基于 BSD 的设备，譬如 FreeNAS，使用 syslog-ng 记录日志，而 Synology 和 QNAP 的基于 Linux 的<ruby>网络附属存储<rt>Network Attached Storage</rt></ruby>（NAS）也是如此。就算 syslog-ng 运行在太空的某处，我也不会感到惊讶。

大多数 Linux 和 Unix 用户使用 sudo，因为它几乎被安装在每一台 Linux 设备上。它的社区很大，有几千万人。人们经常问我是如何和那么多用户打交道的，但这并不困难。

### 我是如何成为一名布道师的

我成为布道师的旅程是一个跨越了近 20 年的进化过程。它始于许多年前，那时候我在大学教书。之后是和 POWER/PowerPC 的 Linux 用户、开发人员合作。最后，我在 [Balabit][4] 的工作中开始使用 syslog-ng，再后来我开始接触 sudo。

我在 Balabit 的第一份工作是帮助 Linux 发行版将它们的 syslog-ng 包升级到上游的最新版本。随着我越来越多地了解 syslog-ng 的细节，我开始帮助它的用户。一年后，我在匈牙利和国际会议上发表关于 syslog-ng 的演说。不久之后，我从用户那里收集到的反馈开始对产品开发产生影响。

八年后，也就是 2018 年，Balabit 被 [One Identity][5] 收购，sudo 的维护者 [Todd Miller][6] 成为了我的同事。在那之前我只是了解一些基本的 sudo 功能，但我变得对 sudo 更感兴趣，并开始了解它的高级功能。很快，我开始为 sudo 布道，从一名 syslog-ng 布道师进化为一个更广泛意义上的开源布道师。

### 技术布道的四大支柱

技术布道师做很多事情，大致可以分为四类：开发人员、支持人员、技术产品营销和产品经理。我将更详细地介绍这四个支柱。

#### 开发人员

我不是开发人员，但我做了很多开发人员的工作，例如为各式各样的 Linux 发行版和 FreeBSD 打包 syslog-ng，做很多测试，将 syslog-ng 集成到其他软件中，并在异构平台上测试。我做的开发者任务有助于社区，并帮助我更好地了解社区需求。

#### 支持人员

关注错误追踪器，在 Google Alerts 和 Twitter 上查看 syslog-ng 关键词，以及阅读邮件列表，都能让我更好地帮助我们的用户群体。通过帮助他人，我也能能更好地理解他们的问题所在。

#### 技术产品营销

我真的不喜欢“营销”这个词，但是写博客和在会议上演说 *确实是* 营销。作为一名前系统管理员，我了解我的听众，我们有共同的声音。除了我自己的 Twitter 账号 [@PCzanik][7] 之外，我还在 [@sngOSE][8] （syslog-ng 开源版）和 [@SudoProject][9] （sudo）账号下发帖。

Twitter 是个收集和分享技术新闻的绝佳平台。即使营销只是我工作的一个方面，它仍是我布道工作中最引人注目的部分：

  * **给内向者的社交场合生存技巧：** 当人们得知我是一个内向的人，而仍然从事了这份工作之后，就经常问我是如何做到的。发表演讲或在会议展位上工作一整天是很困难的：有太多的人、太多的噪音了。我在这里针对这种场合给出一些生存技巧：
    * 专注于结果。活动是从用户那里收集反馈的绝佳机会。等你演讲完，可以随地开始一场好的讨论，甚至在展台或走廊上。在活动中，用户会给出很多现实生活中的反馈，记住她们的意见会有很多帮助。
    * 知道活动何时结束。请记住在嘈杂的环境中只能待上一段时间，这对你会有很大的帮助。
    * 与你志同道合的人尽情交谈，他们和你一样害羞、和你一样有不安全感、和你有着相同的技术兴趣。
* **疫情期间的营销技巧：** 许多人问我 COVID-19 是如何影响我的工作的，因为我从 2020 年开始就不能出行。我刚从 [RSA 大会][10] 和 [南加州 Linux 博览会][11] 上回来，两天后航班就暂停了、边境也关闭了（LCTT 校注：本文原文发表于 2021 年）。即使现在也在开虚拟会议，我仍可以做有关 sudo 和 syslog-ng 的演说，但这样反馈就会减少，甚至没有反馈——没有让我和用户见面的走廊，也没有供演讲者讨论最新、最好的技术的晚宴。会议上注意力比以往更不集中，因为在家里工作总有各种各样的干扰因素。我看到了许多不同的方法试图解决这个问题，每一项都有其优缺点：
  * 全局聊天室适合举办小型活动。但当活动有超过几十个人时，它将会变成一连串的“大家好，我来自马萨诸塞州，波士顿” 或者类似的无用的消息，从而没有机会进行一些有意义的讨论。
  * 如果活动有多个<ruby>专题<rt>track</rt></ruby>，给每个专题讨论一个单独的聊天室是很有用的。演讲者和用户都可以从聊天中发布的问题和评论中学到很多东西。如果有一个主持人，这将成倍地有用。始终记得将讨论限制在主题上，并确保在问答环节中产生的问题传达到演讲者耳中。
  * <ruby>随机聊天<rt>chat roulette</rt></ruby>是个随机联系陌生人的好方法，并且能产生好的讨论。不过这种方法对于演讲者来说随机性太高了。
  * <ruby>针对性聊天<rt>Tracking chats</rt></ruby>很好，不过许多人不喜欢公开提问或分享经验。直接与演讲者聊天可以解决这个问题。

#### 产品经理

我不是产品经理，尽管有时候我希望自己收集到的反馈可以直接转化为功能，但我定期与开发者和产品经理分享用户反馈。在内部讨论中，我总是代表用户一方，而不是考虑开发者如何用用最简单的方法推进产品，或者如何产生最多收益。

### 为什么要布道广为人知、广泛使用的软件？

每个 Linux 用户都知道 sudo，他们中的许多人也知道 syslog-ng。那我们为什么要布道它们呢？这是因为许多人只知道这些程序的基础知识，这也是他们刚开始使用 Linux 时学到的。但这两款软件都不是简单的、几十年来处于维护模式的工具序，两者都是仍在持续开发中的有生命力的程序。

大多数人对 syslog-ng 的了解仅限于它收集日志消息并把消息存储在文本文件中。但 syslog-ng 还有许多 [其他功能][12]，包括解析消息、使用地理信息丰富消息、精确的消息路径（过滤）和把消息存储在数据库、Hadoop 或消息队列中。

sudo 通常被认为是管理员命令的前缀，但它可以做许多其他事情。sudo 可以记录在里面运行的会话，允许你检查用户通过 sudo 使用超级权限做了什么事情。你也可以使用插件扩展 sudo。从 [sudo 的 1.9 版本][13] 开始，你甚至可以用 Python 扩展 sudo，这使得扩展它变得容易得多。

### 总结

成为一名开源布道师是个非常有趣的工作，即使是在 COVID-19 时代，虽然确实增加了我的工作难度。如果你对于这个角色有其他问题，或者有关于技术布道师或者开发大使则如何帮助你的故事，请在评论里分享。

*（题图：MJ/sci-fi evangelist in high resolution, very detailed, 8k）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/open-source-evangelist

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[rsqrt2b](https://github.com/rsqrt2b)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/czanik
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/laptop-stickers-team-happy_0.png?itok=G2-GcSPp (Teamwork starts with communication )
[2]: https://www.syslog-ng.com/
[3]: https://www.sudo.ws/
[4]: https://en.wikipedia.org/wiki/Balabit
[5]: https://www.oneidentity.com/
[6]: https://www.linkedin.com/in/millert/
[7]: https://twitter.com/PCzanik
[8]: https://twitter.com/sngose
[9]: https://twitter.com/SudoProject
[10]: https://www.rsaconference.com/usa/us-2020
[11]: https://www.socallinuxexpo.org/scale/18x
[12]: https://www.syslog-ng.com/community/b/blog/posts/building-blocks-of-syslog-ng
[13]: https://opensource.com/article/20/10/sudo-19
[0]: https://img.linux.net.cn/data/attachment/album/202304/25/090825y2fss1oesohbslf2.jpg