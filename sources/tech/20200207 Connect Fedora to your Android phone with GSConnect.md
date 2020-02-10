[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Connect Fedora to your Android phone with GSConnect)
[#]: via: (https://fedoramagazine.org/connect-fedora-to-your-android-phone-with-gsconnect/)
[#]: author: (Lokesh Krishna https://fedoramagazine.org/author/lowkeyskywalker/)

Connect Fedora to your Android phone with GSConnect
======

![][1]

Both Apple and Microsoft offer varying levels of integration of their desktop offerings with your mobile devices. Fedora offers a similar if not greater degree of integration with **GSConnect**. It lets you pair your Android phone with your Fedora desktop and opens up a lot of possibilities. Keep reading to discover more about what it is and how it works.

### What is GSConnect?

GSConnect is an implementation of the KDE Connect project tailored for the GNOME desktop. KDE Connect makes it possible for your devices to communicate with each other. However, installing it on Fedora’s default GNOME desktop requires pulling in a large number of KDE dependencies.

GSConnect is a complete implementation of KDE Connect, but in the form of a GNOME shell extension. Once installed, GSConnect lets you do the following and a lot more:

  * Receive phone notifications on your desktop and reply to messages
  * Use your phone as a remote control for your desktop
  * Share files and links between devices
  * Check your phone’s battery level from the desktop
  * Ring your phone to help find it



### Setting up the GSConnect extension

Setting up GSConnect requires installing two components: the GSConnect extension on your desktop and the KDE Connect app on your Android device.

First, install the GSConnect extension from the GNOME Shell extensions website: [GSConnect][2]. (Fedora Magazine has a handy article on [How to install a GNOME Shell extension][3] to help you with this step.)

The KDE Connect app is available on Google’s [Play Store][4]. It’s also available on the FOSS Android apps repository, [F-Droid][5].

Once you have installed both these components, you can pair your two devices. Installing the extension makes it show up in your system menu as _Mobile Devices_. Clicking on it displays a drop down menu, from which you can access _Mobile Settings_.

![][6]

Here’s where you can view your paired devices and manage the features offered by GSConnect. Once you are on this screen, launch the app on your Android device.

You can initiate pairing from either device, but here you’ll be connecting to your desktop from the Android device. Simply hit refresh on the app, and as long as both devices are on the same wireless network, your desktop shows up in your Android device. You can now send a pair request to the desktop. Accept the pair request on your desktop to complete the pairing.

![][7]

### Using GSConnect

Once paired, you’ll need to grant permissions on your Android device to make use of the many features available on GSConnect. Click on the paired device in the list of devices to see all available functions and enable or disable them according to your preferences.

![][8]

Remember that you’ll also need to grant corresponding permissions in the Android app to be able to use these functions. Depending upon the features you’ve enabled and the permissions you’ve granted, you can now access your mobile contacts on your desktop, get notified of messages and reply to them, and even sync the desktop and Android device clipboards.

### Integration with Files and your web browsers

GSConnect allows you to directly send files to your Android device from your desktop file explorer’s context menu.

On Fedora’s default GNOME desktop, you will need to install the _nautilus-python_ package in order to make your paired devices show up in the context menu. Installing this is as straightforward as running the following command from your preferred terminal:

```
$ sudo dnf install nautilus-python
```

Once done, the _Send to Mobile Device_ entry appears in the context menu of the Files app.

![][9]

Similarly, install the corresponding WebExtension for your browser, be it [Firefox][10] or [Chrome][11], to send links to your Android device. You have the option to send the link to launch directly in your browser or to deliver it as SMS.

### Running Commands

GSConnect lets you define commands which you can then run on your desktop, from your remote device. This allows you to do things such as take a screenshot of your desktop, or lock and unlock your desktop from your Android device, remotely.

![][12]

To make use of this feature, you can use standard shell commands and the CLI exposed by GSConnect. Documentation on this is provided in the project’s GitHub repository: _CLI Scripting_.

The [KDE UserBase Wiki][13] has a list of example commands. These examples cover controlling the brightness and volume on your desktop, locking the mouse and keyboard, and even changing the desktop theme. Some of the commands are specific for KDE Plasma, and modifications are necessary to make it run on the GNOME desktop.

### Explore and have fun

GSConnect makes it possible to enjoy a great degree of convenience and comfort. Dive into the preferences to see all that you can do and get creative with the commands function. Feel free to share all the possibilities this utility unlocked in your workflow in the comments below.

* * *

_Photo by [Pathum Danthanarayana][14] on [Unsplash][15]._

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/connect-fedora-to-your-android-phone-with-gsconnect/

作者：[Lokesh Krishna][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/lowkeyskywalker/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/12/gsconnect-816x345.jpg
[2]: https://extensions.gnome.org/extension/1319/gsconnect/
[3]: https://fedoramagazine.org/install-gnome-shell-extension/
[4]: https://play.google.com/store/apps/details?id=org.kde.kdeconnect_tp
[5]: https://f-droid.org/en/packages/org.kde.kdeconnect_tp/
[6]: https://fedoramagazine.org/wp-content/uploads/2020/01/within-the-menu-1024x576.png
[7]: https://fedoramagazine.org/wp-content/uploads/2020/01/pair-request-1024x576.png
[8]: https://fedoramagazine.org/wp-content/uploads/2020/01/permissions-1024x576.png
[9]: https://fedoramagazine.org/wp-content/uploads/2020/01/send-to-mobile-2-1024x576.png
[10]: https://addons.mozilla.org/en-US/firefox/addon/gsconnect/
[11]: https://chrome.google.com/webstore/detail/gsconnect/jfnifeihccihocjbfcfhicmmgpjicaec
[12]: https://fedoramagazine.org/wp-content/uploads/2020/01/commands-1024x576.png
[13]: https://userbase.kde.org/KDE_Connect/Tutorials/Useful_commands
[14]: https://unsplash.com/@pathum_danthanarayana?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[15]: https://unsplash.com/s/photos/android?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
