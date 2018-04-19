对开发者来说非常好的GNOME扩展
======

![](https://fedoramagazine.org/wp-content/uploads/2018/04/gnome-extensions-for-developers-816x345.jpg)
这个扩展给与了 GNOME3 桌面环境以非常大的灵活性，这种灵活性赋予了用户在定制化桌面上的优势，从而使他们的工作流程变得更加舒适和有效率。Fedora 系统已经已经包含了一部分例如 EasyScreenCast, gTile, 和 OpenWeather 这样很好的桌面扩展，本文接下来会重点报道这些为开发者而改变的扩展。

如果你需要帮助来安装 GNOME 扩展，那么可以参考《如何安装一个 GNOME 命令行扩展》这篇文章。

### ![Docker Integration extension icon][5] Docker Integration

![Docker Integration extension status menu][6]

对于为自己的应用使用 docker 的开发者而言，这个 docker 集成扩展是必不可少的。这个状态菜单提供了一个带着启动、停止、暂停、甚至删除的这些选项的 docker 容器的列表，这个列表会在新容器加入到这个系统时自动更新。

在安装完这些扩展后，Fedora 用户可能会收到这么一条消息：“加载容器时发生错误”。这是因为 docker 命令需要在命令前加 sudo，或者得到默认的 root 权限。去设置你的用户权限再去运行 docker，可以参考 Fedora 门户网站上的 docker 安装这一页。

你可以在这个扩展的站点上找到更多的信息。

### ![Jenkins CI Server Indicator icon][10] Jenkins CI Server Indicator

![Jenkins CI Server Indicator extension status menu][11]

Jenkins CI 服务器指向仪这个扩展使开发者把他们的应用建立在 Jenkins CI 服务器上的这个过程更加简单，它展示了一个菜单，菜单中有一个带有进程和进程状态的列表。他同样包含了很多特点，比如很容易就能创建 Jenkins 的前端，为完整的进程做通知，而且能够触发或者过滤进程。

如果想要更多的信息，请去浏览开发者站点。

### ![android-tool extension icon][14] android-tool

Android-tool 对于 Android 开发者来说会是一个非常有价值的扩展，它的特点包括捕捉错误报告，设备截屏和屏幕录像。它可以通过 usb 和 tcp 连接两种方式来连接 Android 设备。

这个扩展需要 adb 的包，从 Fedora 官方仓库安装 adb 只需要运行这条命令：
```
sudo dnf install android-tools

```

你可以在这个扩展的 GitHub 网页里找到更多信息。

### ![GnomeHub extension icon][19] GnomeHub

对于为自己的项目使用 GitHub 的 GNOME 用户来说，GnomeHub 是一个非常好的扩展，它可以显示 Github 上的仓库，还可以通知用户有新提交的 pull requests。除此之外，用户可以把他们最喜欢的仓库加在这个扩展的设置里。

如果想要更多信息，可以参考一下这个项目的 GitHub 页面。

### ![gistnotes extension icon][23] gistnotes

简单地说，gistnotes 为 gist 用户提供了一种简单的方式来创建、存储和管理注释和代码片段。如果想要更多的信息，可以参考这个项目的网站。

![gistnotes window][26]

### ![Arduino Control extension icon][27] Arduino Control

这个 Arduino 控制扩展允许用户去连接或者控制他们自己的单片机电路板，它同样允许用户在状态菜单里增加滑块或者开关。除此之外，开发者模式允许扩展目录里的脚本通过以太网或者 usb 来连接电路板。

最重要的是，这个扩展可以被定制化来适合你的项目，在 README 文件里的例子是，它能够“通过网络上任意的电脑来控制你房间里的灯”。

你可以从这个项目的 GitHub 页面上得到更多的产品信息并安装这个扩展。

### ![Hotel Manager extension icon][30] Hotel Manager

![Hotel Manager extension status menu.][31]

使用 Hotel process manager 开发网站的开发人员，应该尝试一下 Hotel Manager 这个扩展。它展示了一个增加到 hotel 里的网页应用的列表，并给与了用户去开始、停止和重启这些应用的能力。
此外，还可以通过电脑图标快速打开、浏览这些网页应用。这个扩展同样可以启动、停止或重启 hotel 的后台程序。

作为本文的出版物，GNOME 3.26 版本的 Hotel Manager 版本 4 没有在扩展的下拉式菜单里列出网页应用。版本 4 还会在 Fedora 28 (GNOME 3.28) 上安装时报错。然而，版本 3 工作在 Fedora 27 和 Fedora 28。

如果想要更多细节，可以去看这个项目在 GitHub 上的网页。

### VSCode Search Provider

VSCode Search Provider 是一个简单的扩展，它能够在 GNOME 综合搜索结果里展示可视化工作代码项目。对于大部分的 VSCode 用户来说，这个扩展可以让用户快速连接到他们的项目，从而节省时间。你可以从这个项目在 GitHub 上的页面来得到更多的信息。

![GNOME Overview search results showing VSCode projects.][36]

在开发环境方面，你有没有一个最喜欢的扩展呢？发在评论区里，一起来讨论下吧。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/awesome-gnome-extensions-developers/

作者：[Shaun Assam][a]
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/sassam/
[1]:https://fedoramagazine.org/screencast-gnome-extension/
[2]:https://fedoramagazine.org/must-have-gnome-extension-gtile/
[3]:https://fedoramagazine.org/weather-updates-openweather-gnome-shell-extension/
[4]:https://fedoramagazine.org/install-gnome-shell-extension/
[5]:https://fedoramagazine.org/wp-content/uploads/2017/08/dockericon.png
[6]:https://fedoramagazine.org/wp-content/uploads/2017/08/docker-extension-menu.png
[7]:https://extensions.gnome.org/extension/1065/docker-status/
[8]:https://developer.fedoraproject.org/tools/docker/docker-installation.html
[9]:https://github.com/gpouilloux/gnome-shell-extension-docker
[10]:https://fedoramagazine.org/wp-content/uploads/2017/08/jenkinsicon.png
[11]:https://fedoramagazine.org/wp-content/uploads/2017/08/jenkins-extension-menu.png
[12]:https://extensions.gnome.org/extension/399/jenkins-ci-server-indicator/
[13]:https://www.philipphoffmann.de/gnome-3-shell-extension-jenkins-ci-server-indicator/
[14]:https://fedoramagazine.org/wp-content/uploads/2017/08/androidtoolicon.png
[15]:https://fedoramagazine.org/wp-content/uploads/2017/08/android-tool-extension-menu.png
[16]:https://extensions.gnome.org/extension/1232/android-tool/
[17]:https://fedoramagazine.org/howto-use-sudo/
[18]:https://github.com/naman14/gnome-android-tool
[19]:https://fedoramagazine.org/wp-content/uploads/2017/08/gnomehubicon.png
[20]:https://fedoramagazine.org/wp-content/uploads/2017/08/gnomehub-extension-menu.png
[21]:https://extensions.gnome.org/extension/1263/gnomehub/
[22]:https://github.com/lagartoflojo/gnomehub
[23]:https://fedoramagazine.org/wp-content/uploads/2017/08/gistnotesicon.png
[24]:https://extensions.gnome.org/extension/917/gistnotes/
[25]:https://github.com/mohan43u/gistnotes
[26]:https://fedoramagazine.org/wp-content/uploads/2018/04/gistnoteswindow.png
[27]:https://fedoramagazine.org/wp-content/uploads/2017/08/arduinoicon.png
[28]:https://extensions.gnome.org/extension/894/arduino-control/
[29]:https://github.com/simonthechipmunk/arduinocontrol
[30]:https://fedoramagazine.org/wp-content/uploads/2017/08/hotelicon.png
[31]:https://fedoramagazine.org/wp-content/uploads/2017/08/hotelmanager-extension-menu.png
[32]:https://extensions.gnome.org/extension/1285/hotel-manager/
[33]:https://github.com/hardpixel/hotel-manager
[34]:https://extensions.gnome.org/extension/1207/vscode-search-provider/
[35]:https://github.com/jomik/vscode-search-provider
[36]:https://fedoramagazine.org/wp-content/uploads/2018/04/vscodesearch.png
