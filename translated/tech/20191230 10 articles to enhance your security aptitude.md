[#]: collector: "lujun9972"
[#]: translator: "nacyro"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "10 articles to enhance your security aptitude"
[#]: via: "https://opensource.com/article/19/12/security-resources"
[#]: author: "Ben Cotton https://opensource.com/users/bcotton"

10 篇文章强化你的安全能力
======
无论你是新手还是想要增加技能，Opensource.com 2019 年十大安全文章中都有适合你的内容。

![A secure lock.][1]

如果安全是一个过程（确实如此），那么理所当然的，不同的项目（及其贡献者）情况各有不同。有些应用程序经历了多年的安全测试，由在信息安全领域工作了几十年的人员所设计。其他的则是由开发人员在他们的第一个开源项目中开发的全新项目。毫不奇怪，Opensource.com 2019 年十大安全文章囊括了代表这一范围的经验。我们有介绍基本安全实践的文章，也有深入探讨更高级主题的文章。

无论你是新手还是想要增加你在传奇职业生涯中获得的技能，2019 年十大安全文章中都有适合你的内容。

### 《七步捍卫你的 Linux 服务器（7 steps to securing your Linux server）》

安全如舍，地基不牢，房屋不稳。Patrick H. Mullins 的杰作《[七步捍卫你的 Linux 服务器（7 steps to securing your Linux server）][2]》让您从Linux服务器的基本安全步骤开始。即使您有很多管理服务器的经验，本文也提供了一个很好的清单以确保您掌握了基础知识。在此基础上，您可以开始添加额外的安全层。

### 《用防火墙使 Linux 更健壮（Make Linux stronger with firewalls）》

七步捍卫你的 Linux 服务器中的一步即是启用防火墙。但什么**是**防火墙，它是如何工作的呢？ Seth Kenlon 在《[用防火墙使 Linux 更健壮（Make Linux stronger with firewalls）][3]》一文中回答了这些问题，然后详细描述了为了更好的安全性应如何配置你的防火墙。使用 `firewalld` 与 `Network Manager`，您可以为不同的网络设置不同的防火墙配置。例如，这允许您在您的家庭网络上进行信任配置，并在您最喜欢的咖啡店的 WiFi 网络上进行更多疑的配置。

### 《减少集中日志的安全风险（Reducing security risks with centralized logging）》

保护系统安全，只有开始，没有结束：安全是一个过程而不是状态。**保持**系统安全工作的一部分即是密切关注所发生的事情。集中化日志是实现这一点的一种方法，尤其是在管理多系统时。在《[减少集中日志的安全风险（Reducing security risks with centralized logging）][4]》中 Hannah Suarez 分享了要如何开始（她这篇文章基于她在 FOSDEM'19 (自由及开源软件开发者欧洲会议) 中的闪电演讲）

### 《为 SSH 使用 GPG 密钥（Using GPG keys for SSH）》

大多数人都会为 `SSH` 的密钥认证使用 `SSH 密钥`。为什么不呢？毕竟就在名字里。从安全的角度来看，这些方法非常好。但若想简化某些形式的密钥分发与备份还有另一种方法，Brian Exelbierd 的三部曲系列介绍了《[如何启用使用 GPG 子钥的 SSH 访问（How to enable SSH access with a GPG subkey）][5]》、《[如何导入现有 SSH 密钥（How to import existing SSH keys）][6]》、《[如何将备份量减少到单个密钥文件（How to reduce your backup needs to a single key file）][7]》

### 《使用 `Seahorse` 图形化管理 SSH 密钥（Graphically manage SSH keys with Seahorse）》

并不是所有人都喜欢用 `GPG` 作为 `SSH 密钥`，但这并不意味着您在密钥管理上会不顺。`Seahorse` 是一个在 `GNOME` 桌面中用于管理 `SSH 密钥` 及其他身份验证方法的图形化工具。Alan Formy-Duval 的《[使用 `Seahorse` 图形化管理 SSH 密钥（Graphically manage SSH keys with Seahorse）][8]》对新手用户特别有帮助。

### 《安全扫描你的 DevOps 管线（Security scanning your DevOps pipeline）》

如今到处都是容器。但它们容纳着什么？了解容器满足您的安全策略是保持安全性的重要部分。幸运的是，您可以使用开源工具来帮助自动化符合性检查。Jessica Cherry (原名: Repka) 的《[安全扫描你的 DevOps 管线（Security scanning your DevOps pipeline）][9]》是一个循序渐进的教程，向您展示了如何使用 `Jenkins` 构建系统和 `Anchore` 检查服务为容器镜像和 `registries` 创建扫描管线。

### 《四个开源云安全工具（4 open source cloud security tools）》

云服务的一大优点是你的数据可以从任何地方访问。云服务的一个缺点是你的数据可以从任何地方访问。如果您使用的是 `"-as-a-Service" (译注: IaaS, PaaS, SaaS)` 产品，那么您需要确保它们是经过安全配置的。Anderson Silva、Alison Naylor、Travis McPeak 和 Rich Monk 联合推出《[四个开源云安全工具（4 open source cloud security tools）][10]》以帮助在使用 `GitHub` 和 `AWS` 时提高安全性。如果你正在寻找被不小心提交的秘密，或尝试从一开始就阻止这些秘密被提交，这篇文章提供了工具。

### 《如何使用OpenSSL：哈希，数字签名，等等（How to use OpenSSL: hashes, digital signatures, and more）》

许多信息安全是基于数学的：特别是用于加密数据和验证用户或文件内容的加密函数。在《[开始使用 OpenSSL：密码学基础（Getting started with OpenSSL: Cryptography basics）][11]》中进行介绍后，Marty Kalin 深入讨论了《[如何使用 OpenSSL：哈希，数字签名，等等（How to use OpenSSL: hashes, digital signatures, and more）][12]》的细节，解释了如何使用 `OpenSSL` 实用程序来探索这些常用但不常被理解的概念。

### 《使用树莓派和 Kali Linux 学习计算机安全（Learn about computer security with the Raspberry Pi and Kali Linux）》

廉价硬件与开源软件构成了一个很好的组合，特别是对于那些希望边做边学的人来说。在《[使用树莓派和 Kali Linux 学习计算机安全（Learn about computer security with the Raspberry Pi and Kali Linux）][13]》这篇文章中，Anderson Silva 介绍了面向安全的 `Kali Linux` 发行版。这是一篇短文，但它满是关于文档和安全相关项目的有用的链接，您可以在自己的树莓派上使用它们。

### 《量子计算会破坏安全吗？（Will quantum computing break security?）》

这篇文章的余下部分是浪费吗？量子计算会让我们对安全的所知变得过时吗？好消息是：回答是否定的，但是量子计算仍然可以在更广泛的范围内对安全和计算世界产生深远的影响。在《[量子计算会破坏安全吗？（Will quantum computing break security?）][14]》一文中，Mike Bursell 剖析了它好坏两方面的影响，当然，量子计算可能会让加密的破解变得更容易，但如果坏人一开始就无法获得你的数据，那也没有关系。

### 《展望 2020（Looking to 2020）》

安全永远是重要的，(正如那篇量子计算文章所建议的) 未来几年将是该领域的一个有趣时期。在 2020 年，Opensource.com 的文章将着眼于开源安全的前沿，并帮助向不断增长的开源社区解释基础知识。如果你有一个你想要我们报导的主题，请在评论中分享它，或者更进一步 —— 如果你想写一篇文章，就写给我们吧。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/security-resources

作者：[Ben Cotton][a]
选题：[lujun9972][b]
译者：[nacyro](https://github.com/nacyro)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/bcotton
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=3V07Lpko "A secure lock."
[2]: https://opensource.com/article/19/10/linux-server-security
[3]: https://opensource.com/article/19/7/make-linux-stronger-firewalls
[4]: https://opensource.com/article/19/2/reducing-security-risks-centralized-logging
[5]: https://opensource.com/article/19/4/gpg-subkeys-ssh
[6]: https://opensource.com/article/19/4/gpg-subkeys-ssh-multiples
[7]: https://opensource.com/article/19/4/gpg-subkeys-ssh-manage
[8]: https://opensource.com/article/19/4/ssh-keys-seahorse
[9]: https://opensource.com/article/19/7/security-scanning-your-devops-pipeline
[10]: https://opensource.com/article/19/9/open-source-cloud-security
[11]: https://opensource.com/article/19/6/cryptography-basics-openssl-part-1
[12]: https://opensource.com/article/19/6/cryptography-basics-openssl-part-2
[13]: https://opensource.com/article/19/3/computer-security-raspberry-pi
[14]: https://opensource.com/article/19/1/will-quantum-computing-break-security
[15]: https://opensource.com/how-submit-article
