uCareSystem – All-In-One System Update And Maintenance Tool For Ubuntu/LinuxMint
============================================================


[uCareSystem Core][2] is a thin utility that automates the basic system maintenance activity, in other hand it will reduce system administrator task in many ways and save some good amount of time. It doesn’t have any GUI and offers purely command line interface to perform the activity.

There are several utilities available in Ubuntu to perform system maintenance activity. Each tool has their own unique features and designed accordingly. You can automate this task by adding a cron-job.

uCareSystem Core will automatically refresh distribution repository, Updates the list of available packages, uninstall packages (obsolete, orphaned & old Linux Kernels) & Clears the retrieved packages to save some disk space on system.

Suggested Read : [Stacer – Linux System Optimizer and Monitoring Tool][3]

Suggested Read : [BleachBit – A Quick And Best Way to Clean Up Your System In Linux][4]

Suggested Read : [Free Up Some Space in Ubuntu/LinuxMint With Ubuntu Cleaner (Fork of Janitor Module)][5]

#### uCareSystem Core Features

*   Update package lists (It will refresh package index)

*   Downloads and install updates

*   Update packages and system libraries to latest available version

*   Remove unneeded, obsolete & orphaned packages

*   Remove old kernels (It keeps the current and previous one for safety purpose)

*   Remove unused config files

*   Clean downloaded temporary packages

#### Install uCareSystem Core In Ubuntu/LinuxMint

We can easily install uCareSystem Core in Ubuntu/LinuxMint through PPA since developer offering the own PPA.

```
$ sudo add-apt-repository ppa:utappia/stable
$ sudo apt update
$ sudo apt install ucaresystem-core
```

We have successfully installed `uCareSystem Core` package and going to check current disk space utilization with help of `df -h`command before executing uCareSystem Core command to know whether it will save some disk space or not?

```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            979M     0  979M   0% /dev
tmpfs           200M  6.4M  194M   4% /run
/dev/sda1        38G   19G   17G  54% /
tmpfs           999M  216K  999M   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           999M     0  999M   0% /sys/fs/cgroup
tmpfs           200M  112K  200M   1% /run/user/1000
```

Just run an `ucaresystem-core` command in terminal and sitback reset it will take care automatically and no human interaction requires till the end.

```
$ sudo ucaresystem-core

_______________________________________________________

            uCareSystem Core v3.0                      
                 ~  ''  ~                              

 Welcome to all-in-one System Update and maintenance   
 assistant app.                                        

 This simple script will automatically         	     
 refresh your packagelist, download and                
 install updates (if there are any), remove any old    
 kernels, obsolete packages and configuration files    
 to free up disk space, without any need of user       
 interference.                    				     
_______________________________________________________

 uCareSystem Core will start in 5 seconds... 
#########################
          Started
#########################

Ign:1 https://wire-app.wire.com/linux/debian stable InRelease
Hit:2 https://wire-app.wire.com/linux/debian stable Release
Hit:4 https://deb.nodesource.com/node_6.x yakkety InRelease
Hit:5 https://repo.skype.com/deb stable InRelease
Hit:6 http://in.archive.ubuntu.com/ubuntu yakkety InRelease
Hit:7 http://archive.canonical.com/ubuntu yakkety InRelease
.
.
.
Removing linux-image-extra-4.8.0-34-generic (4.8.0-34.36) ...
Purging configuration files for linux-image-extra-4.8.0-34-generic (4.8.0-34.36) ...
Removing linux-image-extra-4.8.0-32-generic (4.8.0-32.34) ...
Purging configuration files for linux-image-extra-4.8.0-32-generic (4.8.0-32.34) ...

#####################################
Finished removing unused config files
#####################################

Reading package lists... Done
Building dependency tree       
Reading state information... Done
Del tilix 1.5.6-1~webupd8~yakkety1 [449 kB]
Del tilix-common 1.5.6-1~webupd8~yakkety1 [174 kB]
Del libfreetype6 2.6.3-3ubuntu1.2 [336 kB]
Del terminix 1.5.6-1~webupd8~yakkety1 [13.7 kB]

######################################
 Cleaned downloaded temporary packages
######################################

#########################
          Done
#########################
```

I could see that, it does the job as expected. Also found it saved almost `2GB` in `/ partition`.

```
$ df -h
Filesystem      Size  Used Avail Use% Mounted on
udev            979M     0  979M   0% /dev
tmpfs           200M  6.4M  194M   4% /run
/dev/sda1        38G   18G   19G  49% /
tmpfs           999M  216K  999M   1% /dev/shm
tmpfs           5.0M  4.0K  5.0M   1% /run/lock
tmpfs           999M     0  999M   0% /sys/fs/cgroup
tmpfs           200M  112K  200M   1% /run/user/1000
```

--------------------------------------------------------------------------------

via: http://www.2daygeek.com/ucaresystem-system-update-and-maintenance-tool-for-ubuntu-linuxmint/

作者：[2DAYGEEK  ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.2daygeek.com/author/2daygeek/
[1]:http://www.2daygeek.com/author/2daygeek/
[2]:https://github.com/cerebrux/uCareSystem
[3]:http://www.2daygeek.com/stacer-linux-system-optimizer-and-monitoring-tool/
[4]:http://www.2daygeek.com/bleachbit-system-cleaner-on-ubuntu-debian-fedora-opensuse-arch-linux-mint/
[5]:http://www.2daygeek.com/ubuntu-cleaner-system-cleaner-ubuntu-tweak-alternative-janitor/
