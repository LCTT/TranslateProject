4 个用于托管开源库的顶级 CDN 服务
============================================================

> 内容分发网络可以加速你的网站图片、CSS、JS、以及其他静态内容。


![Top 4 CDN services for hosting open source libraries](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/file_system.jpg?itok=s2b60oIB "Top 4 CDN services for hosting open source libraries")

>图片版权：[Open Clip Art Library][3]，它明确将其公开于**[公共领域][1]**（[见此处][4]）。由 Jen Wike Huger 修改。

CDN 或称内容分发网络是位于世界各地的策略性放置的服务器网络，用于更快地向用户传输文件。传统 CDN 能够加速你的网站的图像、CSS、JS 和任何其他静态内容的访问。它允许网站所有者加速自己的所有内容，并为他们提供额外的功能和配置选项，而这些高级服务通常需要根据项目使用的带宽量进行支付。

但是，如果你的项目无法证明值得实施传统 CDN ，那么使用开源 CDN 可能更合适。通常这些类型的 CDN 能让你链接到流行的 Web 库（例如 CSS/JS 框架），可以让你从免费的 CDN 服务器上传输给你的访问者。虽然开源库的 CDN 服务不允许你将自己的内容上传到服务器，但它们可以帮助你加速全局库并提高网站的冗余性。

CDN 在庞大的服务器网络上托管项目，因此网站维护者需要修改网站 HTML 代码中的资源链接来反映开源 CDN 的URL，后面跟上资源路径。根据你是否链接到 JavaScript 或 CSS 库，链接将包含在 `<script>` 或 `<link>` 标签中。

我们来探讨开源库的四大流行 CDN 服务。

### JsDelivr

[JsDelivr][5] 是一个使用高级 CDN 提供商（KeyCDN、Stackpath、Cloudflare）的开源 CDN 提供者来分发开源项目资源。jsDelivr 的一些亮点包括：

*   支持 2100 多个库
*   110 个接入点
*   CDN 可在亚洲和中国使用
*   支持 API 
*   没有流量限制
*   完整的 HTTPS 支持

所有片段都以自定义 jsDelivr URL [https://cdn.jsdelivr.net/][6] 开始，然后是项目名称、版本号等。你还可以配置 jsDelivr 生成带脚本标签的 URL 并启用 SRI（子资源完整性）以增加安全性。

### Cdnjs

[Cdnjs][7] 是另一个流行的开源 CDN 提供者，类似于 jsDelivr。此服务还提供了一系列流行的 JavaScript 和 CSS 库，你可以在 Web 项目中进行链接。 该服务由 CDN 提供商 Cloudflare 和 [KeyCDN][8] 赞助。cdnjs 的一些亮点包括：

*   支持 2900 多个库
*   超过一百万个网站使用
*   支持 HTTP/2
*   支持 HTTPS

与 jsDelivr 类似，使用 cdnjs，你也可以选择使用或者不使用脚本标签和 SRI 来复制资源 URL。

### Google 托管库

[Google 托管库][9]网站允许你链接到托管在 Google 强大的开源 CDN 网络上的流行 JavaScript 库。这个开源的 CDN 解决方案不提供像 jsDelivr 或 cdnjs 一样多的库或者功能。然而，当连接到 Google 托管库时，你可以期待高度的可靠性和信任。Google 开源 CDN 的几个亮点包括：

*   HTTPS 支持
*   文件提供 CORS 和 Timing-Allow 头
*   提供每个库的最新版本

所有 Google 的托管库文件都以URL [https://ajax.googleapis.com/][10] 开头，后跟项目的名称、版本号和文件名。

### Microsoft Ajax CDN

[Microsoft Ajax CDN][11]与 Google 托管库非常类似，因为它只托管流行的库。但是，将 Microsoft Ajax CDN 与 Google 托管库区分开的两个主要区别是 Microsoft 提供了 CSS 和 JS 库，并且还提供了各种库的各种版本。Microsoft Ajax CDN 的几个亮点包括：

*   HTTPS 支持
*   每个库的以前版本通常都可用

所有的 Microsoft Ajax 文件都以 URL [http://ajax.aspnetcdn.com/ajax/][12] 开头，并且和其它文件一样，后面是库的名字，版本号等。

如果你的项目或网站尚未准备好利用优质的 CDN 服务，但你仍然希望加速网站的重要方面，那么使用开源 CDN 是一个很好的解决方案。它能够加速第三方库的传输，否则它们将从原始服务器发送，从而导致远方用户不必要的加载以及更慢的速度。

 _你喜欢使用哪个开源 CDN 提供商？为什么？_

--------------------------------------------------------------------------------

作者简介：

Cody Arsenault - Cody 热衷于网络性能，SEO 以及创业活动。他是 KeyCDN 的网络性能倡导者，致力于使网络更快。

------------


via: https://opensource.com/article/17/4/top-cdn-services

作者：[Cody Arsenault][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/codya
[1]:https://en.wikipedia.org/wiki/public_domain
[2]:https://opensource.com/article/17/4/top-cdn-services?rate=lgZwEmWt7QXtuMhB-lnHWQ-jxknQ0Kh4YOfqdFGer5w
[3]:https://en.wikipedia.org/wiki/Open_Clip_Art_Library
[4]:https://openclipart.org/share
[5]:http://www.jsdelivr.com/
[6]:https://cdn.jsdelivr.net/
[7]:https://cdnjs.com/
[8]:https://www.keycdn.com/
[9]:https://developers.google.com/speed/libraries/
[10]:https://ajax.googleapis.com/
[11]:https://www.asp.net/ajax/cdn
[12]:http://ajax.aspnetcdn.com/ajax/
[13]:https://opensource.com/user/128076/feed
[14]:https://opensource.com/users/codya
