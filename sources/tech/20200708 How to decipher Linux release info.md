[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to decipher Linux release info)
[#]: via: (https://www.networkworld.com/article/3565432/how-to-decipher-linux-release-info.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to decipher Linux release info
======
Displaying and interpreting information about Linux releases is a bit more complicated than it might seem.
[christin hume / Linux / Modified by IDG Comm.][1] [(CC0)][2]

There’s a lot more to identifying a Linux release than citing a simple version number. Even a quick look at the output from the **uname** command can tell you that. What is all of that information, and what does it tell you?

In this post, we’ll take a closer look at the output from the **uname** command along with release descriptions provided by some other commands and files.

### Using uname

A lot of information is displayed whenever you issue the command **uname -a** in a Linux system terminal window. That's because that little “a” tells the **man** command that you want to see _all_ of the output that the command is able to provide. The resultant display will tell you a lot of different things about the system. In fact, each chunk of information displayed tells you something different about the system.

As an example, the **uname -a** output might look like this:

```
$ uname -a
Linux dragonfly 5.4.0-37-generic #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

While it's probably not much of a temptation, you could retrieve this very same information by using a command that includes all of the **uname** options in the proper order:

```
$ uname -snmrvpio
Linux dragonfly 5.4.0-37-generic #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
```

To break this long string of information into separate chunks, you can use a **for** loop like this that runs through each of the options:

```
$ for option in s n m r v p i o; do echo -n "$option: "; uname -$option; done
s: Linux
n: dragonfly
m: x86_64
r: 5.4.0-37-generic
v: #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020
p: x86_64
i: x86_64
o: GNU/Linux
```

That loops shows what information is provided by which option. The **uname** man page provides descriptions for each option. Here's a list:

```
Linux –- kernel name (option “s”)
dragonfly –- nodename (option “n”)
x86_64 –- machine hardware name (option “m”)
5.4.0-37-generic –- kernel release (option “r”)
#41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020 -- kernel version (option “v”)
x86_64 –- processor (option “p”)
x86_64 –- hardware platform (option “i”)
GNU/Linux –- operating system (option “o”)
```

To delve a little more deeply into the information being displayed, take a closer look at the kernel release data shown. That **5.4.0-37** in the 4th line is not just a string of arbitrary numbers. Each numeric value is significant.

  * **5** is the kernel version
  * **4** signifies the major revision
  * **0** indicates the minor revision
  * **37** represents the most recent patch



In addition, that **#41** in the 5th line of the loop output (kernel version) indicates that this release has been compiled 41 times.

Individual options can be useful when and if you want to display only one piece of all the available information. For example, the command **uname -n** can tell you just the name of the system and **uname -r** will show you just the kernel release. These and other options can be useful when you're taking inventory of your servers or building scripts.

The same variety of information will be provided by the **uname -a** command when working on Red Hat systems. Here’s an example:

```
$ uname -a
Linux fruitfly 4.18.0-107.el8.x86_64 #1 SMP Fri Jun 14 13:46:34 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux
```

### Distribution release information

If you need to know what version of a distribution you’re running, the **uname** output isn’t going to help you much. The kernel version is, after all, not the same as the distribution version. For that information, you can use the **lsb_release -r** command on Ubuntu and other Debian-based systems and display the contents of the **/etc/redhat-release** file for Red Hat.

For Debian systems:

```
$ lsb_release -r
Release: 20.04
```

For Red Hat and related systems:

```
$ cat /etc/redhat-release
Red Hat Enterprise Linux release 8.1 Beta (Ootpa)
```

### Using /proc/version

The **/proc/version** file can also provide information on your Linux release. The information provided in this file has a lot in common with the **uname -a** output. Here are some examples.

On Ubuntu**:**

```
$ cat /proc/version
Linux version 5.4.0-37-generic (buildd@lcy01-amd64-001) (gcc version 9.3.0 (Ubuntu 9.3.0-10ubuntu2)) #41-Ubuntu SMP Wed Jun 3 18:57:02 UTC 2020
```

On RedHat:

```
$ cat /proc/version
Linux version 4.18.0-107.el8.x86_64 (mockbuild@x86-vm-09.build.eng.bos.redhat.com) (gcc version 8.3.1 20190507 (Red Hat 8.3.1-4) (GCC)) #1 SMP Fri Jun 14 13:46:34 UTC 2019
```

### Wrap-Up

Linux systems provide a lot of information on the kernel and distributions installed. You just have to know where or how to look and make sense of what it means.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3565432/how-to-decipher-linux-release-info.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/mfB1B1s4sMc
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
