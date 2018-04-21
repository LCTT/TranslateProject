Translating by MjSeven


Finding what you’re looking for on Linux
======

![](https://images.idgesg.net/images/article/2018/04/binoculars-100754967-large.jpg)
It isn’t hard to find what you’re looking for on a Linux system — a file or a command — but there are a _lot_ of ways to go looking.

### 7 commands to find Linux files

#### find

The most obvious is undoubtedly the **find** command, and find has become easier to use than it was years ago. It used to require a starting location for your search, but these days, you can also use find with just a file name or regular expression if you’re willing to confine your search to the local directory.
```
$ find e*
empty
examples.desktop

```

In this way, it works much like the **ls** command and isn't doing much of a search.

For more relevant searches, find requires a starting point and some criteria for your search (unless you simply want it to provide a recursive listing of that starting point’s directory. The command **find . -type f** will recursively list all regular files starting with the current directory while **find ~nemo -type f -empty** will find empty files in Nemo’s home directory.
```
$ find ~nemo -type f -empty
/home/nemo/empty

```

**Also on Network world:[11 pointless but awesome Linux terminal tricks][1]**

#### locate

The name of the **locate** command suggests that it does basically the same thing as find, but it works entirely differently. Where the **find** command can select files based on a variety of criteria — name, size, owner, permissions, state (such as empty), etc. with a selectable depth for the search, the **locate** command looks through a file called /var/lib/mlocate/mlocate.db to find what you’re looking for. That db file is periodically updated, so a locate of a file you just created will probably fail to find it. If that bothers you, you can run the updatedb file and get the update to happen right away.
```
$ sudo updatedb

```

#### mlocate

The **mlocate** command works like the **locate** command and uses the same mlocate.db file as locate.

#### which

The **which** command works very differently than the **find** and **locate** commands. It uses your search path and checks each directory on it for an executable with the file name you’re looking for. Once it finds one, it stops searching and displays the full path to that executable.

The primary benefit of the **which** command is that it answers the question, “If I enter this command, what executable file will be run?” It ignores files that aren’t executable and doesn’t list all executables on the system with that name — just the one that it finds first. If you wanted to find _all_ executables that have some name, you could run a find command like this, but it might take considerably longer to run the very efficient **which** command.
```
$ find / -name locate -perm -a=x 2>/dev/null
/usr/bin/locate
/etc/alternatives/locate

```

In this find command, we’re looking for all executables (files that cen be run by anyone) named “locate”. We’re also electing not to view all of the “Permission denied” messages that would otherwise clutter our screens.

#### whereis

The **whereis** command works a lot like the **which** command, but it provides more information. Instead of just looking for executables, it also looks for man pages and source files. Like the **which** command, it uses your search path ($PATH) to drive its search.
```
$ whereis locate
locate: /usr/bin/locate /usr/share/man/man1/locate.1.gz

```

#### whatis

The **whatis** command has its own unique mission. Instead of actually finding files, it looks for information in the man pages for the command you are asking about and provides the brief description of the command from the top of the man page.
```
$ whatis locate
locate (1) - find files by name

```

If you ask about a script that you’ve just set up, it won’t have any idea what you’re referring to and will tell you so.
```
$ whatis cleanup
cleanup: nothing appropriate.

```

#### apropos

The **apropos** command is useful when you know what you want to do, but you have no idea what command you should be using to do it. If you were wondering how to locate files, for example, the commands “apropos find” and “apropos locate” would have a lot of suggestions to offer.
```
$ apropos find
File::IconTheme (3pm) - find icon directories
File::MimeInfo::Applications (3pm) - Find programs to open a file by mimetype
File::UserDirs (3pm) - find extra media and documents directories
find (1) - search for files in a directory hierarchy
findfs (8) - find a filesystem by label or UUID
findmnt (8) - find a filesystem
gst-typefind-1.0 (1) - print Media type of file
ippfind (1) - find internet printing protocol printers
locate (1) - find files by name
mlocate (1) - find files by name
pidof (8) - find the process ID of a running program.
sane-find-scanner (1) - find SCSI and USB scanners and their device files
systemd-delta (1) - Find overridden configuration files
xdg-user-dir (1) - Find an XDG user dir
$
$ apropos locate
blkid (8) - locate/print block device attributes
deallocvt (1) - deallocate unused virtual consoles
fallocate (1) - preallocate or deallocate space to a file
IO::Tty (3pm) - Low-level allocate a pseudo-Tty, import constants.
locate (1) - find files by name
mlocate (1) - find files by name
mlocate.db (5) - a mlocate database
mshowfat (1) - shows FAT clusters allocated to file
ntfsfallocate (8) - preallocate space to a file on an NTFS volume
systemd-sysusers (8) - Allocate system users and groups
systemd-sysusers.service (8) - Allocate system users and groups
updatedb (8) - update a database for mlocate
updatedb.mlocate (8) - update a database for mlocate
whereis (1) - locate the binary, source, and manual page files for a...
which (1) - locate a command

```

### Wrap-up

The commands available on Linux for locating and identifying files are quite varied, but they're all very useful.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3268768/linux/finding-what-you-re-looking-for-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
[1]:http://www.networkworld.com/article/2926630/linux/11-pointless-but-awesome-linux-terminal-tricks.html#tk.nww-fsb
