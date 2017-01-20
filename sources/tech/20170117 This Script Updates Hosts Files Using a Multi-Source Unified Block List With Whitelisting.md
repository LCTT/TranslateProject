This Script Updates Hosts Files Using a Multi-Source Unified Block List With Whitelisting
============================================================

 ![](https://irp-cdn.multiscreensite.com/58a25abc/dms3rep/multi/desktop/host-400x300.jpg) 

There are many helpful lists maintained online with constantly-updated hosts files that contain the domains of various Internet crap peddlers. Copying these lists into your hosts file can easily block a large number of domains that your system would be better off unable to connect to. This method works without installing a browser plug-in and will handle blocking for any browser (and any other program) on the system.

In this tutorial, I'll show you how to get Steven Black's [Unified Hosts script][1] up and running in Linux. The script will keep your computer's hosts file updated (from multiple sources) with the latest known ad servers, phishing sites and other web scum, all while providing a nice, clean way to manage your own black/whitelists separately from the lists the script manages.

There are two caveats to note before putting 30,000 domains into your hosts file. First off, these huge lists contain servers that you might need unblocked in order to make an online purchase or for some other temporary situation. You'll know you have a problem when something on the web is broken since you messed with your hosts file. To remedy this, I'm going to show you how to make a handy on/off switch so you can quickly disable your blocklist to buy that Himalayan salt lamp (it's the ions). I still consider it a feature of these lists that all manner of things get blocked (it was only annoying until I thought of making that off switch). If you have a repeat problem with a blocked server that you need often, just add it to your whitelist file and you're all set.

The second problem is a slight performance hit because the system has to check the entire list each time a domain is called up. Maybe there's a small hit, but not big enough for me to ditch the list and let every connection through. However, consider yourself warned.

Hosts files block a server by directing requests to that server to either 127.0.0.1 or 0.0.0.0 - in other words, nowhere. Some say using zero's is a faster, less problematic way to accomplish the blocking. You can configure the script to use any blocking ip you want by executing it with the --ip option like "--ip nnn.nnn.nnn.nnn", but the default is 0.0.0.0 and that's where I'm leaving it.

I used to do what Steven's script does by hand every once in a while, going to each site, copy/pasting their lists into my hosts file, doing a find-replace to change the one-twenty-seven's to zeros, etc. I knew the whole thing could be automated and there were tons of dupes, but I never took the time to address the problems. Since finding this script, that's now a forgotten chore.

Let's start by getting a fresh copy of Mr. Black's code downloaded (~150MB) so we can push some electrons around. You'll need git installed, so if it's not, go to the terminal and enter:

**sudo apt-get install git** 

After it's done installing, enter:

**mkdir unifiedhosts** 
**cd unifiedhosts** 
**git clone** [**https://github.com/StevenBlack/hosts.git** ][2]
**cd hosts** 

While your cursor blinks at Steven's script, let's talk about choices. The script has a few options and extensions that I wont cover here, but I figure if you got this far and you're interested, the [readme.md][3] file can tell you all you need to know.

You need python installed to run the script, and which version you have matters. To find the version of Python you have, enter:

**python --version** 

If you don't have python installed:

**sudo apt-get install python** 

For Python 2.7, execute the script by entering "python" as I do below. For Python 3, replace "python" in the command with "python3". Upon execution, the script makes sure it has the most recent version of each list and if not, grabs a new copy. It then writes a new hosts file, including anything in your black/whitelists. Let's give it a try using the -r option to replace our active hosts file and the -a option so the script wont ask any questions. Back to the terminal, and:

**python updateHostsFile.py -r -a** 

The command will ask for your password so it can write to /etc/. For the newly updated list to be active, some systems require a good flush of the DNS cache. On the same hardware, I've observed different operating systems express very different behavior regarding the length of time it takes for a server to become reachable/unreachable after updating the hosts file without a flush. I've seen everything from instantaneously (Slackware) to never/reboot (Windows). There are commands to flush the DNS cache, but they're different on each OS and even each distro, so just reboot if the changes don't take.

Now it's as simple as adding your personal exceptions to the black/whitelist files and running the script whenever you want to update the hosts file. The script will adjust the resultant hosts file according to your specs, appending the file with your additions automatically each time you run it.

Finally, let's create the on/off switches. We need a script for each function, so go back to the terminal to create the OFF switch by entering (replacing leafpad with your text editor):

**leafpad hosts-off.sh** 

and enter the following into the new file:

**#!/bin/sh** 
**sudo mv /etc/hosts /etc/hostsDISABLED** 

And then make it executable with:

**chmod +x hosts-off.sh** 

Similarly, for the ON switch:

**leafpad hosts-on.sh
**
and enter the following into the new file:

**#!/bin/sh** 
**sudo mv /etc/hostsDISABLED /etc/hosts
**
And finally make it executable with:

**chmod +x hosts-on.sh

**All you need to do is create a shortcut somewhere for each script, labeling them HOSTS-ON and HOSTS-OFF and there you have it.

--------------------------------------------------------------------------------

via: https://www.darrentoback.com/this-script-updates-hosts-files-using-a-multi-source-unified-block-list-with-whitelisting

作者：[dmt][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.darrentoback.com/about-me
[1]:https://github.com/StevenBlack/hosts
[2]:https://github.com/StevenBlack/hosts.git
[3]:https://github.com/StevenBlack/hosts/blob/master/readme.md
