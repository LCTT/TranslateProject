[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to find what you’re looking for on Linux with find)
[#]: via: (https://www.networkworld.com/article/3527420/how-to-find-what-you-re-looking-for-on-linux-with-find.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to find what you’re looking for on Linux with find
======
The find command has a huge array of options to help you locate exactly the files you're looking for on a Linux system. This post explores a series of extremely useful commands.
CSA Images / Getty Images

There are a number of commands for finding files on Linux systems, but there are also a huge number of options that you can deploy when looking for them.

For example, you can find files not just by their names, but by their owners and/or groups, their age, their size, the assigned permissions, the last time they were accessed, the associated inodes and even whether the files belong to an account or group that no longer exists on the system and so on.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][1]

You can also specify where a search should start, how deeply into the file system the search should reach and how much the search result will tell you about the files it finds.

And all these criteria can be handled by the **find** command.

Examples of finding files by these criteria are provided below. In some commands, errors (such as trying to list files that you don’t have read access to), error output will be sent to **/dev/null** so that we don’t have to look at it. In others, we’ll simply run as root to avoid this problem.

Keep in mind that additional options exist. This post covers a lot of ground, but not all of the ways that the **find** command can help locate files for you.

### Picking a starting point

With **find**, you can either select a point or start where you are. To select a starting spot, enter it following the word “find”. For example, “find /usr” or “find ./bin” would search starting the **/usr** directory or the **bin** directory in the current location while “find ~” would start in your home directory even if you’re currently located in some other location in the file system.

[][2]

### Picking what you want to see

One of the most commonly used search strategies is to search for files by name. This requires using the **-name** option.

By default, **find** will show you the full path to the files it finds. This is the same thing you would see if you add **-print** to your command. If you want to see the details associated with a file – its length, permissions, etc., you would need to add **-ls** to the end of your **find** command.

```
$ find ~/bin -name tryme
/home/shs/bin/tryme
$ find ~/bin -name tryme -print
/home/shs/bin/tryme
$ find ~/bin -name tryme -ls
   917528   4 -rwx------   1 shs    shs   139 Apr  8  2019 /home/shs/bin/tryme
```

You can also find files using substrings. For example, if you replace "tryme" in the example above with "try*", you'll find all the files with names that begin with "try".

Finding files by name is probably the most typical use of the **find** command, but there are so many other ways to look for files and good reasons to want to. The sections below show how to use many of the other criteria available.

In addition, when searching for files by size, group, inode etc., you probably will want some confirmation that the files found match what you were looking for. Using the **-ls** option to display the details is often very helpful.

### Finding files by size

Finding files by size requires use of the **-size** option and a little finesse with the specifications. If you specify **-size 189b**, for you example, you’re going to find files that are 189 blocks long, not 189 bytes. For bytes, you would need to use **-size 189c** (characters). And, if you specify **-size 200w**, you’re going to find files that are 200 words – words as in "two-byte increments", not words as in "those things we all say to each other". You can also look for file by providing sizes in kilobytes (k), megabytes (M) and gigabytes (G).

Most of the time, Linux users will be searching for files that are larger than some selected size. For example, to find files that are larger than a gigabyte, you might use a command like this where the +1G means "larger than a gigabyte":

```
$ find -size +1G -ls 2>/dev/null
  787715 1053976 -rw-rw-r-- 1 shs  shs  1079263432 Dec 21  2018 ./backup.zip
  801834 1052556 -rw-rw-r-- 1 shs  shs  1077809525 Dec 21  2018 ./2019/hold.zip
```

### Finding files by inode #

You can find files by the inode that is used to maintain the file’s metadata (i.e., everything but the file content and file name).

```
$ find -inum 919674 -ls 2>/dev/null
  919674  4 -rw-rw-r--  1 shs  shs   512 Dec 27 15:25 ./bin/my.log
```

### Finding files with a specific file owner or group

Finding files by owner or group is also very straightforward. Here we use sudo to overcome permission issues.

```
$ sudo find /home -user nemo -name "*.png"-ls
 1705219  4 drwxr-xr-x  2 nemo nemo  4096 Jan 28 08:50 /home/nemo/Pictures/me.png
```

In this command, we look for a file that is owned by a multi-user group called “admins”.

```
# find /tmp -group admins -ls
   262199      4 -rwxr-x---   1 dory     admins         27 Feb 16 18:57 /tmp/testscript
```

### Finding files with no owners or groups

You can look for files that don't belong to any users currently set up on the system by using the **-nouser** option as shown in the command below.

