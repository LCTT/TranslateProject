Linux Head Command Explained for Beginners (5 Examples)
======

Sometimes, while working on the command line in Linux, you might want to take a quick look at a few initial lines of a file. For example, if a log file is continuously being updated, the requirement could be to view, say, first 10 lines of the log file every time. While viewing the file in an editor (like [vim][1]) is always an option, there exists a command line tool - dubbed **head** \- that lets you view initial few lines of a file very easily.

In this article, we will discuss the basics of the head command using some easy to understand examples. Please note that all steps/instructions mentioned here have been tested on Ubuntu 16.04LTS.

### Linux head command

As already mentioned in the beginning, the head command lets users view the first part of files. Here's its syntax:

head [OPTION]... [FILE]...

And following is how the command's man page describes it:
```
Print the  first  10 lines of each FILE to standard output. With more than one FILE, precede each
with a header giving the file name.
```

The following Q&A-type examples should give you a better idea of how the tool works:

### Q1. How to print the first 10 lines of a file on terminal (stdout)?

This is quite easy using head - in fact, it's the tool's default behavior.

head [file-name]

The following screenshot shows the command in action:

[![How to print the first 10 lines of a file][2]][3]

### Q2. How to tweak the number of lines head prints?

While 10 is the default number of lines the head command prints, you can change this number as per your requirement. The **-n** command line option lets you do that.

head -n [N] [File-name]

For example, if you want to only print first 5 lines, you can convey this to the tool in the following way:

head -n 5 file1

[![How to tweak number of lines head prints][4]][5]

### Q3. How to restrict the output to a certain number of bytes?

Not only number of lines, you can also restrict the head command output to a specific number of bytes. This can be done using the **-c** command line option.

head -c [N] [File-name]

For example, if you want head to only display first 25 bytes, here's how you can execute it:

head -c 25 file1

[![restrict the output to a certain number of bytes][6]][7]

So you can see that the tool displayed only the first 25 bytes in the output.

Please note that [N] "may have a multiplier suffix: b 512, kB 1000, K 1024, MB 1000*1000, M 1024*1024, GB 1000*1000*1000, G 1024*1024*1024, and so on for T, P, E, Z, Y."

### Q4. How to have head print filename in output?

If for some reason, you want the head command to also print the file name in output, you can do that using the **-v** command line option.

head -v [file-name]

Here's an example:

[![How to have head print filename in output][8]][9]

So as you can see, the filename 'file 1' was displayed in the output.

### Q5. How to have NUL as line delimiter, instead of newline?

By default, the head command output is delimited by newline. But there's also an option of using NUL as the delimiter. The option **-z** or **\--zero-terminated** lets you do this.

head -z [file-name]

### Conclusion

As most of you'd agree, head is a simple command to understand and use, meaning there's little learning curve associated with it. The features (in terms of command line options) it offers are also limited, and we've covered almost all of them. So give these options a try, and when you're done, take a look at the command's [man page][10] to know more.


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-head-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/vim-basics
[2]:https://www.howtoforge.com/images/linux_head_command/head-basic-usage.png
[3]:https://www.howtoforge.com/images/linux_head_command/big/head-basic-usage.png
[4]:https://www.howtoforge.com/images/linux_head_command/head-n-option.png
[5]:https://www.howtoforge.com/images/linux_head_command/big/head-n-option.png
[6]:https://www.howtoforge.com/images/linux_head_command/head-c-option.png
[7]:https://www.howtoforge.com/images/linux_head_command/big/head-c-option.png
[8]:https://www.howtoforge.com/images/linux_head_command/head-v-option.png
[9]:https://www.howtoforge.com/images/linux_head_command/big/head-v-option.png
[10]:https://linux.die.net/man/1/head
