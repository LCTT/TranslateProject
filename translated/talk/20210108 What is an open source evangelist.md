[#]: collector: (lujun9972)
[#]: translator: (rsqrt2b)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is an open source evangelist?)
[#]: via: (https://opensource.com/article/21/1/open-source-evangelist)
[#]: author: (Peter Czanik https://opensource.com/users/czanik)

什么是开源传教士？
======
了解如何成为产品用户和开发人员之间的桥梁。
![Teamwork starts with communication][1]

当人们得知我是个开源传教士（专注于 [syslog-ng][2] 和 [sudo][3]）的时候，他们经常问我在 Linux 世界如此知名是什么感觉。我的回答非常简短：这很棒！

我不会感到无聊，因为我是研发的一部分。当人们实践我教他们的东西以及我收集到的用户反馈影响产品开发的时候，我感觉我起了作用。

### 什么是传教士？

我将传教士定义为一座桥梁——软件（或其他产品）用户和开发人员之间的桥梁。传教士不仅仅将好消息分享给用户，还要从他们那里收集反馈。

传教士们有着各式各样的背景：有的具有市场营销背景，对技术有着浓厚的兴趣；有的是喜欢和用户交流的开发人员。我属于第三类——“高级用户”，或者说从用户视角对软件产品有深入了解的人。

我和很多很多用户一起工作。syslog-ng 的用户群体非常庞大，它适用于大多数 Linux 发行版和 BSD 变体。数以亿计的设备运行着 syslog-ng，其中包括 BMW i3 和 Kindle。大多数基于 BSD 的设备，譬如 FreeNAS，使用 syslog-ng 记录日志 就像基于 Linux 的<ruby>网络附属存储<rt>Network Attached Storage</rt></ruby>（NAS）使用 Synology 和 QNAP 一样。就算 syslog-ng 运行在太空的某处，我也不会感到惊讶。


大多数 Linux 和 Unix 用户使用 sudo，因为它几乎被安装在每一台 Linux 设备上。社区很大，有几千万人。人们经常问我是如何处理那么多用户的，但这并不困难。

### 我是如何成为一名传教士的

我成为传教士的旅程是一个跨越近20年的进化过程。它始于许多年前，我在大学教书的时候。我的下一步是和 POWER/PowerPC 的 Linux 用户、开发人员合作。最后，我开始在 [Balabit][4] 的工作中使用 syslog-ng，再后来我开始在 sudo 方面工作。


我在 Balabit 的第一份工作是帮助 Linux 发行版将它们的 syslog-ng 包升级到上游的最新版本。随着我越来越多地了解 syslog-ng 的细节，我被要求帮助它的用户。一年后，我在匈牙利和国际会议上发表关于 syslog-ng 的演说。不久之后，我从用户那里收集到的数据开始对产品开发产生影响。

八年后，也就是2018年，Balabit 被 [One Identity][5] 收购，sudo 的维护者 [Todd Miller][6] 成为了我的同事。在那之前我只是了解一些基本的 sudo 功能，但我变得对 sudo 更感兴趣并开始了解它的高级功能。很快，我开始传教 sudo，从一名 syslog-ng 传教士进化为一个更一般的开源传教士。

### 技术传教的四大支柱

技术传教士做很多事情，大致可以分为四类：开发人员、支持人员、技术产品营销和产品经理

#### 开发人员

我不是开发人员，但我做很多开发人员的工作，例如为各式各样的 Linux 发行版和 FreeBSD 打包 syslog-ng，做很多测试，将 syslog-ng 集成到其他软件中并在外国平台上测试。我做的开发人员的工作帮助社区和我自己更好地了解其需求。

#### 支持人员

关注 bug 追踪器，在 Google Alerts 和 Twitter 上查看 syslog-ng 关键词以及阅读邮件列表都能让我更好地帮助我们的用户群体。同我帮助他人，我也能能更好地理解他们的问题所在。

#### 技术产品营销

我真的不喜欢“营销”这个词，但是写博客和在会议上演说 *确实是* 营销。作为一名前系统管理员，我了解我的听众，我们有共同的声音。除了我自己的 Twitter <ruby>句柄<rt>handle</rt></ruby>（LCTT译者注：可以理解为 Twitter 账号唯一的、不重复的标识符 ），[@PCzanik][7]，我还在 [@sngOSE][8] （syslog-ng 开源版）和 [@SudoProject][9] （sudo）句柄下发帖。

Twitter 是个收集和分享技术新闻的绝佳平台。即使营销只是我工作的一个方面，它仍是我传教工作中最明显的部分。

  * **给内向者的社交场合生存小贴士：** 当人们了解到即使我是一个内向的人，我仍然从事了这份工作之后，就经常问我是如何做到的。在小会议室成天演讲或工作非常困难：人太多、噪音太多了。我在这里针对这种场合给出一些生存贴士：
    * 专注于结果。社交场合是从用户那里收集反馈的绝佳机会。等你演讲完，可以随地开始一场好的讨论，甚至在小隔间里或走廊上。用户在现实生活的社交场合里会给出很多反馈，牢记它们的评论会有很多帮助。
    * 当会议结束的时候，请牢记，在嘈杂的环境中只要再待上一个多小时将很有帮助。
    * 尽情享受和与你志同道合的人交谈，他们和你一样害羞、和你一样有不安全感、和你有着相同的技术兴趣。
* **疫情期间的营销技巧：** 许多人问我 COVID-19 是如何影响我的工作的，因为我从 2020 年开始就不能出行。我刚从 [RSA 大会][10] 和 [南加利福尼亚州 Linux 博览会][11] 上回来，两天后航班就暂停了、边境也关闭了。即使现在也在开虚拟会议，我仍可以做有关 sudo 和 syslog-ng 的演说，但这样反馈就会减少，甚至没有反馈——没有走廊让我和用户见面，也没有晚餐供演讲者讨论最新、最好的技术。会议上注意力比以往更不集中，因为在家里工作总有各种各样的干扰因素。我看到了许多不同的方法试图解决这个问题，每一项都有其优缺点：
  * 全球聊天室适合举办小型活动。但当会议有超过几十个人时，它将会变成一连串的“大家好，我来自马萨诸塞州，波士顿” 或者类似的无用的消息，从而没有机会进行一些有意义的讨论。
  * 如果活动是多轨并行的，给每个专题讨论一个轨道是很有用的。演讲者和用户都可以从聊天中发布的问题和评论中学到很多东西。如果有一个主持人，这将成倍地有用。始终记得将讨论限制在主题上，并确保在问答环节中产生的问题传达到演讲者耳中。
  * 随机抽取聊天者是个随机联系陌生人的好方法，并且能产生好的讨论。不过这种方法对于演讲者来说随机性太高了。
  * 追踪聊天很好，不过许多人不喜欢公开提问或分享经验。直接与演讲者聊天可以解决这个问题。

#### 产品经理


我不是产品经理，尽管有时候我希望自己收集到的反馈可以直接转化为功能，但我定期与开发者和产品经理分享用户反馈。在内部讨论中，我总是代表用户一方，而不是考虑开发者如何用用最简单的方法推进产品，或者如何产生最多收益。

### 为什么要传教广为人知、被广泛使用的软件？

每个 Linux 用户都知道 sudo，他们中的许多人也知道 syslog-ng。那我们为什么要传教呢？这是因为许多人只知道这些程序的基础知识，这也是他们刚开始使用 Linux 时学到的。但这两款软件都不是简单的、几十年来处于维护模式的实用程序，两者都是仍在持续开发中的有生命力的程序。

大多数人对 syslog-ng 的了解仅限于它收集日志消息并把消息存储在文本文件中。但 syslog-ng 还有许多 [其他功能][12]，包括解析消息、使用地理信息丰富消息、精确的消息路径（过滤）和把消息存储在数据库、Hadoop 或消息队列中。


sudo  通常被认为是管理员命令的前缀，但它可以做许多其他事情。sudo 可以记录在里面运行的会话，允许你检查用户通过 sudo 使用超级权限做了什么事情。你也可以使用插件扩展 sudo。从 [sudo 的 1.9 版本][13] 开始，你甚至可以用 Python 扩展 sudo，这让过程变得容易得多。

### 结论

即使在 COVID-19 时代，成为一名开源传教士也是个非常有趣的工作，这确实增加了我的工作难度。如果你对于这个角色有其他问题或者有关于技术传教士或者开发倡导则如何帮助你的故事，请在评论里分享。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/1/open-source-evangelist

作者：[Peter Czanik][a]
选题：[lujun9972][b]
译者：[rsqrt2b](https://github.com/rsqrt2b)
校对：[校对者ID](https://github.com/校对者ID)

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
