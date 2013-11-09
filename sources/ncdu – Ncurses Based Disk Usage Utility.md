translating by Linux-pdz
ncdu – Ncurses Based Disk Usage Utility
================================================================================
uts a few days back, we discussed [gt5][1] (a graphical front-end to du). Continuing with this series of du alternatives, today we will discuss a ncurses based disk usage utility that can be run on a remote server set-up which does not have a graphical environment. The command line utility we are about to discuss is **ncdu**.

### ncdu – Ncurses Based du Alternative ###

The command line utility ncdu is nothing but a curses based version of the standard du command. It helps to quickly view the disk usage statistics of a system even if there is no graphical environment installed on it.

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-main.png)

### Testing Environment ###

- OS – Ubuntu 13.04
- Shell – Bash 4.2.45
- Application – ncdu 1.9

### A Brief Tutorial ###

Here are some of the examples of ncdu command :

**1. The Default Output**

Just execute the **ncdu** command and you’ll observe that first it scans the disk and then displays the disk usage of various directories in descending order.

Here is an example :

**> Scanning**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-0.png)

**> Output**

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-1.png)

So you can see that a disk usage table is displayed in the output. If you want to scan complete file system, use the -x option with ncdu utility.

**2. Get More Information On Selected Directory By Pressing i**

As you can see that the first entry is selected by default. To know more details related to a selected entry, just press i.

Here is an example :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-2.png)

So you can see that the information like Path, Type, Disk Usage, Apparent size etc. were displayed. To get rid of this window, just press i again.

**3. Delete A Directory From Within The ncdu Interface**

To delete a directory from within the ncdu interface, just select the entry and press d.

Here is an example :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-3.png)

So you can see that ncdu asks for a confirmation from the user. If you press yes, the directory will be deleted from the system.

**4. Show Percentage Of Total Disk Consumption By Each Directory**

Press g to display percentage of total disk consumption by each directory.

Here is an example :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-4.png)

So you can see that percentage consumption of total disk for each entry is displayed in the second column of output.

**5. Get Help Regarding All The Available Hot Keys**

Press ? to get help related to hot keys, format information and ncdu version related information.

Here are some help snapshots :

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-5-1.png)

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-5-2.png)

![](http://mylinuxbook.com/wp-content/uploads/2013/10/ncdu-5-3.png)

For command line options and other information, go through the [man page of ncdu command][2].

### Download/Install/Configure ###

Here are some of the important links related to ncdu command :

- [Home Page][3]
- [Download Link][4]

Alternatively, ncdu can also be downloaded by command line managers like apt-get , yum etc. Additionally, Ubuntu users can use Ubuntu Software Centre to download this utility.

### Pros ###

- Quick access to a lot of information
- Light on resources

### Cons ###

- Doesn’t come pre-installed on most of the Linux distributions
- Has a bit of learning curve associated with it.

### Conclusion ###

If you are not satisfied with the standard du command and are looking for a fast, ncurses based du-like utility then try out ncdu. It provides lots of customization options. You’ll definitely like it.

**Have you ever used ncdu, gt5 or any other du-like utility? Share your experience with us.**

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/ncdu-ncurses-based-disk-usage-utility/

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://mylinuxbook.com/gt5-a-graphical-alternative-to-du/
[2]:http://linux.die.net/man/1/ncdu
[3]:http://dev.yorhel.nl/ncdu
[4]:http://dev.yorhel.nl/ncdu