Linux comm command tutorial for beginners (5 examples)
============================================================

### On this page

1.  [Linux comm command][1]

2.  [1\. How to compare two sorted files using comm][2]

3.  [2\. How to suppress individual columns in comm command output][3]

4.  [3\. How to make comm compare files that are not sorted][4]

5.  [4\. How to separate comm output columns with custom string][5]

6.  [5\. How to make comm output lines NUL terminated][6]

7.  [Conclusion][7]

The **comm** command in Linux lets users compare two sorted files line by line. In this tutorial, we will discuss this command line tool using easy to understand examples. But before we do that, please note that all examples mentioned in this tutorial have been tested on Ubuntu 16.04LTS.

### Linux comm command

The following examples should give you a nice idea about how the 'comm' tool works.

### 1\. How to compare two sorted files using comm

To compare two sorted files using 'comm', all you have to do is to pass their names as arguments to the command line tool. Here's the generic syntax:

```
comm [name-of-first-file] [name-of-second-file]
```

For example, suppose 'file1' and 'file2' are the two files in our case. The former contains the following lines:

```
001
056
127
258
```

while the latter contains the following lines:

```
002
056
167
369
```

Now, here's the 'comm' command output in this case:

```
comm file1 file2
```

 [![](https://www.howtoforge.com/images/linux_comm_command/comm-output.png)][8] 

So you can see that output consists of three columns. The first one contains lines unique to 'file1', second one contains lines unique to 'file2',  and finally, column three contains lines common to both files.

### 2\. How to suppress individual columns in comm command output

If you want, you can suppress individual columns in comm command output. For this, you have three command line options: **-1**, **-2**, and **-3**. As you'd have guessed, these numbers represents the columns you want to suppress.

For example, here's the command to suppress the third column in our case:

```
comm -3 file1 file2
```

 [![](https://www.howtoforge.com/images/linux_comm_command/comm-supress-column.png)][9] 

So you can see that the third column got suppressed.

Note that you can suppress multiple columns with a single command. For example:

```
comm -12 file1 file2
```

will suppress both first and second columns.

### 3\. How to make comm compare files that are not sorted

As we know, the comm command only works with sorted files. If it finds that a file is not sorted, a message is produced in the output that tells the user about this. For example, we swapped the first and the second lines in 'file1,' and then compared it with 'file2.' Here's what the output was:

 [![](https://www.howtoforge.com/images/linux_comm_command/comm-not-sorted-message.png)][10] 

So you can see that the command produced an output saying 'file1' is not sorted. Now, if you don't want the tool to check whether or not the input is sorted, you can use the **--nocheck-order** option.

```
comm --nocheck-order file1 file2
```

 [![](https://www.howtoforge.com/images/linux_comm_command/comm-nocheck-order.png)][11] 

So you can see that the message that was earlier being displayed got suppressed.

Please note that just in case you want to explicitly tell the comm command to carry out the sorting check on input files, you can use the **--check-order** option.

### 4\. How to separate comm output columns with custom string

By default, the columns in the comm command output are separated by spaces. However, if you want, you can change that, and have a string of your choice as separator. This can be done using the **--output-delimiter** option. This option requires you to specify the string that you want to use as the separator.

```
comm --output-delimiter=STR file1 file2
```

For example, we used the plus (+) symbol as the delimiter.

 [![](https://www.howtoforge.com/images/linux_comm_command/comm-output-delimiter.png)][12] 

### 5\. How to make comm output lines NUL terminated

The comm command output lines are newline-terminated by default. However, if you want, you can make them NUL terminated instead. This can be done using the **-z** command line option.

```
comm -z file1 file2
```

### Conclusion

The comm command doesn't offer a whole lot of features - we've covered almost all its command line options here. So just understand and practice what all we've discussed in this tutorial, and you'll be ready to use the tool in your day-to-day tasks. In case of any doubt or query, head to [the command's man page][13], or leave a comment below.

--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-comm-command/

作者：[Himanshu Arora ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com/linux-comm-command/
[1]:https://www.howtoforge.com/linux-comm-command/#linux-comm-command
[2]:https://www.howtoforge.com/linux-comm-command/#-how-to-compare-two-sorted-files-using-comm
[3]:https://www.howtoforge.com/linux-comm-command/#-how-tonbspsuppress-individual-columns-in-comm-command-output
[4]:https://www.howtoforge.com/linux-comm-command/#-how-to-make-comm-compare-files-that-are-not-sorted
[5]:https://www.howtoforge.com/linux-comm-command/#-how-to-separate-comm-output-columns-with-custom-string
[6]:https://www.howtoforge.com/linux-comm-command/#-how-to-make-comm-output-lines-nul-terminated
[7]:https://www.howtoforge.com/linux-comm-command/#conclusion
[8]:https://www.howtoforge.com/images/linux_comm_command/big/comm-output.png
[9]:https://www.howtoforge.com/images/linux_comm_command/big/comm-supress-column.png
[10]:https://www.howtoforge.com/images/linux_comm_command/big/comm-not-sorted-message.png
[11]:https://www.howtoforge.com/images/linux_comm_command/big/comm-nocheck-order.png
[12]:https://www.howtoforge.com/images/linux_comm_command/big/comm-output-delimiter.png
[13]:https://linux.die.net/man/1/comm
