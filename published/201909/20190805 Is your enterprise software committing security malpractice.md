[#]: collector: (lujun9972)
[#]: translator: (hopefully2333)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11305-1.html)
[#]: subject: (Is your enterprise software committing security malpractice?)
[#]: via: (https://www.networkworld.com/article/3429559/is-your-enterprise-software-committing-security-malpractice.html)
[#]: author: (Andy Patrizio https://www.networkworld.com/author/Andy-Patrizio/)

你的企业安全软件是否在背后偷传数据？
======

> ExtraHop 发现一些企业安全和分析软件正在“私下回拨”，悄悄地将信息上传到客户网络外的服务器上。

![Getty Images][1]

当这个博客专注于微软的一切事情时，我常常抱怨、反对 Windows 10 的间谍活动方面。嗯，显然，这些跟企业安全、分析和硬件管理工具所做的相比，都不算什么。

一家叫做 ExtraHop 的分析公司检查了其客户的网络，并发现客户的安全和分析软件悄悄地将信息上传到客户网络外的服务器上。这家公司上周发布了一份[报告来进行警示][2]。

ExtraHop 特意选择不对这四个例子中的企业安全工具进行点名，这些工具在没有警告用户或使用者的情况发送了数据。这家公司的一位发言人通过电子邮件告诉我，“ExtraHop 希望关注报告的这个趋势，我们已经多次观察到了这种令人担心的情况。这个严重的问题需要企业的更多关注，而只是关注几个特定的软件会削弱这个严重的问题需要得到更多关注的观点。”

### 产品在安全提交传输方面玩忽职守，并且偷偷地传输数据到异地

[ExtraHop 的报告][6]中称发现了一系列的产品在偷偷地传输数据回自己的服务器上，包括终端安全软件、医院设备管理软件、监控摄像头、金融机构使用的安全分析软件等。报告中同样指出，这些应用涉嫌违反了欧洲的[通用数据隐私法规（GDPR）][7]。

在每个案例里，ExtraHop 都提供了这些软件传输数据到异地的证据，在其中一个案例中，一家公司注意到，大约每隔 30 分钟，一台连接了网络的设备就会发送 UDP 数据包给一个已知的恶意 IP 地址。有问题的是一台某国制造的安全摄像头，这个摄像头正在偷偷联系一个和某国有联系的已知的恶意 IP 地址。

该摄像头很可能由其办公室的一名员工出于其个人安全的用途独自设置的，这显示出影子 IT 的缺陷。

而对于医院设备的管理工具和金融公司的分析工具，这些工具违反了数据安全法，公司面临着法律风险——即使公司不知道这个事。

该医院的医疗设备管理产品应该只使用医院的 WiFi 网络，以此来确保患者的数据隐私和 HIPAA 合规。ExtraHop 注意到管理初始设备部署的工作站正在打开加密的 ssl:443 来连接到供应商自己的云存储服务器，这是一个重要的 HIPAA 违规。

ExtraHop 指出，尽管这些例子中可能没有任何恶意活动。但它仍然违反了法律规定，管理员需要密切关注他们的网络，以此来监视异常活动的流量。

“要明确的是，我们不知道供应商为什么要把数据偷偷传回自己的服务器。这些公司都是受人尊敬的安全和 IT 供应商，并且很有可能，这些数据是由他们的程序框架设计用于合法目的的，或者是错误配置的结果”，报告中说。

### 如何减轻数据外传的安全风险

为了解决这种安全方面玩忽职守的问题，ExtraHop 建议公司做下面这五件事：

* 监视供应商的活动：在你的网络上密切注意供应商的非正常活动，无论他们是活跃供应商、以前的供应商，还是评估后的供应商。
* 监控出口流量：了解出口流量，尤其是来自域控制器等敏感资产的出口流量。当检测到出口流量时，始终将其与核准的应用程序和服务进行匹配。
* 跟踪部署：在评估过程中，跟踪软件代理的部署。
* 理解监管方面的考量因素：了解数据跨越政治、地理边界的监管和合规考量因素。
* 理解合同协议：跟踪数据的使用是否符合供应商合同上的协议。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3429559/is-your-enterprise-software-committing-security-malpractice.html

作者：[Andy Patrizio][a]
选题：[lujun9972][b]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Andy-Patrizio/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2018/03/cybersecurity_eye-with-binary_face-recognition_abstract-eye-100751589-large.jpg
[2]: https://www.extrahop.com/company/press-releases/2019/extrahop-issues-warning-about-phoning-home/
[3]: https://www.networkworld.com/article/3254185/internet-of-things/tips-for-securing-iot-on-your-network.html#nww-fsb
[4]: https://www.networkworld.com/article/3269184/10-best-practices-to-minimize-iot-security-vulnerabilities#nww-fsb
[5]: https://www.networkworld.com/newsletters/signup.html#nww-fsb
[6]: https://www.extrahop.com/resources/whitepapers/eh-security-advisory-calling-home-success/
[7]: https://www.csoonline.com/article/3202771/general-data-protection-regulation-gdpr-requirements-deadlines-and-facts.html
[8]: https://pluralsight.pxf.io/c/321564/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fpaths%2Fcertified-information-systems-security-professional-cisspr
[9]: https://www.networkworld.com/article/3269165/internet-of-things/a-corporate-guide-to-addressing-iot-security-concerns.html
[10]: https://www.facebook.com/NetworkWorld/
[11]: https://www.linkedin.com/company/network-world
