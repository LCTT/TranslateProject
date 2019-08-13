[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11200-1.html)
[#]: subject: (How to detect automatically generated emails)
[#]: via: (https://arp242.net/weblog/autoreply.html)
[#]: author: (Martin Tournoij https://arp242.net/)

如何检测自动生成的电子邮件
======

![](https://img.linux.net.cn/data/attachment/album/201908/08/003503fw0w0pzx2ue6a6a6.jpg)

当你用电子邮件系统发送自动回复时，你需要注意不要向自动生成的电子邮件发送回复。最好的情况下，你将获得无用的投递失败消息。更可能的是，你会得到一个无限的电子邮件循环和一个混乱的世界。

事实证明，可靠地检测自动生成的电子邮件并不总是那么容易。以下是基于为此编写的检测器并使用它扫描大约 100,000 封电子邮件（大量的个人存档和公司存档）的观察结果。

### Auto-submitted 信头

由 [RFC 3834][1] 定义。

这是表示你的邮件是自动回复的“官方”标准。如果存在 `Auto-Submitted` 信头，并且其值不是 `no`，你应该**不**发送回复。

### X-Auto-Response-Suppress 信头

[由微软][2]定义。

此信头由微软 Exchange、Outlook 和其他一些产品使用。许多新闻订阅等都设定了这个。如果 `X-Auto-Response-Suppress` 包含 `DR`（“抑制投递报告”）、`AutoReply`（“禁止 OOF 通知以外的自动回复消息”）或 `All`，你应该**不**发送回复。

### List-Id 和 List-Unsubscribe 信头

由 [RFC 2919][3] 定义。

你通常不希望给邮件列表或新闻订阅发送自动回复。几乎所有的邮件列表和大多数新闻订阅都至少设置了其中一个信头。如果存在这些信头中的任何一个，你应该**不**发送回复。这个信头的值不重要。

### Feedback-ID 信头

[由谷歌][4]定义。

Gmail 使用此信头识别邮件是否是新闻订阅，并使用它为这些新闻订阅的所有者生成统计信息或报告。如果此信头存在，你应该**不**发送回复。这个信头的值不重要。

### 非标准方式

上述方法定义明确（即使有些是非标准的）。不幸的是，有些电子邮件系统不使用它们中的任何一个 :-( 这里有一些额外的措施。

#### Precedence 信头

在 [RFC 2076][5] 中没有真正定义，不鼓励使用它（但通常会遇到此信头）。

请注意，不建议检查是否存在此信头，因为某些邮件使用 `normal` 和其他一些（少见的）值（尽管这不常见）。

我的建议是如果其值不区分大小写地匹配 `bulk`、`auto_reply` 或 `list`，则**不**发送回复。

#### 其他不常见的信头

这是我遇到的另外的一些（不常见的）信头。如果设置了其中一个，我建议**不**发送自动回复。大多数邮件也设置了上述信头之一，但有些没有（这并不常见）。

* `X-MSFBL`：无法真正找到定义（Microsoft 信头？），但我只有自动生成的邮件带有此信头。
* `X-Loop`：在任何地方都没有真正定义过，有点罕见，但有时有。它通常设置为不应该收到电子邮件的地址，但也会遇到 `X-Loop: yes`。
* `X-Autoreply`：相当罕见，并且似乎总是具有 `yes` 的值。

#### Email 地址

检查 `From` 或 `Reply-To` 信头是否包含 `noreply`、`no-reply` 或 `no_reply`（正则表达式：`^no.?reply@`）。

#### 只有 HTML 部分

如果电子邮件只有 HTML 部分，而没有文本部分，则表明这是一个自动生成的邮件或新闻订阅。几乎所有邮件客户端都设置了文本部分。

#### 投递失败消息

许多传递失败消息并不能真正表明它们是失败的。一些检查方法：

* `From` 包含 `mailer-daemon` 或 `Mail Delivery Subsystem`

#### 特定的邮件库特征

许多邮件类库留下了某种痕迹，大多数常规邮件客户端使用自己的数据覆盖它。检查这个似乎工作得相当可靠。

* `X-Mailer: Microsoft CDO for Windows 2000`：由某些微软软件设置；我只能在自动生成的邮件中找到它。是的，在 2015 年它仍然在使用。
* `Message-ID` 信头包含 `.JavaMail.`：我发现了一些（5 个 50k 大小的）常规消息，但不是很多；绝大多数（数千封）邮件是新闻订阅、订单确认等。
* `^X-Mailer` 以 `PHP` 开头。这应该会同时看到 `X-Mailer: PHP/5.5.0` 和 `X-Mailer: PHPmailer XXX XXX`。与 “JavaMail” 相同。
* 出现了 `X-Library`；似乎只有 [Indy][6] 设定了这个。
* `X-Mailer` 以 `wdcollect` 开头。由一些 Plesk 邮件设置。
* `X-Mailer` 以 `MIME-tools` 开头。

### 最后的预防措施：限制回复的数量

即使遵循上述所有建议，你仍可能会遇到一个避开所有这些检测的电子邮件程序。这可能非常危险，因为电子邮件系统只是“如果有电子邮件那么发送”，就有可能导致无限的电子邮件循环。

出于这个原因，我建议你记录你自动发送的电子邮件，并将此速率限制为在几分钟内最多几封电子邮件。这将打破循环链条。

我们使用每五分钟一封电子邮件的设置，但没这么严格的设置可能也会运作良好。

### 你需要为自动回复设置什么信头

具体细节取决于你发送的邮件类型。这是我们用于自动回复邮件的内容：

```
Auto-Submitted: auto-replied
X-Auto-Response-Suppress: All
Precedence: auto_reply
```

### 反馈

你可以发送电子邮件至 [martin@arp242.net][7] 或 [创建 GitHub 议题][8]以提交反馈、问题等。

--------------------------------------------------------------------------------

via: https://arp242.net/weblog/autoreply.html

作者：[Martin Tournoij][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://arp242.net/
[b]: https://github.com/lujun9972
[1]: http://tools.ietf.org/html/rfc3834
[2]: https://msdn.microsoft.com/en-us/library/ee219609(v=EXCHG.80).aspx
[3]: https://tools.ietf.org/html/rfc2919)
[4]: https://support.google.com/mail/answer/6254652?hl=en
[5]: http://www.faqs.org/rfcs/rfc2076.html
[6]: http://www.indyproject.org/index.en.aspx
[7]: mailto:martin@arp242.net
[8]: https://github.com/Carpetsmoker/arp242.net/issues/new
