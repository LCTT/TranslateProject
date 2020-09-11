[#]: collector: "lujun9972"
[#]: translator: "fuzheng1998"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10931-1.html"
[#]: subject: "5 open source mobile apps"
[#]: via: "https://opensource.com/article/19/4/mobile-apps"
[#]: author: "Chris Hermansen https://opensource.com/users/clhermansen/users/bcotton/users/clhermansen/users/bcotton/users/clhermansen"

5 个可以满足你的生产力、沟通和娱乐需求的开源手机应用
======

> 你可以依靠这些应用来满足你的生产力、沟通和娱乐需求。

![](https://img.linux.net.cn/data/attachment/album/201906/03/001949brnq19j5qeqn3onv.jpg)

像世界上大多数人一样，我的手似乎就没有离开过手机。多亏了我从 Google Play 和 F-Droid 安装的开源移动应用程序，让我的 Android 设备好像提供了无限的沟通、生产力和娱乐服务一样。

在我的手机上的许多开源应用程序中，当想听音乐、与朋友/家人和同事联系、或者在旅途中完成工作时，以下五个是我一直使用的。

### MPDroid

一个音乐播放器进程 (MPD)的 Android 控制器。

![MPDroid][2]

MPD 是将音乐从小型音乐服务器电脑传输到大型的黑色立体声音箱的好方法。它直连 ALSA，因此可以通过 ALSA 硬件接口与数模转换器（DAC）对话，它可以通过我的网络进行控制——但是用什么东西控制呢？好吧，事实证明 MPDroid 是一个很棒的 MPD 控制器。它可以管理我的音乐数据库，显示专辑封面，处理播放列表，并支持互联网广播。而且它是开源的，所以如果某些东西不好用的话……

MPDroid 可在 [Google Play][4] 和 [F-Droid][5] 上找到。

### RadioDroid

一台能单独使用及与 Chromecast 搭配使用的 Android 网络收音机。

![RadioDroid][6]

RadioDroid 是一个网络收音机，而 MPDroid 则管理我音乐的数据库；从本质上讲，RadioDroid 是 [Internet-Radio.com][7] 的一个前端。此外，通过将耳机插入 Android 设备，通过耳机插孔或 USB 将 Android 设备直接连接到立体声系统，或通过兼容设备使用其 Chromecast 功能，可以享受 RadioDroid。这是一个查看芬兰天气情况，听取排名前 40 的西班牙语音乐，或收到到最新新闻消息的好方法。

RadioDroid 可在 [Google Play][8] 和 [F-Droid][9] 上找到。

### Signal

一个支持 Android、iOS，还有桌面系统的安全即时消息客户端。

![Signal][10]

如果你喜欢 WhatsApp，但是因为它与 Facebook [日益密切][11]的关系而感到困扰，那么 Signal 应该是你的下一个产品。Signal 的唯一问题是说服你的朋友们最好用 Signal 取代 WhatsApp。但除此之外，它有一个与 WhatsApp 类似的界面；很棒的语音和视频通话；很好的加密；恰到好处的匿名；并且它受到了一个不打算通过使用软件来获利的基金会的支持。为什么不喜欢它呢？

Signal 可用于 [Android][12]、[iOS][13] 和 [桌面][14]。

### ConnectBot

Android SSH 客户端。

![ConnectBot][15]

有时我离电脑很远，但我需要登录服务器才能办事。[ConnectBot][16] 是将 SSH 会话搬到手机上的绝佳解决方案。

ConnectBot 可在 [Google Play][17] 上找到。

### Termux

有多种熟悉的功能的安卓终端模拟器。

![Termux][18]

你是否需要在手机上运行 `awk` 脚本？[Termux][19] 是个解决方案。如果你需要做终端类的工作，而且你不想一直保持与远程计算机的 SSH 连接，请使用 ConnectBot 将文件放到手机上，然后退出会话，在 Termux 中执行你的操作，用 ConnectBot 发回结果。

Termux 可在 [Google Play][20] 和 [F-Droid][21] 上找到。

* * *

你最喜欢用于工作或娱乐的开源移动应用是什么呢？请在评论中分享它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/4/mobile-apps

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[fuzheng1998](https://github.com/fuzheng1998)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen/users/bcotton/users/clhermansen/users/bcotton/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/rh_003588_01_rd3os.combacktoschoolserieshe_rh_041x_0.png?itok=tfg6_I78
[2]: https://opensource.com/sites/default/files/uploads/mpdroid.jpg "MPDroid"
[3]: https://opensource.com/article/17/4/fun-new-gadget
[4]: https://play.google.com/store/apps/details?id=com.namelessdev.mpdroid&hl=en_US
[5]: https://f-droid.org/en/packages/com.namelessdev.mpdroid/
[6]: https://opensource.com/sites/default/files/uploads/radiodroid.png "RadioDroid"
[7]: https://www.internet-radio.com/
[8]: https://play.google.com/store/apps/details?id=net.programmierecke.radiodroid2
[9]: https://f-droid.org/en/packages/net.programmierecke.radiodroid2/
[10]: https://opensource.com/sites/default/files/uploads/signal.png "Signal"
[11]: https://opensource.com/article/19/3/open-messenger-client
[12]: https://play.google.com/store/apps/details?id=org.thoughtcrime.securesms
[13]: https://itunes.apple.com/us/app/signal-private-messenger/id874139669?mt=8
[14]: https://signal.org/download/
[15]: https://opensource.com/sites/default/files/uploads/connectbot.png "ConnectBot"
[16]: https://connectbot.org/
[17]: https://play.google.com/store/apps/details?id=org.connectbot
[18]: https://opensource.com/sites/default/files/uploads/termux.jpg "Termux"
[19]: https://termux.com/
[20]: https://play.google.com/store/apps/details?id=com.termux
[21]: https://f-droid.org/packages/com.termux/
