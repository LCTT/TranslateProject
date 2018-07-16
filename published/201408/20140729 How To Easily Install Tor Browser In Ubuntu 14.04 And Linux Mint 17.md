简捷安装Tor浏览器到Ubuntu 14.04和Linux Mint 17中
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Tor_Browser_Ubuntu.jpeg)

牢记[美国国家安全局对全世界政府和国民的窥视][1]的尴尬结局吧，隐私日益成为许多人关心的焦点。如果你也关注在线安全性并想要保护自己不受网络监视，[Tor项目][2]是当前可用的最佳选择。

Tor项目有它自己的[Tor浏览器][3]，该浏览器基于Firefox并开启了用户隐私保护配置，并通过捆绑Tor和[Vidalia][4]工具进行匿名访问。。虽然你可以[下载Tor浏览器并使用源码安装][5]，但是我们将介绍一种更为便捷的方式，来将它安装到Ubuntu 14.04和Linux Mint 17中。

### 如何在Ubuntu 14.04和Linux Mint 17中安装Tor浏览器 ###

多亏了[Webupd8][6]，我们可以方便地通过PPA将Tor浏览器到Ubuntu和其它基于Ubuntu的OS中（如果你对源代码安装很感冒）。打开终端（Ctrl+Alt+T）并使用以下命令进行安装：

    sudo add-apt-repository ppa:webupd8team/tor-browser
    sudo apt-get update
    sudo apt-get install tor-browser

以上PPA在Ubuntu 12.04和其它基于该版本的Linux发行版中可合法使用。

#### 卸载Tor浏览器 ####

如果你想要卸载Tor浏览器，使用下面的命令即可：

    sudo apt-get remove tor-browser
    rm -r ~/.tor-browser-en

我希望这个快速测试对你**在Ubuntu 14.04和Linux Mint 17中便捷安装Tor浏览器**有所帮助。如有任何问题或者建议欢迎随时提出。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-tar-browser-ubuntu-linux-mint-17/

作者：[Abhishek][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://projects.propublica.org/nsa-grid/
[2]:https://www.torproject.org/
[3]:https://www.torproject.org/projects/torbrowser.html.en
[4]:https://www.torproject.org/projects/vidalia.html.en
[5]:https://www.torproject.org/projects/torbrowser.html.en#linux
[6]:http://www.webupd8.org/
