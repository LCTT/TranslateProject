9 Killer Tips To Speed Up Ubuntu 13.10
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/01/Speed_Up_Ubuntu_1310.jpg)

Whether you have a fresh install of Ubuntu 13.10 or upgraded to it, you might have experienced that after using Ubuntu for some times, the system starts running slow. In this article we shall see several tweaks and **tips to make Ubuntu run faster**.

Before we see how to improve overall system performance in Ubuntu 13.10, first lets ponder on why the system gets slower overtime. There could be several reasons for it. You may have a humble computer with basic configuration. You might have installed several applications which are eating up resources at boot time. Endless reasons in fact.

Here I have listed several small tweaks that will help you speed up Ubuntu a little. There are some best practices as well which you can employ to get a smoother and improved system performance. You can choose to follow all or some of it. All of them adds up a little to give you a smoother, quicker and faster Ubuntu.

### Tips to make Ubuntu 13.10 run faster: ###

I have used these tweaks with Ubuntu 13.10 but I believe that the same can be used in older Ubuntu versions as well as other Linux distributions which are based on Ubuntu such as Linux Mint, Elementary OS Luna etc.

Reduce the default grub load time:

The grub gives you 10 seconds to change between dual boot OS or to go in recovery etc. To me, its too much. It also means you will have to sit beside your computer and press the enter key to boot in to Ubuntu as soon as possible. A little time taking, ain’t it? First trick would be to change this boot time. If you are more comfortable with a GUI tool, read this article to [change grub time and boot order with Grub Customizer][1].

For the rest of us, you can simply use the following command to open grub configuration:

    sudo gedit /etc/default/grub &

And change **GRUB_TIMEOUT=10** to **GRUB_TIMEOUT=2**. This will change the boot time to 2 seconds. Prefer not to put 0 here as you will lost the privilege to change between OS and recovery options. Once you have changed the grub configuration, use the following command to make the change count:

    sudo update-grub

### Manage the start up applications: ###

Overtime you tend to start installing applications. If you are a regular It’s FOSS reader, you might have installed many apps from [App of the week][2] series. Some of these apps are started at each start up and of course resources will be busy in running these applications. Result: a slow computer for a significant time duration at each boot. Go in Unity Dash and look for **Startup Applications**:

