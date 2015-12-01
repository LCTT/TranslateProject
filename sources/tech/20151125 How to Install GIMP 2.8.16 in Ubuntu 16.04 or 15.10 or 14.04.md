translation by strugglingyouth
How to Install GIMP 2.8.16 in Ubuntu 16.04, 15.10, 14.04
================================================================================
![GIMP 2.8.16](http://ubuntuhandbook.org/wp-content/uploads/2015/11/gimp-icon.png)

GIMP image editor 2.8.16 was released on its 20th birthday. Here’s how to install or upgrade in Ubuntu 16.04, Ubuntu 15.10, Ubuntu 14.04, Ubuntu 12.04 and their derivatives, e.g., Linux Mint 17.x/13, Elementary OS Freya.

GIMP 2.8.16 features support for layer groups in OpenRaster files, fixes for layer groups support in PSD, various user inrterface improvements, OSX build system fixes, translation updates, and more changes. Read the [official announcement][1].

![GIMP image editor 2.8,16](http://ubuntuhandbook.org/wp-content/uploads/2014/08/gimp-2-8-14.jpg)

### How to Install or Upgrade: ###

Thanks to Otto Meier, an [Ubuntu PPA][2] with latest GIMP packages is available for all current Ubuntu releases and derivatives.

**1. Add GIMP PPA**

Open terminal from Unity Dash, App launcher, or via Ctrl+Alt+T shortcut key. When it opens, paste below command and hit Enter:

    sudo add-apt-repository ppa:otto-kesselgulasch/gimp

![add GIMP PPA](http://ubuntuhandbook.org/wp-content/uploads/2015/11/gimp-ppa.jpg)

Type in your password when it asks, no visual feedback so just type in mind, and hit enter to continue.

**2. Install or Upgrade the editor.**

After added the PPA, launch **Software Updater** (or Software Manager in Mint). After checking for updates, you’ll see GIMP in the update list. Click “Install Now” to upgrade it.

![upgrade-gimp2816](http://ubuntuhandbook.org/wp-content/uploads/2015/11/upgrade-gimp2816.jpg)

For those who prefer Linux commands, run below commands one by one to refresh your repository caches and install GIMP:

    sudo apt-get update
    
    sudo apt-get install gimp

**3. (Optional) Uninstall.**

Just in case you want to uninstall or downgrade GIMP image editor. Use Software Center to remove it, or run below commands one by one to purge PPA as well as downgrade the software:

    sudo apt-get install ppa-purge
    
    sudo ppa-purge ppa:otto-kesselgulasch/gimp

That’s it. Enjoy!

--------------------------------------------------------------------------------

via: http://ubuntuhandbook.org/index.php/2015/11/how-to-install-gimp-2-8-16-in-ubuntu-16-04-15-10-14-04/

作者：[Ji m][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ubuntuhandbook.org/index.php/about/
[1]:http://www.gimp.org/news/2015/11/22/20-years-of-gimp-release-of-gimp-2816/
[2]:https://launchpad.net/~otto-kesselgulasch/+archive/ubuntu/gimp
