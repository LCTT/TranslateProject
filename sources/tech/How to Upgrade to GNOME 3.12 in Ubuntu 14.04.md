translating by icybreaker
How to Upgrade to GNOME 3.12 in Ubuntu 14.04
================================================================================
![You can upgrade to GNOME 3.12 – but it’s not advised](http://www.omgubuntu.co.uk/wp-content/uploads/2014/03/Screen-Shot-2014-03-26-at-21.53.58-350x200.png)

**If you’ve recently installed or upgraded to Ubuntu GNOME 14.04 LTS then you will no doubt be enjoying a stable, dependable GNOME Shell experience.**

But I suspect that the more nerdcore users among you would rather trade in the stability that’s offered up by default for a newer, badder, and potentially much buggier experience. You want to know how to upgrade to GNOME 3.12 in Ubuntu 14.04?

### Well, I’m here to show you how. First though, I n ###

GNOME 3.12 was released in late March to much fanfare and some fantastic reviews. But despite going ‘stable’ before Ubuntu 14.04 LTS, released last month, it is not available to install from the Ubuntu 14.04 repositories — why?

Simply put it came too late in the development cycle to give enough time to thoroughly vet, test and ensure it was up to the standards an LTS release commands, and its users expect.  Defaulting to the older 3.10 release makes sense as it benefits from having an extra cycle of thorough testing under its belt.

It’s for this reason that **upgrading to GNOME 3.12 is not recommended**.  

Understood? Great, let’s move on to the fun stuff.

### How to Upgrade to GNOME 3.12 in Ubuntu 14.04 ###

#### Make sure you’re running 3.10 ####

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/05/gr.jpg)

To follow this guide correctly you need to be running the latest release of Ubuntu (14.04 LTS) or Ubuntu GNOME. If not, stop now; you must upgrade before you continue. If you don’t you can expect a whole world of hassle to follow.

If you’re running the regular version of Ubuntu (i.e., the one with Unity) then you should go ahead and grab GNOME 3.10 from the Ubuntu Software Centre before proceeding.

Click the button below to prompt installation.

- [Install GNOME 3.10 in Ubuntu 14.04 LTS][1]

#### Add the GNOME 3.12 PPA ####

It was originally expected that GNOME 3.12 would be made available through the standard GNOME Team PPA following the release of Trusty. Three weeks hence, that hasn’t happened. As of writing it contains a handful of minor 3.10 packages and not anything related to the newest release.

However, the [GNOME Team Staging PPA][2] does contain all of the various 3.12 packages one needs to upgrade. Adding this archive should, the developers behind it say, result in a desktop that ‘runs smoothly’ but that packages included within have not been deemed ‘ready for general use’.

Providing you’re a dab hand with the PPA Purge tool you should be okay to continue. First, let’s check for and install any outstanding distribution updates:

    sudo apt-get update && sudo apt-get dist-upgrade

Install any packages waiting by hitting the enter key.

Once complete, or if you have no pending updates at all, you can add the GNOME 3 Team Staging PPA. To do this, open a new Terminal window and enter the following commands:

    sudo add-apt-repository ppa:gnome3-team/gnome3-staging

    sudo apt-get update && sudo apt-get dist-upgrade

You’ll be prompted to enter your password before the upgrade process can begin. Pay attention to any notices or alerts given. If all is acceptable agree to the installation by hitting the ‘y’ key.

#### Extras ####

For a true GNOME experience you may wish to grab some of the new GNOME applications, such as the [Polari IRC client, GNOME Maps and the GNOME Web browser][3]. To install these three in particular run the following command:

    sudo apt-get install epiphany-browser gnome-maps polari -y

After everything has finished doing what it needs to, you’re safe to reboot!

    sudo apt-get install epiphany-browser gnome-maps polari -y

After everything has finished doing what it needs to, you’re safe to reboot!

### After Care ###

#### Logging In ####

If you’re coming from Unity, Xfce or another desktop environment don’t forget to select the GNOME session from the login screen before logging in.

#### Drawbacks ####

![GNOME Weather & GNOME Maps in 3.12](http://www.omgubuntu.co.uk/wp-content/uploads/2014/04/gnome-aspps.jpg)

For me, in my lone experience, GNOME 3.12 on Ubuntu 14.04 runs pretty much fine. There do not appear to be any significant performance regressions after upgrading, though I do see the odd, infrequent visual glitch that occurs when opening the activities overlay, and the occasional disappearing drop shadow from under an app. But as bugs go these are hardly deal breakers.

Performance seems to be on par with GNOME 3.10; applications open with just as much pep and there are no noticeable drops in interactivity.

I was marginally disappointed to find that the all new GNOME Videos application has not been packaged up in this PPA. One suspects there are reasons for this (likely requiring a newer version of streamer). I also noticed that several GNOME extensions refused to work after upgrading, something else to bear in mind.

With the lack of testing this has received, bugs are pretty much guaranteed. If you want stability (or to keep Unity working and intact) stick with the thoroughly tested GNOME 3.10.

### Downgrade from GNOME 3.12 to 3.10 ###

But if you want shiny new features and access to the latest builds of GNOME apps then don’t be afraid to give the staging PPA a whirl. You can always ‘downgrade’ using PPA Purge if things go awry.

    sudo apt-get install ppa-purge

    sudo ppa-purge ppa:gnome3-team/gnome3-staging

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/05/upgrade-gnome-3-12-ubuntu-14-04

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:apt:gnome-shell
[2]:https://launchpad.net/~gnome3-team/+archive/gnome3-staging?field.series_filter=trusty
[3]:http://www.omgubuntu.co.uk/2014/03/top-12-features-gnome-3-12
