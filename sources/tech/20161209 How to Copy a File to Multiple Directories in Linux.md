translating---geekpi

How to Copy a File to Multiple Directories in Linux
============================================================

[While learning Linux][1], it is always the norm for newbies to keep on typing several commands to accomplish a simple task. This is understandable especially when one is just getting accustomed to using the terminal.

However, as you look forward to becoming a Linux power user, learning what I would refer to as “shortcut commands” can significantly reduce time wasting tendencies.

In this article, we will explain an easy way, using a single command to copy a file into multiple directories in Linux.

In Linux, the [cp command][2] is used to copy files from one directory to another, the easiest syntax for using it is as follows:

```
# cp [options….] source(s) destination
```

Alternatively, you can also use the [advanced-copy command][3], which shows a progress bar while copying [large files/folders in Linux][4].

Consider the commands below, normally, you would type two different commands to copy the same file into two separate directories as follows:

```
# cp -v /home/aaronkilik/bin/sys_info.sh /home/aaronkilik/test
# cp -v /home/aaronkilik/bin/sys_info.sh /home/aaronkilik/tmp
```
[
 ![Copy Files to Multiple Directories](http://www.tecmint.com/wp-content/uploads/2016/12/Copy-Files-to-Multiple-Directories.png) 
][5]

Copy Files to Multiple Directories

Assuming that you want to copy a particular file into up to five or more directories, this means you would have to type five or more cp commands?

To do away with this problem, you can employ the [echo command][6], a pipe, xargs command together with the cpcommand in the form below:

```
# echo /home/aaronkilik/test/ /home/aaronkilik/tmp | xargs -n 1 cp -v /home/aaronkilik/bin/sys_info.sh
```

In the form above, the paths to the directories (dir1,dir2,dir3…..dirN) are echoed and piped as input to the xargscommand where:

1.  `-n 1` – tells xargs to use at most one argument per command line and send to the cp command.
2.  `cp` – used to copying a file.
3.  `-v` – enables verbose mode to show details of the copy operation.

[
 ![Copy File to Multiple Locations in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Copy-Files-to-Multiple-Directories-in-Linux.png) 
][7]

Copy File to Multiple Locations in Linux

Try to read through the man pages of `cp`, `echo` and `xargs` commands to find useful and advanced usage information:

```
$ man cp
$ man echo
$ man xargs
```

That’s all, you can send us questions in relation to the topic or any feedback through the comment form below. You may also want to read about the [progress command][8] which helps to monitor the progress of (cp, mv, dd, [tar][9], etc.) commands that are presently running in Linux.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/copy-file-to-multiple-directories-in-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/free-online-linux-learning-guide-for-beginners/
[2]:http://www.tecmint.com/advanced-copy-command-shows-progress-bar-while-copying-files/
[3]:http://www.tecmint.com/advanced-copy-command-shows-progress-bar-while-copying-files/
[4]:http://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/
[5]:http://www.tecmint.com/wp-content/uploads/2016/12/Copy-Files-to-Multiple-Directories.png
[6]:http://www.tecmint.com/echo-command-in-linux/
[7]:http://www.tecmint.com/wp-content/uploads/2016/12/Copy-Files-to-Multiple-Directories-in-Linux.png
[8]:http://www.tecmint.com/progress-monitor-check-progress-of-linux-commands/
[9]:http://www.tecmint.com/18-tar-command-examples-in-linux/
