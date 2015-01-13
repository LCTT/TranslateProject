How to Find and Remove Duplicate Files on Linux
================================================================================
Hi all, today we're gonna learn how to find and remove duplicate files on you Linux PC or Server. So, here's a tool that you may use anyone of them according to your needs and comfort.

Whether you’re using Linux on your desktop or a server, there are good tools that will scan your system for duplicate files and help you remove them to free up space. Solid graphical and command-line interfaces are both available. Duplicate files are an unnecessary waste of disk space. After all, if you really need the same file in two different locations you could always set up a symbolic link or hard link, storing the data in only one location on disk.

### FSlint ###

[FSlint][1] is available in various Linux distributions binary repository, including Ubuntu, Debian, Fedora, and Red Hat. Just fire up your package manager and install the “fslint” package. This utility provides a convenient graphical interface by default and it also includes command-line versions of its various functions.

Don’t let that scare you away from using FSlint’s convenient graphical interface, though. By default, it opens with the Duplicates pane selected and your home directory as the default search path.

To install fslint, as I am running ubuntu, here is the default command:

    $ sudo apt-get install fslint

But here are installation commands for other linux distributions:

Debian:

    svn checkout http://fslint.googlecode.com/svn/trunk/ fslint-2.45
    cd fslint-2.45
    dpkg-buildpackage -I.svn -rfakeroot -tc
    sudo dpkg -i ../fslint_2.45-1_all.deb

Fedora:

    sudo yum install fslint

For OpenSuse:

    [ -f /etc/mandrake-release ] && pkg=rpm
    [ -f /etc/SuSE-release ] && pkg=packages
    wget http://www.pixelbeat.org/fslint/fslint-2.42.tar.gz
    sudo rpmbuild -ta fslint-2.42.tar.gz
    sudo rpm -Uvh /usr/src/$pkg/RPMS/noarch/fslint-2.42-1.*.noarch.rpm

For Other Distro:

    wget http://www.pixelbeat.org/fslint/fslint-2.44.tar.gz
    tar -xzf fslint-2.44.tar.gz
    cd fslint-2.44
    (cd po && make)
    ./fslint-gui

To run fslint in GUI version run fslint-gui in Ubuntu, run command (Alt+F2) or terminal:

    $ fslint-gui

By default, it opens with the Duplicates pane selected and your home directory as the default search path. All you have to do is click the Find button and FSlint will find a list of duplicate files in directories under your home folder.

![Delete Duplicate files with Fslint](http://blog.linoxide.com/wp-content/uploads/2015/01/delete-duplicates-fslint.png)

Use the buttons to delete any files you want to remove, and double-click them to preview them.

Finally, you are done. Hurray, we have sucessfully removed duplicate files from your system.

**Note** that the command-line utilities aren’t in your path by default, so you can’t run them like typical commands. On Ubuntu, you’ll find them under /usr/share/fslint/fslint. So, if you wanted to run the entire fslint scan on a single directory, here are the commands you’d run on Ubuntu:

    cd /usr/share/fslint/fslint
    
    ./fslint /path/to/directory

**This command won’t actually delete anything. It will just print a list of duplicate files — you’re on your own for the rest.**

    $ /usr/share/fslint/fslint/findup --help
    find dUPlicate files.
    Usage: findup [[[-t [-m|-d]] | [--summary]] [-r] [-f] paths(s) ...]
    
    If no path(s) specified then the current directory is assumed.
    
    When -m is specified any found duplicates will be merged (using hardlinks).
    When -d is specified any found duplicates will be deleted (leaving just 1).
    When -t is specfied, only report what -m or -d would do.
    When --summary is specified change output format to include file sizes.
    You can also pipe this summary format to /usr/share/fslint/fslint/fstool/dupwaste
    to get a total of the wastage due to duplicates.

![fslint help](http://blog.linoxide.com/wp-content/uploads/2015/01/fslint-help.png)

--------------------------------------------------------------------------------

via: http://linoxide.com/file-system/find-remove-duplicate-files-linux/

作者：[Arun Pyasi][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linoxide.com/author/arunp/
[1]:http://www.pixelbeat.org/fslint/
[2]:http://www.pixelbeat.org/fslint/fslint-2.42.tar.gz