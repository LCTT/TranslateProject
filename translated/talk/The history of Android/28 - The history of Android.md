安卓编年史
================================================================================

>让我们跟着安卓从 0.5 版本到 7 的无尽迭代来看看它的发展历史。

#### ART——为未来提供了一个平台的安卓运行时

安卓里没有多少组件的血统能追溯到 1.0 时代，但在 2014 年 Dalvik 这个驱动安卓应用的运行时是它们中的一员。Dalvik 最初是为单核，低端性能设备设计的，而且存储和内存占用的优先级要高于性能表现。在过去的几年里，谷歌给 Dalvik 扩充了越来越多的更新，比如 JIT 支持，并发垃圾回收，以及多进程支持。但是随着多核手机的出现，它们比 T-Mobile G1 快上很多倍，而这些功能升级扩充只能帮安卓到这里了。

解决方案就是用 ART 这个安卓运行时替换 Dalvik，这是一个完全为现代智能手机硬件重写的应用引擎。ART 更强调性能表现和用户界面流畅度。ART 带来了一个从 JIT（Just-in-time，即时）编译到 AOT（Ahead-of-time，提前）编译的转变。JIT 会在每次应用运行的时候即时编译，节省存储空间，因为编译后的代码从不写入存储，但它消耗更多的 CPU 和内存资源。AOT 会将编译后的代码保存到存储，让应用启动的时候更快并减少内存使用。ART 会在设备上将编译代码作为安装的一部分进行，而不分发预编译的代码，这样编译器可以进行一些针对特定设备的优化。ART 还带来了 64 位支持，扩大了内存寻址范围，由 64 位指令集带来更佳的性能表现（特别是在媒体和加密应用上）。

而最好的部分是这个变化将这些性能优化和 64 位支持带给了每个 java 安卓应用。ART 为每个 java 应用生成代码，因此任何对 ART 的改进都自动应用到了这些应用。同时 ART 也是在未来的升级计划下写就，所以它能够和安卓一同进化。

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

Material Design 带来了一个几乎对安卓所有界面的完全翻新。首先，整个核心系统界面改变了。安卓得到了一个全新的按钮集合，看起来有点像是 PlayStation 的手柄：三角形，圆形以及正方形按钮，分别代表后退，主屏幕，和最近应用。得益于全新的图标集，状态栏也是焕然一新。

最近应用获得了大翻新。从一个小略缩图纵向列表变成了一个巨大的，几乎全屏的略缩图串联列表。它还获得了一个新名字（也没那么守旧），“概览（Overview）”。这明显是受到了前面版本的 Chrome 标签页切换器效果的启发。

顺带一说，在这个安卓版本里 Chrome 的标签页切换器效果消失了。作为一种将 Web 应用与本地应用同等对待的尝试，Chrome 标签合并到了概览列表。是的：最近“应用”列表现在显示的是最近打开的应用，加上最近打开的网站。在棒棒糖中，最近应用列表还采取了一种“以文档为中心”的方法，意味着应用可以在最近应用列表中显示多个项目。比如你在 Google Docs 中打开了两个文档，它们都会显示在最近应用中，让你可以在它们之间轻松切换，而不用到应用的文件列表去来回切换。

通知面板是全新的。谷歌给通知面板带来了“卡片”主题，将每个项目归整到它自己的矩形中。单个通知条目从黑色背景变成了白色背景，有了更佳的排版和圆形图标。这些新通知来到了锁屏上，将它从一个最没用的中间屏变成了很有用的屏幕，用于展示“这里是你不在的时候发生的事情”。

全屏的通知，比如来电以及闹钟，都被抛弃了，取而代之的是在屏幕顶部弹出一个“抬头”通知。抬头通知也对“高优先级”应用可用，最初这是为即时消息设计的。但是否是高优先级的通知这取决于开发者的决定，在开发者意识到这可以让他们的通知更显眼之后，所有人都开始使用它。之后版本的安卓通过给用户提供“高优先级”的设置解决了这个问题。

谷歌还给棒棒糖添加了一个单独的，但很相似的“优先”通知系统。“优先”通知是一个介于完全静音和“提醒一切消息”之间的模式，允许用户将特定的联系人和应用标记为重要。优先模式只会为这些重要的人发出提醒。在界面上来看，它采用了音量控制附加通知优先级控制以及设置中心添加一项优先通知新设置的形式。当你处在优先模式的时候，状态栏会有一颗星形标识。

快速设置获得了一系列的大改善。控制项现在是一块在通知_上面_的面板，所以它可以通过“两次下拉”手势来打开它。第一次下拉会打开通知面板，第二次下拉手势会缩小通知面板并打开快速设置。快速设置的布局变了，抛弃了平铺排列，转为一个单独面板上的一系列浮动按钮。顶部是十分方便的亮度调节条，之后是连接，自动旋转，手电筒，GPS，以及 Chromecast 的按钮。

快速设置现在还有了实际的内嵌面板。它可以在主界面显示无线网络接入点，蓝牙设备，以及移动数据使用量。


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

Material Design 革新给了几乎每个应用一个新图标，并带来了一个更明亮，白色背景的应用抽屉。默认应用阵容也有了很大的变化。和这些新应用问声好吧：通讯录，谷歌文档，Fit，信息，照片，Play 报亭，以及谷歌幻灯片。和这些死去的应用说再见吧：相册，G+ 照片，People，Play 杂志，电子邮件，以及 Quickoffice。

这些新应用中很多来自 Google Drive，从一个单独的大应用分割成每个产品一个应用。现在我们有了云端硬盘，文档，表格，以及幻灯片，都来自于云端硬盘团队。云端硬盘同时也要对 Quickoffice 的死亡负责，云端硬盘团队令它元气大伤。在“谷歌从来没法做好决定”分类下：通讯录从“People”改回了“Contacts”，短信应用在运营商的要求下叫回了“Messenger”。（那些运营商_不_喜欢谷歌环聊插手短信的职能。）我们有项真正的新服务：谷歌健身，一个健康追踪应用，可以在安卓手机和安卓手表上工作。Play 杂志也有了新的设计，添加了网站内容，所以它改名叫“Play 报亭”。

还有更多的谷歌专有应用接管 AOSP 的例子。

*   “G+ 照片”变成了“谷歌照片”，并取代了 AOSP 的相册成为默认照片应用，而相册也就随之消亡了。改名成“谷歌照片”是为照片应用[退出 Google+][16]并成为独立服务做准备。谷歌照片的发布在棒棒糖发布之后六个月——暂时应用只像是 Google+ 应用换了个图标和界面设计。
*   Gmail 从电子邮件应用接管了 POP3，IMAP 以及 Exchange 邮件的任务。尽管死掉的电子邮件应用还有个图标，但那是假的——它仅仅只显示一条信息，告诉用户从 Gmail 应用设置电子邮件账户。
*   “People”到“Contacts”的变化实际上是变为谷歌通讯录，又是一个取代 AOSP 对应应用的例子。

--------------------------------------------------------------------------------

via: http://arstechnica.com/gadgets/2016/10/building-android-a-40000-word-history-of-googles-mobile-os/28/

作者：[RON AMADEO][a]
译者：[alim0x](https://github.com/alim0x)
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
