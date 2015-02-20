Translating---geekpi

Cutegram: A Better Telegram Client For GNU/Linux
================================================================================
No need for a introduction to **Telegram**, right? Telegram is a popular free Instant messenger application that can be used to chat with your friends all over the world. Unlike Whatsapp, Telegram is free forever, no ads, no subscription fees. And, the Telegram client is open source too. Telegram is available for many different platforms, including Linux, Android, iOS, Windows Phone, Windows, and Mac OS X. The messages which are sending using telegram are highly encrypted and self-destructive. It is very secure, and there is no limit on the size of your media and chats.

You can install and use Telegram desktop on your Debian/Ubuntu systems as mentioned in [our previous tutorial][1]. However, a new telegram client called **Cutegram** is available now to make your chat experience more fun and easy.

### What is Cutegram? ###

Cutegram is a free and opensource telegram clients for GNU/Linux focusing on user friendly, compatibility with Linux desktop environments and easy to use. Cutegram using Qt5, QML, libqtelegram, libappindication, AsemanQtTools technologies and Faenza icons and Twitter emojies graphic sets. It’s free and released under GPLv3 license.

### Install Cutegram ###

Head over to the Cutegram homepage and download the latest version of your distribution’s choice. As I use Ubuntu 64 bit, I downloaded the .deb file.

    wget http://aseman.co/downloads/cutegram/cutegram_1.0.2-1-amd64.deb

Now, Install Cutegram as shown below.

    sudo apt-get install gdebi
    sudo gdebi cutegram_1.0.2-1-amd64.deb

For other distributions, run the following commands.

**64bit:**

    wget http://aseman.co/downloads/cutegram/cutegram-1.0.2-linux-x64-installer.run

**32 bit:**

    wget http://aseman.co/downloads/cutegram/cutegram-1.0.2-linux-installer.run

Set executable permission:

    chmod + cutegram-1.0.2-linux*.run

And, install it as shown below.

    sudo ./cutegram-1.0.2-linux*.run

### Usage ###

Launch Cutegram either from Menu or Unity dash. From the login screen, select your country, and enter your mobile number, finally click **Login**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/Cutegram_005.png)

A code will be sent to your mobile number. Enter the code and click **Sign in**.

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/Cutegram_002.png)

There you go.

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/Cutegram_003.png)

Start Chatting!

![](http://180016988.r.cdn77.net/wp-content/uploads/2015/01/Cutegram_004.png)

And, you can set a profile picture, start new chat/group chat, or secret chat from using the buttons on the left pane.

Stay happy! Cheers!!

For more details, check the [Cutegram website][2].

--------------------------------------------------------------------------------

via: http://www.unixmen.com/cutegram-better-telegram-client-gnulinux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:http://www.unixmen.com/install-telegram-desktop-via-ppa/
[2]:http://aseman.co/en/products/cutegram/
