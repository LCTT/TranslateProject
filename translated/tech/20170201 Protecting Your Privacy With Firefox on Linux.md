### 在 Linux 上用火狐保护你的隐私

内容
      [1. 介绍][12]
       [2. 火狐设置][13]
           [2.1. 健康报告][1]
           [2.2. 搜索][2]
           [2.3. 请勿跟踪][3]
           [2.4. 禁用 Pocket][4]
       [3. 附加组件][14]
           [3.1. HTTPS Everywhere][5]
           [3.2. Privacy Badger][6]
           [3.3. Ublock Origin][7]
           [3.4. NoScript][8]
           [3.5. Disconnect][9]
           [3.6. Random Agent Spoofer][10]
       [4. 系统设置][15]
           [4.1. 私人 DNS][11]
       [5. 关闭联想][16]

### 介绍

隐私和安全正在逐渐成为一个重要的话题。虽然不可能做到 100% 安全，但是，特别是在 Linux 上，还是有几个你能做措施，在你浏览网页的时候保卫你的在线隐私安全。

基于这些目的选择浏览器的时候，火狐或许是你的最佳选择。谷歌 Chrome 不能信任。它是属于谷歌的，一个众所周知的数据收集公司，而且它是闭源的。 Chromium 或许还可以，但并不能保证。只有火狐保持了一定程度的用户权利承诺。

### 火狐设置

 ![火狐隐私浏览](linuxconfig.orgimagesprivate-browsing-firefox-linux.jpg) 

火狐里有几个你能设定的设置，能更好地保护你的隐私。这些设置唾手可得，能帮你控制那些在你浏览的时候分享的数据。


### 健康报告

你能设置以限制数据发送总量的第一件事就是火狐的健康报告。当然，这些数据只是被发送到 Mozilla ，但是它仍然在传输数据。


打开火狐的菜单，点击选项。来到侧边栏里的高级选项卡，点击数据反馈。这里你能禁用任意数据的报告。

### 搜索

新版的火狐浏览器默认使用雅虎搜索引擎。一些发行版更改设置，替代使用的是谷歌。两个方法都不理想。火狐有默认使用 DuckDuckGo 的选项。


 ![在火狐中使用 DuckDuckGo ](httpslinuxconfig.orgimagesff-ddg.jpg) 
center

为了启用 DuckDuckGo，你得打开火狐菜单点击选项。直接来到侧边栏的搜索选项卡。然后，用默认搜索引擎的下拉菜单来选择 DuckDuckGo 。

### 请勿跟踪

请勿跟踪并不完美，但它确实向网页发送了一个信号，告诉他们不要使用分析工具来记录你的活动。这些网页或许会遵从，会许不会。但是，万一他们会遵从，最好启用请勿跟踪。

 ![启用火狐中的请勿跟踪](httpslinuxconfig.orgimagesff-tracking.jpg) 

再次打开火狐的菜单，点击选项，然后是隐私。页面的最上面有一个跟踪部分。点击那一行写着 “ 您还可以管理您的 ‘请勿跟踪’ 设置 ” 的链接。会出现一个有单选框的弹出窗口，那里允许你启用请勿跟踪设置。


### 禁用 Pocket

没有任何证据显示 Pocket 正在做一些不好的事情，但是禁用它或许更好，因为它确实连接了一个专有的应用。


禁用 Pocket 不是太难，但是你得注意 Pocket 是唯一扰乱你的东西。为了来到你所需的配置页面，在火狐的地址栏里输入`about:config`。


这些页面会加载一个设置表格，在表格的最上面是搜索栏，在那儿搜索 Pocket 。

你将会看到一个包含结果的新表格。找一下名为 extensions.pocket.enabled 的设置。当你找到它的时候，双击使其转变为否。你也能在这儿编辑 Pocket 的其他相关设置。虽说这不是必要的。只是得保证不要编辑那些不是直接跟 Pocket 应用相关设置的任何东西。


 ![禁用火狐的 Pocket](httpslinuxconfig.orgimagesff-pocket.jpg) 


