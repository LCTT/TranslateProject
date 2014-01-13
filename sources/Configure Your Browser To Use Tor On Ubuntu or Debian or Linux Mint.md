Ubuntu/Debian/Linux Mint 系统中使用 Tor 配置你的浏览器
================================================================================
**Tor**, **T**he **O**nion **R**outer (洋葱路由)，是一种虚拟通道网络，它可使用户安全以及匿名的进行互联网通信。Tor 可以让组织及个人通过公共网络分享信息而不用担心隐私会泄露。我们可以用 Tor 来避免网站追踪我们及我们家人的信息，也可以用来连接新闻网站、即时通讯服务或者那些被网络提供商和网络管理员封锁的网站。

Tor 最初是当做第三代[美国海军研究实验室的洋葱路由项目][1]而设计、实现及发展起来的。在美国海军心中，最初设计的目的是为了政府通信的安全，但今天，每天都以各式各样的目的而被普通人、军队、记者、执法人员、活动家以及其他更多的人使用。

这篇快速教程中，我们会学到怎么在浏览器上使用 Tor。下面所示的操作步骤是 Ubuntu 13.04 桌面系统中测试的，但它在所有的 Debian/Ubuntu 系统及它们的衍生系统中应该也适用。

### 在 Ubuntu / Debian / Linux Mint 上安装 Tor 和 Vidalia ###

Tor 在 Debian/Ubuntu 系统的默认源库中已经存在，但它们有点过时了。所以得把 Tor 源库加入你的发布版本的源列表中。

编辑 **/etc/apt/sources.list** 文件，

    $ sudo nano /etc/apt/sources.list

根据你系统的发行版本添加如下的一行。因为在我的 Ubuntu 13.04 桌面系统上做测试，所以我添加了如下的一行。

    [...]
    deb     http://deb.torproject.org/torproject.org raring main

保存并关闭文件。如果你使用的是 buntu 13.10 系统，添加行应该是，

    deb     http://deb.torproject.org/torproject.org saucy main

Debian 7 Wheezy 如下：

    deb     http://deb.torproject.org/torproject.org wheezy main

用如下命令添加 gpg 键：

    $ gpg --keyserver keys.gnupg.net --recv 886DDD89 
    $ gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -

用下面命令更新源库列表及安装 vidalia：

    $ sudo apt-get update
    $ sudo apt-get install tor vidalia deb.torproject.org-keyring

During installation, you’ll be asked which user should be able to control Tor service. Select the user and click Ok.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/sk@sk-_013.jpg)

Now Vidalia is installed and running.

### Configure Firefox Browser ###

Open your browser. Go to **Edit -> Preferences -> Advanced -> Network ->Settings**. Select manual Proxy Configuration. In the SOCKS Host column, enter **localhost** or **127.0.0.1** and in the port column enter **9050** as shown in the below screenshot.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/Firefox-Preferences_015.jpg)

Now point your browser with URL **https://check.torproject.org/**. You will see a green message that indicates: “**Congratulations. This browser is configured to use Tor**”. Red message indicate that Tor is not setup. Refer the following screenshot.

![Are you using Tor? - Mozilla Firefox_014](http://180016988.r.cdn77.net/wp-content/uploads/2013/12/Are-you-using-Tor-Mozilla-Firefox_014.jpg)

The same settings are applicable for all browsers, just open the Browser settings/preferences window, find the Network settings, Enter **127.0.0.1** in proxy server column and **9050** in port box. To disable Tor, Select **Use System Proxy settings** on browser settings.

**Note**: If you want to use Tor for anonymous web browsing, please read our article about [Tor Browser Bundle][2]. It comes with readily configured Tor and a browser patched for better anonymity. To use SOCKS directly (for instant messaging, Jabber, IRC, etc), you can point your application directly at Tor (localhost port 9050), but see [this FAQ entry][3] for why this may be dangerous.

That’s it. Good Luck! Stay Safe!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/configure-browser-use-tor-ubuntu-debian-linux-mint/

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.onion-router.net/
[2]:http://www.unixmen.com/protect-your-online-privacy-with-tor-browser/
[3]:https://trac.torproject.org/projects/tor/wiki/doc/TorFAQ#SOCKSAndDNS