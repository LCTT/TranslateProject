[#]: collector: (lujun9972)
[#]: translator: (windgeek)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12449-1.html)
[#]: subject: (What's the difference between DevSecOps and agile software development)
[#]: via: (https://opensource.com/article/20/7/devsecops-vs-agile)
[#]: author: (Sam Bocetta https://opensource.com/users/sambocetta)

DevSecOps 和敏捷软件开发有什么不同？
======

> 你更专注于安全性还是软件交付，还是可以两者兼得？

![](https://img.linux.net.cn/data/attachment/album/202007/24/225337mb44xoe2byvz4x4o.jpg)

技术社区中存在一种趋势，经常互换地使用 DevSecOps 和敏捷软件开发这两个术语。尽管它们有一些相似性，例如都旨在更早地检测风险，但在改变团队的[工作方式层面有很大不同][2]。

DevSecOps 建立在敏捷开发建立的一些原则上。但是，DevSecOps 特别专注于[集成安全功能][3]，而敏捷开发则专注于交付软件。

知道如何保护你们的网站或应用程序免受勒索程序和其他威胁的侵害，实际上取决于你使用的软件和系统开发。这可能会影响你选择使用 DevSecOps、敏捷软件开发还是两者兼而有之。

### DevSecOps 和敏捷软件开发的不同之处

两者的主要区别可以归结为一个简单的概念：安全性。这取决于你的软件开发实践，你们公司的安全措施 —— 以及何时、何地以及由谁实施，都可能会有很大不同。

每个企业都[需要 IT 安全][4]来保护其重要数据。如果企业真正重视 IT 安全，一般都会采取虚拟专用网（VPN）、数字证书、防火墙保护、多因子身份验证、安全的云存储，包括向员工介绍基本的网络安全措施。

当你信任 DevSecOps 时，你就会把公司的安全问题，本质上使其等同于持续集成和交付。 DevSecOps 方法论在开发之初就强调安全性，并使其成为整体软件质量不可或缺的组成部分。

基于 DevSecOps 安全性的三大原则：

  * 平衡用户访问难易程度及数据安全性
  * 使用 VPN 和 SSL [加密数据][5]可防止数据在传输过程中受到入侵者的攻击
  * 使用可以扫描新代码的安全漏洞并能通知开发人员该漏洞的工具来预测防范未来的风险

尽管 DevOps 一直打算包含安全性，但并非每个实践 DevOps 的组织都牢记这一点。DevSecOps 在 DevOps 的演进形式中，可以提供更加清晰的信息。尽管它们的名称相似，但这两个[不应混淆] [6]。在 DevSecOps 模型中，安全性是团队的主要驱动力。

同时，敏捷开发更专注于迭代开发周期，这意味着反馈意见会不断融入到持续的软件开发中。[敏捷的关键原则][7]是拥抱不断变化的环境，为客户和使用者提供竞争优势，让开发人员和利益相关者紧密合作，并在整个过程中始终保持关注技术卓越，以提升效率。换句话说，除非敏捷团队在其定义中包括安全性，否则安全性在敏捷软件开发中算是事后思考。

### 国防机构面临的挑战

如果要说专门致力于最大程度地提高安全性的组织，美国国防部（DoD）就是其中之一。在 2018 年，美国国防部发布了针对软件开发中的“假敏捷”或“以敏捷为名”的[指南][8]。该指南旨在警告美国国防部高管注意不良编程的问题，并说明如何发现它以避免风险。

使用这些方法不仅可以使美国国防部受益。医疗保健和金融部门也[保存着][9]必须保证安全的大量敏感数据。

美国国防部通过其现代化战略（包括采用 DevSecOps）来改变防范形式至关重要。尤其在这个连美国国防部容易受到黑客攻击和数据泄露的时代，这一点在 2020 年 2 月的[大规模数据泄露][10]中已经得到了证明。

将网络安全最佳实践转化为现实生活中的开发仍然还存在固有的风险。事情不可能 100％ 完美地进行。最好的状况是稍微有点不舒服，最坏的情况下，它们可能会带来全新的风险。

开发人员，尤其是那些为军用软件编写代码的开发人员，可能对[所有应该采用 DevSecOps 的情境][11]没有透彻的了解。学习曲线会很陡峭，但是为了获得更大的安全性，必须承受这些必不可少的痛苦。

### 自动化时代的新模式

为了解决对先前安全措施日益增长的担忧，美国国防部承包商已开始评估 DevSecOps 模型。关键是将该方法论部署到持续的服务交付环境中。

应对这个问题，出现了三个方向。第一种涉及到自动化，自动化已在大多数隐私和安全工具中[广泛使用][12]，包括 VPN 和增强隐私的移动操作系统。大型云基础架构中的自动化无需依赖于人为的检查和平衡，可以自动处理持续的维护和进行安全评估。

第二种专注于对于过渡到 DevSecOps 很重要的安全检查点。而传统上，系统设计初期对于数据在各个组件之间移动时依旧可以访问是不做期望的。

第三种也是最后一种涉及将企业方式用于军用软件开发。国防部的许多承包商和雇员来自商业领域，而不是军事领域。他们的背景为他们提供了为大型企业[提供网络安全][13]的知识和经验，他们可以将其带入政府部门职位中。

### 值得克服的挑战

转向基于 DevSecOps 的方法论也提出了一些挑战。在过去的十年中，许多组织已经完全重新设计了其开发生命周期，以适应敏捷开发实践，在不久之后进行再次转换看起来令人生畏。

企业应该安下心来，因为即使美国国防部也遇到了这种过渡带来的麻烦，他们在应对推出新流程使得商业技术和工具广泛可用的挑战上并不孤独。

展望一下未来，其实切换到 DevSecOps 不会比切换到敏捷软件开发更痛苦。而且通过将[创建安全性的价值][4]添加到开发工作流程中，以及利用现有敏捷开发的优势，企业可以获得很多收益。

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/7/devsecops-vs-agile

作者：[Sam Bocetta][a]
选题：[lujun9972][b]
译者：[windgeek](https://github.com/windgeek)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sambocetta
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/devops_confusion_wall_questions.png?itok=zLS7K2JG (Brick wall between two people, a developer and an operations manager)
[2]: https://tech.gsa.gov/guides/understanding_differences_agile_devsecops/
[3]: https://www.redhat.com/en/topics/devops/what-is-devsecops
[4]: https://www.redhat.com/en/topics/security
[5]: https://surfshark.com/blog/does-vpn-protect-you-from-hackers
[6]: https://www.infoq.com/articles/evolve-devops-devsecops/
[7]: https://enterprisersproject.com/article/2019/9/agile-project-management-explained
[8]: https://www.governmentciomedia.com/defense-innovation-board-issues-guide-detecting-agile-bs
[9]: https://www.redhat.com/en/solutions/financial-services
[10]: https://www.military.com/daily-news/2020/02/25/dod-agency-suffers-data-breach-potentially-compromising-ssns.html
[11]: https://fcw.com/articles/2020/01/23/dod-devsecops-guidance-williams.aspx
[12]: https://privacyaustralia.net/privacy-tools/
[13]: https://www.securitymagazine.com/articles/88301-cybersecurity-is-standard-business-practice-for-large-companies
