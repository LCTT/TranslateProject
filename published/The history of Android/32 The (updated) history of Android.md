安卓编年史（32）：安卓 6.0 棉花糖（2）
=======================

#### 幕后变化

棉花糖对自棒棒糖引入的节电任务调度器 API 进行了扩展。任务调度器将应用后台进程从随意唤醒设备规整成一个有组织的系统。任务调度器基本上就是一个后台进程的交通警察。

在棉花糖中，谷歌还添加了一个 “Doze（休眠）”模式来在设备闲置的时候节约更多电量。如果设备静止不动，未接入电源，并且屏幕处于关闭状态，它会慢慢进入低功耗离线模式，锁定后台进程。在一段时间之后，网络连接会被禁用。唤醒会被锁定——应用会请求唤醒手机来运行后台进程——而它会被忽略。系统警报（不含用户设置的闹钟）以及[任务调度器][25]也会被关闭。

如果你曾经发现把设备设置为飞行模式，并且注意到电池续航延长了许多，Doze 就像是一个自动的飞行模式，在你手机不用的时候介入——它真的延长了电池续航。它对于整天或整夜放在桌子上的手机很有效，对于平板就更好了，因为它常常被遗忘在咖啡桌上。

唯一能把设备从 Doze 模式唤醒的来自谷歌云消息推送服务的“高优先级消息”。这是为信息服务准备的，所以即使设备处于休眠状态，也能够收取信息。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/inactive-apps.jpg)

“应用待机”是另一项或多或少有用的节电特性，它在后台静默运行。这背后的逻辑很简单：如果你和应用停止交互一段时间，安卓就认为它是不重要的，并取消它访问网络和后台进程的权力。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/battery-optimizations.jpg)

对于应用待机而言，和一个应用“交互”意味着打开一个应用，开始一项前台服务，或者生成一条通知。任何其中的一条操作就会重置该应用的待机计时器。对于每种其它边界情况，谷歌在设置里添加了一个名字意味模糊的“电池优化”界面。用户可以在这里设置应用白名单让它免疫应用待机。至于开发者，他们在开发者设置中有个“不活跃应用”选项可以手动设置应用到待机状态来测试。

应用待机主要是自动禁用你不用的应用，这是个对抗垃圾应用或被遗忘的应用消耗电量的好方法。因为它是完全静默且后台自动执行的，它还能让新手也能拥有一部精心调教过的设备。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/autobackup.jpg)

谷歌在过去几年尝试了很多应用备份方案，在棉花糖中它又[换了个方案][26]。棉花糖的暴力应用备份系统的目标是保存整个应用数据文件夹到云端。这是可能的并且在技术上是可行的，但即便是谷歌自己的应用对它的支持都不怎么好。设置好一部新安卓手机依然是个大麻烦，要处理无数的登录和弹出教程。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/BACKUP1.jpg)

到界面这里，棉花糖的备份系统使用了谷歌 Drive 应用。在谷歌 Drive 的设置中有一个“管理备份”界面，不仅会显示新备份系统的应用数据，还有谷歌过去几年尝试的其它应用备份方案的数据。

![安卓的应用关联设置，基本就是一个应用地址转发系统。 ](https://cdn.arstechnica.net/wp-content/uploads/2016/10/app-linkingf-980x576-980x576.jpg)

藏在设置里的还有一个新的“应用关联”功能，它可以将应用“链接”到网站。在应用关联出现之前，在全新安装的机器上打开一个谷歌地图链接通常会弹出一个“使用以下方式打开”的对话框，来获知你是想在浏览器还是在谷歌地图应用中打开这个链接。

这是个愚蠢的问题，因为你当然是想用应用而不是网站——这不就是你安装这个应用的原因嘛。应用关联让网站拥有者可以将他们的应用和网页相关联。如果用户安装了应用，安卓会跳过“使用以下方式打开”直接使用应用。要激活应用关联，开发者只需要在网站放一些安卓会识别的 json 代码。

应用关联对拥有指定客户端应用的站点来说很棒，比如谷歌地图、Instagram、Facebook。对于有 API 以及多种客户端的站点，比如 Twitter，应用关联界面让用户可以设置任意地址的默认关联应用。不过默认应用关联覆盖了百分之九十的用例，在新手机上大大减少了烦人的弹窗。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/adopt1.jpg)

