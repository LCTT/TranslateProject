Linux touch command tutorial for beginners (6 examples)
============================================================

### On this page

1.  [Linux Touch command][1]

2.  [1\. How to change access/modification time using touch command][2]

3.  [2\. How to change only access or modification time][3]

4.  [3\. How to make touch use access/modification times of existing file][4]

5.  [4\. How to create a new file using touch][5]

6.  [5\. How to force touch to not create any new file][6]

7.  [6\. How touch works in case of symbolic links][7]

8.  [Conclusion][8]

Sometimes, while working on the command line in Linux, you might want to create a new file. Or, there may be times when the requirement is to change the timestamps of a file. Well, there exists a utility that can you can use in both these scenarios. The tool in question is **touch**, and in this tutorial, we will understand its basic functionality through easy to understand examples.

Please note that all examples that we'll be using here have been tested on an Ubuntu 16.04 machine.

### Linux Touch command

The touch command is primarily used to change file timestamps, but if the file (whose name is passed as an argument) doesn't exist, then the tool creates it.

Following is the command's generic syntax:

```
touch [OPTION]... FILE...
```

And here's how the man page explains this command:

```
DESCRIPTION
       Update  the  access  and modification times of each FILE to the current
       time. A FILE argument that does not exist is created empty, unless -c  or  -h
       is supplied. A  FILE  argument  string of - is handled specially and causes touch to
       change the times of the file associated with standard output.
```

The following Q&A type examples will give you a better idea of how the tool works.

### 1\. How to change access/modification time using touch command

This is simple, and pretty straight forward. Let's take an existing file as an example. The following screenshot shows the access and modification times for a file called 'apl.c.'

 [![change access/modification time using touch command](https://www.howtoforge.com/images/linux_hostname_command/touch-exist-file1.png)][9] 

Here's how you can use the touch command to change the file's access and modification times:

```
touch apl.c
```

The following screenshot confirms the change in these timestamps.

 [![Change file timestamp with touch command](https://www.howtoforge.com/images/linux_hostname_command/touch-exist-file2.png)][10] 

### 2\. How to change only access or modification time

By default, the touch command changes both access and modification times of the input file. However, if you want, you can limit this behavior to any one of these timestamps. This means that you can either have the access time changed or the modification timestamp.

In case you want to only change the access time, use the -a command line option.

```
touch -a [filename]
```

Similarly, if the requirement is to only change the modification time, use the -m command line option.

```
touch -m [filename]
```

### 3\. How to make touch use access/modification times of existing file

If you want, you can also force the touch command to copy access and modification timestamps from a reference file. For example, suppose we want to change the timestamps for the file 'apl.c'. Here are the current timestamps for this file:

 [![make touch use access/modification times of existing file](https://www.howtoforge.com/images/linux_hostname_command/touch-exist-file21.png)][11] 

And this is the file which you want touch to use as its reference:

 [![Check file status with stat command](https://www.howtoforge.com/images/linux_hostname_command/touch-ref-file1.png)][12] 

Now, for touch to use the timestamps of 'apl' for 'apl.c', you'll need to use the -r command line option in the following way:

```
touch apl.c -r apl
```

 [![touch to use the timestamps of other files](https://www.howtoforge.com/images/linux_hostname_command/touch-ref-file2.png)][13] 

The above screenshot shows that modification and access timestamps for 'apl.c' are now same as those for 'apl.'

### 4\. How to create a new file using touch

Creating a new file is also very easy. In fact, it happens automatically if the file name you pass as argument to the touch command doesn't exist. For example, to create a file named 'newfile', all you have to do is to run the following touch command:

```
touch newfile
```

### 5\. How to force touch to not create any new file

Just in case there's a strict requirement that the touch command shouldn't create any new files, then you can use the -c option.

```
touch -c [filename]
```

The following screenshot shows that since 'newfile12' didn't exist, and we used the -c command line option, the touch command didn't create the file.

 [![force touch to not create a new file](https://www.howtoforge.com/images/linux_hostname_command/touch-c-option.png)][14] 

### 6\. How touch works in case of symbolic links

By default, if you pass a symbolic link file name to the touch command, the change in access and modification timestamps will be for the original file (one which the symbolic link refers to). However, the tool also offers an option (-h) that lets you override this behavior.

Here's how the man page explains the -h option:

```
-h, --no-dereference
              affect each symbolic link instead of any referenced file (useful
              only on systems that can change the timestamps of a symlink)
```

So when you want to change the modification and access timestamps for the symbolic link (and not the original file), use the touch command in the following way:

```
touch -h [sym link file name]
```

### Conclusion

As you'd agree, touch isn't a difficult command to understand and use. The examples/options we discussed in this tutorial should be enough to get you started with the tool. While newbies will mostly find themselves using the utility for creating new files, more experienced users play with it for multiple other purposes as well. For more information on the touch command, head to [its man page][15].

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/linux-touch-command/

作者：[ Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/tutorial/linux-touch-command/
[1]:https://www.howtoforge.com/tutorial/linux-touch-command/#linux-touch-command
[2]:https://www.howtoforge.com/tutorial/linux-touch-command/#-how-to-change-accessmodification-time-using-touch-command
[3]:https://www.howtoforge.com/tutorial/linux-touch-command/#-how-to-change-only-access-or-modification-time
[4]:https://www.howtoforge.com/tutorial/linux-touch-command/#-how-to-make-touch-use-accessmodification-times-of-existing-file
[5]:https://www.howtoforge.com/tutorial/linux-touch-command/#-how-to-create-a-new-file-using-touch
[6]:https://www.howtoforge.com/tutorial/linux-touch-command/#-how-to-force-touch-to-not-create-any-new-file
[7]:https://www.howtoforge.com/tutorial/linux-touch-command/#-how-touch-works-in-case-of-symbolic-links
[8]:https://www.howtoforge.com/tutorial/linux-touch-command/#conclusion
[9]:https://www.howtoforge.com/images/linux_hostname_command/big/touch-exist-file1.png
[10]:https://www.howtoforge.com/images/linux_hostname_command/big/touch-exist-file2.png
[11]:https://www.howtoforge.com/images/linux_hostname_command/big/touch-exist-file21.png
[12]:https://www.howtoforge.com/images/linux_hostname_command/big/touch-ref-file1.png
[13]:https://www.howtoforge.com/images/linux_hostname_command/big/touch-ref-file2.png
[14]:https://www.howtoforge.com/images/linux_hostname_command/big/touch-c-option.png
[15]:https://linux.die.net/man/1/touch
