NitroShare – Easily Share Files Between Multiple Operating Systems on Local Network
====

One of the most important uses of a network is for file sharing purposes. There are multiple ways Linux and Windows, Mac OS X users on a network can now share files with each other and in this post, we shall cover Nitroshare, a cross-platform, open-source and easy-to-use application for sharing files across a local network.

Nitroshare tremendously simplifies file sharing on a local network, once installed, it integrates with the operating system seamlessly. On Ubuntu, simply open it from the applications indicator, and on Windows, check it in the system tray.

Additionally, it automatically detects every other device on a network that has Nitroshare installed thereby enabling a user to easily transfer files from one machine to another by selecting which device to transfer to.

The following are the illustrious features of Nitroshare:

- Cross-platform, runs on Linux, Windows and Mac OS X
- Easy to setup, no configurations required
- It’s simple to use
- Supports automatic discovery of devices running Nitroshare on local network
- Supports optional TSL encryption for security
- Works at high speeds on fast networks
- Supports transfer of files and directories (folders on Windows)
- Supports desktop notifications about sent files, connected devices and more

The latest version of Nitroshare was developed using Qt 5, it comes with some great improvements such as:

- Polished user interfaces
- Simplified device discovery process
- Removal of file size limitation from other versions
- Configuration wizard has also been removed to make it easy to use

### How To Install Nitroshare on Linux Systems


NitroShare is developed to run on a wide variety of modern Linux distributions and desktop environments.

#### On Debian Sid and Ubuntu 16.04+

NitroShare is included in the Debian and Ubuntu software repositories and can be easily installed with the following command.

```
$ sudo apt-get install nitroshare
```

But the available version might be out of date, however, to install the latest version of Nitroshare, issue the command below to add the PPA for the latest packages:

```
$ sudo apt-add-repository ppa:george-edison55/nitroshare
$ sudo apt-get update
$ sudo apt-get install nitroshare
```

#### On Fedora 24-23

Recently, NitroShare has been included to Fedora repositories and can be installed with the following command:

```
$ sudo dnf install nitroshare
```

#### On Arch Linux

For Arch Linux, NitroShare packages are available from the AUR and can be built/installed with the following commands:

```
# wget https://aur.archlinux.org/cgit/aur.git/snapshot/nitroshare.tar.gz
# tar xf nitroshare.tar.gz
# cd nitroshare
# makepkg -sri
```

### How to Use NitroShare on Linux

Note: As I had already mentioned earlier on, all other machines that you wish to share files with on the local network must have Nitroshare installed and running.

After successfully installing it, search for Nitroshare in the system dash or system menu and launch it.

![](http://www.tecmint.com/wp-content/uploads/2016/09/NitroShare-Send-Files.png)

After selecting the files, click on “Open” to proceed to choosing the destination device as in the image below. Select the device and click “Ok” that is if you have any devices running Nitroshare on the local network.

![](http://www.tecmint.com/wp-content/uploads/2016/09/NitroShare-Local-Devices.png)

![](http://www.tecmint.com/wp-content/uploads/2016/09/NitroShare-File-Transfer-Progress.png)

From the NitroShare settings – General tab, you can add the device name, set default downloads location and in Advance settings you can set port, buffer, timeout, etc. only if you needed.

Homepage: <https://nitroshare.net/index.html>

That’s it for now, if you have any issues regarding Nitroshare, you can share with us using our comment section below. You can as well make suggestions and let us know of any wonderful, cross-platform file sharing applications out there that we probably have no idea about and always remember to stay connected to Tecmint.

--------------------------------------------------------------------------------

via: http://linoxide.com/firewall/pfsense-setup-basic-configuration/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://www.tecmint.com/author/aaronkili/
