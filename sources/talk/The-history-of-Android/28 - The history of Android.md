安卓编年史
================================================================================

>让我们跟着安卓从 0.5 版本到 7 的无尽迭代来看看它的发展历史。

#### ART—The Android Runtime provides a platform for the future

#### ART——为未来提供了一个平台的安卓运行时

There aren't too many components that can trace their lineage all the way back to Android 1.0, but in 2014 one of them was Dalvik, the runtime that powers Android apps. Dalvik was originally designed for single-core, low-performance devices, and it prioritized storage and memory usage over performance. Over the years, Google bolted on more and more upgrades to Dalvik, like JIT support, concurrent garbage collection, and multi-process support. But with the advent of multi-core phones that were many times faster than the T-Mobile G1, upgrades could only take Android so far.

安卓里没有多少组件的血统能追溯到 1.0 时代，但在 2014 年 Dalvik 这个驱动安卓应用的运行时是它们中的一员。Dalvik 最初是为单核，低端性能设备设计的，而且存储和内存占用的优先级要高于性能表现。在过去的几年里，谷歌给 Dalvik 扩充了越来越多的更新，比如 JIT 支持，并发垃圾回收，以及多进程支持。但是随着多核手机的出现，它们比 T-Mobile G1 快上很多倍，而这些功能升级扩充只能帮安卓到这里了。

The solution was to replace Dalvik with ART, the Android RunTime, a new app engine written from the ground up for modern smartphone hardware. ART brought an emphasis on performance and UI smoothness. ART brought a switch from JIT (Just-in-time) compilation to AOT (Ahead-of-time) compilation. JIT would compile an app every time it was run, saving storage space since compiled code was never written to disk, but instead it took up more CPU and RAM. AOT would save the compiled code to disk, making app start faster and reducing memory usage. Rather than shipping precompiled code, ART would compile code on the device as part of installation, giving the compiler access to device-specific optimizations. ART also brought support for 64-bit which, in addition to more addressable memory, brings better performance from the 64-bit instruction set (particularly in media and cryptography apps).

解决方案就是用 ART 这个安卓运行时替换 Dalvik，这是一个完全为现代智能手机硬件重写的应用引擎。ART 更强调性能表现和用户界面流畅度。ART 带来了一个从 JIT（Just-in-time，即时）编译到 AOT（Ahead-of-time，提前）编译的转变。JIT 会在每次应用运行的时候即时编译，节省存储空间，因为编译后的代码从不写入存储，但它消耗更多的 CPU 和内存资源。AOT 会将编译后的代码保存到存储，让应用启动的时候更快并减少内存使用。ART 会在设备上将编译代码作为安装的一部分进行，而不分发预编译的代码，这样编译器可以进行一些针对特定设备的优化。ART 还带来了 64 位支持，扩大了内存寻址范围，由 64 位指令集带来更佳的性能表现（特别是在媒体和加密应用上）。

The best part was this change brought these performance improvements and 64-bit support to every java Android app. ART generates code for every java app, thus any improvements to ART automatically come to these apps. ART was also written with future upgrades in mind, so it would be able to evolve along with Android.

而最好的部分是这个变化将这些性能优化和 64 位支持带给了每个 java 安卓应用。ART 为每个 java 应用生成代码，因此任何对 ART 的改进都自动应用到了这些应用。同时 ART 也是在未来的升级计划下写就，所以它能够和安卓一同进化。

#### A system-wide interface refresh

#### 一个系统层级的界面刷新


*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/systemui150-1-150x150.jpg)
    ][1]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/lock-1-150x150.jpg)
    ][2]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/recent-apps-150x150.jpg)
    ][3]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/recent2-150x150.jpg)
    ][4]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/notification-1-150x150.jpg)
    ][5]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/headsup-1-150x150.jpg)
    ][6]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/panels-150x150.jpg)
    ][7]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/noticontrols-150x150.jpg)
    ][8]

Material Design brought a complete overhaul to nearly every interface in Android. For starters, the entire core System UI was changed. Android got a revamped set of buttons that look a bit like a PlayStation controller: triangle, circle, and square buttons now represented back, home, and recent apps, respectively. The status bar was all new thanks to a set of redesigned icons.

Material Design 带来了一个几乎对安卓所有界面的完全翻新。首先，整个核心系统界面改变了。安卓得到了一个全新的按钮集合，看起来有点像是 PlayStation 的手柄：三角形，圆形以及正方形按钮，分别代表后退，主屏幕，和最近应用。得益于全新的图标集，状态栏也是焕然一新。

