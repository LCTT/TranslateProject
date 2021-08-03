[#]: subject: (Use the Linux terminal to see what files are on your computer)
[#]: via: (https://opensource.com/article/21/8/linux-list-files)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (piaoshi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use the Linux terminal to see what files are on your computer
======
Learn how to use the ls command to list files in the terminal with this
Linux tutorial.
![List files on your computer][1]

To list files on a computer with a graphical interface, you usually open a file manager (**Files** on Linux, **Finder** on MacOS, **Windows Explorer** on Windows), and look at the files.

To list files in a terminal, you use the **ls** command to list all files in the current directory. The **pwd** commands tells you what directory you're currently in.


```
$ pwd
/home/tux
$ ls
example.txt
Documents
Downloads
Music
Pictures
Templates
Videos
```

You can view hidden files with the **\--all** option:


```
$ pwd
/home/tux
$ ls --all
.               Downloads
..              .local
.bashrc         Music
.config         Pictures
example.txt     Templates
Documents       Videos
```

As you can see, the first items listed are dots. The single dot is actually a meta location meaning _the folder you are currently in_. The two dots indicate that you can move back from this location. That is, you are in a folder in another folder. Once you start moving around within your computer, you can use that information to create shortcuts for yourself or to increase the specificity of your paths.

### Files and folders and how to tell the difference

You may notice that it's hard to tell a file from a folder. Some Linux distributions have some nice colors set up so that all folders are blue and the files are white and binary files are pink or green, and so on. If you don't see those colors, you can try **ls --color**. If you're color blind or on a display that doesn't provide colors, you can alternately use the **\--classify** option:


```
$ pwd
/home/tux/Downloads
$ ls --classify
android-info.txt
cheat/
test-script.sh*
```

As you can see, folders are given a trailing slash (`/`) to denote that they are steps within your file system. Binary entities, like zip files and executable programs, are indicated swith an asterisk (`*`).

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/8/linux-list-files

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/ch01.svg__0.png?itok=98wPcbAc (List files on your computer)
