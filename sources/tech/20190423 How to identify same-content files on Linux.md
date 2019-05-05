[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to identify same-content files on Linux)
[#]: via: (https://www.networkworld.com/article/3390204/how-to-identify-same-content-files-on-linux.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to identify same-content files on Linux
======
Copies of files sometimes represent a big waste of disk space and can cause confusion if you want to make updates. Here are six commands to help you identify these files.
![Vinoth Chandar \(CC BY 2.0\)][1]

In a recent post, we looked at [how to identify and locate files that are hard links][2] (i.e., that point to the same disk content and share inodes). In this post, we'll check out commands for finding files that have the same _content_ , but are not otherwise connected.

Hard links are helpful because they allow files to exist in multiple places in the file system while not taking up any additional disk space. Copies of files, on the other hand, sometimes represent a big waste of disk space and run some risk of causing some confusion if you want to make updates. In this post, we're going to look at multiple ways to identify these files.

**[ Two-Minute Linux Tips:[Learn how to master a host of Linux commands in these 2-minute video tutorials][3] ]**

### Comparing files with the diff command

Probably the easiest way to compare two files is to use the **diff** command. The output will show you the differences between the two files. The  < and > signs indicate whether the extra lines are in the first (<) or second (>) file provided as arguments. In this example, the extra lines are in backup.html.

```
$ diff index.html backup.html
2438a2439,2441
> <pre>
> That's all there is to report.
> </pre>
```

If diff shows no output, that means the two files are the same.

```
$ diff home.html index.html
$
```

The only drawbacks to diff are that it can only compare two files at a time, and you have to identify the files to compare. Some commands we will look at in this post can find the duplicate files for you.

### Using checksums

The **cksum** (checksum) command computes checksums for files. Checksums are a mathematical reduction of the contents to a lengthy number (like 2819078353 228029). While not absolutely unique, the chance that files that are not identical in content would result in the same checksum is extremely small.

```
$ cksum *.html
2819078353 228029 backup.html
4073570409 227985 home.html
4073570409 227985 index.html
```

In the example above, you can see how the second and third files yield the same checksum and can be assumed to be identical.

### Using the find command

While the find command doesn't have an option for finding duplicate files, it can be used to search files by name or type and run the cksum command. For example:

```
$ find . -name "*.html" -exec cksum {} \;
4073570409 227985 ./home.html
2819078353 228029 ./backup.html
4073570409 227985 ./index.html
```

### Using the fslint command

The **fslint** command can be used to specifically find duplicate files. Note that we give it a starting location. The command can take quite some time to complete if it needs to run through a large number of files. Here's output from a very modest search. Note how it lists the duplicate files and also looks for other issues, such as empty directories and bad IDs.

```
$ fslint .
-----------------------------------file name lint
-------------------------------Invalid utf8 names
-----------------------------------file case lint
----------------------------------DUPlicate files   <==
home.html
index.html
-----------------------------------Dangling links
--------------------redundant characters in links
------------------------------------suspect links
--------------------------------Empty Directories
./.gnupg
----------------------------------Temporary Files
----------------------duplicate/conflicting Names
------------------------------------------Bad ids
-------------------------Non Stripped executables
```

You may have to install **fslint** on your system. You will probably have to add it to your search path, as well:

```
$ export PATH=$PATH:/usr/share/fslint/fslint
```

### Using the rdfind command

The **rdfind** command will also look for duplicate (same content) files. The name stands for "redundant data find," and the command is able to determine, based on file dates, which files are the originals — which is helpful if you choose to delete the duplicates, as it will remove the newer files.

```
$ rdfind ~
Now scanning "/home/shark", found 12 files.
Now have 12 files in total.
Removed 1 files due to nonunique device and inode.
Total size is 699498 bytes or 683 KiB
Removed 9 files due to unique sizes from list.2 files left.
Now eliminating candidates based on first bytes:removed 0 files from list.2 files left.
Now eliminating candidates based on last bytes:removed 0 files from list.2 files left.
Now eliminating candidates based on sha1 checksum:removed 0 files from list.2 files left.
It seems like you have 2 files that are not unique
Totally, 223 KiB can be reduced.
Now making results file results.txt
```

You can also run this command in "dryrun" (i.e., only report the changes that might otherwise be made).

```
$ rdfind -dryrun true ~
(DRYRUN MODE) Now scanning "/home/shark", found 12 files.
(DRYRUN MODE) Now have 12 files in total.
(DRYRUN MODE) Removed 1 files due to nonunique device and inode.
(DRYRUN MODE) Total size is 699352 bytes or 683 KiB
Removed 9 files due to unique sizes from list.2 files left.
(DRYRUN MODE) Now eliminating candidates based on first bytes:removed 0 files from list.2 files left.
(DRYRUN MODE) Now eliminating candidates based on last bytes:removed 0 files from list.2 files left.
(DRYRUN MODE) Now eliminating candidates based on sha1 checksum:removed 0 files from list.2 files left.
(DRYRUN MODE) It seems like you have 2 files that are not unique
(DRYRUN MODE) Totally, 223 KiB can be reduced.
(DRYRUN MODE) Now making results file results.txt
```

The rdfind command also provides options for things such as ignoring empty files (-ignoreempty) and following symbolic links (-followsymlinks). Check out the man page for explanations.

```
-ignoreempty       ignore empty files
-minsize        ignore files smaller than speficied size
-followsymlinks     follow symbolic links
-removeidentinode   remove files referring to identical inode
-checksum       identify checksum type to be used
-deterministic      determiness how to sort files
-makesymlinks       turn duplicate files into symbolic links
-makehardlinks      replace duplicate files with hard links
-makeresultsfile    create a results file in the current directory
-outputname     provide name for results file
-deleteduplicates   delete/unlink duplicate files
-sleep          set sleep time between reading files (milliseconds)
-n, -dryrun     display what would have been done, but don't do it
```

Note that the rdfind command offers an option to delete duplicate files with the **-deleteduplicates true** setting. Hopefully the command's modest problem with grammar won't irritate you. ;-)

