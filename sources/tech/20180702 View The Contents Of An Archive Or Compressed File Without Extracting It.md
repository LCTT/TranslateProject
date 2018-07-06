View The Contents Of An Archive Or Compressed File Without Extracting It
======
![](https://www.ostechnix.com/wp-content/uploads/2018/07/View-The-Contents-Of-An-Archive-Or-Compressed-File-720x340.png)

In this tutorial, we are going to learn how to view the contents of an Archive and/or Compressed file without actually extracting it in Unix-like operating systems. Before going further, let be clear about Archive and compress files. There is significant difference between both. The Archiving is the process of combining multiple files or folders or both into a single file. In this case, the resulting file is not compressed. The compressing is a method of combining multiple files or folders or both into a single file and finally compress the resulting file. The archive is not a compressed file, but the compressed file can be an archive. Clear? Well, let us get to the topic.

### View The Contents Of An Archive Or Compressed File Without Extracting It

Thanks to Linux community, there are many command line applications are available to do it. Let us going to see some of them with examples.

**1\. Using Vim Editor**

Vim is not just an editor. Using Vim, we can do numerous things. The following command displays the contents of an compressed archive file without decompressing it.
```
$ vim ostechnix.tar.gz

```

![][2]

You can even browse through the archive and open the text files (if there are any) in the archive as well. To open a text file, just put the mouse cursor in-front of the file using arrow keys and hit ENTER to open it.


**2\. Using Tar command**

To list the contents of a tar archive file, run:
```
$ tar -tf ostechnix.tar
ostechnix/
ostechnix/image.jpg
ostechnix/file.pdf
ostechnix/song.mp3

```

Or, use **-v** flag to view the detailed properties of the archive file, such as permissions, file owner, group, creation date etc.
```
$ tar -tvf ostechnix.tar
drwxr-xr-x sk/users 0 2018-07-02 19:30 ostechnix/
-rw-r--r-- sk/users 53632 2018-06-29 15:57 ostechnix/image.jpg
-rw-r--r-- sk/users 156831 2018-06-04 12:37 ostechnix/file.pdf
-rw-r--r-- sk/users 9702219 2018-04-25 20:35 ostechnix/song.mp3

```


**3\. Using Rar command**

To view the contents of a rar file, simply do:
```
$ rar v ostechnix.rar

RAR 5.60 Copyright (c) 1993-2018 Alexander Roshal 24 Jun 2018
Trial version Type 'rar -?' for help

Archive: ostechnix.rar
Details: RAR 5

Attributes Size Packed Ratio Date Time Checksum Name
----------- --------- -------- ----- ---------- ----- -------- ----
-rw-r--r-- 53632 52166 97% 2018-06-29 15:57 70260AC4 ostechnix/image.jpg
-rw-r--r-- 156831 139094 88% 2018-06-04 12:37 C66C545E ostechnix/file.pdf
-rw-r--r-- 9702219 9658527 99% 2018-04-25 20:35 DD875AC4 ostechnix/song.mp3
----------- --------- -------- ----- ---------- ----- -------- ----
9912682 9849787 99% 3

```

**4\. Using Unrar command**

You can also do the same using **Unrar** command with **l** flag as shown below.
```
$ unrar l ostechnix.rar

UNRAR 5.60 freeware Copyright (c) 1993-2018 Alexander Roshal

Archive: ostechnix.rar
Details: RAR 5

Attributes Size Date Time Name
----------- --------- ---------- ----- ----
-rw-r--r-- 53632 2018-06-29 15:57 ostechnix/image.jpg
-rw-r--r-- 156831 2018-06-04 12:37 ostechnix/file.pdf
-rw-r--r-- 9702219 2018-04-25 20:35 ostechnix/song.mp3
----------- --------- ---------- ----- ----
9912682 3

```

**5\. Using Zip command**

To view the contents of a zip file without extracting it, use the following zip command:
```
$ zip -sf ostechnix.zip
Archive contains:
Life advices.jpg
Total 1 entries (597219 bytes)

```

**6. Using Unzip command
**

You can also use Unzip command with -l flag to display the contents of a zip file like below.
```
$ unzip -l ostechnix.zip
Archive: ostechnix.zip
Length Date Time Name
--------- ---------- ----- ----
597219 2018-04-09 12:48 Life advices.jpg
--------- -------
597219 1 file

```


**7\. Using Zipinfo command**
```
$ zipinfo ostechnix.zip
Archive: ostechnix.zip
Zip file size: 584859 bytes, number of entries: 1
-rw-r--r-- 6.3 unx 597219 bx defN 18-Apr-09 12:48 Life advices.jpg
1 file, 597219 bytes uncompressed, 584693 bytes compressed: 2.1%

```

As you can see, the above command displays the contents of the zip file, its permissions, creating date, and percentage of compression etc.

**8. Using Zcat command
**

To view the contents of a compressed archive file without extracting it using **zcat** command, we do:
```
$ zcat ostechnix.tar.gz

```

The zcat is same as “gunzip -c” command. So, you can also use the following command to view the contents of the archive/compressed file:
```
$ gunzip -c ostechnix.tar.gz

```

**9. Using Zless command
**

To view the contents of an archive/compressed file using Zless command, simply do:
```
$ zless ostechnix.tar.gz

```

This command is similar to “less” command where it displays the output page by page.

**10. Using Less command
**

As you might already know, the **less** command can be used to open a file for interactive reading, allowing scrolling and search.

Run the following command to view the contents of an archive/compressed file using less command:
```
$ less ostechnix.tar.gz

```

And, that’s all for now. You know now how to view the contents of an archive of compressed file using various commands in Linux. Hope you find this useful. More good stuffs to come. Stay tuned!

Cheers!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-view-the-contents-of-an-archive-or-compressed-file-without-extracting-it/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2018/07/vim.png
