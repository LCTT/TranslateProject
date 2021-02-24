[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Check Your Disk Usage Using ‘duf’ Terminal Tool [Friendly Alternative to du and df commands])
[#]: via: (https://itsfoss.com/duf-disk-usage/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

Check Your Disk Usage Using ‘duf’ Terminal Tool [Friendly Alternative to du and df commands]
======

_**Brief: duf is a terminal tool meant as an enhancement to the traditional “df” and “du” Linux commands. It lets you easily check for free disk space, sort the output, and present it in a user-friendly manner.**_

### duf: A Cross-Platform disk usage utility written in Golang

![][1]

Before I knew about this utility, I preferred using a GUI program like [Stacer][2] or the pre-installed GNOME Disk usage app to [check free disk space][3] and the disk usage numbers for my system.

However, [duf][4] seems to be a useful terminal tool to check disk usage and free space that is written in [Golang][5]. Even though Abhishek suggested me to give this a try, I found it more interesting, especially considering that I’m currently learning Golang, what a coincidence!

It is fairly easy to use no matter whether you are a terminal guru or just a beginner not comfortable with the terminal. It is certainly easier to understand than the [df command for checking disk space utilization][6].

Let me highlight some of the key features and its usage before you get it installed on your system.

### Features of duf

![][7]

  * Gives you an overview of all the devices mounted which is easy to understand
  * Ability to specify a directory/file name and check free space for that mount point
  * Change/Remove columns from the output
  * List [inode][8] information
  * Sort the output
  * JSON output supported
  * Ability to specify the theme if it does not detect your terminal’s theme automatically



### Installing &amp; Using duf on Linux

You can find a package for Arch Linux in [AUR][9]. There’s also a package available if you’re using the [Nix package manager][10].

For Debian-based distros and RPM packages, you can go to its [GitHub releases section][11] and grab the package suitable for your system.

It’s also available for Windows, Android, macOS, and FreeBSD as well.

In my case, I had to [install the DEB package][12], and it was good to go. Once you set it up, using it is quite simple, all you have to do is type in:

```
duf
```

This should give you the details for all the local devices, any cloud storage devices mounted, and any other special devices (that includes temporary storage locations and more).

If you want to take a look at all the available commands using **duf** at a glance, you can type in:

```
duf --help
```

![][13]

For instance, if you just want to see the details of the local devices connected and nothing else, all you have to type is:

```
duf --only local
```

Another example would be sorting the output based on the size in a particular order, here’s what you need to type:

```
duf --sort size
```

And, the output should look like:

![][14]

You can explore its [GitHub page][4] for more information on additional commands and installation instructions.

[Download duf][4]

### Closing Thoughts

I find the terminal tool ‘duf’ quite handy to keep an eye on the free disk space or the usage stats without needing to use a GUI program.

Is there anything similar to this tool that you know of? Feel free to let me know your thoughts in the comments down below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/duf-disk-usage/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-screenshot.jpg?resize=800%2C481&ssl=1
[2]: https://itsfoss.com/optimize-ubuntu-stacer/
[3]: https://itsfoss.com/check-free-disk-space-linux/
[4]: https://github.com/muesli/duf
[5]: https://golang.org/
[6]: https://linuxhandbook.com/df-command/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-local.jpg?resize=800%2C195&ssl=1
[8]: https://linuxhandbook.com/inode-linux/
[9]: https://itsfoss.com/aur-arch-linux/
[10]: https://github.com/NixOS/nixpkgs
[11]: https://github.com/muesli/duf/releases
[12]: https://itsfoss.com/install-deb-files-ubuntu/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-commands.jpg?resize=800%2C443&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/02/duf-sort-example.jpg?resize=800%2C365&ssl=1
