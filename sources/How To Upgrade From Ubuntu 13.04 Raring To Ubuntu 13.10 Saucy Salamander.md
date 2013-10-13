(runningwater翻译中)How To Upgrade From Ubuntu 13.04 Raring To Ubuntu 13.10 Saucy Salamander
================================================================================
**Ubuntu 13.10 Saucy** will be released on **October 17th**. Hope it will come with lot of improvements and features than Ubuntu 13.04 Raring and the previous versions. Everybody are curiously waiting to see what Ubuntu 13.10 will offer to Ubuntu lovers. Ubuntu 13.10 Final beta is already out a week before.

If you have Ubuntu 13,04, 12,10 or 12.04 Precise Pangolin or older version of Ubuntu on your system, and want to upgrade to this new release? I know you wish. Just follow the simple steps below, you can easily upgrade from Ubuntu 13.04 to Ubuntu 13.10 Saucy both Desktop and as well as Server editions.

**Important**: Before proceeding to upgrade, make a **full backup of your data** to an external device (USB stick or CD/DVD).

**Desktop Upgrade

1. Update the system before to upgrade**

Before to upgrade, we need to update the system, press open up Terminal and enter the following commands.

    sudo apt-get update && sudo apt-get dist-upgrade

Now it is time to upgrade to new available version.

    sudo update-manager -d

Software Updater will open up and will search for the new releases.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Software-Updater_001.png)

After a few seconds You will see screen just like below that saying “**However, Ubuntu 13.10 is available now (you have 13.04)**”.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Software-Updater_002.png)

Then click **Upgrade** to start.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Release-Notes_003.png)

The Software Updater will ask you to confirm still you want to upgrade. Click **Start Upgrade** to begin installing Ubuntu 13.10.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Untitled-window_005.png)

Now the Software Updater will fetch and install the files. It will take a while depending upon your Internet connection speed. Sit back and relax.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Distribution-Upgrade_006.png)

After a while you’ll be asked to remove unnecessary applications.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Untitled-window_008.png)

Finally click Restart to complete the upgrade.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Untitled-window_009.png)

Now you have latest Ubuntu 13.10 distribution in your system.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/Details_010.png)

**Server Upgrade**

To upgrade from Ubuntu 13.04 server to Ubuntu 13.10 server, do the following steps.

Install the **update-manager-core** package if it is not already installed:

    sudo apt-get install update-manager-core

Edit the file **/etc/update-manager/release-upgrades**,

    sudo nano /etc/update-manager/release-upgrades

and set **Prompt=normal** as shown below.

    # Default behavior for the release upgrader.
    
    [DEFAULT]
    # Default prompting behavior, valid options:
    #
    #  never  - Never check for a new release.
    #  normal - Check to see if a new release is available.  If more than one new
    #       release is found, the release upgrader will attempt to upgrade to
    #       the release that immediately succeeds the currently-running
    #       release.
    #  lts- Check to see if a new LTS release is available.  The upgrader
    #       will attempt to upgrade to the first LTS release available after
    #       the currently-running one.  Note that this option should not be
    #       used if the currently-running release is not itself an LTS
    #       release, since in that case the upgrader won't be able to
    #       determine if a newer release is available.
    Prompt=normal

Now it is time to upgrade your server system to latest version using the following command:

    sudo do-release-upgrade -d

Follow the on-screen instructions. You’re done!!.

You successfully upgraded to Ubuntu 13.10, so what’s now? Check out our new article “**Top Things To Do After Installing Ubuntu 13.10**″. Now you’ll be able to get a full fledged perfect desktop. Cheers!!

**Please Note: This is a beta release. I recommend you to do not install it on Production environment. The final stable version will be released on 17th, October 2013.**


--------------------------------------------------------------------------------

via: http://www.unixmen.com/upgrade-ubuntu-13-04-raring-ubuntu-13-10-saucy-salamander/

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[runningwater](https://github.com/runningwater) 校对：[校对者ID](https://github.com/校对者ID)
