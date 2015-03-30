使用“最近通知工具”保持桌面通知历史
================================================================================
![How to see recent notifications in Ubuntu 14.04](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/recent_notifications_Ubuntu_14.jpeg)

大多数桌面环境像Unity和Gnome都有通知特性。我很喜欢其中一些。它尤其当我[在Ubuntu上收听流媒体][1]时帮到我。默认上通知会在桌面的顶部显示几秒接着就会消失。如果你听见了通知的声音但是没有看到内容怎么办？你该如何知道通知的内容？

如果你可以看到最近所有通知的历史会很棒吧？是的，我知道这很棒。你可以在Ubuntu Unity或者Gnome中使用最近**通知小工具**来追踪所有的最近通知。

最近通知位于顶部面板，并且记录了最近所有通知的历史。当它捕获到新的通知后，它就会变绿来表明你有未读的通知。

![Recent notifications in Ubuntu 14.04](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/recent_notifications_Ubuntu.jpeg)

当你点击它后，你就会看到最近所有的通知。你可以选择清空所有或者删除部分。

![Recent notifications applet indicator](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/recent_notifications_Ubuntu_1.jpeg)

不幸的是它没有配置选项。因此你不能屏蔽特定程序的通知。所有的通知都会被保存。

### 在Ubuntu 14.04 和 14.10 中安装最近通知工具 ###

一般说来这个最近通知工具应该也可以在Linux Mint Cinnamon版本中运行。你可以试一试。使用下面的命令来在在Ubuntu 14.04 和 14.10 中安装最近通知工具：

    sudo add-apt-repository ppa:jconti/recent-notifications
    sudo apt-get update
    sudo apt-get install indicator-notifications

安装完成后，重新登录后你就可以用了。现在妈妈再也不用担心我的通知没看到了。很方便的小工具，不是么？

--------------------------------------------------------------------------------

via: http://itsfoss.com/notifications-appindicator/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/apps-internet-streaming-radio-ubuntu/