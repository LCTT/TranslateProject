translating by lujun9972
Linux uptime Command Explained for Beginners with Examples
======

If you are a Linux newbie, and have interest in system administration, or you want to become a power user, then you need to have a solid knowledge of the command line. There are several commands that you should know about, and one of them is **uptime**. In this article, we will discuss the basics of this command using some easy to understand examples.

But before that, it's worth mentioning that all examples used in this tutorial have been tested on an Ubuntu 16.04 machine.

## Linux uptime command

As the name suggests, the uptime command gives you the time for which the system has been up (or running). Here's its syntax:

```
uptime [options]
```

And here's is the way the tool's man page explains it:
```
uptime gives a one line display of the following information. The current time, how long the system
has been running, how many users are currently logged on, and the system load averages for the past
1, 5, and 15 minutes.
```

The following Q&A-styled examples should give you a better idea on how the uptime command works.

### Q1. How to use the uptime command

Uptime's basic usage is very easy - just write the command's name and press enter.

uptime

Here's the kind of output the tool produces:

[![How to use the uptime command][1]][2]

So the first entry is the current time, then 'up' shows the system is running, 5:53 is the total time for which the system has been up, and then finally are the system load averages. Just in case you want to know more, here's what the uptime man page says about the last entry:
```
System load averages is the average number of processes that are either in a runnable or
uninterruptable state. A process in a runnable state is  either using the CPU or waiting to use the
CPU. A process in uninterruptable state is waiting for some I/O access, eg waiting for  disk.

The  averages are taken over the three time intervals. Load averages are not normalized for the
number of CPUs in a system, so a load  average  of 1 means a single CPU system is loaded all the
time while on a 4 CPU system it means it was idle 75% of the time.
```

### Q2. How to make the tool show up time in pretty format

In case you just want to know the time for which the system has been up, and that too in a more human-readable format, use the **-p** command line option.

```
uptime -p
```

Here's the output this command produced in our case:

[![make the tool show up time in pretty format][3]][4]

You can also make uptime specifically display the time/date since when the system has been running. This can be done using the **-s** command line option.

uptime -s

Here's the output the command produced in our case:

[![make uptime display date/time since when system is up][5]][6]

### Q4. How to get version information and help in general

Use the -V option to get version information, and -h for general help.

```
uptime -V

uptime -h
```

[![How to get version information and help][7]][8]

### Conclusion

As you'd have observed, the uptime command is easy to understand and use. It doesn't offer many features (or command line options). What all it offers have been discussed here. So just practice these options and you should be ready to use uptime in your day-to-day work. Just in case you require, here's the tool's [man page][9].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-uptime-command/

作者：[Himanshu Arora][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/uptime-basic-usage1.png
[2]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/uptime-basic-usage1.png
[3]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/uptime-p-option.png
[4]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/uptime-p-option.png
[5]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/uptime-s.png
[6]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/uptime-s.png
[7]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/uptime-v-h.png
[8]:https://www.howtoforge.com/images/usage_of_pfsense_to_block_dos_attack_/big/uptime-v-h.png
[9]:https://linux.die.net/man/1/uptime
