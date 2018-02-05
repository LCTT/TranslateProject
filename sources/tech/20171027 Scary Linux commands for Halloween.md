Scary Linux commands for Halloween
======
With Halloween so fast approaching, it's time for a little focus on the spookier side of Linux. What commands might bring up images of ghosts, witches and zombies? Which might encourage the spirit of trick or treat?

### crypt

Well, we've always got **crypt**. Despite its name, crypt is not an underground vault or a burial pit for trashed files, but a command that encrypts file content. These days  "crypt" is generally implemented as a script that emulates the older crypt command by calling a binary called **mcrypt** to do its work. Using the **mycrypt** command directly is an even better option.
```
$ mcrypt x
Enter the passphrase (maximum of 512 characters)
Please use a combination of upper and lower case letters and numbers.
Enter passphrase:
Enter passphrase:

File x was encrypted.

```

Note that the mcrypt command creates a second file with an added ".nc" extension. It doesn't overwrite the file you are encrypting.

The mcrypt command has options for key size and encryption algorithm. You can specify the key as an option too, though the mcrypt command discourages this.

### kill

There's also the kill command - not exactly a reference to murder, of course, but the command that we use for terminating processes gently or with considerable force, depending on what is required to properly terminate them. And Linux doesn't stop there, of course. Instead, it has all sorts of kill commands to bloody up your command line. We've got kill, pkill, killall, killpg, rfkill, skill (read es-kill), tgkill, tkill and xkill.
```
$ killall runme
[1] Terminated ./runme
[2] Terminated ./runme
[3]- Terminated ./runme
[4]+ Terminated ./runme

```

### shred

Linux systems also support a command called **shred**. The shred command overwrites files to hide their former content and ensure that they cannot be recovered using hard drive recovery tools. Keep in mind that the rm command basically just removes a file 's reference in the directory file, but does not necessarily scrape the content off the disk or overwrite it. The **shred** command overwrites the files' content.
```
$ shred dupes.txt
$ more dupes.txt
▒oΛ▒▒9▒lm▒▒▒▒▒o▒1־▒▒f▒f▒▒▒i▒▒h^}&▒▒▒{▒▒

```

### Zombies

Although not a command, **zombies** have a strong presence on Linux systems. Zombies are basically the remains of dead processes that haven 't quite been cleaned away. Processes aren't _supposed_ to work this way  - leaving dead processes wandering around instead of simply having them die and go to digital Heaven, so the presence of zombies indicates that the processes that left them behind had some kind of flaws.

One easy way to check if your system has zombie processes stumbling around is to take a look at the header lines of the top command.
```
$ top
top - 18:50:38 up 6 days, 6:36, 2 users, load average: 0.00, 0.00, 0.00
Tasks: 171 total, 1 running, 167 sleeping, 0 stopped, 3 zombie	**< ==**
%Cpu(s): 0.0 us, 0.0 sy, 0.0 ni, 99.9 id, 0.1 wa, 0.0 hi, 0.0 si, 0.0 st
KiB Mem : 2003388 total, 250840 free, 545832 used, 1206716 buff/cache
KiB Swap: 9765884 total, 9765764 free, 120 used. 1156536 avail Mem

```

Scary! Three zombies in the above display..

### at midnight

It is sometimes said that on Halloween, the spirits of the dead wander from sunset until midnight. Linux makes it possible to track their departure with the "at midnight" command. Used to schedule jobs that will be run the next time the specified time arrives, **at** works like a one-time cron.
```
$ at midnight
warning: commands will be executed using /bin/sh
at> echo 'the spirits of the dead have left'
at> <EOT>
job 3 at Thu Oct 31 00:00:00 2017

```

### daemons

Linux systems are also highly dependent on daemons - processes that run in the background and provide a lot of the functionality of the system. Many daemon processes have names that end in "d". That "d" stands for "daemon" and is an indication that the process is one that runs all of the time and supports some important function. Others have the word "daemon" spelled out.
```
$ ps -ef | grep sshd
root 1142 1 0 Oct19 ? 00:00:00 /usr/sbin/sshd -D
root 25342 1142 0 18:34 ? 00:00:00 sshd: shs [priv]
$ ps -ef | grep daemon | grep -v grep
message+ 790 1 0 Oct19 ? 00:00:01 /usr/bin/dbus-daemon --system --address=systemd: --nofork --nopidfile --systemd-activation
root 836 1 0 Oct19 ? 00:00:02 /usr/lib/accountsservice/accounts-daemon

```

### Happy Halloween!

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3235219/linux/scary-linux-commands-for-halloween.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:https://www.facebook.com/NetworkWorld/
[2]:https://www.linkedin.com/company/network-world
