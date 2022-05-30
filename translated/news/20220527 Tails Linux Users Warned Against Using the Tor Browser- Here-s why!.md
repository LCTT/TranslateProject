[#]: subject: "Tails Linux Users Warned Against Using the Tor Browser: Here’s why!"
[#]: via: "https://news.itsfoss.com/tails-tor-browser/"
[#]: author: "Rishabh Moharir https://news.itsfoss.com/author/rishabh/"
[#]: collector: "lkxed"
[#]: translator: "lkxed"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Tails 警告用户不要使用 Tor 浏览器：原因如下！
======
Tails 5.1 将针对“可绕过 Tor 浏览器安全措施的危险漏洞”提供关键修复。以下是它的全部内容。

![Tails][1]

**Tails** 是一个专注于安全的便携式 Linux 发行版，最近，它的开发团队发布了有关其当前版本的重要公告。他们警告用户在 **Tails 5.0 或更早版本** 上使用 Tor 浏览器时，避免输入或使用任何个人或敏感信息。

Tor 浏览器是 Tails 事实上的（默认）网络浏览器，它有助于在用户连接到 Internet 时，保护他们的在线身份。它主要被各种记者和活动家用来逃避审查。不过，普通用户也可以使用它。

### 问题说明

最近，有人发现了两个令人讨厌的漏洞，它们允许有害网站能够从其他网站窃取用户的信息。

具体来说，在 [Mozilla 发布的公告][2] 中，这些漏洞已被确定为 CVE-2022-1802 和 CVE-2022-1529。

Tails 公告中也对此进行了说明：

> “例如，在你访问恶意网站后，控制该网站的攻击者可能会在同一个 Tails 会话期间，访问你随后发送到其他网站的密码或其他敏感信息。”

### 你应该停止使用 Tail 发行版吗？

没有这个必要。

Tails 中的其他应用程序，尤其是 Thunderbird，仍然可以安全使用，因为 JavaScript 在使用时会被禁用。

此外，你也可以在 Tor 浏览器中启用最高的安全级别。这是推荐的，因为（该级别下）JavaScript 引擎会被禁用。不过，请注意，这会使网站无法正常运行。

换句话说，如果你知道自己在做什么的话，Tails 发行版仍然可以安全使用。

### 漏洞修复即将发布

好消息！Mozilla 已经在上游修补了这些错误，现在就等 Tails 团队发布修复程序了。

至于何时发布，他们是这样说的：

> 此漏洞将在 Tails 5.1（**5 月 31 日**）中修复，但我们的团队没有能力提前发布紧急版本。

因此，你最好的选择是等待下周的 Tails 5.1 发布。你可以阅读 Tails 开发团队的 [官方公告][3] 以了解更多信息。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/tails-tor-browser/

作者：[Rishabh Moharir][a]
选题：[lkxed][b]
译者：[lkxed](https://github.com/lkxed)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/rishabh/
[b]: https://github.com/lkxed
[1]: https://news.itsfoss.com/wp-content/uploads/2022/05/tails-5-0-privacy-issue.jpg
[2]: https://www.mozilla.org/en-US/security/advisories/mfsa2022-19/
[3]: https://tails.boum.org/security/prototype_pollution/index.en.html
