[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Using multitail on Linux)
[#]: via: (https://www.networkworld.com/article/3445228/using-multitail-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Using multitail on Linux
======

[Glen Bowman][1] [(CC BY-SA 2.0)][2]

The **multitail** command can be very helpful whenever you want to watch activity on a number of files at the same time – especially log files. It works like a multi-windowed **tail -f** command. That is, it displays the bottoms of files and new lines as they are being added. While easy to use in general, **multitail** does provide some command-line and interactive options that you should be aware of before you start to use it routinely.

### Basic multitail-ing

The simplest use of **multitail** is to list the names of the files that you wish to watch on the command line. This command splits the screen horizontally (i.e., top and bottom), displaying the bottom of each of the files along with updates.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

```
$ multitail /var/log/syslog /var/log/dmesg
```

The display will be split like this:

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

```
+-----------------------+
|                       |
|                       |
+-----------------------|
|                       |
|                       |
+-----------------------+
```

The lines displayed from each of the files would be followed by a single line per file that includes the assigned file number (starting with 00), the file name, the file size, and the date and time the most recent content was added. Each of the files will be allotted half the space available regardless of its size or activity. For example:

```
content lines from my1.log
more content
more lines

00] my1.log                                    59KB - 2019/10/14 12:12:09
content lines from my2.log
more content
more lines

01] my2.log                                   120KB - 2019/10/14 14:22:29
```

Note that **multitail** will not complain if you ask it to display non-text files or files that you have no permission to view; you just won't see the contents.

You can also use wild cards to specify the files that you want to watch:

```
$ multitail my*.log
```

One thing to keep in mind is that **multitail** is going to split the screen evenly. If you specify too many files, you will see only a few lines from each and you will only see the first seven or so of the requested files if you list too many unless you take extra steps to view the later files (see the scrolling option described below). The exact result depends on the how many lines are available in your terminal window.

Press **q** to quit **multitail** and return to your normal screen view.

### Dividing the screen

**Multitail** will split your terminal window vertically (i.e., left and right) if you prefer. For this, use the **-s** option. If you specify three files, the right side of your screen will be divided horizontally as well. With four, you'll have four equal-sized windows.

```
+-----------+-----------+     +-----------+-----------+     +-----------+-----------+
|           |           |     |           |           |     |           |           |
|           |           |     |           |           |     |           |           |
|           |           |     |           +-----------+     +-----------+-----------+
|           |           |     |           |           |     |           |           |
|           |           |     |           |           |     |           |           |
+-----------+-----------+     +-----------+-----------+     +-----------+-----------+
         2 files                       3 files                       4 files
```

Use **multitail -s 3 file1 file2 file3** if you want to split the screen into three columns.

```
+-------+-------+-------+
|       |       |       |
|       |       |       |
|       |       |       |
|       |       |       |
|       |       |       |
+-------+-------+-------+
    3 files with -s 3
```

### Scrolling

You can scroll up and down through displayed files, but you need to press **b** to bring up a selection menu and then use the up and arrow buttons to select the file you wish to scroll through. Then press the **enter** key. You can then scroll through the lines in an enlarged area, again using the up and down arrows. Press **q** when you're done to go back to the normal view.

### Getting Help

Pressing **h** in **multitail** will open a help menu describing some of the basic operations, though the man page provides quite a bit more information and is worth perusing if you want to learn even more about using this tool.

**Multitail** will not likely be installed on your system by default, but using **apt-get** or **yum** should get you to an easy install. The tool provides a lot of functionality, but with its character-based display, window borders will just be strings of **q**'s and **x**'s. It's a very handy when you need to keep an eye on file updates.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3445228/using-multitail-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/glenbowman/7992498919/in/photolist-dbgDtv-gHfRRz-5uRM4v-gHgFnz-6sPqTZ-5uaP7H-USFPqD-pbtRUe-fiKiYn-nmgWL2-pQNepR-q68p8d-dDsUxw-dbgFKG-nmgE6m-DHyqM-nCKA4L-2d7uFqH-Kbqzk-8EwKg-8Vy72g-2X3NSN-78Bv84-buKWXF-aeM4ok-yhweWf-4vwpyX-9hu8nq-9zCoti-v5nzP5-23fL48r-24y6pGS-JhWDof-6zF75k-24y6nHS-9hr19c-Gueh6G-Guei7u-GuegFy-24y6oX5-26qu5iX-wKrnMW-Gueikf-24y6oYh-27y4wwA-x4z19F-x57yP4-24BY6gc-24y6nPo-QGwbkf
[2]: https://creativecommons.org/licenses/by-sa/2.0/legalcode
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
