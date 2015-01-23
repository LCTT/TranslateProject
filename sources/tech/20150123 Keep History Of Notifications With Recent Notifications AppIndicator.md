Keep History Of Notifications With Recent Notifications AppIndicator
================================================================================
![How to see recent notifications in Ubuntu 14.04](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/recent_notifications_Ubuntu_14.jpeg)

Most of the desktop environments like Unity and Gnome have notification featured. Something which I like a lot. It specially helps me when I am listening to [streaming radio on Ubuntu][1]. But by default the notification is displayed on the top of the desktop for a couple of seconds and then it fades in disappearance. Now, what if you hear the notification sound but did not see it in time? How do you know what notification was it?

If somehow you could have a history of all recent notifications, would it not be great? Yes, I know it would be great. You can easily keep track of all recent notifications in Ubuntu Unity or GNOME using Recent **Notifications applet indicator**.

Recent Notifications sits in the top panel and keeps the history of all recent notifications. When there are new notifications captured by it, the indicator turns green to notify you of unread notifications.

![Recent notifications in Ubuntu 14.04](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/recent_notifications_Ubuntu.jpeg)

When you click on it, you will see all the recent notifications. You can either choose to clear all of the notifications or remove some of those.

![Recent notifications applet indicator](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/recent_notifications_Ubuntu_1.jpeg)

Unfortunately there are no configuration options here. Therefore you cannot block notifications from specific applications. All kind of notifications will be saved here.

### Install Recent Notifications in Ubuntu 14.04 and 14.10 ###

Normally this Recent Notification applet indicator should also work in Linux Mint Cinnamon edition. You can give it a try. Use the following commands to install Recent Notifications applet indicator in Ubuntu 14.04 and 14.10:

    sudo add-apt-repository ppa:jconti/recent-notifications
    sudo apt-get update
    sudo apt-get install indicator-notifications

After installation, log out, log back in and you are good to go. Now none of the recent notifications will go unnoticed. Hand applet indicator, isn’t it?

--------------------------------------------------------------------------------

via: http://itsfoss.com/notifications-appindicator/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/apps-internet-streaming-radio-ubuntu/