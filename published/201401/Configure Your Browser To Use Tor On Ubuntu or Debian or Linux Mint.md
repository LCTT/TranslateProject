Ubuntu/Debian/Linux Mint 系统中使用 Tor
================================================================================
**Tor**, **T**he **O**nion **R**outer (洋葱路由)，是一种虚拟通道网络，它可使用户安全以及匿名的进行互联网通信。Tor 可以让组织及个人通过公共网络分享信息而不用担心隐私会泄露。我们可以用 Tor 来避免网站追踪我们及我们家人的信息，也可以用来连接新闻网站、即时通讯服务或者那些被网络提供商和网络管理员封锁的网站。

Tor 最初是当做第三代[美国海军研究实验室的洋葱路由项目][1]而设计、实现及发展起来的。在美国海军心中，最初设计Tor的目的是为了政府的通信安全，但到了今天，出于各种各样的目的，Tor正在供普通人、军队、记者、执法人员、活动家以及其他更多的人每天使用。

这篇快速教程中，我们会学到怎么在浏览器上使用 Tor。下面所示的操作步骤是 Ubuntu 13.04 桌面系统中测试的，但它在所有的 Debian/Ubuntu 系统及它们的衍生系统中应该也适用。

### 在 Ubuntu / Debian / Linux Mint 上安装 Tor 和 Vidalia ###

Tor 在 Debian/Ubuntu 系统的默认源库中已经存在，但它们有点过时了。所以得把 Tor 源库加入你发行版的源列表中。

编辑 **/etc/apt/sources.list** 文件，

    $ sudo nano /etc/apt/sources.list

根据你系统的发行版本添加如下的一行。因为在我的 Ubuntu 13.04 桌面系统上做测试，所以我添加了如下的一行。

    [...]
    deb     http://deb.torproject.org/torproject.org raring main

保存并关闭文件。如果你使用的是 buntu 13.10 系统，添加行应该是，

    deb     http://deb.torproject.org/torproject.org saucy main

Debian 7 Wheezy 如下：

    deb     http://deb.torproject.org/torproject.org wheezy main

用如下命令添加 gpg 密钥：

    $ gpg --keyserver keys.gnupg.net --recv 886DDD89 
    $ gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

用下面命令更新源库列表及安装 vidalia：

    $ sudo apt-get update
    $ sudo apt-get install tor vidalia deb.torproject.org-keyring

在安装期间，你会被问到要用哪一个用户来负责 Tor 服务，选择一个用户然后点击 OK。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/sk@sk-_013.jpg)

现在 Vidalia 已经安装运行了。

### 配置火狐浏览器 ###

打开浏览器。进入 **编辑 -> 首选项 -> 高级 -> 网络 ->设置**。如下截图所示，选择手动配置代理，在 SOCKS Host 一栏，输入 **localhost** 或者 **127.0.0.1**，在端口一栏输入 **9050**。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/Firefox-Preferences_015.jpg)

现在，在浏览器上输入网址 **https://check.torproject.org/**。你会看到一个绿色的讯息：“**恭喜。这个浏览器配置为可以使用Tor**“。红色的消息表明 Tor 还没有设置。请参考下面的截图。

![你使用 Tor 吗? - Mozilla Firefox_014](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/Are-you-using-Tor-Mozilla-Firefox_014.jpg)

相同的设置适用于所有浏览器，只要打开浏览器设置/首选项窗口，找到网络设置，在代理服务器栏中输入 **127.0.0.1**,在端口选项框中输入**9050**。要禁用 Tor，在浏览器设置中选择**使用系统代理设置**。

**注意**: 如果你想使用 Tor 匿名浏览网页，请阅读我们有关[Tor浏览器套件][2]的文章,它提供了易于配置的Tor以及浏览器补丁包，以使匿名访问更方便。要直接使用SOCKS（即时通讯，Jabber，IRC等），你可以直接在 Tor（本地端口9050）配置里指向你的应用程序，但需要先看看[这些FAQ条目] [3]来了解这么做的风险。

就这么多。好运吧！保持安全！

--------------------------------------------------------------------------------

via: http://www.unixmen.com/configure-browser-use-tor-ubuntu-debian-linux-mint/

译者：[runningwater](https://github.com/runningwater) 校对：[Mr小眼儿](http://blog.csdn.net/tinyeyeser)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.onion-router.net/
[2]:http://www.unixmen.com/protect-your-online-privacy-with-tor-browser/
[3]:https://trac.torproject.org/projects/tor/wiki/doc/TorFAQ#SOCKSAndDNS
