10 Killer Tips To Speed Up Ubuntu Linux
======
**Brief** : Some practical **tips to speed up Ubuntu** Linux. Tips here are valid for most versions of Ubuntu and can also be applied in Linux Mint and other Ubuntu based distributions.

You might have experienced that after using Ubuntu for some time, the system starts running slow. In this article, we shall see several tweaks and **tips to make Ubuntu run faster**.

Before we see how to improve overall system performance in Ubuntu, first let’s ponder on why the system gets slower over time. There could be several reasons for it. You may have a humble computer with basic configuration. You might have installed several applications which are eating up resources at boot time. Endless reasons in fact.

Here I have listed several small tweaks that will help you speed up Ubuntu a little. There are some best practices as well which you can employ to get a smoother and improved system performance. You can choose to follow all or some of it. All of them adds up a little to give you a smoother, quicker and faster Ubuntu.

### Tips to make Ubuntu faster:

![Tips to speed up Ubuntu][1]

I have used these tweaks with an older version of Ubuntu but I believe that the same can be used in other Ubuntu versions as well as other Linux distributions which are based on Ubuntu such as Linux Mint, Elementary OS Luna etc.

#### 1\. Reduce the default grub load time:

The grub gives you 10 seconds to change between dual boot OS or to go in recovery etc. To me, it’s too much. It also means you will have to sit beside your computer and press the enter key to boot into Ubuntu as soon as possible. A little time taking, ain’t it? The first trick would be to change this boot time. If you are more comfortable with a GUI tool, read this article to [change grub time and boot order with Grub Customizer][2].

For the rest of us, you can simply use the following command to open grub configuration:
```
sudo gedit /etc/default/grub &

```

And change **GRUB_TIMEOUT=10** to **GRUB_TIMEOUT=2**. This will change the boot time to 2 seconds. Prefer not to put 0 here as you will lose the privilege to change between OS and recovery options. Once you have changed the grub configuration, use the following command to make the change count:
```
sudo update-grub

```

#### 2\. Manage startup applications:

Over the time you tend to start installing applications. If you are a regular It’s FOSS reader, you might have installed many apps from [App of the week][3] series.

Some of these apps are started at each startup and of course resources will be busy in running these applications. Result: a slow computer for a significant time duration at each boot. Go in Unity Dash and look for **Startup Applications** :

