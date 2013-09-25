Nautilus Gksu Plugin – Add ‘Open As Administrator’ Option To Your Right Click Menu
================================================================================
For past few days, I was missing a right-click menu option (in nautilus file manager) to open a file/folder as administrator. Reason being, for every operation that required root privileges, I had to go back to the command line terminal and use sudo. It’s not that I am not used to command line but still I wanted at least the availability of something equivalent to [sudo or su][1]). I searched around and found a nautilus plugin — **Nautilus-Gksu**.

**NOTE** – All the examples presented in this article have been tested on Ubuntu 13.04

**Nautilus-Gksu**

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-main.png)

**A Brief Tutorial**

Nautilus-Gksu plugin adds a useful option to the right-click menu — **Open as administrator**. This helps a great deal while working with files and folders in nautilus file manager.

For example, suppose you want to open root folder from nautilus file manager. Ideally a double-click open would fetch you an error like :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-1.png)

But with nautilus gksu plug-in installed, all you need to do is to right-click on the folder and select ‘Open as administrator’ option.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-2.png)

Once you click on this option, you will be prompted for a password.

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-3.png)

Just enter the password and do whatever you want.

**Download/Install**

As already mentioned, I use Ubuntu 13.04 for most of my articles these days and let me be honest that it was hard to install this plugin through recommended methods.

This means that the commands like :

    sudo apt-get install nautilus-gksu

were not working as I was getting the following error :

    Reading package lists... Done
    Building dependency tree   
    Reading state information... Done
    E: Unable to locate package nautilus-gksu

I googled the problem and found that I am not the only one facing this problem but many other Ubuntu 13.04  users are also facing a [similar kind of problem][2]. Anyway, I kept on looking for a solution, until I found a [pointer to the solution][3]. I read the complete post on [AskUbuntu][4] and tried the steps mentioned for Ubuntu 12.04.

Here is a snapshot of that post :

![](http://mylinuxbook.com/wp-content/uploads/2013/09/gksu-4.png)

After reading the post above, I followed the following steps :

- Downloaded the [64 bit package of the plugin][5]. [Mine is a 64 bit system]
- Extracted the downloaded .deb file.
- Executed the following command :

    sudo cp /home/himanshu/Downloads/nautilus-gksu_2.0.2-5ubuntu2_amd64/usr/lib/nautilus/extensions-2.0/libnautilus-gksu.so /usr/lib/nautilus/extensions-3.0/


After these 3 steps, the plug-in was installed successfully.

**Pros**

Lets you easily open any file or folder with root privileges on a right-click.

**Cons**

Installation on Ubuntu 13.04 is not easy

**Conclusion**

If you are work involves using Nautilus file manager for your daily file management then this plug-in is a must have for you. Though it is not easy to install on Ubuntu 13.04 but still its worth the effort.


via: http://mylinuxbook.com/nautilus-gksu/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[译者ID][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[译者ID]:http://linux.cn/space/译者ID
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://mylinuxbook.com/sudo-vs-su-in-ubuntu-linux/
[2]:http://askubuntu.com/questions/314267/how-can-i-install-nautilus-gksu
[3]:http://s5407.socode.info/question/5152c20be8432c04268cee15
[4]:http://askubuntu.com/questions/78116/where-is-the-open-as-administrator-option-in-nautilus-gone
[5]:http://ubuntu.mirror.cambrium.nl/ubuntu//pool/main/g/gksu/nautilus-gksu_2.0.2-5ubuntu2_amd64.deb