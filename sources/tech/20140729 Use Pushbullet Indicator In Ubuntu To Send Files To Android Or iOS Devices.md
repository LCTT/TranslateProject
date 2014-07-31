Use Pushbullet Indicator In Ubuntu To Send Files To Android Or iOS Devices
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Pushbullet_Logog.jpg)

[Pushbullet][1] is an app available for iOS and Android devices that lets you send files, links, images from your desktop to your mobile device and vice versa. Pushbullet can be used in any OS by installing extensions in Firefox or Chrome.

If you are not fan of browser extensions and want to use something more of a desktop app for **Pushbullet in Ubuntu 14.04**, you can use **Pushbullet Indicator** developed by [Atareao][2]. Pushbullet Indicator is in development stage at the moment and doesn’t have all the functionality of the official Windows desktop app but it still has enough to get you started.

### Install Pushbullet Indicator in Ubuntu 14.04 and Linux Mint 17 ###

Open a terminal and use the following commands:

    sudo add-apt-repository ppa:atareao/atareao
    sudo apt-get update
    sudo apt-get install pushbullet-indicator

The above PPA won’t work on Ubuntu 13.10.

### Using Pushbullet Indicator in Ubuntu 14.04 and Linux Mint 17 ###

- Create an account on [Pushbullet][3].
- Install the Pushbullet app on your Android or iOS device.
- After installing Pushbullet Indicator in Ubuntu or Linux Mint, start it. On the first launch, it will give the option to connect to your Pushbullet account:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Pushbullet_Indicator_start.png)

- Once connected, you should also name your device, from the device tab in the above picture. If you want Pushbullet to autostart at each boot, you can choose it do so by going in preference and turn on the Autostart button (shown in the picture above).
- Once you are done with this, you will see the Pushbullet indicator in Unity panel.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Use_Pushbullet_indicator_Ubuntu.jpeg)

- To send something to your smartphone, click on the indicator and select the device (linked to your Pushbullet account). It’s as simple as that.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Pushbullet_Indicator_In_Ubuntu.png)

- You’ll get a notification on the other device of receiving a file. You can access them all from the Pushbullet app.
- Android devices can also get notifications for phone calls, text messages and other notifications.
- If you send a file from your mobile device to your desktop, you will be notified about it:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2014/07/Pushbulet_Indicator_Notification.jpeg)

- The files are not automatically saved to a certain directory. To get the file sent from other device, go to Show last push from the indicator menu, it will show you the last push available. Click on it to download the file to a directory of your choice.

### Install Nautilus extension for Pushbullet: ###

Alternatively, you can also install Nautilus extension for Pushbullet to send files directly from right click menu. Use the following command:

    sudo apt-get install nautilus-pushbullet

You’ll have to authenticate it again after restarting.

Do share your experience with Pushbullet Indicator in comment section. Ciao ![](http://itsfoss.itsfoss.netdna-cdn.com/wp-includes/images/smilies/icon_smile.gif)

--------------------------------------------------------------------------------

via: http://itsfoss.com/pushbullet-indicator-ubuntu/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:https://www.pushbullet.com/
[2]:http://www.atareao.es/
[3]:https://www.pushbullet.com/