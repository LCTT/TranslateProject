[#]: subject: "5 De-Googled Android-based Operating Systems to Free Your Smartphone from Google and other Big Tech"
[#]: via: "https://itsfoss.com/android-distributions-roms/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14047-1.html"

5 个去谷歌化的安卓操作系统
======

![](https://img.linux.net.cn/data/attachment/album/202112/04/143224d46wb5bqsw7xbsw7.jpg)

> 让你的智能手机摆脱谷歌和其他科技巨头。

随着谷歌和 Facebook 等广告巨头对你的个人和私密设备（如手机和平板电脑）的监控不断增加，现在是时候处理这个问题了。

最有效的方法之一是安装注重隐私/安全的安卓 ROM。

你可能想知道，为什么要在你的手机上安装一个与预装系统不同的、基于安卓的操作系统。让我给你几个理由：

  * 你的 [手机制造商与 Facebook 等实体合作，在你的手机上预装了各种应用程序][1]，仅仅是卸载这些应用程序可能无法摆脱它们（当操作系统有新的更新时，它们往往会被重新安装）。
  * 通常，安卓设备制造商会提供三到四年的更新。其中大部分仅限于各种奇怪的安全补丁，以及一些安卓系统的升级。使用定制 ROM，你可以通过接收更多更新来延长设备的使用寿命。
  * 由于这些现成的安卓 ROM 除了必要的东西外没有捆绑任何东西，你的手机不会太臃肿，反应更敏捷。
  * 较少的预装软件也意味着在后台运行的服务较少，从而可提升性能并延长电池使用时间。
  * 大量的定制选项。
  * 容易回滚更新（因为以前的版本在 ROM 的网站上可以找到）。

> **警告**
>
> 如果你决定在实际设备上使用这些操作系统之一，请小心。在你的设备上刷入任何第三方 ROM 将使其保修失效，如果操作不当，甚至可能使你的设备失去作用。安装定制的 ROM 也需要一定的专业知识，即使如此，你也可能遇到问题，特别是如果你选择的操作系统不支持该设备。对你的设备造成的任何损害，我们概不负责。

参考了上述重要信息之后，如果你仍想进行实验，我们建议你始终在备用设备上进行尝试。

除此之外，你还应该记住以下几点：

- 安装自定义的安卓 ROM 可以增强开箱即用的安全性。但是，你必须确保自己采取了必要的措施。
- 你手机的所有硬件功能可能在定制 ROM 上不工作。
- 解锁引导加载程序是一个必要步骤，但这样做可能会带来安全问题。

这个列表特别关注基于安卓的发行版和定制 ROM。我们有一个另外单独的 [开源移动操作系统][2] 列表，包括 Ubuntu Touch 和 PureOS 等选项。

注：名单排名不分先后。你应该选择更多地了解所提到的选项，并决定什么最适合你。

### 1、LineageOS

![Lineage OS 用户界面的几张截图][3]

[LineageOS][4] 可以说是最受欢迎的安卓 ROM 之一，它是非常流行的（[但自 2016 年以来已经消亡][5]]）的 CyanogenMod 的一个复刻。由于 LineageOS 很流行，你可能会发现很多设备支持该操作系统。

换句话说，与其他定制安卓 ROM 相比，你可以更快地获得对新设备的支持，以及对各种旧设备的支持。

如果你有的话，LineageOS 甚至支持你的 Nvidia Shield 电视机和 Jetson Nano（[用于 AI 和深度学习项目的最佳单板计算机][6] 之一）。

- [获取 LineageOS][7]

#### 优点

  * 优秀的官方和第三方文档
  * 支持设备的及时更新
  * LineageOS 非常紧跟 AOSP 树（适用于想要最原始安卓体验的人）
  * 与原厂固件相比，“预装软件”更少。

#### 缺点

  * LineageOS 项目是一个社区项目，所以并非你手机上所有的硬件功能都能开箱即用。
  * 没有提供很多开箱即用的安全/隐私功能。

### 2、CalyxOS

![CalyxOS 的主页以及他们的用户界面一瞥][8] 

[CalyOS][9] 是一个相当有趣的、基于 [安卓开源项目（AOSP）][10] 的安卓操作系统。CalyxOS 没有提供谷歌移动服务（GMS），而是让用户自己去想办法（可以刷入谷歌应用），但是它提供了 [microG][11]，你可以选择启用/禁用它，从而完全控制你的手机。

CalyxOS 得到了 [Calyx Institute][12] 的支持，这是一个非营利组织，旨在促进个人权利，如言论自由、隐私权等。

它内置了一些注重隐私的应用程序，如 Signal、Tor 浏览器等。尽管对 CalyxOS 的支持仅限于 Pixel 手机，但在大多数情况下，它为用户提供了大量开箱即用的隐私功能，让用户具有领先优势。

- [获取 CalyxOS][13]

#### 优点

  * 使用 [microG][11]。
  * 带有 [F-Droid][14] 和 [Aurora 商店][15] 而不是谷歌应用商店。
  * Datura 防火墙允许你阻止每个应用程序的互联网访问。
  * 使用 [Mozilla 定位服务][16] 而不是谷歌的定位服务。
  * 每月一次的在线安全更新。
  * 经过验证的启动程序，以提高安全性。
  * 开箱即用的以安全为中心的应用程序和功能。

#### 缺点

  * 只适用于 Pixel 手机（[但这背后有一个很好的理由][17]）。

### 3、GrapheneOS

![GrapheneOS 安装在 Pixel 设备上的照片][18]

[GrapheneOS][19] 是一个基于安卓的 ROM，专注于安全和隐私。虽然人们可能会争论说，他们的努力更多的是为了提高安全性，但这样做也有利于你的隐私。

如果你想安装带有开箱即用的、特殊安全调整过的定制 ROM，GrapheneOS 应该是一个不错的选择。

与其他一些定制 ROM 不同，它没有包括启用/禁用 microG 的功能，这恰好为依赖于 Google Play 服务的应用程序提供了更好的支持。但是，GrapheneOS 可以 [对 Google Play 服务进行沙箱处理][20]，这应该可以让你使某些功能正常工作。但是，截至目前，它仍然是实验性的。

- [获取 GrapheneOS][21]

#### 优点

  * 提供比 AOSP 更强大、加固过的应用程序沙盒。
  * 使用自己 [加固过的 malloc][22]（具有加固了安全性的内存分配器）。
  * Linux 内核经过了加固，安全性更高。
  * 提供及时的安全更新。
  * 具备全盘加密功能（对移动设备来说非常重要）。
  * 不包括任何谷歌应用程序或谷歌服务。

#### 缺点

  * 有限的硬件支持；仅适用于谷歌 Pixels。
  * 以安全为中心的调整可能不会转化为对新手友好的用户体验。

### 4、/e/OS

![看一下 /e/OS 中的应用启动器，以及对 /e/OS 的应用商店评级的概述][23]

你可能认为 [/e/OS][24] 只不过是又一个安卓操作系统，这 _一定程度上_ 是对的。先别急着否定这个安卓 ROM。它远超于任何现成的基于安卓的操作系统。

最大的特点是 [eFoundation][25]（在 /e/OS 背后的基金会）为你提供了一个免费的 [ecould 账户][26]（有 1GB 的存储空间），而不需要使用谷歌账户。

像任何尊重隐私的安卓 ROM 一样，/e/OS 将每一个与谷歌相关的模块或应用都替换成了自由软件替代品。

旁注：eFoundation 也销售预装了 /e/OS 的手机。[请看这里][27]。

- [获取 /e/OS][28] 

#### 优点

  * /e/OS 上的应用程序商店根据需要的权限以及对隐私的友好程度来对应用程序进行评级。
  * 提供了一个 [ecloud 账户][26]（带有 @e.email 后缀；免费级提供 1GB）作为同步账户。
  * 配备了 [microG][11] 框架。
  * 谷歌 DNS 服务器（8.8.8.8 和 8.8.4.4）被替换为 [Quad9][29] 的 DNS 服务器。
  * DuckDuckGo 是替代谷歌的默认搜索引擎。
  * 使用由 [Mozilla][16] 提供的位置服务。

#### 缺点

  * 设备兼容性非常有限。
  * 从安卓系统推出新功能需要一段时间。

### 5、CopperheadOS

![CopperheadOS 网站上关于手机安全和隐私的标语][30]

> **警告**
>
> 这不是一个开源项目。列在这里只是为感兴趣的用户提供的附加选项。

[CopperheadOS][31] 是另一个有趣的安卓 ROM。它是由一个只有两个人的团队开发的。

与其他选项不同，CopperheadOS 不是开源项目，你可能无法在你的手机上使用它。

它面向企业部署。因此，如果你想为你的员工购买安卓设备并调整安全性，那么这值得考虑。

- [获得 CopperheadOS][32]

#### 优点

  * 与其他安卓 ROM 文档相比 [更优良的文档][33]。
  * CopperheadOS 在 AOSP 之前就有许多面向安全的功能。
  * 使用 Cloudfare DNS（1.1.1.1 和 1.0.0.1）而不是谷歌的 DNS（8.8.8.8 和 8.8.4.4）。
  * 包括一个用于控制每个应用程序权限的互联网防火墙。
  * 使用开源应用程序，而不是过时的 AOSP 应用程序（日历、短信、画廊等）。
  * 包括 [F-Droid][14] 和 [Aurora 应用商店][15]。

#### 缺点

  * [在主要的开发者出走之后，CopperheadOS 的安全性存在质疑][34] 。
  * 仅适用于预装 CopperheadOS 的手机。
  * 没有迹象表明 SafetyNet 会在 CopperheadOS 上工作。

### 荣誉提名：LineageOS for microG

![LineageOS for microG 中包含的应用程序列表][35]

[LineageOS for microG][36] 项目是官方 LineageOS 项目的一个复刻，默认包含 [microG][11] 和谷歌应用。这个项目负责确保 microG 在你的手机上完美运行（这对初学者来说可能是一个复杂的过程）。

- [获取 LineageOS for MicroG][37]

#### 优点

  * 提供了 GMS 的 microG 实现，没有任何不便之处。
  * 提供 [F-Droid][14] 作为默认的应用商店。
  * 提供每周/每月一次的在线更新。
  * 可以选择使用由 [Mozilla][16] 或 [Nominatim][38] 提供的定位服务。

#### 缺点

  * 启用签名欺骗以启用 microG 支持，从安全角度来看，可能是一个攻击方向。
  * 尽管这个 ROM 是基于 LineageOS 的，但在写这篇文章时，并不是所有的 LineageOS 设备都支持。
  * 包括谷歌应用程序，而不是提供开源的替代品。
  * 无法确认谷歌的 SafetyNet 是否工作。

### 附加信息

你可能想知道为什么一些有趣的基于安卓的 ROM（CalyxOS、GrapheneOS 等）只限于支持谷歌的手机。这不是很讽刺吗？

嗯，这是因为大多数手机都支持解锁引导器，但只有谷歌 Pixels 支持再次锁定引导器。当你为关注隐私和/或安全的人群开发基于安卓的 ROM 时，这是一个考虑因素。如果启动器被解锁，它就是一个你尚未修补的攻击方向。

另一个具有讽刺意味的原因是，只有谷歌才及时向公众提供他们手机的设备树和内核源代码。如果没有设备树和内核源代码，你就无法为该手机开发 ROM。

无论你选择何种 ROM，我都会推荐以下 FOSS 应用程序。它们将被证明是对你的隐私友好应用程序工具包的一个很好的补充。

  * [Signal Messenger][39]
  * [K-9 邮件][40]
  * [DuckDuckGo 浏览器][41]
  * [Tor 浏览器][42]。
  * [F-Droid][14]
  * [Aurora 商店][15]
  * [OpenKeychain][43]

### 总结

在我看来，如果你有一部谷歌 Pixel 手机，我建议你尝试一下 CalyxOS、GrapheneOS 或 CopperheadOS。这些安卓 ROM 有出色的功能，可以帮助你的手机远离谷歌的监视，同时还可以让你的手机（可以说是）更加安全。

如果你没有谷歌 Pixel，你仍然可以尝试一下 LineageOS for MicroG。这是一项很好的社区贡献，在不侵犯你的隐私的情况下，它把谷歌的专有功能带给大众。

如果你的手机不被上述任何一个操作系统支持，那么 LineageOS 就是你的朋友。由于它对手机的支持广泛，毫无疑问，无论是官方还是非官方，你的手机都可以得到支持。

--------------------------------------------------------------------------------

via: https://itsfoss.com/android-distributions-roms/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://9to5google.com/2020/08/05/oneplus-phones-will-ship-with-facebook-services-that-cant-be-removed/
[2]: https://itsfoss.com/open-source-alternatives-android/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/01_lineageos.webp?w=1200&ssl=1
[4]: https://lineageos.org/
[5]: https://www.androidauthority.com/cyanogenmod-lineageos-654810/
[6]: https://itsfoss.com/best-sbc-for-ai/
[7]: https://lineageos.org/
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/02_calyx-1.webp?w=1264&ssl=1
[9]: https://calyxos.org/
[10]: https://www.androidauthority.com/aosp-explained-1093505/
[11]: https://microg.org/
[12]: https://calyxinstitute.org/projects/calyx-os
[13]: https://calyxos.org/install/
[14]: https://www.f-droid.org/en/about/
[15]: https://auroraoss.com/
[16]: https://location.services.mozilla.com/
[17]: https://calyxos.org/docs/guide/device-support/#requirements-for-supporting-a-new-device
[18]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/03_graphene.webp?resize=800%2C600&ssl=1
[19]: https://grapheneos.org/
[20]: https://twitter.com/grapheneos/status/1445572173389725709
[21]: https://grapheneos.org/
[22]: https://github.com/GrapheneOS/hardened_malloc
[23]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/06_eos-1.webp?w=600&ssl=1
[24]: https://e.foundation/e-os/
[25]: https://e.foundation/
[26]: https://e.foundation/ecloud/
[27]: https://esolutions.shop/
[28]: https://e.foundation/e-os/
[29]: https://www.quad9.net/
[30]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/04_copperheados.webp?resize=1536%2C806&ssl=1
[31]: https://copperhead.co/
[32]: https://copperhead.co/android/docs/install/
[33]: https://copperhead.co/android/docs/
[34]: https://twitter.com/DanielMicay/status/1068641901157511168
[35]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/05_losmicrog.webp?resize=864%2C1536&ssl=1
[36]: https://lineage.microg.org/
[37]: https://download.lineage.microg.org/
[38]: https://nominatim.org/
[39]: https://signal.org/
[40]: https://k9mail.app/
[41]: https://duckduckgo.com/app
[42]: https://www.torproject.org/
[43]: https://www.openkeychain.org/