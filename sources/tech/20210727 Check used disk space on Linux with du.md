[#]: subject: (Check used disk space on Linux with du)
[#]: via: (https://opensource.com/article/21/7/check-disk-space-linux-du)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Check used disk space on Linux with du
======
Find out how much disk space you're using with the Linux du command.
![Check disk usage][1]

No matter how much storage space you have, there's always the possibility for it to fill up. On most personal devices, drives get filled up with photos and videos and music, but on servers, it's not unusual for space to diminish due to data in user accounts and log files. Whether you're in charge of managing a multi-user system or just your own laptop, you can check in on disk usage with the `du` command.

By default, `du` provides the amount of disk space used in your current directory, as well as the size of each subdirectory:


```
$ du
12 ./.backups
60 .
```

In this example, my current directory takes up all of 60 KB, 12 KB of which is occupied by the subdirectory `.backups`.

If you find that confusing and would prefer to see all sizes separately, you can use the `--separate-dirs` (or `-S` for short) option:


```
$ du --separate-dirs
12 ./.backups
48 .
```

It's the same information (48 and 12 is 60) but each directory is treated independently of one another.

To see even more detail, use the --all (or -a for short) option, which displays each file in each directory:


```
$ du --separate-dirs --all                
4       ./example.adoc
28      ./graphic.png
4       ./.backups/example.adoc~
12      ./.backups
4       ./index.html
4       ./index.adoc
48      .
```

### See modification time of files

When looking through files to find out what's taking up space, it can be useful to see when a file was last modified. Something that hasn't been touched in a year is a likely candidate for archival, especially if you're running out of space.

To see modification times of files with du, use the `--time` option:


```
$ du --separate-dirs --all --time
28      2021-07-21 11:12        ./graphic.png
4       2021-07-03 10:43        ./example.adoc
4       2021-07-13 13:03        ./index.html
4       2021-07-23 14:18        ./index.adoc
48      2021-07-23 14:19        .
```

### Set a threshold for file size

When reviewing files in the interest of disk space, you may only care about files of nontrivial size. You set a threshold for the file sizes you want to see with the `--threshold` (or `-t` for short) option. For instance, to view only sizes larger than 1 GB:


```
$ \du --separate-dirs --all --time --threshold=1G ~/Footage/
1839008 2021-07-14 13:55        /home/tux/Footage/snowfall.mp4
1577980 2020-04-11 13:10        /home/tux/Footage/waterfall.mp4
8588936 2021-07-14 13:55        /home/tux/Footage/
```

When file sizes get particularly large, they can be difficult to read. Make file sizes easier with the `--human-readable` (or `-h` for short) option:


```
$ \du --separate-dirs --all --time \
\--threshold=1G --human-readable ~/Footage/
1.8G 2021-07-14 13:55        /home/tux/Footage/snowfall.mp4
1.6G 2020-04-11 13:10        /home/tux/Footage/waterfall.mp4
8.5G 2021-07-14 13:55        /home/tux/Footage/
```

### See available disk space

To just get a summary of how much disk space remains on a drive, read our article about the [df command][2].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/check-disk-space-linux-du

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/du-splash.png?itok=nRLlI-5A (Check disk usage)
[2]: https://opensource.com/article/21/7/use-df-check-free-disk-space-linux
