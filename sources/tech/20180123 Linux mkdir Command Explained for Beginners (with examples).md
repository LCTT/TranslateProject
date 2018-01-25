translating by ucasFL

Linux mkdir Command Explained for Beginners (with examples)
======

At any given time on the command line, you are in a directory. So it speaks for itself how integral directories are to the command line. In Linux, while the rm command lets you delete directories, it's the **mkdir** command that allows you create them in the first place. In this tutorial, we will discuss the basics of this tool using some easy to understand examples.

But before we do that, it's worth mentioning that all examples in this tutorial have been tested on Ubuntu 16.04 LTS.

### Linux mkdir command

As already mentioned, the mkdir command allows the user to create directories. Following is its syntax:

```
mkdir [OPTION]... DIRECTORY...
```

And here's how the tool's man page describes it:
```
Create the DIRECTORY(ies), if they do not already exist.
```

The following Q&A-styled examples should give you a better idea on how mkdir works.

### Q1. How to create directories using mkdir?

Creating directories is pretty simple, all you need to do is to pass the name of the directory you want to create to the mkdir command.

```
mkdir [dir-name]
```

Following is an example:

```
mkdir test-dir
```

### Q2. How to make sure parent directories (if non-existent) are created in process?

Sometimes the requirement is to create a complete directory structure with a single mkdir command. This is possible, but you'll have to use the **-p** command line option.

For example, if you want to create dir1/dir2/dir2 when none of these directories are already existing, then you can do this in the following way:

```
mkdir -p dir1/dir2/dir3
```

[![How to make sure parent directories \(if non-existent\) are created][1]][2]

### Q3. How to set permissions for directory being created?

By default, the mkdir command sets rwx, rwx, and r-x permissions for the directories created through it.

[![How to set permissions for directory being created][3]][4]

However, if you want, you can set custom permissions using the **-m** command line option.

[![mkdir -m command option][5]][6]

### Q4. How to make mkdir emit details of operation?

In case you want mkdir to display complete details of the operation it's performing, then this can be done through the **-v** command line option.

```
mkdir -v [dir]
```

Here's an example:

[![How to make mkdir emit details of operation][7]][8]

### Conclusion

So you can see mkdir is a pretty simple command to understand and use. It doesn't have any learning curve associated with it. We have covered almost all of its command line options here. Just practice them and you can start using the command in your day-to-day work. In case you want to know more about the tool, head to its [man page][9].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-mkdir-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/mkdir-p.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/mkdir-p.png
[3]:https://www.howtoforge.com/images/command-tutorial/mkdir-def-perm.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/mkdir-def-perm.png
[5]:https://www.howtoforge.com/images/command-tutorial/mkdir-custom-perm.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/mkdir-custom-perm.png
[7]:https://www.howtoforge.com/images/command-tutorial/mkdir-verbose.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/mkdir-verbose.png
[9]:https://linux.die.net/man/1/mkdir
