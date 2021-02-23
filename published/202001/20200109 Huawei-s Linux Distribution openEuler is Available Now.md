[#]: collector: (lujun9972)
[#]: translator: (qianmingtian)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11787-1.html)
[#]: subject: (Huawei’s Linux Distribution openEuler is Available Now!)
[#]: via: (https://itsfoss.com/openeuler/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

外媒：华为的 Linux 发行版 openEuler 可以使用了！
======

> 华为提供了一个基于 CentOS 的企业级 Linux 发行版 EulerOS。最近，华为发布了一个名为 [openEuler][1] 的 EulerOS 社区版。

openEuler 的源代码也一同发布了。你在微软旗下的 GitHub 上找不到它——源代码可以在 [Gitee][2] 找到，这是一个中文的 [GitHub 的替代品][3]。

它有两个独立的存储库，一个用于存储[源代码][2]；另一个作为[软件包的源代码][4]，存储有助于构建该操作系统的软件包。

![][5]

openEuler 基础架构团队分享了他们使源代码可用的经验：              

> 我们现在很兴奋。很难想象我们会管理成千上万的仓库。为了确保它们能被成功地编译，我们要感谢所有参与贡献的人。

### openEuler 是基于 CentOS 的 Linux 发行版

与 EulerOS 一样，openEuler OS 也是基于 [CentOS][6]，但华为技术有限公司为企业应用进一步开发了该操作系统。

它是为 ARM64 架构的服务器量身定做的，同时华为声称已经做了一些改变来提高其性能。你可以在[华为开发博客][7]上了解更多。

![][8]

目前，根据 openEuler 的官方声明，有 50 多名贡献者为 openEuler 贡献了近 600 个提交。

贡献者们使源代码对社区可用成为可能。

值得注意的是，存储库还包括两个与之相关的新项目（或子项目），[iSulad][9] 和 A-Tune。

A-Tune 是一个基于 AI 的操作系统调优软件，iSulad 是一个轻量级的容器运行时守护进程，如在 [Gitee][2] 中提到的那样，它是为物联网和云基础设施设计的。

另外，官方的[公告][10]提到，这些系统是在华为云上通过脚本自动构建的。这确实十分有趣。

### 下载 openEuler

![][11]

到目前为止，你找不到它的英文文档，所以你必须等待或选择通过（贡献）[文档][12]来帮助他们。

你可以直接从它的[官方网站][13]下载 ISO 来测试它:

- [下载 openEuler ][13]

### 你认为华为的 openEuler 怎么样?

据 cnTechPost 报道，华为曾宣布 EulerOS 将以新名字 openEuler 成为开源软件。

目前还不清楚 openEuler 是否会取代 EulerOS ，或者两者会像 CentOS（社区版）和 Red Hat（商业版）一样同时存在。

我还没有测试过它，所以我不能说 openEuler 是否适合英文用户。

你愿意试一试吗？如果你已经尝试过了，欢迎在下面的评论中告诉我你的体验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/openeuler/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[qianmingtian][c]
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[c]: (https://github.com/qianmingtian)
[1]: https://openeuler.org/en/
[2]: https://gitee.com/openeuler
[3]: https://itsfoss.com/github-alternatives/
[4]: https://gitee.com/src-openeuler
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/openEuler-website.jpg?ssl=1
[6]: https://www.centos.org/
[7]: https://developer.huaweicloud.com/en-us/euleros/euleros-introduction.html
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/openeuler-gitee.jpg?ssl=1
[9]: https://gitee.com/openeuler/iSulad
[10]: https://openeuler.org/en/news/20200101.html
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/openEuler.jpg?ssl=1
[12]: https://gitee.com/openeuler/docs
[13]: https://openeuler.org/en/download.html
