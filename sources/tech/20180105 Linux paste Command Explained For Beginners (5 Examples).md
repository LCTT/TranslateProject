Linux paste Command Explained For Beginners (5 Examples)
======

Sometimes, while working on the command line in Linux, there may arise a situation wherein you have to merge lines of multiple files to create more meaningful/useful data. Well, you'll be glad to know there exists a command line utility **paste** that does this for you. In this tutorial, we will discuss the basics of this command as well as the main features it offers using easy to understand examples.

But before we do that, it's worth mentioning that all examples mentioned in this article have been tested on Ubuntu 16.04 LTS.

### Linux paste command

As already mentioned above, the paste command merges lines of files. Here's the tool's syntax:

```
paste [OPTION]... [FILE]...
```

And here's how the mage of paste explains it:
```
Write lines consisting of the sequentially corresponding lines from each FILE, separated by TABs,
to standard output. With no FILE, or when FILE is -, read standard input.
```

The following Q&A-styled examples should give you a better idea on how paste works.

### Q1. How to join lines of multiple files using paste command?

Suppose we have three files - file1.txt, file2.txt, and file3.txt - with following contents:

[![How to join lines of multiple files using paste command][1]][2]

And the task is to merge lines of these files in a way that each row of the final output contains index, country, and continent, then you can do that using paste in the following way:

paste file1.txt file2.txt file3.txt

[![result of merging lines][3]][4]

### Q2. How to apply delimiters when using paste?

Sometimes, there can be a requirement to add a delimiting character between entries of each resulting row. This can be done using the **-d** command line option, which requires you to provide the delimiting character you want to use.

For example, to apply a colon (:) as a delimiting character, use the paste command in the following way:

```
paste -d : file1.txt file2.txt file3.txt
```

Here's the output this command produced on our system:

[![How to apply delimiters when using paste][5]][6]

### Q3. How to change the way in which lines are merged?

By default, the paste command merges lines in a way that entries in the first column belongs to the first file, those in the second column are for the second file, and so on and so forth. However, if you want, you can change this so that the merge operation happens row-wise.

This you can do using the **-s** command line option.

```
paste -s file1.txt file2.txt file3.txt
```

Following is the output:

[![How to change the way in which lines are merged][7]][8]

### Q4. How to use multiple delimiters?

Yes, you can use multiple delimiters as well. For example, if you want to use both : and |, you can do that in the following way:

```
paste -d ':|' file1.txt file2.txt file3.txt
```

Following is the output:

[![How to use multiple delimiters][9]][10]

### Q5. How to make sure merged lines are NUL terminated?

By default, lines merged through paste end in a newline. However, if you want, you can make them NUL terminated, something which you can do using the **-z** option.

```
paste -z file1.txt file2.txt file3.txt
```

### Conclusion

As most of you'd agree, the paste command isn't difficult to understand and use. It may offer a limited set of command line options, but the tool does what it claims. You may not require it on daily basis, but paste can be a real-time saver in some scenarios. Just in case you need, [here's the tool's man page][11].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-paste-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/paste-3-files.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/paste-3-files.png
[3]:https://www.howtoforge.com/images/command-tutorial/paste-basic-usage.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/paste-basic-usage.png
[5]:https://www.howtoforge.com/images/command-tutorial/paste-d-option.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/paste-d-option.png
[7]:https://www.howtoforge.com/images/command-tutorial/paste-s-option.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/paste-s-option.png
[9]:https://www.howtoforge.com/images/command-tutorial/paste-d-mult1.png
[10]:https://www.howtoforge.com/images/command-tutorial/big/paste-d-mult1.png
[11]:https://linux.die.net/man/1/paste
