[翻译中] by KayGuowhu
How to Upgrade to GNOME 3.10 in Ubuntu 13.10
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/09/header-bars.jpg)

**Ubuntu 13.10 ships with the GNOME 3.8 desktop available in its archives. While a dependable, stable and featured alternative to Unity, it’s also outdated.**

The newer version of the GNOME desktop was released back in September 2013 and comes with a raft of improved features, apps and usability tweaks. From hi-res screen support to new client-side decoration of app windows, GNOME 3.10 is a compelling upgrade.

The good news is that – providing you’re running Ubuntu 13.10, have a decent internet connection, and some command line aptitude (pun fully intended) – you don’t have to stick with a stale version of GNOME.

### How To Upgrade to GNOME 3.10 in Ubuntu 13.10 ###

For the benefit of the skim readers whose eyes dropped straight to the point I’ll reiterate: you **need to be running Ubuntu 13.10 to install GNOME 3.10**.

First, let’s add the GNOME 3 PPA to Ubuntu’s Software Sources. This can be done using a GUI but it is far easier to achieve using the command line.

Open a new *Terminal* window and enter the following command, entering your user password when asked:

    sudo add-apt-repository ppa:gnome3-team/gnome3-next && sudo apt-get update

With the PPA added and our package list updated we can move on to installing GNOME 3.10 itself. To do this run the following command, again entering your user password when prompted:

    sudo apt-get update && sudo apt-get install gnome-shell ubuntu-gnome-desktop

It can take a while for all the necessary packages and components to be fetched and installed, so try to be patient.

Midway through the installation a prompt will appear in the Terminal asking you to choose what display manager – aka “login screen” – should be used by default.

This decision is entirely up to you; both Ubuntu’s Unity Greeter and the **GNOME Display Manager** let you easily switch between desktop sessions (handy if you want to keep Unity or another desktop around) but only GDM offers GNOME-specific features such as lock-screen notifications.

When you’re ready to decide make your selection using the up/down arrow keys and hit ‘Enter/Return’ to confirm. The installation will then proceed.

### Adding The Extra Stuff ###

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/09/gnome-music.jpg)

GNOME 3.10 comes with some great new features, applications – [including GNOME Weather, Music and Maps][1] – and other miscellaneous changes. Because not all of these are considered ‘stable’ enough to be included in the main GNOME 3 PPA we added earlier, you’ll need to make use of an additional pair of GNOME PPAs if you want to use them.

Now – and it’s important you’re aware of this – some of the packages in these repositories are reported to have stability issues. Most of these will be minor – i.e., the odd app crash or broken feature – but the potential for more major issues, like making GNOME crash entirely, is possible.

Warning out of the way, open up a new tab in a Terminal and punch in the following:

    sudo add-apt-repository ppa:gnome3-team/gnome3-staging
    sudo add-apt-repository ppa:gnome3-team/gnome3
    sudo apt-get update && sudo apt-get dist-upgrade

To add some of the cool apps we mentioned earlier run:

    sudo apt-get install gnome-weather gnome-music gnome-maps cheese gnome-documents

With that we’re done!

You may wish to log out and back in (remembering to select the ‘GNOME’ session) to ensure that everything takes effect correctly.

### Minor Differences ###

If you’ve kept Unity installed alongside GNOME 3.10 then there are a few things you’ll need to note down.

First off, you’ll find **two entries for ‘Online Accounts’ in System Settings**. The one with the key-themed icon is the Unity version, and the one with the plug emblem is GNOME’s.

Some apps will require you to add accounts to the Unity version (Shotwell, Gwibber, Empathy) and some to the GNOME one (Evolution, Documents, Contacts).

![](http://www.omgubuntu.co.uk/wp-content/uploads/2013/04/online-accounts.jpg)

The ‘Notifications’ and ‘Search’ entries are GNOME-specific, both letting you pick and choose which applications and sources are able to show notifications or appear in the Activities Overlay.

### Uninstalling GNOME 3.10 ###

So you’ve tried it and didn’t like it. Now what?

Removing GNOME 3.10 is a fairly straightforward processing providing we use a command-line tool called ‘PPA Purge’. It can be found in the Ubuntu Software Center and is by far the easiest way to automatically remove and/or downgrade packages installed from PPAs.

- [Install PPA Purge from Ubuntu Software Center][2]

To use the tool we’ll need to go back to the terminal and enter the following, taking care to look out for any prompts that may appear during the downgrade process.

    sudo ppa-purge ppa:gnome3-team/gnome3-next

If you also added the optional extra PPAs you will also need to purge those as well:

    sudo ppa-purge ppa:gnome3-team/gnome3-staging
    sudo ppa-purge ppa:gnome3-team/gnome3

Once completed you should be left with the stock GNOME 3.8 desktop. If you don’t want to keep GNOME Shell around at all you can proceed to remove it:

    sudo apt-get remove gnome-shell ubuntu-gnome-desktop

Finally, manually remove any remaining applications that persist after downgrade (e.g., Epiphany and GNOME Documents), then reboot.

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2013/12/upgrade-gnome-3-10-ubuntu-13-10

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.omgubuntu.co.uk/2013/09/gnome-3-10-released-with-new-apps-experimental-wayland-support
[2]:apt:ppa-purge