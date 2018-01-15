translating by lujun9972
Linux size Command Tutorial for Beginners (6 Examples)
======

As some of you might already know, an object or executable file in Linux consists of several sections (like txt and data). In case you want to know the size of each section, there exists a command line utility - dubbed **size** \- that provides you this information. In this tutorial, we will discuss the basics of this tool using some easy to understand examples.

But before we do that, it's worth mentioning that all examples mentioned in this article have been tested on Ubuntu 16.04LTS.

## Linux size command

The size command basically lists section sizes as well as total size for the input object file(s). Here's the syntax for the command:
```
size [-A|-B|--format=compatibility]
            [--help]
            [-d|-o|-x|--radix=number]
            [--common]
            [-t|--totals]
            [--target=bfdname] [-V|--version]
            [objfile...]
```

And here's how the man page describes this utility:
```
The GNU size utility lists the section sizes---and the total size---for each of the object or archive files objfile in its argument list. By default, one line of output is generated for each object file or each module in an archive.

objfile... are the object files to be examined. If none are specified, the file "a.out" will be used.
```

Following are some Q&A-styled examples that'll give you a better idea about how the size command works.

## Q1. How to use size command?

Basic usage of size is very simple. All you have to do is to pass the object/executable file name as input to the tool. Following is an example:

```
size apl
```

Following is the output the above command produced on our system:

[![How to use size command][1]][2]

The first three entries are for text, data, and bss sections, with their corresponding sizes. Then comes the total in decimal and hexadecimal formats. And finally, the last entry is for the filename.

## Q2. How to switch between different output formats?

The default output format, the man page for size says, is similar to the Berkeley's format. However, if you want, you can go for System V convention as well. For this, you'll have to use the **\--format** option with SysV as value.

```
size apl --format=SysV
```

Here's the output in this case:

[![How to switch between different output formats][3]][4]

## Q3. How to switch between different size units?

By default, the size of sections is displayed in decimal. However, if you want, you can have this information on octal as well as hexadecimal. For this, use the **-o** and **-x** command line options.

[![How to switch between different size units][5]][6]

Here's what the man page says about these options:
```
-d
-o
-x
--radix=number

Using one of these options, you can control whether the size of each section is given in decimal
(-d, or --radix=10); octal (-o, or --radix=8); or hexadecimal (-x, or --radix=16).  In
--radix=number, only the three values (8, 10, 16) are supported. The total size is always given in
two radices; decimal and hexadecimal for -d or -x output, or octal and hexadecimal if you're using
-o.
```

## Q4. How to make size command show totals of all object files?

If you are using size to find out section sizes for multiple files in one go, then if you want, you can also have the tool provide totals of all column values. You can enable this feature using the **-t** command line option.

```
size -t [file1] [file2] ...
```

The following screenshot shows this command line option in action:

[![How to make size command show totals of all object files][7]][8]

The last row in the output has been added by the **-t** command line option.

## Q5. How to make size print total size of common symbols in each file?

If you are running the size command with multiple input files, and want the command to display common symbols in each file, then you can do this with the **\--common** command line option.

```
size --common [file1] [file2] ...
```

It's also worth mentioning that when using Berkeley format these are included in the bss size.

## Q6. What are the other available command line options?

Aside from the ones discussed until now, size also offers some generic command line options like **-v** (for version info) and **-h** (for summary of eligible arguments and options)

[![What are the other available command line options][9]][10]

In addition, you can also make size read command-line options from a file. This you can do using the **@file** option. Following are some details related to this option:
```
The options read are inserted in place of the original @file option. If file does not exist, or
 cannot be read, then the option will be treated literally, and not removed. Options in file are
separated by whitespace. A whitespace character may be included in an option by surrounding the
entire option in either single or double quotes. Any character (including a backslash) may be
included by prefixing the character to be included with a backslash. The file may itself contain
additional @file options; any such options will be processed recursively.
```

## Conclusion

One thing is clear, the size command isn't for everybody. It's aimed at only those who deal with the structure of object/executable files in Linux. So if you are among the target audience, practice the options we've discussed here, and you should be ready to use the tool on daily basis. For more information on size, head to its [man page][11].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-size-command/

作者：[Himanshu Arora][a]
译者：[lujun9972](https://github.com/lujun9972)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/images/command-tutorial/size-basic-usage.png
[2]:https://www.howtoforge.com/images/command-tutorial/big/size-basic-usage.png
[3]:https://www.howtoforge.com/images/command-tutorial/size-format-option.png
[4]:https://www.howtoforge.com/images/command-tutorial/big/size-format-option.png
[5]:https://www.howtoforge.com/images/command-tutorial/size-o-x-options.png
[6]:https://www.howtoforge.com/images/command-tutorial/big/size-o-x-options.png
[7]:https://www.howtoforge.com/images/command-tutorial/size-t-option.png
[8]:https://www.howtoforge.com/images/command-tutorial/big/size-t-option.png
[9]:https://www.howtoforge.com/images/command-tutorial/size-v-x1.png
[10]:https://www.howtoforge.com/images/command-tutorial/big/size-v-x1.png
[11]:https://linux.die.net/man/1/size
