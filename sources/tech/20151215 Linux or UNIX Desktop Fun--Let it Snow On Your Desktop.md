translating---geekpi


Linux / UNIX Desktop Fun: Let it Snow On Your Desktop
================================================================================
Feeling lonely this holiday season? Try Xsnow. This little app will let it snow on the Unix / Linux desktop. Santa and his reindeer will complete your festive season feeling with moving snowflakes on your desktop, with Santa Claus running all over the screen.

I first installed this 13 or 14 years ago. It was was originally created for Macintosh systems in 1984. You can install it as follows:

### Install xsnow ###

Debian / Ubuntu / Mint users type the following command:

    $ sudo apt-get install xsnow

Freebsd users type the following command to install the same:

    # cd /usr/ports/x11/xsnow/
    # make install clean

OR, try to add the package:

    # pkg_add -r xsnow

#### A Note About Other Distros ####

1. Fedora / RHEL / CentOS Linux desktop users may find the package using [rpmfusion][1] repo.
1. Gentoo user try Gentoo portage i.e. [emerge -p xsnow][2]
1. OpenSuse Linux user try Yast and search for xsnow.

### How Do I Use xsnow? ###

Open a command-line terminal (select Applications > Accessories > Terminal), and then type the following to starts xsnow:

    $ xsnow

Sample outputs:

![Fig.01: Snow for your Linux and Unix desktop systems](http://files.cyberciti.biz/uploads/tips/2011/12/application-to-bring-snow-to-desktop_small.png)

Fig.01: Snow for your Linux and Unix desktop systems

You can set the background to a blue color and lets it snow white, type:

    $ xsnow -bg blue -sc snow

To set the maximum number of snowflakes and runs as fast as possible, type:

    $ xsnow -snowflakes 10000 -delay 0

Do not display the trees and Santa Claus running all over the screen, enter:

    $ xsnow -notrees -nosanta

For more information about xsnow and other options, please see the manual page by typing man xsnow from the command line:

    $ man xsnow

Recommended readings:

- [Download Xsnow][1] from the official site.
- Please note that [MS-Windows][2] and [Mac OS X version][3] attracts one time shareware fee.

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/tips/linux-unix-xsnow.html

作者：Vivek Gite 
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[1]:http://rpmfusion.org/Configuration
[2]:http://www.gentoo.org/doc/en/handbook/handbook-x86.xml?part=2&chap=1
[3]:http://dropmix.xs4all.nl/rick/Xsnow/
[4]:http://dropmix.xs4all.nl/rick/WinSnow/
[5]:http://dropmix.xs4all.nl/rick/MacOSXSnow/
