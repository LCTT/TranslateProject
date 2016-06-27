翻译申请 tresspassing2
Part 12 - LFCS: How to Explore Linux with Installed Help Documentations and Tools
==================================================================================

Because of the changes in the LFCS exam requirements effective Feb. 2, 2016, we are adding the necessary topics to the [LFCS series][1] published here. To prepare for this exam, your are highly encouraged to use the [LFCE series][2] as well.

![](http://www.tecmint.com/wp-content/uploads/2016/03/Explore-Linux-with-Documentation-and-Tools.png)
>LFCS: Explore Linux with Installed Documentations and Tools – Part 12

Once you get used to working with the command line and feel comfortable doing so, you realize that a regular Linux installation includes all the documentation you need to use and configure the system.

Another good reason to become familiar with command line help tools is that in the [LFCS][3] and [LFCE][4] exams, those are the only sources of information you can use – no internet browsing and no googling. It’s just you and the command line.

For that reason, in this article we will give you some tips to effectively use the installed docs and tools in order to prepare to pass the **Linux Foundation Certification** exams.

### Linux Man Pages

A man page, short for manual page, is nothing less and nothing more than what the word suggests: a manual for a given tool. It contains the list of options (with explanation) that the command supports, and some man pages even include usage examples as well.

To open a man page, use the **man command** followed by the name of the tool you want to learn more about. For example:

```
# man diff
```

will open the manual page for `diff`, a tool used to compare text files line by line (to exit, simply hit the q key.).

Let’s say we want to compare two text files named `file1` and `file2` in Linux. These files contain the list of packages that are installed in two Linux boxes with the same distribution and version.

Doing a `diff` between `file1` and `file2` will tell us if there is a difference between those lists:

```
# diff file1 file2
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Compare-Two-Text-Files-in-Linux.png)
>Compare Two Text Files in Linux

where the `<` sign indicates lines missing in `file2`. If there were lines missing in `file1`, they would be indicated by the `>` sign instead.

On the other hand, **7d6** means line **#7** in file should be deleted in order to match `file2` (same with **24d22** and **41d38**), and 65,67d61 tells us we need to remove lines **65** through **67** in file one. If we make these corrections, both files will then be identical.

Alternatively, you can display both files side by side using the `-y` option, according to the man page. You may find this helpful to more easily identify missing lines in files:

```
# diff -y file1 file2
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/Compare-and-List-Difference-of-Two-Files.png)
>Compare and List Difference of Two Files

Also, you can use `diff` to compare two binary files. If they are identical, `diff` will exit silently without output. Otherwise, it will return the following message: “**Binary files X and Y differ**”.

### The –help Option

The `--help` option, available in many (if not all) commands, can be considered a short manual page for that specific command. Although it does not provide a comprehensive description of the tool, it is an easy way to obtain information on the usage of a program and a list of its available options at a quick glance.

For example,

```
# sed --help
```

shows the usage of each option available in sed (the stream editor).

One of the classic examples of using `sed` consists of replacing characters in files. Using the `-i` option (described as “**edit files in place**”), you can edit a file without opening it. If you want to make a backup of the original contents as well, use the `-i` option followed by a SUFFIX to create a separate file with the original contents.

For example, to replace each occurrence of the word `Lorem` with `Tecmint` (case insensitive) in `lorem.txt` and create a new file with the original contents of the file, do:

```
# less lorem.txt | grep -i lorem
# sed -i.orig 's/Lorem/Tecmint/gI' lorem.txt
# less lorem.txt | grep -i lorem
# less lorem.txt.orig | grep -i lorem
```

Please note that every occurrence of `Lorem` has been replaced with `Tecmint` in `lorem.txt`, and the original contents of `lorem.txt` has been saved to `lorem.txt.orig`.

![](http://www.tecmint.com/wp-content/uploads/2016/03/Replace-A-String-in-File.png)
>Replace A String in Files

### Installed Documentation in /usr/share/doc

This is probably my favorite pick. If you go to `/usr/share/doc` and do a directory listing, you will see lots of directories with the names of the installed tools in your Linux system.

According to the [Filesystem Hierarchy Standard][5], these directories contain useful information that might not be in the man pages, along with templates and configuration files to make configuration easier.

For example, let’s consider `squid-3.3.8` (version may vary from distribution to distribution) for the popular HTTP proxy and [squid cache server][6].

Let’s `cd` into that directory:

```
# cd /usr/share/doc/squid-3.3.8
```

and do a directory listing:

```
# ls
```

![](http://www.tecmint.com/wp-content/uploads/2016/03/List-Files-in-Linux.png)
>Linux Directory Listing with ls Command

You may want to pay special attention to `QUICKSTART` and `squid.conf.documented`. These files contain an extensive documentation about Squid and a heavily commented configuration file, respectively. For other packages, the exact names may differ (as **QuickRef** or **00QUICKSTART**, for example), but the principle is the same.

Other packages, such as the Apache web server, provide configuration file templates inside `/usr/share/doc`, that will be helpful when you have to configure a standalone server or a virtual host, to name a few cases.

### GNU info Documentation

You can think of info documents as man pages on steroids. As such, they not only provide help for a specific tool, but also they do so with hyperlinks (yes, hyperlinks in the command line!) that allow you to navigate from a section to another using the arrow keys and Enter to confirm.

Perhaps the most illustrative example is:

```
# info coreutils
```

Since coreutils contains the [basic file, shell and text manipulation utilities][7] which are expected to exist on every operating system, you can reasonably expect a detailed description for each one of those categories in info **coreutils**.

![](http://www.tecmint.com/wp-content/uploads/2016/03/Info-Coreutils.png)
>Info Coreutils

As it is the case with man pages, you can exit an info document by pressing the `q` key.

Additionally, GNU info can be used to display regular man pages as well when followed by the tool name. For example:

```
# info tune2fs
```

will return the man page of **tune2fs**, the ext2/3/4 filesystems management tool.

And now that we’re at it, let’s review some of the uses of **tune2fs**:

Display information about the filesystem on top of **/dev/mapper/vg00-vol_backups**:

```
# tune2fs -l /dev/mapper/vg00-vol_backups
```

Set a filesystem volume name (Backups in this case):

```
# tune2fs -L Backups /dev/mapper/vg00-vol_backups
```

Change the check intervals and `/` or mount counts (use the `-c` option to set a number of mount counts and `/` or the  `-i` option to set a check interval, where **d=days, w=weeks, and m=months**).

```
# tune2fs -c 150 /dev/mapper/vg00-vol_backups # Check every 150 mounts
# tune2fs -i 6w /dev/mapper/vg00-vol_backups # Check every 6 weeks
```

All of the above options can be listed with the `--help` option, or viewed in the man page.

### Summary

Regardless of the method that you choose to invoke help for a given tool, knowing that they exist and how to use them will certainly come in handy in the exam. Do you know of any other tools that can be used to look up documentation? Feel free to share with the Tecmint community using the form below.

Questions and other comments are more than welcome as well.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-basic-shell-scripting-and-linux-filesystem-troubleshooting/

作者：[Gabriel Cánepa][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/gacanepa/
[1]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[2]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[3]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[4]: http://www.tecmint.com/installing-network-services-and-configuring-services-at-system-boot/
[5]: http://www.tecmint.com/linux-directory-structure-and-important-files-paths-explained/
[6]: http://www.tecmint.com/configure-squid-server-in-linux/
[7]: http://www.tecmint.com/sed-command-to-create-edit-and-manipulate-files-in-linux/
[8]: 
