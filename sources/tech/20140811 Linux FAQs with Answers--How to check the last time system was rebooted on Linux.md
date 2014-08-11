[translating by KayGuoWhu]
Linux FAQs with Answers--How to check the last time system was rebooted on Linux
================================================================================
> **Question**: Is there a way to quickly check how long a Linux system has been running? That is, how can I find out the last time a Linux system was rebooted? 

There are several ways to find out the last system reboot time,

### Method One ###

The first method is to use last command.

    $ last reboot 

![](https://farm4.staticflickr.com/3925/14881994335_041e9c2f86_z.jpg)

This command actually shows system uptime for the last few days. Originally the last command is designed to show login history of a particular user. In Linux, a special "pseudo user" named reboot automatically logs in to the system right after the system has rebooted. Thus by checking the login history of reboot user, you can check the last reboot time.

### Method Two ###

Another command to check the time of last system boot is to use who command with '-b' option.

    $ who -b 

### Method Three ###

You can also use uptime command to deduce last reboot time. The uptime command shows you the current time, as well as how long the system has been running. From this information, you can calculate the time when the system was last booted.

    $ uptime 

![](https://farm4.staticflickr.com/3915/14881660192_58f2843969_o.png)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-last-time-system-rebooted-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出