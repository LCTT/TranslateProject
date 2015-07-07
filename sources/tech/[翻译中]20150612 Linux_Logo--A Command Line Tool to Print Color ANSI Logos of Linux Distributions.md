[translating by KevinSJ]
Linux_Logo – A Command Line Tool to Print Color ANSI Logos of Linux Distributions
================================================================================
linuxlogo or linux_logo is a Linux command line utility that generates a color ANSI picture of Distribution logo with a few system information.

![Linux_Logo - Prints Color ANSI Logs of Linux Distro](http://www.tecmint.com/wp-content/uploads/2015/06/Linux_Logo.png)

Linux_Logo – Prints Color ANSI Logs of Linux Distro

This utility obtains System Information from /proc Filesystem. linuxlogo is capable of showing color ANSI image of various logos other than the host distribution logo.

The System information associated with logo includes – Linux Kernel Version, Time when Kernel was last Compiled, Number/core of processor, Speed, Manufacturer and processor Generation. It also show information about total physical RAM.

It is worth mentioning here that screenfetch is another tool of similar kind, which shows distribution logo and a more detailed and formatted system inform http://www.tecmint.com/screenfetch-system-information-generator-for-linux/ation. We have already covered screenfetch long ago, which you may refer at:

- [ScreenFetch – Generates Linux System Information][15]

linux_logo and Screenfetch should not be compared to each other. While the output of screenfetch is more formatted and detailed, where linux_logo produce maximum number of color ANSI diagram, and option to format the output.

linux_logo is written primarily in C programming Language, which displays linux logo in an X Window System and hence User Interface X11 aka X Window System should be installed. The software is released under GNU General Public License Version 2.0.

For the purpose of this article, we’re using following testing environment to test the linux_logo utility.

    Operating System : Debian Jessie
    Processor : i3 / x86_64

### Installing Linux Logo Utility in Linux ###

**1. The linuxlogo package (stable version 5.11) is available to install from default package repository under all Linux distributions using apt, yum or dnf package manager as shown below.**

    # apt-get install linux_logo			[On APT based Systems]
    # yum install linux_logo			[On Yum based Systems]
    # dnf install linux_logo			[On DNF based Systems]
    OR
    # dnf install linux_logo.x86_64			[For 64-bit architecture]

**2. Once linuxlogo package has been installed, you can run the command `linuxlogo` to get the default logo for the distribution you are using..**

    # linux_logo
    OR
    # linuxlogo

![Get Default OS Logo](http://www.tecmint.com/wp-content/uploads/2015/06/Get-Default-OS-Logo.png)

Get Default OS Logo

**3. Use the option `[-a]`, not to print any fancy color. Useful if viewing linux_logo over black and white terminal.**

    # linux_logo -a

![Black and White Linux Logo](http://www.tecmint.com/wp-content/uploads/2015/06/Black-and-White-Linux-Logo.png)

Black and White Linux Logo

**4. Use option `[-l]` to print LOGO only and exclude all other System Information.**

# linux_logo -l

![Print Distribution Logo](http://www.tecmint.com/wp-content/uploads/2015/06/Print-Distribution-Logo.png)

Print Distribution Logo

**5. The `[-u]` switch will display system uptime.**

    # linux_logo -u

![Print System Uptime](http://www.tecmint.com/wp-content/uploads/2015/06/Print-System-Uptime.png)

Print System Uptime

**6. If you are interested in Load Average, use option `[-y]`. You may use more than one option at a time.**

    # linux_logo -y

![Print System Load Average](http://www.tecmint.com/wp-content/uploads/2015/06/Print-System-Load-Average.png)

Print System Load Average

For more options and help on them, you may like to run.

    # linux_logo -h

![Linuxlogo Options and Help](http://www.tecmint.com/wp-content/uploads/2015/06/linuxlogo-options.png)

Linuxlogo Options and Help

**7. There are a lots of built-in Logos for various Linux distributions. You may see all those logos using option `-L list` switch.**

    # linux_logo -L list

![List of Linux Logos](http://www.tecmint.com/wp-content/uploads/2015/06/List-of-Linux-Logos.png)

List of Linux Logos

Now you want to print any of the logo from the list, you may use `-L NUM` or `-L NAME` to display selected logo.

- -L NUM – will print logo with number NUM (deprecated).
- -L NAME – will print the logo with name NAME.

For example, to display AIX Logo, you may use command as:

    # linux_logo -L 1
    OR
    # linux_logo -L aix

![Print AIX Logo](http://www.tecmint.com/wp-content/uploads/2015/06/Print-AIX-Logo.png)

Print AIX Logo

**Notice**: The `-L 1` in the command where 1 is the number at which AIX logo appears in the list, where `-L aix` is the name at which AIX logo appears in the list.

Similarly, you may print any logo using these options, few examples to see..

    # linux_logo -L 27
    # linux_logo -L 21

![Various Linux Logos](http://www.tecmint.com/wp-content/uploads/2015/06/Various-Linux-Logos.png)

Various Linux Logos

This way, you can use any of the logos just by using the number or name, that is against it.

### Some Useful Tricks of Linux_logo ###

**8. You may like to print your Linux distribution logo at login. To print default logo at login you may add the below line at the end of `~/.bashrc` file.**

    if [ -f /usr/bin/linux_logo ]; then linux_logo; fi

**Notice**: If there isn’t any` ~/.bashrc` file, you may need to create one under user home directory.

**9. After adding above line, just logout and re-login again to see the default logo of your Linux distribution.**

![Print Logo on User Login](http://www.tecmint.com/wp-content/uploads/2015/06/Print-Logo-on-Login.png)

Print Logo on User Login

Also note, that you may print any logo, after login, simply by adding the below line.

    if [ -f /usr/bin/linux_logo ]; then linux_logo -L num; fi

**Important**: Don’t forget to replace num with the number that is against the logo, you want to use.

**10. You can also print your own logo by simply specifying the location of the logo as shown below.**

    # linux_logo -D /path/to/ASCII/logo

**11. Print logo on Network Login.**

    # /usr/local/bin/linux_logo > /etc/issue.net

You may like to use ASCII logo if there is no support for color filled ANSI Logo as:

    # /usr/local/bin/linux_logo -a > /etc/issue.net

**12. Create a Penguin port – A set of port to answer connection. To create Penguin port Add the below line to file /etc/services file.**

    penguin	4444/tcp	penguin

Here ‘4444‘ is the port number which is currently free and not used by any resource. You may use a different port.

Also add the below line to file /etc/inetd.conf file.

    penguin	stream	     tcp	nowait	root /usr/local/bin/linux_logo 

Restart the service inetd as:

    # killall -HUP inetd

Moreover linux_logo can be used in bootup script to fool the attacker as well as you can play a prank with your friend. This is a nice tool and I might use it in some of my scripts to get output as per distribution basis.

Try it once and you won’t regret. Let us know what you think of this utility and how it can be useful for you. Keep Connected! Keep Commenting. Like and share us and help us get spread.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux_logo-tool-to-print-color-ansi-logos-of-linux/

作者：[Avishek Kumar][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/screenfetch-system-information-generator-for-linux/
