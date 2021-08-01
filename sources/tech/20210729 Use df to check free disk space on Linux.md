[#]: subject: (Use df to check free disk space on Linux)
[#]: via: (https://opensource.com/article/21/7/check-disk-space-linux-df)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)
[#]: collector: (lujun9972)
[#]: translator: (piaoshi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use df to check free disk space on Linux
======
Find out how much Linux disk space you have left with the df command.
![Free disk space][1]

Drive space isn't quite as precious as it was in the early days of computing, but no matter how much space you have, there's always the potential to run out. Computers need a little space just to operate, so it's important to check occasionally to ensure you haven't inadvertently used up literally _all_ the space available on your drive. In the Linux terminal, you can do that with the `df` command.

The df command displays the amount of disk space available on the file system.

To make the output easy for you to read, you can use the `--human-readable` (or `-h` for short) option:


```
$ df --human-readable
Filesystem      Size  Used Avail Use% Mounted on
/dev/sda1       1.0T  525G  500G  52% /
```

In this example, the computer's drive is 52% full, with 500 GB free for use.

Because Linux views its file system holistically across all mounted devices, the df command provides you details for every storage device attached to your computer. If you have lots of drives, then the output reflects that:


```
$ df --human-readable
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       110G   45G   61G  43% /
devtmpfs         12G     0   12G   0% /dev
tmpfs            12G  848K   12G   1% /run
/dev/sda1       1.6T  1.3T  191G  87% /home
/dev/sdb1       917G  184G  687G  22% /penguin
/dev/sdc1        57G   50G  4.5G  92% /sneaker
/dev/sdd1       3.7T  2.4T  1.3T  65% /tux
```

In this example, the `/home` directory of the computer is 87% full, with 191 GB free.

### See total disk space available

If you do have a complex file system and would like to see the total space across all drives, use the `--total` option:


```
$ df --human-readable --total
Filesystem      Size  Used Avail Use% Mounted on
/dev/root       110G   45G   61G  43% /
devtmpfs         12G     0   12G   0% /dev
tmpfs            12G  848K   12G   1% /run
/dev/sda1       1.6T  1.3T  191G  87% /home
/dev/sdb1       917G  184G  687G  22% /penguin
/dev/sdc1        57G   50G  4.5G  92% /sneaker
/dev/sdd1       3.7T  2.4T  1.3T  65% /tux
total           6.6T  4.0T  2.5T  62% -
```

The final line of output provides the total space of the filesystem, total space used, total space available.

### See disk space usage

To just get a summary of what's occupying the space on your drives, read our article about the [du command][2].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/7/check-disk-space-linux-df

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/df-splash.png?itok=AGXQm737 (Free disk space)
[2]: https://opensource.com/article/21/7/check-used-disk-space-linux-du
