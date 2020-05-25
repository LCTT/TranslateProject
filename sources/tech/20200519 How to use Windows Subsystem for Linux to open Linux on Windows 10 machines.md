[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to use Windows Subsystem for Linux to open Linux on Windows 10 machines)
[#]: via: (https://www.networkworld.com/article/3543845/how-to-use-windows-subsystem-for-linux-to-open-linux-on-windows-10-machines.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to use Windows Subsystem for Linux to open Linux on Windows 10 machines
======
Opening a Linux terminal on a Windows 10 desktop can help you practice your Linux skills and explore Windows from an entirely different point of view. In this post, we look at Ubuntu 18.04 running through Windows Subsystem for Linux (WSL).
[Nicolas Solerieu modified by IDG Comm. / Linux][1] [(CC0)][2]

Believe it or not, it's possible to open a Linux terminal on a Windows 10 system and you might be surprised how much Linux functionality you’ll be able to get by doing so.

You can run Linux commands, traipse around the provided Linux file system and even take a novel look at Windows files. The experience isn’t altogether different than opening a terminal window on a Linux desktop, with a few interesting exceptions.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

What is needed to make this happen is something called the Windows Subsystem for Linux (WSL) and a Windows 10 x86 PC.

### Linux versions for WSL

There are a number of options for running Linux on top of Windows. The Linux OS choices include:

  * [Ubuntu 16.04 LTS][4]
  * [Ubuntu 18.04 LTS][5]
  * [openSUSE Leap 15.1][6]
  * [SUSE Linux Enterprise Server 12 SP5][7]
  * [SUSE Linux Enterprise Server 15 SP1][8]
  * [Kali Linux][9]
  * [Debian GNU/Linux][10]
  * [Fedora Remix for WSL][11]
  * [Pengwin][12]
  * [Pengwin Enterprise][13]
  * [Alpine WSL][14]



Ubuntu 18.04 LTS is just one option and, in this post, we’ll take a look at how the terminal runs on Windows using this particular distribution and how much it feels like working on a Linux system directly.

If you want to look into the process of putting an Ubuntu distribution on your Windows system, you can start with this page:

<https://ubuntu.com/tutorials/tutorial-ubuntu-on-windows#1-overview>

As part of the initial setup of installing your Linux on Windows terminal, you’ll be asked to create your user account. Once you do that and open the terminal, you can start to explore. One of the most noticeable differences between your Linux-on-Windows terminal and a terminal window on a Linux system is that examining processes isn’t going to show you much. After all, Windows will be providing the bulk of the required OS support. You’re likely to see something like this:

```
myacct@hostname:~$ ps -ef
UID        PID  PPID  C STIME TTY          TIME CMD
root         1     0  0 12:45 ?        00:00:00 /init
root         7     1  0 12:45 tty1     00:00:00 /init
shs          8     7  0 12:45 tty1     00:00:00 -bash
shs        166     8  0 13:32 tty1     00:00:00 ps -ef
```

Yes, that's it.

If you’re anything like me, one of your next moves might be to get a handle on the available commands. If you just count the files in the **/bin** and **/usr/bin** directories, you should see that there are a lot of commands:

```
myacct@hostname:~$ ls /bin | wc -l
171
myacct@hostname:~$ ls /usr/bin | wc -l
707
```

You can list available commands with commands like these (output truncated for this post):

```
myacct@hostname:~$ ls /bin | head -25 | column
bash              btrfs-map-logical   bunzip2          bzegrep           bzip2recover
btrfs             btrfs-select-super  busybox          bzexe             bzless
btrfs-debug-tree  btrfs-zero-log      bzcat            bzfgrep           bzmore
btrfs-find-root   btrfsck             bzcmp            bzgrep            cat
btrfs-image       btrfstune           bzdiff           bzip2             chacl

myacct@hostname:~$ ls /usr/bin | head -25 | column
NF            aa-exec             apport-cli      apt                apt-extracttempl*
VGAuthService acpi_listen         apport-collect  apt-add-repository apt-ftparchive
X11           add-apt-repository  apport-unpack   apt-cache          apt-get
[             addpart             appres          apt-cdrom          apt-key
aa-enabled    apport-bug          apropos         apt-config         apt-mark
```

You can update the system with **apt** commands (sudo apt update, sudo apt upgrade). You can even use Linux commands to move to the Windows disk partitions as you like and . Notice the last three entries in the output below. These represent several drives on the system.

```
myacct@hostname:~$ df -k
Filesystem     1K-blocks      Used Available Use% Mounted on
rootfs         973067784 326920584 646147200  34% /
none           973067784 326920584 646147200  34% /dev
none           973067784 326920584 646147200  34% /run
none           973067784 326920584 646147200  34% /run/lock
none           973067784 326920584 646147200  34% /run/shm
none           973067784 326920584 646147200  34% /run/user
cgroup         973067784 326920584 646147200  34% /sys/fs/cgroup
C:\            973067784 326920584 646147200  34% /mnt/c        <== C drive
I:\            976760000 231268208 745491792  24% /mnt/I        <== external drive
L:\            409599996    159240 409440756   1% /mnt/l        <== USB thumb drive
```

If you’re interested in moving out of the Linux space and into the Windows portion of the file system within your **WSL** session, you can do that easily. Replace “myname” with your Windows account name and a **cd /mnt/c/Users/_myname_/Desktop** will take you to your Windows desktop. From there, don’t be surprised if in listing your files you see **WRL####.tmp** files that don’t seem to exist when you look at your desktop and don’t show up if you look at your files by opening a command prompt. These appear to be temporary files used by Windows for document management. You might also see files listed that look like **‘~$nux notes.docx’** – perhaps ghosts of files that were once located on your desktop. You won’t see those files when you look at your desktop on Windows – even using a **cmd** window.

Note that you’ll also see Windows directories such as **‘Program Files’** in single quotes when listed in your Linux terminal as you would any file with blanks included in their names. You can even start a Windows executable from your Linux terminal. For example:

```
myacct@hostname: $ cd /mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0
myacct@hostname: $ powershell.exe
```

If you do this, type **exit** when you want to end the **powershell** session.

Linux commands all seem to work as expected, though I don’t get any output when I run the **who** command.

Windows **.txt** files will display with **cat** commands, but the last line in a file will likely be displayed on the same line as the following shell prompt. This is because these files won’t end with a linefeed as Linux text files do.

You can create other accounts and switch user to them (e.g., **su – nemo**) if you like, but not log into them directly.

You can also update the system with apt commands (**sudo apt update**, **sudo apt upgrade**).

Join the Network World communities on [Facebook][15] and [LinkedIn][16] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3543845/how-to-use-windows-subsystem-for-linux-to-open-linux-on-windows-10-machines.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/4gRNmhGzYZE
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.microsoft.com/store/apps/9pjn388hp8c9
[5]: https://www.microsoft.com/store/apps/9N9TNGVNDL3Q
[6]: https://www.microsoft.com/store/apps/9NJFZK00FGKV
[7]: https://www.microsoft.com/store/apps/9MZ3D1TRP8T1
[8]: https://www.microsoft.com/store/apps/9PN498VPMF3Z
[9]: https://www.microsoft.com/store/apps/9PKR34TNCV07
[10]: https://www.microsoft.com/store/apps/9MSVKQC78PK6
[11]: https://www.microsoft.com/store/apps/9n6gdm4k2hnc
[12]: https://www.microsoft.com/store/apps/9NV1GV1PXZ6P
[13]: https://www.microsoft.com/store/apps/9N8LP0X93VCP
[14]: https://www.microsoft.com/store/apps/9p804crf0395
[15]: https://www.facebook.com/NetworkWorld/
[16]: https://www.linkedin.com/company/network-world
