How to Find Number of Files in a Directory and Subdirectories
============================================================

In this guide, we will cover how to display the total number of files in the current working directory or any other directory and its subdirectories on a Linux system.

We will use the [find command][6] which is used to search for files in a directory hierarchy together with [wc command][7] which prints newline, word, and byte counts for each file, alternatively data read from standard input.

Following are the options that we can use with [find command][8] as follows:

1.  `-type` – specifies the file type to search for, in the case above, the `f` means find all regular files.
2.  `-print` – an action to print the absolute path of a file.
3.  `-l` – this option prints the total number of newlines, which is equals to the total number of absolute file paths output by [find command][1].

The general syntax of find command.

```
# find . -type f -print | wc -l
$ sudo find . -type f -print | wc -l
```

Important: Use [sudo command][9] to read all files in the specified directory including those in the subdirectories with superuser privileges, in order to avoid “Permission denied” errors as in the screen shot below:

[
 ![Find Number of Files in Linux](http://www.tecmint.com/wp-content/uploads/2017/01/Find-Number-of-Files-in-Linux.png) 
][10]

Find Number of Files in Linux

You can see that in the first command above, not all files in the current working directory are read by findcommand.

The following are extra examples to show total number of regular files in `/var/log` and `/etc` directories respectively:

```
$ sudo find /var/log/ -type f -print | wc -l
$ sudo find /etc/ -type f -print | wc -l
```

For more examples on Linux find command and wc command go through the following series of articles for additional usage options, tips and related commands:

1.  [35 Useful ‘find’ Command Examples in Linux][2]
2.  [How to Find Recent or Today’s Modified Files in Linux][3]
3.  [Find Top 10 Directoires and Files Disk Space in Linux][4]
4.  [6 Useful ‘wc’ Command Examples to Count Lines, Words and Characters][5]

That’s all! In case you know of any other method to display the total number of files in a directory and its subdirectories, do share it with us in the comments.

--------------------------------------------------------------------------------

作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/find-number-of-files-in-directory-subdirectories-linux/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/
[2]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[3]:http://www.tecmint.com/find-recent-modified-files-in-linux/
[4]:http://www.tecmint.com/find-top-large-directories-and-files-sizes-in-linux/
[5]:http://www.tecmint.com/wc-command-examples/
[6]:http://www.tecmint.com/35-practical-examples-of-linux-find-command/
[7]:http://www.tecmint.com/wc-command-examples/
[8]:http://www.tecmint.com/find-recent-modified-files-in-linux/
[9]:http://www.tecmint.com/sudoers-configurations-for-setting-sudo-in-linux/
[10]:http://www.tecmint.com/wp-content/uploads/2017/01/Find-Number-of-Files-in-Linux.png
