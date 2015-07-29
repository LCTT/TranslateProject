translation by strugglingyouth
Tips to Create ISO from CD, Watch User Activity and Check Memory Usages of Browser
================================================================================
Here again, I have written another post on [Linux Tips and Tricks][1] series. Since beginning the objective of this post is to make you aware of those small tips and hacks that lets you manage your system/server efficiently.

![Create Cdrom ISO Image and Monitor Users in Linux](http://www.tecmint.com/wp-content/uploads/2015/07/creating-cdrom-iso-watch-users-in-linux.jpg)

Create Cdrom ISO Image and Monitor Users in Linux

In this post we will see how to create ISO image from the contents of CD/DVD loaded in the drive, Open random man pages for learning, know details of other logged-in users and what they are doing and monitoring the memory usages of a browser, and all these using native tools/commands without any third-party application/utility. Here we go…

### Create ISO image from a CD ###

Often we need to backup/copy the content of CD/DVD. If you are on Linux platform you do not need any additional software. All you need is the access to Linux console.

To create ISO image of the files in your CD/DVD ROM, you need two things. The first thing is you need to find the name of your CD/DVD drive. To find the name of your CD/DVD drive, you may choose any of the below three methods.

**1. Run command lsblk (list block devices) from your terminal/console.**

    $ lsblk

![Find Block Devices in Linux](http://www.tecmint.com/wp-content/uploads/2015/07/Find-Block-Devices.png)

Find Block Devices

**2. To see information about CD-ROM, you may use commands like less or more.**

    $ less /proc/sys/dev/cdrom/info

![Check Cdrom Information](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Cdrom-Inforamtion.png)

Check Cdrom Information

**3. You may get the same information from [dmesg command][2] and customize the output using egrep.**

The command ‘dmesg‘ print/control the kernel buffer ring. ‘egrep‘ command is used to print lines that matches a pattern. Option -i and –color with egrep is used to ignore case sensitive search and highlight the matching string respectively.

    $ dmesg | egrep -i --color 'cdrom|dvd|cd/rw|writer'

![Find Device Information](http://www.tecmint.com/wp-content/uploads/2015/07/Find-Device-Information.png)

Find Device Information

Once you know the name of your CD/DVD, you can use following command to create a ISO image of your cdrom in Linux.

    $ cat /dev/sr0 > /path/to/output/folder/iso_name.iso

Here ‘sr0‘ is the name of my CD/DVD drive. You should replace this with the name of your CD/DVD. This will help you in creating ISO image and backup contents of CD/DVD without any third-party application.

![Create ISO Image of CDROM in Linux](http://www.tecmint.com/wp-content/uploads/2015/07/Create-ISO-Image-of-CDROM.png)

Create ISO Image of CDROM

### Open a man page randomly for Reading ###

If you are new to Linux and want to learn commands and switches, this tweak is for you. Put the below line of code at the end of your `~/.bashrc` file.

    /use/bin/man $(ls /bin | shuf | head -1)

Remember to put the above one line script in users’s `.bashrc` file and not in the .bashrc file of root. So when the next you login either locally or remotely using SSH you will see a man page randomly opened for you to read. For the newbies who want to learn commands and command-line switches, this will prove helpful.

Here is what I got in my terminal after logging in to session for two times back-to-back.

![LoadKeys Man Pages](http://www.tecmint.com/wp-content/uploads/2015/07/LoadKeys-Man-Pages.png)

LoadKeys Man Pages

![Zgrep Man Pages](http://www.tecmint.com/wp-content/uploads/2015/07/Zgrep-Man-Pages.png)

Zgrep Man Pages

### Check Activity of Logged-in Users ###

Know what other users are doing on your shared server.

In most general case, either you are a user of Shared Linux Server or the Admin. If you are concerned about your server and want to check what other users are doing, you may try command ‘w‘.

This command lets you know if someone is executing any malicious code or tampering the server, slowing it down or anything else. ‘w‘ is the preferred way of keeping an eye on logged on users and what they are doing.

To see logged on users and what they re doing, run command ‘w’ from terminal, preferably as root.

    # w

![Check Linux User Activity](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Linux-User-Activity.png)

Check Linux User Activity

### Check Memory usages by Browser ###

These days a lot of jokes are cracked on Google-chrome and its demand of memory. If you want to know the memory usages of a browser, you can list the name of the process, its PID and Memory usages of it. To check memory usages of a browser, just enter the “about:memory” in the address bar without quotes.

I have tested it on Google-Chrome and Mozilla Firefox web browser. If you can check it on any other browser and it works well you may acknowledge us in the comments below. Also you may kill the browser process simply as if you have done for any Linux terminal process/service.

In Google Chrome, type `about:memory` in address bar, you should get something similar to below image.

![Check Chrome Memory Usage](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Chrome-Memory-Usage.png)

Check Chrome Memory Usage

In Mozilla Firefox, type `about:memory` in address bar, you should get something similar to below image.

![Check Firefox Memory Usage](http://www.tecmint.com/wp-content/uploads/2015/07/Check-Firefox-Memory-Usage.png)

Check Firefox Memory Usage

Out of these options you may select any of them, if you understand what it is. To check memory usages, click the left most option ‘Measure‘.

![Firefox Main Process](http://www.tecmint.com/wp-content/uploads/2015/07/Firefox-Main-Processes.png)

Firefox Main Process

It shows tree like process-memory usages by browser.

That’s all for now. Hope all the above tips will help you at some point of time. If you have one (or more) tips/tricks that will help Linux Users to manage their Linux System/Server more efficiently ans is lesser known, you may like to share it with us.

I’ll be here with another post soon, till then stay tuned and connected to TecMint. Provide us with your valuable feedback in the comments below. Like and share us and help us get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/creating-cdrom-iso-image-watch-user-activity-in-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/tag/linux-tricks/
[2]:http://www.tecmint.com/dmesg-commands/
