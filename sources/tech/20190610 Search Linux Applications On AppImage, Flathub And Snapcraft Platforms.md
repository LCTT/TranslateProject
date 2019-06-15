[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Search Linux Applications On AppImage, Flathub And Snapcraft Platforms)
[#]: via: (https://www.ostechnix.com/search-linux-applications-on-appimage-flathub-and-snapcraft-platforms/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Search Linux Applications On AppImage, Flathub And Snapcraft Platforms
======

![Search Linux Applications On AppImage, Flathub And Snapcraft][1]

Linux is evolving day by day. In the past, the developers had to build applications separately for different Linux distributions. Since there are several Linux variants exists, building apps for all distributions became tedious task and quite time consuming. Then some developers invented package converters and builders such as [**Checkinstall**][2], [**Debtap**][3] and [**Fpm**][4]. But they didn’t completely solved the problem. All of these tools will simply convert one package format to another. We still need to find and install the required dependencies the app needs to run.

Well, the time has changed. We have now universal Linux apps. Meaning – we can install these applications on most Linux distributions. Be it Arch Linux, Debian, CentOS, Redhat, Ubuntu or any popular Linux distribution, the Universal apps will work just fine out of the box. These applications are packaged with all necessary libraries and dependencies in a single bundle. All we have to do is to download and run them on any Linux distributions of our choice. The popular universal app formats are **AppImages** , [**Flatpaks**][5] and [**Snaps**][6].

The AppImages are created and maintained by **Simon peter**. Many popular applications, like Gimp, Firefox, Krita and a lot more, are available in these formats and available directly on their download pages.Just download them, make it executable and run it in no time. You don’t even root permissions to run AppImages.

The developer of Flatpak is **Alexander Larsson** (a RedHat employee). The Flatpak apps are hosted in a central repository (store) called **“Flathub”**. If you’re a developer, you are encouraged to build your apps in Flatpak format and distribute them to the users via Flathub.

The **Snaps** are created mainly for Ubuntu, by **Canonical**. However, the developers of other Linux distributions are started to contribute to Snap packing format. So, Snaps will work on other Linux distributions as well. The Snaps can be downloaded either directly from application’s download page or from **Snapcraft** store.

Many popular Companies and developers have released their applications in AppImage, Flatpak and Snap formats. If you ever looking for an app, just head over to the respective store and grab the application of your choice and run it regardless of the Linux distribution you use.

There is also a command line universal app search tool called **“Chob”** is available to easily search Linux Applications on AppImage, Flathub and Snapcraft platforms. This tool will only search for the given application and display official link in your default browser. It won’t install them. This guide will explain how to install Chob and use it to search AppImages, Flatpaks and Snaps on Linux.

### Search Linux Applications On AppImage, Flathub And Snapcraft Platforms Using Chob

Download the latest Chob binary file from the [**releases page**][7]. As of writing this guide, the latest version was **0.3.5**.

```
$ wget https://github.com/MuhammedKpln/chob/releases/download/0.3.5/chob-linux
```

Make it executable:

```
$ chmod +x chob-linux
```

Finally, search the applications you want. For example, I am going to search applications related to **Vim**.

```
$ ./chob-linux vim
```

Chob will search for the given application (and related) on AppImage, Flathub and Snapcraft platforms and display the results.

![][8]

Search Linux applications Using Chob

Just choose the application you want by typing the appropriate number to open the official link of the selected app in your default web browser where you can read the details of the app.

![][9]

View Linux application’s Details In Browser

For more details, have a look at the Chob official GitHub page given below.

**Resource:**

  * [**Chob GitHub Repository**][10]



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/search-linux-applications-on-appimage-flathub-and-snapcraft-platforms/

作者：[sk][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/05/chob-720x340.png
[2]: https://www.ostechnix.com/build-packages-source-using-checkinstall/
[3]: https://www.ostechnix.com/convert-deb-packages-arch-linux-packages/
[4]: https://www.ostechnix.com/build-linux-packages-multiple-platforms-easily/
[5]: https://www.ostechnix.com/flatpak-new-framework-desktop-applications-linux/
[6]: https://www.ostechnix.com/introduction-ubuntus-snap-packages/
[7]: https://github.com/MuhammedKpln/chob/releases
[8]: http://www.ostechnix.com/wp-content/uploads/2019/05/Search-Linux-applications-Using-Chob.png
[9]: http://www.ostechnix.com/wp-content/uploads/2019/05/View-Linux-applications-Details.png
[10]: https://github.com/MuhammedKpln/chob
