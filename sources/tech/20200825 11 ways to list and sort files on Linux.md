[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (11 ways to list and sort files on Linux)
[#]: via: (https://www.networkworld.com/article/3572590/11-ways-to-list-and-sort-files-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

11 ways to list and sort files on Linux
======
Linux commands can provide details on files and show options for customizing file listings, but can also reach as deeply into a file system as you care to look.
Thinkstock

There are many ways to list files and display information about them on Linux systems. This post reviews a number of commands that provide details on files and provides options for customizing your file listings to meet your needs.

Most of the commands list files within individual directories while others reach as deeply into a file system as you care to look.

The primary command for listing files is, of course, **ls**. This command, however, has an extensive number of options for finding and listing just the files you want to see. Plus, there's always **find** for helping with very specific file searches.

### Listing files by name

The easiest way to list files by name is simply to list them using the **ls** command. Listing files by name (alphanumeric order) is, after all, the default. You can choose the **ls** (no details) or **ls -l** (lots of details) to determine your view.

```
$ ls | head -6
8pgs.pdf
Aesthetics_Thank_You.pdf
alien.pdf
Annual_Meeting_Agenda-20190602.pdf
bigfile.bz2
bin
$ ls -l | head -6
-rw-rw-r--  1 shs     shs      10886 Mar 22  2019 8pgs.pdf
-rw-rw-r--  1 shs     shs     284003 May 11  2019 Aesthetics_Thank_You.pdf
-rw-rw-r--  1 shs     shs      38282 Jan 24  2019 alien.pdf
-rw-rw-r--  1 shs     shs      97358 May 19  2019 Annual_Meeting_20190602.pdf
-rw-rw-r--  1 shs     shs   18115234 Apr 16 17:36 bigfile.bz2
drwxrwxr-x  4 shs     shs    8052736 Jul 10 13:17 bin
```

Pipe the output of **ls** to the **more** command if you want to review your listing a screenful at a time.

### Listing files in reverse name order

To reverse the listing of files by name, add the **-r** (reverse) option. This will be like turning the normal listing upside down.

```
$ ls -r
$ ls -lr
```

### Listing files by file extension

The **ls** command doesn’t analyze file types by content, but works with file names. There is, however, a command option that can list files by extension. If you add the **-X** option, **ls** will sort files by name within each extension category. For example, it will list files without extensions first (in alphanumeric order) followed by files with extensions like .1, .bz2, .c and so on.

### Listing directories only

By default, the **ls** command will show both files and directories. If you want to list _only_ directories, you can use the **-d** option. You will get a listing like this one:

```
$ ls -d */
1/     backups/     modules/       projects/     templates/
2/     html/        patches/       public/       videos/
bin/   new/         private/       save/
```

### Listing files by size

If you want to list files in size order, add the **-S** option. Note, however, that this won't actually show you the sizes (along with other file details) unless you also add the **-l** (long listing) option. When listing files by size, it's generally helpful to see that the command is doing what you asked. Notice that the default is to show the largest files first. Add the **-r** option to reverse this (i.e., **ls -lSr**).

```
$ ls -lS
total 959492
-rw-rw-r--  1 shs   shs  357679381 Sep 19  2019 sav-linux-free-9.tgz
-rw-rw-r--  1 shs   shs  103270400 Apr 16 17:38 bigfile
-rw-rw-r--  1 shs   shs   79117862 Oct  5  2019 Nessus-8.7.1-ubuntu1110_amd64.deb
```

### Listing files by owner

If you want to list files by owner (e.g., in a shared directory), you can pass the output of the **ls** command to **sort** and pick out the owner column by adding **-k3** to sort on the third field.

```
$ ls -l | sort -k3 | more
total 56
-rw-rw-r-- 1 dory  shs      0 Aug 23 12:27 tasklist
drwx------ 2 gdm   gdm   4096 Aug 21 17:12 tracker-extract-files.121
srwxr-xr-x 1 root  root     0 Aug 21 17:12 ntf_listenerc0c6b8b4567
drwxr-xr-x 2 root  root  4096 Aug 21 17:12 hsperfdata_root
              ^
              |
```

In fact, you can sort on any field this way (e.g., year). Just be careful to add an “n” – **-k5n** – if you’re sorting on a field which is numeric or you'll be sorting in alphanumeric order. This sorting technique is useful for sorting file contents as well, not just listing files.

### Listing files by age

Use the **-t** option to list files in order of age – how new they are. Add the **-r** option to get the most recently updated files showing up last in the list. I use this alias to show me a list of the files that I’ve most recently updated:

```
$ alias recent='ls -ltr | tail -8'
```

Note that file change and modification times are different. The **-c** (change) and **-t** (modification) options will not always give the same results. If you change permissions on a file and nothing else, **-c** will put that files at the top of the **ls** output while **-t** will not. If you’re curious about the difference, look at the output of the **stat** command.

```
$ stat ckacct
  File: ckacct
  Size: 200             Blocks: 8          IO Block: 4096   regular file
Device: 801h/2049d      Inode: 829041      Links: 1
Access: (0750/-rwxr-x---)  Uid: ( 1000/     shs)   Gid: ( 1000/     shs)
Access: 2020-08-20 16:10:11.063015008 -0400
Modify: 2020-08-17 07:26:34.579922297 -0400 <== content changes
Change: 2020-08-24 09:36:51.699775940 -0400 <== content or permissions changes
 Birth: -
```

### Listing files by group

To sort files by the associated groups, you can pass the output from a long listing to the **sort** command and tell it to sort on column 4.

```
$ ls -l | sort -k4
```

### Listing files by access date

To list files by access date (most recently accessed first), use the **-ltu** options. The "u" enforces the "by access date" listing order.

```
$ ls -ltu
total 959500
-rwxr-x---  1 shs     shs        200 Aug 24 09:42 ckacct  <== most recently used
-rw-rw-r--  1 shs     shs       1335 Aug 23 17:45 lte
```

### Listing multiple files on a single line

Sometimes a condensed file listing is more appropriate for the task at hand. The **ls** command even has options for that. To list files on as few lines as possible, you can use **\--format=comma** to separate file names with commas as in this command:

```
$ ls --format=comma
1, 10, 11, 12, 124, 13, 14, 15, 16pgs-landscape.pdf, 16pgs.pdf, 17, 18, 19,
192.168.0.4, 2, 20, 2018-12-23_OoS_2.pdf, 2018-12-23_OoS.pdf, 20190512_OoS.pdf,
'2019_HOHO_application working.pdf' …
```

Prefer white space? Use **\--format=across** instead.

```
$ ls --format=across z*
z              zip            zipfiles      zipfiles1.bat   zipfiles2.bat
zipfiles3.bat  zipfiles4.bat  zipfiles.bat  zoom_amd64.deb  zoomap.pdf
zoom-mtg
```

### Adding depth to your searches

While **ls** generally lists files in a single directory, you can choose instead to recursively list files by using the **-R** options, delving into the entire depth of directories:

```
$ ls -R zzzzz | grep -v "^$"
zzzzz:
zzzz
zzzzz/zzzz:
zzz
zzzzz/zzzz/zzz:
zz
zzzzz/zzzz/zzz/zz:
z
zzzzz/zzzz/zzz/zz/z:
sleeping
```

Alternately, you can use a **find** command with a limited or unlimited depth specification. In this command, we instruct the **find** command to look in only three levels of directories:

```
$ find zzzzz -maxdepth 3
zzzzz
zzzzz/zzzz
zzzzz/zzzz/zzz
zzzzz/zzzz/zzz/zz
```

### Choosing ls vs find

When you need to list files that meet a very selective list of requirements, the **find** command is probably a better tool to use than **ls**.

Unlike **ls**, the **find** command looks as deeply as possible unless you constrain it. It also has many other options and an **-exec** command that allows you to take some specific action once you find the files you’re looking for.

### Wrap-Up

The **ls** command has a lot of options for listing files. Check them out. You might find some that you’ll love.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3572590/11-ways-to-list-and-sort-files-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