```
$ rdfind -deleteduplicates true .
...
Deleted 1 files.    <==
```

You will likely have to install the rdfind command on your system. It's probably a good idea to experiment with it to get comfortable with how it works.

### Using the fdupes command

The **fdupes** command also makes it easy to identify duplicate files and provides a large number of useful options — like **-r** for recursion. In its simplest form, it groups duplicate files together like this:

```
$ fdupes ~
/home/shs/UPGRADE
/home/shs/mytwin

/home/shs/lp.txt
/home/shs/lp.man

/home/shs/penguin.png
/home/shs/penguin0.png
/home/shs/hideme.png
```

Here's an example using recursion. Note that many of the duplicate files are important (users' .bashrc and .profile files) and should clearly not be deleted.

```
# fdupes -r /home
/home/shark/home.html
/home/shark/index.html

/home/dory/.bashrc
/home/eel/.bashrc

/home/nemo/.profile
/home/dory/.profile
/home/shark/.profile

/home/nemo/tryme
/home/shs/tryme

/home/shs/arrow.png
/home/shs/PNGs/arrow.png

/home/shs/11/files_11.zip
/home/shs/ERIC/file_11.zip

/home/shs/penguin0.jpg
/home/shs/PNGs/penguin.jpg
/home/shs/PNGs/penguin0.jpg

/home/shs/Sandra_rotated.png
/home/shs/PNGs/Sandra_rotated.png
```

The fdupe command's many options are listed below. Use the **fdupes -h** command, or read the man page for more details.

```
-r --recurse     recurse
-R --recurse:    recurse through specified directories
-s --symlinks    follow symlinked directories
-H --hardlinks   treat hard links as duplicates
-n --noempty     ignore empty files
-f --omitfirst   omit the first file in each set of matches
-A --nohidden    ignore hidden files
-1 --sameline    list matches on a single line
-S --size        show size of duplicate files
-m --summarize   summarize duplicate files information
-q --quiet       hide progress indicator
-d --delete      prompt user for files to preserve
-N --noprompt    when used with --delete, preserve the first file in set
-I --immediate   delete duplicates as they are encountered
-p --permissions don't soncider files with different owner/group or
                 permission bits as duplicates
-o --order=WORD  order files according to specification
-i --reverse     reverse order while sorting
-v --version     display fdupes version
-h --help        displays help
```

The fdupes command is another one that you're like to have to install and work with for a while to become familiar with its many options.

### Wrap-up

Linux systems provide a good selection of tools for locating and potentially removing duplicate files, along with options for where you want to run your search and what you want to do with duplicate files when you find them.

**[ Also see:[Invaluable tips and tricks for troubleshooting Linux][4] ]**

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3390204/how-to-identify-same-content-files-on-linux.html#tk.rss_all

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/chairs-100794266-large.jpg
[2]: https://www.networkworld.com/article/3387961/how-to-identify-duplicate-files-on-linux.html
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
