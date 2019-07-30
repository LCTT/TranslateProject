[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11163-1.html)
[#]: subject: (How to enable DNS-over-HTTPS (DoH) in Firefox)
[#]: via: (https://www.zdnet.com/article/how-to-enable-dns-over-https-doh-in-firefox/)
[#]: author: (Catalin Cimpanu https://www.zdnet.com/meet-the-team/us/catalin.cimpanu/)

如何在 Firefox 中启用 DNS-over-HTTPS（DoH）
======

DNS-over-HTTPS（DoH）协议目前是谈论的焦点，Firefox 是唯一支持它的浏览器。但是，Firefox 默认不启用此功能，用户必须经历许多步骤并修改多个设置才能启动并运行 DoH。

在开始如何在 Firefox 中启用 DoH 支持的分步教程之前，让我们先描述它的原理。

### DNS-over-HTTPS 的工作原理

DNS-over-HTTPS 协议通过获取用户在浏览器中输入的域名，并向 DNS 服务器发送查询，以了解托管该站点的 Web 服务器的 IP 地址。

这也是正常 DNS 的工作原理。但是，DoH 通过 443 端口的加密 HTTPS 连接接受 DNS 查询将其发送到兼容 DoH 的 DNS 服务器（解析器），而不是在 53 端口上发送纯文本。这样，DoH 就会在常规 HTTPS 流量中隐藏 DNS 查询，因此第三方监听者将无法嗅探流量，并了解用户的 DNS 查询，从而推断他们将要访问的网站。

此外，DNS-over-HTTPS 的第二个特性是该协议工作在应用层。应用可以带上内部硬编码的 DoH 兼容的 DNS 解析器列表，从而向它们发送 DoH 查询。这种操作模式绕过了系统级别的默认 DNS 设置，在大多数情况下，这些设置是由本地 Internet 服务提供商（ISP）设置的。这也意味着支持 DoH 的应用可以有效地绕过本地 ISP 流量过滤器并访问可能被本地电信公司或当地政府阻止的内容 —— 这也是 DoH 目前被誉为用户隐私和安全的福音的原因。

这是 DoH 在推出后不到两年的时间里获得相当大的普及的原因之一，同时也是一群[英国 ISP 因为 Mozilla 计划支持 DoH 协议而提名它为 2019 年的“互联网恶棍” （Internet Villian）][1]的原因，ISP 认为 DoH 协议会阻碍他们过滤不良流量的努力。（LCTT 译注：后来这一奖项的提名被取消。）

作为回应，并且由于英国政府阻止访问侵犯版权内容的复杂情况，以及 ISP 自愿阻止访问虐待儿童网站的情况，[Mozilla 已决定不为英国用户默认启用此功能][2]。

下面的分步指南将向英国和世界各地的 Firefox 用户展示如何立即启用该功能，而不用等到 Mozilla 将来启用它 —— 如果它会这么做的话。在 Firefox 中有两种启用 DoH 支持的方法。

### 方法 1：通过 Firefox 设置

**步骤 1：**进入 Firefox 菜单，选择**工具**，然后选择**首选项**。 可选在 URL 栏中输入 `about:preferences`，然后按下回车。这将打开 Firefox 的首选项。

**步骤 2：**在**常规**中，向下滚动到**网络设置**，然后按**设置**按钮。

![DoH section in Firefox settings][3]

**步骤3：**在弹出窗口中，向下滚动并选择“**Enable DNS over HTTPS**”，然后配置你需要的 DoH 解析器。你可以使用内置的 Cloudflare 解析器（该公司与 Mozilla [达成协议][4]，记录更少的 Firefox 用户数据），或者你可以在[这个列表][4]中选择一个。

![DoH section in Firefox settings][6]

### 方法 2：通过 about:config

**步骤 1：**在 URL 栏中输入 `about:config`，然后按回车访问 Firefox 的隐藏配置面板。在这里，用户需要启用和修改三个设置。

**步骤 2：**第一个设置是 `network.trr.mode`。这打开了 DoH 支持。此设置支持四个值：

* `0`  - 标准 Firefox 安装中的默认值（当前为 5，表示禁用 DoH）
* `1`  - 启用 DoH，但 Firefox 依据哪个请求更快返回选择使用 DoH 或者常规 DNS
* `2`  - 启用 DoH，常规 DNS 作为备用
* `3`  - 启用 DoH，并禁用常规 DNS
* `5`  - 禁用 DoH

值为 2 工作得最好

![DoH in Firefox][7]

**步骤3：**需要修改的第二个设置是 `network.trr.uri`。这是与 DoH 兼容的 DNS 服务器的 URL，Firefox 将向它发送 DoH DNS 查询。默认情况下，Firefox 使用 Cloudflare 的 DoH服务，地址是：<https://mozilla.cloudflare-dns.com/dns-query>。但是，用户可以使用自己的 DoH 服务器 URL。他们可以从[这个列表][8]中选择其中一个可用的。Mozilla 在 Firefox 中使用 Cloudflare 的原因是因为与这家公司[达成了协议][4]，之后 Cloudflare 将收集来自 Firefox 用户的 DoH 查询的非常少的数据。

[DoH in Firefox][9]

**步骤4：**第三个设置是可选的，你可以跳过此设置。 但是如果设置不起作用，你可以使用此作为步骤 3 的备用。该选项名为 `network.trr.bootstrapAddress`，它是一个输入字段，用户可以输入步骤 3 中兼容 DoH 的 DNS 解析器的 IP 地址。对于 Cloudflare，它是 1.1.1.1。 对于 Google 服务，它是 8.8.8.8。 如果你使用了另一个 DoH 解析器的 URL，如果有必要的话，你需要追踪那台服务器的 IP 地址并输入。

![DoH in Firefox][10]

通常，在步骤 3 中输入的 URL 应该足够了。
设置应该立即生效，但如果它们不起作用，请重新启动 Firefox。

文章信息来源：[Mozilla Wiki][11]


--------------------------------------------------------------------------------

via: https://www.zdnet.com/article/how-to-enable-dns-over-https-doh-in-firefox/

作者：[Catalin Cimpanu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.zdnet.com/meet-the-team/us/catalin.cimpanu/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-11068-1.html
[2]: https://www.zdnet.com/article/mozilla-no-plans-to-enable-dns-over-https-by-default-in-the-uk/
[3]: https://zdnet1.cbsistatic.com/hub/i/2019/07/07/df30c7b0-3a20-4de7-8640-3dea6d249a49/121bd379b6232e1e2a97c35ea8c7764e/doh-settings-1.png
[4]: https://developers.cloudflare.com/1.1.1.1/commitment-to-privacy/privacy-policy/firefox/
[6]: https://zdnet3.cbsistatic.com/hub/i/2019/07/07/8608af28-2a28-4ff1-952b-9b6d2deb1ea6/b1fc322caaa2c955b1a2fb285daf0e42/doh-settings-2.png
[7]: https://zdnet1.cbsistatic.com/hub/i/2019/07/06/0232b3a7-82c6-4a6f-90c1-faf0c090254c/6db9b36509021c460fcc7fe825bb74c5/doh-1.png
[8]: https://github.com/curl/curl/wiki/DNS-over-HTTPS#publicly-available-servers
[9]: https://zdnet2.cbsistatic.com/hub/i/2019/07/06/4dd1d5c1-6fa7-4f5b-b7cd-b544748edfed/baa7a70ac084861d94a744a57a3147ad/doh-2.png
[10]: https://zdnet1.cbsistatic.com/hub/i/2019/07/06/8ec20a28-673c-4a17-8195-16579398e90a/538fe8420f9b24724aeb4a6c8d4f0f0f/doh-3.png
[11]: https://wiki.mozilla.org/Trusted_Recursive_Resolver
