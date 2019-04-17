[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to identify duplicate files on Linux)
[#]: via: (https://www.networkworld.com/article/3387961/how-to-identify-duplicate-files-on-linux.html#tk.rss_all)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to identify duplicate files on Linux
======
Some files on a Linux system can appear in more than one location. Follow these instructions to find and identify these "identical twins" and learn why hard links can be so advantageous.
![Archana Jarajapu \(CC BY 2.0\)][1]

Identifying files that share disk space relies on making use of the fact that the files share the same inode — the data structure that stores all the information about a file except its name and content. If two or more files have different names and file system locations, yet share an inode, they also share content, ownership, permissions, etc.

These files are often referred to as "hard links" — unlike symbolic links that simply point to other files by containing their names. Symbolic links are easy to pick out in a file listing by the "l" in the first position and **- >** symbol that refers to the file being referenced.

```
$ ls -l my*
-rw-r--r-- 4 shs shs   228 Apr 12 19:37 myfile
lrwxrwxrwx 1 shs shs     6 Apr 15 11:18 myref -> myfile
-rw-r--r-- 4 shs shs   228 Apr 12 19:37 mytwin
```

Identifying hard links in a single directory is not as obvious, but it is still quite easy. If you list the files using the **ls -i** command and sort them by inode number, you can pick out the hard links fairly easily. In this type of ls output, the first column shows the inode numbers.

```
$ ls -i | sort -n | more
 ...
 788000 myfile  <==
 788000 mytwin  <==
 801865 Name_Labels.pdf
 786692 never leave home angry
 920242 NFCU_Docs
 800247 nmap-notes
```

Scan your output looking for identical inode numbers and any matches will tell you what you want to know.

**[ Also see:[Invaluable tips and tricks for troubleshooting Linux][2] ]**

If, on the other hand, you simply want to know if one particular file is hard-linked to another file, there's an easier way than scanning through a list of what may be hundreds of files. The find command's **-samefile** option will do the work for you.

```
$ find . -samefile myfile
./myfile
./save/mycopy
./mytwin
```

Notice that the starting location provided to the find command will determine how much of the file system is scanned for matches. In the above example, we're looking in the current directory and subdirectories.

Adding output details using find's **-ls** option might be more convincing:

```
$ find . -samefile myfile -ls
 788000    4 -rw-r--r--   4 shs    shs      228 Apr 12 19:37 ./myfile
 788000    4 -rw-r--r--   4 shs    shs      228 Apr 12 19:37 ./save/mycopy
 788000    4 -rw-r--r--   4 shs    shs      228 Apr 12 19:37 ./mytwin
```

The first column shows the inode number. Then we see file permissions, links, owner, file size, date information, and the names of the files that refer to the same disk content. Note that the link field in this case is a "4" not the "3" we might expect, telling us that there's another link to this same inode as well (but outside our search range).

If you want to look for all instances of hard links in a single directory, you could try a script like this that will create the list and look for the duplicates for you:

```
#!/bin/bash

# seaches for files sharing inodes

prev=""

# list files by inode
ls -i | sort -n > /tmp/$0

# search through file for duplicate inode #s
while read line
do
    inode=`echo $line | awk '{print $1}'`
    if [ "$inode" == "$prev" ]; then
        grep $inode /tmp/$0
    fi
    prev=$inode
done < /tmp/$0

# clean up
rm /tmp/$0

$ ./findHardLinks
 788000 myfile
 788000 mytwin
```

You can also use the find command to look for files by inode number as in this command. However, this search could involve more than one file system, so it is possible that you will get false results, since the same inode number might be used in another file system where it would not represent the same file. If that's the case, other file details will not be identical.

```
$ find / -inum 788000 -ls 2> /dev/null
 788000   4 -rw-r--r--   4 shs   shs    228 Apr 12 19:37 /tmp/mycopy
 788000   4 -rw-r--r--   4 shs   shs    228 Apr 12 19:37 /home/shs/myfile
 788000   4 -rw-r--r--   4 shs   shs    228 Apr 12 19:37 /home/shs/save/mycopy
 788000   4 -rw-r--r--   4 shs   shs    228 Apr 12 19:37 /home/shs/mytwin
```

Note that error output was shunted off to /dev/null so that we didn't have to look at all the "Permission denied" errors that would have otherwise been displayed for other directories that we're not allowed to look through.

Also, scanning for files that contain the same content but don't share inodes (i.e., simply file copies) would take considerably more time and effort.

Join the Network World communities on [Facebook][3] and [LinkedIn][4] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3387961/how-to-identify-duplicate-files-on-linux.html#tk.rss_all

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/04/reflections-candles-100793651-large.jpg
[2]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[3]: https://www.facebook.com/NetworkWorld/
[4]: https://www.linkedin.com/company/network-world
