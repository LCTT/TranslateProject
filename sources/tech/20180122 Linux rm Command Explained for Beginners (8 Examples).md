Translating by yizhuoyan

Linux rm Command Explained for Beginners (8 Examples)
======

Deleting files is a fundamental operation, just like copying files or renaming/moving them. In Linux, there's a dedicated command - dubbed **rm** \- that lets you perform all deletion-related operations. In this tutorial, we will discuss the basics of this tool along with some easy to understand examples.

But before we do that, it's worth mentioning that all examples mentioned in the article have been tested on Ubuntu 16.04 LTS.

#### Linux rm command

So in layman's terms, we can simply say the rm command is used for removing/deleting files and directories. Following is the syntax of the command:

```
rm [OPTION]... [FILE]...
```

And here's how the tool's man page describes it:
```
This manual page documents the GNU version of rm. rm removes each specified file. By default, it
does not remove directories.

If  the  -I or --interactive=once option is given, and there are more than three files or the -r,
-R, or --recursive are given, then rm prompts the user for whether to proceed with the entire
operation. If the response is not affirmative, the entire command is aborted.

Otherwise, if a file is unwritable, standard input is a terminal, and the -f or --force option is
not given, or the -i or --interactive=always option is given, rm prompts the user for whether to
remove the file. If the response is not affirmative, the file is skipped.
```

The following Q&A-styled examples will give you a better idea on how the tool works.

#### Q1. How to remove files using rm command?

That's pretty easy and straightforward. All you have to do is to pass the name of the files (along with paths if they are not in the current working directory) as input to the rm command.

```
rm [filename]
```

For example:

```
rm testfile.txt
```

[![How to remove files using rm command][1]][2]

#### Q2. How to remove directories using rm command?

If you are trying to remove a directory, then you need to use the **-r** command line option. Otherwise, rm will throw an error saying what you are trying to delete is a directory.

```
rm -r [dir name]
```

For example:

```
rm -r testdir
```

[![How to remove directories using rm command][3]][4]

#### Q3. How to make rm prompt before every removal?

If you want rm to prompt before each delete action it performs, then use the **-i** command line option.

```
rm -i [file or dir]
```

For example, suppose you want to delete a directory 'testdir' and all its contents, but want rm to prompt before every deletion, then here's how you can do that:

```
rm -r -i testdir
```

[![How to make rm prompt before every removal][5]][6]

#### Q4. How to force rm to ignore nonexistent files?

The rm command lets you know through an error message if you try deleting a non-existent file or directory.

[![Linux rm command example][7]][8]

However, if you want, you can make rm suppress such error/notifications - all you have to do is to use the **-f** command line option.

```
rm -f [filename]
```

[![How to force rm to ignore nonexistent files][9]][10]

#### Q5. How to make rm prompt only in some scenarios?

There exists a command line option **-I** , which when used, makes sure the command only prompts once before removing more than three files, or when removing recursively.

For example, the following screenshot shows this option in action - there was no prompt when two files were deleted, but the command prompted when more than three files were deleted.

[![How to make rm prompt only in some scenarios][11]][12]

#### Q6. How rm works when dealing with root directory?

Of course, deleting root directory is the last thing a Linux user would want. That's why, the rm command doesn't let you perform a recursive delete operation on this directory by default.

[![How rm works when dealing with root directory][13]][14]

However, if you want to go ahead with this operation for whatever reason, then you need to tell this to rm by using the **\--no-preserve-root** option. When this option is enabled, rm doesn't treat the root directory (/) specially.

In case you want to know the scenarios in which a user might want to delete the root directory of their system, head [here][15].

#### Q7. How to make rm only remove empty directories?

In case you want to restrict rm's directory deletion ability to only empty directories, then you can use the -d command line option.

```
rm -d [dir]
```

The following screenshot shows the -d command line option in action - only empty directory got deleted.

[![How to make rm only remove empty directories][16]][17]

#### Q8. How to force rm to emit details of operation it is performing?

If you want rm to display detailed information of the operation being performed, then this can be done by using the **-v** command line option.

```
rm -v [file or directory name]
```

For example:

[![How to force rm to emit details of operation it is performing][18]][19]

#### Conclusion

Given the kind of functionality it offers, rm is one of the most frequently used commands in Linux (like [cp][20] and mv). Here, in this tutorial, we have covered almost all major command line options this tool provides. rm has a bit of learning curve associated with, so you'll have to spent some time practicing its options before you start using the tool in your day to day work. For more information, head to the command's [man page][21].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-rm-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/rm-basic-usage.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/rm-basic-usage.png
[3]:https://www.howtoforge.com/images/command-tutorial/rm-r.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/rm-r.png
[5]:https://www.howtoforge.com/images/command-tutorial/rm-i-option.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/rm-i-option.png
[7]:https://www.howtoforge.com/images/command-tutorial/rm-non-ext-error.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/rm-non-ext-error.png
[9]:https://www.howtoforge.com/images/command-tutorial/rm-f-option.png
[10]:https://www.howtoforge.com/images/command-tutorial/big/rm-f-option.png
[11]:https://www.howtoforge.com/images/command-tutorial/rm-I-option.png
[12]:https://www.howtoforge.com/images/command-tutorial/big/rm-I-option.png
[13]:https://www.howtoforge.com/images/command-tutorial/rm-root-default.png
[14]:https://www.howtoforge.com/images/command-tutorial/big/rm-root-default.png
[15]:https://superuser.com/questions/742334/is-there-a-scenario-where-rm-rf-no-preserve-root-is-needed
[16]:https://www.howtoforge.com/images/command-tutorial/rm-d-option.png
[17]:https://www.howtoforge.com/images/command-tutorial/big/rm-d-option.png
[18]:https://www.howtoforge.com/images/command-tutorial/rm-v-option.png
[19]:https://www.howtoforge.com/images/command-tutorial/big/rm-v-option.png
[20]:https://www.howtoforge.com/linux-cp-command/
[21]:https://linux.die.net/man/1/rm
