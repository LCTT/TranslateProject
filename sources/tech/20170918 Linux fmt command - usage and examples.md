translating by lujun9972
Linux fmt command - usage and examples
======

Sometimes you may find yourself in a situation where-in the requirement is to format the contents of a text file. For example, the text file contains one word per line, and the task is to format all the words in a single line. Of course, this can be done manually, but not everyone likes doing time consuming stuff manually. Plus, that's just one use-case - the requirement could be anything.

Gladly, there exists a command that can cater to at-least some of the text formatting requirements. The tool in question is dubbed **fmt**. In this tutorial, we will discuss the basics of fmt, as well as some of main features it provides. Please note that all commands and instructions mentioned here have been tested on Ubuntu 16.04LTS.

### Linux fmt command

The fmt command is a simple text formatting tool available to users of the Linux command line. Following is its basic syntax:

fmt [-WIDTH] [OPTION]... [FILE]...

And here's how the man page describes it:

Reformat each paragraph in the FILE(s), writing to standard output. The option -WIDTH is an abbreviated form of --width=DIGITS.

Following are some Q&A-styled examples that should give you a good idea about fmt's usage.

### Q1. How to format contents of file in single line using fmt?

That's what the fmt command does when used in its basic form (sans any options). You only need to pass the filename as an argument.

fmt [file-name]

The following screenshot shows the command in action:

[![format contents of file in single line][1]][2]

So you can see that multiple lines in the file were formatted in a way that everything got clubbed up in a single line. Please note that the original file (file1 in this case) remains unaffected.

### Q2. How to change maximum line width?

By default, the maximum width of a line that fmt command produces in output is 75. However, if you want, you can change that using the **-w** command line option, which requires a numerical value representing the new limit.

fmt -w [n] [file-name]

Here's an example where width was reduced to 20:

[![change maximum line width][3]][4]

### Q3. How to make fmt highlight the first line?

This can be done by making the indentation of the first line different from the rest, something which you can do by using the **-t** command line option.

fmt -t [file-name]

[![make fmt highlight the first line][5]][6]

### Q4. How to make fmt split long lines?

The fmt command is capable of splitting long lines as well, a feature which you can access using the **-s** command line option.

fmt -s [file-name]

Here's an example of this option:

[![make fmt split long lines][7]][8]

### Q5. How to have separate spacing for words and lines?

The fmt command offers a **-u** option, which ensures one space between words and two between sentences. Here's how you can use it:

fmt -u [file-name]

Note that this feature was enabled by default in our case.

### Conclusion

Agreed, fmt offers limited features, but you can't say it has limited audience. Reason being, you never know when you may need it. Here, in this tutorial, we've covered majority of the command line options that fmt offers. For more details, head to the tool's [man page][9].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-fmt-command/

作者：[Himanshu Arora][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/linux_fmt_command/fmt-basic-usage.png
[2]:https://www.howtoforge.com/images/linux_fmt_command/big/fmt-basic-usage.png
[3]:https://www.howtoforge.com/images/linux_fmt_command/fmt-w-option.png
[4]:https://www.howtoforge.com/images/linux_fmt_command/big/fmt-w-option.png
[5]:https://www.howtoforge.com/images/linux_fmt_command/fmt-t-option.png
[6]:https://www.howtoforge.com/images/linux_fmt_command/big/fmt-t-option.png
[7]:https://www.howtoforge.com/images/linux_fmt_command/fmt-s-option.png
[8]:https://www.howtoforge.com/images/linux_fmt_command/big/fmt-s-option.png
[9]:https://linux.die.net/man/1/fmt
