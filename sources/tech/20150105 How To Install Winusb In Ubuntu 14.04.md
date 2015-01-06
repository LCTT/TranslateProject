How To Install Winusb In Ubuntu 14.04
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/WinUSB_Ubuntu_1404.jpeg)

[WinUSB][1] is a simple and useful tool that lets you create USB stick Windows installer from the Windows ISO image or DVD. It comprises of both GUI and command line tool and you can decide to choose which to use based on your preference.

In this quick post we shall see **how to install WinUSB in Ubuntu 14.04, 14.10 and Linux Mint 17**.

### Install WinUSB in Ubuntu 14.04 and Ubuntu 14.10 ###

Until Ubuntu 13.10, WinUSB was developed actively and it was available for installation via its official PPA. This PPA has not been updated for Ubuntu 14.04 Trusty Tahr and 14.10 but the binaries are still there and works fine in newer version of Ubuntu and Linux Mint. Based on [whether your Ubuntu system is 32 bit or 64 bit][2], use the command below to download the binaries:

Open a terminal and use the following command for 32 bit system:

    wget https://launchpad.net/~colingille/+archive/freshlight/+files/winusb_1.0.11+saucy1_i386.deb

For 64 bit systems, use the command below:

    wget https://launchpad.net/~colingille/+archive/freshlight/+files/winusb_1.0.11+saucy1_amd64.deb

Once you have downloaded the correct binaries, you can install WinUSB using the command below:

    sudo dpkg -i winusb*

Don’t worry if you see error when you try to install WinUSB. Fix the dependency errors with this command:

    sudo apt-get -f install

Afterwards, you can search for WinUSB in Unity Dash and use it to create a live USB of Windows in Ubuntu 14.04.

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/WinUSB_Ubuntu.png)

I hope this quick post helped you to **install WinUSB in Ubuntu 14.04, 14.10 and Linux Mint 17**.

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-winusb-in-ubuntu-14-04/

作者：[Abhishek][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://en.congelli.eu/prog_info_winusb.html
[2]:http://itsfoss.com/how-to-know-ubuntu-unity-version/