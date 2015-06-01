使用 ARChon 运行时环境在 Ubuntu 上运行 Android 应用
================================================================================

在此之前，我们尝试过在多款安卓应用模拟器工具上运行安卓应用，比如Genymotion、VirtualBox和Android SDK等。但是，有了这套全新的Chrome安卓运行环境，就可以在Chrome浏览器中运行安卓应用了。所以，下面是一些步骤来指导你如何使用ARChon运行时环境在Ubuntu上安装安卓应用。

谷歌已经公布了[首批支持原生运行在Chrome OS的安卓应用][1]，而这个全新的“**安卓运行时环境**”扩展程序使其成为可能。如今，一位名为Vlad Filippov的开发者已经找到了一种把安卓应用移植到桌面端Chrome浏览器的方法。他把chromeos-apk脚本和ARChon安卓运行环境扩展程序两者紧密结合在一起，使得安卓应用可以运行在Windows、Max和Linux系统的桌面端Chrome浏览器中。

应用借助这种运行环境时的性能并不是很好。同样，由于它是官方运行环境的非官方二次开发包，而且运行在Google的Chrome OS之外，因此一些如摄像头和喇叭等系统内置设备可能需要通过打补丁获得或者根本不支持。

### 安装Chrome ###

首先，需要在机器上安装Chrome，版本要求是Chrome 37或者更高。可以从[Chrome浏览器的下载页面][2]下载。

如果打算安装开发通道版本，按照如下操作。

使用这个命令为Google Chrome添加软件源列表：

    $ wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    $ sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

![Adding google source list](http://blog.linoxide.com/wp-content/uploads/2015/02/adding-google-source-list.png)

添加完软件源列表后，使用下列命令更新本地的软件库索引。

    $ sudo apt-get update

现在，就可以安装非稳定版的google chrome，即开发版：

    $ sudo apt-get install google-chrome-unstable

![Installing Google chrome unstable](http://blog.linoxide.com/wp-content/uploads/2015/02/installing-google-chrome-unstable.png)

### 安装Archon运行时环境 ###

接下来，需要下载定制版的运行环境安装包，因为官方版本不被Google或Vlad Filippov创建的Chromium安卓运行环境认可。它在很多方面有别于官方版本，主要区别是它可以用于Google浏览器的各个桌面端。下面是需要下载的运行环境安装包，请根据所安装的Ubuntu系统位数选择下列的一种。

**32位** Ubntu发行版：

- [下载 32 位版 Ubuntu 上的 Archron][3]

**64位** Ubntu发行版：

- [下载 64 位版 Ubuntu 上的  Archron][4]

下载好运行环境安装包后，从.zip文件中解压，并将解压得到的目录移动到Home目录。操作命令如下：

    $ wget https://github.com/vladikoff/chromeos-apk/releases/download/v3.0.0/ARChon-v1.1-x86_32.zip

![Downloading ARChon](http://blog.linoxide.com/wp-content/uploads/2015/02/download-archon.png)

    $ unzip ARChon-v1.1-x86_32.zip ~/

接下来是安装运行时环境，首先打开Google Chrome浏览器，在地址栏键入**chrome://extensions**。然后，选中“**开发者模式**”。最后，点击“**载入未打包扩展程序**”，选择刚才放置在**~/Home**下面的文件夹。

### 安装 ChromeOS-APK ###

如果要用到上面提到的那些应用，那么手动转换这些APK无需复杂的操作——只需要安装“[chromeos-apk][5]”命令行JavaScript工具。可以在Node Package Modules（npm）管理器中安装它。为了安装npm和chromeos-apk，在shell或终端中运行下面命令：

    $ sudo apt-get install npm nodejs nodejs-legacy

如果**操作系统是64位**，需要安装下面这个库，命令如下：

    $ sudo apt-get install lib32stdc++6

然后，运行这条命令来安装最新的chromeos-apk：

    $ npm install -g chromeos-apk@latest

![chromeos apk installation](http://blog.linoxide.com/wp-content/uploads/2015/02/chomeos-apk-installation.png)

取决于系统配置，可能需要以sudo权限运行后一条命令。

现在，我们将找一个应用程序的APK来在Google浏览器上试一试，但务必牢记**并非所有的安卓应用都可以**，有一些可能不稳定或者缺少某些特性。大部分安装即用的通讯类应用都不适用这个环境。

### 转换APK ###

将**安卓APK放到~/Home**下，然后在**终端**执行下列命令进行转换：

    $ chromeos-apk myapp.apk --archon

如果想以全屏模式运行应用，请替换成这条命令：

    $ chromeos-apk myapp.apk --archon --tablet

注意：请将myapp.apk替换成待转换的安卓APK应用的文件名。

为了方便，也可以使用[Twerk][6]来进行转换，这样可以跳过这一步。

### 运行安卓Apk ###

最后，打开chrome浏览器，然后进入chrome://extensions页面，勾选开发者模式。点击“载入未打包扩展程序”按钮，选择上面脚本刚创建的文件夹。

至此，就可以打开Chrome应用启动器运行安卓应用了。

### 总结 ###

万岁！我们已经成功在Chrome浏览器中安装好安卓Apk应用程序了。这篇文章是关于一款由Vlad Filippov开发的、名为Archon的、时下流行的Chrome安卓运行环境。这个运行环境使用户在Chrome浏览器中运行转换过的Apk文件。目前它还不支持通讯类应用，诸如Whatsapp。因此，如果你有任何问题、建议和反馈，请在下面的评论框中写出来。非常感谢！去拥抱Archon吧！:-)

--------------------------------------------------------------------------------

via: http://linoxide.com/ubuntu-how-to/android-apps-ubuntu-archon-runtime/

作者：[Arun Pyasi][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://chrome.blogspot.com/2014/09/first-set-of-android-apps-coming-to.html
[2]:https://www.google.com/chrome/browser
[3]:https://github.com/vladikoff/chromeos-apk/releases/download/v3.0.0/ARChon-v1.1-x86_32.zip
[4]:https://github.com/vladikoff/chromeos-apk/releases/download/v3.0.0/ARChon-v1.1-x86_64.zip
[5]:https://github.com/vladikoff/chromeos-apk/blob/master/README.md
[6]:https://chrome.google.com/webstore/detail/twerk/jhdnjmjhmfihbfjdgmnappnoaehnhiaf