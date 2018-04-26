An introduction to the GNU Core Utilities
======

![Introduction to the GNU Core Utilities](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/core-utils.jpg?itok=YTkmsnyy "Introduction to the GNU Core Utilities")

Image credits : 

[Bella67][1] via Pixabay. [CC0][2].

Two sets of utilities—the [GNU Core Utilities][3] and util-linux—comprise many of the Linux system administrator's most basic and regularly used tools. Their basic functions allow sysadmins to perform many of the tasks required to administer a Linux computer, including management and manipulation of text files, directories, data streams, storage media, process controls, filesystems, and much more.

These tools are indispensable because, without them, it is impossible to accomplish any useful work on a Unix or Linux computer. Given their importance, let's examine them.

### GNU coreutils

The Linux Terminal

*   [Top 7 terminal emulators for Linux][4]
*   [10 command-line tools for data analysis in Linux][5]
*   [Download Now: SSH cheat sheet][6]
*   [Advanced Linux commands cheat sheet][7]

To understand the origins of the GNU Core Utilities, we need to take a short trip in the Wayback machine to the early days of Unix at Bell Labs. [Unix was written][8] so Ken Thompson, Dennis Ritchie, Doug McIlroy, and Joe Ossanna could continue with something they had started while working on a large multi-tasking and multi-user computer project called [Multics][9]. That little something was a game called Space Travel. As remains true today, it always seems to be the gamers who drive forward the technology of computing. This new operating system was much more limited than Multics, as only two users could log in at a time, so it was called Unics. This name was later changed to Unix.

Over time, Unix turned out to be such a success that Bell Labs began essentially giving it away it to universities and later to companies for the cost of the media and shipping. Back in those days, system-level software was shared between organizations and programmers as they worked to achieve common goals within the context of system administration.

Eventually, the [PHBs][10] at AT&T decided they should make money on Unix and started using more restrictive—and expensive—licensing. This was taking place at a time when software was becoming more proprietary, restricted, and closed. It was becoming impossible to share software with other users and organizations.

Some people did not like this and fought it with free software. Richard M. Stallman, aka RMS, led a group of rebels who were trying to write an open and freely available operating system they called the GNU Operating System. This group created the GNU Utilities but didn't produce a viable kernel.

When Linus Torvalds first wrote and compiled the Linux kernel, he needed a set of very basic system utilities to even begin to perform marginally useful work. The kernel does not provide commands or any type of command shell such as Bash. It is useless by itself. So, Linus used the freely available GNU Core Utilities and recompiled them for Linux. This gave him a complete, if quite basic, operating system.

You can learn about all the individual programs that comprise the GNU Utilities by entering the command info coreutils at a terminal command line. The following list of the core utilities is part of that info page. The utilities are grouped by function to make specific ones easier to find; in the terminal, highlight the group you want more information on and press the Enter key.

```
* Output of entire files::       cat tac nl od base32 base64
* Formatting file contents::     fmt pr fold
* Output of parts of files::     head tail split csplit
* Summarizing files::            wc sum cksum b2sum md5sum sha1sum sha2
* Operating on sorted files::    sort shuf uniq comm ptx tsort
* Operating on fields::          cut paste join
* Operating on characters::      tr expand unexpand
* Directory listing::            ls dir vdir dircolors
* Basic operations::             cp dd install mv rm shred
* Special file types::           mkdir rmdir unlink mkfifo mknod ln link readlink
* Changing file attributes::     chgrp chmod chown touch
* Disk usage::                   df du stat sync truncate
* Printing text::                echo printf yes
* Conditions::                   false true test expr
* Redirection::                  tee
* File name manipulation::       dirname basename pathchk mktemp realpath
* Working context::              pwd stty printenv tty
* User information::             id logname whoami groups users who
* System context::               date arch nproc uname hostname hostid uptime
* SELinux context::              chcon runcon
* Modified command invocation::  chroot env nice nohup stdbuf timeout
* Process control::              kill
* Delaying::                     sleep
* Numeric operations::           factor numfmt seq
```

There are 102 utilities on this list. It covers many of the functions necessary to perform basic tasks on a Unix or Linux host. However, many basic utilities are missing. For example, the mount and umount commands are not in this list. Those and many of the other commands that are not in the GNU coreutils can be found in the util-linux collection.

### util-linux