![](https://itsfoss.com/wp-content/uploads/2014/01/Startup_Applications_Ubuntu.jpeg)
In here, look at what applications are loaded at startup. Now think if there are any applications which you don’t require to be started up every time you boot in to Ubuntu. Feel free to remove them:

![](https://itsfoss.com/wp-content/uploads/2014/01/Startup_applications_ubuntu_1310.jpeg)
But what if you don’t want to remove the applications from startup? For example, if you installed one of the [best indicator applets for Ubuntu][4], you will want them to be started automatically at each boot.

What you can do here is to delay some the start of some of the programs. This way you will free up the resource at boot time and your applications will be started automatically, after some time. In the previous picture click on Edit and change the run command with a sleep option.

For example, if you want to delay the running of Dropbox indicator for let’s say 20 seconds, you just need to **add a command** like this in the existing command:
```
sleep 10;

```

So, the command ‘ **dropbox start -i** ‘ changes to ‘ **sleep 20; drobox start -i** ‘. Which means that now Dropbox will start with a 20 seconds delay. You can change the start time of another start up applications in the similar fashion.

![](https://itsfoss.com/wp-content/uploads/2014/01/Edit_startup_applications_Ubuntu.jpeg)

#### 3\. Install preload to speed up application load time:

Preload is a daemon that runs in the background and analyzes user behavior and frequently run applications. Open a terminal and use the following command to install preload:
```
sudo apt-get install preload

```

After installing it, restart your computer and forget about it. It will be working in the background. [Read more about preload.][5]

#### 4\. Choose the best mirror for software updates:

It’s good to verify that you are using the best mirror to update the software. Ubuntu software repository are mirrored across the globe and it is quite advisable to use the one which is nearest to you. This will result in a quicker system update as it reduces the time to get the packages from the server.

In **Software & Updates->Ubuntu Software tab->Download From** choose **Other** and thereafter click on **Select Best Server** :

![](https://itsfoss.com/wp-content/uploads/2014/01/Ubuntu_software_Center_Mirror.jpeg)
It will run a test and tell you which is the best mirror for you. Normally, the best mirror is already set but as I said, no harm in verifying it. Also, this may result in some delay in getting the updates if the nearest mirror where the repository is cached is not updated frequently. This is useful for people with a relatively slower internet connection. You can also these tips to [speed up wifi speed in Ubuntu][6].

#### 5\. Use apt-fast instead of apt-get for a speedy update:

apt-fast is a shell script wrapper for “apt-get” that improves updated and package download speed by downloading packages from multiple connections simultaneously. If you frequently use terminal and apt-get to install and update the packages, you may want to give apt-fast a try. Install apt-fast via official PPA using the following commands:
```
sudo add-apt-repository ppa:apt-fast/stable
sudo apt-get update
sudo apt-get install apt-fast

```

#### 6\. Remove language related ign from apt-get update:

Have you ever noticed the output of sudo apt-get update? There are three kinds of lines in it, **hit** , **ign** and **get**. You can read their meaning [here][7]. If you look at IGN lines, you will find that most of them are related to language translation. If you use all the applications, packages in English, there is absolutely no need for a translation of package database from English to English.

If you suppress this language related updates from apt-get, it will slightly increase the apt-get update speed. To do that, open the following file:
```
sudo gedit /etc/apt/apt.conf.d/00aptitude

```

And add the following line at the end of this file:
```
Acquire::Languages "none";

```
[![speed up apt get update in Ubuntu][8]][9]

#### 7\. Reduce overheating:

Overheating is a common problem in computers these days. An overheated computer runs quite slow. It takes ages to open a program when your CPU fan is running like [Usain Bolt][10]. There are two tools which you can use to reduce overheating and thus get a better system performance in Ubuntu, TLP and CPUFREQ.

To install and use TLP, use the following commands in a terminal:
```
sudo add-apt-repository ppa:linrunner/tlp
sudo apt-get update
sudo apt-get install tlp tlp-rdw
sudo tlp start

```

You don’t need to do anything after installing TLP. It works in the background.

To install CPUFREQ indicator use the following command:
```
sudo apt-get install indicator-cpufreq

```

Restart your computer and use the **Powersave** mode in it:

![](https://itsfoss.com/wp-content/uploads/2013/11/CPUFREQ-indicator.jpeg)

#### 8\. Tweak LibreOffice to make it faster:

If you are a frequent user of office product, then you may want to tweak the default LibreOffice a bit to make it faster. You will be tweaking memory option here. Open LibreOffice and go to **Tools- >Options**. In there, choose **Memory** from the left sidebar and enable **Systray Quickstarter** along with increasing memory allocation.

![](https://itsfoss.com/wp-content/uploads/2013/08/LibreOffice_Memory_option_1.jpeg)
You can read more about [how to speed up LibreOffice][11] in detail.

#### 9\. Use a lightweight desktop environment (if you can)

If you chose to install the default Unity of GNOME desktop environment, you may choose to opt for a lightweight desktop environment like [Xfce][12] or [LXDE][13].

These desktop environments use less RAM and consume less CPU. They also come with their own set of lightweight applications that further helps in running Ubuntu faster. You can refer to this detailed guide to learn [how to install Xfce on Ubuntu][14].

Of course, the desktop might not look as modern as Unity or GNOME. That’s a compromise you have to make.

#### 10\. Use lighter alternatives for different applications:

This is more of a suggestion and liking. Some of the default or popular applications are resource heavy and may not be suitable for a low-end computer. What you can do is to use some alternates to these applications. For example, use [AppGrid][15] instead of Ubuntu Software Center. Use [Gdebi][16] to install packages. Use AbiWord instead of LibreOffice Writer etc.

That concludes the collection of tips to make Ubuntu 14.04, 16.04 and other versions faster. I am sure these tips would provide overall a better system performance.

Do you have some tricks up your sleeves as well to **speed up Ubuntu**? Did these tips help you as well? Do share your views. Questions, suggestions are always welcomed. Feel free to drop to the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/speed-up-ubuntu-1310/

作者：[Abhishek Prakash][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[1]:https://itsfoss.com/wp-content/uploads/2017/07/speed-up-ubuntu-featured-800x450.jpeg
[2]:https://itsfoss.com/windows-default-os-dual-boot-ubuntu-1304-easy/ (Make Windows Default OS In Dual Boot With Ubuntu 13.04: The Easy Way)
[3]:https://itsfoss.com/tag/app-of-the-week/
[4]:https://itsfoss.com/best-indicator-applets-ubuntu/ (7 Best Indicator Applets For Ubuntu 13.10)
[5]:https://itsfoss.com/improve-application-startup-speed-with-preload-in-ubuntu/ (Improve Application Startup Speed With Preload in Ubuntu)
[6]:https://itsfoss.com/speed-up-slow-wifi-connection-ubuntu/ (Speed Up Slow WiFi Connection In Ubuntu 13.04)
[7]:http://ubuntuforums.org/showthread.php?t=231300
[8]:https://itsfoss.com/wp-content/uploads/2014/01/ign_language-apt_get_update-e1510129903529.jpeg
[9]:https://itsfoss.com/wp-content/uploads/2014/01/ign_language-apt_get_update.jpeg
[10]:http://en.wikipedia.org/wiki/Usain_Bolt
[11]:https://itsfoss.com/speed-libre-office-simple-trick/ (Speed Up LibreOffice With This Simple Trick)
[12]:https://xfce.org/
[13]:https://lxde.org/
[14]:https://itsfoss.com/install-xfce-desktop-xubuntu/
[15]:https://itsfoss.com/app-grid-lighter-alternative-ubuntu-software-center/ (App Grid: Lighter Alternative Of Ubuntu Software Center)
[16]:https://itsfoss.com/install-deb-files-easily-and-quickly-in-ubuntu-12-10-quick-tip/ (Install .deb Files Easily And Quickly In Ubuntu 12.10 [Quick Tip])
