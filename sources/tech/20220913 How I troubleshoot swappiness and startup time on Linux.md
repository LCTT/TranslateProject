[#]: subject: "How I troubleshoot swappiness and startup time on Linux"
[#]: via: "https://opensource.com/article/22/9/swappiness-startup-linux"
[#]: author: "David Both https://opensource.com/users/dboth"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I troubleshoot swappiness and startup time on Linux
======

I recently experienced another interesting problem in the Linux startup sequence that has a circumvention–not a solution. It started quite unexpectedly.

I was writing a couple of articles while making some updates to my personal copy of my series of books, "Using and Administering Linux: Zero to SysAdmin." I had four instances of [LibreOffice Write][2] open to doing all that. I had three VMs running with VirtualBox to test some of the things I was writing about. I also had LibreOffice Impress open to work on an unrelated presentation. I like to listen to music, so I had one of several tabs in Firefox open to Pandora, my music streaming service of choice. I had multiple Bash shells open using Konsole with numerous tabs and the Alpine text-mode email client in one. Then there were the various tabs in the Thunar file manager.

So I had a lot going on. Just like I do now as I write this article.

### The symptoms

As I used these open sessions, I noticed that things slowed down considerably while waiting for the system to write a document to the M.3 SSD–a process that should have been really fast. I also noticed that the music was choppy and dropped out completely every few minutes. Overall performance was generally poor. I began to think that Fedora had a serious problem.

My primary workstation, the one I was working on at the time, has 64GB of RAM and an Intel Core i9 Extreme with 16 cores and Hyperthreading (32 CPUs) that can run as fast as 4.1 GHz using my configured overclocking. So I should not have experienced any slowdowns–or so I thought at the time.

### Determine the problem

It did not take long to find the problem because I have experienced similar symptoms before on systems with far less memory. The issue looked like delays due to page swapping. But why?

I started with one of my go-to tools for problem determination, htop. It showed that the system was using 13.6GB of memory for programs, and most of the rest of the RAM was in cache and buffers. It also showed that swapping was actively occurring and that about 253MB of data was stored in the swap partitions.

```
Date & Time: 2022-08-12 10:53:08
Uptime: 2 days, 23:47:15
Tasks: 200, 1559 thr, 371 kthr; 4 running
Load average: 3.97 3.05 2.08
   
Disk IO: 202.6% read: 687M write: 188K
Network: rx: 0KiB/s tx: 0KiB/s (0/0 packets)
Systemd: running (0/662 failed) (0/7912 jobs)     
Mem[|||||||##*@@@@@@@@@@@@@@@@@@@@@@@@@@    13.6G/62.5G]
Swp[||#                                      253M/18.0G]
```

But that meant I still had lots of memory left the system could use directly for programs and data and more that it could recover from cache and buffers. So why was this system even swapping at all?

I remembered hearing about the "swappiness" factor in one of my [Red Hat training classes][3]. But that was a long time ago. I did some searches on "swappiness" to learn about the kernel setting **vm.swappiness**.

The default value for this kernel parameter is **60**. That represents the percent of free memory not yet in use. When the system reaches that 60% trigger point, it begins to swap, no matter how much free memory is available. My system started swapping when about 0.6 * 62.5GB = 37.5GB of unused memory remained.

Based on my online reading, I discovered that 10% is a better setting for many Linux systems. With that setting, swapping starts when only 10% of RAM is free.

I checked the current swappiness setting on my system, and it was set to the default.

```
# sysctl vm.swappiness
vm.swappiness = 60
```

Time to change this kernel setting.

### Fix the issue

I won't dive into the gory details, but the bottom line is that either of the following commands, run as root, will instantly do the job on a running Linux computer without a reboot.

```
# sysctl -w vm.swappiness=10
```

You could also use this next command to do the same thing.

```
# echo 10 > /proc/vm/swappiness
```

Tecmint has an excellent article about setting kernel parameters.

Both commands change the live kernel setting in the `/proc` filesystem. After running either of those commands, you should run the `sysctl vm.swappiness` command to verify that the kernel setting has changed.

But those commands only change the swappiness value for the currently running system. A reboot returns the value to its default. I needed to ensure that this change is made persistent across reboots.

### But first, the failure

To permanently change the kernel **vm.swappiness** variable, I used the procedure described in my previous article, [How I disabled IPv6 on Linux][4], to add the following line to the end of the `/etc/default/grub` file:

```
GRUB_CMDLINE_LINUX="vm.swappiness=1"
```

I then ran the `grub2-mkconfig` command as root to rebuild the `/boot/grub2/grub.cfg` file. However, testing with VMs and real hardware showed that it did not work, and the swappiness value did not change. So I tried another approach.

### And the success

Between this failure at startup time, the one I describe in the *How I disabled IPv6 on Linux* article, and other startup issues I explored due to encountering those two, I decided that this was a Linux startup timing problem. In other words, some required services, one of which might be the network itself, were not up and running, which prevented these kernel option changes from being committed to the `/proc` filesystem, or they were committed and then overwritten when the service started.

I could make all of these work as they should by adding them to a new file, `/etc/sysctl.d/local-sysctl.conf` with the following content, which includes all of my local kernel option changes:

```
###############################################
#            local-sysctl.conf                #
#                                             #
# Local kernel option settings.               #
# Install this file in the /etc/sysctl.d      #
# directory.                                  #
#                                             #
# Use the command:                            #
# sysctl -p /etc/sysctl.d/local-sysctl.conf   #
# to activate.                                #
#                                             #
###############################################
###############################################
# Local Network settings                      #
# Specifically to disable IPV6                #
###############################################
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1

###############################################
# Virtual Memory                              #
###############################################
# Set swappiness
vm.swappiness = 1
```

I then ran the following command, which activated only the kernel options in the specified file:

```
# sysctl -p /etc/sysctl.d/local-sysctl.conf
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
vm.swappiness = 13
```

This is a more targeted approach to setting kernel options than I used in my article about disabling IPv6.

### Reporting the bug

At the time of this writing, there is no true fix for the root cause of this problem–whatever the cause. There is a way to temporarily circumvent the issue until a fix is provided. I used the `/etc/sysctl.d/local-sysctl.conf` file that I had created for testing and added a systemd service to run at the end of the startup sequence, wait for a few seconds, and run `sysctl` on that new file. The details of how to do that are in the *How I disabled IPv6 on Linux* article.

I had already reported this as bug 2103517 using Red Hat's Bugzilla when trying to disable IPv6. I added this new information to that bug to ensure that my latest findings were available to the kernel developers.

You can follow the [link to view the bug report][5]. You do not need an account to view bug reports.

### Final thoughts

After experimenting to see how well I could reproduce the symptoms, along with many others, I have determined that the **vm.swappiness** setting of 60% is far too aggressive for many large-memory Linux systems. Without a lot more data points than those of my own computers, all I can tentatively conclude is that systems with huge amounts of RAM that get used only infrequently are the primary victims of this problem.

The immediate solution to the problem of local kernel option settings not working is to set them after startup. The automation I implemented is a good example of how to use systemd to replace the old SystemV startup file `rc.local`.

This bug had not been previously reported. It took a few days of experimenting to verify that the general problem in which locally-set kernel options were not being set or retained at startup time was easily repeatable on multiple physical and virtual systems. At that point, I felt it important to report the bug to ensure it gets fixed. Reporting it is another way I can give back to the Linux community.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/swappiness-startup-linux

作者：[David Both][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dboth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/gears_devops_learn_troubleshooting_lightbulb_tips_520.png
[2]: https://opensource.com/tags/libreoffice
[3]: https://www.redhat.com/en/services/training-and-certification?intcmp=7013a000002qLH8AAM
[4]: https://opensource.com/article/22/8/disable-ipv6
[5]: https://bugzilla.redhat.com/show_bug.cgi?id=2103517
