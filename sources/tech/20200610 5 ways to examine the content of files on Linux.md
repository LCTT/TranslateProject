[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (5 ways to examine the content of files on Linux)
[#]: via: (https://www.networkworld.com/article/3561490/5-ways-to-examine-the-content-of-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

5 ways to examine the content of files on Linux
======
How to use the cat, more, head and tail commands to look at the content of Linux files, not just text files.
[mari lezhava / Unsplash][1] [(CC0)][2]

Linux provides many commands for examining the contents of files including **cat**, **more,** **head** and **tail,** but that's just a start.

For one thing, even the most obvious commands have a lot more options than many Linux users ever get around to using. And there are some less obvious commands that offer some unique features. In this post, we’ll both at commands for viewing the contents of files and options for tailoring those views to better cater to your needs.

### cat

The cat command sends the entire contents of text files to your terminal window for viewing. In fact, if you type “cat” followed by the name of a file with thousands of lines, those lines will whiz by your window so fast, you won’t be able to make out much more of it than the last screenful of text. Yet, as familiar as the cat command is to Linux users, even this basic command provides a lot of useful options such as numbering the lines in the output that many of us likely haven’t ever used. To expand on that, not only can you number lines; you have some choices in how you do the numbering.

Numbering every line looks like this:

```
$ cat -n msg
     1  Hello --
     2
     3  I hope you are having a wonderful day!
     4
     5
     6  That's it for ...       now
     7
     8  bye!
     9
    10  s.
```

You can also number only lines with content. Note that a line containing only blanks is not considered “empty” for this command and would be numbered.

```
$ cat -b msg
     1  Hello --

     2  I hope you are having a wonderful day!


     3  That's it for ...       now

     4  bye!

     5  s.
```

The cat command allows you to ignore repeated blank lines with the -s option, but you have to add another command to suppress blanks lines altogether.

```
$ cat -s msg
Hello --

I hope you are having a wonderful day!

That's it for ...       now

bye!

s.
```

To ignore all of the blank lines, just pipe the output from **cat** to a **grep** command as follows. The dot (.) matches text including blank characters, so it will display lines that contain only blanks and only look empty.

```
$ cat msg | grep .
Hello --
I hope you are having a wonderful day!
That's it for ...       now
bye!
s.
```

The **-E** optoin provides a visual cue to show whether there are extra blanks at the ends of lines by sticking a $ at the end of every line.

```
$ cat -E msg
Hello --$
$
I hope you are having a wonderful day!  $
$
$
That's it for ...       now$
$
bye!$
$
s.$
```

With **-A**, you get both the $ characters at the end of each line and tabs showing up as **^I** rather than empty space.

```
$ cat -A msg
Hello --$
$
I hope you are having a wonderful day!$
$
$
That’s it for …^Inow$
$
bye!$
$
s.$
```

### Displaying portions of files with head and tail

The **head** and **tail** commands show the tops or bottoms of files and default to ten lines. You can specify a different number of lines to view by using strings like -3 (show 3 lines) or -11 (show 11 lines). The **tail** command works the same way as **head** but displays the bottoms of files rather than the tops.

```
$ head -3 msg
Hello --
I hope you are having a wonderful day!
$ tail -3 msg
bye!

s.
```

You can also combine **head** and **tail** commands to view text between the tops of bottoms of files. You just have to pick your starting point and how many lines you want to see. In this example, the command would display the second hundred lines in a file and, with **cat**'s help, numbering those lines.

```
$ cat -b mybigfile | head -200 | tail -100
   101  Invoice #2020-06-07a sent to vendor
   ...
```

### Browsing text a screenful at a time with more or less

The **more** command is an obvious choice for browsing through a file’s content a screenful at a time while **less** adds the ability to move up and down in a file by using the up and down keyboard arrows so that you can start scanning and then back up in the file.

### Looking at text files two ways at once with od

The **od** (octal dump) command allows you to view a file both as normal text and as a series of ASCII values (i.e., how that text is actually encoded in the files). As you can see in the example below, the numbered lines show the numeric ASCII values and the alternate lines show the text and non-printable characters.

```
$ od -bc msg
0000000 110 145 154 154 157 040 055 055 012 012 111 040 150 157 160 145
          H   e   l   l   o       -   -  \n  \n   I       h   o   p   e
0000020 040 171 157 165 040 141 162 145 040 150 141 166 151 156 147 040
              y   o   u       a   r   e       h   a   v   i   n   g
0000040 141 040 167 157 156 144 145 162 146 165 154 040 144 141 171 041
          a       w   o   n   d   e   r   f   u   l       d   a   y   !
0000060 012 012 012 124 150 141 164 047 163 040 151 164 040 146 157 162
         \n  \n  \n   T   h   a   t   '   s       i   t       f   o   r
0000100 040 056 056 056 011 156 157 167 012 012 142 171 145 041 012 012
              .   .   .  \t   n   o   w  \n  \n   b   y   e   !  \n  \n
0000120 163 056 012
          s   .  \n
```

Notice how newline characters are shown as **\n** (octal 012) and tabs are shown as **\t** (octal 011).

One of the especially helpful uses of the **od** command is for looking at non-text files for information that identifies the file types. In this case, we see the **JFIF** (JPEG File Interchange Format) label that identifies it as a jpg file to commands like **file** that report on file types. There's a lot of other useful information in there as well, especially if you're curious about how these files are formatted.

In this next command, we are looking at the beginning portion of a jpg file.

```
$ od -bc arrow.jpg | head -12
0000000 377 330 377 340 000 020 112 106 111 106 000 001 001 000 000 001
        377 330 377 340  \0 020   J   F   I   F  \0 001 001  \0  \0 001
0000020 000 001 000 000 377 333 000 103 000 003 002 002 002 002 002 003
         \0 001  \0  \0 377 333  \0   C  \0 003 002 002 002 002 002 003
0000040 002 002 002 003 003 003 003 004 006 004 004 004 004 004 010 006
        002 002 002 003 003 003 003 004 006 004 004 004 004 004  \b 006
0000060 006 005 006 011 010 012 012 011 010 011 011 012 014 017 014 012
        006 005 006  \t  \b  \n  \n  \t  \b  \t  \t  \n  \f 017  \f  \n
0000100 013 016 013 011 011 015 021 015 016 017 020 020 021 020 012 014
         \v 016  \v  \t  \t  \r 021  \r 016 017 020 020 021 020  \n  \f
0000120 022 023 022 020 023 017 020 020 020 377 333 000 103 001 003 003
        022 023 022 020 023 017 020 020 020 377 333  \0   C 001 003 003
```

If we were to ask the **file** command for information on this image file, we might see something like this. The file command is pulling all this descriptive information from data at the beginning of the file.

```
$ file arrow.jpg
arrow.png: JPEG image data, JFIF standard 1.01, aspect ratio, density 1x1, segment length 16, baseline, precision 8, 500x375, components 3
```

### Looking at files as text-based images with jp2a

If you are limited to the command line and want to get an idea what a particular image file contains, you can use a tool like **jp2a** (jpeg to ascii) to give you a character rendition. How recognizable the image will be in this format depends on the file. Don’t expect much as the version of the image you will see is going to put “low res” to the test! This one’s a very low resolution emperor penguin.

```
$ jp2a Emperor_Penguin.jpg
MMMMMMMMWOdkNMMMMMMMMMMMMMMMMMMM
MMMXK0kc.... ,OKMMMMMMMMMMMMMMMM
MMNK0Ol...   :Xx'dNMMMMMMMMMMMMM
MMMMMMMd;lx00Oo. ..xMMMMMMMMMMMM
MMMMMMK.OXMMMMMN,...lMMMMMMMMMMM
MMMMMMx'KXNNMMMMK....0MMMMMMMMMM
MMMMMMx:kkKNWWMMMl.. 'NMMMMMMMMM
MMMMMMddx0NNNWMMMK'...;NMMMMMMMM
MMMMMMck0NNWWWWWMMd  ..lMMMMMMMM
MMMMMM.d0KXNWWWWMMo  ...WMMMMMMM
MMMMMM.xOXNNWNMMMW. ....KMMMMMMM
MMMMMM'kKNKWXWMMMK  ..'.0MMMMMMM
MMMMMMxckXNNNNMMMX  .:..XMMMMMMM
MMMMMMW;xKNWWWMMMM. .;. NMMMMMMM
MMMMMMMok0NNWNWMMMx .l..MMMMMMMM
MMMMMMMkxOKXWXNMMMMl.:'dMMMMMMMM
MMMMMMM0dKOdKXXNMMMMNx,WMMMMMMMM
MMMMMMMWoKxldXKNNMMMMM;MMMMMMMMM
MMMMMMMMxxxxdNWNXNMMMM;MMMMMMMMM
MMMMMMMMxOcoo0XOOOOWMW,kMMMMMMMM
MMMMMMM0xK;.cO0dNX:0XXd;NMMMMMMM
MMMNkdd:,'ldXXO0xl;x0kx:;lKMMMMM
MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
```

#### Wrap-Up

There are quite a few commands on Linux for examining the content of files in various ways. Some have options which can prove very helpful when you need to manipulate file contents. Others are just … interesting.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3561490/5-ways-to-examine-the-content-of-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://unsplash.com/photos/q65bNe9fW-w
[2]: https://creativecommons.org/publicdomain/zero/1.0/
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
