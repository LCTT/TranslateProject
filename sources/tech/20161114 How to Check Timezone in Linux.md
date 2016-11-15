How to Check Timezone in Linux
============================================================

In this short article, we will walk newbies through the various simple ways of checking system timezone in Linux. Time management on a Linux machine especially a production server is always an important aspect of system administration.

There are a number of time management utilities available on Linux such as date and timedatectlcommands to get the current timezone of system and [synchronize with a remote NTP server][1] to enable an automatic and more accurate system time handling.

Well, let us dive into the different ways of finding out our Linux system timezone.

1. We will start by using the traditional date command to find out present timezone as follows:

```
$ date
```

Alternatively, type the command below, where `%Z` format prints the alphabetic timezone and `%z` prints the numeric timezone:

```
$ date +”%Z %z”
```
[
 ![Find Linux Timezone](http://www.tecmint.com/wp-content/uploads/2016/10/Find-Linux-Timezone.png) 
][2]

Find Linux Timezone

Note: There are many formats in the date man page that you can make use of, to alter the output of the date command:

```
$ man date
```

2. Next, you can likewise use timedatectl, when you run it without any options, the command displays an overview of the system including the timezone like so:

```
$ timedatectl
```

More so, try to employ a pipeline and [grep command][3] to only filter the timezone as below:

```
$ timedatectl | grep “Time zone”
```
[
 ![Find Current Linux Timezone](http://www.tecmint.com/wp-content/uploads/2016/10/Find-Current-Linux-Timezone.png) 
][4]

Find Current Linux Timezone

Learn how to [set timezone in Linux using timedatectl][5] command.

3. In addition, display the content of the file `/etc/timezone` using [cat utility][6] to check your timezone:

```
$ cat /etc/timezone
```
[
 ![Check Timezone of Linux](http://www.tecmint.com/wp-content/uploads/2016/10/Check-Timezone-of-Linux.png) 
][7]

Check Timezone of Linux

For REHL/CentOS/Fedora users, here is one more command for the same purpose:

```
$ grep ZONE /etc/sysconfig/clock
```

That’s all! Do not forget to share you thoughts about the article by means of the feedback form below. Importantly, you should look through this time management guide for Linux to get more insight into handling time on your system, it has simple and easy-to-follow examples.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/check-linux-timezone

作者：[Aaron Kili ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/install-ntp-server-in-centos/
[2]:http://www.tecmint.com/wp-content/uploads/2016/10/Find-Linux-Timezone.png
[3]:http://www.tecmint.com/12-practical-examples-of-linux-grep-command/
[4]:http://www.tecmint.com/wp-content/uploads/2016/10/Find-Current-Linux-Timezone.png
[5]:http://www.tecmint.com/set-time-timezone-and-synchronize-time-using-timedatectl-command/
[6]:http://www.tecmint.com/13-basic-cat-command-examples-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2016/10/Check-Timezone-of-Linux.png
