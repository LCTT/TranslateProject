[#]: collector: (lujun9972)
[#]: translator: (chen-ni)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11721-1.html)
[#]: subject: (How tracking pixels work)
[#]: via: (https://jvns.ca/blog/how-tracking-pixels-work/)
[#]: author: (Julia Evans https://jvns.ca/)

网络广告商的像素追踪是如何工作的？
======

![](https://img.linux.net.cn/data/attachment/album/201912/27/214125hvpv4e5ijepa0aqj.jpg)

昨天，我和一名记者谈到了一个问题：广告商是如何在互联网上对人们进行追踪的？我们津津有味地查看了 Firefox 的开发者工具（虽然我不是一个互联网隐私专家，但至少还会使用开发者工具中的“network”标签页），从中我终于弄明白<ruby>像素追踪<rt>tracking pixels</rt></ruby>在实际中是如何工作的了。

### 问题：Facebook 怎么知道你逛了 Old Navy？

我时常听人们说起这种有些诡异的上网经历：你在线上浏览了一个商品，一天之后，竟然看到了同一款靴子（或者是别的什么你当时浏览的商品）的广告。这就是所谓的“再营销”，但它到底是如何实现的呢？

在本文中，我们来进行一个小实验，看看 Facebook 究竟是怎么知道你在线上浏览了什么商品的。这里使用 Facebook 作为示例，只是因为很容易找到使用了 Facebook 像素追踪技术的网站；其实，几乎所有互联网广告公司都会使用类似的追踪技术。

### 准备：允许第三方追踪器，同时关闭广告拦截器

我使用的浏览器是 Firefox，但是 Firefox 默认拦截了很多这种类型的追踪，所以需要修改 Firefox 的隐私设置，才能让这种追踪生效。

首先，我将隐私设置从默认设置（[截图][1]）修改为允许第三方追踪器的个性化设置（[截图][2]），然后禁用了一些平时运行的隐私保护扩展。

![截图][1]

![截图][2]

### 像素追踪：关键不在于 gif，而在于请求参数

像素追踪是网站用来追踪你的一个 1x1 大小的 gif。就其本身而言，一个小小的 1x1 gif 显然起不到什么作用。那么，像素追踪到底是如何进行追踪的？其中涉及两个方面：

1. 通过使用像素追踪上的**请求参数**，网站可以添加额外的信息，比如你正在访问的页面。这样一来，请求的就不是 `https://www.facebook.com/tr/`（这个链接是一个 44 字节大小的 1x1 gif），而是 `https://www.facebook.com/tr/?the_website_you're_on`。（邮件营销人员会使用类似的技巧，通过为像素追踪指定一个独特的 URL，弄清楚你是否打开了某一封邮件。）
2. 在发送该请求的同时，还发送了相应的 cookie。这样一来广告商就可以知道，访问 oldnavy.com 的这个人和在同一台电脑上使用 Facebook 的是同一个人。

### Old Navy 网站上的 Facebook 像素追踪

为了对此进行验证，我在 Old Navy（GAP 旗下的一个服装品牌）网站上浏览了一个商品，相应的 URL 是 `https://oldnavy.gap.com/browse/product.do?pid=504753002&cid=1125694&pcid=1135640&vid=1&grid=pds_0_109_1`（这是一件“男款短绒格子花呢大衣”）。

在我浏览这个商品的同时，页面上运行的 Javascript（用的应该是[这段代码][4]）向 facebook.com 发送了一个请求。在开发者工具中，该请求看上去是这样的：（我屏蔽了大部分 cookie 值，因为其中有一些是我的登录 cookie）

![][5]

下面对其进行拆解分析：

1. 我的浏览器向如下 URL 发送了一个请求； 

    ```
https://www.facebook.com/tr/?id=937725046402747&ev=PageView&dl=https%3A%2F%2Foldnavy.gap.com%2Fbrowse%2Fproduct.do%3Fpid%3D504753002%26cid%3D1125694%26pcid%3Dxxxxxx0%26vid%3D1%26grid%3Dpds_0_109_1%23pdp-page-content&rl=https%3A%2F%2Foldnavy.gap.com%2Fbrowse%2Fcategory.do%3Fcid%3D1135640%26mlink%3D5155%2Cm_mts_a&if=false&ts=1576684838096&sw=1920&sh=1080&v=2.9.15&r=stable&a=tmtealium&ec=0&o=30&fbp=fb.1.1576684798512.1946041422&it=15xxxxxxxxxx4&coo=false&rqm=GET
``` 
2. 与该请求同时发送的，还有一个名为 `fr` 的 cookie，取值为

    ```
10oGXEcKfGekg67iy.AWVdJq5MG3VLYaNjz4MTNRaU1zg.Bd-kxt.KU.F36.0.0.Bd-kx6.
```
（估计是我的 Facebook 广告追踪 ID）

在所发送的像素追踪查询字符串里，有三个值得注意的地方：

* 我当前访问的页面：`https://oldnavy.gap.com/browse/product.do?pid=504753002&cid=1125694&pcid=1135640&vid=1&grid=pds_0_109_1#pdp-page-content`
* 引导我来到当前页面的上一级页面：`https://oldnavy.gap.com/browse/category.do?cid=1135640&mlink=5155,m_mts_a`；
* 作为我的身份标识的 cookie：`10oGXEcKfGekg67iy.AWVdJq5MG3VLYaNjz4MTNRaU1zg.Bd-kxt.KU.F36.0.0.Bd-kx6.`

### 下面来逛逛 Facebook！

下面来逛逛 Facebook 吧。我之前已经登入了 Facebook，猜猜看，我的浏览器发送给 Facebook 的 cookie 是什么？

不出所料，正是之前见过的 `fr` cookie：`10oGXEcKfGekg67iy.AWVdJq5MG3VLYaNjz4MTNRaU1zg.Bd-kxt.KU.F36.0.0.Bd-kx6.`。Facebook 现在一定知道我（Julia Evans，这个 Facebook 账号所关联的人）在几分钟之前访问了 Old Navy 网站，并且浏览了“男款短绒格子花呢大衣”，因为他们可以使用这个 cookie 将数据串联起来。

### 这里涉及到的是第三方 cookie

Facebook 用来追踪我访问了哪些网站的 cookie，属于所谓的“第三方 cookie”，因为 Old Navy 的网站使用它为一个第三方（即 facebook.com）确认我的身份。这和用来维持登录状态的“第一方 cookie”有所不同。

Safari 和 Firefox 默认都会拦截许多第三方 cookie（所以需要更改 Firefox 的隐私设置，才能够进行这个实验），而 Chrome 目前并不进行拦截（很可能是因为 Chrome 的所有者正是一个广告公司）。（LCTT 译注：Chrome 可以设置阻拦）

### 网站上的像素追踪有很多

如我所料，网站上的像素追踪有 **很多**。比如，wrangler.com 在我的浏览器里加载了来自不同域的 19 个不同的像素追踪。wrangler.com 上的像素追踪分别来自：`ct.pinterest.com`、`af.monetate.net`、`csm.va.us.criteo.net`、`google-analytics.com`、`dpm.demdex.net`、`google.ca`、`a.tribalfusion.com`、`data.photorank.me`、`stats.g.doubleclick.net`、`vfcorp.dl.sc.omtrdc.net`、`ib.adnxs.com`、`idsync.rlcdn.com`、`p.brsrvr.com`，以及 `adservice.google.com`。

Firefox 贴心地指出，如果使用 Firefox 的标准隐私设置，其中的大部分追踪器都会被拦截：

![][8]

### 浏览器的重要性

浏览器之所以如此重要，是因为你的浏览器最终决定了发送你的什么信息、发送到哪些网站。Old Navy 网站上的 Javascript 可以请求你的浏览器向 Facebook 发送关于你的追踪信息，但浏览器可以拒绝执行。浏览器的决定可以是：“哈，我知道 facebook.com/tr/ 是一个像素追踪，我不想让我的用户被追踪，所以我不会发送这个请求”。

浏览器还可以允许用户对上述行为进行配置，方法包括更改浏览器设置，以及安装浏览器扩展（所以才会有如此多的隐私保护扩展）。

### 摸清其中原理，实为一件趣事

在我看来，弄清楚 cookie/像素追踪是怎么用于对你进行追踪的，实在是一件趣事（尽管有点吓人）。我之前大概明白其中的道理，但是并没有亲自查看过像素追踪上的 cookie，也没有看过发送的查询参数上究竟包含什么样的信息。

当然，明白了其中的原理，也就更容易降低被追踪的概率了。

### 可以采取的措施

为了尽量避免在互联网上被追踪，我采取了几种简单的措施:

* 安装一个广告拦截器（比如 ublock origin 之类）。广告拦截器可以针对许多追踪器的域进行拦截。
* 使用目前默认隐私保护强度更高的 Firefox/Safari，而不是 Chrome。
* 使用 [Facebook Container][9] 这个 Firefox 扩展。该扩展针对 Facebook 进一步采取了防止追踪的措施。

虽然在互联网上被追踪的方式还有很多（尤其是在使用手机应用的时候，因为在这种情况下，你没有和像对浏览器一样的控制程度），但是能够理解这种追踪方法的工作原理，稍微减少一些被追踪的可能性，也总归是一件好事。

--------------------------------------------------------------------------------

via: https://jvns.ca/blog/how-tracking-pixels-work/

作者：[Julia Evans][a]
选题：[lujun9972][b]
译者：[chen-ni](https://github.com/chen-ni)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://jvns.ca/
[b]: https://github.com/lujun9972
[1]: https://jvns.ca/images/trackers.png
[2]: https://jvns.ca/images/firefox-insecure-settings.png
[3]: https://oldnavy.gap.com/browse/product.do?pid=504753002&cid=1125694&pcid=1135640&vid=1&grid=pds_0_109_1
[4]: https://developers.facebook.com/docs/facebook-pixel/implementation/
[5]: https://jvns.ca/images/fb-old-navy.png
[6]: https://oldnavy.gap.com/browse/product.do?pid=504753002&cid=1125694&pcid=1135640&vid=1&grid=pds_0_109_1#pdp-page-content
[7]: https://oldnavy.gap.com/browse/category.do?cid=1135640&mlink=5155,m_mts_a
[8]: https://jvns.ca/images/firefox-helpful.png
[9]: https://addons.mozilla.org/en-CA/firefox/addon/facebook-container/
