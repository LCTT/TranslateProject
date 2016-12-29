translating---geekpi

How to Find Recent or Today’s Modified Files in Linux
============================================================

In this article, we will explain two, simple [command line tips][5] that enable you to only list all today’s files.

One of the common problems Linux users encounter on the command line is [locating files with a particular name][6], it can be much easier when you actually know the filename.

However, assuming that you have forgotten the name of a file that you created (in your `home` folder which contains hundreds of files) at an earlier time during the day and yet you need to use urgently.

Below are different ways of only [listing all files that you created or modified][7] (directly or indirectly) today.

1. Using the [ls command][8], you can only list today’s files in your home folder as follows, where:

1.  `-a` – list all files including hidden files
2.  `-l` – enables long listing format
3.  `--time-style=FORMAT` – shows time in the specified FORMAT
4.  `+%D` – show/use date in %m/%d/%y format

```
# ls  -al --time-style=+%D | grep 'date +%D'
```
[
 ![Find Recent Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Recent-Files-in-Linux.png) 
][9]

Find Recent Files in Linux

In addition, you can [sort the resultant list alphabetically][10] by including the `-X` flag:

```
# ls -alX --time-style=+%D | grep 'date +%D'
```

You can also list based on size (largest first) using the `-S` flag:

```
# ls -alS --time-style=+%D | grep 'date +%D'
```

2. Again, it is possible to use the [find command][11] which is practically more flexible and offers plenty of options than ls, for the same purpose as below.

1.  `-maxdepth` level is used to specify the level (in terms of sub-directories) below the starting point (current directory in this case) to which the search operation will be carried out.
2.  `-newerXY`, this works if timestamp X of the file in question is newer than timestamp Y of the file reference. X and Y represent any of the letters below:
    1.  a – access time of the file reference
    2.  B – birth time of the file reference
    3.  c – inode status change time of reference
    4.  m – modification time of the file reference
    5.  t – reference is interpreted directly as a time

This means that, only files modified on 2016-12-06 will be considered:

```
# find . -maxdepth 1 -newermt "2016-12-06"
```
[
 ![Find Today's Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Files-in-Linux.png) 
][12]

Find Today’s Files in Linux

Important: Use the correct date format as reference in the [find command][13] above, once you use a wrong format, you will get an error as the one below:

```
# find . -maxdepth 1 -newermt "12-06-2016"
find: I cannot figure out how to interpret '12-06-2016' as a date or time
```

Alternatively, use the correct formats below:

```
# find . -maxdepth 1 -newermt "12/06/2016"
OR
# find . -maxdepth 1 -newermt "12/06/16"
```
[
 ![Find Todays Modified Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Modified-Files.png) 
][14]

Find Todays Modified Files in Linux

You can get more usage information for `ls` and `find` commands in our following series of articles on same.

1.  [Master Linux ‘ls’ Command with This 15 Examples][1]
2.  [Useful 7 Quirky ‘ls’ Tricks for Linux Users][2]
3.  [Master Linux ‘find’ Command with This 35 Examples][3]
4.  [Ways to Find Multiple Filenames with Extensions in Linux][4]

In this article, we explained two important tips of how to list only today’s files with the help of ls and find commands. Make use of the feedback form below to send us any question(s) or comments about the topic. You can as well inform us of any commands used for the same goal.

--------------------------------------------------------------------------------

作者简介:Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

------------------

via: http://www.tecmint.com/find-recent-modified-files-in-linux/

作者：[ Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/15-basic-ls-command-examples-in-linux/
[2]:http://www.tecmint.com/linux-ls-command-tricks/
[3]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[4]:http://www.tecmint.com/linux-find-command-to-search-multiple-filenames-extensions/
[5]:http://www.tecmint.com/tag/linux-tricks/
[6]:http://www.tecmint.com/linux-find-command-to-search-multiple-filenames-extensions/
[7]:http://www.tecmint.com/sort-ls-output-by-last-modified-date-and-time/
[8]:http://www.tecmint.com/tag/linux-ls-command/
[9]:http://www.tecmint.com/wp-content/uploads/2016/12/Find-Recent-Files-in-Linux.png
[10]:http://www.tecmint.com/sort-command-linux/
[11]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[12]:http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Files-in-Linux.png
[13]:http://www.tecmint.com/find-directory-in-linux/
[14]:http://www.tecmint.com/wp-content/uploads/2016/12/Find-Todays-Modified-Files.png
