安卓编年史（31）：安卓 6.0 棉花糖
==============

### 安卓 6.0 棉花糖

2015 年 10 月，谷歌给世界带来了安卓 6.0 棉花糖。配合这个版本的发布，谷歌委托生产了两部新的 Nexus 设备：[华为 Nexus 6P 和 LG Nexus 5X][39]。除了常规的性能升级，新手机还带有一套关键硬件：为棉花糖的新指纹 API 准备的指纹识别器。棉花糖还引入了一个疯狂的全新搜索特性，被称作“Google Now on Tap”，用户控制的应用权限，一个全新的数据备份系统，以及许多其它的改良。

![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/32-1-1440x1466.jpg)

#### 新谷歌应用

棉花糖是[谷歌大标志重新设计][40]后的第一个安卓版本。系统也随之升级，主要是一个新的谷歌应用，给搜索小部件，搜索页面以及应用图标添加了一个多彩的标志。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/app-drawer.jpg)

谷歌将应用抽屉从页面导航的横向布局还原回了单页竖直滚动表的形式。早期版本的安卓用的都是竖直滚动表的形式，直到谷歌在蜂巢中改成了横向页面系统。滚动单页面让人更容易从很多应用中找到目标。一项“快速滚动”的特性同样好用，它可以让你拖动滚动条来激活字母索引。新的应用抽屉布局也用到了小部件抽屉上。考虑到旧系统中小部件轻松就超过了 15 页，这是个大改进。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/2015-10-01-19.01.201.png)

棉花糖应用抽屉顶部的“建议应用”栏也让查找应用变得更快。该栏显示的内容一直在变化，试图在你需要的时候为你提供你需要的应用。它使用了算法来统计应用使用，经常一起打开的应用以及每天的打开次数。

#### Google Now on Tap——一个没有完美实现的特性

![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/ontap.jpg)

棉花糖的头等新特性之一就是“Google Now on Tap”。有了 Now on Tap，你可以在安卓的任意界面长按 home 键，安卓会将整个屏幕发送给谷歌进行处理。谷歌会试着分析页面上的内容，并从屏幕底部弹出显示一个特殊的搜索结果列表。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/onta3p.jpg)

Now on Tap 产生的结果不是通常的 10 个蓝色链接——即便那必定有一个通往谷歌搜索的链接。Now on Tap 还可以深度连接到其它使用了谷歌的应用索引功能的应用。他们的想法是你可以在 Youtube 音乐视频那里唤出 Now on tap，然后获得一个到谷歌 Play 或亚马逊“购买”页面的链接。在演员新闻文章处唤出 Now on Tap 可以链接到 IMDb 应用中该演员的页面上。

![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/assist-api-980x576.jpg)

谷歌没有让这成为私有特性，而是给安卓创建了一个全新的“Assistant API（助理 API）”。用户可以挑选一个“助理应用”，它可以在长按 home 键的时候获取很多信息。助理应用会获取所有由当前应用加载的数据——不仅是直接从屏幕获取到的——连同所有这些图片还有任何开发者想要包含的元数据。这个 API 驱动了谷歌 Now on Tap，如果愿意的话，它还允许第三方打造 Now on Tap 的竞争对手。

谷歌在棉花糖的发布会上炒作了 Now on Tap，但实际上，这项特性不是很实用。谷歌搜索的价值在于你可以问它准确的问题——你输入你想要的内容，它搜索整个互联网寻找答案或网页。Now on Tap 让事情变得无限困难，因为它甚至不知道你要问的是什么。你带着特定意图打开了 Now on Tap，但你发送给谷歌的查询是很不准确的“屏幕上的所有内容”。谷歌需要猜测你查询的内容然后试着基于它给出有用的结果或操作。

在这背后，谷歌可能在疯狂处理整个页面文字和图片来强行获得你想要的结果。但往往 Now on Tap 给出的结果像是页面每个合适的名词的搜索结果列表。从结果列表中筛选多个查询就像是陷入必应的“[搜索结果过载][41]”广告里那样的情形。查询目标的缺失让 Now on Tap 感觉像是让谷歌给你读心，而它永远做不到。谷歌最终给文本选中菜单打了补丁，添加了一个“助理”按钮，给 Now on Tap 提供一些它极度需要的搜索目标。

不得不说 Now on Tap 是个失败的产物。Now on Tap 的快捷方式——长按 home 键——基本上让它成为了一个隐藏，难以发现的特性，很容易就被遗忘了。我们推测这个特性的使用率非常低。即便用户发现了 Now on Tap，它经常没法读取你的想法，在几次尝试之后，大多数用户可能会选择放弃。

随着 2016 年 Google Pixels 的发布，谷歌似乎承认了失败。它把 Now on Tap 改名成了“屏幕搜索”并把它降级成了谷歌助手的支援。谷歌助理——谷歌的新语音命令系统——接管了 Now on Tap 的 home 键手势并将它关联到了语音系统激活后的二次手势。谷歌似乎还从 Now on Tap 差劲的可发现性中学到了教训。谷歌给助理给 home 键添加了一组带动画的彩点，帮助用户发现并记住这个特性。

