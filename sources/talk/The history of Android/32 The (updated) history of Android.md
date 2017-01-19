# Behind-the-scenes changes

# 幕后变化

Marshmallow expanded on the power-saving JobScheduler APIs that were originally introduced in Lollipop. JobScheduler turned app background processing from a free-for-all that frequently woke up the device to an organized system. JobScheduler was basically a background-processing traffic cop.

棉花糖对自棒棒糖引入的节电任务调度器 API 进行了扩展。任务调度器将应用后台进程从随意唤醒设备规整成一个有组织的系统。任务调度器基本上就是一个后台进程的交通警察。

In Marshmallow, Google added a "Doze" mode to save even more power when a device is left alone. If a device was stationary, unplugged, and had its screen off, it would slowly drift into a low-power, disconnected mode that locked down background processing. After a period of time, network access was disabled. Wake locks—an app's request to keep your phone awake so it can do background processing—got ignored. System Alarms (not user-set alarm clock alarms) and the [JobScheduler][25] shut down, too.

在棉花糖中，谷歌还添加了一个“Doze（休眠）”模式来在设备闲置的时候节约更多电量。如果设备静止不动，未接入电源，并且屏幕处于关闭状态，它会慢慢进入低功耗离线模式，锁定后台进程。在一段时间之后，网络连接会被禁用。唤醒会被锁定——应用会请求唤醒手机来运行后台进程——而它会被忽略。系统警报（不含用户设置的闹钟）以及[任务调度器][25]也会被关闭。

If you've ever put a device in airplane mode and noticed the battery lasts forever, Doze was like an automatic airplane mode that kicked in when you left your device alone—it really did boost battery life. It worked for phones that were left alone on a desk all day or all night, and it was great for tablets, which are often forgotten about on the coffee table.

如果你曾经发现把设备设置为飞行模式，并且注意到电池续航很长，Doze 就像是一个自动飞行模式，在你手机不用的时候介入——它真的延长了电池续航。它对于整天或整夜放在桌子上的手机很有效，对于平板就更好了，因为它常常被遗忘在咖啡桌上。

The only notification that could punch through Doze mode was a "high priority message" from Google Cloud Messaging. This was meant for texting services so, even if a device is dozing, messages still came through.

唯一能把设备从 Doze 模式唤醒的来自谷歌云消息推送服务的“高优先级消息”。这是为信息服务准备的，所以即使设备处于休眠状态，也能够收取信息。


*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/inactive-apps-150x150.jpg)
    ][1]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/battery-optimizations-150x150.jpg)
    ][2]

"App Standby" was another power saving feature that more-or-less worked quietly in the background. The idea behind it was simple: if you stopped interacting with an app for a period of time, Android deemed it unimportant and took away its internet access and background processing privileges.

“应用待机”是另一项或多或少有用的节电特性，它在后台静默运行。这背后的逻辑很简单：如果你和应用停止交互一段时间，安卓就认为它是不重要的，并取消它访问网络和后台进程的权力。

For the purposes of App Standby, "interacting" with an app meant opening the app, starting a foreground service, or generating a notification. Any one of these actions would reset the Standby timer on an app. For every other edge case, Google added a cryptically-named "Battery Optimizations" screen in the settings. This let users whitelist apps to make them immune from app standby. As for developers, they had an option in Developer Settings called "Inactive apps" which let them manually put an app on standby for testing.

对于应用待机而言，和一个应用“交互”意味着打开一个应用，开始一项前台服务，或者生成一条通知。任何其中的一条操作就会重置该应用的待机计时器。对于每种其它边界情况，谷歌在设置里添加了一个名字意味模糊的“电池优化”界面。用户可以在这里设置应用白名单让它免疫应用待机。至于开发者，他们在开发者设置中有个“不活跃应用”选项可以手动设置应用到待机状态来测试。

App Standby basically auto-disabled apps you weren't using, which was a great way to fight battery drain from crapware or forgotten-about apps. Because it was completely silent and automatically happened in the background, it helped even novice users have a well-tuned device.

