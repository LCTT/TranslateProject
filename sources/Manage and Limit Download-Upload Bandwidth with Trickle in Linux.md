Translating--------------geekpi



Manage and Limit Download/Upload Bandwidth with Trickle in Linux
================================================================================
Have you ever encountered situations where one application dominated you all network bandwidth? If you have ever been in a situation where one application ate all your traffic, then you will value the role of the trickle bandwidth shaper application. Either you are a system admin or just a Linux user, you need to learn how to control the upload and download speeds for applications to make sure that your network bandwidth is not burned by a single application.

![](http://www.tecmint.com/wp-content/uploads/2013/11/Bandwidth-limit-trickle.png)

### What is Trickle? ###

**Trickle** is a bandwidth shaper tool which can be used to limit the bandwidth usage of programs such as **Firefox, FTP , SSH** and many other applications that make use of the network bandwidth. Do you want your **Youtube** music experience to interfere with the ftp download? If not, keep reading this article and learn how to install and use the trickle application in your machine.

### How to Install Trickle in Linux ###

The trickle tool has its own dependencies, you must have the “**libevent library**” before you can install and use trickle but since this library is installed by default in most modern Linux machines.

#### On Debian/Ubuntu/Linux Mint ####

Run **apt-get install** trickle will do the job in **Debian/Ubuntu/Mint** machines. Make sure the sources list is up to date, then install the application you want.

    $ sudo apt-get update
    $ sudo apt-get install trickle

#### On RHEL/CentOS/Fedora ####

First you need to update the system and then install trickle with the following command.

    # yum update
    # yum install trickle

### How Trickle Works? ###

Trickle controls and limits the **upload/download** speed of an application by controlling the amount of data written or read by a socket. It uses an alternative version of the the **BSD** socket API, but the difference is that trickle manages socket calls also.

Note that trickle uses dynamic linking and loading, so it can only work with applications that use the “Glibc library“. Since trickle is able to set up the delay of data transferred over a socket, it is clear that it can limit the network bandwidth of an application.

### What Can’t Trickle do? ###

Trickle can not be use to limit the network bandwidth of applications that work over **UDP** protocol, it can only work on **TCP** connections, but you have to know that it does not work with all **TCP** connections. If you have followed this article carefully until now, you can guess the reason why. Can you recall the fact that tickle can work with applications that use the **Glibc library**?

I have to mention that trickle will not work with statically linked executables.

### Determine Trickle to Run on a Specified Application Or Not ###

Since trickle can not limit the **upload/download** speed of every application, it is reasonable to use a method for finding out the applications that the trickle can work with.

The “**ldd**” utility will help us to find if a specific program uses the “**libc.so**” library or not. If the program uses this library, then you can use trickle to limit its network bandwidth usage.

The **ldd** command is used to print the shared libraries required by each program. If you are a curious **Linux Geek**, you can use the man command to find out more information about the **ldd** utility.

    # man ldd

**Filezilla** is a program which is used to transfer files through the ftp protocol, can trickle be used to limit its download or upload speed? At the time you are thinking about it, I will use the following command to find out if trickle can be used with filezilla program, or not.

    # ldd filezilla | grep libc.so

In my case, it produces the following output.

    oltjano@oltjano-X55CR:/usr/bin$ ldd filezilla | grep libc.so
    	libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xb6bc4000)

Since filezilla uses the “**libc.so**” library, trickle can be used to shape its network bandwidth. This method can be applied the same way for every program you are interested in.

### Learn How to Use Trickle ###

Print the **version** of the trickle tool with the following command.

    root@oltjano-X55CR:~# trickle -V
    trickle: version 1.07

Linux have many command-line utilities that make testing (experimenting) so fun and beautiful. The following command uses the [wget utility][1] to download the latest Pear OS image.

