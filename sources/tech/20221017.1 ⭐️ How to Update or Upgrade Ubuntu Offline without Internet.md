[#]: subject: "How to Update or Upgrade Ubuntu Offline without Internet"
[#]: via: "https://www.debugpoint.com/how-to-update-or-upgrade-ubuntu-offline-without-internet/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Update or Upgrade Ubuntu Offline without Internet
======

**This guide explains the steps to update Ubuntu offline without an active internet connection.**

There are many situations where you may need to update your Ubuntu installation without an internet connection. You may be staying remotely or have a set of network Ubuntu systems that are not connected to the internet. In any case, keeping your system updated with the latest packages is always required.

Of course, updating any system while connected to the internet is always recommended.

But sometimes, it is not possible for security reasons also. Connecting to the internet may bring additional hardening steps for your systems to protect them from hackers and malware.

The following method using [apt-offline][1] helps to fix those use cases and outlines the steps to update your Ubuntu offline without the internet.

### Pre-requisite

- You need to have access to a Ubuntu system that has an internet connection (e.g. your friends, cafe, or lab system)
- A USB pen drive to hold the packages
- Install the apt-offline package in both the systems – a) the offline system and b) the system with an internet connection.

### Install apt-offline

both systems

You can install the `apt-offline` using the following command. Remember, you have to get it installed in .

```
sudo apt install apt-offline
```

In case you need the `apt-offline` to be installed in the target system, you can download the deb package from the below link and copy it to the target system via a USB stick. Then run the below command to install.

The download link for Ubuntu 22.04 LTS and other versions is present below. You can choose a mirror and download the deb file.

[download .deb files – apt-offline][2]

```
sudo dpkg -i name_of_package.deb
```

### Update Ubuntu offline: Steps

Open a terminal in the offline Ubuntu system and create a signature file using the following command in your home directory.

```
sudo apt-offline set ~/offline-data.sig
```

[![Create the sig file][3]][4]

This creates a file containing the required package paths and details for download.

[![sig file contents][5]][6]

Copy this .sig file to a USB and take it to a Ubuntu system with internet access.

Create a directory (see example below) to hold the downloaded packages in the Ubuntu system with an internet connection.

Open a terminal and run the following command to download the required packages. Remember to change the download directory and .sig file path as per your system.

```
apt-offline get -d ~/offline-data-dir offline-data.sig
```

[![Download the packages to install offline][7]][8]

offline Ubuntu system

You should see the files are downloaded properly. Now copy the entire downloaded directory to the USB drive and plug it into the .

Then run the following command to install the downloaded packages to the offline system. Change the directory path as per your system.

```
sudo apt-offline install offline-data-dir/
```

[![Installing packages - offline update ubuntu][9]][10]

The update should run smoothly if all goes well, and you should have an updated Ubuntu system.

You must repeat the steps above to keep your Ubuntu system up-to-date offline whenever you need to update.

I hope this guide helps you to update your Ubuntu system in an offline mode. If you face any trouble, let me know in the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/how-to-update-or-upgrade-ubuntu-offline-without-internet/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://github.com/rickysarraf/apt-offline
[2]: https://packages.ubuntu.com/focal/all/apt-offline/download
[3]: https://www.debugpoint.com/wp-content/uploads/2021/03/Create-the-sig-file-1024x204.jpg
[4]: https://www.debugpoint.com/wp-content/uploads/2021/03/Create-the-sig-file.jpg
[5]: https://www.debugpoint.com/wp-content/uploads/2021/03/sig-file-contents-1024x250.jpg
[6]: https://www.debugpoint.com/wp-content/uploads/2021/03/sig-file-contents.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2021/03/Download-the-packages-to-install-offline-1024x437.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2021/03/Download-the-packages-to-install-offline.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2021/03/Installing-packages-offline-update-ubuntu-1024x509.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2021/03/Installing-packages-offline-update-ubuntu.jpg