应用待机主要是自动禁用你不用的应用，这是个对抗垃圾应用或被遗忘的应用消耗电量的好方法。因为它是完全静默且后台自动执行的，它还能让新手也能拥有一部精心调教过的设备。

*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/10/autobackup-150x150.jpg)
    ][3]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/07/backup2-150x150.jpg)
    ][4]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/BACKUP1-150x150.jpg)
    ][5]

Google tried many app backup schemes over the years, and in Marshmallow it [took another swing][26]. Marshmallow's brute force app backup system aimed to dump the entire app data folder to the cloud. It was possible and technically worked, but app support for it was bad, even among Google apps. Setting up a new Android phone is still a huge hassle, with countless sign-ins and tutorial popups.

谷歌在过去几年尝试了很多应用备份方案，在棉花糖中它又[换了个方案][26]。棉花糖的暴力应用备份系统的目标是保存整个应用数据文件夹到云端。这是可能的并且在技术上是可行的，但即便是谷歌自己的应用对它的支持都不怎么好。设置好一部新安卓手机依然是个大麻烦，要处理无数的登录和弹出教程。

In terms of interface, Marshmallow's backup system used the Google Drive app. In the settings of Google Drive, there's now a "Manage Backups" screen, which showed app data not only from the new system, but also every other app backup scheme Google has tried over the years.

到界面这里，棉花糖的备份系统使用了谷歌 Drive 应用。在谷歌 Drive 的设置中有一个“管理备份”界面，不仅会显示新备份系统的应用数据，还有谷歌过去几年尝试的其它应用备份方案的数据。

 ![安卓的应用关联设置，基本就是一个应用地址转发系统。 ](https://cdn.arstechnica.net/wp-content/uploads/2016/10/app-linkingf-980x576-980x576.jpg)


Buried in the settings was a new "App linking" feature, which could "link" an app to a website. Before app linking, opening up a Google Maps URL on a fresh install usually popped up an "Open With" dialog box that wanted to know if it should open the URL in a browser or in the Google Maps app.

藏在设置里的还有一个新的“应用关联”功能，它可以将应用“链接”到网站。在应用关联出现之前，在全新安装的机器上打开一个谷歌地图链接通常会弹出一个“使用以下方式打开”的对话框，来获知你是想在浏览器还是在谷歌地图应用中打开这个链接。

This was a silly question, since of course you wanted to use the app instead of the website—that's why you had the app installed. App linking let website owners associate their app with their webpage. If users had the app installed, Android would suppress the "Open With" dialog and use that app instead. To activate app linking, developers just had to throw some JSON code on their website that Android would pick up.

这是个愚蠢的问题，因为你当然是想用应用而不是网站——这不就是你安装这个应用的原因嘛。应用关联让网站拥有者可以将他们的应用和网页相关联。如果用户安装了应用，安卓会跳过“使用以下方式打开”直接使用应用。要激活应用关联，开发者只需要在网站放一些安卓会识别的 json 代码。

App linking was great for sites with an obvious app client, like Google Maps, Instagram, and Facebook. For sites with an API and multiple clients, like Twitter, the App Linking settings screen gave users control over the default app association for any URL. Out-of-the-box app linking covered 90 percent of use cases though, which cut down on the annoying pop ups on a new phone.

应用关联对拥有指定客户端应用的站点来说很棒，比如谷歌地图、Instagram、Facebook。对于有 API 以及多种客户端的站点，比如 Twitter，应用关联界面让用户可以设置任意地址的默认关联应用。不过默认应用关联覆盖了百分之九十的用例，在新手机上大大减少了烦人的弹窗。


*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/adopt1-150x150.jpg)
    ][6]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/setup-150x150.jpg)
    ][7]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/format1-150x150.jpg)
    ][8]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/move-data-150x150.jpg)
    ][9]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/downloads-150x150.jpg)
    ][10]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/removingisbad-150x150.jpg)
    ][11]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/explorer-150x150.jpg)
    ][12]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/sort-options-150x150.jpg)
    ][13]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/gridorlist-150x150.jpg)
    ][14]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/file-mange-150x150.jpg)
    ][15]

