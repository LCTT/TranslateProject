Daily Ubuntu Tips – Intel Graphics Installer 1.0.3 Released – Supports Ubuntu 13.10
================================================================================
For those using desktops or laptops with Intel graphic cards running Ubuntu Linux 13.10, here’s something they might want to do – Install Intel Graphic Installer for Linux.

Intel Graphic Installer for Linux allows users to easily install the latest graphic and video drivers for Intel graphic hardware. Until just recently, there were no support Ubuntu Linux 13.10.

If you want to stay current with the latest drivers for Intel cards in your machine, you might need this installer. It enhances, optimizes and provides the best user experience with your Intel graphic hardware.

[https://01.org/linuxgraphics/downloads/2013/intelr-graphics-installer-1.0.3-linux][1]

### Installing Intel Graphic Installer in Ubuntu ###

If you surely know that your computer has an Intel graphic card and you’re running Ubuntu 13.10, continue below to learn how to install this package,

Some users have had issues with their systems after installing and configuring the driver package, so you should be cautious and backup your system before installing. When you’re done and ready, run the commands below to download the 32-bit version of the package.

### 32-bit Ubuntu Linux ###

    cd /tmp && wget https://download.01.org/gfx/ubuntu/13.10/main/pool/main/i/intel-linux-graphics-installer/intel-linux-graphics-installer_1.0.3_i386.deb

For those running 64-bit Ubuntu, run the commands below to download the 64-bit version.

### 64-bit Ubuntu Linux ###

    cd /tmp && wget https://download.01.org/gfx/ubuntu/13.10/main/pool/main/i/intel-linux-graphics-installer/intel-linux-graphics-installer_1.0.3_amd64.deb

After downloading the package, run the commands below to install.

    sudo dpkg -i intel-linux-graphics-installer*.deb; sudo apt-get -f install

After installing the installer, go to Unity Dash and search for the installer. When it opens, continue. It will search and identify the correct driver for your device.

![](http://www.liberiangeek.net/wp-content/uploads/2014/01/intelgraphicsinstaller.png)

In order for your system to trust Intel Graphic Installer, you must add the following key to Ubuntu’s software repository. Run the commands below to add it.

    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | sudo apt-key add -

That’s it. If you did everything as described above, your machine should be running the correct Intel driver. If not, it maybe that your graphic card isn’t compatible or it’s not supported.

Enjoy!

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/01/daily-ubuntu-tips-intel-graphics-installer-1-0-3-released-supports-ubuntu-13-10/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://01.org/linuxgraphics/downloads/2013/intelr-graphics-installer-1.0.3-linux