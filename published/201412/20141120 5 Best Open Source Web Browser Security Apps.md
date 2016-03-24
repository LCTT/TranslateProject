5个最佳开源的浏览器安全应用
================================================================================
浏览器是现在各种在线服务的入口。电脑安全问题迄今仍未得到解决，技术进步为恶意软件提供了新的途径，感染我们的设备、入侵商业网络。例如，智能手机与平板为恶意软件--及其同伙“[恶意广告][1]”--带来一片全新天地，它们在其中腾挪作乱。

恶意广告在合法广告与合法网络中注入恶意软件。当然你可能会认为“合法”广告与网络与非法广告与网络之间仅有一线之隔。但是请不要偏题哦。隐私与安全天生就是一对兄弟，保护隐私也就是保护你的安全。

Firefox, Chrome, 以及 Opera 当仁不让属最棒的浏览器：性能最佳、兼容性最好、以及安全性最优。以下五个开源安全应用安装于浏览器后会助你抵御种种威胁。

### 保护隐私： 开源浏览器安全应用 ###

#### 1. [AdBlock][2] ####

广告网络为恶意软件提供了肥沃的土壤。一个广告网络可以覆盖数千站点，因此攻陷一个广告网络就相当于攻陷数千台机器。AdBlock及其衍生品—[AdBlock Plus][2], [AdBlock Pro][3], 与 [AdBlock Edge][4]--都是屏蔽广告的优秀工具，可以让那些充斥烦人广告的网站重新还你一片清静。

当然，凡事都有两面性：上述做法损害了依靠广告收入的站点的利益。这些工具一键式白名单功能，对于那些你希望支持的网站，你可以通过白名单功能关闭这些网站的广告屏蔽。（真的，我亲爱的站长们，如果你不希望网站访问者屏蔽你的广告，那么就适可而止，不要让人反感。当然，作为粉丝，也请您支持您喜爱的站点，将它们放到白名单吧。）

![](http://www.smallbusinesscomputing.com/imagesvr_ce/5731/fig-1-easylist_1.jpg)

*图1:在Ad Blocker中添加其它过滤规则。*

Ad Blocker们不仅能屏蔽广告；它们还能屏蔽网站跟踪爬虫与恶意域名。要打开额外过滤规则，点击ad blocker图标 > 点击**首选项**，转至**过滤规则订阅**标签。点击按纽**添加订阅过滤规则**，然后加入**Easy Privacy + EasyList**规则。加入恶意域名过滤也是个不错的选择；它会屏蔽那些供恶意软件与间谍软件寄生的域名。Adblock可在Firefox, Chrome, Opera, Safari, IE, 以及Android平台下工作。

#### 2. [HTTPS Everywhere][5] ####

浏览器扩展HTTPS Everywhere可确保在网站HTTPS可用的时候，总是以HTTPS方式连接到站点。HTTPS意味着你的连接是以SSL（安全套接层）方式加密的，SSL协议通常用于加密网站与电子邮件连接。HTTPS Everywhere可在Firefox, Chrome, 及Opera下使用。

安装了HTTPS Everywhere之后，它会询问你是否希望启用SSL检测程序。点击“是”，因为SSL检测程序会提供额外保护，防止中间人攻击与虚假SSL证书攻击。HTTPS Everywhere可在Firefox, Chrome, Opera, Safari, IE, 以及Android平台下工作。

#### 3. [Social Fixer][6] ####

Social Fixer驯服Facebook。它给了你一把尚方宝剑，你可以用它过滤“动态汇总”，从而只看到你想看的动态、生成按主题分类的标签动态、隐藏不想查看的动态、鼠标悬停图片时显示完整尺寸的图片、禁止影院方式浏览图像，还有其它更多功能。

Social Fixer本身不是安全工具，但它具有两个重要的安全特性：

- 它可以将Facebook网页截图中你的个人资料头像以通用图标代替，并以虚假名字替代你的用户名，从而起到匿名作用。
- 它可以很可靠地屏蔽Facebook游戏，而Facebook游戏正是尽人皆知的麻烦制造者。

![](http://www.smallbusinesscomputing.com/imagesvr_ce/2858/fig-2-socialfixer_1.jpg)

*图2: 使用Social Fixer匿名化Facebook网面。*

（LCTT 译注：好吧，这个应用和我等无关~~）

#### 4. [Privacy Badger][7] ####

电子前线基金会出品的Privacy Badger是一款优秀的反跟踪与反间谍广告的拦截工具。现在的网页内容来源可谓五花八门：广告服务器、评论服务器、图片工场、第三方登陆服务器，以及其它种种不一而足。

AdBlock也能拦截这些乌七八糟的东西，不过Privacy Badger在此方面更胜一筹。Privacy Badger依靠算法与策略方法而非过滤规则，这样如果拦截出错的话，可以轻易重写，而过滤规则需要专人维护。Privacy Badger在Firefox与Chrome下均可工作。

![](http://www.smallbusinesscomputing.com/imagesvr_ce/9256/fig-3-privacybadger_1.jpg)

*图3: Privacy Badger拦截跟踪站点。*

Privacy Badger装好后就能使用了。点击图标，看看它对你浏览的网页都拦截了哪些东西。你可以试试访问Huffingtonpost.com，这是一家不在每一个页面塞满第三方组件誓不罢休的网站（图3）。

滑块显示每个站点的状态：红色表示该站点被彻底拦截，不能设置cookies（缓冲数据），或者向你提供任何内容。黄色意味着第三方域名正试图跟踪，但是它列于Privacy Badger的允许域名的白名单之中。绿色表示第三方目前还未归入跟踪者之列，但是在你访问**若干**网站之后，Privacy Badger会观察其行为，并决定是否将其归为跟踪者。

你也可以根据你的偏好来设置滑块；例如，在我访问的某个网站，我用Privacy Badger拦截了bazaarvoice.com，一些购物网站使用这家站点来托管他们的客户评论。

#### 5. [Disconnect][8] ####

Disconnect是另外一款反跟踪反cookie工具，拥有众多功能。它可在Firefox, Chrome, IE, Safari下工作，并且为iOS与Android平台打造了特殊的版本。Disconnect不但能反跟踪，而且它使用自己的虚拟专用网络（VPN），防止窃听与恶意广告，使你的无线传输（Wi-fi, 3G, 4G）更安全。它可以防止部件劫持，而部件劫持是攻击者用于在需要登陆的网站获得访问权限的技术。通过部件劫持，攻击者无需密码，而只要使用窃取的cookies，就能获得网站访问权限。

Disconnect还有安全搜索功能，可以阻止搜索引擎爱挖数据的癖好，你可以安心无虞地使用你中意的搜索引擎。

想象一下，网页上所有东西都腾空而出，奔你而去。当然这一切都是抽象的且在幕后悄然发生，不象有人正在猛击窗户试图进入你家那么明显罢了。但是，威胁倒是实实在在的，而且数不胜数，所以你必须采取预防措施，来保护自己。

本文作者 Carla Schroder 著有The Book of Audacity, Linux Cookbook, Linux Networking Cookbook等书，并撰写了上百篇Linux指南文章。她曾担任Linux Planet与Linux Today网站总编。

--------------------------------------------------------------------------------

via: http://www.smallbusinesscomputing.com/biztools/5-best-open-source-web-browser-security-apps.html

作者：[Carla Schroder][a]
译者：[yupmoon](https://github.com/yupmoon)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.smallbusinesscomputing.com/author/Carla-Schroder-6080.html
[1]:http://www.webopedia.com/TERM/M/malvertising.html
[2]:https://getadblock.com/
[3]:https://chrome.google.com/webstore/detail/adblock-pro/ocifcklkibdehekfnmflempfgjhbedch?hl=en-US
[4]:https://addons.mozilla.org/en-us/firefox/addon/adblock-edge/
[5]:https://www.eff.org/Https-everywhere
[6]:http://socialfixer.com/
[7]:https://www.eff.org/privacybadger
[8]:https://disconnect.me/
