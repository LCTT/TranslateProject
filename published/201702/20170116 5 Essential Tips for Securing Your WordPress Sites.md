5 个让你的 WordPress 网站安全的技巧
============================================================

![](https://www.rosehosting.com/blog/wp-content/uploads/2017/01/tips-for-securing-wp.jpg) 

WordPress 是迄今为止最流行的博客平台。

正由于它的流行，也因此带来了正面和负面的影响。事实上，几乎每个人都使用它，使它更容易被发现漏洞。WordPress 的开发人员做了很多工作，一旦新的缺陷被发现，就会发布修复和补丁，但这并不意味着你可以安装完就置之脑后。

在这篇文章中，我们将提供一些最常见的保护和强化 WordPress 网站的方法。

### 在登录后台时总是使用 SSL

不用说的是，如果你并不打算只是做一个随意的博客，你应该总是使用 SSL。不使用加密连接登录到你的网站会暴露你的用户名和密码。任何人嗅探流量都可能会发现你的密码。如果你使用 WiFi 上网或者连接到一个公共热点，那么你被黑的几率更高，这是特别真实的。你可以从[这里][1]获取受信任的免费 SSL 证书。

### 精心挑选附加的插件

由第三方开发人员所开发，每个插件的质量和安全性总是值得怀疑，并且它仅取决于其开发人员的经验。当安装任何额外的插件时，你应该仔细选择，并考虑其受欢迎程度以及插件的维护频率。应该避免维护不良的插件，因为它们更容易出现易于被利用的错误和漏洞。

此主题也是上一个关于 SSL 主题的补充，因为许多插件包含的脚本会发出不安全连接（HTTP）的请求。只要你的网站通过 HTTP 访问，一切似乎很好。但是，一旦你决定使用加密并强制使用 SSL 访问，则会立即导致网站的功能被破坏，因为当你使用 HTTPS 访问其他网站时，这些插件上的脚本将继续通过 HTTP 提供请求。

### 安装 Wordfence

Wordfence 是由 Feedjit Inc. 开发的，Wordfence 是目前最流行的 WordPress 安全插件，并且是每个严肃的 WordPress 网站必备的，特别是那些使用 [WooCommerce][2] 或其它的 WordPress 电子商务平台的网站。 

Wordfence 不只是一个插件，因为它提供了一系列加强您的网站的安全功能。它具有 web 程序防火墙、恶意软件扫描、实时流量分析器和各种其它工具，它们可以提高你网站的安全性。防火墙将默认阻止恶意登录尝试，甚至可以配置为按照 IP 地址范围来阻止整个国家/地区的访问。我们真正喜欢 Wordfence 的原因是，即使你的网站因为某些原因被侵害，例如恶意脚本，Wordfence 可以在安装以后扫描和清理你的网站上被感染的文件。

该公司提供这个插件的免费和付费订阅计划，但即使是免费计划，你的网站仍将获得令人满意的水平。

### 用额外的密码锁住 /wp-admin 和 /wp-login.php

保护你的 WordPress 后端的另一个步骤是使用额外的密码保护任何除了你以外不打算让任何人使用的目录（即URL）。 /wp-admin 目录属于此关键目录列表。 如果你不允许普通用户登录 WordPress，你应该使用密码限制对 wp.login.php 文件的访问。无论是使用 [Apache][3] 还是 [Nginx][4]，你都可以访问这两篇文章，了解如何额外保护 WordPress 安装。

### 禁用/停止用户枚举

这是攻击者发现你网站上的有效用户名的一种相当简单的方法（即找出管理员用户名）。那么它是如何工作的？这很简单。在任何 WordPress 站点上的主要 URL 后面跟上 `/?author=1` 即可。 例如：`wordpressexample.com/?author=1`。

要保护您的网站免受此影响，只需安装[停止用户枚举][5]插件。

### 禁用 XML-RPC

RPC 代表远程过程调用，它可以用来从位于网络上另一台计算机上的程序请求服务的协议。对于 WordPress 来说，XML-RPC 允许你使用流行的网络博客客户端（如 Windows Live Writer）在你的 WordPress 博客上发布文章，如果你使用 WordPress 移动应用程序那么也需要它。 XML-RPC 在早期版本中被禁用，但是从 WordPress 3.5 时它被默认启用，这让你的网站面临更大的攻击可能。虽然各种安全研究人员建议这不是一个大问题，但如果你不打算使用网络博客客户端或 WP 的移动应用程序，你应该禁用 XML-RPC 服务。

有多种方法可以做到这一点，最简单的是安装[禁用 XML-RPC][6]插件。

--------------------------------------------------------------------------------

via: https://www.rosehosting.com/blog/5-tips-for-securing-your-wordpress-sites/

作者：[rosehosting.com][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:rosehosting.com
[1]:https://letsencrypt.org/
[2]:https://www.rosehosting.com/woocommerce-hosting.html
[3]:https://www.rosehosting.com/blog/password-protect-a-directory-using-htaccess/
[4]:https://www.rosehosting.com/blog/password-protecting-directories-with-nginx/
[5]:https://wordpress.org/plugins/stop-user-enumeration/
[6]:https://wordpress.org/plugins/disable-xml-rpc/
