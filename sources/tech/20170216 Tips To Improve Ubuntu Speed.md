ucasFL translating
# [Tips To Improve Ubuntu Speed][4]


[
 ![Tips To Improve Ubuntu Speed](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/tips-to-improve-ubuntu-speed_orig.jpg)
][2]Chances are that your Ubuntu desktop will run so smooth. You will wonder why you did not switch from those other slow loading desktop operating systems (looking at you Windows). Ubuntu runs smoothly on most modern machines and older machines using variants such as Lubuntu, Xubuntu and [Ubuntu MATE][6] are going to be impressive as well. Very few times, your experience can get poorer on your Ubuntu desktop. On the off chance that your Ubuntu PC is not running as smoothly as you would like, there are a few things you could do to improve your system performance and response.​But why is my computer running slow in the first place? Let me enumerate a few

1.  Computer is getting old
2.  You have too many application installed
3.  Something is broken in your system
4.  Many more…..

Now let us take a look at a few of this hacks.

### 1\. Swappiness

If you have a system with a Swap partition, this is for you (NOTE: Swap partitions are not recommended for Solid State Drives as they reduce the lifespan of the drive). Swap partitions aid systems especially ones with low RAM installed to manage your system memory. Writing data to Swap (hard disk) is slower compared to RAM, so you can reduce the swappiness value to limit how often data is written to your Swap partition. By default, Ubuntu’s swappiness is set to 60 percent so you can reduce to say 10 percent with the following command.
sudo bash -c "echo 'vm.swappiness = 10' >> /etc/sysctl.conf"

### 2\. Stop Indexing

Indexing aims to speed up search results, but on the other hand, can cause systems with old configuration. To stop indexing, enter the following command to remove the indexing tool.sudo apt-get purge apt-xapian-index

### 3\. Manage your startup applications

Startup applications can have a huge impact on the performance of your system. Some applications you install will add their startup entries to have them started at boot but you can remove some of these applications to improve your system performance. Open “Startup Applications” by typing searching in Unity launcher. Most of autostart entries will be hidden so enter the following command in terminal to make the visiblesudo sed -i "s/NoDisplay=true/NoDisplay=false/g" /etc/xdg/autostart/*.desktop[
 ![ubuntu startup application](http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-startup-application_orig.jpg)
][3]

### 4\. Try Preload

Preload is a daemon or a background service that monitors your application use on your system and the preloads the required binaries libraries ahead of time into memory so the applications start faster. Install preload with the following terminal command.sudo apt-get install preload

### 5\. Choose Lighter Applications

So what applications are you using on your Ubuntu desktop? Are there lighter alternatives available? If YES, then switch to them if they can meet your feature set. LibreOffice will give you the best office experience but an alternative like Abiword could very much improve your system performance.

### 6\. Switch to a lighter DE

Are you using Ubuntu with Unity or KDE? These desktop environments can be quite demanding on your system. Instead, you can switch to LxQt or XFCE by installing it along your current DE or switching to a different variant of Ubuntu like Lubuntu or Xubuntu for a more faster experienc.

### 7\. Clean out junk from your system

Ubuntu PCs do not get as slower with time as do Windows PC but they do get slower nonetheless. Cleaning unneeded files from your system can help improve your performance. Try the computer Janitor tool available with Ubuntu Tweak tool to clean up your system. There is also the Bleachbit tool available for cleaning your system.

### 8\. Try a clean Install

Sometimes, something might just be broken and cleaning out junk or most of the other options mentioned already might not help. Your only option therefore, is to backup your files and try a clean install.
Also read - [Bleachbit An Alternative To CCleaner][1]

### 9\. Upgrade your hardware

The last one on my list is upgrading your hardware. This might be possible on most situations, but if it is, it could very much improve your system performance. You could increase your installed RAM, switch from a traditional disk to a Solid State Drive or upgrade your processor especially if you’re running on a desktop PC.

### Conclusion

​I hope these simple tips will go a long way in having your Ubuntu desktop run at an **impressive speed**. Note you don’t need to do all these, just try out the ones that are applicable to your situation and find out how your system responds. Do you know any other way of improving your Ubuntu system’s performance? Share with us in the comments. |

--------------------------------------------------------------------------------

via: http://www.linuxandubuntu.com/home/tips-to-improve-ubuntu-speed

作者：[linuxandubuntu.com][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxandubuntu.com/home/tips-to-improve-ubuntu-speed
[1]:http://www.linuxandubuntu.com/home/bleachbit-an-alternative-to-ccleaner-on-linux
[2]:http://www.linuxandubuntu.com/home/tips-to-improve-ubuntu-speed
[3]:http://www.linuxandubuntu.com/uploads/2/1/1/5/21152474/ubuntu-startup-application_orig.jpg
[4]:http://www.linuxandubuntu.com/home/tips-to-improve-ubuntu-speed
[5]:http://www.linuxandubuntu.com/home/tips-to-improve-ubuntu-speed#comments
[6]:http://www.linuxandubuntu.com/home/linuxandubuntu-distro-review-of-the-week-ubuntu-mate-1610
