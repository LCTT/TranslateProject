一些提高开源代码安全性的工具
======

> 开源软件的迅速普及带来了对健全安全实践的需求。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/open-security.jpg?itok=R3M5LDrb)

虽然目前开源依然发展势头较好，并被广大的厂商所采用，然而最近由 Black Duck 和 Synopsys 发布的 [2018 开源安全与风险评估报告][1]指出了一些存在的风险，并重点阐述了对于健全安全措施的需求。这份报告的分析资料素材来自经过脱敏后的 1100 个商业代码库，这些代码所涉及：自动化、大数据、企业级软件、金融服务业、健康医疗、物联网、制造业等多个领域。

这份报告强调开源软件正在被大量的使用，扫描结果中有 96% 的应用都使用了开源组件。然而，报告还指出许多其中存在很多漏洞。具体在 [这里][2]：

  * 令人担心的是扫描的所有结果中，有 78% 的代码库存在至少一个开源的漏洞，平均每个代码库有 64 个漏洞。
  * 在经过代码审计过后代码库中，发现超过 54% 的漏洞经验证是高危漏洞。
  * 17% 的代码库包括一种已经早已公开的漏洞，包括：Heartbleed、Logjam、Freak、Drown、Poddle。

Synopsys 旗下 Black Duck 的技术负责人 Tim Mackey 称，“这份报告清楚的阐述了：随着开源软件正在被企业广泛的使用，企业与组织也应当使用一些工具来检测可能出现在这些开源软件中的漏洞，以及管理其所使用的开源软件的方式是否符合相应的许可证规则。”

确实，随着越来越具有影响力的安全威胁出现，历史上从未有过我们目前对安全工具和实践的需求。大多数的组织已经意识到网络与系统管理员需要具有相应的较强的安全技能和安全证书。[在一篇文章中][3]，我们给出一些具有较大影响力的工具、认证和实践。

Linux 基金会已经在安全方面提供了许多关于安全的信息与教育资源。比如，Linux 社区提供了许多针对特定平台的免费资源，其中 [Linux 工作站安全检查清单][4] 其中提到了很多有用的基础信息。线上的一些发表刊物也可以提升用户针对某些平台对于漏洞的保护，如：[Fedora 安全指南][5]、[Debian 安全手册][6]。

目前被广泛使用的私有云平台 OpenStack 也加强了关于基于云的智能安全需求。根据 Linux 基金会发布的 [公有云指南][7]：“据 Gartner 的调研结果，尽管公有云的服务商在安全审查和提升透明度方面做的都还不错，安全问题仍然是企业考虑向公有云转移的最重要的考量之一。”

无论是对于组织还是个人，千里之堤毁于蚁穴，这些“蚁穴”无论是来自路由器、防火墙、VPN 或虚拟机都可能导致灾难性的后果。以下是一些免费的工具可能对于检测这些漏洞提供帮助：

  * [Wireshark][8]，流量包分析工具
  * [KeePass Password Safe][9]，自由开源的密码管理器
  * [Malwarebytes][10]，免费的反病毒和勒索软件工具
  * [NMAP][11]，安全扫描器
  * [NIKTO][12]，开源的 web 服务器扫描器
  * [Ansible][13]，自动化的配置运维工具，可以辅助做安全基线
  * [Metasploit][14]，渗透测试工具，可辅助理解攻击向量

这里有一些对上面工具讲解的视频。比如 [Metasploit 教学][15]、[Wireshark 教学][16]。还有一些传授安全技能的免费电子书，比如：由 Ibrahim Haddad 博士和 Linux 基金会共同出版的[并购过程中的开源审计][17]，里面阐述了多条在技术平台合并过程中，因没有较好的进行开源审计，从而引发的安全问题。当然，书中也记录了如何在这一过程中进行代码合规检查、准备以及文档编写。

同时，我们 [之前提到的一个免费的电子书][18]， 由来自 [The New Stack][19] 编写的“Docker 与容器中的网络、安全和存储”，里面也提到了关于加强容器网络安全的最新技术，以及 Docker 本身可提供的关于提升其网络的安全与效率的最佳实践。这本电子书还记录了关于如何构建安全容器集群的最佳实践。

所有这些工具和资源，可以在很大的程度上预防安全问题，正如人们所说的未雨绸缪，考虑到一直存在的安全问题，现在就应该开始学习这些安全合规资料与工具。

想要了解更多的安全、合规以及开源项目问题，点击[这里][20]。

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/5/free-resources-securing-your-open-source-code

作者：[Sam Dean][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[sd886393](https://github.com/sd886393)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/sam-dean
[1]:https://www.blackducksoftware.com/open-source-security-risk-analysis-2018
[2]:https://www.prnewswire.com/news-releases/synopsys-report-finds-majority-of-software-plagued-by-known-vulnerabilities-and-license-conflicts-as-open-source-adoption-soars-300648367.html
[3]:https://www.linux.com/blog/sysadmin-ebook/2017/8/future-proof-your-sysadmin-career-locking-down-security
[4]:https://linux.cn/article-6753-1.html
[5]:https://docs.fedoraproject.org/en-US/Fedora/19/html/Security_Guide/index.html
[6]:https://www.debian.org/doc/manuals/securing-debian-howto/index.en.html
[7]:https://www.linux.com/publications/2016-guide-open-cloud
[8]:https://www.wireshark.org/
[9]:http://keepass.info/
[10]:https://www.malwarebytes.com/
[11]:http://searchsecurity.techtarget.co.uk/tip/Nmap-tutorial-Nmap-scan-examples-for-vulnerability-discovery
[12]:https://cirt.net/Nikto2
[13]:https://www.ansible.com/
[14]:https://www.metasploit.com/
[15]:http://www.computerweekly.com/tutorial/The-Metasploit-Framework-Tutorial-PDF-compendium-Your-ready-reckoner
[16]:https://www.youtube.com/watch?v=TkCSr30UojM
[17]:https://www.linuxfoundation.org/resources/open-source-audits-merger-acquisition-transactions/
[18]:https://www.linux.com/news/networking-security-storage-docker-containers-free-ebook-covers-essentials
[19]:http://thenewstack.io/ebookseries/
[20]:https://www.linuxfoundation.org/projects/security-compliance/
