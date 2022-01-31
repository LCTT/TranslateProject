[#]: subject: "Protect your PHP website from bots with this open source tool"
[#]: via: "https://opensource.com/article/22/1/php-website-bouncer-crowdsec"
[#]: author: "Philippe Humeau https://opensource.com/users/philippe-humeau"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14209-1.html"

用 CrowdSec 保护你的 PHP 网站不受机器人攻击
======

> CrowdSec 门卫被设计成可以包含在任何 PHP 应用程序中，以帮助阻止攻击者。

![](https://img.linux.net.cn/data/attachment/album/202201/24/094243dtt2fkjjwtn5i2kz.jpg)

PHP 是 Web 上广泛使用的一种编程语言，据估计有近 80% 的网站使用它。我在 [CrowdSec][2] 的团队决定，我们需要为服务器管理员提供一个 PHP 门卫，以帮助抵御那些可能试图与 PHP 文件互动的机器人和不良分子。

CrowdSec 门卫可以在应用栈的各个层面上进行设置：[Web 服务器、防火墙、CDN][3] 等等。本文关注的是另外一个层次：直接在应用层面设置补救措施。

由于各种原因，直接在应用程序中进行补救是有帮助的：

  * 它为潜在的安全威胁提供了业务逻辑上的答案。
  * 它提供了关于如何应对安全问题的自由。

虽然 CrowdSec 已经发布了一个 WordPress 门卫，但这个 PHP 库被设计成可以包含在任何 PHP 应用中（例如 Drupal）。该门卫有助于阻止攻击者，用验证码挑战他们，让人类通过，同时阻止机器人。

### 先决条件

本教程假定你在 Linux 服务器上运行 Drupal，并使用 [Apache 作为 Web 服务器][4]。

第一步是在你的服务器上 [安装 CrowdSec][5]。你可以用 [官方安装脚本][6] 来完成。如果你使用的是 Fedora、CentOS 或类似系统，请下载 RPM 版本：

```
$ curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.rpm.sh
```

在 Debian 和基于 Debian 的系统上，下载 DEB 版本：

```
$ curl -s https://packagecloud.io/install/repositories/crowdsec/crowdsec/script.deb.sh
```

这些脚本很简单，所以仔细阅读你下载的脚本，以验证它是否导入了 GPG 密钥并配置了一个新的存储库。当你清楚了它的作用后，就执行它，然后安装。

```
$ sudo dnf install crowdsec || sudo apt install crowdsec
```

CrowdSec 会自己检测到所有现有的服务，所以不需要进一步的配置就可以立即得到一个能发挥功能的设置。

### 测试初始设置

现在你已经安装了 CrowdSec，启动一个 Web 应用漏洞扫描器，比如 [Nikto][7]，看看它的表现如何：

```
$ ./nikto.pl -h http://<ip_or_domain>
```

![nikto scan][8]

该 IP 地址已被检测到触发了各种场景，最后一个是 `crowdsecurity/http-crawl-non_statics`：

![detected scan][9]

然而，CrowdSec 只检测问题，需要一个门卫来应用补救措施。这就是 PHP 门卫发挥作用的地方。

### 用 PHP 门卫进行补救

现在你可以检测到恶意行为了，你需要在网站层面上阻止 IP。在这个时候，没有用于 Drupal 的门卫可用。然而，你可以直接使用 PHP 门卫。

它是如何工作的？PHP 门卫（和其他门卫一样）对 CrowdSec 的 API 进行调用，并检查是否应该禁止进入的 IP，向他们发送验证码，或者允许他们通过。

Web 服务器是 Apache，所以你可以使用 [Apache 的安装脚本][10]：

```
$ git clone https://github.com/crowdsecurity/cs-php-bouncer.git
$ cd cs-php-bouncer/
$ ./install.sh --apache
```

![apache install script][11]

门卫的配置是用来保护整个网站。可以通过调整 Apache 的配置保护网站的一个特定部分。

### 尝试访问网站

PHP 门卫已经安装并配置好。由于之前的网络漏洞扫描行动，你被禁止了，你可以尝试访问该网站看看：

![site access attempt][12]

门卫成功阻止了你的流量。如果你在以前的 Web 漏洞扫描后没有被禁止，你可以用增加一个手动决策：

```
$ cscli decisions add -i <your_ip>
```

对于其余的测试，删除当前的决策：

```
$ cscli decisions delete -i <your_ip>
```

### 更进一步

我封锁了试图破坏 PHP 网站的 IP。这很好，但那些试图扫描、爬取或 DDoS 的 IP 怎么办？这些类型的检测可能会导致误报，那么为什么不返回一个验证码挑战来检查它是否是一个真正的用户（而不是一个机器人），而不是封锁 IP？

#### 检测爬虫和扫描器

我不喜欢爬虫和坏的用户代理，在 [Hub][13] 上有各种方案可以用来发现它们。

确保用 `cscli’ 下载了 Hub 上的 `base-http-scenarios` 集合：

```
$ cscli collections list | grep base-http-scenarios
crowdsecurity/base-http-scenarios  ✔️ enabled  /etc/crowdsec/collections/base-http-scenarios.yaml
```

如果没有找到，请安装它，并重新加载 CrowdSec：

```
$ sudo cscli collections install crowdsecurity/base-http-scenarios
$ sudo systemctl reload crowdsec
```

#### 用验证码补救

由于检测 DDoS、爬虫或恶意的用户代理可能会导致误报，我更倾向于对任何触发这些情况的 IP 地址返回一个验证码，以避免阻止真正的用户。

为了实现这一点，请修改 `profiles.yaml` 文件。

在 `/etc/crowdsec/profiles.yaml` 中的配置文件的开头添加这个 YAML 块：

```
---
# /etc/crowdsec/profiles.yaml
name: crawler_captcha_remediation
filter: Alert.Remediation == true && Alert.GetScenario() in ["crowdsecurity/http-crawl-non_statics", "crowdsecurity/http-bad-user-agent"]

decisions:
  - type: captcha
    duration: 4h
on_success: break
```

有了这个配置文件，任何触发 `crowdsecurity/http-crawl-non_statics` 或 `crowdsecurity/http-bad-user-agent` 场景的 IP 地址都会被强制执行一个验证码（持续 4 小时）。

接下来，重新加载 CrowdSec：

```
$ sudo systemctl reload crowdsec
```

#### 尝试自定义的补救措施

重新启动 Web 漏洞扫描器会触发很多场景，所以你最终会再次被禁止。相反，你可以直接制作一个触发 `bad-user-agent` 场景的攻击（已知的坏用户代理列表在 [这里][14]）。请注意，你必须激活该规则两次才能被禁止。

```
$ curl --silent -I -H "User-Agent: Cocolyzebot" http://example.com > /dev/null
$ curl -I -H "User-Agent: Cocolyzebot" http://example.com
HTTP/1.1 200 OK
Date: Tue, 05 Oct 2021 09:35:43 GMT
Server: Apache/2.4.41 (Ubuntu)
Expires: Sun, 19 Nov 1978 05:00:00 GMT
Cache-Control: no-cache, must-revalidate
X-Content-Type-options: nosniff
Content-Language: en
X-Frame-Options: SAMEORIGIN
X-Generator: Drupal 7 (http://drupal.org)
Content-Type: text/html; charset=utf-8
```

当然，你可以看到，你的行为会被抓住。

```
$ sudo cscli decisions list
```

![detected scan][15]

如果你试图访问该网站，不会被简单地被阻止，而是会收到一个验证码：

![CAPTCHA prompt][16]

一旦你解决了这个验证码，你就可以重新访问网站了。

接下来，再次解禁自己：

```
$ cscli decisions delete -i <your_ip>
```

启动漏洞扫描器：

```
$ ./nikto.pl -h http://example.com
```

与上次不同的是，你现在可以看到，你已经触发了几个决策：

![scan detected][17]

当试图访问网站时，禁止决策具有优先权：

![site access attempt][18]

### 总结

这是一个帮助阻止攻击者进入 PHP 网站和应用程序的快速方法。本文只包含一个例子。补救措施可以很容易地扩展，以适应额外的需求。要了解更多关于安装和使用 CrowdSec 代理的信息，[查看这个方法指南][19] 来开始。

要下载 PHP 门卫，请到 [CrowdSec Hub][20] 或 [GitHub][21]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/1/php-website-bouncer-crowdsec

作者：[Philippe Humeau][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/philippe-humeau
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/security_password_chaos_engineer_monster.png?itok=J31aRccu (Security monster)
[2]: https://opensource.com/article/20/10/crowdsec
[3]: https://hub.crowdsec.net/browse/#bouncers
[4]: https://opensource.com/article/18/2/how-configure-apache-web-server
[5]: https://doc.crowdsec.net/docs/getting_started/install_crowdsec
[6]: https://packagecloud.io/crowdsec/crowdsec/install
[7]: https://github.com/sullo/nikto
[8]: https://opensource.com/sites/default/files/1nikto_0.png (nikto scan)
[9]: https://opensource.com/sites/default/files/2decisions.png (detected scan)
[10]: https://github.com/crowdsecurity/cs-php-bouncer/blob/main/install.sh
[11]: https://opensource.com/sites/default/files/3bouncer.png (apache install script)
[12]: https://opensource.com/sites/default/files/4blocked.png (site access attempt)
[13]: https://hub.crowdsec.net/
[14]: https://raw.githubusercontent.com/crowdsecurity/sec-lists/master/web/bad_user_agents.txt
[15]: https://opensource.com/sites/default/files/7decisions-again.png (detected scan)
[16]: https://opensource.com/sites/default/files/8sitedeny.png (CAPTCHA prompt)
[17]: https://opensource.com/sites/default/files/10decisionsagain.png (scan detected)
[18]: https://opensource.com/sites/default/files/11sitedeny.png (site access attempt)
[19]: https://crowdsec.net/tutorial-crowdsec-v1-1/
[20]: https://hub.crowdsec.net/author/crowdsecurity/bouncers/cs-php-bouncer
[21]: https://github.com/crowdsecurity/cs-php-bouncer
