[#]: subject: "How To Check Disk Space Usage In Linux Using Ncdu"
[#]: via: "https://ostechnix.com/check-disk-space-usage-linux-using-ncdu/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How To Check Disk Space Usage In Linux Using Ncdu
======
Ncdu - A disk usage analyzer with an ncurses interface.

This guide explains what is **Ncdu**, how to install Ncdu in various Linux distributions and how to **use Ncdu to check disk space usage in Linux and Unix** operating systems with examples.

### What Is Ncdu?

Ncdu, acronym of **NC**urses  **D**isk **U**sage, is a curses-based version of the well-known ‘du’ command. It provides a fast way to see what directories are using the disk space.

Even though there are plenty of tools and ways to analyze the disk usage in Linux, the developer of Ncdu utility is not satisfied with all of them. So, he developed Ncdu using **C** programming language with an ncurses interface.

Ncdu is simple and fast disk usage analyzer which is used to find which directories or files are taking up more space either on a local or remote systems.

Without further ado, let us go ahead and see how to install Ncdu in Linux and learn commonly used Ncdu commands with examples to check disk usage in Linux and Unix-like operating systems.

### Install Ncdu In Linux

**Ncdu** is available in the default repositories of most Linux distributions. So, you can install it using the distribution's default package manager.

To install Ncdu in Alpine Linux:

```
$ sudo apk add ncdu
```

To install Ncdu in Arch Linux, EndevourOS, Manjaro Linux, run::

```
$ sudo pacman -S ncdu
```

To install Ncdu on Fedora, RHEL, CentOS, AlmaLinux, Rocky Linux:

```
$ sudo dnf install ncdu
```

In older RHEL-based systems, use `yum` instead `dnf` :

```
$ sudo yum install ncdu
```

To install Ncdu on SUSE, openSUSE:

```
$ sudo zypper in ncdu
```

To install Ncdu in Debian, Ubuntu, Linux Mint, Pop OS:

```
$ sudo apt install ncdu
```

### Check Disk Space Usage In Linux Using Ncdu

Once installed, run Ncdu command without any options to analyze the disk space usage of your $HOME directory in your Linux box.

```
$ ncdu
```

This command will analyze your HOME directory. After analyzing, it will show you disk usage report, sorted in descending order. Larger items will be displayed on top.

**Sample output:**

![Check Disk Space Usage With Ncdu][1]

Use UP/DOWN arrows (Or **k** and **j** in the keyboard) to move between items.

Press **"i"** to view the details of the selected item.

![Show Information About Selected Item][2]

Press "i" again to close this window.

To view the items inside the selected directory, press **"Right"** arrow or **ENTER** key. It will display the list of files and directories inside the selected directory.

![View Items Inside A Directory][3]

To go back to the parent directory, press **"Left"** arrow.

#### Display Directory Size

As I stated already, when we run Ncdu without any flags, it will show us the disk space usage of the HOME directory. We can also display size of a particular directory by specifying its actual path like below.

```
$ ncdu Downloads/
```

To analyze entire root (/) file system, run:

```
$ sudo ncdu -x /
```

Here, **-x** indicates that only count files and directories on the same filesystem as the directory being scanned. It will avoid scanning the mounted devices.

#### Run Ncdu In Quiet Mode

By default, ncdu will update the output screen **10 times a second** while scanning the directory. This might consume more bandwidth if you are analyzing the disk usage of a remote system.

Fortunately, this will be decreased to once every 2 seconds in **quiet mode**. We can use this feature to save bandwidth over remote connections.

To run the ncdu in quiet mode, use **-q** flag as shown below.

```
$ ncdu -q
```

#### Save Results In A File

Some times, you might want to save the the scanning report and view it later. In such cases, scan a directory and export the results in any archive format for later viewing like below.

```
$ ncdu -1xo- / | gzip >export.gz
```

This command will scan the HOME directory and save the scanning report in a file called **export.gz**.

**Sample output:**

```
/usr/lib/locale/zh_CN.gbk/LC_MESSAGES/SYS_LC_MESSAGES               188375 files
```

You can view it later by running the following command:

```
$ zcat export.gz | ncdu -f-
```

It is also possible to export to a file and browse it once scanning is done:

```
$ ncdu -o- | tee export.file | ncdu -f-
```

#### Analyze Disk Usage Of Remote Linux Systems

To scan a remote system, but browse through the files locally, run:

```
$ ssh -C ostechnix@192.168.1.60 ncdu -o- / | ncdu -f-
```

Here,

* ostechnix is the user name of my remote system.
* 192.168.1.60 is the remote system's IP address.
* -C switch enables compression.

To quit ncdu, press **q**.

### Ncdu Keybindings

Here is the list of available key options in ncdu utility.

* up, k  - Move cursor up.
* down, j  - Move cursor down.
* Right arrow, ENTER key - Open selected directory.
* Left arrow, <, h  - Open parent directory.
* n - Sort by name (ascending/descending).
* s - Sort by size (ascending/descending).
* C - Sort by items (ascending/descending).
* d - Delete selected file or directory.
* t - Toggle dirs before files when sorting.
* g - Show percentage and/or graph.
* a - Toggle between apparent size and disk usage.
* c - Toggle display of child item counts.
* e - Show/hide hidden or excluded files.
* i - Show information about selected item.
* r - Recalculate the current directory.
* b - Spawn shell in current directory.
* q - Quit ncdu.

For more details, read the man pages.

```
$ man ncdu
```

### Conclusion

Now, you know how to analyze and track the disk space usage in Linux using Ncdu. Ncdu is a quite fast utility to check which directories are occupying most in space in your Linux system.

If you find certain directory or file is consuming more space on your hard drive, you can delete or move them safely to another drive to free up the disk space.

**Resource:**

* [Ncdu website][4]

--------------------------------------------------------------------------------

via: https://ostechnix.com/check-disk-space-usage-linux-using-ncdu/

作者：[sk][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/08/Check-Disk-Space-Usage-With-Ncdu.png
[2]: https://ostechnix.com/wp-content/uploads/2022/08/Show-Information-About-Selected-Item.png
[3]: https://ostechnix.com/wp-content/uploads/2022/08/View-Items-Inside-A-Directory.png
[4]: https://dev.yorhel.nl/ncdu