Recent apps got a big revamp, switching from a vertical list of small thumbnails to a cascading view of large, almost fullscreen thumbnails. It also got a new name (which didn't really stick) called "Overview." This definitely seems like something that was inspired by Chrome's tab switcher in past versions.

最近应用获得了大翻新。从一个小略缩图纵向列表变成了一个巨大的，几乎全屏的略缩图串联列表。它还获得了一个新名字（也没那么守旧），“概览（Overview）”。这明显是受到了前面版本的 Chrome 标签页切换器效果的启发。

Chrome's tab switcher was gone in this release, by the way. In an attempt to put Web apps on even ground with installed apps, Chrome tabs were merged into the Overview list. That's right: the list of recent "apps" now showed recently opened apps mixed in with recently opened websites. In Lollipop, the recent apps list also took a "document centric" approach, meaning apps could put more than one listing into the recent apps list. For instance if you opened two documents in Google Docs, both would be shown in recent apps, allowing you to easily switch between them rather than having to switch back and forth via the app's file list.

顺带一说，在这个安卓版本里 Chrome 的标签页切换器效果消失了。作为一种将 Web 应用与本地应用同等对待的尝试，Chrome 标签合并到了概览列表。是的：最近“应用”列表现在显示的是最近打开的应用，加上最近打开的网站。在棒棒糖中，最近应用列表还采取了一种“以文档为中心”的方法，意味着应用可以在最近应用列表中显示多个项目。比如你在 Google Docs 中打开了两个文档，它们都会显示在最近应用中，让你可以在它们之间轻松切换，而不用到应用的文件列表去来回切换。

The notification panel was all new. Google brought the "card" motif to the notification panel, storing each item in its own rectangle. Individual notifications changed from a dark background to a white one with better typography and round icons. These new notifications came to the lock screen, changing it from a mostly-useless interstitial screen to a very useful "here's what happened while your were gone" screen.

通知面板是全新的。谷歌给通知面板带来了“卡片”主题，将每个项目归整到它自己的矩形中。通知个体从黑色背景变成了白色背景，有了更佳的排版和圆形图标。这些新通知来到了锁屏上，将它从一个最没用的中间屏变成了很有用的“这里是你不在的时候发生的事情”屏。

Full screen notifications for calls and alarms were banished, replaced with a "heads up" notification that would pop into the top part of the screen. Heads-up notifications also came to "high-priority" app notifications, which were originally intended for IM messages. It was up to developers to decide what was a high-priority notification though, and after developers realized this would make their notifications more noticeable, everyone started forcing them on users. Later versions of Android would fix this by giving users control over the "high-priority" setting.

Google also added a separate-but-similarly-named "priority" notification system to Lollipop. "Priority" notification was a mode in-between completely silent and "beep for everything" allowing users to flag certain people and apps as "important." Priority mode would only beep for these important people. In the UI, this took the form of a set of notification priority controls attached to the volume popup and a new settings screen for priority notifications. And whenever you were in priority mode, there was a little star in the status bar.

Quick Settings got a huge series of improvements The controls were now a panel _above_ the notification panel, so that it could be opened with a "double swipe down" gesture. The first pull down would open the notification panel, and the second pull down gesture would shrink the notification panel and open Quick Settings. The layout of the Quick Settings controls changed, dumping the tile layout for a series of buttons floating on a single panel. The top was a very handy brightness slider, followed by buttons for connectivity, auto rotate, the flashlight, GPS, and Chromecast.

There were also actual in-line panels now in the Quick Settings. It would display Wi-Fi access points, Bluetooth device, and data usage right in the main interface.


*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/4-150x150.jpg)
    ][9]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/gmail2-150x150.jpg)
    ][10]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/fit-150x150.jpg)
    ][11]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/messages-1-150x150.jpg)
    ][12]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/googl1-150x150.jpg)
    ][13]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/2-150x150.jpg)
    ][14]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/reminers-150x150.png)
    ][15]

The Material Design revamp gave nearly every app a new icon and brought a brighter, white background to the app drawer. There were lots of changes to the default apps loadout. Say "hello" to the new apps: Contacts, Docs, Fit, Messenger, Photos, Play Newsstand, Sheets, and Slides. Say "goodbye" to the dead apps: Gallery, G+ Photos, People, Play Magazines, Email, and Quickoffice.

Many of these new apps came from Google Drive, which split up from a monolithic app into an app for each product. There was now Drive, Docs, Sheets, and Slides, all from the Drive team. Drive is also responsible for the death of Quickoffice, which was consumed by the Drive team. In the "Google can never make up its mind" category: "People" got renamed back to "Contacts" again, and an SMS app called "Messenger" was reinstated at the behest of cellular carriers. (Those carriers did _not_ like Google Hangouts taking over SMS duties.) We got one genuinely new service: Google Fit, a fitness tracking app that worked on Android phones and Android Wear watches. There was also a revamp of Play Magazines to include websites, so it changes names to "Play Newsstand."

There were more cases of proprietary Google apps taking over for AOSP.

*   "G+ Photos" became "Google Photos" and took over default picture duties from the AOSP Gallery, which became a dead app. The name change to "Google Photos" was in preparation for Photos being [pulled out of Google+][16] and launching as a standalone service. The Google Photos launch would happen about six months after the launch of Lollipop—for now, this is just the Google+ app spawning a new icon and interface.
*   Gmail took over POP3, IMAP, and Exchange e-mail duties from the "Email" app. Despite being dead Email still had an app icon, which was a fake—it only displayed a message that told users to setup all e-mail accounts in the Gmail app.
*   The "People" to "Contacts" change was actually to "Google Contacts" another AOSP replacement app.

--------------------------------------------------------------------------------

via: http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/

作者：[RON AMADEO][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://arstechnica.com/author/ronamadeo/
[1]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[2]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[3]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[4]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[5]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[6]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[7]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[8]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[9]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[10]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[11]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[12]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[13]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[14]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[15]:http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/#
[16]:http://arstechnica.com/gadgets/2015/05/google-photos-leaves-google-launches-as-a-standalone-service/