The util-linix package of utilities contains many of the other common commands that sysadmins use. These utilities are distributed by the Linux Kernel Organization, and virtually every one of these 107 commands were originally three separate collections—fileutils, shellutils, and textutils—which were [combined into the single package][11] util-linux in 2003.

```
agetty          fsck.minix      mkfs.bfs        setpriv 
blkdiscard      fsfreeze        mkfs.cramfs     setsid 
blkid           fstab           mkfs.minix      setterm 
blockdev        fstrim          mkswap          sfdisk 
cal             getopt          more            su 
cfdisk          hexdump         mount           sulogin 
chcpu           hwclock         mountpoint      swaplabel 
chfn            ionice          namei           swapoff 
chrt            ipcmk           newgrp          swapon 
chsh            ipcrm           nologin         switch_root 
colcrt          ipcs            nsenter         tailf 
col             isosize         partx           taskset 
colrm           kill            pg              tunelp 
column          last            pivot_root      ul 
ctrlaltdel      ldattach        prlimit         umount 
ddpart          line            raw             unshare 
delpart         logger          readprofile     utmpdump 
dmesg           login           rename          uuidd 
eject           look            renice          uuidgen 
fallocate       losetup         reset           vipw 
fdformat        lsblk           resizepart      wall 
fdisk           lscpu           rev             wdctl 
findfs          lslocks         RTC Alarm       whereis 
findmnt         lslogins        runuser         wipefs 
flock           mcookie         script          write 
fsck            mesg            scriptreplay    zramctl 
fsck.cramfs     mkfs            setarch
```

Some of these utilities have been deprecated and will likely fall out of the collection at some point in the future. You should check [Wikipedia's util-linux page][12] for information on many of the utilities, and the man pages also provide details on the commands.

### Summary

These two collections of Linux utilities, the GNU Core Utilities and util-linux, together provide the basic utilities required to administer a Linux system. As I researched this article, I found several interesting utilities I never knew about. Many of these commands are seldom needed, but when you need them, they are indispensable.

Between these two collections, there are over 200 Linux utilities. While Linux has many more commands, these are the ones needed to manage the basic functions of a typical Linux host.

### About the author

[![](https://opensource.com/sites/default/files/styles/profile_pictures/public/david-crop.jpg?itok=oePpOpyV)][13]

David Both \- David Both is a Linux and Open Source advocate who resides in Raleigh, North Carolina. He has been in the IT industry for over forty years and taught OS/2 for IBM where he worked for over 20 years. While at IBM, he wrote the first training course for the original IBM PC in 1981. He has taught RHCE classes for Red Hat and has worked at MCI Worldcom, Cisco, and the State of North Carolina. He has been working with Linux and Open Source Software for almost 20 years. David has written articles for... [more about David Both][14]

[More about me][15]

*   [Learn how you can contribute][16]

---

via: [https://opensource.com/article/18/4/gnu-core-utilities][17]

作者: [David Both][18] 选题者: [@lujun9972][19] 译者: [译者ID][20] 校对: [校对者ID][21]

本文由 [LCTT][22] 原创编译，[Linux中国][23] 荣誉推出

[1]: https://pixabay.com/en/tiny-people-core-apple-apple-half-700921/
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.gnu.org/software/coreutils/coreutils.html
[4]: https://opensource.com/life/17/10/top-terminal-emulators?intcmp=7016000000127cYAAQ
[5]: https://opensource.com/article/17/2/command-line-tools-data-analysis-linux?intcmp=7016000000127cYAAQ
[6]: https://opensource.com/downloads/advanced-ssh-cheat-sheet?intcmp=7016000000127cYAAQ
[7]: https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?intcmp=7016000000127cYAAQ
[8]: https://en.wikipedia.org/wiki/History_of_Unix
[9]: https://en.wikipedia.org/wiki/Multics
[10]: https://en.wikipedia.org/wiki/Pointy-haired_Boss
[11]: https://en.wikipedia.org/wiki/GNU_Core_Utilities
[12]: https://en.wikipedia.org/wiki/Util-linux
[13]: https://opensource.com/users/dboth
[14]: https://opensource.com/users/dboth
[15]: https://opensource.com/users/dboth
[16]: https://opensource.com/participate
[17]: https://opensource.com/article/18/4/gnu-core-utilities
[18]: https://opensource.com/users/dboth
[19]: https://github.com/lujun9972
[20]: https://github.com/译者ID
[21]: https://github.com/校对者ID
[22]: https://github.com/LCTT/TranslateProject
[23]: https://linux.cn/
