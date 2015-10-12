10 Useful Utilities For Linux Users
================================================================================
![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2014/09/linux-656x445.png)

### Introduction ###

In this tutorial, I have collected 10 useful utility tools for Linux users which will include various network monitoring, system auditing or some another random commands which can help users to enhance their productivity. I hope you will enjoy them.

#### 1. w ####

Display who is logged into the system and what process executed by them.

    $w

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_023.png)

for help

    $w -h

for current user

    $w <username>

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_024.png)

#### 2. nmon ####

Nmon or nigel’s monitor is a tool which displays performance information of the system.

    $ sudo apt-get install nmon

----------

    $ nmon

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_001.png)

nmon can dump information related to netwrok, cpu, memory or disk uses.

**nmon cpu info (press c)**

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_002.png)

**nmon network info (press n)**

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_003.png)

**nman disk info (press d)**

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_004.png)

#### 3. ncdu ####

A Command utility is a cursor based version of ‘du’,  this command is used to analyze disk space occupied by various directories.

    $apt-get install ncdu

----------

    $ncdu /

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_006.png)

Final output:

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_007.png)

Press n to order by name or press s to order by file size(default).

#### 4. slurm ####

A command line utility used for command based network interface bandwidth monitoring, it will display ascii based graphic.

    $ apt-get install slurm

Examples:

    $ slurm -i <interface>

----------

    $ slurm -i eth1

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0091.png)

**options**

- Press **l** to display lx/tx led.
- press **c** to switch to classic mode.
- press **r** to refresh screen.
- press **q** to quit.

#### 5.findmnt ####

Findmnt command is used to find mount file systems. It is used to list mount devices and can alos mount or unmount devices as and when required, it comes as a part of util-linux.

Examples:

    $findmnt

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0101.png)

To get output in list format.

    $ findmnt -l

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0111.png)

List file systems mounted in fstab.

    $ findmnt -s

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0122.png)

List mounted  files systems by file type

    $ findmnt -t ext4

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0131.png)

#### 6. dstat ####

A combined and flexible tool  which can be used to monitor memory, process, network or disk space performance, it is a good replacement of ifstat, iostat, dmstat etc.

    $apt-get install dstat

Examples:

A detailed info about cpu, hard disk and network.

    $ dstat

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0141.png)

- **-c** cpu

    $ dstat -c

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0151.png)

Some more detailed information about cpu

    $ dstat -cdl -D sda1

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_017.png)

- **-d** disk

    $ dstat -d

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0161.png)

#### 7. saidar ####

Another  cli based system statistics monitoring tool, provide information about disk uses, network, memory, swap etc.

    $ sudo apt-get install saidar

Examples:

    $ saidar

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0181.png)

Enable colored output

    $ saider -c

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0191.png)

#### 8. ss ####

ss or socket statistics is a good alternative to netstat it directory gather information from kernel space nad play fast in comparision to the netstat utility.

Examples:

List all connections

    $ ss |less

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0201.png)

Greb only tcp traffic

    $ ss -A tcp

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0211.png)

Grab process name and pid

    $ ss -ltp

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0221.png)

#### 9. ccze ####

A tool that decorate your logs :).

    $ apt-get install ccze

Examples:

    $ tailf /var/log/syslog | ccze

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0231.png)

List ccze modules:

    $ ccze -l

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_0241.png)

Save log as html.

    tailf /var/log/syslog | ccze -h > /home/tux/Desktop/rajneesh.html

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_025.png)

#### 10. ranwhen.py ####

A python based terminal utility that can be used to display system activities graphically. Details are presented in a very colorful histogram.

Install python:

    $ sudo apt-add-repository ppa:fkrull/deadsnakes

Update system:

    $ sudo apt-get update

Download python:

    $ sudo apt-get install python3.2

- [Download ranwhen.py][1]

    $ unzip ranwhen-master.zip && cd ranwhen-master

Run the tool.

    $ python3.2 ranwhen.py

![](http://1426826955.rsc.cdn77.org/wp-content/uploads/2015/10/Selection_026.png)

### Conclusion ###

These are the less popular, yet important Linux administration tools. They can help user in their day to day activities. In our upcoming articles, we will try to bring some more Admin/user tools.

Have fun!

--------------------------------------------------------------------------------

via: http://www.unixmen.com/10-useful-utilities-linux-users/

作者：[Rajneesh Upadhyay][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/rajneesh/
[1]:https://github.com/p-e-w/ranwhen/archive/master.zip