root@oltjano-X55CR:~# wget wget http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download

    --2013-11-20 11:56:32--  http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download
    Resolving sourceforge.net (sourceforge.net)... 216.34.181.60
    Connecting to sourceforge.net (sourceforge.net)|216.34.181.60|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://downloads.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso?r=&ts=1384928843&use_mirror=kaz [following]
    --2013-11-20 11:56:33--  http://downloads.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso?r=&ts=1384928843&use_mirror=kaz
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://kaz.dl.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso [following]
    --2013-11-20 11:56:33--  http://kaz.dl.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso
    Resolving kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)... 88.204.157.163
    Connecting to kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)|88.204.157.163|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1093664768 (1.0G) [application/octet-stream]
    Saving to: ‘download’
    
    0% [                                                                                                    ] 30,78,278    381KB/s  eta 1h 50m

As you can see from above output, the download speed is about **381 KB/s**. I want to limit the download speed to **13 K/s** so I can use my bandwidth for other stuff. The following command is used to limit the speed of the Wget utility to **13 K/s**.

    root@oltjano-X55CR:~# trickle -d 13 wget http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download 
    
    ravisaive@ravisaive-OptiPlex-380:~$ trickle -d 13 wget http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download

    --2013-11-20 12:01:19--  http://sourceforge.net/projects/pearoslinux/files/Pear%20OS%208/pearos8-i386.iso/download
    Resolving sourceforge.net (sourceforge.net)... 216.34.181.60
    Connecting to sourceforge.net (sourceforge.net)|216.34.181.60|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://downloads.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso?r=&ts=1384929129&use_mirror=kaz [following]
    --2013-11-20 12:01:19--  http://downloads.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso?r=&ts=1384929129&use_mirror=kaz
    Resolving downloads.sourceforge.net (downloads.sourceforge.net)... 216.34.181.59
    Connecting to downloads.sourceforge.net (downloads.sourceforge.net)|216.34.181.59|:80... connected.
    HTTP request sent, awaiting response... 302 Found
    Location: http://kaz.dl.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso [following]
    --2013-11-20 12:01:20--  http://kaz.dl.sourceforge.net/project/pearoslinux/Pear%20OS%208/pearos8-i386.iso
    Resolving kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)... 88.204.157.163
    Connecting to kaz.dl.sourceforge.net (kaz.dl.sourceforge.net)|88.204.157.163|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: 1093664768 (1.0G) [application/octet-stream]
    Saving to: ‘download.1’
    
    0% [                                                                                                   ] 2,01,550    13.1KB/s  eta 21h 5m

As you can see from above output, the downloading speed is limited to **13K/s**. The download will take **21h** and **5m**. The “**-d**” option in the above command means download, you can also combine the “**-d**” option with the upload option (**-u**) like shown in the following command.

    # trickle -u 100 -d 50 ftp

The above command is used to limit the upload speed to **100K/s** and download speed to **50K/s** of a **ftp client**. You can also limit the bandwidth for all commands running in a single shell with the following command.

    trickle -d 130 -u 13 bash

Every command-line utility offers help to the user, use the “-h” option with the trickle command to find more information about the trickle tool usage.

root@oltjano-X55CR:/usr/bin# trickle -h

    Usage: trickle [-hvVs] [-d <rate>] [-u <rate>] [-w <length>] [-t <seconds>]
                   [-l <length>] [-n <path>] command ...
    	-h Help (this)
    	-v Increase verbosity level
    	-V Print trickle version
    	-s Run trickle in standalone mode independent of trickled
    	-d <rate>    Set maximum cumulative download rate to <rate> KB/s
    	-u <rate>    Set maximum cumulative upload rate to <rate> KB/s
    	-w <length>  Set window length to <length> KB 
    	-t <seconds> Set default smoothing time to <seconds> s
    	-l <length>  Set default smoothing length to <length> KB
    	-n <path>    Use trickled socket name <path>
    	-L <ms>      Set latency to <ms> milliseconds
    	-P <path>    Preload the specified .so instead of the default one

### Conclusion ###

This article taught how to install trickle tool in your Linux machine and how to do some simple things with it. It does no matter if you work for a large corporate or just for yourself, the trickle tool is a must for an advanced Linux user.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/manage-and-limit-downloadupload-bandwidth-with-trickle-in-linux/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.tecmint.com/10-wget-command-examples-in-linux/