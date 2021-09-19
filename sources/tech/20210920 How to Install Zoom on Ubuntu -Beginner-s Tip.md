[#]: subject: "How to Install Zoom on Ubuntu [Beginner’s Tip]"
[#]: via: "https://itsfoss.com/zoom-ubuntu/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install Zoom on Ubuntu [Beginner’s Tip]
======

_**Brief: This beginner’s tutorial show the steps for installing Zoom on Ubuntu, along with tips on using it on other Linux distributions.**_

The ‘work from home’ was existing for years but only a few people chose to work like this.

Covid-19 lockdowns made work from home a common scenario. Even the non-IT people had to resume their work activities from the confinement of home. Video conferencing tool become as common as emails.

Among all this, Zoom became the de facto online meeting tool. If you are using Linux and prefer [open source video conferencing tools][1] like [Jitsi Meet][2], chances are that people at work use Zoom.

In such cases, you have no option but to use Zoom on Linux and in this tutorial, I am going to show you different ways of using it on Ubuntu and other Linux distributions:

  * The simplest of all is to use Zoom in a web browser: This works on any Linux distribution and any operating system.
  * [Installing Zoom on Ubuntu using GUI method][3]: For better system integration
  * [Installing Zoom in Ubuntu using command line][4]: If you like the terminal more than anything



_**Please note that Zoom is not open source software.**_

### Method 1: Install Zoom on Ubuntu graphically

Zoom provides DEB package for Debian, Ubuntu and Mint (Debian-based distributions) and RPM packages for Fedora, Red Hat and SUSE (Red Hat based distributions).

To download Zoom, go to the download page of Zoom website:

[Download Zoom for Linux][5]

If you are using Linux, it automatically recognizes it and gives you the option to download Zoom for various Linux distributions. Here, select the distribution of your choice. In my case, it is Ubuntu:

![Zoom provides packages in DEB, RPM and tar.xz format][6]

You are most likely running a 64-bit system. So, go with default choices and hit the download button.

![Downloading Zoom for Ubuntu][7]

It will download a file of around 60 MB. If you are [using Chrome on Ubuntu][8], it will ask you to **confirm to keep or discard** when the download completes. Click keep.

You probably already know [how to install an application from DEB file, don’t you][9]? That’s right. Just double-click on it or right click on it and select Software Install like this:

![Install the downloaded DEB file by double clicking on it][10]

It will open the file with Software Center and then you just click on the Install button.

![][11]

You’ll be asked to enter your account’s password. Do that and Zoom should be installed in a few seconds.

Once installed, press the Super key (Windows key) and search for Zoom. Click on the Zoom icon to start it:

![Start Zoom][12]

It will start Zoom and you can start attending your Zoom meetings.

![Zoom now installed on Ubuntu][13]

That’s not it. You’ll see that Zoom is accessible from the applet indicator on the top right corner. It should send you notifications and let you quickly access Zoom features like screen sharing.

![Quick access to zoom settings][14]

Enjoy Zoom on Ubuntu.

### Method 2: Install Zoom on Ubuntu using command line [Not Recommended]

If you want to quickly install Zoom using command line, you can do all the steps you did in the previous method.

You can [download files in Linux terminal][15] using tools like wget and curl. Download the deb file using this command:

```
wget https://zoom.us/client/latest/zoom_amd64.deb
```

If it complains about wget, install wget first and then use the above command.

And then install the deb file by pointing the correct path to the deb file:

```
sudo dpkg -i zoom_amd64.deb
```

After that, you can search Zoom in system menu and start using it.

### Remove Zoom from Ubuntu

To uninstall Zoom from Ubuntu, you’ll have to use the terminal, irrespective of whichever method you used to install it.

[Open the terminal on Ubuntu][16] by pressing Ctrl+Alt+T and use the following command:

```
sudo apt remove zoom
```

It will ask you to enter your account password. When **you type the password in the terminal, nothing happens on the screen**. That’s normal. Type the password blindly and press enter.

It will ask for your confirmation before deletion. Press enter or Y to confirm:

![Removing Zoom Ubuntu][17]

If you must use Zoom for work or school, you can install Zoom on Ubuntu and use it without having to leave Linux. Having options are always better.

--------------------------------------------------------------------------------

via: https://itsfoss.com/zoom-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/open-source-video-conferencing-tools/
[2]: https://itsfoss.com/jitsi-meet/
[3]: tmp.wHq5SFWYDn#gui-method
[4]: tmp.wHq5SFWYDn#command-line
[5]: https://zoom.us/download
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/zoom-download.png?resize=800%2C429&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/download-zoom-ubuntu.png?resize=800%2C477&ssl=1
[8]: https://itsfoss.com/install-chrome-ubuntu/
[9]: https://itsfoss.com/install-deb-files-ubuntu/
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-zoom-deb-file-ubuntu.png?resize=800%2C513&ssl=1
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/install-zoom-ubuntu-software-center.png?resize=800%2C558&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/zoom-on-ubuntu.png?resize=794%2C219&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/zoom-installed-ubuntu.png?resize=800%2C475&ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/zoom-applet-indicator.webp?resize=797%2C285&ssl=1
[15]: https://itsfoss.com/download-files-from-linux-terminal/
[16]: https://itsfoss.com/open-terminal-ubuntu/
[17]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/remove-zoom-ubuntu.png?resize=800%2C372&ssl=1
