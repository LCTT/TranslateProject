[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Reducing security risks with centralized logging)
[#]: via: (https://opensource.com/article/19/2/reducing-security-risks-centralized-logging)
[#]: author: (Hannah Suarez https://opensource.com/users/hcs)

Reducing security risks with centralized logging
======
Centralizing logs and structuring log data for processing can mitigate risks related to insufficient logging.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_privacy_lock.png?itok=ZWjrpFzx)

Logging and log analysis are essential to securing infrastructure, particularly when we consider common vulnerabilities. This article, based on my lightning talk [Let's use centralized log collection to make incident response teams happy][1] at FOSDEM'19, aims to raise awareness about the security concerns around insufficient logging, offer a way to avoid the risk, and advocate for more secure practices _(disclaimer: I work for NXLog)._

### Why log collection and why centralized logging?

Logging is, to be specific, an append-only sequence of records written to disk. In practice, logs help you investigate an infrastructure issue as you try to find a cause for misbehavior. A challenge comes up when you have heterogeneous systems with their own standards and formats, and you want to be able to handle and process these in a dependable way. This often comes at the cost of metadata. Centralized logging solutions require commonality, and that commonality often removes the rich metadata many open source logging tools provide.

### The security risk of insufficient logging and monitoring

The Open Web Application Security Project ([OWASP][2]) is a nonprofit organization that contributes to the industry with incredible projects (including many [tools][3] focusing on software security). The organization regularly reports on the riskiest security challenges for application developers and maintainers. In its most recent report on the [top 10 most critical web application security risks][4], OWASP added Insufficient Logging and Monitoring to its list. OWASP warns of risks due to insufficient logging, detection, monitoring, and active response in the following types of scenarios.

  * Important auditable events, such as logins, failed logins, and high-value transactions are not logged.
  * Warnings and errors generate none, inadequate, or unclear log messages.
  * Logs are only being stored locally.
  * The application is unable to detect, escalate, or alert for active attacks in real time or near real time.



These instances can be mitigated by centralizing logs (i.e., not storing logs locally) and structuring log data for processing (i.e., in alerting dashboards and security suites).

For example, imagine a DNS query leads to a malicious site named **hacked.badsite.net**. With DNS monitoring, administrators monitor and proactively analyze DNS queries and responses. The efficiency of DNS monitoring relies on both sufficient logging and log collection in order to catch potential issues as well as structuring the resulting DNS log for further processing:

```
2019-01-29
Time (GMT)      Source                  Destination             Protocol-Info
12:42:42.112898 SOURCE_IP               xxx.xx.xx.x             DNS     Standard query 0x1de7  A hacked.badsite.net
```

You can try this yourself and run through other examples and snippets with the [NXLog Community Edition][5] _(disclaimer again: I work for NXLog)._

### Important aside: unstructured vs. structured data

It's important to take a moment and consider the log data format. For example, let's consider this log message:

```
debug1: Failed password for invalid user amy from SOURCE_IP port SOURCE_PORT ssh2
```

This log contains a predefined structure, such as a metadata keyword before the colon ( **debug1** ). However, the rest of the log field is an unstructured string ( **Failed password for invalid user amy from SOURCE_IP port SOURCE_PORT ssh2** ). So, while the message is easily available in a human-readable format, it is not a format a computer can easily parse.

Unstructured event data poses limitations including difficulty of parsing, searching, and analyzing the logs. The important metadata is too often set in an unstructured data field in the form of a freeform string like the example above. Logging administrators will come across this problem at some point as they attempt to standardize/normalize log data and centralize their log sources.

### Where to go next

Alongside centralizing and structuring your logs, make sure you're collecting the right log data—Sysmon, PowerShell, Windows EventLog, DNS debug, NetFlow, ETW, kernel monitoring, file integrity monitoring, database logs, external cloud logs, and so on. Also have the right tools and processes in place to collect, aggregate, and help make sense of the data.

Hopefully, this gives you a starting point to centralize log collection across diverse sources; send them to outside sources like dashboards, monitoring software, analytics software, specialized software like security information and event management (SEIM) suites; and more.

What does your centralized logging strategy look like? Share your thoughts in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/2/reducing-security-risks-centralized-logging

作者：[Hannah Suarez][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/hcs
[b]: https://github.com/lujun9972
[1]: https://fosdem.org/2019/schedule/event/lets_use_centralized_log_collection_to_make_incident_response_teams_happy/
[2]: https://www.owasp.org/index.php/Main_Page
[3]: https://github.com/OWASP
[4]: https://www.owasp.org/index.php/Top_10-2017_Top_10
[5]: https://nxlog.co/products/nxlog-community-edition/download
