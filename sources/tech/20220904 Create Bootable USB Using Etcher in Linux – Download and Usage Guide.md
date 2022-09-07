[#]: subject: "Create Bootable USB Using Etcher in Linux – Download and Usage Guide"
[#]: via: "https://www.debugpoint.com/etcher-bootable-usb-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create Bootable USB Using Etcher in Linux – Download and Usage Guide
======
A quick and easy tutorial on how to create a bootable USB using the Etcher tool in Ubuntu and other Linux.

[Etcher][1] is a utility created by [Balena][2], that makes your life easy with its unique take on creating bootable USB and SD cards with a .iso file. In this guide, I will show you the steps to download and install Etcher.

Although it is a bit trivial for some, it may be difficult for others. Hence this guide.

Primarily Etcher is used for flashing or writing the Linux OS .iso images, for example, Ubuntu, [Linux Mint][3] .iso images, etc. But ideally, it should work for any other .iso files as well.

There are other utilities available as well to create bootable USB disks in particular, like earlier I wrote about a [guide][4] using Unetbootin.

But that said, Etcher is, in my opinion, **faster, cleaner, and better**. It seldom fails. The success rate is high.

Before I explain the steps, a quick recap of its features.

### Etcher Features

* Crisp 3-step process to create a bootable USB drive
* Autodetect the USB
* Select the file, Select target, and write fast
* Clone a drive
* Choose the local downloaded .iso file Or directly from the URL
* Clean and eye-friendly UI
* Cross-platform – Linux, Windows, and macOS
* Built-in JS, electron
* Standalone AppImage executable available for Linux

### Installing Etcher

Etcher is available for all platforms. So you can easily install it using the following methods in all Linux distributions, macOS, and Windows.

Firstly, go to the below link.

[Download ETCHER][5]

#### For All Linux distributions

Download the AppImage executable from the above link. Then change the permission to the *executable* from ‘`right click -> properties` ’. Then run the file.

For distribution-specific packages, refer below.

#### Debian, Ubuntu

To install Etecher in Debian, Ubuntu, Linux Mint, and related distributions, follow the below commands from the terminal.

```
echo "deb https://deb.etcher.io stable etcher" | sudo tee /etc/apt/sources.list.d/balena-etcher.listsudo apt-key adv --keyserver hkps://keyserver.ubuntu.com:443 --recv-keys 379CE192D401AB61sudo apt-get updatesudo apt-get install balena-etcher-electron
```

#### Fedora

For Fedora, follow the below commands from the terminal.

```
sudo wget https://balena.io/etcher/static/etcher-rpm.repo -O /etc/yum.repos.d/etcher-rpm.reposudo dnf install -y balena-etcher-electron
```

#### Arch Linux

For Arch Linux, make sure yay is installed. Then you can run the below command to install.

```
yay -S balena-etcher
```

### Create bootable USB Using Etcher

Once you have installed it successfully. Launch the application. The first window shows 3 steps which you need to follow. Of course, you need a USB stick and the .iso file to write.

##### Step 1: Select the file

Plugin your target USB or SD card. Browse and select the location of your .iso file. Or, you can pull it directly from the internet as well via the URL option.

![Step 1 - Select the file][6]

##### Step 2: Select the target device

Click on select target and carefully choose your USB or SD card. Etcher is friendly enough to notify you which one of the devices is your system device so that you don’t end up destroying data.

Choose by clicking the check box. And click select.

![Step 2 - Select Target device][7]

##### Step3: Click flash to start creating the bootable USB or SD card.

![Step 3 - Start the process][8]

Wait until the process finishes.

![Process is complete][9]

And that’s it. You can safely remove the USB or SD card for your use.

### Closing Note

While there are many ways to create a bootable USB, such as you can use Unetbootin, MKUSB, or even using Ubuntu’s default Disk utility, Etcher makes it easier to do it. The UI design, only 3 steps process, makes it ideal for new users and source advanced users who want reliability.

Because a bootable USB is a critical asset and you should use an excellent program to prepare it.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/etcher-bootable-usb-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.balena.io/etcher/
[2]: https://www.balena.io/
[3]: https://www.debugpoint.com/linux-mint/
[4]: https://www.debugpoint.com/2015/05/how-to-create-a-bootable-usb-drive-in-ubuntu/
[5]: https://github.com/balena-io/etcher/releases
[6]: https://www.debugpoint.com/wp-content/uploads/2021/01/Step1-Select-the-file.jpg
[7]: https://www.debugpoint.com/wp-content/uploads/2021/01/Step-2-Select-Target-device.jpg
[8]: https://www.debugpoint.com/wp-content/uploads/2021/01/Step-3-Start-the-process.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2021/01/Process-is-complete.jpg
