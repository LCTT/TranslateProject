[#]: subject: (Show CPU Details Beautifully in Linux Terminal With CPUFetch)
[#]: via: (https://itsfoss.com/cpufetch/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Show CPU Details Beautifully in Linux Terminal With CPUFetch
======

There are [ways to check CPU information on Linux][1]. Probably the most common is the `lscpu` command that gives you plenty of information about all the CPU cores on your system.

![lscpu command output][2]

You may find CPU information there without installing any additional packages. That works of course. However, I recently stumbled upon a new tool that displays the CPU details in Linux in a beautiful manner.

The ASCII art of the processor manufacturer makes it look cool.

![][3]

This looks beautiful, isn’t it? This is similar to [Neoftech or Screenfetch tools that show the system information in beautiful ASCII art in Linux][4]. Similar to those tools, you can use CPUFetch if you are showcasing your desktop screenshot.

The tool outputs the ASCII art of the processor manufacturer, its name, microarchitecture, frequency, cores, threads, peak performance, cache sizes, [Advanced Vector Extensions][5], and more.

You can use custom colors apart from a few themes it provides. This gives you additional degree of freedom when you are ricing your desktop and want to color match all the elements on your Linux setup.

### Installing CPUFetch on Linux

Unfortunately, CPUFetch is rather new, and it is not included in your distribution’s repository. It doesn’t even provide ready to use DEB/RPM binaries, PPAs, Snap or Flatpak packages.

Arch Linux users can [find][6] it in [AUR][7] but for others, the only way forward here is to [build from source code][8].

Don’t worry. Installation as well as removal is not that complicated. Let me show you the steps.

I am using Ubuntu and you would [need to install Git on Ubuntu first][9]. Some other distributions come preinstalled with it, if not use your distribution’s package manager to install it.

Now, clone the Git repository wherever you want. Home directory is fine as well.

```
git clone https://github.com/Dr-Noob/cpufetch
```

Switch to the directory you just cloned:

```
cd cpufetch
```

You’ll see a make file here. Use it to compile the code.

```
make
```

![CPUFetch Installation][10]

Now you’ll see a new executable file named `cpufetch`. You run this executable to display the CPU information in the terminal.

```
./cpufetch
```

This is what it showed for my system. AMD logo looks a lot cooler in ASCII, don’t you think?

![][11]

How do you remove Cpufetch? It’s pretty simple. When you compiled the code, it produced just one file and that too in the same directory as the rest of the code.

So, to remove CPUFetch from your system, simply remove its entire folder. You know how to [remove a directory in Linux terminal][12], don’t you? Come out of the cpufetch directory and use the rm command:

```
rm -rf cpufetch
```

That was simple, thankfully because removing software installed from source code could be really tricky at times.

Back to cpufetch. I think it’s a utility for those who like to show off their desktop screenshots in various Linux group. Since we have Neofetch for the distribution and CPUFetch for CPU, I wonder if we could have a GPU fetch with ASCII art of Nvidia as well :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/cpufetch/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://linuxhandbook.com/check-cpu-info-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/04/lscpu-command-output.png?resize=800%2C415&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/cpufetch-1.png?resize=800%2C307&ssl=1
[4]: https://itsfoss.com/display-linux-logo-in-ascii/
[5]: https://software.intel.com/content/www/us/en/develop/articles/introduction-to-intel-advanced-vector-extensions.html
[6]: https://aur.archlinux.org/packages/cpufetch-git
[7]: https://itsfoss.com/aur-arch-linux/
[8]: https://itsfoss.com/install-software-from-source-code/
[9]: https://itsfoss.com/install-git-ubuntu/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/cpufetch-installation.png?resize=800%2C410&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/04/cpufetch-for-itsfoss.png?resize=800%2C335&ssl=1
[12]: https://linuxhandbook.com/remove-files-directories/
