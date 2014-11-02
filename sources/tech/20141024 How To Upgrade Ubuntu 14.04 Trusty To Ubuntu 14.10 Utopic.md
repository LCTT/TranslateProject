johnhoow translating...
How To Upgrade Ubuntu 14.04 Trusty To Ubuntu 14.10 Utopic
================================================================================
Hello all! Greetings! Today, we will discuss about how to upgrade from Ubuntu 14.04 to 14.10 final beta. As you may know, Ubuntu 14.10 final beta has already been released. According to the [Ubuntu release schedule][1], the final stable version will be available today in a couple of hours.

Do you want to upgrade to Ubuntu 14.10 from Ubuntu 14.04/13.10/13,04/12,10/12.04, or older version on your system? Just follow the simple steps given below. Please note that you can’t directly upgrade from 13.10 to 14.04. First, you should upgrade from 13.10 to 14.04, and then upgrade from 14.04 to 14.10. Clear? Good. Now, Let us start the upgrade process.

Though, the steps provided below are compatible for Ubuntu 14.10, It might work for other Ubuntu derivatives such as Lubuntu 14.10, Kubuntu 14.10, and Xubuntu 14.10 as well.

**Important**: Before upgrading, don’t forget to backup your important data to any external device like USB hdd or CD/DVD.

### Desktop Upgrade ###

Before going to upgrade, we need to update the system. Open up the Terminal and enter the following commands.

    sudo apt-get update && sudo apt-get dist-upgrade

The above command will download and install the available latest packages.

Reboot your system to finish installing updates.

Now, enter the following command to upgrade to new available version.

    sudo update-manager -d

Software Updater will show up and search for the new release.

After a few seconds, you will see a screen like below that saying: “**However, Ubuntu 14.10 is available now (you have 14.04)**”. Click on the button Upgrade to start upgrading to Ubuntu 14.10.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Software-Updater_001.png)

The Software Updater will ask you to confirm still you want to upgrade. Click Start Upgrade to begin installing Ubuntu 14.10.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Release-Notes_002.png)

**Please Note**: This is a beta release. Do not install it on production systems. The final stable version will be released in a couple of hours.

Now, the Software Updater will prepare to start setting up new software channels.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Distribution-Upgrade_003.png)

After a few minutes, the software updater will notify you the details the number of packages are going to be removed, and number of packages are going to be installed. Click **Start upgrade** to continue. Make sure you have good and stable Internet connection.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Untitled-window_004.png)

Now, the updater will start to getting new packages. It will take a while depending upon your Internet connection speed.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Distribution-Upgrade_005.png)

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Distribution-Upgrade_001.png)

After a while, you’ll be asked to remove unnecessary applications. Finally, click **Restart** to complete the upgrade.

Congratulations! Now, you have successfully upgraded to Ubuntu 14.10.

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/10/Details_002.png)

That’s it.. Start using the new Ubuntu version.

### Server Upgrade ###

To upgrade from Ubuntu 14.04 server to Ubuntu 14.10 server, do the following steps.

Install the update-manager-core package if it is not already installed:

    sudo apt-get install update-manager-core

Edit the file /etc/update-manager/release-upgrades,

    sudo nano /etc/update-manager/release-upgrades

and set Prompt=normal or Prompt=lts as shown below.

    # Default behavior for the release upgrader.
    
    [DEFAULT]
    # Default prompting behavior, valid options:
    #
    #  never  - Never check for a new release.
    #  normal - Check to see if a new release is available.  If more than one new
    #           release is found, the release upgrader will attempt to upgrade to
    #           the release that immediately succeeds the currently-running
    #           release.
    #  lts    - Check to see if a new LTS release is available.  The upgrader
    #           will attempt to upgrade to the first LTS release available after
    #           the currently-running one.  Note that this option should not be
    #           used if the currently-running release is not itself an LTS
    #           release, since in that case the upgrader won't be able to
    #           determine if a newer release is available.
    Prompt=normal

Now, it is time to upgrade your server system to latest version using the following command:

    sudo do-release-upgrade -d

Follow the on-screen instructions. You’re done!!.

Cheers!!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/upgrade-ubuntu-14-04-trusty-ubuntu-14-10-utopic/

作者：SK
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://wiki.ubuntu.com/UtopicUnicorn/ReleaseSchedule
