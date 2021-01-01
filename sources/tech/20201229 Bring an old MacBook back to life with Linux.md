[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Bring an old MacBook back to life with Linux)
[#]: via: (https://opensource.com/article/20/12/linux-macbook)
[#]: author: (Eric D. Schabell https://opensource.com/users/eschabell)

Bring an old MacBook back to life with Linux
======
It takes about an hour to make an outdated Mac useful again with Fedora.
![Digital images of a computer desktop][1]

Recently, I stumbled on an old MacBook Pro 13" from late 2011, with a 125GB SSD and 8GB RAM. I've taken this machine on trips around the world, and back in the day, I ran many a session, workshop, or demo to share all the AppDev goodness from JBoss technologies.

After verifying that its battery works, charging it up, and reinstalling a new OS X, it turns out that the Safari browser version is limited to an old security specification, which means it can't connect to a lot of HTTPS sites now. This renders this solution defunct.

What to do with this old thing?

It's been a few years since I worked solely on Linux workstations as a developer. I specifically worked on Fedora, so I decided to try to install the latest version on this MacBook Pro.

It took me just over an hour to get [Fedora 33][2] working on this laptop with the steps below.

### Download Fedora 33 and create a live USB

The first step is to find the right way to install Fedora. This machine has a CD slot, so you could burn an ISO and boot from it, but I chose to go straight to a bootable USB option.

I got on my other MacBook and visited the [Fedora Workstation site][3], which links to Fedora Media Writer. Click on the icon for your machine type (in my case, the Apple logo), and you get an installation package.

![Fedora Media Writer download screen][4]

(Eric D. Shabell, [CC BY-SA 4.0][5])

Start installing it to see a graphical user interface (GUI) that guides you through the process. Select the Fedora Workstation 33 option:

![Fedora Workstation download in Fedora Media Writer][6]

(Eric D. Shabell, [CC BY-SA 4.0][5])

Next, select the Create Live USB option in the top-right corner:

![Create Live USB button][7]

(Eric D. Shabell, [CC BY-SA 4.0][5])

The image will start to download, and you will see a drop-down menu to select where to install it:

![Downloading Fedora Workstation][8]

(Eric D. Shabell, [CC BY-SA 4.0][5])

Plug in a USB stick with enough space available, then after the download finishes, you can select and install the image on it. Once it's finished, close the GUI and remove the USB stick.

### Install Linux

Insert the USB stick you created into the port on the left side of your MacBook Pro, and restart it while holding down the **Option** (or **Alt**) key just to the left of the **Cmd** key. This opens a menu of options to start the machine; use the EFI option, as that's the USB image.

The laptop will boot from the USB device, and you can follow the [normal Fedora installation][9] process. It helps if you can plug the MacBook Pro into a network cable connection, as the Broadcom WiFi device will not work out of the box.

![MacBook Pro][10]

(Eric D. Shabell, [CC BY-SA 4.0][5])

You should get the opportunity to install Fedora to your hard drive and put it on your machine permanently.

![Installing Fedora on MacBook Pro][11]

(Eric D. Shabell, [CC BY-SA 4.0][5])

Once the installer completes, reboot your machine, and Fedora 33 should now be the option to boot from.

![MacBook Pro booting into Fedora][12]

(Eric D. Shabell, [CC BY-SA 4.0][5])

The only thing missing is a WiFi driver, so keep your network cable connected to install the development packages for the kernel you are running and to build the `broadcom-wl` driver for that kernel.

Verify the card you need for WiFi:


```
`$ lspci -vnn -d 14e4:`
```

There will be several items in the output, including something like:


```
Network controller [0280]: Broadcom Inc. and subsidiaries....

Subsystem: Apple Inc. AirPort Extreme...
```

Install a repository to pull the Broadcom stuff:


```
`$ su -c 'dnf install -y http://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm'`
```

The next part is interesting: As you look at the running kernel, you'll see `v5.9.8-200.fc33`, but you will use the development kernel packages to build your Broadcom wireless driver. So, you need to install `v5.8.15-301.fc33` (available at the time of this writing). Check them using `uname -r`, and list the installed kernel packages using `sudo dnf list kernel`:


```
$ sudo dnf list kernel

kernel.x86_64                     5.8.15-301.fc33

kernel.x86_64                     5.9.8-200.fc33
```

Install the development packages:


```
`$ sudo dnf install -y akmods kernel-devel-5.8.15-301.fc33`
```

![Installing development packages][13]

(Eric D. Shabell, [CC BY-SA 4.0][5])

Install the Broadcom wireless package:


```
`$ sudo dnf install -y broadcom-wl`
```

Build the kernel module:


```
`$ sudo akmods`
```

![Building the kernel module][14]

(Eric D. Shabell, [CC BY-SA 4.0][5])

Reboot your machine, and you should be able to view the wireless driver (`wl`) with:


```
`$ lsmod | grep wl`
```

Set up your wireless connection in Fedora:

![Set up wireless connection][15]

(Eric D. Shabell, [CC BY-SA 4.0][5])

This article is a bit out of the ordinary for me, but I hope it might help someone else enjoy some fun on the weekend with some old hardware!

> Going off the beaten path now... installing [#Fedora][16] on a macbook pro from 2011. Wish me luck! [pic.twitter.com/zlsESnq2Px][17]
>
> — Eric D. Schabell (@ericschabell) [November 22, 2020][18]

* * *

_This originally appeared on [Schabell.org][19] and is republished with permission._

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/12/linux-macbook

作者：[Eric D. Schabell][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/eschabell
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_desk_home_laptop_browser.png?itok=Y3UVpY0l (Digital images of a computer desktop)
[2]: https://getfedora.org/en/
[3]: https://getfedora.org/en/workstation/download/
[4]: https://opensource.com/sites/default/files/uploads/fedoramediawriter.png (Fedora Media Writer download screen)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/fedoraworkstation33-installation.png (Fedora Workstation download in Fedora Media Writer)
[7]: https://opensource.com/sites/default/files/uploads/create-live-usb.png (Create Live USB button)
[8]: https://opensource.com/sites/default/files/uploads/download_fedora-workstation.png (Downloading Fedora Workstation)
[9]: https://docs.fedoraproject.org/en-US/fedora/f33/install-guide/install/Booting_the_Installation/
[10]: https://opensource.com/sites/default/files/uploads/macbook.jpeg (MacBook Pro)
[11]: https://opensource.com/sites/default/files/uploads/macbook_install-fedora.jpeg (Installing Fedora on MacBook Pro)
[12]: https://opensource.com/sites/default/files/uploads/macbook_fedora-boot.jpeg (MacBook Pro booting into Fedora)
[13]: https://opensource.com/sites/default/files/uploads/install-development-packages.jpeg (Installing development packages)
[14]: https://opensource.com/sites/default/files/uploads/build-kernel-module.jpeg (Building the kernel module)
[15]: https://opensource.com/sites/default/files/uploads/wireless-setup.jpeg (Set up wireless connection)
[16]: https://twitter.com/hashtag/Fedora?src=hash&ref_src=twsrc%5Etfw
[17]: https://t.co/zlsESnq2Px
[18]: https://twitter.com/ericschabell/status/1330434517883121665?ref_src=twsrc%5Etfw
[19]: https://www.schabell.org/2020/11/installing-fedora33-on-macbook-pro-13inch-late-2011.html