```
# find /tmp -nouser -ls
262204 4 -rwx------ 1 1016 1016 17 Feb 17 16:42 /tmp/hello
```

Notice that the listing shows the old user's UID and GID – a clear indication that this user is not defined on the system. This kind of command will find files that were likely created in other-than-home directories by users whose accounts have since been removed from the system or in home directories that were not removed after the user account was removed. Similarly, the **-nogroup** option would find such files – especially when these users were the only members of the associated groups.

### Finding files by last update time

In this command, we look for files that have been updated in the last 24 hours in a particular user's home directory. The **sudo** is being used to allow searching another user’s home directory.

```
$ sudo find /home/nemo -mtime -1
/home/nemo
/home/nemo/snap/cheat
/home/nemo/tryme
```

### Finding files by when permissions were last changed

The **-ctime** option can help you find files that have had their status (e.g., permissions) changed within some referenced time frame. Here’s an example of looking for files that had permission changes within the last day:

```
$ find . -ctime -1 -ls
   787987   4 -rwxr-xr-x   1 shs   shs     189 Feb 11 07:31 ./tryme
```

Keep in mind that the date and time displayed reflect the last updates to the file contents. You will have to use a command like **stat** to see all three times associated with a file (file creation, modification and status changes) .

### Finding files based on last access times

In this command, we look for local pdf files that were accessed within the last two days using the **-atime** option.

```
$ find -name "*.pdf" -atime -2
./Wingding_Invites.pdf
```

### Finding files based on their age relative to another file

You can use the -newer option to find files that are newer than some other file.

```
$ find . -newer dig1 -ls
   786434     68 drwxr-xr-x  67 shs      shs         69632 Feb 16 19:05 .
  1064442      4 drwxr-xr-x   5 shs      shs          4096 Feb 16 11:06 ./snap/cheat
   791846      4 -rw-rw-r--   1 shs      shs           649 Feb 13 14:26 ./dig
```

There is no corresponding **-older** option, but you can get a similar result with **! -newer** (i.e., not newer), which means almost the same thing.

### Finding files by type

Finding a file by file type, you get a lot of choices – regular files, directories, block and character files, etc. Here’s a list of the file type options:

```
b      block (buffered) special
c      character (unbuffered) special
d      directory
p      named pipe (FIFO)
f      regular file
l      symbolic link
s      socket
```

Here’s an example looking for symbolic links:

```
$ find . -type l -ls
   805717   0 lrwxrwxrwx   1 shs    shs    11 Apr 10  2019 ./volcano -> volcano.pdf
   918552   0 lrwxrwxrwx   1 shs    shs     1 Jun 16  2018 ./letter -> pers/letter2mom
```

### Limiting how deeply find should look

The **-mindepth** and **-maxdepth** options control how deeply into the file system (from the current location or starting point) your searches will look.

```
$ find -maxdepth 3 -name "*loop"
./bin/save/oldloop
./bin/long-loop
./private/loop
```

### Finding files only if empty

In this command, we look for empty files, but no further than directories and their subdirectories.

```
$ find . -maxdepth 2 -empty -type f -ls
   917517      0 -rw-rw-r--   1 shs   shs      0 Sep 23 11:00 ./complaints/newfile
   792050      0 -rw-rw-r--   1 shs   shs      0 Oct  4 19:02 ./junk
```

### Finding files by permissions

You can find files that have specific permissions set using the **-perm** option. In the example below, we are looking only for regular files (**-type f**) to avoid seeing symbolic links that are given these permissions by default even if the file they refer to is restricted.

```
$ find -perm 777 -type f -ls
find: ‘./.dbus’: Permission denied
   798748      4 -rwxrwxrwx   1 shs      shs            15 Mar 28  2019 ./runme
```

### Using find to help you get rid of files

You can use the find command to both locate and then remove files if you use a command like this one:

```
$ find . -name runme -exec rm {} \;
```

The {} represents the name of each of the files located by the search criteria.

One very useful option is to replace **-exec** with **-ok**. When you do this, **find** will ask for a confirmation before it removes any file.

```
$ find . -name runme -ok rm -rf {} \;
< rm ... ./bin/runme > ?
```

Removing a file isn't the only thing that **-ok** and **-rm** can do for you. For example, you could copy, rename or move files.

There are really a lot of options for using the find command effectively and undoubtedly some that haven’t been covered in this post. I hope you’ve found some that are new and especially promising.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3527420/how-to-find-what-you-re-looking-for-on-linux-with-find.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/newsletters/signup.html
[2]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE21620&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
