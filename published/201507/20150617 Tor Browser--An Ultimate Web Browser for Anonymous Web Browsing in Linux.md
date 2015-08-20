Tor浏览器：Linux下用于匿名Web浏览的终极浏览器
================================================================================
我们大多数人都在上网方面花费很多时间。上网使用的应用程序主要是浏览器，更确切的说是一个Web浏览器。我们在网络上的大部分活动要以客户端/服务器的方式登录，这个过程会包括IP地址、地理信息、搜索、活动以及许多潜在的信息，这些信息如果以其他方式被故意使用，会存在潜在的危险性。

![在Linux中安装Tor浏览器](http://www.tecmint.com/wp-content/uploads/2014/04/Install-tor-browser-in-linux.jpg)

*Tor浏览器：匿名浏览器*

此外，美国国家安全局（NSA）这样的国际间谍机构会记录我们的数字足迹。更不必说受到控制的代理服务器也会被用来做为数据搜集服务器。并且大多数企业和公司不会允许您访问代理服务器（使您能保障自己的隐私）。

因此，我们需要的最好是一个小型、独立、可携带的应用程序，它能达到匿名的效果。Tor浏览器便是这样的一个应用，它拥有上面提到的所有功能，甚至不止于此。

这篇文章里我们会讨论Tor浏览器，它的功能、使用方式、领域、安装以及其他关于Tor浏览器的重要方面。

### 什么是Tor浏览器？ ###

Tor是一个自由分发的应用软件，以BSD许可证发布，通过其安全可靠的洋葱式的结构，允许用户匿名的进行网络浏览。从前，由于它的结构和运作机制，Tor被称为‘洋葱路由器’。这个应用是由C语言写成的。

#### Tor浏览器的功能 ####

- 跨平台可用。例如，这个应用程序在Linux、Windows和Mac下都可用。
- 在发送数据到因特网前进行复杂的数据加密。
- 在客户端进行数据自动解密。
- 它是火狐浏览器和Tor工程的结合。
- 对服务器和网站提供匿名性。
- 可以访问被限制的网站。
- 无需暴露源IP便可以执行任务。
- 可以将数据路由至/从防火墙后隐藏的服务和应用程序。
- 便携性 - 可以直接从USB存储棒上运行一个预配置的web浏览器。无需本地安装。
- 在x86和x86_64平台均可用
- 可以配置为一个运行在“localhost”的“9050”端口上的“socks4a”代理来让FTP跑在Tor 上。
- Tor拥有处理上千的中继和上百万用户的能力。

#### Tor浏览器如何工作？ ####

Tor的工作方式基于洋葱路由的概念。洋葱路由的结构类似洋葱，它的每一层都嵌套在另一层里面，就像洋葱一样。这种嵌套的结构负责多次加密数据并将其通过虚拟电路进行发送。在客户端一侧每一层都在将他传递到下一层之前解密数据。最后一层在将原始数据传递到目的地前解密最里面一层的加密数据。

在这个过程里，这种解密整个层的功能设计的如此高明以至于无法追踪IP以及用户的地理位置，因此可以限制任何人观察您访问站点的网络连接。

所有这些过程看起来有些复杂，但用户使用Tor浏览器时没有必要担心。实际上，Tor浏览器的功能像其他浏览器一样（尤其是Mozilla的Firefox）。

### 在Linux中安装Tor浏览器 ###

就像上面讨论的一样，Tor浏览器在Linux和Windows以及Mac下都可用。用户需要根据系统和架构的不同在下面的链接处下载最新的版本（例如，Tor浏览器4.0.4）。

- [https://www.torproject.org/download/download-easy.html.en][1]

在下载Tor浏览器后，按说我们需要安装它，但是Tor的好处是我们不需要安装它。它能直接从随身设备中运行，并且该浏览器可以被预配置。这意味着插件和运行的特性可以完美的移植。

下载打包文件（*.tar.xz）后我们需要解压它。

**32位系统**

    $ wget https://www.torproject.org/dist/torbrowser/4.0.4/tor-browser-linux32-4.0.4_en-US.tar.xz
    $ tar xpvf tor-browser-linux32-4.0.4_en-US.tar.xz

**64位系统**

    $ wget https://www.torproject.org/dist/torbrowser/4.0.4/tor-browser-linux64-4.0.4_en-US.tar.xz
    $ tar -xpvf tor-browser-linux64-4.0.4_en-US.tar.xz 

**注意** : 在上面的命令中，我们使用‘$‘意味着这个压缩包应以普通用户而不是root用户来解压。我们强烈建议您不要以root用户解压和运行Tor浏览器。

###开始使用Tor浏览器###

在成功的解压后，我们便可以将解压后的浏览器移动到任何地方/USB存储设备中。并从解压的文件夹以非root用户直接运行‘start-tor-browser’。

    $ cd tor-browser_en-US
    $ ./start-tor-browser

![开始使用Tor浏览器](http://www.tecmint.com/wp-content/uploads/2014/04/Starting-Tor-Network.jpg)

*开始使用Tor浏览器*

####1. 尝试连接到Tor网络####

点击“连接”之后Tor将按照设置帮您做剩下的事情。**

![连接到Tor网络](http://www.tecmint.com/wp-content/uploads/2014/04/Tor-Network-Settings.jpg)

*连接到Tor网络*

####2. 欢迎窗口/标签。####

![Tor欢迎界面](http://www.tecmint.com/wp-content/uploads/2014/04/Tor-Welcome-Screen.png)

*Tor欢迎界面*

**3. 用Tor浏览器在Youtube上看视频**

![在Youtube上看视频](http://www.tecmint.com/wp-content/uploads/2014/04/Watching-Video-on-Youtube.jpg)

*在Youtube上看视频*

####4. 打开银行网址以进行在线购物和交易####

![浏览银行站点](http://www.tecmint.com/wp-content/uploads/2014/04/Browsing-Site.jpg)

*浏览银行站点*

####5. 浏览器显示我当前的代理IP####

注意其中的文字为“Proxy Server detected”。**

![检查IP地址](http://www.tecmint.com/wp-content/uploads/2014/04/Checking-IP-Address.jpg)

*检查IP地址*

**注意**: 每次您想运行Tor时，您需要在文本模式上运行Tor启动脚本。并且该终端在您运行Tor时会一直被占用。如何克服这些，并创建一个桌面/Dock栏图标呢？

####6. 我们需要在解压的文件夹中创建`tor.desktop`####

$ touch tor.desktop

接着使用您喜欢的编辑器编辑这个文件，加入下面的文本，这里我使用nano。

    $ nano tor.desktop 

----------

    #!/usr/bin/env xdg-open
    [Desktop Entry]
    Encoding=UTF-8
    Name=Tor
    Comment=Anonymous Browse
    Type=Application
    Terminal=false
    Exec=/home/avi/Downloads/tor-browser_en-US/start-tor-browser
    Icon=/home/avi/Downloads/tor-browser_en-US/Browser/browser/icons/mozicon128.png
    StartupNotify=true
    Categories=Network;WebBrowser;

**注意**: 确保将上面的tor浏览器的路径替换为您的环境中的路径。

####7. 一旦搞定后，您就可以双击`tor.desktop`文件来运行Tor浏览器了####

您可能需要在第一次运行时信任该文件。

![Tor应用启动器](http://www.tecmint.com/wp-content/uploads/2014/04/Tor-Application-Launcher.jpg)

*Tor应用启动器*

####8. 一旦您选择了信任，请注意`tor.desktop`文件的图标则会改变###

![Tor图标已改变](http://www.tecmint.com/wp-content/uploads/2014/04/Tor-icon-changed.jpg)

*Tor图标已改变*

####9. 您可以通过拖拽`tor.desktop`的图标在桌面和Dock栏中创建快捷方式####

![在桌面添加Tor快捷方式](http://www.tecmint.com/wp-content/uploads/2014/04/Add-Tor-Shortcut-on-Desktop.jpg)

*在桌面添加Tor快捷方式*

####10. 关于Tor浏览器####

![关于Tor浏览器](http://www.tecmint.com/wp-content/uploads/2014/04/About-Tor-Browser.jpg)

*关于Tor浏览器*

**注意**: 如果您在使用旧版本的Tor，您可以从上面的窗口更新它。

#### 应用的可用性和领域 ####

- 匿名使用网络。
- 浏览被封锁的页面。
- 连接其他应用，即（FTP）来保证网络安全的访问。

#### 关于Tor浏览器的争论 ####

- 在Tor应用的边界上并没有什么安全措施。比如，数据入口点和出口点。
- 一项2011年的研究发现一种特殊的针对Tor浏览器的攻击可以得到BitTorrent用户的IP地址。
- 在一些研究中发现某些特定的协议有泄漏IP地址的倾向。
- 早些的Tor版本绑定了旧版本的Firefox浏览器，这被证明较易受JavaScript攻击。
- Tor浏览器运行起来比较慢。

#### 真实世界中Tor浏览器的实现 ####

- [Vuze BitTorrent Client][3]
- Anonymous Os
- Os’es from Scratch
- whonix 等

#### Tor浏览器的未来 ####

Tor浏览器是前途无量的。也许第一个该类应用程序的实现是非常出色的，但Tor浏览器必须加大对支持、伸缩性、以及对近期的攻击进行数据安全的研究的投入。这个应用程序是未来的需要。

#### 下载免费的电子书 ####

非官方的Tor私密浏览指南：

[![](http://img.tradepub.com/free/w_make129/images/w_make129c4.gif)][2]

### 结论 ###

如果您工作的部门不允许您访问某网站，或者如果您不希望别人知道您的私人事务，或您不想向NSA提供您的个人数字足迹，那么Tor浏览器在目前是必须的。

**注意**: Tor浏览器提供的安全性不能抵御病毒、木马或其他类似这样的安全威胁。写这篇文章的目的也不是希望通过在互联网上隐藏我们的身份来放纵非法活动。这篇文章纯粹是为了教学的目的，作者和Tecmint均不会为任何非法的使用负责。这是用户自己的责任。

Tor浏览器是一个非常不错的应用，您值得尝试！这就是我要说的全部了，我还会在这里写一些您感兴趣的文章，所以请继续关注。别忘了在留言区提供给我们您有价值的反馈。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/tor-browser-for-anonymous-web-browsing/

作者：[Avishek Kumar][a]
译者：[wwy-hust](https://github.com/wwy-hust)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://www.torproject.org/download/download-easy.html.en
[2]:http://tecmint.tradepub.com/free/w_make129/prgm.cgi
[3]:http://www.tecmint.com/install-vuze-torrent-client-in-linux/