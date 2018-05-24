开发者的最佳 GNOME 扩展
======

![](https://fedoramagazine.org/wp-content/uploads/2018/04/gnome-extensions-for-developers-816x345.jpg)

扩展给予 GNOME3 桌面环境以非常大的灵活性，这种灵活性赋予了用户在定制化桌面上的优势，从而使他们的工作流程变得更加舒适和有效率。Fedora Magazine 已经介绍了一些很棒的桌面扩展，例如 [EasyScreenCast][1]、 [gTile][2] 和 [OpenWeather][3] ，本文接下来会重点报道这些为开发者而改变的扩展。

如果你需要帮助来安装 GNOME 扩展，那么可以参考《[如何安装一个 GNOME Shell 扩展][4]》这篇文章。

###  Docker 集成（Docker Integration）

![Docker Integration extension icon][5]

![Docker Integration extension status menu][6]

对于为自己的应用使用 Docker 的开发者而言，这个 [Docker 集成][7] 扩展是必不可少的。这个状态菜单提供了一个带着启动、停止、暂停、甚至删除它们的选项的 Docker 容器列表，这个列表会在新容器加入到这个系统时自动更新。

在安装完这个扩展后，Fedora 用户可能会收到这么一条消息：“Error occurred when fetching containers.（获取容器时发生错误）”。这是因为 Docker 命令默认需要 `sudo` 或 root 权限。要设置你的用户权限来运行 Docker，可以参考 [Fedora 开发者门户网站上的 Docker 安装这一页][8]。

你可以在该[扩展的站点][9]上找到更多的信息。

### Jenkins CI  服务器指示器（Jenkins CI Server Indicator）

![Jenkins CI Server Indicator icon][10] 

![Jenkins CI Server Indicator extension status menu][11]

[Jenkins CI 服务器指示器][12]这个扩展可以使开发者在 Jenkins CI 服务器建立应用很简单，它展示了一个菜单，包含有任务列表及那些任务的状态。它也包括了一些如轻松访问 Jenkins 网页前端、任务完成提示、以及触发和过滤任务等特性。

如果想要更多的信息，请去浏览[开发者站点][13]。

### 安卓工具（android-tool）

![android-tool extension icon][14] 

![android-tool extension status menu][15]

[安卓工具][16]对于 Android 开发者来说会是一个非常有价值的扩展，它的特性包括捕获错误报告、设备截屏和屏幕录像。它可以通过 usb 和 tcp 连接两种方式来连接 Android 设备。

这个扩展需要 `adb` 的包，从 Fedora 官方仓库安装 `adb` 只需要[运行这条命令][17]：

```
sudo dnf install android-tools
```

你可以在这个[扩展的 GitHub 网页][18]里找到更多信息。

### GnomeHub

![GnomeHub extension icon][19] 

![GnomeHub extension status menu][20]

对于自己的项目使用 GitHub 的 GNOME 用户来说，[GnomeHub][21] 是一个非常好的扩展，它可以显示 GitHub 上的仓库，还可以通知用户有新提交的拉取请求。除此之外，用户可以把他们最喜欢的仓库加在这个扩展的设置里。

如果想要更多信息，可以参考一下这个[项目的 GitHub 页面][22]。

### gistnotes

![gistnotes extension icon][23] 

简单地说，[gistnotes][24] 为 gist 用户提供了一种创建、存储和管理注释和代码片段的简单方式。如果想要更多的信息，可以参考这个[项目的网站][25]。

![gistnotes window][26]

### Arduino 控制器（Arduino Control）

![Arduino Control extension icon][27]

这个 [Arduino 控制器][28]扩展允许用户去连接或者控制他们自己的 Arduino 电路板，它同样允许用户在状态菜单里增加滑块或者开关。除此之外，开发者放在扩展目录里的脚本可以通过以太网或者 usb 来连接 Arduino 电路板。

最重要的是，这个扩展可以被定制化来适合你的项目，在器 README 文件里的提供例子是，它能够“通过网络上任意的电脑来控制你房间里的灯”。

你可以从这个[项目的 GitHub 页面][29]上得到更多的产品信息并安装这个扩展。

###  Hotel Manager

![Hotel Manager extension icon][30]

![Hotel Manager extension status menu][31]

使用 Hotel 进程管理器开发网站的开发人员，应该尝试一下 [Hotel Manager][32] 这个扩展。它展示了一个增加到 Hotel 里的网页应用的列表，并给与了用户开始、停止和重启这些应用的能力。此外，还可以通过右边的电脑图标快速打开、浏览这些网页应用。这个扩展同样可以启动、停止或重启 Hotel 的后台程序。

本文发布时，GNOME 3.26 版本的 Hotel Manager 版本 4 没有在该扩展的下拉式菜单里列出网页应用。版本 4 还会在 Fedora 28 (GNOME 3.28) 上安装时报错。然而，版本 3 工作在 Fedora 27 和 Fedora 28。

如果想要更多细节，可以去看这个[项目在 GitHub 上的网页][33]。

### VSCode 搜索插件（VSCode Search Provider）

[VSCode 搜索插件][34]是一个简单的扩展，它能够在 GNOME 综合搜索结果里展示 Visual Studio Code  项目。对于重度 VSCode 用户来说，这个扩展可以让用户快速连接到他们的项目，从而节省时间。你可以从这个[项目在 GitHub 上的页面][35]来得到更多的信息。

![GNOME Overview search results showing VSCode projects.][36]

在开发环境方面，你有没有一个最喜欢的扩展呢？发在评论区里，一起来讨论下吧。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/awesome-gnome-extensions-developers/

作者：[Shaun Assam][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[hopefully2333](https://github.com/hopefully2333)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/sassam/
[1]:https://fedoramagazine.org/screencast-gnome-extension/
[2]:https://fedoramagazine.org/must-have-gnome-extension-gtile/
[3]:https://fedoramagazine.org/weather-updates-openweather-gnome-shell-extension/
[4]:https://linux.cn/article-9447-1.html
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
