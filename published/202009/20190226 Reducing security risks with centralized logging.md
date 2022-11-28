[#]: collector: (lujun9972)
[#]: translator: (leommxj)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12591-1.html)
[#]: subject: (Reducing security risks with centralized logging)
[#]: via: (https://opensource.com/article/19/2/reducing-security-risks-centralized-logging)
[#]: author: (Hannah Suarez https://opensource.com/users/hcs)

通过集中日志记录来减少安全风险
======

> 集中日志并结构化待处理的日志数据可缓解与缺少日志相关的风险

![](https://img.linux.net.cn/data/attachment/album/202009/07/231016a8v8gva9gmc5hgv9.jpg)

日志记录和日志分析对于保护基础设施安全来说至关重要，尤其是当我们考虑到通用漏洞的时候。这篇文章基于我在 FOSDEM'19 上的闪电秀《[Let's use centralized log collection to make incident response teams happy][1]》，目的是提高大家对日志匮乏这种安全问题的重视，提供一种避免风险的方法，并且倡议更多的安全实践（利益声明: 我为 NXLog 工作）。

### 为什么要收集日志？为什么要集中日志记录？

确切的说，日志是写入磁盘的仅追加的记录序列。在实际生活中，日志可以在你尝试寻找异常的根源时帮助你调查基础设施的问题。当你有多个使用自己的标准与格式的日志的异构系统，并且想用一种可靠的方法来接收和处理它们的时候，挑战就来临了。这通常以元数据为代价的。集中日志记录解决方案需要共性，这种共性常常会去除许多开源日志记录工具所提供的丰富的元数据。

### 日志记录与监控匮乏的安全风险

<ruby>开源 Web 应用程序安全项目<rt>Open Web Application Security Project</rt></ruby>（[OWASP][2]）是一个为业界贡献了许多杰出项目（包括许多专注于软件安全的[工具][3]）的非营利组织。OWASP 定期为应用开发人员和维护者报告最危险的安全挑战。在最新一版《[10 项最严重的 Web 应用程序安全风险][4]》中，OWASP 将日志记录和监控匮乏加入了列表中。OWASP 警告下列情况会导致日志记录、检测、监控和主动响应的匮乏：

  * 未记录重要的可审计性事件，如：登录、登录失败和高额交易。
  * 告警和错误事件未能产生、产生不足或不清晰的日志信息。
  * 日志信息仅在本地存储。
  * 对于实时或准实时的主动攻击，应用程序无法检测、处理和告警。

可以通过集中日志记录（例如，不仅将日志本地存储）和结构化日志数据以进一步分析来缓解上述情形（例如，在告警仪表盘和安全套件中）。

举例来说, 假设一个 DNS 查询会导向名为 hacked.badsite.net 的恶意网站。通过 DNS 监控，管理员监控并且主动的分析 DNS 请求与响应。DNS 监控的效果依赖于充足的日志记录与收集来发现潜在问题，同样也依赖于结构化 DNS 日志的结果来进一步分析。

```
2019-01-29
Time (GMT)      Source                  Destination             Protocol-Info
12:42:42.112898 SOURCE_IP               xxx.xx.xx.x             DNS     Standard query 0x1de7  A hacked.badsite.net
```

你可以在 [NXLog 社区版][5] 中自己尝试一下这个例子，也可以尝试其他例子和代码片段。 （再次声明：我为 NXLog 工作）

### 重要的一点：非结构化数据与结构化数据

花费一点时间来考虑下日志数据格式是很重要的。例如，让我们来考虑以下日志消息：

```
debug1: Failed password for invalid user amy from SOURCE_IP port SOURCE_PORT ssh2
```

这段日志包含了一个预定义的结构，例如冒号前面的元数据关键词（`debug1`）然而，余下的日志字段是一个未结构化的字符串（`Failed password for invalid user amy from SOURCE_IP port SOURCE_PORT ssh2`）。因此，即便这个消息是人类可轻松阅读的格式，但它不是一个计算机容易解析的格式。

非结构化的事件数据存在局限性，包括难以解析、搜索和分析日志。重要的元数据通常以一种自由字符串的形式作为非结构化数据字段，就像上面的例子一样。日志管理员会在他们尝试标准化/归一化日志数据与集中日志源的过程中遇到这个问题。

### 接下来怎么做

除了集中和结构化日志之外，确保你收集了正确的日志数据——Sysmon、PowerShell、Windows 事件日志、DNS 调试日志、ETW、内核监控、文件完整性监控、数据库日志、外部云日志等等。同样也要选用适当的工具和流程来来收集、汇总和帮助理解数据。

希望这对你从不同日志源中集中日志收集提供了一个起点：将日志发送到仪表盘、监控软件、分析软件以及像安全性资讯与事件管理（SIEM）套件等外部源。

你的集中日志策略会是怎么样？请在评论中分享你的想法。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/reducing-security-risks-centralized-logging

作者：[Hannah Suarez][a]
选题：[lujun9972][b]
译者：[leommxj](https://github.com/leommxj)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hcs
[b]: https://github.com/lujun9972
[1]: https://fosdem.org/2019/schedule/event/lets_use_centralized_log_collection_to_make_incident_response_teams_happy/
[2]: https://www.owasp.org/index.php/Main_Page
[3]: https://github.com/OWASP
[4]: https://www.owasp.org/index.php/Top_10-2017_Top_10
[5]: https://nxlog.co/products/nxlog-community-edition/download
