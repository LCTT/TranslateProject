[#]: subject: "How to Install Vivaldi Browser on Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/install-vivaldi-ubuntu-linux/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "imgradeone"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Ubuntu 和其他 Linux 发行版中安装 Vivaldi 浏览器
======

> 您将在本篇新手教程中学习如何在 Ubuntu、Debian 及其他 Linux 发行版中安装 Vivaldi 网页浏览器，同时本教程也将介绍如何更新和卸载该软件。

[Vivaldi][1] 是一款关注度逐步上升的网页浏览器。它基于 Chromium 内核，因此它拥有和 Chrome 类似的功能，但它也新增了一些其他特色功能，让这款浏览器与众不同、更为直观。

它内置了标签组、广告拦截、鼠标手势、笔记管理，甚至还有命令连锁。你甚至可以借助页面平铺来一次性浏览多个页面。当然，相比于 Chrome，Vivaldi 更加尊重你的隐私。

![页面平铺，一次性浏览多个页面][2]

你可以从 [Manjaro Linux 近期使用 Vivaldi 取代 Firefox 作为部分分支的默认浏览器][3] 这件事来了解 Vivaldi 浏览器的受欢迎程度。

如果你想尝试一下

If you want to try it, let me show how to install Vivaldi on Linux. You’ll learn:

  * GUI and command line methods for installing Vivaldi
  * Tips on updating Vivaldi to the newest version
  * Steps for removing Vivaldi from Ubuntu

> 非自由软件（Non-FOSS）警告！  
> 
> Vivaldi is not complete open source software. It’s UI is closed source. It’s been covered here because Vivaldi team took effort in making its software available on Linux.

### Installing Vivaldi on Ubuntu [GUI Method]

The good thing is that Vivaldi provides pre-built binaries in DEB form for Ubuntu/Debian based distros and in RPM form for Fedora, Red Hat and SUSE.

It is available for both 32 bit and 64-bit platforms, as well as [ARM devices like Raspberry Pi][4].

![Vivaldi provides installer for several types of Linux distributions][5]

The installation process is really simple. You go to the Vivaldi web page and download the appropriate installer file and then double click on it to install it. That’s it.

I’ll show the steps in detail for Ubuntu/Debian. You can use similar steps for other distributions.

#### Step 1: Download Vivaldi

Go to the Vivaldi’s download page and download the DEB file for Ubuntu.

[Download Vivaldi][6]

![Download DEB file for Ubuntu/Debian][7]

#### Step 2: Install the downloaded DEB file

Go to the Downloads folder where you have the deb file downloaded. [Installing deb file][8] is easy. Either just double-click on it or right click to open it with software center.

![Right click on the downloaded deb file and open it with Software Install][9]

It will open the software center application and here, you can see the option to install Vivaldi. Just hit the Install button.

![Hit the Install button][10]

You’ll be asked to enter your system’s account password. Enter that and you should have it installed in a few seconds. You’ll see that Install option changes to remove. This is an indication that Vivaldi is now installed.

#### Step 3: Using Vivaldi

Open the system menu by pressing the super (Windows) key and searching for Vivaldi. Click on the Vivaldi icon.

![Search for Vivaldi in the system menu][11]

You’ll see a screen like this on the first run.

![Vivaldi running in Ubuntu][12]

Now that you know the this method, let me quickly show how to install Vivaldi on Ubuntu and Debian from the terminal.

### Method 2: Installing Vivaldi on Ubuntu and Debian from the command line

Open a terminal and make sure that you have wget installed for [downloading files in the command line.][13]

```
sudo apt install wget
```

Next, get the public key of the Vivaldi repository and add it to your system so that your system trusts the packages coming from it. If interested, read [this article about adding external repository in Ubuntu][14].

```
wget -qO- https://repo.vivaldi.com/archive/linux_signing_key.pub | sudo apt-key add -
```

Once the key has been added, add Vivaldi repository as well:

```
sudo add-apt-repository 'deb https://repo.vivaldi.com/archive/deb/ stable main'
```

Now you are almost set. Update the package cache and install it.

```
sudo apt update && sudo apt install vivaldi-stable
```

And that’s it. Search for it in the menu and start it from there.

### Updating Vivaldi on Ubuntu

Both GUI and command line methods add the Vivaldi repository to your system. This means that whenever there is a new Vivaldi release, you get it along with the system updates.

![Vivaldi repo is added to the system][15]

Basically, you update the Ubuntu system and it updates the Vivaldi browser if there is a new version available.

![Vivaldi browser is updated with the system updates][16]

### Removing Vivaldi from Ubuntu

If you do not like Vivaldi or no longer want to use it, you can surely remove it. Now, to [uninstall applications from Ubuntu][17], you may use Software Center but it won’t find the external, third-party installed software.

You’ll have to use the terminal now even though you used GUI method to install it. That’s really easy. Open a terminal and use the command below:

```
sudo apt remove vivaldi-stable
```

Sudo gives you [root access in Ubuntu][18]. You’ll have to enter your account’s password. While entering the password, nothing is seen on the screen. That’s normal. Enter the password blindly and it will be removed.

I hope you find this tutorial helpful in installing and using Vivaldi on Linux.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-vivaldi-ubuntu-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://vivaldi.com/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/tab-tiling.webp?resize=800%2C448&ssl=1
[3]: https://news.itsfoss.com/vivaldi-replaces-firefox-manjaro/
[4]: https://itsfoss.com/raspberry-pi-alternatives/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/downloading-vivaldi-linux.webp?resize=800%2C541&ssl=1
[6]: https://vivaldi.com/download/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/vivaldi-download-linux.webp?resize=800%2C438&ssl=1
[8]: https://itsfoss.com/install-deb-files-ubuntu/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/installing-vivaldi-ubuntu.webp?resize=800%2C466&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/install-vivaldi-ubuntu-software.png?resize=800%2C407&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/running-vivaldi-in-ubuntu.png?resize=703%2C229&ssl=1
[12]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/Vivaldi-in-Ubuntu.webp?resize=800%2C450&ssl=1
[13]: https://itsfoss.com/download-files-from-linux-terminal/
[14]: https://itsfoss.com/adding-external-repositories-ubuntu/
[15]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/Vivaldi-repo-ubuntu.png?resize=800%2C403&ssl=1
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/chrome-edge-update-ubuntu.png?resize=716%2C421&ssl=1
[17]: https://itsfoss.com/uninstall-programs-ubuntu/
[18]: https://itsfoss.com/root-user-ubuntu/
