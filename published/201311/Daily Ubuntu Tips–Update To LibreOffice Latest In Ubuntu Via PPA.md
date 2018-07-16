Ubuntu每日小技巧：通过PPA升级你的LibreOffice
================================================================================
对于每一个你新安装的Ubuntu系统，你都会拥有一个可以让你办公的办公工具——LibreOffice。很多人都知道微软公司的的Word、Excel、PowerPoint和Outlook，但是很少有人知道LibreOffice。

LibreOffice靠来自全世界的志愿者来维护，由一个慈善基金会支持。它是Linux社区的一款主要的免费办公工具。它可以安装在Windows，Mac OS X和Linux等系统的计算机上。

就在5天前（译注：好吧，这个翻译稿拖了5天了~~，原文为“今天”。），一个新的版本将面向公众开放了。Windows，Mac OS X和Linux用户可以直接从下载页面下载最新版本了。

Ubuntu用户拥有添加LibreOffice软件仓库到自己的电脑来安装升级最新版的优势。如果你想要在最新版本可用时最快的得到它，这种方法将会很有用。

最新的LibreOffice套装版本是4.1。每一个后续的版本可以立即在4.1的仓库中找到，直到新的主线版本比如4.2的推出。

所以，为了在Ubuntu中自动的升级，请添加下面的软件仓库地址。

    sudo add-apt-repository ppa:libreoffice/ppa

接着，运行如下命令来升级最新的LibreOffice。

    sudo apt-get update && sudo apt-get dist-upgrade

这样就好了。当你添加上面的仓库然后升级系统，Ubuntu将会自动的下载安装最新的LibreOffice版本。

Windows和Mac OS X用户可以直接在程序套件中升级或者直接从网页中下载。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/libreoffice-upgrade-ubuntu.png)

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tipsupdate-to-libreoffice-latest-in-ubuntu-via-ppa/

译者：[SCUSJS](https://github.com/scusjs) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
