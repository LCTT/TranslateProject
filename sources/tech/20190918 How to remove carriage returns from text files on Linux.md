[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to remove carriage returns from text files on Linux)
[#]: via: (https://www.networkworld.com/article/3438857/how-to-remove-carriage-returns-from-text-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to remove carriage returns from text files on Linux
======
When carriage returns (also referred to as Ctrl+M's) get on your nerves, don't fret. There are several easy ways to show them the door.
[Kim Siever][1]

Carriage returns go back a long way – as far back as typewriters on which a mechanism or a lever swung the carriage that held a sheet of paper to the right so that suddenly letters were being typed on the left again. They have persevered in text files on Windows, but were never used on Linux systems. This incompatibility sometimes causes problems when you’re trying to process files on Linux that were created on Windows, but it's an issue that is very easily resolved.

The carriage return, also referred to as **Ctrl+M**, character would show up as an octal 15 if you were looking at the file with an **od** octal dump) command. The characters **CRLF** are often used to represent the carriage return and linefeed sequence that ends lines on Windows text files. Those who like to gaze at octal dumps will spot the **\r \n**. Linux text files, by comparison, end with just linefeeds.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

Here's a sample of **od** output with the lines containing the **CRLF** characters in both octal and character form highlighted.

```
$ od -bc testfile.txt
0000000 124 150 151 163 040 151 163 040 141 040 164 145 163 164 040 146
          T   h   i   s       i   s       a       t   e   s   t       f
0000020 151 154 145 040 146 162 157 155 040 127 151 156 144 157 167 163
          i   l   e       f   r   o   m       W   i   n   d   o   w   s
0000040 056 015 012 111 164 047 163 040 144 151 146 146 145 162 145 156  <==
          .  \r  \n   I   t   '   s       d   i   f   f   e   r   e   n  <==
0000060 164 040 164 150 141 156 040 141 040 125 156 151 170 040 164 145
          t       t   h   a   n       a       U   n   i   x       t   e
0000100 170 164 040 146 151 154 145 015 012 167 157 165 154 144 040 142  <==
          x   t       f   i   l   e  \r  \n   w   o   u   l   d       b  <==
```

While these characters don’t represent a huge problem, they can sometimes interfere when you want to parse the text files in some way and don’t want to have to code around their presence or absence.

### 3 ways to remove carriage return characters from text files

Fortunately, there are several ways to easily remove carriage return characters. Here are three options:

#### dos2unix

You might need to go through the trouble of installing it, but **dos2unix** is probably the easiest way to turn Windows text files into Unix/Linux text files. One command with one argument, and you’re done. No second file name is required. The file will be changed in place.

```
$ dos2unix testfile.txt
dos2unix: converting file testfile.txt to Unix format...
```

You should see the file length decrease, depending on how many lines it contains. A file with 100 lines would likely shrink by 99 characters, since only the last line will not end with the **CRLF** characters.

Before:

```
-rw-rw-r--   1 shs  shs        121 Sep 14 19:11 testfile.txt
```

After:

```
-rw-rw-r--   1 shs  shs        118 Sep 14 19:12 testfile.txt
```

If you need to convert a large collection of files, don't fix them one at a time. Instead, put them all in a directory by themselves and run a command like this:

```
$ find . -type f -exec dos2unix {} \;
```

In this command, we use find to locate regular files and then run the **dos2unix** command to convert them one at a time. The {} in the command is replaced by the filename. You should be sitting in the directory with the files when you run it. This command could damage other types of files, such as those that contain octal 15 characters in some context other than a text file (e.g., bytes in an image file).

#### sed

You can also use **sed**, the stream editor, to remove carriage returns. You will, however, have to supply a second file name. Here’s an example:

```
$ sed -e “s/^M//” before.txt > after.txt
```

One important thing to note is that you DON’T type what that command appears to be. You must enter **^M** by typing **Ctrl+V** followed by **Ctrl+M**. The “s” is the substitute command. The slashes separate the text we’re looking for (the Ctrl+M) and the text (nothing in this case) that we’re replacing it with.

#### vi

You can even remove carriage return (**Ctrl+M**) characters with **vi**, although this assumes you’re not running through hundreds of files and are maybe making some other changes, as well. You would type “**:**” to go to the command line and then type the string shown below. As with **sed**, the **^M** portion of this command requires typing **Ctrl+V** to get the **^** and then **Ctrl+M** to insert the **M**. The **%s** is a substitute operation, the slashes again separate the characters we want to remove and the text (nothing) we want to replace it with. The “**g**” (global) means to do this on every line in the file.

```
:%s/^M//g
```

#### Wrap-up

The **dos2unix** command is probably the easiest to remember and most reliable way to remove carriage returns from text files. Other options are a little trickier to use, but they provide the same basic function.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3438857/how-to-remove-carriage-returns-from-text-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/kmsiever/5895380540/in/photolist-9YXnf5-cNmpxq-2KEvib-rfecPZ-9snnkJ-2KAcDR-dTxzKW-6WdgaG-6H5i46-2KzTZX-7cnSw7-e3bUdi-a9meh9-Zm3pD-xiFhs-9Hz6YM-ar4DEx-4PXAhw-9wR4jC-cihLcs-asRFJc-9ueXvG-aoWwHq-atwL3T-ai89xS-dgnntH-5en8Te-dMUDd9-aSQVn-dyZqij-cg4SeS-abygkg-f2umXt-Xk129E-4YAeNn-abB6Hb-9313Wk-f9Tot-92Yfva-2KA7Sv-awSCtG-2KDPzb-eoPN6w-FE9oi-5VhaNf-eoQgx7-eoQogA-9ZWoYU-7dTGdG-5B1aSS
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
