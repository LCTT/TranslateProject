[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Navigating man pages in Linux)
[#]: via: (https://www.networkworld.com/article/3519853/navigating-man-pages-in-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Navigating man pages in Linux
======
The man pages on a Linux system can do more than provide information on particular commands. They can help discover commands you didn't realize were available.
[Hello I'm Nik][1] [(CC0)][2]

Man pages provide essential information on Linux commands and many users refer to them often, but there’s a lot more to the man pages than many of us realize.

You can always type a command like “man who” and get a nice description of how the man command works, but exploring commands that you might not know could be even more illuminating. For example, you can use the man command to help identify commands to handle some unusually challenging task or to show options that can help you use a command you already know in new and better ways.

Let’s navigate through some options and see where we end up.

[MORE ON NETWORK WORLD: Linux: Best desktop distros for newbies][3]

### Using man to identify commands

The man command can help you find commands by topic. If you’re looking for a command to count the lines in a file, for example, you can provide a keyword. In the example below, we’ve put the keyword in quotes and added blanks so that we don’t get commands that deal with “accounts” or “accounting” along with those that do some counting for us.

```
$ man -k ' count '
anvil (8postfix)     - Postfix session count and request rate control
cksum (1)            - checksum and count the bytes in a file
sum (1)              - checksum and count the blocks in a file
timer_getoverrun (2) - get overrun count for a POSIX per-process timer
```

To show commands that relate to new user accounts, we might try a command like this:

```
$ man -k "new user"
newusers (8)         - update and create new users in batch
useradd (8)          - create a new user or update default new user information
zshroadmap (1)       - informal introduction to the zsh manual The Zsh Manual, …
```

Just to be clear, the third item in the list above makes a reference to “new users” liking the material and is not a command for setting up, removing or configuring user accounts. The man command is simply matching words in the command description, acting very much like the apropos command. Notice the numbers in parentheses after each command listed above. These relate to the man page sections that contain the commands.

### Identifying the manual sections

The man command sections divide the commands into categories. To list these categories, type “man man” and look for descriptions like those below. You very likely won’t have Section 9 commands on your system.

[][4]

```
1  Executable programs or shell commands
2  System calls (functions provided by the kernel)
3  Library calls (functions within program libraries)
4  Special files (usually found in /dev)
5  File formats and conventions eg /etc/passwd
6  Games
7  Miscellaneous  (including  macro  packages  and  conventions), e.g.
   man(7), groff(7)
8  System administration commands (usually only for root)
9  Kernel routines [Non standard]
```

Man pages cover more than what we typically think of as “commands”. As you can see from the above descriptions, they cover system calls, library calls, special files and more.

The listing below shows where man pages are actually stored on Linux systems. The dates on these directories will vary because, with updates, some of these sections will get new content while others will not.

```
$ ls -ld /usr/share/man/man?
drwxr-xr-x 2 root root  98304 Feb  5 16:27 /usr/share/man/man1
drwxr-xr-x 2 root root  65536 Oct 23 17:39 /usr/share/man/man2
drwxr-xr-x 2 root root 270336 Nov 15 06:28 /usr/share/man/man3
drwxr-xr-x 2 root root   4096 Feb  4 10:16 /usr/share/man/man4
drwxr-xr-x 2 root root  28672 Feb  5 16:25 /usr/share/man/man5
drwxr-xr-x 2 root root   4096 Oct 23 17:40 /usr/share/man/man6
drwxr-xr-x 2 root root  20480 Feb  5 16:25 /usr/share/man/man7
drwxr-xr-x 2 root root  57344 Feb  5 16:25 /usr/share/man/man8
```

Note that the man page files are generally **gzipped** to save space. The man command unzips them as needed whenever you use the man command.

```
$ ls -l /usr/share/man/man1 | head -10
total 12632
lrwxrwxrwx 1 root root      9 Sep  5 06:38 [.1.gz -> test.1.gz
-rw-r--r-- 1 root root    563 Nov  7 05:07 2to3-2.7.1.gz
-rw-r--r-- 1 root root    592 Apr 23  2016 411toppm.1.gz
-rw-r--r-- 1 root root   2866 Aug 14 10:36 a2query.1.gz
-rw-r--r-- 1 root root   2361 Sep  9 15:13 aa-enabled.1.gz
-rw-r--r-- 1 root root   2675 Sep  9 15:13 aa-exec.1.gz
-rw-r--r-- 1 root root   1142 Apr  3  2018 aaflip.1.gz
-rw-r--r-- 1 root root   3847 Aug 14 10:36 ab.1.gz
-rw-r--r-- 1 root root   2378 Aug 23  2018 ac.1.gz
```

### Listing man pages by section

Even just looking at the first 10 man pages in Section 1 (as shown above), you are likely to see some commands that are new to you – maybe **a2query** or **aaflip** (shown above).

An even better strategy for exploring commands is to list commands by section without looking at the files themselves but, instead, using a man command that shows you the commands and provides a brief description of each.

In the command below, the **-s 1** instructs man to display information on commands in section 1. The **-k .** makes the command work for all commands rather than specifying a particular keyword; without this, the man command would come back and ask “What manual page do you want?” So, use a keyword to select a group of related commands or a dot to show all commands in a section.

```
$ man -s 1 -k .
2to3-2.7 (1)         - Python2 to Python3 converter
411toppm (1)         - convert Sony Mavica .411 image to ppm
as (1)               - the portable GNU assembler.
baobab (1)           - A graphical tool to analyze disk usage
busybox (1)          - The Swiss Army Knife of Embedded Linux
cmatrix (1)          - simulates the display from "The Matrix"
expect_dislocate (1) - disconnect and reconnect processes
red (1)              - line-oriented text editor
enchant (1)          - a spellchecker
…
```

### How many man pages are there?

If you’re curious about how many man pages there are in each section, you can count them by section with a command like this:

```
$ for num in {1..8}
> do
>   man -s $num -k . | wc -l
> done
2382
493
2935
53
441
11
245
919
```

The exact number may vary, but most Linux systems will have a similar number of commands. If we use a command that adds these numbers together, we can see that the system that this command is running on has nearly 7,500 man pages. That’s a lot of commands, system calls, etc.

```
$ for num in {1..8}
> do
>     num=`man -s $num -k . | wc -l`
>     tot=`expr $num + $tot`
>     echo $tot
> done
2382
2875
5810
5863
6304
6315
6560
7479            <=== total
```

There’s a lot you can learn by reading man pages, but exploring them in other ways can help you become aware of commands you may not have known were available on your system.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3519853/navigating-man-pages-in-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/YiRQIglwYig
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.networkworld.com/slideshow/153439/linux-best-desktop-distros-for-newbies.html#tk.nww-infsb
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
