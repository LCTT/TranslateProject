每日Ubuntu小技巧：一款轻量级的Email阅读器Geary
================================================================================

正如大家所知，Ubuntu 本身自带可以收发邮件的客户端——Thunderbird，当然它也支持Gmail，Yahoo Mail，Microsoft Outlook 等等支持IMAP协议的邮件服务。

Thunderbird 是一个功能强大的邮件客户端，只要email客户端所需要的功能，它都能够做到。但是如果你想选择一个能在够在GNOME 下运行的轻量级客户端，Geary 是一个不错的选择。

Geary 是一个界面简洁，能让你快捷方便的地阅读邮件的免费程序。它所有的对话均展示在一个简洁的面板上，这样你可以不必点击鼠标来切换消息。

Geary 还支持IMAP 协议，所以你可以使用Google, Yahoo 和 Microsoft 这样的在线邮箱服务。

以Ubuntu 13.10用户为例，Geary 可以在Ubuntu 的软件中心获取。只要运行以下命令即可安装Geary 。

    sudo apt-get install geary

在以前的Ubuntu 版本中，键盘按下**Ctrl – Alt – T** 可以打开终端。打开之后，运行以下命令增加PPA源。

    sudo add-apt-repository ppa:yorba/ppa

接下来运行以下命令来升级系统和安装Geary 。

    sudo apt-get update && sudo apt-get install geary

第一次启动Geary时，你需要设置你的Gmail，Yahoo 或 Microsoft 电子邮件帐户。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/gearyubuntu.png)

设置非常的简单，只要输入你的账号信息，Geary 就会自动配置好你的账号。

若想卸载Geary ，首先要从系统中移除它的PPA源，要运行的命令如下。

    sudo add-apt-repository -r ppa:yorba/ppa

然后再运行以下命令卸载Geary 。

    sudo apt-get remove geary 

就这么简单~

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-get-geary-a-lightweight-email-reader-in-ubuntu/

译者：[NearTan](https://github.com/NearTan) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
