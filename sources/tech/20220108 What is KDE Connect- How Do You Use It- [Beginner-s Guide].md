[#]: subject: "What is KDE Connect? How Do You Use It? [Beginner’s Guide]"
[#]: via: "https://www.debugpoint.com/2022/01/kde-connect-guide/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "yjacks"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

What is KDE Connect? How Do You Use It? [Beginner’s Guide]
======
In this article, we explain what is KDE Connect, its main features, basic usage guide and installation steps.

The technology evolving at a rapid space. That includes the software, hardware and different form factor devices. The future is all about seamless integration and workflow across different devices. Every day, we are moving a little closer to a state where you send and receive data across all connected devices. And KDE Connect application is a flag bearer on the Linux desktop systems.

### What is KDE Connect?

[KDE Connect][1] is an application developed by KDE Desktop team that offers seamless connectivity between Linux System and any other system running Windows, macOS, Android or Linux.

When installed, KDE connect enables you to receive phone notifications, send and receive SMS, browse files, send and receive files and many such features.

Furthermore, KDE Connect does all these following a secure protocol over the wireless network to prevent any privacy mishap. The application is a Free and Open Source application, hence minimal chance of any hidden issues. With all these features combined, KDE Connect is an excellent tool for its purpose.

Let’s see how you can install it and use.

### Installing KDE Connect

For this KDE Connect guide, I will show you the connection between a Linux Distribution and Android Mobile Phones. However, this should be the same for Windows and Android connectivity as well.

KDE Connect set up is a two-way process. You have to install KDE Connect in your Linux distribution and in your Android Mobile Phone from Play Store.

#### Installing in Linux Distribution

Installing KDE Connect in your Linux Distribution is easy. It is available in all major Linux distribution’s official repo. If you are using Ubuntu, and want a terminal way of installing, run below.

```
sudo apt install kdeconnect
```

For Fedora

```
sudo dnf install kdeconnect
```

For [Arch Linux][2]

```
pacman -S kdeconnect
```

Or, you can search in Software and hit install.

For Windows and other Linux distributions, you can refer [to this page][3] for several other options for download.

#### Installing in Android Mobile Phone

Search for KDE Connect in Google Play Store and hit install to install it in your Android Device.

[KDE Connect in Play Store][4]

If you are using a Free/Libre version of Android, you can get it via f-droid store using the below link (Thanks to our readers for this tip).

[https://f-droid.org/en/packages/org.kde.kdeconnect_tp/][5]

### Setting Up KDE Connect

KDE Connect helps to connect devices that are in the same network. So, make sure your Linux system and Android device both are connected to the same Wi-Fi or wireless network.

Now open the KDE Connect App in your mobile phone. You should see the name of your Linux Systems. If you do not see anything, make sure your device and Linux both are connected in same network and hit Refresh.

![KDE Connect in Android Device showing connected Linux System][6]

Open the KDE Connect in Linux and you should see your mobile phone entry as shown in the below image.

![KDE Connect before pairing][7]

Now, click on the name of your mobile phone and hit **Pair**. Once you do that, immediately you get a notification in your mobile phone for Pairing Accept or Reject. Tap on Accept.

![Pairing Request for KDE Connect][8]

The icon of your Phone should turn GREEN, and it shows that your mobile phone and Linux system both are connected and paired.

![KDE Connect after successful pairing][9]

By default, the app grants you the below permissions –

* Multimedia control
* Remote Input
* Presentation Remote
* Finding Device
* Sharing Files

And the following features required explicit permission in your Android device, which you need to grant them manually. Because they are little privacy centric.

* SMS sending and receiving
* Media Player Control
* Receive Keystrokes from Computer to Mobile Phone
* Notification Sync
* Telephone Notifier
* Contact Sync
* Mouse Receiver

For all these, you have to tap on the option and grant access in Android phone. Then you will be able to enjoy these services in Linux device.

### Example – Notification Sync

I will show you one example where Notification Sync option is enabled. Open the app in your Android phone, go to the **Connected Device** section. Tap on **Notification Sync** and take option **Open Settings**.

Enable Notification access against **KDE Connect** and tap on **Allow**.

![Enabling Notification Sync][10]

This will start showing the notifications from your mobile phones to your Linux device. For example, below notification which I received in my test Android device.

![Sample Notification in Mobile Phone][11]

And the same is shown in KDE Connect in the Linux system.

![Sample Notification in KDE Connect from Mobile Phone][12]

Similarly, you can start enabling the other services and giving them permission as it is applicable for you.

### Closing Notes

I hope this guide helps you to set up KDE Connect in your Linux system and mobile phones. You can easily set up several features after giving proper permission to make the most out of KDE Connect application. Once it is set up completely, you do not need to look over your mobile phones anymore. Because you can easily read notifications, reply to messages while working in your Laptop or Desktop.

What do you think about KDE Connect? Let me know in the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/01/kde-connect-guide/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://kdeconnect.kde.org/
[2]: https://www.debugpoint.com/tag/arch-linux
[3]: https://kdeconnect.kde.org/download.html
[4]: https://play.google.com/store/apps/details?id=org.kde.kdeconnect_tp&hl=en_IN&gl=US
[5]: https://f-droid.org/en/packages/org.kde.kdeconnect_tp/
[6]: https://www.debugpoint.com/wp-content/uploads/2022/01/KDE-Connect-in-Android-Device-showing-connected-Linux-System-1024x656.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2022/01/KDE-Connect-before-pairing-1024x368.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2022/01/Pairing-Request-for-KDE-Connect-1024x917.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/01/KDE-Connect-after-successful-pairing-1024x249.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/01/Enabling-Notification-Sync-1024x718.jpg
[11]: https://www.debugpoint.com/wp-content/uploads/2022/01/Sample-Notification-in-Mobile-Phone-914x1024.jpg
[12]: https://www.debugpoint.com/wp-content/uploads/2022/01/Sample-Notification-in-KDE-Connect-from-Mobile-Phone.jpg
