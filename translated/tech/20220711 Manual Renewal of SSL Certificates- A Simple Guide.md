[#]: subject: "Manual Renewal of SSL Certificates: A Simple Guide"
[#]: via: "https://www.opensourceforu.com/2022/07/manual-renewal-of-ssl-certificates-a-simple-guide/"
[#]: author: "Jitendra Bhojwani https://www.opensourceforu.com/author/jitendra-bhojwani/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

手动续订 SSL 证书：简单指南
======

![SSL-Certificates-Featured-image][1]

*在本杂志 2022 年 4 月号中，我们了解了不同类型的 SSL 证书及其应用。本文介绍如何手动更新现有 SSL 证书，以使其保持最新的安全要求。*

当访问者与你的网站互动并分享信用卡号码等关键细节时，他们相信他们的信息已得到保护，不会被滥用。因此，你有责任尊重这种信任并为你网站上的所有访问者提供全面保护。不这样做不仅会使你失去客户的忠诚度，而且还可能使你陷入法律困境。在许多情况下，无法保护客户数据免遭泄露、盗窃或滥用的网站被迫支付巨额罚款，同时也失去了声誉。

#### SSL 证书如何保护客户的数据？

保护敏感客户信息的最佳方法之一是使用 SSL（安全套接字层）证书保护你的站点。在不涉及技术细节的情况下，SSL 证书对 Web 服务器和访问者浏览器之间的通信进行加密，从而使黑客或威胁参与者在技术上不可能窃取传输中的数据。 SSL 建立了一个安全的握手过程来解密加密的信息，这个过程太复杂了，人类甚至软件都无法破解。

#### 为什么需要更新 SSL 证书？

虽然 SSL 证书提供了防止数据盗窃或滥用的安全性，但你需要定期更新它以确保最有效的安全性以抵御最新的威胁。本文将列出以正确方式更新 SSL 证书的分步说明。

更新 SSL 证书有很多好处：

* 及时更新验证您网站的身份。
* 获得更新的安全性。
* 一年有效期促进定期更新/升级保护范围的健康实践，从而消除与过时版本相关的风险。

> 注意：最佳做法是选择自动续订选项，以减轻你记住续订日期或手动执行相关步骤的压力。 

#### 有点跑题了，构建你自己的 SSL 证书的纯开源方式

是的，这绝对是真的！通过一些简化和紧凑的步骤，你实际上可以从头开始构建自己的 SSL 证书！虽然整个过程超出了本文的范围，但这里有一些可用于创建 SSL 证书的关键开源组件和工具。

* OpenSSL：这是实现 TLS 和加密库的高度可信的工具。
* EasyRSA：此命令行工具使你能够构建 PKI CA 并有效地管理它。
* CFSSL：Cloudflare 终于为 PKI 和 TLS 构建了一个多用途、多功能的工具。
* Lemur：由 Netflix 开发的足够公平的 TLS 生成器。

### 如何更新你的 SSL 证书

虽然 [SSL][2] 更新的一般过程不变，但可能会有一些细微的调整和变化，具体取决于你的特定 SSL 提供商。

更新过程遵循三个主要步骤：CSR（证书签名请求）生成、证书激活，最后是证书安装。

**生成 CSR：** 对于 cPanel 托管面板，你可以单击安全选项卡并搜索 *SSL/TLS* 选项。它将显示一个页面，显示 CSR 选项下方的链接。这里有助于为你所需的域名生成新的 CSR。

系统将询问你详细的联系信息，以确认你是真正的域所有者。填写表格后，你将获得证书重新激活所需的 CSR 代码。

*激活 SSL 证书：* 在你的仪表板中，你可以快速查看拥有的 SSL 证书、域和其他数字基础设施产品。单击此按钮开始 SSL 续订过程。输入前段时间生成的 CSR，确认信息的准确性。你现在可以验证 SSL 续订过程。

*验证 SSL 证书：* 系统将再次提示你确认域所有权。输入与域相关的电子邮件。在需要安装证书的 Web 服务器上上传文件。借助 CNAME 记录验证 SSL 证书。虽然有多种选择，但最好和最简单的方法是通过电子邮件进行验证。输入与域关联的电子邮件后，你将收到一封包含特定链接的电子邮件，然后是另一封邮件，其中包含带有 .*crt* 扩展名的新证书文件。

*安装 SSL 证书：* 你的网络托管服务提供商将为你提供与支持团队沟通以安装更新文件的选项，或为你提供有关如何通过 cPanel 手动执行此操作的详细说明。请记住，不同的主机提供不同的续订选项。也就是说，如果你是非技术人员，那么联系支持团队将是你的最佳选择。

如需手动更新，请访问 cPanel 的 *SSL/TLS* 页并找到 *Manage SSL* 站点选项。它包你拥有的整个域列表。对应每个域名，你可以看到证书更新选项。

在旁边的页面中，使用 *Domain* 选项的*自动填充*在*私钥*中输入详细信息。在 *Certificate* 选项下，填写您的 .*crt 文件*的详细信息。你快完成了。只需单击显示*安装证书*的按钮。

除了保存用户的关键数据和敏感信息外，SSL 证书还通过重申你网站上共享的数据是安全的来建立信任。由于 Google 认为 SSL 认证是一种健康的做法，因此它也会你您的 SEO 资料产生积极影响。但是，要继续享受此证书的最佳安全性，你需要定期更新它。这可确保你的站点根据最新的安全要求完全免受传输中的数据攻击。

--------------------------------------------------------------------------------

via: https://www.opensourceforu.com/2022/07/manual-renewal-of-ssl-certificates-a-simple-guide/

作者：[Jitendra Bhojwani][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.opensourceforu.com/author/jitendra-bhojwani/
[b]: https://github.com/lkxed
[1]: https://www.opensourceforu.com/wp-content/uploads/2022/05/SSL-Certificates-Featured-image.jpg
[2]: https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwitou7xjv_3AhWLRmwGHVZ2BWwQFnoECB0QAQ&url=https%3A%2F%2Fgithub.com%2Fopenssl%2Fopenssl&usg=AOvVaw0niwMRCpb4nN_PtJFMQwWP
