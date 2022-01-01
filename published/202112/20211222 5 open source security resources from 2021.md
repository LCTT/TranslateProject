[#]: subject: "5 open source security resources from 2021"
[#]: via: "https://opensource.com/article/21/12/open-source-security"
[#]: author: "Jessica Cherry https://opensource.com/users/cherrybomb"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14134-1.html"

2021 总结：5 个开源安全资源
======

> 你现在需要读的 2021 安全总结文章。

![](https://img.linux.net.cn/data/attachment/album/202112/31/112208zcc0ccatn8mkvddk.jpg)

2021 年我们最常见的讨论之一是你自己数据的安全和隐私。显然，你的数据是你的，密码是安全的关键。今年的安全类的作者们提供了有用的知识和开源工具来保持你的数据和硬件安全。

以下是我对今年安全之旅选出的前五篇文章。

### 《6 个开源工具和初学者保护 Linux 服务器的技巧》

[Sahana Sreeram][3] 提供了从更新到恶意软件扫描的 [六个基本的服务器安全小知识][2]。这篇文章为你在家里或工作中的 Linux 服务器提供了一个起点。要特别注意密码强度部分和为你的服务器创建降低风险的密码策略要求的工具，因为这是你所使用的任何操作系统上最关键的做法。这篇文章是一篇实用指南，指导你在 Linux 服务器的日常工作中进行安全工作。正如 Sahana 所指出的，安全领域无疑正在扩大，这篇文章给了每个人着手预防的机会。

### 《用开源软件保护你的文件的 5 种方法》

接下来的 [这篇文章][4] 对于像我这样写了大量的文档（从文章到个人研究笔记都有）的人来说是非常有用的。作者 [Ksenia Fedoruk][5] 首先列出了保存文档的开源云存储服务。接下来，她介绍了加密的重要性以及在我们的文档中使用加密的方法。她还清楚地介绍了文件的数字签名和水印以及使用哪些开源工具。最后，文章涵盖了对我们制作和使用的文档进行密码保护的情况。结尾处的提醒遵循了今年安全领域的一个共同主题：你的数据是你的。

### 《4 个清除你的数据的 Linux 工具》

在 [这篇文章][6] 中，[Don Watkins][7] 涵盖了硬件的用途和维护。它以一系列擦除硬盘的工具作为引子，这样你的数据就不能被下一个使用设备的人拿走。在几个小的演练中，Don 涵盖了使用 GNU shred、ShredOS、`dd` 命令，以及最后的 `nvme-cli`。每一个都可以从你的硬件中删除所有的数据，并对你正在使用的、不再需要的硬盘进行删除。Don 的结论提供了一个温和的提醒：如果你要卖掉你的硬件，这并不意味着下一个人应该拥有你的数据。你的数据是你的。

### 《在 Linux 命令行上生成密码》

正如我在本期中早先时候指出的那样，密码对于今年的安全总结至关重要。在 [这篇文章][8] 中，我们的作者 [Sumantro Mukherjee][9] 首先介绍了许多网站在涉及到密码时可以有（也应该有）一个严格的规定。这篇文章循序渐进地介绍了如何使用 `pwgen`，首先是安装它，然后是生成密码。这是一个有用的工具，Sumantro 详细介绍了如何使用一些标志来生成符合任何网站或应用的要求和策略的密码。在这篇读物的最后，最后的总结包含了链接到一个方便的开源密码管理器列表，这个列表是我们的另一位作者 [Jason Baker][10] 在今年早些时候写的。这是一个重要的读物，可以让你为你在网站上的日常使用制定更好的密码，以防止黑客攻击或丢失你的账户中的数据。

### 《用这个开源软件加密你的文件》

今年的安全总结的最后，是一篇关于加密和加密文件的 [文章][11]。[Seth Kenlon][12] 介绍了一个名为 VeraCrypt 的开源跨平台加密工具。Seth 的演练深入解释了如何安装和使用 VeraCrypt，并展示了这个很酷的软件的易用性。但在此之前，他还简要介绍了 VeraCrypt 的前身 TrueCrypt 的历史，以及 VeraCrypt 是如何向后兼容以前用 TrueCrypt 的加密卷的。通过这个易于使用的开源加密软件，Seth 已经证明，你可以在本地拥有你的数据，并以你想要的方式进行加密。

### 荣誉提名

虽然这五篇是我今年的最爱，但这里还有两篇同样值得一读的提名文章。

  * [Seth Kenlon][12] 的《[了解开源安全的 Linus 法则][13]》。
  * [Mike Calizo][14] 的《[如何成功执行 DevSecOps][15]》。

每篇文章都对安全策略和采用情况进行了结构化解读。

### 关于安全的总结

我强烈建议在今年阅读这些文章和 [其他几篇][16]。这些将使你为 2022 年安全世界的发展做好准备。你可以成为新一年的安全冠军。

你有一些想要推荐的工具吗？请留下评论或 [提出你的文章构思][17]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/12/open-source-security

作者：[Jessica Cherry][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/cherrybomb
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003601_05_mech_osyearbook2016_security_cc.png?itok=3V07Lpko (A secure lock.)
[2]: https://opensource.com/article/21/4/securing-linux-servers
[3]: https://opensource.com/users/sahanasreeram01gmailcom
[4]: https://opensource.com/article/21/4/secure-documents-open-source
[5]: https://opensource.com/users/ksenia-fedoruk
[6]: https://opensource.com/article/21/10/linux-tools-erase-data
[7]: https://opensource.com/users/don-watkins
[8]: https://opensource.com/article/21/7/generate-passwords-pwgen
[9]: https://opensource.com/users/sumantro
[10]: https://opensource.com/users/jason-baker
[11]: https://opensource.com/article/21/4/open-source-encryption
[12]: https://opensource.com/users/seth
[13]: http://opensource.com/article/21/2/open-source-security
[14]: https://opensource.com/users/mcalizo
[15]: http://opensource.com/article/21/2/devsecops
[16]: https://opensource.com/tags/security
[17]: https://opensource.com/how-submit-article
