关于安全，开发人员需要知道的
======
> 开发人员不需要成为安全专家, 但他们确实需要摆脱将安全视为一些不幸障碍的心态。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/locks_keys_bridge_paris.png?itok=Bp0dsEc9)

DevOps 并不意味着每个人都需要成为开发和运维方面的专家。尤其在大型组织中，其中角色往往更加专业化。相反，DevOps 思想在某种程度上更多地是关注问题的分离。在某种程度上，运维团队可以为开发人员（无论是在本地云还是在公共云中）部署平台，并且不受影响，这对两个团队来说都是好消息。开发人员可以获得高效的开发环境和自助服务，运维人员可以专注于保持基础管道运行和维护平台。

这是一种约定。开发者期望从运维人员那里得到一个稳定和实用的平台，运维人员希望开发者能够自己处理与开发应用相关的大部分任务。

也就是说，DevOps 还涉及更好的沟通、合作和透明度。如果它不仅仅是一种介于开发和运维之间的新型壁垒，它的效果会更好。运维人员需要对开发者想要和需要的工具类型以及他们通过监视和日志记录来编写更好应用程序所需的可见性保持敏感。另一方面，开发人员需要了解如何才能更有效地使用底层基础设施，以及什么能够使运维在夜间（字面上）保持运行。

同样的原则也适用于更广泛的 DevSecOps，这个术语明确地提醒我们，安全需要嵌入到整个 DevOps 管道中，从获取内容到编写应用程序、构建应用程序、测试应用程序以及在生产环境中运行它们。开发人员（和运维人员）除了他们已有的角色不需要突然成为安全专家。但是，他们通常可以从对安全最佳实践（这可能不同于他们已经习惯的）的更高认识中获益，并从将安全视为一些不幸障碍的心态中转变出来。

以下是一些观察结果。

<ruby>开放式 Web 应用程序安全项目<rt>Open Web Application Security Project</rt></ruby>（[OWASP][1]）[Top 10 列表]提供了一个窗口，可以了解 Web 应用程序中的主要漏洞。列表中的许多条目对 Web 程序员来说都很熟悉。跨站脚本（XSS）和注入漏洞是最常见的。但令人震惊的是，2007 年列表中的许多漏洞仍在 2017 年的列表中（[PDF][3]）。无论是培训还是工具，都有问题，许多同样的编码漏洞一再出现。

新的平台技术加剧了这种情况。例如，虽然容器不一定要求应用程序以不同的方式编写，但是它们与新模式（例如[微服务][4]）相吻合，并且可以放大某些对于安全实践的影响。例如，我的同事 [Dan Walsh][5]（[@rhatdan][6]）写道：“计算机领域最大的误解是需要 root 权限来运行应用程序，问题是并不是所有开发者都认为他们需要 root，而是他们将这种假设构建到他们建设的服务中，即服务无法在非 root 情况下运行，而这降低了安全性。”

默认使用 root 访问是一个好的实践吗？并不是。但它可能（也许）是一个可以防御的应用程序和系统，否则就会被其它方法完全隔离。但是，由于所有东西都连接在一起，没有真正的边界，多用户工作负载，拥有许多不同级别访问权限的用户，更不用说更加危险的环境了，那么快捷方式的回旋余地就更小了。

[自动化][7]应该是 DevOps 不可分割的一部分。自动化需要覆盖整个过程中，包括安全和合规性测试。代码是从哪里来的？是否涉及第三方技术、产品或容器镜像？是否有已知的安全勘误表？是否有已知的常见代码缺陷？机密信息和个人身份信息是否被隔离？如何进行身份认证？谁被授权部署服务和应用程序？

你不是自己在写你的加密代码吧？

尽可能地自动化渗透测试。我提到过自动化没？它是使安全性持续的一个重要部分，而不是偶尔做一次的检查清单。

这听起来很难吗？可能有点。至少它是不同的。但是，一名 [DevOpsDays OpenSpaces][8] 伦敦论坛的参与者对我说：“这只是技术测试。它既不神奇也不神秘。”他接着说，将安全作为一种更广泛地了解整个软件生命周期的方法（这是一种不错的技能）来参与进来并不难。他还建议参加事件响应练习或[夺旗练习][9]。你会发现它们很有趣。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/4/what-developers-need-know-about-security

作者：[Gordon Haff][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[MjSeven](https://github.com/MjSeven)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/ghaff
[1]:https://www.owasp.org/index.php/Main_Page
[2]:https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project
[3]:https://www.owasp.org/images/7/72/OWASP_Top_10-2017_%28en%29.pdf.pdf
[4]:https://opensource.com/tags/microservices
[5]:https://opensource.com/users/rhatdan
[6]:https://twitter.com/rhatdan
[7]:https://opensource.com/tags/automation
[8]:https://www.devopsdays.org/open-space-format/
[9]:https://dev.to/_theycallmetoni/capture-the-flag-its-a-game-for-hacki-mean-security-professionals
[10]:https://agenda.summit.redhat.com/SessionDetail.aspx?id=154677
[11]:https://www.redhat.com/en/summit/2018
