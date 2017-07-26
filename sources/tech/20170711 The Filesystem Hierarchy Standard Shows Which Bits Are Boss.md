The Filesystem Hierarchy Standard Shows Which Bits Are Boss
============================================================
![linux](http://www.linuxinsider.com/article_images/story_graphics_xlarge/xl-2016-linux-1.jpg)


[**The State of Open Source Software: Year in Review | Webinar**][5]
[][6]Flexera Software's VP of Product Management discusses the compliance and vulnerability events and trends from 2016 impacting organizations using open source software. 
**[Watch Now!][3]**

If you've ever been curious enough to look through your system's root directory ("/"), you may have found yourself a little overwhelmed. Most of the three-letter directory names don't tell you much about what they do, and if you ever needed to make important modifications, it would be tough to know where to look.

I'd like to take those of you who haven't ventured much into your root directory on a brief tour.

### Helpful Tools

Before we embark, here are a couple of tools that are worth getting familiar with, as they will allow you to dig through anything interesting you find on your own later. None of these programs will make any changes to your files.

The most useful tool is "ls" -- it lists the contents of any directory given with a full or relative path (i.e., one starting from the current directory) as an argument.

$ ls  _path_ 

As you progress deeper into the filesystem, it might get cumbersome to type long paths repeatedly, so if you get to that point, you can replace "ls" with "cd" to change the current working directory (the one your terminal is currently "in") to that directory. As with "ls", just give "cd" a directory path as an argument.

$ cd  _path_ 

If you're not sure what kind of file something is, use the "file" command on it by running "file" and the filename as an argument.

$ file  _filename_ 

Finally, if the file seems like it could be human-readable, use "less" to look at it (again, with no fear of making changes). As with the last tool, give a filename as an argument to view it.

$ less  _filename_ 

When you're done scanning through the file, hit "q" to quit, which returns you to your terminal.

### Root Directory Road Trip

Now we can begin our journey. I'm going to proceed in alphabetical order through the directories directly within the root directory. This is by no means an exhaustive catalog, but by the end, we will have hit the highlights.

All of the classifications and functions of the directories we will go over are based on the Linux Filesystem Hierarchy Standard, or FHS. The Linux FHS, maintained by the [Linux Foundation][4], assists designers and developers of distributions and programs by structuring where the various components of their tools should go.

By keeping all of the files, binaries, and manuals in a consistent organization across programs, the FHS makes learning, debugging, or modifying them much easier. Imagine how tedious it would be if instead of using the "man" command to find usage guides, you had to hunt for the manual for every program.

Alphabetically, and structurally, it is fitting that we start with **"/bin"**. This directory is where all the core system binary files containing commands for the shell (the program that interprets terminal instructions) are found. Without the contents of this directory, your system wouldn't do much.

Next is the **"/boot"** directory, where all the stuff your computer needs to boot up is stored. Among these things, the most important ones are your bootloader and kernel. The bootloader is the program that initializes a few basic utilities to allow the boot process to continue. At the end of its initialization, the bootloader loads the kernel, which allows the computer to interface with all other hardware and firmware. From this point, it can proceed to bring the entire operating system online.

The **"/dev"** directory is where file-like objects representing everything your system recognizes as a "device" are stored. These includes obvious devices such as the hardware components of your computer: your keyboard, screen, hard drive, etc.

Additionally, "/dev" contains pseudo-files signifying streams of data that your system treats as "devices." One example is the data that goes in and out of your terminal, which is divided into three "streams." Information it reads coming in is called "standard input." The output of commands or processes is "standard output." Finally, an auxiliary output classified as debugging information is directed to "standard error." Terminals themselves are also found as files here.

**"/etc"** (pronounced like the craft commerce site "Etsy," if you want to impress Linux veterans), is where many programs store their configuration files, which are used to change their settings. Some programs store copies of default configurations here, which are to be copied to another location before modification. Others store the one and only copy of the configuration here and expect users to modify it directly. Many programs reserved for the root user depend on this latter mode of configuration.

The **"/home"** directory is where users' personal files reside. For desktop users, this is where you spend most of your time. For every unprivileged user, there is a directory with corresponding name here.

**"/lib"** is home to the many libraries that your system depends on to run. Many programs employ one or more functions or subroutines that are common across dozens or hundreds of programs. So, instead of each program reproducing every component it needs within its binary, which would result in comparatively massive and inefficient programs, it references one or more of these libraries by making a "library call."

Removable media like USB flash drives or cameras are made accessible in the **"/media"** directory. While it is not present on all systems, it is common in distributions specializing in intuitive desktop systems, like Ubuntu. Media that has storage is "mounted" here, meaning that while the raw stream of bits from the device are found under "/dev", the file objects that users usually interact with are accessible here.

The **"/proc"** directory is a virtual filesystem that dynamically displays system data. What this means is that the system creates the contents of "/proc" on the fly, populating it with files that hold information about the system (such as hardware statistics) that is generated by virtue of running.

**"/tmp"** is, aptly enough, where temporary information like cached data is sent. There's really not much more to it than that.

Most program binaries on modern Linux systems are kept in the **"/usr"**directory. To unify the various directories containing binaries, "/usr" contains a copy of everything in "/bin", "/sbin", and "/lib".

Finally, **"/var"** is where data of "variable" length is kept. The kind of variable-length data found here is generally data that is expected to keep accumulating, like logs and caches. One example is the log your kernel keeps.

To keep your hard drive from filling up and crashing, "/var" has a built in "log rotate" function that deletes old information to make room for new information, maintaining a fixed maximum size.

### Poke Around

As I said, this is definitely not everything you'll find in the root directory, but it is a good start toward figuring out where your system's core functions reside -- and, moreover, what those functions are.

So, if you weren't sure what there was to learn, you probably have plenty of ideas now. If you want an even better idea, poke around in these directories for yourself!

--------------------------------------------------------------------------------

作者简介：

Jonathan Terrasi has been an ECT News Network columnist since 2017. His main interests are computer security (particularly with the Linux desktop), encryption, and analysis of politics and current affairs. He is a full-time freelance writer and musician. His background includes providing technical commentaries and analyses in articles published by the Chicago Committee to Defend the Bill of Rights.

------


via: http://www.linuxinsider.com/story/84658.html

作者：[Jonathan Terrasi ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxinsider.com/perl/mailit/?id=84658
[1]:http://www.linuxinsider.com/story/84658.html?rss=1#
[2]:http://www.linuxinsider.com/perl/mailit/?id=84658
[3]:http://www.linuxinsider.com/story/84658.html?rss=1
[4]:http://www.linuxfoundation.org/
[5]:http://www.linuxinsider.com/story/84658.html?rss=1
[6]:http://www.linuxinsider.com/story/84658.html?rss=1
