FSSLC Translating !

Cleaning up Ubuntu 14.10,14.04,13.10 system
================================================================================
We have already discussed [Cleaning up a Ubuntu GNU/Linux system][1] and this tutorial is updated with new ubuntu versions and more tools added.

If you want to clean your ubuntu machine you need to follow these simple steps to remove all unnecessary junk files.

### Remove partial packages ###

This is yet another built-in feature, but this time it is not used in Synaptic Package Manager. It is used in the Terminal. Now, in the Terminal, key in the following command

    sudo apt-get autoclean

Then enact the package clean command. What this commnad does is to clean remove .deb packages that apt caches when you install/update programs. To use the clean command type the following in a terminal window:

    sudo apt-get clean

You can then use the autoremove command. What the autoremove command does is to remove packages installed as dependencies after the original package is removed from the system. To use autoremove tye the following in a terminal window:

    sudo apt-get autoremove

### Remove unnecessary locale data ###

For this we need to install localepurge.Automagically remove unnecessary locale data.This is just a simple script to recover diskspace wasted for unneeded locale files and localized man pages. It will automagically be invoked upon completion of any apt installation run.

Install localepurge in Ubuntu

    sudo apt-get install localepurge

After installing anything with apt-get install, localepurge will remove all translation files and translated man pages in languages you cannot read.

If you want to configure localepurge you need to edit /etc/locale.nopurge

This can save you several megabytes of disk space, depending on the packages you have installed.

Example:-

I am trying to install dicus using apt-get

sudo apt-get install discus

after end of this installation you can see something like below

localepurge: Disk space freed in /usr/share/locale: 41860K

### Remove "orphaned" packages ###

If you want to remove orphaned packages you need to install deborphan package.

Install deborphan in Ubuntu

    sudo apt-get install deborphan

### Using deborphan ###

Open Your terminal and enter the following command

    sudo deborphan | xargs sudo apt-get -y remove --purge

### Remove "orphaned" packages Using GtkOrphan ###

GtkOrphan (a Perl/Gtk2 application for debian systems) is a graphical tool which analyzes the status of your installations, looking for orphaned libraries. It implements a GUI front-end for deborphan, adding the package-removal capability.

### Install GtkOrphan in Ubuntu ###

Open the terminal and run the following command

    sudo apt-get install gtkorphan

#### Screenshot ####

![](http://www.ubuntugeek.com/wp-content/uploads/2015/01/41.png)

### Remove Orphan packages using Wajig ###

simplified Debian package management front end.Wajig is a single commandline wrapper around apt, apt-cache, dpkg,/etc/init.d scripts and more, intended to be easy to use and providing extensive documentation for all of its functions.

With a suitable sudo configuration, most (if not all) package installation as well as creation tasks can be done from a user shell. Wajig is also suitable for general system administration.A Gnome GUI command ‘gjig' is also included in the package.

### Install Wajig in Ubuntu ###

Open the terminal and run the following command

    sudo apt-get install wajig

### Debfoster --- Keep track of what you did install ###

debfoster maintains a list of installed packages that were explicitly requested rather than installed as a dependency. Arguments are entirely optional, debfoster can be invoked per se after each run of dpkg and/or apt-get.

Alternatively you can use debfoster to install and remove packages by specifying the packages on the command line. Packages suffixed with a --- are removed while packages without a suffix are installed.

If a new package is encountered or if debfoster notices that a package that used to be a dependency is now an orphan, it will ask you what to do with it. If you decide to keep it, debfoster will just take note and continue. If you decide that this package is not interesting enough it will be removed as soon as debfoster is done asking questions. If your choices cause other packages to become orphaned more questions will ensue.

### Install debfoster in Ubuntu ###

Open the terminal and run the following command

    sudo apt-get install debfoster

### Using debfoster ###

to create the initial keepers file use the following command

    sudo debfoster -q

you can always edit the file /var/lib/debfosterkeepers which defines the packages you want to remain on your system.

to edit the keepers file type

    sudo vi /var/lib/debfoster/keepers

To force debfoster to remove all packages that aren't listed in this list or dependencies of packages that are listed in this list.It will also add all packages in this list that aren't installed. So it makes your system comply with this list. Do this

    sudo debfoster -f

To keep track of what you installed additionally do once in a while :

    sudo debfoster

### xdiskusage -- Check where the space on your hard drive goes ###

Displays a graphic of your disk usage with du.xdiskusage is a user-friendly program to show you what is using up all your disk space. It is based on the design of the "xdu" program written by Phillip C. Dykstra. Changes have been made so it runs "du" for you, and can display the free space left on the disk, and produce a PostScript version of the display.xdiskusage is nice if you want to easily see where the space on your hard drive goes.

### Install xdiskusage in Ubuntu ###

    sudo apt-get install xdiskusage

If you want to open this application you need to use the following command

    sudo xdiskusage

![](http://www.ubuntugeek.com/wp-content/uploads/2015/01/5.png)

Once it opens you should see similar to the following screen

### Bleachbit ###

BleachBit quickly frees disk space and tirelessly guards your privacy. Free cache, delete cookies, clear Internet history, shred temporary files, delete logs, and discard junk you didn't know was there. Designed for Linux and Windows systems, it wipes clean a thousand applications including Firefox, Internet Explorer, Adobe Flash, Google Chrome, Opera, Safari,and more. Beyond simply deleting files, BleachBit includes advanced features such as shredding files to prevent recovery, wiping free disk space to hide traces of files deleted by other applications, and vacuuming Firefox to make it faster. Better than free, BleachBit is open source.

### Install Bleachbit in ubuntu ###

Open the terminal and run the following command

    sudo apt-get install bleachbit

![](http://www.ubuntugeek.com/wp-content/uploads/2015/01/6.png)

### Using Ubuntu-Tweak ###

You can also Use [Ubuntu-Tweak][2] To clean up your system

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/cleaning-up-a-ubuntu-gnulinux-system-updated-with-ubuntu-14-10-and-more-tools-added.html

作者：[ruchi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://www.ubuntugeek.com/cleaning-up-all-unnecessary-junk-files-in-ubuntu.html
[2]:http://www.ubuntugeek.com/www.ubuntugeek.com/install-ubuntu-tweak-on-ubuntu-14-10.html