Adoptable storage was one of Marshmallow's best features. It turned SD cards from a janky secondary storage pool into a perfect merged-storage solution. Slide in an SD card, format it, and you instantly had more storage in your device that you never had to think about again.

可选存储是棉花糖的最佳特性之一。它将 SD 卡从一个二级存储池转换成一个完美的合并存储方案。插入 SD 卡，将它格式化，然后你就有了更多的存储空间，而这是你从来没有想过的事情。

Sliding in a SD card showed a setup notification, and users could choose to format the card as "portable" or "internal" storage. The "Internal" option was the new adoptable storage mode, and it paved over the card with an ext4 file system. The only downside? The card and the data were both "locked" to your phone. You couldn't pull the card out and plug it into anything without formatting it first. Google was going for a set-it-and-forget-it use case with internal storage.

插入 SD 卡会弹出一条设置通知，用户可以选择将卡格式化成“外置”或“内置”存储。“内置”存储选项就是新的可选存储模式，它会将存储卡格式化为 ext4 文件系统。唯一的缺点？那就是存储卡和数据都被“锁定”到你的手机上了。如果不格式化的话，你没法取出存储卡茶道其它地方使用。谷歌对于内置存储的使用场景判断就是一旦设置就不再更改。

If you did yank the card out, Android did its best to deal with things. It popped up a message along the lines of "You'd better put that back or else!" along with an option to "forget" the card. Of course "forgetting" the card would result in all sorts of data loss, and it was not recommended.

The sad part of adoptable storage is that devices that could actually use it didn't come for a long time. Neither Nexus device had an SD card, so for the review we rigged up a USB stick as our adoptable storage. OEMs initially resisted the feature, with [LG and Samsung][27] disabling it on their early 2016 flagships. Samsung stated that "We believe that our users want a microSD card to transfer files between their phone and other devices," which was not possible once the card was formatted to ext4.

Google's implementation let users choose between portable and internal formatting options. But rather than give users that choice, OEMs completely took the internal storage feature away. Advanced users were unhappy about this, and of course the Android modding scene quickly re-enabled adoptable storage. On the Galaxy S7, modders actually defeated Samsung's SD card lockdown [a day before][28] the device was even officially released!

#### Volume and Notifications


*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/1-2-150x150.jpg)
    ][16]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/2-4-150x150.jpg)
    ][17]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/dnd1-150x150.jpg)
    ][18]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/2015-09-13-05.13.49-150x150.png)
    ][19]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/2015-09-08-19.58.51-150x150.png)
    ][20]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/dnd11-150x150.jpg)
    ][21]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/dnd4-150x150.jpg)
    ][22]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2016/10/3-3-150x150.jpg)
    ][23]
*   [
     ![](https://cdn.arstechnica.net/wp-content/uploads/2015/09/2015-09-08-19.23.13-150x150.png)
    ][24]

Google walked back the priority notification controls that were in the volume popup in favor of a simpler design. Hitting the volume key popped up a single slider for the current audio source, along with a drop down button that expanded the controls to show all three audio sliders: Notifications, media, and alarms. All the priority notification controls still existed—they just lived in a "do not disturb" quick-settings tile now.

One of the most relieving additions to the notification controls gave users control over Heads-Up notifications—now renamed "Peek" notifications. This feature let notifications pop up over the top portion of the screen, just like on iOS. The idea was that the most important notifications should be elevated over your normal, everyday notifications.

However, in Lollipop, when this feature was introduced, Google had the terrible idea of letting developers decide if their apps were "important" or not. Of course, every developer thinks its app is the most important thing in the world. So while the feature was originally envisioned for instant messages from your closest contacts, it ended up being hijacked by Facebook "Like" notifications. In Marshmallow, every app got a "treat as priority" checkbox in the notification settings, which gave users an easy ban hammer for unruly apps.

--------------------------------------------------------------------------------

作者简介：

Ron is the Reviews Editor at Ars Technica, where he specializes in Android OS and Google products. He is always on the hunt for a new gadget and loves to rip things apart to see how they work.

--------------------------------------------------------------------------------

via: http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/32/

作者：[RON AMADEO][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
