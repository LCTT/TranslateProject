[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12096-1.html)
[#]: subject: (IEEE Standards Association Launches an Open Source Collaboration Platform)
[#]: via: (https://itsfoss.com/ieee-open-source-collaboration-platform/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

IEEE 标准协会推出开源协作平台
======

> IEEE 标准协会宣布了一个基于 GitLab 的开源协作平台。

![](https://img.linux.net.cn/data/attachment/album/202004/10/222910vjpiqd6lqqm6riqp.jpg)

[IEEE][1] 是世界上最大的技术专业组织，致力于推动技术的发展。<ruby>IEEE 标准协会<rt>the IEEE Standards Association</rt></ruby>（IEEE SA）是 IEEE 内部的一个组织，负责制定全球各行业的标准。

IEEE 标准协会（SA）提出了一个开源协作平台，即 [IEEE SA Open][2]。

技术上来说，它是一个自托管的 GitLab 实例，结合了 [Mattermost][3]（一个 [Slack 的替代品][4]）和 [GitLab Pages][5]。[其官方博文][6]对此进一步解释道：

> 该平台使独立软件开发者、初创企业、业界、学术机构等能够在一个协作、安全、负责任的环境中创建、测试、管理和部署创新项目。

### 它有什么不同或有用的地方？

这个平台最主要的吸引力应该是 IEEE 的会员网络、技术专长和资源。

IEEE 主席 [Robert Fish][7]，也曾（在接受 Radio Kan 的采访时）简单地提到它有什么不同之处，以及为什么 IEEE 想要使用它。

> 如今，世界上大部分的基础设施都是由软件运行的，而这些软件需要符合通信网络、电网、农业等方面的标准。

这是有道理的 —— 如果我们想提高标准化技术，这在很大程度上取决于软件。所以，这听起来肯定是要对创新的开源项目进行标准化，让它们也能为潜在的资本机会做好准备。

IEEE 还澄清说：

> 随着软件在当今世界越来越普遍，道德规范、可靠性、透明度和民主治理成为必须具备的条件。IEEE 在赋予开源项目这些属性方面有着得天独厚的优势。

虽然听起来很好，但 IEEE 的开源平台究竟能提供什么？让我们一起来看看这个问题。

### IEEE SA Open 概览

![][8]

首先，它对所有人开放并且完全免费使用。你只需要创建一个 [IEEE 帐户][9]，然后[登录到这个开源平台][10]就可以开始。

除了与 IEEE 广泛的会员网络相关的好处之外，你还可以期望其开源社区经理或社区成员提供指导性支持。

![Ieee Gitlab][11]

该平台提供了标准和非标准项目的用例，你可以尝试一下。

因为选择将 GitLab 与 Mattermost 和 Pages 结合起来，你可以获得一些有用的功能，它们是：

  * 项目规划和管理功能
  * 源代码管理
  * 测试、代码质量和持续集成功能
  * Docker 容器注册库和 Kubernetes 集成
  * 应用程序的发布和交付功能
  * 集成了 Mattermost 聊天论坛的斜线命令（完全支持 Android 和 iPhone 应用程序）
  * 能够弥合标准制定和开源社区之间的差距，以便以更快的速度推进灵活和创造性的技术解决方案
  * 安全的开放空间，并有严格的行为准则。

### 小结

显然，有更多的平台来潜在地放大开源项目的曝光率是一件好事 —— 因此，IEEE 的举措听起来很有希望。

你对此有何看法？让我知道你的想法吧!

--------------------------------------------------------------------------------

via: https://itsfoss.com/ieee-open-source-collaboration-platform/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.ieee.org/about/index.html
[2]: https://standards.ieee.org/content/ieee-standards/en/initiatives/opensource/
[3]: https://mattermost.com/
[4]: https://itsfoss.com/open-source-slack-alternative/
[5]: https://docs.gitlab.com/ee/user/project/pages/
[6]: https://spectrum.ieee.org/the-institute/ieee-products-services/ieee-standards-association-launches-a-platform-for-open-source-collaboration
[7]: https://www.linkedin.com/in/robertsfish/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/ieee-opensource.jpg?ssl=1
[9]: https://www.ieee.org/profile/public/createwebaccount/showRegister.html
[10]: https://opensource.ieee.org/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/ieee-gitlab.jpg?ssl=1
