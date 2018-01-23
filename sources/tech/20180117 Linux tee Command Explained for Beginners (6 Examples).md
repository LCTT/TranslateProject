translated by cyleft

Linux tee Command Explained for Beginners (6 Examples)
======

There are times when you want to manually track output of a command and also simultaneously make sure the output is being written to a file so that you can refer to it later. If you are looking for a Linux tool which can do this for you, you'll be glad to know there exists a command **tee** that's built for this purpose.

In this tutorial, we will discuss the basics of the tee command using some easy to understand examples. But before we do that, it's worth mentioning that all examples used in this article have been tested on Ubuntu 16.04 LTS.

### Linux tee command

The tee command basically reads from the standard input and writes to standard output and files. Following is the syntax of the command:

```
tee [OPTION]... [FILE]...
```

And here's how the man page explains it:
```
Copy standard input to each FILE, and also to standard output.
```

The following Q&A-styled examples should give you a better idea on how the command works.

### Q1. How to use tee command in Linux?

Suppose you are using the ping command for some reason.

ping google.com

[![How to use tee command in Linux][1]][2]

And what you want, is that the output should also get written to a file in parallel. Then here's where you can use the tee command.

```
ping google.com | tee output.txt
```

The following screenshot shows the output was written to the 'output.txt' file along with being written on stdout.

[![tee command output][3]][4]

So that should clear the basic usage of tee.

### Q2. How to make sure tee appends information in files?

By default, the tee command overwrites information in a file when used again. However, if you want, you can change this behavior by using the -a command line option.

```
[command] | tee -a [file]
```

So basically, the -a option forces tee to append information to the file.

### Q3. How to make tee write to multiple files?

That's pretty easy. You just have to mention their names.

```
[command] | tee [file1] [file2] [file3]
```

For example:

```
ping google.com | tee output1.txt output2.txt output3.txt
```

[![How to make tee write to multiple files][5]][6]

### Q4. How to make tee redirect output of one command to another?

You can not only use tee to simultaneously write output to files, but also to pass on the output as input to other commands. For example, the following command will not only store the filenames in 'output.txt' but also let you know - through wc - the number of entries in the output.txt file.

```
ls file* | tee output.txt | wc -l
```

[![How to make tee redirect output of one command to another][7]][8]

### Q5. How to write to a file with elevated privileges using tee?

Suppose you opened a file in the [Vim editor][9], made a lot of changes, and then when you tried saving those changes, you got an error that made you realize that it's a root-owned file, meaning you need to have sudo privileges to save these changes.

[![How to write to a file with elevated privileges using tee][10]][11]

In scenarios like these, you can use tee to elevate privileges on the go.

```
:w !sudo tee %
```

The aforementioned command will ask you for root password, and then let you save the changes.

### Q6. How to make tee ignore interrupt?

The -i command line option enables tee to ignore the interrupt signal (`SIGINT`), which is usually issued when you press the crl+c key combination.

```
[command] | tee -i [file]
```

This is useful when you want to kill the command with ctrl+c but want tee to exit gracefully.

### Conclusion

You'll likely agree now that tee is an extremely useful command. We've discussed it's basic usage as well as majority of its command line options here. The tool doesn't have a steep learning curve, so just practice all these examples, and you should be good to go. For more information, head to the tool's [man page][12].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-tee-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/ping-example.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/ping-example.png
[3]:https://www.howtoforge.com/images/command-tutorial/ping-with-tee.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/ping-with-tee.png
[5]:https://www.howtoforge.com/images/command-tutorial/tee-mult-files1.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/tee-mult-files1.png
[7]:https://www.howtoforge.com/images/command-tutorial/tee-redirect-output.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/tee-redirect-output.png
[9]:https://www.howtoforge.com/vim-basics
[10]:https://www.howtoforge.com/images/command-tutorial/vim-write-error.png
[11]:https://www.howtoforge.com/images/command-tutorial/big/vim-write-error.png
[12]:https://linux.die.net/man/1/tee
