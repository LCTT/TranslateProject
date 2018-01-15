Translating by jessie-pang

Mastering file searches on Linux
======

![](https://images.idgesg.net/images/article/2017/09/telescope-100736548-large.jpg)

There are many ways to search for files on Linux systems and the commands can be very easy or very specific -- narrowing down your search criteria to find what just you're looking for and nothing else. In today's post, we're going to examine some of the most useful commands and options for your file searches. We're going to look into:

  * Quick finds
  * More complex search criteria
  * Combining conditions
  * Reversing criteria
  * Simple vs. detailed responses
  * Looking for duplicate files



There are actually several useful commands for searching for files. The **find** command may be the most obvious, but it's not the only command or always the fastest way to find what you're looking for.

### Quick file search commands: which and locate

The simplest commands for searching for files are probably **which** and **locate**. Both have some constraints that you should be aware of. The **which** command is only going to search through directories on your search path looking for files that are executable. It is generally used to identify commands. If you are curious about what command will be run when you type "which", for example, you can use the command "which which" and it will point you to the executable.
```
$ which which
/usr/bin/which

```

The **which** command will display the first executable that it finds with the name you supply (i.e., the one you would run if you use that command) and then stop.

The **locate** command is a bit more generous. However, it has a constraint, as well. It will find any number of files, but only if the file names are contained in a database prepared by the **updatedb** command. That file will likely be stored in some location like /var/lib/mlocate/mlocate.db, but is not intended to be read by anything other than the locate command. Updates to this file are generally made by updatedb running daily through cron.

Simple **find** commands don't require a lot more effort, but they do require a starting point for the search and some kind of search criteria. The simplest find command  -- one that searches for files by name -- might look like this:
```
$ find . -name runme
./bin/runme

```

Searching from the current position in the file system by file name as shown will also involve searching all subdirectories unless a search depth is specified.

### More than just file names

The **find** command allows you to search on a number of criteria beyond just file names. These include file owner, group, permissions, size, modification time, lack of an active owner or group and file type. And you can do things beyond just locating the files. You can delete them, rename them, change ownership, change permissions, or run nearly any command against the located files.

These two commands would find 1) files owned by root within the current directory and 2) files _not_ owned by the specified user (in this case, shs). In this case, both responses are the same, but they won't always be.
```
$ find . -user root -ls
 396926 0 lrwxrwxrwx 1 root root 21 Sep 21 09:03 ./xyz -> /home/peanut/xyz
$ find . ! -user shs -ls
 396926 0 lrwxrwxrwx 1 root root 21 Sep 21 09:03 ./xyz -> /home/peanut/xyz

```

The ! character represents "not" -- reversing the condition that follows it.

The command below finds files that have a particular set of permissions.
```
$ find . -perm 750 -ls
 397176 4 -rwxr-x--- 1 shs shs 115 Sep 14 13:52 ./ll
 398209 4 -rwxr-x--- 1 shs shs 117 Sep 21 08:55 ./get-updates
 397145 4 drwxr-x--- 2 shs shs 4096 Sep 14 15:42 ./newdir

```

This command displays files with 777 permissions that are _not_ symbolic links.
```
$ sudo find /home -perm 777 ! -type l -ls
 397132 4 -rwxrwxrwx 1 shs shs 18 Sep 15 16:06 /home/shs/bin/runme
 396949 4 -rwxrwxrwx 1 root root 558 Sep 21 11:21 /home/oops

```

The following command looks for files that are larger than a gigabyte in size. And notice that we've located a very interesting file. It represents the physical memory of this system in the ELF core file format.
```
$ sudo find / -size +1G -ls
4026531994 0 -r-------- 1 root root 140737477881856 Sep 21 11:23 /proc/kcore
 1444722 15332 -rw-rw-r-- 1 shs shs 1609039872 Sep 13 15:55 /home/shs/Downloads/ubuntu-17.04-desktop-amd64.iso

```

Finding files by file type is easy as long as you know how the file types are described for the find command.
```
b = block special file
c = character special file
d = directory
p = named pipe
f = regular file
l = symbolic link
s = socket
D = door (Solaris only)

```

