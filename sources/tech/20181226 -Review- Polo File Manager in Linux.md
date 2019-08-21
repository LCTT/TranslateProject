[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: ([Review] Polo File Manager in Linux)
[#]: via: (https://itsfoss.com/polo-file-manager/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

[Review] Polo File Manager in Linux
======

We are all familiar with file managers. It’s that piece of software that allows you to access your directories, files in a GUI.

Most of us use the default file manager included with our desktop of choice. The creator of [Polo][1] hopes to get you to use his file manager by adding extra features but hides the good ones behind a paywall.

![][2]Polo file manager

### What is Polo file manager?

According to its [website][1], Polo is an “advanced file manager for Linux written in [Vala][3])”. Further down the page, Polo is referred to as a “modern, light-weight file manager for Linux with support for multiple panes and tabs; support for archives, and much more.”

It is from the same developer (Tony George) that has given us some of the most popular applications for desktop Linux. [Timeshift backup][4] tool, [Conky Manager][5], [Aptik backup tool][6]s for applications etc. Polo is the latest offering from Tony.

Note that Polo is still in the beta stage of development which means the first stable version of the software is not out yet.

### Features of Polo file manager

![Polo File Manager in Ubuntu Linux][7]Polo File Manager in Ubuntu Linux

It’s true that Polo has a bunch of neat features that most file managers don’t have. However, the really neat features are only available if you donate more than $10 to the project or sign up for the creator’s Patreon. I will be separating the free features from the features that require the “donation plugin”.

![Cloud storage support in Polo file manager][8]Support cloud storage

#### Free Features

  * Multiple Panes – Single-pane, dual-pane (vertical or horizontal split) and quad-pane layouts.
  * Multiple Views – List view, Icon view, Tiled view, and Media view
  * Device Manager – Devices popup displays the list of connected devices with options to mount and unmount
  * Archive Support – Support for browsing archives as normal folders. Supports creation of archives in multiple formats with advanced compression settings.
  * Checksum & Hashing – Generate and compare MD5, SHA1, SHA2-256 ad SHA2-512 checksums
  * Built-in [Fish shell][9]
  * Support for [cloud storage][10], such as Dropbox, Google Drive, Amazon Drive, Amazon S3, Backblaze B2, Hubi, Microsoft OneDrive, OpenStack Swift, and Yandex Disk
  * Compare files
  * Analyses disk usage
  * KVM support
  * Connect to FTP, SFTP, SSH and Samba servers



![Dual pane view of Polo file manager][11]Polo in dual pane view

#### Donation/Paywall Features

  * Write ISO to USB Device
  * Image optimization and adjustment tools
    * Optimize PNG
    * Reduce JPEG Quality
    * Remove Color
    * Reduce Color
    * Boost Color
    * Set as Wallpaper
    * Rotate
    * Resize
    * Convert to PNG, JPEG, TIFF, BMP, ICO and more
  * PDF tools
    * Split
    * Merge
    * Add and Remove Password
    * Reduce File Size
    * Uncompress
    * Remove Colors
    * Rotate
    * Optimize
  * Video Download via [youtube-dl][12]



### Installing Polo

Let’s see how to install Polo file manager on various Linux distributions.

#### 1\. Ubuntu based distributions

For all Ubuntu based systems (Ubuntu, Linux Mint, Elementary OS, etc), you can install Polo via the [official PPA][13]. Not sure what a PPA is? [Read about PPA here][14].

`sudo apt-add-repository -y ppa:teejee2008/ppa`
`sudo apt-get update`
`sudo apt-get install polo-file-manager`

#### 2\. Arch based distributions

For all Arch-based systems (Arch, Manjaro, ArchLabs, etc), you can install Polo from the [Arch User Repository][15].

#### 3\. Other Distros

For all other distros, you can download and use the [.RUN installer][16] to setup Polo.

### Thoughts on Polo

I’ve installed tons of different distros and never had a problem with the default file manager. (I’ve probably used Thunar and Caja the most.) The free version of Polo doesn’t contain any features that would make me switch. As for the paid features, I already use a number of applications that accomplish the same things.

One final note: the paid version of Polo is supposed to help fund development of the project. However, [according to GitHub][17], the last commit on Polo was three months ago. That’s quite a big interval of inactivity for a software that is still in the beta stages of development.

Have you ever used [Polo][1]? If not, what is your favorite Linux file manager? Let us know in the comments below.

If you found this article interesting, please take a minute to share it on social media, Hacker News or [Reddit][18].

--------------------------------------------------------------------------------

via: https://itsfoss.com/polo-file-manager/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://teejee2008.github.io/polo/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/polo.jpg?fit=800%2C500&ssl=1
[3]: https://en.wikipedia.org/wiki/Vala_(programming_language
[4]: https://itsfoss.com/backup-restore-linux-timeshift/
[5]: https://itsfoss.com/conky-gui-ubuntu-1304/
[6]: https://github.com/teejee2008/aptik
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/12/polo-file-manager-in-ubuntu.jpeg?resize=800%2C450&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/polo-coud-options.jpg?fit=800%2C795&ssl=1
[9]: https://fishshell.com/
[10]: https://itsfoss.com/cloud-services-linux/
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/12/polo-dual-pane.jpg?fit=800%2C520&ssl=1
[12]: https://itsfoss.com/download-youtube-linux/
[13]: https://launchpad.net/~teejee2008/+archive/ubuntu/ppa
[14]: https://itsfoss.com/ppa-guide/
[15]: https://aur.archlinux.org/packages/polo
[16]: https://github.com/teejee2008/polo/releases
[17]: https://github.com/teejee2008/polo
[18]: http://reddit.com/r/linuxusersgroup
