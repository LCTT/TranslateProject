安卓应用乾坤大挪移，Ubuntu上的搬运工：ARChon
================================================================================
![Android, Chrome, Ubuntu](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/android-ubuntu.jpg)


**Google最近发布了首批[能在Chrome OS本地运行的安卓应用集][1]，通过‘安卓运行时’扩展完成了该壮举。**

现在，一位开发者已经[指明了将安卓应用带入桌面版Chrome的路][2]。

[弗拉德·菲利波夫][3]的[chromeos-apk脚本][4]和[ARChon安卓运行时扩展][5]手拉手一起开展工作，将安卓应用带进了Windows，Mac和Linux桌面上的Chrome中。

![IMDB, Flipboard and Twitter Android Apps running on Ubuntu 14.04 LTS](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/android-apps-on-linux.jpg)

*运行在Ubuntu 14.04 LTS上的安卓应用：IMDB，Flipboard和Twitter*

通过‘安卓运行时’运行的应用的性能不是很令人惊异，任何想要运行Dead Trigger 2或者其它图形密集型游戏的雄心壮志可以放到一边了。

同样地，要运行官方的‘安卓运行时’的非官方重构包，或者在Chrome OS之外运行的话，其系统完整性（如网络摄像头，扬声器等）可能不完整或者根本不可能。

按照下面的指南一步步来，并不保证一定成功。它只能作为高度实验性进行，里面遍布漏洞，很不稳定——甚至白日见鬼。只能出于好奇而尝试，不要高度寄予厚望，这样你就不会深受其困扰。

### 安卓应用转战Linux大法 ###

要通过Chrome在Linux上运行安卓应用，很明显，你需要安装Chrome，要求的版本是37，或者更高。坦率地讲，如果你打算玩玩不稳定的Chrome版本，那么你也可以下载并[为Linux安装][6]。

如果已经安装了Chrome的某个版本？你可以通过命令行来安装不稳定版，命令如下：

    sudo apt-get install google-chrome-unstable

有了 Chrome 之后，你需要下载定制版的‘安卓运行时’扩展，而不是Google或Chronium提供的版本——由弗拉德·菲利波夫创建的‘安卓运行时’。这个版本和官方的有着诸多的不同，最突出的不同就是它可以运行在桌面版的浏览器上。

- [从BitBucket下载ARChon v1.0][7]

下载好‘安卓运行时’扩展后，你需要从.zip解压内容，并移动解压后的文件夹到你的Home文件夹。

要安装它，打开Google Chrome，点击汉堡式菜单按钮，然后导航到扩展页。检查‘启用开发者模式’并点击‘加载解包的扩展’按钮。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/chromeos-apk-extensions.jpg)

‘安卓运行时’扩展本身不会做太多事情，所以你需要从安卓应用创建兼容包。要完成这项工作，你需要‘[chromeos-apk][8]’[命令行Javascript工具][9]，它可以从“Node 封装模块管理器（npm ）”安装。

首先运行：

    sudo apt-get install npm nodejs nodejs-legacy

Ubuntu 64位用户？你还需要获取以下库：

    sudo apt-get install lib32stdc++6

现在，运行npm命令来安装该脚本吧：

    npm install -g chromeos-apk

根据你的配置，你可能需要过会儿使用sudo来运行。如果你不喜欢[通过sudo安装npm模块，你可以][10]试着骗过它。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/chromeos-apk-npm.jpg)

现在，搞定了。去Google找找你想要试试的应用的APK吧，请牢记**不是所有的安卓应用都会工作**，而**那些可以工作的也未必工作得很好**，或者缺少功能。

把你想要的安卓APK放到~/Home，然后回到终端中使用以下命令来转换，你可以将APK命名成任何你想要的名字：

    chromeos-apk replaceme.apk --archon

该命令将花一点时间来完成这项工作，也许也就是一眨眼的时间。[实际上，不需要眨眼的时间][11]

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/09/chromeos-apk-archon-750x184.jpg)

现在，在你的Home文件夹内有个ARChon生成的Chrome APK extension-y folder-y这样的东西。所有剩下来要做的事，就是安装并查看它是否正常工作！

回到chrome://extensions页面，再次轻敲‘加载解封装扩展’按钮，但这次选择上面脚本创建出来的文件夹。

应用应该会正确安装，但是它确实会没有问题吗？打开Chrome应用启动器或应用页面并启动它来看看是否有问题。

#### 深度探索 ####

由于ARChon运行时支持不限数量的chrome化的APK，你可以反复进行该操作，你想做多少次都行。Chrome APK [subreddit][12]用于跟踪成功/失败情况，所以如果你感到很有用，一定要贴出你的结果。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/09/install-android-apps-ubuntu-archon

作者：[Joey-Elijah Sneddon][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:http://www.omgchrome.com/first-4-chrome-android-apps-released/
[2]:http://www.omgchrome.com/run-android-apps-on-windows-mac-linux-archon/
[3]:https://github.com/vladikoff/
[4]:https://github.com/vladikoff/chromeos-apk
[5]:https://github.com/vladikoff/chromeos-apk/blob/master/archon.md
[6]:http://www.chromium.org/getting-involved/dev-channel
[7]:https://bitbucket.org/vladikoff/archon/get/v1.0.zip
[8]:https://github.com/vladikoff/chromeos-apk/blob/master/README.md
[9]:https://github.com/vladikoff/chromeos-apk/blob/master/README.md
[10]:http://stackoverflow.com/questions/19352976/npm-modules-wont-install-globally-without-sudo/21712034#21712034
[11]:https://www.youtube.com/watch?v=jKXLkWrBo7o
[12]:http://www.reddit.com/r/chromeapks
