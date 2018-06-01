The Source Code Line Counter And Analyzer
======

![](https://www.ostechnix.com/wp-content/uploads/2018/05/ohcount-720x340.png)

**Ohcount** is simple command line utility that analyzes the source code and prints the total number lines of a source code file. It is not just source code line counter, but also detects the popular open source licenses, such as GPL, within a large directory of source code. Additionally, Ohcount can also detect code that targets a particular programming API such as KDE or Win32. As of writing this guide, Ohcount currently supports over 70 popular programming languages. It is written in **C** programming language and is originally developed by **Ohloh** for generating the reports at [www.openhub.net][1].

In this brief tutorial, we are going to how to install and use Ohcount to analyze source code files in Debian, Ubuntu and its variants like Linux Mint.

### Ohcount – The source code line counter

**Installation**

Ohcount is available in the default repositories in Debian and Ubuntu and its derivatives, so you can install it using APT package manager as shown below.
```
$ sudo apt-get install ohcount

```

**Usage**

Ohcount usage is extremely simple.

All you have to do is go to the directory where you have the source code that you want to analyze and ohcount program.

Say for example, I am going to analyze the source of code of [**coursera-dl**][2] program.
```
$ cd coursera-dl-master/

$ ohcount

```

Here is the line count summary of Coursera-dl program:

![][4]

As you can see, the source code of Coursera-dl program contains 141 files in total. The first column specifies the name of programming languages that the source code consists of. The second column displays the number of files in each programming languages. The third column displays the total number of lines in each programming language. The fourth and fifth lines displays how many lines of comments and its percentage in the code. The sixth column displays the number of blank lines. And the final and seventh column displays total line of codes in each language and the gross total of coursera-dl program.

Alternatively, mention the complete path directly like below.
```
$ ohcount coursera-dl-master/

```

The path can be any number of individual files or directories. Directories will be probed recursively. If no path is given, the current directory will be used.

If you don’t want to mention the whole directory path each time, just CD into it and use ohcount utility to analyze the codes in that directory.

To count lines of code per file, use **-i** flag.
```
$ ohcount -i

```

**Sample output:**

![][5]

Ohcount utility can also show the annotated source code when you use **-a** flag.
```
$ ohcount -a

```

![][6]

As you can see, the contents of all source code files found in this directory is displayed. Each line is prefixed with a tab-delimited language name and semantic categorization (code, comment, or blank).

Some times, you just want to know the license used in the source code. To do so, use **-l** flag.
```
$ ohcount -l
lgpl3, coursera_dl.py
gpl coursera_dl.py

```

Another available option is **-re** , which is used to print raw entity information to the screen (mainly for debugging).
```
$ ohcount -re

```

To find all source code files within the given paths recursively, use **-d** flag.
```
$ ohcount -d

```

The above command will display all source code files in the current working directory and the each file name will be prefixed with a tab-delimited language name.

To know more details and supported options, run:
```
$ ohcount --help

```

Ohcount is quite useful for developers who wants to analysis the code written by themselves or other developers, and check how many lines that code contains, which languages have been used to write those codes, and the license details of the code etc.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/ohcount-the-source-code-line-counter-and-analyzer/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:http://www.openhub.net
[2]:https://www.ostechnix.com/coursera-dl-a-script-to-download-coursera-videos/
[4]:http://www.ostechnix.com/wp-content/uploads/2018/05/ohcount-2.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/05/ohcount-1-5.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/05/ohcount-2-2.png
