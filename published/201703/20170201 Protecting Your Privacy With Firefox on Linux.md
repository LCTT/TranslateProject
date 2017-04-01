在 Linux 上用火狐浏览器保护你的隐私
=============================

### 介绍

隐私和安全正在逐渐成为一个重要的话题。虽然不可能做到 100% 安全，但是，还是能采取一些措施，特别是在 Linux 上，在你浏览网页的时候保护你的在线隐私安全。

基于这些目的选择浏览器的时候，火狐或许是你的最佳选择。谷歌 Chrome 不能信任。它是属于谷歌的，一个众所周知的数据收集公司，而且它是闭源的。 Chromium 或许还可以，但并不能保证。只有火狐保持了一定程度的用户权利承诺。

### 火狐设置

火狐里有几个你能设定的设置，能更好地保护你的隐私。这些设置唾手可得，能帮你控制那些在你浏览的时候分享的数据。

#### 健康报告

你首先可以设置的是对火狐健康报告发送的限制，以限制数据发送量。当然，这些数据只是被发送到 Mozilla，但这也是传输数据。

打开火狐的菜单，点击<ruby>“选项”<rt>Preferences</rt></ruby>。来到侧边栏里的<ruby>“高级”<rt>Advanced</rt></ruby>选项卡，点击<ruby>“数据选项”<rt>Data Choices</rt></ruby>。这里你能禁用任意数据的报告。

#### 搜索

