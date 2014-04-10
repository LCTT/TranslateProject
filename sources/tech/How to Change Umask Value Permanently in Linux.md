How to Change Umask Value Permanently in Linux
================================================================================
![](http://i1-news.softpedia-static.com/images/news2/How-to-Change-Umask-Value-Permanently-in-Linux-435026-2.jpg)

**The following tutorial will teach all Linux users how to permanently change the Umask value in their operating systems. It is recommended especially for fresh installations (see below why).**

What is Umask? Well, we can tell you that UMASK stands for User Mask or User file-creation MASK, and it is the default permissions base used for newly created files and folders.

The above translates into the ability of any Linux-based operating system to add a default set of permissions for new files (including folders). For educational purposes, here are the octal values that can be used to set permissions to files:

    0 – Read, Write, Execute (rwx)
    1 – Read and Write (rw-)
    2 – Read and Execute (r-x)
    3 – Read only (r--)
    4 – Write and Execute (-wx)
    5 – Write only (-w-)
    6 – Execute only (--x)
    7 – No permissions (---)

The default Umask value in almost all Linux distributions is 0022 (022) and can be viewed from a terminal emulator by running the umask command. It can be temporarily changed by running a “umask octal_value” command (e.g. umask 027).

As you might know, the default set of permissions for newly created files is 0666, and for newly created directories is 0777. Applying the Umask value to the above will result in the 644 and 755 permissions.

Many consider the 022 value as a privacy issue. This means that all the files that you create on your system will be readable by other users, which is not so cool if you think about it.

Getting down to business, one can change the default Umask value to anything he or she wants, as long as it’s supported, of course. To do that, **write a new Umask value in your shell’s configuration file (~/.bashrc for Bash) or in the /etc/profile file**.

That’s it! From now on, any new file or folder that you create on your Linux system will have that exact set of permissions. However, please keep in mind that the permissions of existing files and folders will not be changed by the above action.

If you are used to the command-line, you can see the current permissions of files by running the ls -lah command in any directory you want. On the other hand, novices can easily view permissions of files by right clicking on them and going to Properties -> Persmissions tab under the GNOME desktop environment.

Do not hesitate to drop a comment below if you encounter any issues with this tutorial.

--------------------------------------------------------------------------------

via: http://news.softpedia.com/news/How-to-Change-Umask-Value-Permanently-in-Linux-435026.shtml

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出