#### 权限

![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/33-1-1440x1454.jpg)

安卓 6.0 终于引入了应用权限系统，让用户可以细粒度地控制应用可以访问的数据。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/perm.jpg)

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/denied-1.jpg)

应用在安装的时候不再给你一份长长的权限列表。在棉花糖中，应用安装根本不询问任何权限。当应用需要一个权限的时候——比如访问你的位置、摄像头、麦克风，或联系人列表的时候——它们会在需要用到的时候询问。在你使用应用的时候，如果需要新权限时会弹出一个“允许或拒绝”的对话框。一些应用的设置流程这么处理：在启动的时候询问获取一些关键权限，其它的等到需要用到的时候再弹出提示。这样更好地与用户沟通了需要权限是为了做什么——应用需要摄像头权限，因为你刚刚点击了摄像头按钮。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/apps.jpg)

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/system-permisions.jpg)

除了及时的“允许或拒绝”对话框，棉花糖还添加了一个权限设置界面。这个复选框大列表让数据敏感用户可以浏览应用拥有的权限。他们不仅可以通过应用来查询，也可以通过权限来查询。举个例子，你可以查看所有拥有访问麦克风权限的应用。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/warning.jpg)

谷歌试验应用权限已经有一段时间了，这些设置界面基本就是隐藏的“[App Ops][42]”系统的重生，它是在安卓 4.3 中不小心引入并很快被移除的权限管理系统。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/Google_IO_2015_-_Android_M_Permissions_-_YouTube_-_Google_Chrome_2015-09-04_12-31-49.jpg)

尽管谷歌在之前版本就试验过了，棉花糖的权限系统最大的不同是它代表了一个向权限系统的有序过渡。安卓 4.3 的 App Ops 从没有计划暴露给用户，所以开发者不了解它。在 4.3 中拒绝一个应用需要的一个权限经常导致奇怪的错误信息或一个彻底的崩溃。棉花糖的系统对开发者是缺省的——新的权限系统只适用于针对棉花糖 SDK 开发的应用，谷歌将它作为开发者已经为权限处理做好准备的信号。权限系统还允许在一项功能由于权限被拒绝无法正常工作时与用户进行沟通。应用会被告知它们的权限请求被拒绝，它们可以指导用户在需要该功能的时候去打开该权限访问。

#### 指纹 API

![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/finger1.jpg)

![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/fingerlock.jpg)

在棉花糖出现之前，少数厂商推出了他们自己的指纹解决方案以作为对[苹果的 Touch ID][43] 的回应。但在棉花糖中，谷歌终于带来了生态级别的指纹识别 API。新系统包含了指纹注册界面，指纹验证锁屏以及允许应用将内容保护在一个指纹扫描或锁屏验证之后的 API。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/fingerprintplaystore.jpg)

Play 商店是最先支持该 API 的应用之一。你可以使用你的指纹来购买应用，而不用输入你的密码。Nexus 5X 和 6P 是最先支持指纹 API 的手机，手机背面带有指纹读取硬件。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/2015-09-04_16-38-31.png)

指纹 API 推出不久后时间，是罕见的安卓生态合作例子之一。所有带有指纹识别的手机都使用谷歌的 API，并且大多数银行和购物应用都很好地支持了它。

--------------------------------------------------------------------------------

作者简介：

Ron 是 Ars Technica 的评论编缉，专注于安卓系统和谷歌产品。他总是在追寻新鲜事物，还喜欢拆解事物看看它们到底是怎么运作的。

--------------------------------------------------------------------------------

via: http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/

作者：[RON AMADEO][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://arstechnica.com/author/ronamadeo
[1]:https://www.youtube.com/watch?v=f17qe9vZ8RM
[2]:https://www.youtube.com/watch?v=VOn7VrTRlA4&list=PLOU2XLYxmsIJDPXCTt5TLDu67271PruEk&index=11
[3]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[4]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[5]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[6]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[7]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[8]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[9]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[10]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[11]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[12]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[13]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[14]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[15]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[16]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[17]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[18]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[19]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[20]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[21]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[22]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[23]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[24]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[25]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[26]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[27]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[28]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[29]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[30]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[31]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[32]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[33]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[34]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[35]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[36]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[37]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[38]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/31/#
[39]:http://arstechnica.com/gadgets/2015/10/nexus-5x-and-nexus-6p-review-the-true-flagships-of-the-android-ecosystem/
[40]:http://arstechnica.com/gadgets/2015/09/google-gets-a-new-logo/
[41]:https://www.youtube.com/watch?v=9yfMVbaehOE
[42]:http://www.androidpolice.com/2013/07/25/app-ops-android-4-3s-hidden-app-permission-manager-control-permissions-for-individual-apps/
[43]:http://arstechnica.com/apple/2014/09/ios-8-thoroughly-reviewed/10/#h3
