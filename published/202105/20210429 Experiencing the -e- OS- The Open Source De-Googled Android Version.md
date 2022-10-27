[#]: subject: (Experiencing the /e/ OS: The Open Source De-Googled Android Version)
[#]: via: (https://itsfoss.com/e-os-review/)
[#]: author: (Dimitrios https://itsfoss.com/author/dimitrios/)
[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13442-1.html)

体验 /e/ OS：开源的去谷歌化的安卓
======

![](https://img.linux.net.cn/data/attachment/album/202105/30/222621vsgf8q1et5oyysgs.jpg)

/e/ 安卓操作系统是一个以隐私为导向的去谷歌化的移动操作系统，是 Lineage OS 的复刻，由 Mandrake Linux（现在的 [Mandriva Linux][2]）的创建者 [Gaël Duval][1] 于 2018 年中期创立。

尽管安卓在 2007 年成为了一个开源项目，但当安卓得到普及时，谷歌使用专有软件取代了一些操作系统元素。/e/ 基金会用 [MicroG][3] 取代了其中的专有的应用程序和服务，这是一个开源的替代框架，可以最大限度地减少跟踪和设备活动。

我们收到的 [Fairphone 3][4] 预装了 /e/ OS，这是一个来自 /e/ 基金会的 [以道德的方式创造的智能手机][5]。我使用了一个月这个设备，然后把它返还给了他们，我将分享我对这个隐私设备的体验。我忘了截图，所以我将分享来自官方网站的通用图片。

### 在道德的 Fairphone 设备上体验 /e/ 移动操作系统

在我进一步说明之前，让我澄清一下，Fairphone 3 并不是使用 /e/ 的唯一选择。如果你要从他们那里购买设备，/e/ 基金会会给你 [一些智能手机的选择][6]。

你不需要购买设备来使用 /e/ OS。按照 /e/ 基金会的说法，你可以 [在 100 多个支持的设备上使用它][7]。

尽管我很喜欢使用 Fairphone 3，而且我的个人信仰与 Fairphone 的宣言一致，但我不会把注意力放在设备上，而只是放在 /e/ OS 上。

#### 有评级隐私的应用程序

![][8]

我把 Fairphone 3 作为我的日常使用设备用了几天时间，以比较与我的“普通”安卓手机在现实中的使用情况。

首先，我想看看我使用的所有应用程序是否都可以在 /e/ 基金会创建的“[应用商店][9]”上找到。/e/ 应用商店包含有隐私评级的应用程序。

![/e/ OS 应用商店有应用程序的隐私评级][10]

我可以找到许多应用程序，包括来自谷歌的应用程序。这意味着，如果有人真的想使用一些谷歌的服务，它仍然可以作为一个选项来下载。尽管与其他安卓设备不同，没有强行将谷歌服务塞进你的嘴里。

虽然有很多应用程序，但我无法找到我在英国使用的手机银行应用程序。我不得不承认，手机银行应用程序可以在一定程度上促进便利。作为替代方案，我不得不在需要时进入电脑使用网上银行平台。

从可用性的角度来看，/e/ OS 可以取代我的“标准”安卓操作系统，但会有一些小插曲，比如银行应用程序。

#### 如果不是谷歌的，那是什么？

想知道 /e/ OS 使用哪些基本的应用程序，而不是谷歌的那些？这里有一个快速列表：

  * [魔法地球][11]  —— 逐向道路导航
  * 浏览器 —— Chromium 的一个非谷歌复刻版本
  * 邮件 —— [K9-mail][12] 的一个复刻
  * 短信 —— QKSMS 的一个复刻
  * 照相机 —— OpenCamera 的一个复刻
  * 天气 —— GoodWeather 的一个复刻
  * OpenTasks —— 任务组织者
  * 日历：[Etar calendar][13] 的一个复刻

#### Bliss Launcher 和整体设计

![][14]

/e/ OS 的默认启动程序被称为 “Bliss Launcher”，其目的是为了获得有吸引力的外观和感觉。对我来说，这个设计感觉与 iOS 相似。

通过向左滑动面板，你可以访问 /e/ 选择的一些有用的小工具。

![][15]

  * 搜索：快速搜索预装的应用程序或搜索 Web
  * APP 建议：前 4 个最常用的应用程序将出现在这个小部件上
  * 天气：天气小部件显示的是当地的天气。它不会自动检测位置，需要进行配置。
  * 编辑：如果你想在屏幕上有更多的小部件，你可以通过点击“编辑”按钮添加它们。

总而言之，用户界面是干净整洁的简单明了，增强了愉快的用户体验。  * 天气。天气小部件显示的是当地的天气。它不会自动检测位置，需要进行配置。
  * 编辑：如果你想在屏幕上有更多的小部件，你可以通过点击编辑按钮添加它们。

总而言之，用户界面干净整洁、简单明了，增强了愉快的用户体验。

#### 去谷歌化和面向隐私的操作系统

如前所述，/e/ 操作系统是一个去谷歌化的操作系统，它基于 [Lineage OS][16] 的开源核心。所有的谷歌应用程序已经被删除，谷歌服务已经被 MicroG 框架所取代。/e/ OS 仍然与所有的安卓应用兼容。

主要的隐私功能：

  * 谷歌搜索引擎已被 DuckDuckGo 等替代品取代
  * 谷歌服务已被 microG 框架所取代
  * 使用替代的默认应用程序，而不是谷歌应用程序
  * 取消了对谷歌服务器的连接检查
  * NTP 服务器已被替换为标准的 NTP 服务：pool.ntp.org
  * DNS 默认服务器由 9.9.9.9 取代，可以根据用户的选择进行编辑
  * 地理定位是在 GPS 的基础上使用 Mozilla 定位服务

> 隐私声明
>
> 请注意，使用由 /e/ 基金会提供的智能手机并不自动意味着无论你做什么都能保证你的隐私。分享你的个人信息的社交媒体应用程序应在你的意识下使用。

### 结论

我成为安卓用户已经超过十年了。/e/ OS 给我带来了积极的惊喜。关注隐私的用户可以发现这个解决方案非常吸引人，而且根据所选择的应用程序和设置，可以再次感觉到使用智能手机的安全。

如果你是一个有隐私意识的技术专家，并且能够自己找到解决问题的方法，我向你推荐它。对于那些习惯于谷歌主流服务的人来说，/e/ 生态系统可能会让他们不知所措。

你使用过 /e/ OS 吗？你的使用经验如何？你怎么看这些关注隐私的项目？

--------------------------------------------------------------------------------

via: https://itsfoss.com/e-os-review/

作者：[Dimitrios][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Ga%C3%ABl_Duval
[2]: https://en.wikipedia.org/wiki/Mandriva_Linux
[3]: https://en.wikipedia.org/wiki/MicroG
[4]: https://esolutions.shop/shop/e-os-fairphone-3-fr/
[5]: https://www.fairphone.com/en/story/?ref=header
[6]: https://esolutions.shop/shop/
[7]: https://doc.e.foundation/devices/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/e-ecosystem.png?resize=768%2C510&ssl=1
[9]: https://e.foundation/e-os-available-applications/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/04/e-os-apps-privacy-ratings.png?resize=300%2C539&ssl=1
[11]: https://www.magicearth.com/
[12]: https://k9mail.app/
[13]: https://github.com/Etar-Group/Etar-Calendar
[14]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/fairphone.jpg?resize=600%2C367&ssl=1
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/e-bliss-launcher.jpg?resize=300%2C533&ssl=1
[16]: https://lineageos.org/
