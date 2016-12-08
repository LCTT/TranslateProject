Fix “Unable to lock the administration directory (/var/lib/dpkg/)” in Ubuntu
============================================================

While using the [apt-get command][1] or the relatively new [APT package management tool][2] in Ubuntu Linuxor its derivatives such as Linux Mint (which I actually use as my primary operating system for doing daily work), you might have encountered the error – “unable to lock the administration directory (/var/lib/dpkg/) is another process using it” on the command line.

This error can be so annoying especially for new Linux (Ubuntu) users who may not know exactly the cause of the error.

Below is an example, showing the lock file error in Ubuntu 16.10:

```
tecmint@TecMint:~$ sudo apt install neofetch
[sudo] password for tecmint:
E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable)
E: Unable to lock the administration directory (/var/lib/dpkg), is another process using it?
```

The output below is another possible instance of the same error:

```
E: Could not get lock /var/lib/apt/lists/lock - open (11: Resource temporarily unavailable)
E: Unable to lock directory /var/lib/apt/lists/ 
E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable) 
E: Unable to lock the administration directory (/var/lib/dpkg/), is another process using it?
```

How can you solve the above error in case you bump into it in the future? There are several ways of dealing with this error(s), but in this guide, we will go through the two easiest and probably the most effective ways of solving it.

### 1\. Find and Kill all apt-get or apt Processes

Run the command below to [generate a list of all processes][3] whose name comprises of the word apt, you will get a list inclusive of all apt or apt-get processes by using `ps` and [grep commands][4] together with a pipeline.

```
$ ps -A | grep apt
```
[
 ![Find apt and apt-get Processes](http://www.tecmint.com/wp-content/uploads/2016/11/find-apt-processes.png) 
][5]

Find apt and apt-get Processes

For each apt-get or apt process that you can see in the output of the command above, [kill each process][6]using the command below.

The process ID (PID) is found in the first column from the screenshot above.

```
$ sudo kill -9 processnumber
OR
$ sudo kill -SIGKILL processnumber
```

For instance, in the command below where `9` is the signal number for the SIGKILL signal, will kill the first apt process:

```
$ sudo kill -9 13431
OR
$ sudo kill -SIGKILL 13431
```

### 2\. Delete the lock Files

A lock file simply prevents access to another file(s) or some data on your Linux system, this concept is present in Windows and other operating systems as well.

Once you run an apt-get or apt command, a lock file is created under the any of these directories /var/lib/apt/lists/, /var/lib/dpkg/ and /var/cache/apt/archives/.

This helps to avoid the apt-get or apt process that is already running from being interrupted by either a user or other system processes that would need to work with files being used by apt-get or apt. When the process has finished executing, the lock file is then deleted.

Important: In case a lock is still exiting in the two directories above with no noticeable apt-get or apt process running, this may mean the process was held for one reason or the other, therefore you need to delete the lock files in order to clear the error.

First execute the command below to remove the lock file in the `/var/lib/dpkg/` directory:

```
$ sudo rm /var/lib/dpkg/lock
```

Afterwards force package(s) to reconfigure like so:

```
$ sudo dpkg --configure -a
```

Alternatively, delete the lock files in the `/var/lib/apt/lists/` and cache directory as below:

```
$ sudo rm /var/lib/apt/lists/lock
$ sudo rm /var/cache/apt/archives/lock
```

Next, update your packages sources list as follows:

```
$ sudo apt update
OR
$ sudo apt-get update
```

In conclusion, we have walked through two important methods to deal with a common problem faced by Ubuntu (and its derivatives) users, while running apt-get or apt as well as [aptitude commands][7].

Do you have any other reliable methods to share meant for deal with this common error? Then get in touch with us via the feedback form below.

In addition, you may as well want to learn [how to find and kill running processes][8] and read through a simple guide to [kill, pkill and killall commands to terminate a process][9] in Linux.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/fix-unable-to-lock-the-administration-directory-var-lib-dpkg-lock

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 组织编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/useful-basic-commands-of-apt-get-and-apt-cache-for-package-management/
[2]:http://www.tecmint.com/apt-advanced-package-command-examples-in-ubuntu/
[3]:http://www.tecmint.com/find-linux-processes-memory-ram-cpu-usage/
[4]:http://www.tecmint.com/linux-grep-commands-character-classes-bracket-expressions/
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/find-apt-processes.png
[6]:http://www.tecmint.com/find-and-kill-running-processes-pid-in-linux/
[7]:http://www.tecmint.com/difference-between-apt-and-aptitude/
[8]:http://www.tecmint.com/find-and-kill-running-processes-pid-in-linux/
[9]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
