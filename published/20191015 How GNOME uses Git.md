[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11806-1.html)
[#]: subject: (How GNOME uses Git)
[#]: via: (https://opensource.com/article/19/10/how-gnome-uses-git)
[#]: author: (Molly de Blanc https://opensource.com/users/mollydb)

一个非技术人员对 GNOME 项目使用 GitLab 的感受
======

> 将 GNOME 项目集中在 GitLab 上的决定为整个社区（不只是开发人员）带来了好处。

![red panda][1]

“您的 GitLab 是什么？”这是我在 [GNOME 基金会][2]工作的第一天被问到的第一个问题之一，该基金会是支持 GNOME 项目（包括[桌面环境][3]、[GTK][4] 和 [GStreamer][5]）的非盈利组织。此人问的是我在 [GNOME 的 GitLab 实例][6]上的用户名。我在 GNOME 期间，经常有人要求我提供我的 GitLab。

我们使用 GitLab 进行几乎所有操作。通常情况下，我会收到一些<ruby>提案<rt>issue</rt></ruby>和参考错误报告，有时还需要修改文件。我不是以开发人员或系统管理员的身份进行此操作的。我参与了“参与度、包容性和多样性（I＆D）”团队。我为 GNOME 朋友们撰写新闻通讯，并采访该项目的贡献者。我为 GNOME 活动提供赞助。我不写代码，但我每天都使用 GitLab。

在过去的二十年中，GNOME 项目的管理采用了各种方式。该项目的不同部分使用不同的系统来跟踪代码更改、协作以及作为项目和社交空间共享信息。但是，该项目决定，它需要更加地一体化，这从构思到完成大约花费了一年的时间。

GNOME 希望切换到单个工具供整个社区使用的原因很多。外部项目与 GNOME 息息相关，并为它们提供更简单的与资源交互的方式对于项目至关重要，无论是支持社区还是发展生态系统。我们还希望更好地跟踪 GNOME 的指标，即贡献者的数量、贡献的类型和数量以及项目不同部分的开发进度。

当需要选择一种协作工具时，我们考虑了我们需要的东西。最重要的要求之一是它必须由 GNOME 社区托管。由第三方托管并不是一种选择，因此像 GitHub 和 Atlassian 这样的服务就不在考虑之中。而且，当然了，它必须是自由软件。很快，唯一真正的竞争者出现了，它就是 GitLab。我们希望确保进行贡献很容易。GitLab 具有诸如单点登录的功能，该功能允许人们使用 GitHub、Google、GitLab.com 和 GNOME 帐户登录。

我们认为 GitLab 是一条出路，我们开始从许多工具迁移到单个工具。GNOME 董事会成员 [Carlos Soriano][7] 领导这项改变。在 GitLab 和 GNOME 社区的大力支持下，我们于 2018 年 5 月完成了该过程。

人们非常希望迁移到 GitLab 有助于社区的发展，并使贡献更加容易。由于 GNOME 以前使用了许多不同的工具，包括 Bugzilla 和 CGit，因此很难定量地评估这次切换对贡献量的影响。但是，我们可以更清楚地跟踪一些统计数据，例如在 2018 年 6 月至 2018 年 11 月之间关闭了近 10,000 个提案，合并了 7,085 个合并请求。人们感到社区在发展壮大，越来越受欢迎，而且贡献实际上也更加容易。

人们因不同的原因而开始使用自由软件，重要的是，可以通过为需要软件的人提供更好的资源和更多的支持来公平竞争。Git 作为一种工具已被广泛使用，并且越来越多的人使用这些技能来参与到自由软件当中。自托管的 GitLab 提供了将 Git 的熟悉度与 GitLab 提供的功能丰富、用户友好的环境相结合的绝佳机会。

切换到 GitLab 已经一年多了，变化确实很明显。持续集成（CI）为开发带来了巨大的好处，并且已经完全集成到 GNOME 的几乎每个部分当中。不进行代码开发的团队也转而使用 GitLab 生态系统进行工作。无论是使用问题跟踪来管理分配的任务，还是使用版本控制来共享和管理资产，就连“参与度、包容性和多样性（I＆D）”这样的团队都已经使用了 GitLab。

一个社区，即使是一个正在开发的自由软件，也很难适应新技术或新工具。在类似 GNOME 的情况下，这尤其困难，该项目[最近已经 22 岁了] [8]。像 GNOME 这样经过了 20 多年建设的项目，太多的人和组织使用了太多的部件，但迁移工作之所以能实现，这要归功于 GNOME 社区的辛勤工作和 GitLab 的慷慨帮助。

在为使用 Git 进行版本控制的项目工作时，我发现很方便。这是一个令人感觉舒适和熟悉的系统，是一个在工作场所和爱好项目之间保持一致的工具。作为 GNOME 社区的新成员，能够参与并使用 GitLab 真是太好了。作为社区建设者，看到这样结果是令人鼓舞的：越来越多的相关项目加入并进入生态系统；新的贡献者和社区成员对该项目做出了首次贡献；以及增强了衡量我们正在做的工作以了解其成功和成功的能力。

如此多的做着完全不同的事情（例如他们正在从事的不同工作以及所使用的不同技能）的团队同意汇集在一个工具上（尤其是被认为是跨开源的标准工具），这一点很棒。作为 GNOME 的贡献者，我真的非常感谢我们使用了 GitLab。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/10/how-gnome-uses-git

作者：[Molly de Blanc][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/mollydb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/redpanda_firefox_pet_animal.jpg?itok=aSpKsyna (red panda)
[2]: https://www.gnome.org/foundation/
[3]: https://gnome.org/
[4]: https://www.gtk.org/
[5]: https://gstreamer.freedesktop.org/
[6]: https://gitlab.gnome.org/
[7]: https://twitter.com/csoriano1618?lang=en
[8]: https://opensource.com/article/19/8/poll-favorite-gnome-version
