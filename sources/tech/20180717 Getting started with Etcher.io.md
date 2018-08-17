Getting started with Etcher.io
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/community-penguins-osdc-lead.png?itok=BmqsAF4A)

Bootable USB drives are a great way to try out a new Linux distribution to see if you like it before you install. While some Linux distributions, like [Fedora][1], make it easy to create bootable media, most others provide the ISOs or image files and leave the media creation decisions up to the user. There's always the option to use `dd` to create media on the command line—but let's face it, even for the most experienced user, that's still a pain. There are other utilities—like UnetBootIn, Disk Utility on MacOS, and Win32DiskImager on Windows—that create bootable USBs.

### Installing Etcher

About 18 months ago, I came upon [Etcher.io][2] , a great open source project that allows easy and foolproof media creation on Linux, Windows, or MacOS. Etcher.io has become my "go-to" application for creating bootable media for Linux. I can easily download ISO or IMG files and burn them to flash drives and SD cards. It's an open source project licensed under [Apache 2.0][3] , and the [source code][4] is available on GitHub.

Go to the [Etcher.io][5] website and click on the download link for your operating system—32- or 64-bit Linux, 32- or 64-bit Windows, or MacOS.

![](https://opensource.com/sites/default/files/uploads/etcher_1.png)

Etcher provides great instructions in its GitHub repository for adding Etcher to your collection of Linux utilities.

If you are on Debian or Ubuntu, add the Etcher Debian repository:
```
$echo "deb https://dl.bintray.com/resin-io/debian stable etcher" | sudo tee

/etc/apt/sources.list.d/etcher.list



Trust Bintray.com GPG key

$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 379CE192D401AB61

```

Then update your system and install:
```
$ sudo apt-get update

$ sudo apt-get install etcher-electron

```

If you are using Fedora or Red Hat Enterprise Linux, add the Etcher RPM repository:
```
$ sudo wget https://bintray.com/resin-io/redhat/rpm -O /etc/yum.repos.d/bintray-

resin-io-redhat.repo

```

Update and install using either:
```
$ sudo yum install -y etcher-electron

```

or:
```
$ sudo dnf install -y etcher-electron

```

### Creating bootable drives

In addition to creating bootable images for Ubuntu, EndlessOS, and other flavors of Linux, I have used Etcher to [create SD card images][6] for the Raspberry Pi. Here's how to create bootable media.

First, download to your computer the ISO or image you want to use. Then, launch Etcher and insert your USB or SD card into the computer.

![](https://opensource.com/sites/default/files/uploads/etcher_2.png)

Click on **Select Image**. In this example, I want to create a bootable USB drive to install Ubermix on a new computer. Once I have selected my Ubermix image file and inserted my USB drive into the computer, Etcher.io  "sees" the drive, and I can begin the process of installing Ubermix on my USB.

![](https://opensource.com/sites/default/files/uploads/etcher_3.png)

Once I click on **Flash** , the installation process begins. The time required depends on the image's size. After the image is installed on the drive, the software verifies the installation; at the end, a banner announces my media creation is complete.

If you need [help with Etcher][7], contact the community through its [Discourse][8] forum. Etcher is very easy to use, and it has replaced all my other media creation tools because none of them do the job as easily or as well as Etcher.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/7/getting-started-etcherio

作者：[Don Watkins][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/don-watkins
[1]:https://getfedora.org/en_GB/workstation/download/
[2]:http://etcher.io
[3]:https://github.com/resin-io/etcher/blob/master/LICENSE
[4]:https://github.com/resin-io/etcher
[5]:https://etcher.io/
[6]:https://www.raspberrypi.org/magpi/pi-sd-etcher/
[7]:https://github.com/resin-io/etcher/blob/master/SUPPORT.md
[8]:https://forums.resin.io/c/etcher
