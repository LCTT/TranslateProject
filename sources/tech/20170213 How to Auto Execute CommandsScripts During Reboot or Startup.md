How to Auto Execute Commands/Scripts During Reboot or Startup
============================================================

 Download Your Free eBooks NOW - [10 Free Linux eBooks for Administrators][5] | [4 Free Shell Scripting eBooks][6]

I am always fascinated by the things going on behind the scenes when I [boot a Linux system and log on][1]. By pressing the power button on a bare metal or starting a virtual machine, you put in motion a series of events that lead to a fully-functional system – sometimes in less than a minute. The same is true when you log off and / or shutdown the system.

What makes this more interesting and fun is the fact that you can have the operating system execute certain actions when it boots and when you logon or logout.

In this distro-agnostic article we will discuss the traditional methods for accomplishing these goals in Linux.

Note: We will assume the use of Bash as main shell for logon and logout events. If you happen to use a different one, some of these methods may or may not work. If in doubt, refer to the documentation of your shell.

### Executing Linux Scripts During Reboot or Startup

There are two traditional methods to execute a command or run scripts during startup:

#### Method #1 – Use a cron Job

Besides the usual format (minute / hour / day of month / month / day of week) that is widely used to indicate a schedule, [cron scheduler][2] also allows the use of `@reboot`. This directive, followed by the absolute path to the script, will cause it to run when the machine boots.

However, there are two caveats to this approach:

1.  a) the cron daemon must be running (which is the case under normal circumstances), and
2.  b) the script or the crontab file must include the environment variables (if any) that will be needed (refer to this StackOverflow thread for more details).

#### Method #2 – Use /etc/rc.d/rc.local

This method is valid even for systemd-based distributions. In order for this method to work, you must grant execute permissions to `/etc/rc.d/rc.local` as follows:

```
# chmod +x /etc/rc.d/rc.local
```

and add your script at the bottom of the file.

The following image shows how to run two sample scripts (`/home/gacanepa/script1.sh` and `/home/gacanepa/script2.sh`) using a cron job and rc.local, respectively, and their respective results.

script1.sh:
```
#!/bin/bash
DATE=$(date +'%F %H:%M:%S')
DIR=/home/gacanepa
echo "Current date and time: $DATE" > $DIR/file1.txt
```
script2.sh:
```
#!/bin/bash
SITE="Tecmint.com"
DIR=/home/gacanepa
echo "$SITE rocks... add us to your bookmarks." > $DIR/file2.txt
```
[
 ![Run Linux Scripts at Startup](http://www.tecmint.com/wp-content/uploads/2017/02/Run-Linux-Commands-at-Startup.png) 
][3]

Run Linux Scripts at Startup

Keep in mind that both scripts must be granted execute permissions previously:

```
$ chmod +x /home/gacanepa/script1.sh
$ chmod +x /home/gacanepa/script2.sh
```

### Executing Linux Scripts at Logon and Logout

To execute a script at logon or logout, use `~.bash_profile` and `~.bash_logout`, respectively. Most likely, you will need to create the latter file manually. Just drop a line invoking your script at the bottom of each file in the same fashion as before and you are ready to go.

##### Summary

In this article we have explained how to run script at reboot, logon, and logout. If you can think of other methods we could have included here, feel free to use the comment form below to point them out. We look forward to hearing from you!

--------------------------------------------------------------------------------

作者简介：

I am Ravi Saive, creator of TecMint. A Computer Geek and Linux Guru who loves to share tricks and tips on Internet. Most Of My Servers runs on Open Source Platform called Linux. Follow Me: Twitter, Facebook and Google+

--------------------------------------------------------------------------------


via: http://www.tecmint.com/auto-execute-linux-scripts-during-reboot-or-startup/

作者：[Ravi Saive ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/admin/
[00]:https://twitter.com/ravisaive
[01]:https://www.facebook.com/ravi.saive
[02]:https://plus.google.com/u/0/+RaviSaive

[1]:http://www.tecmint.com/linux-boot-process/
[2]:http://www.tecmint.com/11-cron-scheduling-task-examples-in-linux/
[3]:http://www.tecmint.com/wp-content/uploads/2017/02/Run-Linux-Commands-at-Startup.png
[4]:http://www.tecmint.com/author/gacanepa/
[5]:http://www.tecmint.com/10-useful-free-linux-ebooks-for-newbies-and-administrators/
[6]:http://www.tecmint.com/free-linux-shell-scripting-books/
