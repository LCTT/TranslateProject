How to Install the Latest NVIDIA 331.20 Driver in Ubuntu 13.10
================================================================================
**The installation of new NVIDIA drivers can be a problem sometimes, especially if you are not accustomed with the way things usually work on a Linux operating system.**

![](http://i1-news.softpedia-static.com/images/news2/How-to-Install-the-Latest-NVIDIA-331-20-Drivers-in-Ubuntu-13-10-399182-2.jpg)

This is where this tutorial will come in handy, to help regular users benefit from the most recent NVIDIA drivers, 331.20.

There are just a couple of ways of installing the NVIDIA driver on an Ubuntu system, the easy way and the hard way. The easy way is also the most straightforward, but it requires a working internet connection. This method will also introduce you into the beautiful world of PPAs.

Ubuntu 13.10, just like its predecessors, benefits from a large repository, but Canonical developers don’t upload the most recent version of the driver for several considerations. The most important is that it they don’t risk uploading a piece of software that has yet to be proven stable.

Fortunately, there is a PPA available that makes available the latest versions of the drivers, a day or two after the launch. Just enter the following command in a terminal (you will need root access):

    sudo add-apt-repository ppa:xorg-edgers/ppa
    sudo apt-get update
    sudo apt-get install nvidia-331

If you already have an older version of the driver you will need to replace the last command with sudo apt-get dist-upgrade

After the process has finished restart the computer and you’re set. The next time NVIDIA releases a new driver, you will only have to update the system, without adding the PPA.

The second method is a little more complicated, but you don’t need an Internet connection (you will need to download the driver at some point, but you don’t need the connection during the installation). We will be using the 64-bit driver as an example.

You will have to enter the virtual console with Ctrl + Alt + F1 and login into the system with the username and password. In here, you need to navigate to the location of your driver (for example Downloads) and enter the following commands

    sudo service lightdm stop
    sudo chmod a+x NVIDIA-Linux-x86_64-331.20.run
    sudo ./NVIDIA-Linux-x86_64-331.20.run
    sudo reboot

This is it. Whatever method you choose, enjoy the latest NVIDIA drivers.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Install-the-Latest-NVIDIA-331-20-Drivers-in-Ubuntu-13-10-399182.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]: