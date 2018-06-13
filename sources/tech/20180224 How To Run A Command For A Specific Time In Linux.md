How To Run A Command For A Specific Time In Linux
======
![](https://www.ostechnix.com/wp-content/uploads/2018/02/Run-A-Command-For-A-Specific-Time-In-Linux-1-720x340.png)

The other day I was transferring a large file using rsync to another system on my local area network. Since it is very big file, It took around 20 minutes to complete. I don’t want to wait that longer, and I don’t want to terminate the process by pressing CTRL+C either. I was just wondering if there could be any easy ways to run a command for a specific time and kill it automatically once the time is out in Unix-like operating systems – hence this post. Read on.

### Run A Command For A Specific Time In Linux

We can do this in two methods.

#### Method 1 – Using “timeout” command

The most common method is using **timeout** command. For those who don’t know, the timeout command will effectively limit the absolute execution time of a process. The timeout command is part of the GNU coreutils package, so it comes pre-installed in all GNU/Linux systems.

Let us say, you want to run a command for only 5 seconds, and then kill it. To do so, we use:
```
$ timeout <time-limit-interval> <command>

```

For example, the following command will terminate after 10 seconds.
```
$ timeout 10s tail -f /var/log/pacman.log

```

![][2]

You also don’t have to specify the suffix “s” for seconds. The following command is same as above.
```
$ timeout 10 tail -f /var/log/pacman.log

```

The other available suffixes are:

  * ‘m’ for minutes,
  * ‘h’ for hours
  * ‘d’ for days.



If you run this **tail -f /var/log/pacman.log** command, it will keep running until you manually end it by pressing CTRL+C. However, if you run it along with **timeout** command, it will be killed automatically after the given time interval. If the command is till running after the time out, you can send a **kill** signal like below.
```
$ timeout -k 20 10 tail -f /var/log/pacman.log

```

In this case, if you the tail command still running after 10 seconds, the timeout command will send it a kill signal after 20 seconds and end it.

For more details, check the man pages.
```
$ man timeout

```

Sometimes, a particular program might take long time to complete and end up freezing your system. In such cases, you can use this trick to end the process automatically after a particular time.

Also, consider using **Cpulimit** , a simple application to limit the CPU usage of a process. For more details, check the following link.

#### Method 2 – Using “Timelimit” program

The Timelimit utility executes a given command with the supplied arguments and terminates the spawned process after a given time with a given signal. First, it will pass the warning signal and then after timeout, it will send the **kill** signal.

Unlike the timeout utility, the Timelimit has more options. You can pass number of arguments such as killsig, warnsig, killtime, warntime etc. It is available in the default repositories of Debian-based systems. So, you can install it using command:
```
$ sudo apt-get install timelimit

```

For Arch-based systems, it is available in the AUR. So, you can install it using any AUR helper programs such as [**Pacaur**][3], [**Packer**][4], [**Yay**][5], [**Yaourt**][6] etc.

For other distributions, download the source [**from here**][7] and manually install it. After installing Timelimit program, run the following command for a specific time, for example 10 seconds:
```
$ timelimit -t10 tail -f /var/log/pacman.log

```

If you run timelimit without any arguments, it will use the default values: warntime=3600 seconds, warnsig=15, killtime=120, killsig=9. For more details, refer the man pages and the project’s website given at the end of this guide.
```
$ man timelimit

```

And, that’s all for today. I hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/run-command-specific-time-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[2]:http://www.ostechnix.com/wp-content/uploads/2018/02/Timeout.gif
[3]:https://www.ostechnix.com/install-pacaur-arch-linux/
[4]:https://www.ostechnix.com/install-packer-arch-linux-2/
[5]:https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[6]:https://www.ostechnix.com/install-yaourt-arch-linux/
[7]:http://devel.ringlet.net/sysutils/timelimit/#download
