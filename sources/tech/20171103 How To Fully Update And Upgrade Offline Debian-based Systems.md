Leemeans translatting

How To Fully Update And Upgrade Offline Debian-based Systems
======

![](https://www.ostechnix.com/wp-content/uploads/2017/11/Upgrade-Offline-Debian-based-Systems-2-720x340.png)

A while ago we have shown you how to install softwares in any[ **offline Ubuntu**][1] system and any [**offline Arch Linux**][2] system. Today, we will see how to fully update and upgrade offline Debian-based systems. Unlike the previous methods, we do not update/upgrade a single package, but the whole system. This method can be helpful where you don't have an active Internet connection or slow Internet speed.

### Fully Update And Upgrade Offline Debian-based Systems

Let us say, you have a system (Windows or Linux) with high-speed Internet connection at work and a Debian or any Debian derived systems with no internet connection or very slow Internet connection(like dial-up) at home. You want to upgrade your offline home system. What would you do? Buy a high speed Internet connection? Not necessary! You still can update or upgrade your offline system with Internet. This is where **Apt-Offline** comes in help.

As the name says, apt-offline is an Offline APT Package Manager for APT based systems like Debian and Debian derived distributions such as Ubuntu, Linux Mint. Using apt-offline, we can fully update/upgrade our Debian box without the need of connecting it to the Internet. It is cross-platform tool written in the Python Programming Language and has both CLI and graphical interfaces.

#### Requirements

  * An Internet connected system (Windows or Linux). We call it online system for the sake of easy understanding throughout this guide.
  * An Offline system (Debian and Debian derived system). We call it offline system.
  * USB drive or External Hard drive with sufficient space to carry all updated packages.



#### Installation

Apt-Offline is available in the default repositories of Debian and derivatives. If your Online system is running with Debian, Ubuntu, Linux Mint, and other DEB based systems, you can install Apt-Offline using command:
```
sudo apt-get install apt-offline
```

If your Online runs with any other distro than Debian, git clone Apt-Offline repository:
```
git clone https://github.com/rickysarraf/apt-offline.git
```

Go the directory and run it from there.
```
cd apt-offline/
```
```
sudo ./apt-offline
```

#### Steps to do in Offline system (Non-Internet connected system)

Go to your offline system and create a directory where you want to store the signature file:
```
mkdir ~/tmp
```
```
cd ~/tmp/
```

You can use any directory of your choice. Then, run the following command to generate the signature file:
```
sudo apt-offline set apt-offline.sig
```

Sample output would be:
```
Generating database of files that are needed for an update.

Generating database of file that are needed for operation upgrade
```

By default, apt-offline will generate database of files that are needed to be update and upgrade. You can use **--` update`** or `**--upgrade** options to create database for either one of these.`

Copy the entire **tmp** folder in an USB drive or external drive and go to your online system (Internet-enabled system).

#### Steps to do in Online system

Plug in your USB drive and go to the temp directory:
```
cd tmp/
```

Then, run the following command:
```
sudo apt-offline get apt-offline.sig --threads 5 --bundle apt-offline-bundle.zip
```

Here, "-threads 5" represents the number of APT repositories. You can increase the number if you want to download packages from more repositories. And, "-bundle apt-offline-bundle.zip" option represents all packages will be bundled in a single archive file called **apt-offline-bundle.zip**. This archive file will be saved in your current working directory.

The above command will download data based on the signature file generated earlier in the offline system.

[![][3]][4]

This will take several minutes depending upon the Internet connection speed. Please note that apt-offline is cross platform, so you can use it to download packages on any OS.

Once completed, copy the **tmp** folder to USB or External drive and return back to the offline system. Make sure your USB device has enough free space to keep all downloaded files, because all packages are available in the tmp folder now.

#### Steps to do in offline system

Plug in the device in your offline system and go to the **tmp** directory where you have downloaded all packages earlier.
```
cd tmp
```

Then, run the following command to install all download packages.
```
sudo apt-offline install apt-offline-bundle.zip
```

This will update the APT database, so APT will find all required packages in the APT cache.

**Note:** If both online and offline systems are in the same local network, you can transfer the **tmp** folder to the offline system using  "scp" or any other file transfer applications. If both systems are in different places, copy the folder using USB devices.

And, that's all for now folks. I hope this guide will useful for you. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/fully-update-upgrade-offline-debian-based-systems/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/install-softwares-offline-ubuntu-16-04/
[2]:https://www.ostechnix.com/install-packages-offline-arch-linux/
[3]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[4]:http://www.ostechnix.com/wp-content/uploads/2017/11/apt-offline.png
