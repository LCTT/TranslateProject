Translating by XLCYun
Install Intel Graphics Installer in Ubuntu 15.10
================================================================================
![Intel graphics installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/intel_logo.jpg)

Intel has announced a new release of its Linux graphics installer recently. Ubuntu 15.10 Wily is required and support for Ubuntu 15.04 is deprecated in the new release.

> The Intel® Graphics Installer for Linux* allows you to easily install the latest graphics and video drivers for your Intel graphics hardware. This allows you to stay current with the latest enhancements, optimizations, and fixes to the Intel® Graphics Stack to ensure the best user experience with your Intel® graphics hardware. The Intel® Graphics Installer for Linux* is available for the latest version of Ubuntu*.

![intel-graphics-installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/intel-graphics-installer.jpg)

### How to Install: ###

**1.** Download the installer from [the link page][1]. The current is version 1.2.1 for Ubuntu 15.10. Check your OS type, 32-bit or 64-bit, via **System Settings -> Details**.

![download-intel-graphics-installer](http://ubuntuhandbook.org/wp-content/uploads/2015/11/download-intel-graphics-installer.jpg)

**2.** Once the download process finished, go to your Download folder and click open the .deb package with Ubuntu Software Center and finally click the install button.

![install-via-software-center](http://ubuntuhandbook.org/wp-content/uploads/2015/11/install-via-software-center.jpg)

**3.** In order to trust the Intel Graphics Installer, you will need to add keys via below commands.

Open terminal from Unity Dash, App Launcher, or via Ctrl+Alt+T shortcut key. When it opens, paste below commands and run one by one:

    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | sudo apt-key add -
    
    wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-2 -O - | sudo apt-key add -

![trust-intel](http://ubuntuhandbook.org/wp-content/uploads/2015/11/trust-intel.jpg)

NOTE: While running the first command, if the cursor is stuck and blinking after downloading the key, as above picture shows, type your password (no visual feedback) and hit enter to continue.

Finally launch Intel Graphics Installer via Unity Dash or Application launcher.

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/install-intel-graphics-installer-in-ubuntu-15-10/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:https://01.org/linuxgraphics/downloads
