[#]: collector: (lujun9972)
[#]: translator: (LuuMing)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10677-1.html)
[#]: subject: (My Google-free Android life)
[#]: via: (https://lushka.al/my-android-setup/)
[#]: author: (Anxhelo Lushka https://lushka.al/)

我的去 Google 化的安卓之旅
======
> 一篇介绍如何在你的生活中和设备里去 Google 化的文章。

最近人们经常问我有关我手机的事情，比如安卓怎么安装，怎样绕过 Google Service 使用手机。好吧，这篇文章就来详细的解决那些问题。我尽可能让这篇文章适合初学者，因此我会慢慢介绍，一个一个来讲并且附上截图，你就能更好地看到它是怎样运作的。

首先我会告诉你为什么 Google Services（在我看来）对你的设备不好。我可以一言以概之，并让你看 [Richard Stallman][2] 写的这篇[文章][1]，但我决定抓住几个要点附在这。

  * 要用<ruby>非自由软件<rt>Nonfree software</rt></ruby>
    * 大体上，大多数 Google Services 需要运行在非自由的 Javascript 代码之上。现如今，如果禁用掉 Javascript，什么都没有了，甚至 Google 帐号都需要运行非自由软件（由站点发送的 JavaScript），对于登录也是。
  * 被监视
    * Google 悄悄地把它的<ruby>广告跟踪方式<rt>ad-tracking profiles</rt></ruby>与浏览方式结合在一起，并存储了每个用户的大量数据。
  * 服务条款
    * Google 会终止转卖了 Pixel 手机的用户账户。他们无法访问帐户下保存在 Google Services 中的所有邮件和文档。
  * 审查
    * Amazon 和 Google 切断了<ruby>域前置<rt>domain-fronting</rt></ruby>，该技术能使身处某些国家的人们访问到在那里禁止的通信系统。
    * Google 已经同意为巴基斯坦政府执行特殊的 Youtube 审查，删除对立观点。这将有助于压制异议。
    * Youtube 的“content ID”会自动删除已发布的视频，这并不包含在版权法中。

这只是几个原因，你可以阅读上面我提到的 RMS 的文章，他详细解释了这几点。尽管听起来骇人听闻，但这些行为在现实生活中已经每天在发生。

### 下一步，我的搭建教程

我有一款[小米红米 Note 5 Pro][3] 智能手机（代号 whyred），生产于中国的[小米][4]。它是 4 个月之前（距写这篇文章的时候）我花了大约 185 欧元买的。

现在你也许会想，“但你为什么买中国品牌，他们不可靠”。是的，它不是通常你所期望的（品牌）所生产的，例如三星（人们通常会将它和安卓联系在一起，这显然是错的）、一加、诺基亚等。但你应当知道几乎所有的手机都生产于中国。

我选择这款手机有几个原因，首先当然是价格。它是一款<ruby>性价比<rt>budget-friendly</rt></ruby>相当高的产品，大多数人都能买得起。下一个原因是说明书上的规格（不仅仅是），在这个<ruby>价位<rt>price tag</rt></ruby>上相当合适。拥有 6 英尺屏幕（<ruby>全高清分辨率<rt>Full HD resolution</rt></ruby>），4000 毫安电池（一流的电池寿命），4GB RAM，64GB 存储，双后摄像头（12 MP + 5 MP），一个带闪光灯的前摄像头（13 MP）和一个高性能的<ruby>骁龙<rt>Snapdragon</rt></ruby> 636，它可能是那时候最好的选择。

随之而来的问题是 [MIUI][5]，大多数小米设备所附带的安卓外壳（除了 Android One 项目设备）。是的，它没有那么可怕，它有一些额外的功能，但问题在更深的地方。小米设备如此便宜（据我所知销售利润仅有 5-10%）的一个原因是**他们在系统里伴随 MIUI 添加了数据挖掘和广告**。这样的话，系统应用需要额外不必要的权限来获取你的数据并且进行广告轰炸，从中获取利润。

更有趣的是，所包含的“天气”应用想要访问我的联系人并且拨打电话，如果它仅是显示天气的话为什么需要访问联系人呢。另一个例子是“录音机”应用，它也需要联系人和网络权限，可能想把录音发送回小米。

为了解决它，我不得不格式化手机并且摆脱 MIUI。在市场上近来的手机上这就变得极为艰难。

格式化手机的想法很简单，删除掉现有的系统然后安装一个新的喜欢的系统（这次是原生安卓）。为了实现它，你先得解锁 [bootloader][6]。

> bootloader 是一个在计算机完成自检后为其加载操作系统或者运行环境的计算机程序。—[维基百科][7]

问题是小米关于解锁 bootloader 有明确的政策。几个月之前，流程就像这样：你需向小米[申请][8]解锁代码，并提供真实的原因，但不是每次都成功，因为他们可以拒绝你的请求并且不提供理由。

现在，流程变了。你要从小米那下载一个软件，叫做 [Mi Unlock][9]，在 Windows 电脑上安装它，在手机的[开发者模式中打开调试选项][10]，重启到 bootloader 模式（关机状态下长按向下音量键 + 电源键）并将手机连接到电脑上，开始一个叫做“许可”的流程。这个过程会在小米的服务器上启动一个定时器，允许你**在 15 天之后解锁手机**（在一些少数情况下或者一个月，完全随机）。

![Mi Unlock app][11]

15 天过去后，重新连接手机并重复之前的步骤，这时候按下解锁键，你的 bootloader 就会解锁，并且能够安装其他 ROM（系统）。**注意，确保你已经备份好了数据，因为解锁 bootloader 会清空手机。**

下一步就是找一个兼容的系统（[ROM][12]）。我在 [XDA 开发者论坛上][13]找了个遍，它是 Android 开发者和用户们交流想法、应用等东西的地方。幸运的是，我的手机相当流行，因此论坛上有它[专门的版块][14]。在那儿，我略过一些流行的 ROM 并决定使用 [AOSiP ROM][15]。（AOSiP 代表<ruby>安卓开源 illusion 项目<rt>Android Open Source illusion Project</rt></ruby>）

> **校订**：有人发邮件告诉我说文章里写的就是[/e/][16]的目的与所做的事情。我想说谢谢你的帮助，但完全不是这样。我关于 /e/ 的看法背后的原因可以见此[网站][17]，但我仍会在此列出一些原因。

> eelo 是一个从 Kickstarter 和 IndieGoGo 上集资并超过 200K € 的“基金会”，承诺创造一个开放、安全且保护隐私的移动 OS 和网页服务器。

>  1. 他们的 OS 基于 LineageOS 14.1 (Android 7.1) 且搭载 microG 和其他开源应用，此系统已经存在很长一段时间了并且现在叫做 [Lineage for microG][18]。
>  2. 所有的应用程序并非从源代码构建，而是从 [APKPure][19] 上下载安装包并推送进 ROM，不知道那些安装包中是否包含<ruby>专有代码<rt>proprietary code</rt></ruby>或<ruby>恶意软件<rt>malware</rt></ruby>。
>  3. 有一段时间，它们就那样随意地从代码中删除 Lineage 的<ruby>版权标头<rt>copyright header</rt></ruby>并加入自己的。
>  4. 他们喜欢删除负面反馈并且监视用户 Telegram 群聊中的舆论。

> 总而言之，我**不建议使用 /e/** ROM。（至少现在）

另一件你有可能要做的事情是获取手机的 [root 权限][20]，让它真正的成为你的手机，并且修改系统中的文件，例如使用系统范围的 adblocker 等。为了实现它，我决定使用 [Magisk][21]，一个天赐的应用，它由一个学生开发，可以帮你获取设备的 root 权限并安装一种叫做[模块][22]的东西，基本上是软件。

下载 ROM 和 Magisk 之后，我得在手机上安装它们。为了完成安装，我将文件移动到了 SD 卡上。现在，若要安装系统，我需要使用 [恢复系统][23]。我用的是较为普遍的 [TWRP][24]（代表 TeamWin Recovery Project）。

要安装恢复系统（听起来有点难，我知道），我需要将文件[烧录][20]进手机。为了完成烧录，我将手机用一个叫做 [ADB 的工具][25]连接上电脑（Fedora Linux 系统）。使用命令让自己定制的恢复系统覆盖掉原先的。

```
fastboot flash recovery twrp.img
```

完成之后，我关掉手机并按住音量上和电源键，直到 TWRP 界面显示。这意味着我进行顺利，并且它已经准备好接收我的指令。

![TWRP screen][26]

下一步是**发送擦除命令**，在你第一次为手机安装自定义 ROM 时是必要的。如上图所示，擦除命令会清除掉<ruby>数据<rt>Data</rt></ruby>，<ruby>缓存<rt>Cache</rt></ruby>和 Dalvik 。（这里也有高级选项让我们可以勾选以删除掉系统，如果我们不再需要旧系统的话）

这需要几分钟去完成，之后，你的手机基本上就干净了。现在是时候**安装系统了**。通过按下主屏幕上的安装按钮，我们选择之前添加进的 zip 文件（ROM 文件）并滑动屏幕安装它。下一步，我们需要安装 Magisk，它可以给我们访问设备的 root 权限。 

> **校订**：一些有经验的安卓用户或发烧友也许注意到了，手机上不包含 [GApps]（谷歌应用）。这在安卓世界里称之为 GApps-less，一个 GAps 应用也不安装。

> 注意有一个不好之处在于若不安装 Google Services 有的应用无法正常工作，例如它们的通知也许会花更长的时间到达或者根本不起作用。（对我来说这一点是最影响应用程序使用的）原因是这些应用使用了 [Google Cloud Messaging][28]（现在叫做 [Firebase][29]）唤醒手机并推送通知。

> 你可以通过安装使用 [microG][30]（部分地）解决它，microG 提供一些 Google Services 的特性且允许你拥有更多的控制。我不建议使用它，因为它仍然有助于 Google Services 并且你不一定信任它。但是，如果你没法<ruby>立刻放弃使用<rt>go cold turkey on it</rt><ruby>，只想慢慢地退出谷歌，这便是一个好的开始。

都成功地安装之后，现在我们重启手机，就进入了主屏幕。

### 下一个部分，安装应用并配置一切

事情开始变得简单了。为了安装应用，我使用了 [F-Droid][31]，一个可替代的应用商店，里面**只包含自由及开源应用**。如果这里没有你要的应用，你可以使用 [Aurora Store][32]，一个从应用商店里下载应用且不需要使用谷歌帐号或被追踪的客户端。

F-Droid 里面有名为 repos 的东西，它是一个包含你可以安装应用的“仓库”。我使用默认的仓库，并从 [IzzyOnDroid][33] 添加了另一个，它有更多默认仓库中没有的应用，并且它更新地更频繁。

![My repos][34]

从下面你可以发现我所安装的应用清单，它们替代的应用与用途。

- [AdAway](https://f-droid.org/en/packages/org.adaway) > 系统广告拦截器，使用 hosts 文件拦截所有的广告
- [AfWall+](https://f-droid.org/en/packages/dev.ukanth.ufirewall) > 一个防火墙，可以阻止不想要的连接
- [Amaze](https://f-droid.org/en/packages/com.amaze.filemanager) > 替代系统的文件管理器，允许文件的 root 访问权限，并且拥有 zip/unzip 功能
- [Ameixa](https://f-droid.org/en/packages/org.xphnx.ameixa) > 大多数应用的图标包
- [andOTP](https://f-droid.org/en/packages/org.shadowice.flocke.andotp) > 替代谷歌验证器/Authy，一个可以用来登录启用了<ruby>双因子验证<rt>2FA</rt></ruby>的网站账户的 TOTP 应用，可以使用 PIN 码备份和锁定
- [AnySoftKeyboard/AOSP Keyboard](https://f-droid.org/packages/com.menny.android.anysoftkeyboard/) > 开源键盘，它有许多主题和语言包，我也是该[项目](https://anysoftkeyboard.github.io/)的一员
- [Audio Recorder](https://f-droid.org/en/packages/com.github.axet.audiorecorder) > 如其名字，允许你从麦克风录制不同格式的音频文件
- [Battery Charge Limit](https://f-droid.org/en/packages/com.slash.batterychargelimit) > 当到 80% 时自动停止充电，降低<ruby>电池磨损<rt>battery wear</rt></ruby>并增加寿命
- [DAVx5](https://f-droid.org/en/packages/at.bitfire.davdroid) > 这是我最常用的应用之一，对我来说它基本上替代了谷歌联系人、谷歌日历和谷歌 Tasks，它连接着我的 Nextcloud 环境可以让我完全控制自己的数据
- [Document Viewer](https://f-droid.org/en/packages/org.sufficientlysecure.viewer) > 一个可以打开数百种文件格式的查看器应用，快速、轻量
- [Deezloader Remix](https://gitlab.com/Nick80835/DeezLoader-Android/) > 让我可以在 Deezer 上下载高质量 MP3 的应用
- [Easy xkcd](https://f-droid.org/en/packages/de.tap.easy_xkcd) > xkcd 漫画阅读器，我喜欢这些 xkcd 漫画
- [Etar](https://f-droid.org/en/packages/ws.xsoh.etar) > 日历应用，替代谷歌日历，与 DAVx5 一同工作
- [FastHub-Libre](https://f-droid.org/en/packages/com.fastaccess.github.libre) > 一个 GitHub 客户端，完全 FOSS（自由及开源软件），非常实用如果你像我一样喜欢使用 Github 的话
- [Fennec F-Droid](https://f-droid.org/en/packages/org.mozilla.fennec_fdroid) > 替代谷歌 Chrome 和其他类似的应用，一个为 F-Droid 打造的火狐浏览器，不含专有二进制代码并允许安装扩展提升浏览体验
- [Gadgetbridge](https://f-droid.org/en/packages/nodomain.freeyourgadget.gadgetbridge) > 替代小米运动，可以用来配对小米硬件的应用，追踪你的健康、步数、睡眠等。
- [K-9 Mail](https://f-droid.org/en/packages/com.fsck.k9) > 邮件客户端，替代 GMail 应用，可定制并可以添加多个账户
- [Lawnchair](https://f-droid.org/en/packages/ch.deletescape.lawnchair.plah) > 启动器，可以替代 Nova Launcher 或 Pixel Launcher，允许自定义和各种改变，也支持图标包
- [Mattermost](https://f-droid.org/en/packages/com.mattermost.mattermost) > 可以连接 Mattermost 服务器的应用。Mattermost 是一个 Slack 替代品
- [NewPipe](https://f-droid.org/en/packages/org.schabi.newpipe) > 最好的 YouTube 客户端（我认为），可以替代 YoubTube，它完全是 FOSS，免除 YouTube 广告，占用更少空间，允许背景播放，允许下载视频/音频等。试一试吧
- [Nextcloud SMS](https://f-droid.org/en/packages/fr.unix_experience.owncloud_sms) > 允许备份/同步 SMS 到我的 Nextcloud 环境
- [Nextcloud Notes](https://f-droid.org/en/packages/it.niedermann.owncloud.notes) > 允许我创建，修改，删除，分享笔记并同步/备份到 Nextcloud 环境
- [OpenTasks](https://f-droid.org/en/packages/org.dmfs.tasks) > 允许我创建、修改、删除任务并同步到我的 Nextcloud 环境
- [OsmAnd~](https://f-droid.org/en/packages/net.osmand.plus) > 一个地图应用，使用 [OpenStreetMap](https://openstreetmap.org/)，允许下载离线地图和导航
- [QKSMS](https://f-droid.org/en/packages/com.moez.QKSMS) > 我最喜欢的短信应用，可以替代原来的 Messaging 应用，拥有漂亮的界面，拥有备份、个性化、延迟发送等特性。
- [Resplash/Mysplash](https://f-droid.org/en/packages/com.wangdaye.mysplash) > 允许你无限地从 [Unsplash](https://unsplash.com/) 下载无数的漂亮壁纸，全都可以免费使用和修改。
- [ScreenCam](https://f-droid.org/en/packages/com.orpheusdroid.screenrecorder) > 一个录屏工具，允许各样的自定义和录制模式，没有广告并且免费
- [SecScanQR](https://f-droid.org/en/packages/de.t_dankworth.secscanqr) > 二维码识别应用，快速轻量
- [Send Reduced Free](https://f-droid.org/en/packages/mobi.omegacentauri.SendReduced) > 这个应用可以在发送之前通过移除 PII（<ruby>个人识别信息<rt>personally identifiable information</rt></ruby>）和减小尺寸，让你立即分享大图
- [Slide](https://f-droid.org/en/packages/me.ccrama.redditslide/) > 开源 Reddit 客户端
- [Telegram FOSS](https://f-droid.org/en/packages/org.telegram.messenger) > 没有追踪和 Google Services 的纯净版 Telegram 安卓客户端
- [TrebleShot](https://f-droid.org/en/packages/com.genonbeta.TrebleShot) > 这个天才般的应用可以让你通过 WIFI 分享文件给其它设备，真的超快，甚至无需连接网络
- [Tusky](https://f-droid.org/en/packages/com.keylesspalace.tusky) > Tusky 是 [Mastodon](https://joinmastodon.org/) 平台的客户端（替代 Twitter）
- [Unit Converter Ultimate](https://f-droid.org/en/packages/com.physphil.android.unitconverterultimate) > 这款应用可以一键在 200 种单位之间来回转换，非常快并且完全离线
- [Vinyl Music Player](https://f-droid.org/en/packages/com.poupa.vinylmusicplayer) > 我首选的音乐播放器，可以替代谷歌音乐播放器或其他你已经安装的音乐播放器，它有漂亮的界面和许多特性
- [VPN Hotspot](https://f-droid.org/en/packages/be.mygod.vpnhotspot) > 这款应用可以让我打开热点的时候分享 VPN，因此我可以在笔记本上什么都不用做就可以安全地浏览网页

这些差不多就是我列出的一张**最实用的 F-Droid 应用**清单，但不巧，这些并不是所有应用。我使用的专有应用如下（我知道，我也许听起来是一个伪君子，但并不是所有的应用都可以替代，至少现在不是）：

  * Google Camera（与 Camera API 2 结合起来，需要 F-Droid 的基本的 microG 才能工作）
  * Instagram
  * MyVodafoneAL （运营商应用）
  * ProtonMail （email 应用）
  * Titanium Backup（备份应用数据，wifi 密码，通话记录等）
  * WhatsApp （专有的端到端聊天应用，几乎我认识的所有人都有它）

差不多就是这样，这就是我用的手机上所有的应用。**配置非常简单明了，我可以给几点提示**。

  1. 仔细阅读和检查应用的权限，不要无脑地点“安装”。
  2. 尽可能多地使用开源应用，它们即尊重你的隐私又是免费的（且自由）。
  3. 尽可能地使用 VPN，找一个有名气的，别用免费的，否则你将被收割数据然后成为产品。
  4. 不要一直打开 WIFI/移动数据/定位，有可能引起安全隐患。
  5. 不要只依赖指纹解锁，或者尽可能只用 PIN/密码/模式解锁，因为生物数据可以被克隆后针对你，例如解锁你的手机盗取你的数据。

作为坚持读到这儿的奖励，**一张主屏幕的截图奉上**

![Screenshot][35]

--------------------------------------------------------------------------------

via: https://lushka.al/my-android-setup/

作者：[Anxhelo Lushka][a]
选题：[lujun9972][b]
译者：[LuuMing](https://github.com/luuming)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://lushka.al/
[b]: https://github.com/lujun9972
[1]: https://stallman.org/google.html
[2]: https://en.wikipedia.org/wiki/Richard_Stallman
[3]: https://www.gsmarena.com/xiaomi_redmi_note_5_pro-8893.php
[4]: https://en.wikipedia.org/wiki/Xiaomi
[5]: https://en.wikipedia.org/wiki/MIUI
[6]: https://forum.xda-developers.com/wiki/Bootloader
[7]: https://en.wikipedia.org/wiki/Booting
[8]: https://en.miui.com/unlock/
[9]: http://www.miui.com/unlock/apply.php
[10]: https://www.youtube.com/watch?v=7zhEsJlivFA
[11]: https://lushka.al//assets/img/posts/mi-unlock.png
[12]: https://www.xda-developers.com/what-is-custom-rom-android/
[13]: https://forum.xda-developers.com/
[14]: https://forum.xda-developers.com/redmi-note-5-pro
[15]: https://forum.xda-developers.com/redmi-note-5-pro/development/rom-aosip-8-1-t3804473
[16]: https://e.foundation
[17]: https://ewwlo.xyz/evil
[18]: https://lineage.microg.org/
[19]: https://apkpure.com/
[20]: https://lifehacker.com/5789397/the-always-up-to-date-guide-to-rooting-any-android-phone
[21]: https://forum.xda-developers.com/apps/magisk/official-magisk-v7-universal-systemless-t3473445
[22]: https://forum.xda-developers.com/apps/magisk
[23]: http://www.smartmobilephonesolutions.com/content/android-system-recovery
[24]: https://dl.twrp.me/whyred/
[25]: https://developer.android.com/studio/command-line/adb
[26]: https://lushka.al//assets/img/posts/android-twrp.png
[27]: https://opengapps.org/
[28]: https://developers.google.com/cloud-messaging/
[29]: https://firebase.google.com/docs/cloud-messaging/
[30]: https://microg.org/
[31]: https://f-droid.org/
[32]: https://f-droid.org/en/packages/com.dragons.aurora/
[33]: https://android.izzysoft.de/repo
[34]: https://lushka.al//assets/img/posts/android-fdroid-repos.jpg
[35]: https://lushka.al//assets/img/posts/android-screenshot.jpg
[36]: https://creativecommons.org/licenses/by-nc-sa/4.0/