### 附加组件


 ![安全化火狐的附加组件](https://linuxconfig.orgimagesff-addons.jpg) 

火狐最有效地保护你隐私和安全的方式来自附加组件。火狐有大量的附加组件库，有许多附加组件是免费、开源的。在这篇指导中着重提到的附加组件，对于安全化你的浏览器方面是名列前茅的。


### HTTPS Everywhere

电子前线基金会开发了HTTPS Everywhere，这是对大量没有使用 SSL 证书的网页、许多不使用`https`前缀的链接、指引用户前往不安全版本的网页等做出的反应。HTTPS Everywhere 确保了如果存在有一个加密版本的网页，用户将会使用它。

给火狐设计的 HTTPS Everywhere 已经可以使用，在火狐的附加组件搜索网页上。`https://addons.mozilla.org/en-us/firefox/addon/https-everywhere/`（译者注：对应的中文页面是`https://addons.mozilla.org/zh-CN/firefox/addon/https-everywhere/`）


### Privacy Badger

电子前线基金会同样开发了 Privacy Badger。 Privacy Badger 旨在通过阻止不想要的网页跟踪，弥补请勿跟踪功能的不足之处。它同样能通过火狐附加组件仓库安装。`https://addons.mozilla.org/en-us/firefox/addon/privacy-badger17`. （译者注：对应的中文页面是`https://addons.mozilla.org/zh-CN/firefox/addon/privacy-badger17/`）



### Ublock Origin

现在有一类更通用的的隐私附加组件，屏蔽广告。这里的选择是  uBlock Origin ，uBlock Origin 是个更轻量级的广告屏蔽插件，几乎不遗漏所有它会屏蔽的广告。 uBlock Origin 将主要屏蔽所有广告，特别是侵略性的广告。你能在这儿找到它。`https://addons.mozilla.org/en-us/firefox/addon/ublock-origin/`.（译者注：对应的中文页面是`https://addons.mozilla.org/zh-CN/firefox/addon/ublock-origin/`）


### NoScript

阻止 JavaScript 是有点争议， JavaScript 虽说驱动了那么多的网站，但还是臭名昭著，因为 JavaScript 成为侵略隐私和攻击的媒介。NoScript 是应对 JavaScript 的绝佳方案。


 ![向 NoScript 的白名单添加网页](https://linuxconfig.org/images/ff-noscript.jpg) 

NoScript 是一个 JavaScript 的白名单，它通常会屏蔽 JavaScript 直到一个网页被添加进白名单中。添加一个网页进白名单能提前完成，通过插件的选项菜单，或者能通过点击页面上的 NoScript 图标完成。


 ![添加你所在的网页到 NoScript 的白名单中](https://linuxconfig.org/images/ff-noscript2.jpg) 

通过火狐附加组件仓库可以安装 NoScript `https://addons.mozilla.org/en-US/firefox/addon/noscript/`
如果网页提示不支持你使用的火狐版本，点“无论如何下载”。它已经测试过能在Firefox 51 上使用。

### Disconnect

Disconnect 做很多跟 Privacy Badger 一样的事情，它只是提供了另一个保护的方法。你能在附加组件仓库中找到它 `https://addons.mozilla.org/en-US/firefox/addon/disconnect/` （译者注：对应的中文页面是`https://addons.mozilla.org/zh-CN/firefox/addon/disconnect/`）如果网页提示不支持你使用的火狐版本，点“无论如何下载”。它已经测试过能在Firefox 51 上使用。



### Random Agent Spoofer

Random Agent Spoofer 能改变火狐浏览器的签名，让浏览器看起来像是在其他任意平台上的其他任意浏览器。虽然有许多其他的应用，但是它也能预防浏览器指纹侦查。


浏览器指纹侦查是网站基于所使用的浏览器和操作系统来跟踪用户的另一个方式。相比于 Windows 用户，浏览器指纹侦查更多影响到 Linux 和其他替代性操作系统用户，因为他们的浏览器特征更独特。


你能通过火狐附加插件仓库添加 Random Agent Spoofer。`https://addons.mozilla.org/en-us/firefox/addon/random-agent-spoofer/`（译者注：对应的中文页面是`https://addons.mozilla.org/zh-CN/firefox/addon/random-agent-spoofer/`）像其他附加组件那样，页面或许会提示在最新版的火狐兼容性不好。再说一次，那并不是真的。


 ![在火狐上使用Random Agent Spoofer ](https://linuxconfig.org/images/ff-random-agent.jpg) 

你能通过点击火狐菜单栏上的图标来使用 Random Agent Spoofer。点开后将会出现一个下拉菜单，有不同模拟的浏览器选项。最好的选项之一是选择"Random Desktop" 和任意的改变时间。这样，就不会有绝对的模式来跟踪，也保证了你只能获得网页的桌面版本。



### 系统设置

### 私人 DNS

避免使用公共或者 ISP 的 DNS 服务器。即使你配置了你的浏览器满足绝对的隐私标准，你向公共 DNS 服务器发出的 DNS 请求暴露了所有你访问过的网页。服务，例如谷歌公共 DNS（IP：8.8.8.8 、8.8.4.4）将会记录你的 IP 地址、关于你的 ISP 和地理位置信息。这些信息或许会被任何合法程序或者强制性的政府请求所分享。


> **当我在使用谷歌公共 DNS 服务时，谷歌会记录什么信息？**
>
> 谷歌公共 DNS 隐私页面有一个完整的收集信息列表。谷歌公共 DNS 遵循谷歌主隐私政策，在我们的隐私中心可以看到。 你客户端 IP 地址是唯一会被临时记录的（一到两天后删除），但是为了让我们的服务更快、更好、更安全，关于 ISP 和城市/都市级别的信息将会被保存更长的时间。
> 参考资料： `https://developers.google.com/speed/public-dns/faq#privacy`

以上原因，如果可能的话，配置并使用你私人的非转发 DNS 服务器。现在，这项任务或许跟在本地部署一些预先配置好的 DNS 服务器 Docker 容器一样琐碎。例如，假设 docker 服务已经在你的系统安装完成，下列命令将会部署你的私人本地 DNS 服务器：

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

现在，在`/etc/resolv.conf `里设置你的域名服务器：


```

nameserver 127.0.0.1
```

### 关闭联想

没有完美的安全隐私解决方案。虽然这篇指导里的步骤明显是个改进。如果你真的很在乎隐私，Tor 浏览器`https://www.torproject.org/projects/torbrowser.html.en`，是最佳选择。Tor 对于日常使用有点过犹不及，但是它的确使用了同样在这篇指导里列出的一些措施。

--------------------------------------------------------------------------------

via: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux

作者：[Nick Congleton][a]
译者：[ypingcn](https://ypingcn.github.io/wiki/lctt)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux
[1]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-1-health-report
[2]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-2-search
[3]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-3-do-not-track
[4]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-4-disable-pocket
[5]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-1-https-everywhere
[6]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-2-privacy-badger
[7]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-3-ublock-origin
[8]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-4-noscript
[9]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-5-disconnect
[10]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-6-random-agent-spoofer
[11]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h4-1-private-dns
[12]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h1-introduction
[13]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h2-firefox-settings
[14]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h3-add-ons
[15]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h4-system-settings
[16]: https://linuxconfig.org/protecting-your-privacy-with-firefox-on-linux#h5-closing-thoughts