In the commands below, we are looking for symbolic links and sockets.
```
$ find . -type l -ls
 396926 0 lrwxrwxrwx 1 root root 21 Sep 21 09:03 ./whatever -> /home/peanut/whatever
$ find . -type s -ls
 395256 0 srwxrwxr-x 1 shs shs 0 Sep 21 08:50 ./.gnupg/S.gpg-agent

```

You can also search for files by inode number.
```
$ find . -inum 397132 -ls
 397132 4 -rwx------ 1 shs shs 18 Sep 15 16:06 ./bin/runme

```

Another way to search for files by inode involves using the **debugfs** command. On a large file system, this command might be considerably faster than using find. You may need to install icheck.
```
$ sudo debugfs -R 'ncheck 397132' /dev/sda1
debugfs 1.42.13 (17-May-2015)
Inode Pathname
397132 /home/shs/bin/runme

```

In the following command, we're starting in our home directory (~), limiting the depth of our search (how deeply we'll search subdirectories) and looking only for files that have been created or modified within the last day (mtime setting).
```
$ find ~ -maxdepth 2 -mtime -1 -ls
 407928 4 drwxr-xr-x 21 shs shs 4096 Sep 21 12:03 /home/shs
 394006 8 -rw------- 1 shs shs 5909 Sep 21 08:18 /home/shs/.bash_history
 399612 4 -rw------- 1 shs shs 53 Sep 21 08:50 /home/shs/.Xauthority
 399615 4 drwxr-xr-x 2 shs shs 4096 Sep 21 09:32 /home/shs/Downloads

```

### More than just listing files

With an **-exec** option, the find command allows you to change files in some way once you've found them. You simply need to follow the -exec option with the command you want to run.
```
$ find . -name runme -exec chmod 700 {} \;
$ find . -name runme -ls
 397132 4 -rwx------ 1 shs shs 18 Sep 15 16:06 ./bin/runme

```

In this command, {} represents the name of the file. This command would change permissions on any files named "runme" in the current directory and subdirectories.

Put whatever command you want to run following the -exec option and using a syntax similar to what you see above.

### Other search criteria

As shown in one of the examples above, you can also search by other criteria -- file age, owner, permissions, etc. Here are some examples.

#### Finding by user
```
$ sudo find /home -user peanut
/home/peanut
/home/peanut/.bashrc
/home/peanut/.bash_logout
/home/peanut/.profile
/home/peanut/examples.desktop

```

#### Finding by file permissions
```
$ sudo find /home -perm 777
/home/shs/whatever
/home/oops

```

#### Finding by age
```
$ sudo find /home -mtime +100
/home/shs/.mozilla/firefox/krsw3giq.default/gmp-gmpopenh264/1.6/gmpopenh264.info
/home/shs/.mozilla/firefox/krsw3giq.default/gmp-gmpopenh264/1.6/libgmpopenh264.so

```

#### Finding by age comparison

Commands like this allow you to find files newer than some other file.
```
$ sudo find /var/log -newer /var/log/syslog
/var/log/auth.log

```

### Finding duplicate files

If you're looking to clean up disk space, you might want to remove large duplicate files. The best way to determine whether files are truly duplicates is to use the **fdupes** command. This command uses md5 checksums to determine if files have the same content. With the -r (recursive) option, fdupes will run through a directory and find files that have the same checksum and are thus identical in content.

If you run a command like this as root, you will likely find a lot of duplicate files, but many will be startup files that were added to home directories when they were created.
```
# fdupes -rn /home > /tmp/dups.txt
# more /tmp/dups.txt
/home/jdoe/.profile
/home/tsmith/.profile
/home/peanut/.profile
/home/rocket/.profile

/home/jdoe/.bashrc
/home/tsmith/.bashrc
/home/peanut/.bashrc
/home/rocket/.bashrc

```

Similarly, you might find a lot of duplicate configuration files in /usr that you shouldn't remove. So, be careful with the fdupes output.

The fdupes command isn't always speedy, but keeping in mind that it's running checksum queries over a lot of files to compare them, you'll probably appreciate how efficient it is.

### Wrap-up

There are lots of way to locate files on Linux systems. If you can describe what you're looking for, one of the commands above will help you find it.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3227075/linux/mastering-file-searches-on-linux.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com/author/Sandra-Henry_Stocker/
