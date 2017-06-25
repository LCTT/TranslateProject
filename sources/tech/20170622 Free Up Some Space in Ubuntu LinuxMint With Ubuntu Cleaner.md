translating by chenxinlong  

Free Up Some Space in Ubuntu/LinuxMint With Ubuntu Cleaner (Fork of Janitor Module)
============================================================


Most of us very often forget to remove junk files in Linux system which will make the system to run out of space.

We have to follow few stand procedure to free up space (remove distribution cache, system logs, app cache & trash) in Linux distribution, if we are doing the same procedure in manual way it would take hell lots of time and very difficult too.

In Linux verity of applications is available to make this task much easier. Today we are going to teach you about Ubuntu Cleaner which is forked from Janitor module (It’s one of the module in Ubuntu tweak).

[Ubuntu Cleaner][2] is a tool that makes it easy to clean your Ubuntu system. As we already knows Ubuntu Tweak is one of the best utility which help us to tweak Ubuntu and its derivatives. It’s got deprecated as his main developer did not have time to maintain it.

Suggested Read : [Stacer – Linux System Optimizer and Monitoring Tool][3]

Suggested Read : [BleachBit – A Quick And Best Way to Clean Up Your System In Linux][4]

So the developer of Ubuntu Cleaner forked the janitor module from Ubuntu tweak utility and bring back that useful functionality to the Ubuntu community with new name called Ubuntu cleaner since many users using Ubuntu tweak utility in latest version too (as they don’t want to leave the utility). It’s one of the most popular utility on Ubuntu many years.

Suggested Read : [uCareSystem – All-In-One System Update And Maintenance Tool For Ubuntu/LinuxMint][5]

I guess whoever missing Ubuntu tweak they may feel happy by using the Ubuntu cleaner since its forked from janitor module.

Ubuntu Cleaner will remove the following junk files in Ubuntu and its derivatives:

*   App caches (Browser caches)

*   Thumbnail cache

*   Apt cache

*   Old kernels

*   Package config files

*   Unneeded packages

#### How to install Ubuntu Cleaner

We can easily install Ubuntu Cleaner to Ubuntu and its derivatives through PPA since the developer offering official PPA. Ubuntu Cleaner currently support Ubuntu 14.04 LTS and Ubuntu 16.04 LTS.

```
$ sudo add-apt-repository ppa:gerardpuig/ppa
$ sudo apt update
$ sudo apt install ubuntu-cleaner
```

#### How to use Ubuntu Cleaner

Launch an Ubuntu cleaner from main menu, you will get the default interface look like below.
 [![](http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_001.png)][6] 

Tick the `check box` in front of the file which you want to clean up. Finally hit `Clean` button to remove the junk files from system.
 [![](http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_002.png)][7] 

Yes, we have successfully cleaned our system now.
 [![](http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_003.png)][8]

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/ubuntu-cleaner-system-cleaner-ubuntu-tweak-alternative-janitor/#

作者：[2DAYGEEK  ][a]
译者：[chenxinlong](https://github.com/chenxinlong)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/author/2daygeek/
[2]:http://ubuntu-cleaner.blogspot.in/
[3]:http://www.2daygeek.com/stacer-linux-system-optimizer-and-monitoring-tool/
[4]:http://www.2daygeek.com/bleachbit-system-cleaner-on-ubuntu-debian-fedora-opensuse-arch-linux-mint/
[5]:http://www.2daygeek.com/ucaresystem-system-update-and-maintenance-tool-for-ubuntu-linuxmint/
[6]:http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_001.png
[7]:http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_002.png
[8]:http://www.2daygeek.com/wp-content/uploads/2017/06/Ubuntu-Cleaner_003.png