![](http://itsfoss.com/wp-content/uploads/2014/01/Startup_Applications_Ubuntu.jpeg)

In here, look at what applications are loaded at start up. Now think if you there are any applications which you don’t require to be started up every time you boot in to Ubuntu. Feel free to remove them:

![](http://itsfoss.com/wp-content/uploads/2014/01/Startup_applications_ubuntu_1310.jpeg)

But what if you don’t want to remove the applications from start up? For example if you installed one of the [best indicator applets for Ubuntu 13.10][3], you will want them to be started automatically at each boot. What you can do here is to delay some the start of some of the programs. This way you will free up the resource at boot time and your applications will be started automatically, after sometime. In the previous picture click on Edit and change the run command with a sleep option. For example if you want to delay the running of Dropbox indicator for lets say 20 seconds, you just need to **add a command** like this in the existing command:

    sleep 10;

So, the command ‘**dropbox start -i**‘ changes to ‘**sleep 20; drobox start -i**‘. Which means that now Drobox will start with a 20 seconds delay. You can change the start time of other start up applications in similar fashion.

![](http://itsfoss.com/wp-content/uploads/2014/01/Edit_startup_applications_Ubuntu.jpeg)

### Install preload to speed up application load time: ###

Preload is a daemon that runs in background and analyzes user behavior and frequently run applications. Open a terminal and use the following command to install preload:

    sudo apt-get install preload

After installing it, restart your computer and forget about it. It will be working in background. [[Read more about preload][4]]

### Choose the best mirror for software updates: ###

It’s good to verify that you are using the best mirror to update the software. Ubuntu software repository are mirrored across the globe and it is quite advisable to use the one which is nearest to you. This will result in a quicker system update as it reduces the time to get the packages from the server.

In **Software & Updates->Ubuntu Software tab->Download From** choose **Other** and there after click on **Select Best Server**:

![](http://itsfoss.com/wp-content/uploads/2014/01/Ubuntu_software_Center_Mirror.jpeg)

It will run a test and tell you which is the best mirror for you. Normally, the best mirror is already set but as I said, no harm in verifying it. Also, this may result in some delay in getting the updates if the nearest mirror where the repository is cached is not updated frequently. This is useful for people with relatively slower internet connection. You can also these tips to [speed up wifi speed in Ubuntu][5].

### Use apt-fast instead of apt-get for a speedy update: ###

apt-fast is a shellscript wrapper for “apt-get” that improves updated and package download speed by downloading packages from multiple connection simultaneously. If you frequently use terminal and apt-get to install and update the packages, you may want to give apt-fast a try. Install apt-fast via official PPA using the following commands:

    sudo add-apt-repository ppa:apt-fast/stable
    sudo apt-get update
    sudo apt-get install apt-fast

### Remove language related ign from apt-get update: ###

Have you ever noticed the output of sudo apt-get update? There are three kind of lines in it, **hit**, **ign** and **get**. You can read their meaning [here][6]. If you look at IGN lines, you will find that most of them are related to language translation. If you use all the applications, packages in English, there is absolutely no need of a translation of package database from English to English.

If you suppress this language related updates from apt-get, it will slightly increase the apt-get update speed. To do that, open the following file:

    sudo gedit /etc/apt/apt.conf.d/00aptitude

And add the following line at the end of this file:

    Acquire::Languages "none";

![](http://itsfoss.com/wp-content/uploads/2014/01/ign_language-apt_get_update.jpeg)

### Reduce overheating: ###

Overheating is a common problem in computers these days. An overheated computer runs quite slow. It takes ages to open a program when your CPU fan is running like Usain Bolt. There are two tools which you can use to reduce overheating and thus get a better system performance in Ubuntu 13.10, TLP and CPUFREQ.

To install and use TLP, use the following commands in a terminal:

    sudo add-apt-repository ppa:linrunner/tlp
    sudo apt-get update
    sudo apt-get install tlp tlp-rdw
    sudo tlp start

You don’t need to do anything after installing TLP. It works in background. To install CPUFREQ indicator use the following command:

    sudo apt-get install indicator-cpufreq

Restart your computer and use the **Powersave** mode in it:

![](http://itsfoss.com/wp-content/uploads/2013/11/CPUFREQ-indicator.jpeg)

### Tweak LibreOffice to make it faster: ###

If you are a frequent user of office product, then you may want to tweak the default LibreOffice a bit to make it faster. You will be tweaking memory option here. Open LibreOffice and go to **Tools->Options**. In there, choose **Memory** from left side bar and enable **Systray Quickstarter** along with increasing memory allocation.

![](http://itsfoss.com/wp-content/uploads/2013/08/LibreOffice_Memory_option_1.jpeg)

You can read more about [how to speed up LibreOffice][7] in detail.

### Use lighter alternatives of different applications: ###

 This is more of a suggestion and liking. Some of the default or popular applications are resource heavy and may not be suitable for a low end computer. What you can do is to use some alternates to these applications. For example, use [AppGrid][8] instead of Ubuntu Software Center. Use [Gdebi][9] to install packages. Use AbiWord instead of LibreOffice Writer etc.

That’s conclude the collection of tips to **make Ubuntu 13.10 faster**. I am sure these tips would provide overall a better system performance. Do you have some tricks up your sleeves as well to **speed up Ubuntu 13.10**? Did these tips helped you as well? Do share your views. Questions, suggestions are always welcomed. Feel free to drop to the comment section.


--------------------------------------------------------------------------------

via: http://itsfoss.com/speed-up-ubuntu-1310/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/windows-default-os-dual-boot-ubuntu-1304-easy/
[2]:http://itsfoss.com/tag/app-of-the-week/
[3]:http://itsfoss.com/7-best-indicator-applets-for-ubuntu-13-10/
[4]:http://itsfoss.com/improve-application-startup-speed-with-preload-in-ubuntu/
[5]:http://itsfoss.com/speed-up-slow-wifi-connection-ubuntu/
[6]:http://ubuntuforums.org/showthread.php?t=231300
[7]:http://itsfoss.com/speed-libre-office-simple-trick/
[8]:http://itsfoss.com/app-grid-lighter-alternative-ubuntu-software-center/
[9]:http://itsfoss.com/install-deb-files-easily-and-quickly-in-ubuntu-12-10-quick-tip/