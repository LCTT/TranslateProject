# 火狐是否在未经授权的情况下搜集您的数据？



 ![Mozilla Firefox collects your data](https://iwf1.com/wordpress/wp-content/uploads/2016/11/Mozilla-Firefox-collects-your-data-730x429.jpg)

使用Firefox Web浏览器打包的地理位置服务即使其被关闭也会在后台运行。

我们还没有从关于浏览器插件丑闻的新闻中恢复过来。插件原本目的是保卫隐私，**但现在却把信息卖给了第三方公司**。然而更令人愤怒的是其规模完全超出我们的预期。

**MLS**是Mozilla位置服务，其架构类似于WIFI接入点、无线电基站和蓝牙信标，可以让让设备通过网络确定其位置。

MLS非常像是Google位置服务，后者是需要在Android设备上打开GPS并选择“高精度”模式时使用的服务。

那些曾经经历过GPS问题的人可能会知道这个模式是多么精确。

MLS服务除了能够准确地确定您的位置以外，通过使用WiFi网络的服务能够收集两种个人身份信息，包括

**对数据库做出贡献的用户**和**被扫描的WiFi设备的所有者**。

话虽这么说，Mozilla也提到说你可以选择退出服务，但你真的可以退出吗？



### 当后台变成你隐私的展台

作为一个众包项目，为了维护和发展MLS，Mozilla事实上非常依赖于用户的贡献，因此他们开发了多种方法以便用户参与进来。

其中之一，就是被终端用户使用的一款名为Stumbler的Android应用程序：

> Mozilla Stumbler是一个开源的无线网络扫描器，它为我们的crowd-sourced位置数据库收集GPS，蜂窝和无线网络元数据。[1]

这样以来，Stumbler不仅仅是一个独立的应用程序，同时也是Firefox 在Android设备上提供的一种为MLS“贡献数据和增强功能”的服务。

该服务的问题在于它在后台运行，而大多数用户都不知道它，**即使您可能已经禁用它**。

根据Mozilla提供的信息 [1]，要启用该服务，您需要打开设置菜单（在Firefox for Android版本中） - >打开隐私部分 - >滚动到底部以查看数据选择，最后，勾选Mozilla位置服务框。

[
 ![Mozilla Location Services is unchecked yet Stumbler is on](http://iwf1.com/wordpress/wp-content/uploads/2016/11/Mozilla-Location-Services-is-unchecked-yet-Stumler-is-on-730x602.jpg) 
][3]

Mozilla定位服务尚未勾选，但Stumbler已开启

实际上，你会发现Stumbler服务**正在你的设备后台运行**，这意味着它几乎不可见，因为它没有接口，即使MLS框未被选中，即使所有的数据选择复选框都未选中，甚至Firefox浏览器本身已被关闭。

显然，停止stumbler的唯一方法是直接结束它。然而，这样做你首先需要一种方法来检测它的运行和结束，最终，这只是一个设备重启前的临时解决方案。



### 如何保证安全

为了避免MLS收集您的数据，仍然有一些方法值得您尝试一下，希望这些方法不会像在Firefox for Android中的MLS复选框一样被Mozilla忽视。

您可以将您的无线网络SSID隐藏或者在SSID结尾添加“_nomap”,例如将您的SSID从“myWirelessNetwork”更名为“myWirelessNetwork_nomap”。这在向Mozilla的应用程序暗示，您不希望参与他们的数据收集活动。

对于Android上的Stumbler服务，由于是一个服务（而不是进程），您可能无法在运行的进程/最近的应用程序列表中看到它。 因此，使用专用应用程序关闭它或启用“开发人员选项”，并转到“运行服务” - >点击Firefox，最后，停止“stumbler”。



--------------------------------------------------------------------------------

via: https://iwf1.com/is-mozilla-firefox-collecting-your-data-without-your-consent/

作者：[Liron][a]
译者：[flankershen](https://github.com/flankershen)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://iwf1.com/is-mozilla-firefox-collecting-your-data-without-your-consent/
[1]:https://iwf1.com/shock-this-popular-browser-add-on-sells-your-browsing-history/
[2]:https://en.wikipedia.org/wiki/Crowdsourcing
[3]:http://iwf1.com/wordpress/wp-content/uploads/2016/11/Mozilla-Location-Services-is-unchecked-yet-Stumler-is-on.jpg