可选存储是棉花糖的最佳特性之一。它将 SD 卡从一个二级存储池转换成一个完美的合并存储方案。插入 SD 卡，将它格式化，然后你就有了更多的存储空间，而这是你从来没有想过的事情。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/format1.jpg)

插入 SD 卡会弹出一条设置通知，用户可以选择将卡格式化成“外置”或“内置”存储。“内置”存储选项就是新的可选存储模式，它会将存储卡格式化为 ext4 文件系统。唯一的缺点？那就是存储卡和数据都被“锁定”到你的手机上了。如果不格式化的话，你没法取出存储卡茶道其它地方使用。谷歌对于内置存储的使用场景判断就是一旦设置就不再更改。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/removingisbad.jpg)

如果你强行拔出了 SD 卡，安卓会尽它最大的努力处理好。它会弹出一条消息“建议最好将 SD 卡插回”和一个“忘记”这张卡的选项。当然“忘记”这张卡将会导致各种数据丢失，建议最好不要这么做。

不幸的是实际上可以使用可选存储的设备很长时间都没有出现。Nexus 设备不支持存储卡，所以为了测试我们插上了一个 U 盘作为我们的可选存储。OEM 厂商最初抵制这项功能，[LG 和三星][27]都在他们 2016 年初的旗舰机上禁用了它。三星说“我们相信我们的用户需要 microSD 卡是用来在手机和其它设备之间转移数据的”，一旦卡被格式化成 ext4 这就不可能了。

谷歌的实现让用户可以在外置和内置存储选项之间选择。但 OEM 厂商完全拿掉了内置存储功能，不给用户选择的机会。高级用户们对此很不高兴，并且安卓定制组们很快就重启启用了可选存储。在 Galaxy S7 上，第三方定制组甚至在官方发布的[的前一天][28]解除了三星的 SD 卡锁定。

#### 音量和通知

![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/1-2-1440x1454.jpg)

为了更简洁的设计，谷歌将通知优先级控制从音量弹窗中移除了。按下音量键会弹出一个单独的滑动条，对应当前音源控制，还有一个下拉按钮可以展开控制面板，显示所有的三个声音控制条：通知，媒体和闹钟。所有的通知优先级控制还在——它们现在在一个“勿扰模式”的快速设置方块中。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/dnd1.jpg)

通知控制最有用的新功能之一是允许用户控制抬头通知——现在叫“预览”通知。这项功能让通知在屏幕顶部弹出，就像 iOS 那样。谷歌认为最重要的通知应该提升到高于你普通日常通知的地位。

![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/2015-09-13-05.13.49.png)

但是，在棒棒糖中，这项特性引入的时候，谷歌糟糕地让开发者来决定他们的应用是否“重要”。毫无疑问，所有开发者都认为他的应用是世界上最重要的东西。所以尽管最初这项特性是为你亲密联系人的即时消息设计的，最后变成了被 Facebook 的点赞通知所操控。在棉花糖中，每个应用在通知设置都有一个“设置为优先”复选框，给了用户一把大锤来收拾不守规矩的应用。

--------------------------------------------------------------------------------

作者简介：

Ron 是 Ars Technica 的评论编缉，专注于安卓系统和谷歌产品。他总是在追寻新鲜事物，还喜欢拆解事物看看它们到底是怎么运作的。

--------------------------------------------------------------------------------

via: http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/

作者：[RON AMADEO][a]
译者：[alim0x](https://github.com/alim0x)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://arstechnica.com/author/ronamadeo
[1]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[2]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[3]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[4]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[5]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[6]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[7]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[8]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[9]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[10]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[11]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[12]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[13]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[14]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[15]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[16]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[17]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[18]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[19]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[20]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[21]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[22]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[23]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[24]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/#
[25]:http://arstechnica.com/gadgets/2014/11/android-5-0-lollipop-thoroughly-reviewed/6/#h2
[26]:http://arstechnica.com/gadgets/2015/10/android-6-0-marshmallow-thoroughly-reviewed/6/#h2
[27]:http://arstechnica.com/gadgets/2016/02/the-lg-g5-and-galaxy-s7-wont-support-android-6-0s-adoptable-storage/
[28]:http://www.androidpolice.com/2016/03/10/modaco-manages-to-get-adoptable-sd-card-storage-working-on-the-galaxy-s7-and-galaxy-s7-edge-no-root-required/
