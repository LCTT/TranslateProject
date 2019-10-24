[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11498-1.html)
[#]: subject: (How DevOps professionals can become security champions)
[#]: via: (https://opensource.com/article/19/9/devops-security-champions)
[#]: author: (Jessica Repka https://opensource.com/users/jrepka)

DevOps 专业人员如何成为网络安全拥护者
======

> 打破信息孤岛，成为网络安全的拥护者，这对你、对你的职业、对你的公司都会有所帮助。

![](https://img.linux.net.cn/data/attachment/album/201910/24/202520u09xw2vm4w2jm0mx.jpg)

安全是 DevOps 中一个被误解了的部分，一些人认为它不在 DevOps 的范围内，而另一些人认为它太过重要（并且被忽视），建议改为使用 DevSecOps。无论你同意哪一方的观点，网络安全都会影响到我们每一个人，这是很明显的事实。

每年，[黑客行为的统计数据][3] 都会更加令人震惊。例如，每 39 秒就有一次黑客行为发生，这可能会导致你为公司写的记录、身份和专有项目被盗。你的安全团队可能需要花上几个月（也可能是永远找不到）才能发现这次黑客行为背后是谁，目的是什么，人在哪，什么时候黑进来的。

运维专家面对这些棘手问题应该如何是好？呐我说，现在是时候成为网络安全的拥护者，变为解决方案的一部分了。

### 孤岛势力范围的战争

在我和我本地的 IT 安全（ITSEC）团队一起肩并肩战斗的岁月里，我注意到了很多事情。一个很大的问题是，安全团队和 DevOps 之间关系紧张，这种情况非常普遍。这种紧张关系几乎都是来源于安全团队为了保护系统、防范漏洞所作出的努力（例如，设置访问控制或者禁用某些东西），这些努力会中断 DevOps 的工作并阻碍他们快速部署应用程序。

你也看到了，我也看到了，你在现场碰见的每一个人都有至少一个和它有关的故事。一小撮的怨恨最终烧毁了信任的桥梁，要么是花费一段时间修复，要么就是两个团体之间开始一场小型的地盘争夺战，这个结果会使 DevOps 实现起来更加艰难。

### 一种新观点

为了打破这些孤岛并结束势力战争，我在每个安全团队中都选了至少一个人来交谈，了解我们组织日常安全运营里的来龙去脉。我开始做这件事是出于好奇，但我持续做这件事是因为它总是能带给我一些有价值的、新的观点。例如，我了解到，对于每个因为失败的安全性而被停止的部署，安全团队都在疯狂地尝试修复 10 个他们看见的其他问题。他们反应的莽撞和尖锐是因为他们必须在有限的时间里修复这些问题，不然这些问题就会变成一个大问题。

考虑到发现、识别和撤销已完成操作所需的大量知识，或者指出 DevOps 团队正在做什么（没有背景信息）然后复制并测试它。所有的这些通常都要由人手配备非常不足的安全团队完成。

这就是你的安全团队的日常生活，并且你的 DevOps 团队看不到这些。ITSEC 的日常工作意味着超时加班和过度劳累，以确保公司，公司的团队，团队里工作的所有人能够安全地工作。

### 成为安全拥护者的方法

这些是你成为你的安全团队的拥护者之后可以帮到它们的。这意味着，对于你做的所有操作，你必须仔细、认真地查看所有能够让其他人登录的方式，以及他们能够从中获得什么。

帮助你的安全团队就是在帮助你自己。将工具添加到你的工作流程里，以此将你知道的要干的活和他们知道的要干的活结合到一起。从小事入手，例如阅读公共漏洞披露（CVE），并将扫描模块添加到你的 CI/CD 流程里。对于你写的所有代码，都会有一个开源扫描工具，添加小型开源工具（例如下面列出来的）在长远看来是可以让项目更好的。

**容器扫描工具：**

  * [Anchore Engine][5]
  * [Clair][6]
  * [Vuls][7]
  * [OpenSCAP][8]

**代码扫描工具：**

  * [OWASP SonarQube][9]
  * [Find Security Bugs][10]
  * [Google Hacking Diggity Project][11]

**Kubernetes 安全工具：**

  * [Project Calico][12]
  * [Kube-hunter][13]
  * [NeuVector][14]

### 保持你的 DevOps 态度

如果你的工作角色是和 DevOps 相关的，那么学习新技术和如何运用这项新技术创造新事物就是你工作的一部分。安全也是一样。我在 DevOps 安全方面保持到最新，下面是我的方法的列表。

  * 每周阅读一篇你工作的方向里和安全相关的文章.
  * 每周查看 [CVE][15] 官方网站，了解出现了什么新漏洞.
  * 尝试做一次黑客马拉松。一些公司每个月都要这样做一次；如果你觉得还不够、想了解更多，可以访问 Beginner Hack 1.0 网站。
  * 每年至少一次和那你的安全团队的成员一起参加安全会议，从他们的角度来看事情。

### 成为拥护者是为了变得更好

你应该成为你的安全的拥护者，下面是我们列出来的几个理由。首先是增长你的知识，帮助你的职业发展。第二是帮助其他的团队，培养新的关系，打破对你的组织有害的孤岛。在你的整个组织内建立由很多好处，包括设置沟通团队的典范，并鼓励人们一起工作。你同样能促进在整个组织中分享知识，并给每个人提供一个在安全方面更好的内部合作的新契机。

总的来说，成为一个网络安全的拥护者会让你成为你整个组织的拥护者。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/devops-security-champions

作者：[Jessica Repka][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jrepka
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/BUSINESS_3reasons.png?itok=k6F3-BqA (A lock on the side of a building)
[2]: https://opensource.com/article/19/1/what-devsecops
[3]: https://hostingtribunal.com/blog/hacking-statistics/
[4]: https://opensource.com/article/18/8/what-cicd
[5]: https://github.com/anchore/anchore-engine
[6]: https://github.com/coreos/clair
[7]: https://vuls.io/
[8]: https://www.open-scap.org/
[9]: https://github.com/OWASP/sonarqube
[10]: https://find-sec-bugs.github.io/
[11]: https://resources.bishopfox.com/resources/tools/google-hacking-diggity/
[12]: https://www.projectcalico.org/
[13]: https://github.com/aquasecurity/kube-hunter
[14]: https://github.com/neuvector/neuvector-helm
[15]: https://cve.mitre.org/
[16]: https://www.hackerearth.com/challenges/hackathon/beginner-hack-10/