新版的火狐浏览器默认使用雅虎搜索引擎。一些发行版会更改设置，替代使用的是谷歌。两个方法都不理想。火狐可以使用 DuckDuckGo 作为默认选项。

 ![在火狐中使用 DuckDuckGo ](https://linuxconfig.org/images/ff-ddg.jpg?58cf18fd) 

为了启用 DuckDuckGo，你得打开火狐菜单点击<ruby>“选项”<rt>Preferences</rt></ruby>。直接来到侧边栏的<ruby>“搜索”<rt>Search</rt></ruby>选项卡。然后，在<ruby>“默认搜索引擎”<rt>Default Search Engine</rt></ruby>的下拉菜单中选择 DuckDuckGo 。

#### <ruby>请勿跟踪<rt>Do Not Track</rt></ruby>

这个功能并不完美，但它确实向站点发送了一个信号，告诉它们不要使用分析工具来记录你的活动。这些网页或许会遵从，会许不会。但是，最好启用请勿跟踪，也许它们会遵从呢。

![启用火狐中的请勿跟踪](https://linuxconfig.org/images/ff-tracking.jpg?58cf18fc) 

再次打开火狐的菜单，点击<ruby>“选项”<rt>Preferences</rt></ruby>，然后是<ruby>“隐私”<rt>Privacy</rt></ruby>。页面的最上面有一个<ruby>“跟踪”<rt>Tracking</rt></ruby>部分。点击那一行写着<ruby>“您还可以管理您的‘请勿跟踪’设置”<rt>You can also manage your Do Not Track settings</rt></ruby>的链接。会出现一个有复选框的弹出窗口，那里允许你启用“请勿跟踪”设置。

#### 禁用 Pocket

没有任何证据显示 Pocket 正在做一些不好的事情，但是禁用它或许更好，因为它确实连接了一个专有的应用。

禁用 Pocket 不是太难，但是你得注意只改变 Pocket 相关设置。要访问你所需的配置页面，在火狐的地址栏里输入`about:config`。

页面会加载一个设置表格，在表格的最上面是搜索栏，在那儿搜索 Pocket 。

你将会看到一个包含结果的新表格。找一下名为 `extensions.pocket.enabled` 的设置。当你找到它的时候，双击使其转变为“否”。你也能在这儿编辑 Pocket 的其他相关设置。不过没什么必要。注意不要编辑那些跟 Pocket 扩展不直接相关的任何东西。

![禁用火狐的 Pocket](https://linuxconfig.org/images/ff-pocket.jpg?58cf18fd) 

### <ruby>附加组件<rt>Add-ons</rt></ruby>

![安全化火狐的附加组件](https://linuxconfig.org/images/ff-addons.jpg?58cf18fd) 

火狐最有效地保护你隐私和安全的方式来自附加组件。火狐有大量的附加组件库，其中很多是免费、开源的。在这篇指导中着重提到的附加组件，在使浏览器更安全方面是名列前茅的。

#### HTTPS Everywhere

针对大量没有使用 SSL 证书的网页、许多不使用 `https` 协议的链接、指引用户前往不安全版本的网页等现状，<ruby>电子前线基金会<rt>Electronic Frontier Foundation</rt></ruby>开发了 HTTPS Everywhere。HTTPS Everywhere 确保了如果该链接存在有一个加密的版本，用户将会使用它。

给火狐设计的 [HTTPS Everywhere](https://addons.mozilla.org/en-us/firefox/addon/https-everywhere/) 已经可以使用，在火狐的附加组件搜索网页上。（LCTT 译注：对应的[中文页面](https://addons.mozilla.org/zh-CN/firefox/addon/https-everywhere/)。）


#### Privacy Badger

电子前线基金会同样开发了 Privacy Badger。 [Privacy Badger](https://addons.mozilla.org/en-us/firefox/addon/privacy-badger17) 旨在通过阻止不想要的网页跟踪，弥补“请勿跟踪”功能的不足之处。它同样能通过火狐附加组件仓库安装。。（LCTT 译注：对应的[中文页面](https://addons.mozilla.org/zh-CN/firefox/addon/privacy-badger17/)。）


#### uBlock Origin

现在有一类更通用的的隐私附加组件，屏蔽广告。这里的选择是 uBlock Origin，uBlock Origin 是个更轻量级的广告屏蔽插件，几乎不遗漏所有它会屏蔽的广告。 [uBlock Origin](https://addons.mozilla.org/en-us/firefox/addon/ublock-origin/) 将主要屏蔽各种广告，特别是侵入性的广告。你能在这儿找到它。。（LCTT 译注：对应的[中文页面](https://addons.mozilla.org/zh-CN/firefox/addon/ublock-origin/)。）

#### NoScript

阻止 JavaScript 是有点争议， JavaScript 虽说支撑了那么多的网站，但还是臭名昭著，因为 JavaScript 成为侵略隐私和攻击的媒介。NoScript 是应对 JavaScript 的绝佳方案。

 ![向 NoScript 的白名单添加网页](https://linuxconfig.org/images/ff-noscript.jpg?58cf18fc) 

NoScript 是一个 JavaScript 的白名单，它会屏蔽所有 JavaScript，除非该站点被添加进白名单中。可以通过插件的“选项”菜单，事先将一个站点加入白名单，或者通过在页面上点击 NoScript 图标的方式添加。

 ![添加你所在的网页到 NoScript 的白名单中](https://linuxconfig.org/images/ff-noscript2.jpg?58cf18fd) 

通过火狐附加组件仓库可以安装 [NoScript](https://addons.mozilla.org/en-US/firefox/addon/noscript/)
如果网页提示不支持你使用的火狐版本，点<ruby>“无论如何下载”<rt>Download Anyway</rt></ruby>。这已经在 Firefox 51 上测试有效。

#### Disconnect

[Disconnect](https://addons.mozilla.org/en-US/firefox/addon/disconnect/) 做的事情很多跟 Privacy Badger 一样，它只是提供了另一个保护的方法。你能在附加组件仓库中找到它 （LCTT 译注：对应的[中文页面](https://addons.mozilla.org/zh-CN/firefox/addon/disconnect/)）。如果网页提示不支持你使用的火狐版本，点<ruby>“无论如何下载”<rt>Download Anyway</rt></ruby>。这已经在 Firefox 51 上测试有效。

#### Random Agent Spoofer

Random Agent Spoofer 能改变火狐浏览器的签名，让浏览器看起来像是在其他任意平台上的其他任意浏览器。虽然有许多其他的用途，但是它也能用于预防浏览器指纹侦查。

<ruby>浏览器指纹侦查<rt>Browser Fingerprinting</rt></ruby>是网站基于所使用的浏览器和操作系统来跟踪用户的另一个方式。相比于 Windows 用户，浏览器指纹侦查更多影响到 Linux 和其他替代性操作系统用户，因为他们的浏览器特征更独特。

你能通过火狐附加插件仓库添加 [Random Agent Spoofer](https://addons.mozilla.org/en-us/firefox/addon/random-agent-spoofer/)。（LCTT 译注：对应的[中文页面](https://addons.mozilla.org/zh-CN/firefox/addon/random-agent-spoofer/)）。像其他附加组件那样，页面或许会提示它不兼容最新版的火狐。再说一次，那并不是真的。

 ![在火狐上使用Random Agent Spoofer ](https://linuxconfig.org/images/ff-random-agent.jpg?58cf18fc) 

你可以通过点击火狐菜单栏上的图标来使用 Random Agent Spoofer。点开后将会出现一个下拉菜单，有不同模拟的浏览器选项。最好的选项之一是选择"Random Desktop" 和任意的切换时间。这样，就绝对没有办法来跟踪你了，也保证了你只能获得网页的桌面版本。

### 系统设置

#### 私人 DNS

请避免使用公共或者 ISP 的 DNS 服务器！即使你配置你的浏览器满足绝对的隐私标准，你向公共 DNS 服务器发出的 DNS 请求却暴露了所有你访问过的网页。诸如谷歌公共 DNS（IP：8.8.8.8 、8.8.4.4）这类的服务将会记录你的 IP 地址、你的 ISP 和地理位置信息。这些信息或许会被任何合法程序或者强制性的政府请求所分享。

> **当我在使用谷歌公共 DNS 服务时，谷歌会记录什么信息？**
>
> 谷歌公共 DNS 隐私页面有一个完整的收集信息列表。谷歌公共 DNS 遵循谷歌的主隐私政策，在<ruby>“隐私中心”<rt>Privacy Center</rt></ruby>可以看到。 用户的客户端 IP 地址是唯一会被临时记录的（一到两天后删除），但是为了让我们的服务更快、更好、更安全，关于 ISP 和城市/都市级别的信息将会被保存更长的时间。
> 参考资料： `https://developers.google.com/speed/public-dns/faq#privacy`

由于以上原因，如果可能的话，配置并使用你私人的非转发 DNS 服务器。现在，这项任务或许跟在本地部署一些预先配置好的 DNS 服务器的 Docker 容器一样简单。例如，假设 Docker 服务已经在你的系统安装完成，下列命令将会部署你的私人本地 DNS 服务器：

```
# docker run -d --name bind9 -p 53:53/udp -p 53:53 fike/bind9
```

DNS 服务器现在已经启动并正在运行：

```
# dig @localhost google.com
; <<>> DiG 9.9.5-9+deb8u6-Debian <<>> @localhost google.com                                                                                   
; (2 servers found)                                                                                                                           
;; global options: +cmd                                                                                                                       
;; Got answer:                                                                                                                                
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 51110                                                                                     
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 4, ADDITIONAL: 5

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;google.com.                    IN      A

;; ANSWER SECTION:
google.com.             242     IN      A       216.58.199.46
```

现在，在 `/etc/resolv.conf` 里设置你的域名服务器：

```
nameserver 127.0.0.1
```

### 结束语

没有完美的安全隐私解决方案。虽然本篇指导里的步骤可以明显改进它们。如果你真的很在乎隐私，[Tor 浏览器](https://www.torproject.org/projects/torbrowser.html.en) 是最佳选择。Tor 对于日常使用有点过犹不及，但是它的确使用了这篇指导里列出的一些措施。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux

作者：[Nick Congleton][a]
译者：[ypingcn](https://ypingcn.github.io/wiki/lctt)
校对：[jasminepeng](https://github.com/jasminepeng)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux
