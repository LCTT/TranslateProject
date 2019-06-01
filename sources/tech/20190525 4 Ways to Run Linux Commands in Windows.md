[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (4 Ways to Run Linux Commands in Windows)
[#]: via: (https://itsfoss.com/run-linux-commands-in-windows/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

4 Ways to Run Linux Commands in Windows
======

_**Brief: Want to use Linux commands but don’t want to leave Windows? Here are several ways to run Linux bash commands in Windows.**_

If you are learning Shell scripting probably as a part of your course curriculum, you need to use Linux commands to practice the commands and scripting.

Your school lab might have Linux installed but personally you don’t have a [Linux laptop][1] but the regular Windows computer like everyone else. Your homework needs to run Linux commands and you wonder how to run Bash commands and scripts on Windows.

You can [install Linux alongside Windows in dual boot mode][2]. This method allows you to choose either Linux or Windows when you start your computer. But taking all the trouble to mess with partitions for the sole purpose of running Linux command may not be for everyone.

You can also [use Linux terminals online][3] but your work won’t be saved here.

The good news is that there are several ways you can run Linux commands inside Windows, like any regular application. Isn’t it cool?

### Using Linux commands inside Windows

![][4]

As an ardent Linux user and promoter, I would like to see more and more people using ‘real’ Linux but I understand that at times, that’s not the priority. If you are just looking to practice Linux to pass your exams, you can use one of these methods for running Bash commands on Windows.

#### 1\. Use Linux Bash Shell on Windows 10

Did you know that you can run a Linux distribution inside Windows 10? The [Windows Subsystem for Linux (WSL)][5] allows you to run Linux inside Windows. The upcoming version of WSL will be using the real Linux kernel inside Windows.

This WSL, also called Bash on Windows, gives you a Linux distribution in command line mode running as a regular Windows application. Don’t be scared with the command line mode because your purpose is to run Linux commands. That’s all you need.

![Ubuntu Linux inside Windows][6]

You can find some popular Linux distributions like Ubuntu, Kali Linux, openSUSE etc in Windows Store. You just have to download and install it like any other Windows application. Once installed, you can run all the Linux commands you want.

[][7]

Suggested read 6 Non-Ubuntu Linux Distributions For Beginners

![Linux distributions in Windows 10 Store][8]

Please refer to this tutorial about [installing Linux bash shell on Windows][9].

#### 2\. Use Git Bash to run Bash commands on Windows

You probably know what [Git][10] is. It’s a version control system developed by [Linux creator Linus Torvalds][11].

[Git for Windows][12] is a set of tools that allows you to use Git in both command line and graphical interfaces. One of the tools included in Git for Windows is Git Bash.

Git Bash application provides and emulation layer for Git command line. Apart from Git commands, Git Bash also supports many Bash utilities such as ssh, scp, cat, find etc.

![Git Bash][13]

In other words, you can run many common Linux/Bash commands using the Git Bash application.

You can install Git Bash in Windows by downloading and installing the Git for Windows tool for free from its website.

[Download Git for Windows][12]

#### 3\. Using Linux commands in Windows with Cygwin

If you want to run Linux commands in Windows, Cygwin is a recommended tool. Cygwin was created in 1995 to provide a POSIX-compatible environment that runs natively on Windows. Cygwin is a free and open source software maintained by Red Hat employees and many other volunteers.

For two decades, Windows users use Cygwin for running and practicing Linux/Bash commands. Even I used Cygwin to learn Linux commands more than a decade ago.

![Cygwin | Image Credit][14]

You can download Cygwin from its official website below. I also advise you to refer to this [Cygwin cheat sheet][15] to get started with it.

[Download Cygwin][16]

#### 4\. Use Linux in virtual machine

Another way is to use a virtualization software and install Linux in it. This way, you install a Linux distribution (with graphical interface) inside Windows and run it like a regular Windows application.

This method requires that your system has a good amount of RAM, at least 4 GB but better if you have over 8 GB of RAM. The good thing here is that you get the real feel of using a desktop Linux. If you like the interface, you may later decide to [switch to Linux][17] completely.

![Ubuntu Running in Virtual Machine Inside Windows][18]

There are two popular tools for creating virtual machines on Windows, Oracle VirtualBox and VMware Workstation Player. You can use either of the two. Personally, I prefer VirtualBox.

[][19]

Suggested read 9 Simple Ways To Free Up Space On Ubuntu and Linux Mint

You can follow [this tutorial to learn how to install Linux in VirtualBox][20].

**Conclusion**

The best way to run Linux commands is to use Linux. When installing Linux is not an option, these tools allow you to run Linux commands on Windows. Give them a try and see which method is best suited for you.

--------------------------------------------------------------------------------

via: https://itsfoss.com/run-linux-commands-in-windows/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/get-linux-laptops/
[2]: https://itsfoss.com/guide-install-linux-mint-16-dual-boot-windows/
[3]: https://itsfoss.com/online-linux-terminals/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/05/run-linux-commands-in-windows.png?resize=800%2C450&ssl=1
[5]: https://itsfoss.com/bash-on-windows/
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2016/08/install-ubuntu-windows-10-linux-subsystem-10.jpeg?resize=800%2C268&ssl=1
[7]: https://itsfoss.com/non-ubuntu-beginner-linux/
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2016/08/install-ubuntu-windows-10-linux-subsystem-4.jpeg?resize=800%2C632&ssl=1
[9]: https://itsfoss.com/install-bash-on-windows/
[10]: https://itsfoss.com/basic-git-commands-cheat-sheet/
[11]: https://itsfoss.com/linus-torvalds-facts/
[12]: https://gitforwindows.org/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/05/git-bash.png?ssl=1
[14]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/cygwin-shell.jpg?ssl=1
[15]: http://www.voxforge.org/home/docs/cygwin-cheat-sheet
[16]: https://www.cygwin.com/
[17]: https://itsfoss.com/reasons-switch-linux-windows-xp/
[18]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/05/ubuntu-running-in-virtual-machine-inside-windows.jpeg?resize=800%2C450&ssl=1
[19]: https://itsfoss.com/free-up-space-ubuntu-linux/
[20]: https://itsfoss.com/install-linux-in-virtualbox/
