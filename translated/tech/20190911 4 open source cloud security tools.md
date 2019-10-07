[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 open source cloud security tools)
[#]: via: (https://opensource.com/article/19/9/open-source-cloud-security)
[#]: author: (Alison NaylorAaron Rinehart https://opensource.com/users/asnaylorhttps://opensource.com/users/ansilvahttps://opensource.com/users/sethhttps://opensource.com/users/bretthunoldtcomhttps://opensource.com/users/aaronrineharthttps://opensource.com/users/marcobravo)

4 种开源云安全工具
====== 
查找并排除你存储在 AWS 和 GitHub 中的数据里的漏洞。
![Tools in a cloud][1]

如果你的日常工作是开发者、系统管理员、全栈工程师或者是网站可用性保障工程师，内容包括使用 Git 从 GitHub 上 pushes、commits 和 pulls，并部署到亚马逊 Web 服务上（AWS），安全性就是一个需要持续考虑的一个点。幸运的是，开源工具能帮助你的团队避免犯常见错误，这些常见错误会导致你的组织损失数千美元。

本文介绍了四种开源工具，当你在 GitHub 和 AWS 上进行开发时，这些工具能帮助你提升项目的安全性。同样的，本着开源的精神，我会与三位安全专家——Travis McPeak；网飞高级云安全工程师，Rich Monk，红帽首席高级信息安全分析师；以及 Alison Naylor，红帽首席信息安全分析师——共同为本文做出贡献。

我们已经按场景对每个工具都做了区分，但是他们并不是相互排斥的。

### 1\. 使用 gitrob 发现敏感数据

你需要在你们团队的 Git 仓库中发现 任何现在还存在的敏感信息，以便你能将其删除。使用红/蓝队模型并利用工具专注于攻击应用程序或者时操作系统，这样可能会更有意义，在这个模型中，一个信息安全团队会划分为两块，一个是攻击团队（又名红队），以及一个防守团队（又名蓝队）。有一个红队来尝试渗透你的系统和应用要远远好于等待一个黑客来实际攻击你。你的红队可能会尝试使用 Gitrob，该工具可以克隆和爬虫你的 Git 仓库，以此来寻找凭证和敏感信息。

即使像 Gitrob 这样的工具可以被用来造成破坏，但这里的目的是让你的信息安全团队使用它来发现无意间泄露的属于您的组织的敏感信息（比如 AWS 的密钥对或者是其他被失误提交上去的凭证）。这样，你可以修整你的仓库并清除敏感数据——希望能赶在黑客发现它们之前。记住不光要修改受影响的文件，还要删除它们的历史记录。

### 2\. 使用 git-secrets 来避免合并敏感数据

虽然在你的 Git 仓库里发现并移除敏感信息很重要，但在一开始就避免合并这些敏感信息岂不是更好？即使错误地提交了敏感信息，使用 git-secrets 从公开的困境保护你自己。这款工具可以帮助你设置钩子，以此来扫描你的提交、已提交的代码和合并的代码，寻找暴露在公共仓库里的敏感信息。注意你选择的模式要匹配你的团队使用的凭证，比如 AWS 访问密钥和秘密密钥。如果发现了一个匹配项，你的提交就会被拒绝，一个潜在的危机就此得到避免。

为你已有的仓库设置 git-secrets 是很简单的，而且你可以使用一个全局设置来保护所有你以后要创建或克隆的仓库。你同样可以在公开你的仓库之前，使用 git-secrets 来扫描它们（包括之前所有的历史版本）。

### 3\. 使用 Key Conjurer 创建临时凭证

有一点额外的保险来防止无意间公开了存储的敏感信息，这是很好的事，但我们还可以做得更好，就完全不存储任何凭证。追踪凭证，谁访问了它，存储到了哪里，上次被访问事什么时候——太麻烦了。然而，以编程的方式生成的临时凭证就可以避免大量的此类问题，从而巧妙地避开了在 Git 仓库里存储敏感信息这一问题。使用 Key Conjurer，它就是为解决这一需求而被创建出来的。有关更多 Riot Games 为什么创建 Key Conjurer，以及 Riot Games 如何开发的 Key Conjurer，请阅读 Key Conjurer：我们最低权限的策略。

### 4\. 使用 Repokid 自动化地提供最小权限

任何一个参加过安全 101 课程的人都知道，设置最小权限是基于角色的访问控制的最佳实现。难过的是，在学校之外手动运用最低权限策略会变得如此艰难。一个应用的访问需求会随着时间的流逝而变化，开发人员又太忙了没时间去手动调整它们的权限。Repokid 使用 AWS 提供提供的有关身份和访问管理（IAM）的数据来自动化地调整访问策略。Repokid 甚至可以在 AWS 中为超大型组织提供自动化地最小权限设置。

### 工具而已，又不是大招

这些工具并不是什么灵丹妙药，它们只是工具！所以，在尝试使用这些工具或其他的控件之前，请和你的组织里一起工作的其他人确保你们已经理解了你的云服务的使用情况和用法模式。

应该严肃对待你的云服务和代码仓库服务，并熟悉最佳实现的做法。下面的文章将帮助你做到这一点。

**对于 AWS:**

  * [管理 AWS 访问密钥的最佳实现][11]
  * [AWS 安全审计指南][12]



**对于 GitHub:**

  * [介绍一种新方法来让你的代码保持安全][13]
  * [GitHub 企业版最佳安全实现][14]



最后但并非最不重要的一点，和你的安全团队保持联系；他们应该可以为你团队的成功提供想法、建议和指南。永远记住：安全是每个人的责任，而不仅仅是他们的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/open-source-cloud-security

作者：[Alison NaylorAaron Rinehart][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/asnaylorhttps://opensource.com/users/ansilvahttps://opensource.com/users/sethhttps://opensource.com/users/bretthunoldtcomhttps://opensource.com/users/aaronrineharthttps://opensource.com/users/marcobravo
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/cloud_tools_hardware.png?itok=PGjJenqT (Tools in a cloud)
[2]: https://twitter.com/travismcpeak?lang=en
[3]: https://github.com/rmonk
[4]: https://www.linkedin.com/in/alperkins/
[5]: https://github.com/michenriksen/gitrob
[6]: https://help.github.com/en/articles/removing-sensitive-data-from-a-repository
[7]: https://github.com/awslabs/git-secrets
[8]: https://github.com/RiotGames/key-conjurer
[9]: https://technology.riotgames.com/news/key-conjurer-our-policy-least-privilege
[10]: https://github.com/Netflix/repokid
[11]: https://docs.aws.amazon.com/general/latest/gr/aws-access-keys-best-practices.html
[12]: https://docs.aws.amazon.com/general/latest/gr/aws-security-audit-guide.html
[13]: https://github.blog/2019-05-23-introducing-new-ways-to-keep-your-code-secure/
[14]: https://github.blog/2015-10-09-github-enterprise-security-best-practices/
