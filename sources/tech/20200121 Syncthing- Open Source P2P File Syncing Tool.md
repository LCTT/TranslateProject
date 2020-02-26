[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Syncthing: Open Source P2P File Syncing Tool)
[#]: via: (https://itsfoss.com/syncthing/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Syncthing: Open Source P2P File Syncing Tool
======

_**Brief: Syncthing is an open-source peer-to-peer file synchronization tool that you can use for syncing files between multiple devices (including an Android phone).**_

Usually, we have a cloud sync solution like [MEGA][1] or Dropbox to have a backup of our files on the cloud while making it easier to share it.

But, what do you do if you want to sync your files across multiple devices without storing them on the cloud?

That is where [Syncthing][2] comes to the rescue.

### Syncthing: An open source tool to synchronize files across devices

![][3]

Syncthing lets you sync your files across multiple devices (including the support for Android smartphones). It primarily works through a web UI on Linux but also offers a GUI (to separately install).

However, Syncthing does not utilize the cloud at all – it is a [peer-to-peer][4] file synchronization tool. Your data doesn’t go to a central server. Instead, the data is synced with all the devices between them. So, it does not really replace the [typical cloud storage services on Linux][5].

To add remote devices, you just need the device ID (or simply scan the QR code), no IP addresses involved.

If you want a remote backup of your files – you should probably rely on the cloud.

![Syncthing GUI][6]

All things considered, Syncthing can come in handy for a lot of things. Technically, you can have your important files accessible on multiple systems securely and privately without worrying about anyone spying on your data.

For instance, you may not want to store some of the sensitive files on the cloud – so you can add other trusted devices to sync and keep a copy of those files.

Even though I described it briefly, there’s more to it and than meets the eye. I’d also recommend reading the [official FAQ][7] to clear some confusion on how it works – if you’re interested.

### Features of Syncthing

You probably do not want a lot of options in a synchronization tool – it should be dead simple to work reliably to sync your files.

Syncthing is indeed quite simple and easy to understand – even though it is recommended that you should go through the [documentation][8] if you want to use every bit of its functionality.

Here, I’ll highlight a few useful features of Syncthing:

#### Cross-Platform Support

![Syncthing on Android][9]

Being an open-source solution, it does support Windows, Linux, and macOS.

In addition to that, it also supports Android smartphones. You’ll be disappointed if you have an iOS device – so far, no plans for iOS support.

#### File Versioning

![Syncthing File Versioning][10]

Syncthing utilizes a variety of [File Versioning methods][11] to archive the old files if they are replaced or deleted.

By default, you won’t find it enabled. But, when you create a folder to sync, that’s when you will find the option to toggle the file versioning to your preferred method.

#### Easy To Use

While being a peer-to-peer file synchronization tool, it just works out of the box with no advanced tweaks.

However, it does let you configure advanced settings when needed.

#### Security &amp; Privacy

Even though you do not share your data with any cloud service providers, there are still some connections made that might gain the attention of an eavesdropper. So, Syncthing makes sure the communication is secured using TLS.

In addition to that, there are solid authentication methods to ensure that only the devices/connections you allow explicitly will be granted access to sync/read data.

For Android smartphones, you can also force the traffic through Tor if you’re using the [Orbot app][12]. You’ll find several other options for Android as well.

#### Other Functionalities

![][13]

When exploring the tool yourself, you will notice that there are no limits to how many folders you can sync and the number of devices that you can sync.

So, being a free and open-source solution with lots of useful features makes it an impressive choice for Linux users looking to have a peer-to-peer sync client.

### Installing Syncthing on Linux

You may not observe a .deb file or an .AppImage file for it on its official download webpage. But, you do get a snap package on the [Snap store][14] – if you’re curious you can read about [using snap apps][15] on Linux to get started.

You may not find it in the software center (if you do – it may not be the latest version).

**Note:** _There’s also a [Syncthing-GTK][16] available if you want a GUI to manage that – instead of a browser._

[Syncthing][2]

You can also utilize the terminal to get it installed if you have a Debian-based distro – the instructions are on the [official download page][17].

### My experience with Syncthing

Personally, I got it installed on Pop!_OS 19.10 and used it for a while before writing this up.

I tried syncing folders, removing them, adding duplicate files to see how the file versioning works, and so on. It worked just fine.

However, when I tried syncing it to a phone (Android) – the sync started a bit late, it wasn’t very quick. So, if we could have an option to explicitly force sync, that could help. Or, did I miss the option? Let me know in the comments if I did.

Technically, it uses the resources of your system to work – so if you have a number of devices connected to sync, it should potentially improve the sync speed (upload/download).

Overall, it works quite well – but I must say that you shouldn’t rely on it as the only backup solution to your data.

**Wrapping Up**

Have you tried Syncthing yet? If yes, how was your experience with it? Feel free to share it in the comments below.

Also, if you know about some awesome alternatives to this – let me know about it as well.

--------------------------------------------------------------------------------

via: https://itsfoss.com/syncthing/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-mega-cloud-storage-linux/
[2]: https://syncthing.net/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-screenshot.jpg?ssl=1
[4]: https://en.wikipedia.org/wiki/Peer-to-peer
[5]: https://itsfoss.com/cloud-services-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-gtk.png?ssl=1
[7]: https://docs.syncthing.net/users/faq.html
[8]: https://docs.syncthing.net/users/index.html
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-android.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-file-versioning.jpg?ssl=1
[11]: https://docs.syncthing.net/users/versioning.html
[12]: https://play.google.com/store/apps/details?id=org.torproject.android&hl=en_IN
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/01/syncthing-screenshot1.jpg?ssl=1
[14]: https://snapcraft.io/syncthing
[15]: https://itsfoss.com/install-snap-linux/
[16]: https://github.com/syncthing/syncthing-gtk/releases/latest
[17]: https://syncthing.net/downloads/
