[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (3 quick tips for working with Linux files)
[#]: via: (https://www.networkworld.com/article/3440035/3-quick-tips-for-working-with-linux-files.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

3 quick tips for working with Linux files
======
Linux provides lots of commands for finding, counting, and renaming files. Here's a look at some useful choices.
[GotCredit][1] [(CC BY 2.0)][2]

Linux provides a wide variety of commands for working with files — commands that can save you time and make your work a lot less tedious.

### Finding files

When you're looking for files, the **find** command is probably going to be the first command to come to mind, but sometimes a well-crafted **ls** command works even better. Want to remember what you called that script you were working on last night before you fled the office and drove home? Easy! Use an **ls** command with the **-ltr** options. The last files listed will be the ones most recently created or updated.

```
$ ls -ltr ~/bin | tail -3
-rwx------ 1 shs shs   229 Sep 22 19:37 checkCPU
-rwx------ 1 shs shs   285 Sep 22 19:37 ff
-rwxrw-r-- 1 shs shs  1629 Sep 22 19:37 test2
```

A command like this one will list only the files that were updated today:

```
$ ls -al --time-style=+%D | grep `date +%D`
drwxr-xr-x  60 shs  shs       69632 09/23/19 .
drwxrwxr-x   2 shs  shs     8052736 09/23/19 bin
-rw-rw-r--   1 shs  shs         506 09/23/19 stats
```

If the files you're looking for might not be in the current directory, the **find** command is going to provide better options than **ls**, but it can also result in a lot more output than you want to peruse. In this command, we're avoiding searching in directories that do _not_ begin with dots (many of those get updates all the time), specifying that we want to find files (i.e., not directories) and requesting that we only be shown files that were updated within the last day (-mtime -1).

```
$ find . -not -path '*/\.*' -type f -mtime -1 -ls
   917517      0 -rwxrw-r--   1 shs      shs          683 Sep 23 11:00 ./newscript
```

Notice how the **-not** option reverses the **-path** specification, so our search doesn't dive into subdirectories that begin with dots.

If you want to find only the largest files and directories, you can use a command like this **du** command that lists the contents of the current directory by size. Pipe the output to **tail** to see only the largest few.

```
$ du -kx | egrep -v "\./.+/" | sort -n | tail -5
918984      ./reports
1053980     ./notes
1217932     ./.cache
31470204    ./photos
39771212    .
```

The **-k** option gets **du** to list file sizes in blocks, while **x** keeps it from traversing directories that are on other file systems (e.g., referenced through symbolic links). The fact that the **du** listing starts with the file sizes allows the sort by size (sort -n) to work.

### Counting files

Counting files in any particular directory is fairly easy with the **find** command. You just have to remember that find will recurse into subdirectories and will count the files in those subdirectories along with those in the current directory. In this command, we are counting files in one particular user's home directory. Depending on permissions on home directories, this may require the use of **sudo**. Remember that the first argument is the starting point for the search — in this case, the specified user's home directory.

```
$ find ~username -type f 2>/dev/null | wc -l
35624
```

Note that we're sending error output from the **find** command above to the bit bucket to avoid trying to search directories like ~username/.cache that we likely cannot search and the content of which is probably not of interest.

When needed, you can constrain **find** to a single directory using the **maxdepth 1** option:

```
$ find /home/shs -maxdepth 1 -type f | wc -l
387
```

### Renaming files

Files are easy to rename with the **mv** command, but sometimes you will want to rename large collections of files and likely won't want to spend a lot of time doing it. To change all the blanks that you might find in file names in the current directory to underscores, for example, you could use a command like this:

```
$ rename 's/ /_/g' *
```

The **g** in this command, as you likely suspect, means "global." That means the command will change _all_ blanks in a file name to underscores, not just the first one.

To drop the .txt extension from text files, you could use a command like this:

```
$ rename 's/.txt//g' *
```

### Wrap-up

The Linux command line provides a lot of useful options for manipulating files. Please suggest other commands that you find especially useful.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][3] ]**

Join the Network World communities on [Facebook][4] and [LinkedIn][5] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3440035/3-quick-tips-for-working-with-linux-files.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/gotcredit/33756797815/in/photolist-TqYpVr-ot3MbP-8GVk75-bDgdSV-d8UqyY-8A1Nvm-bDgHMT-3StdY-c3CSTq-9gXm8m-piEdt6-9Jme84-ao7jBT-9gUejH-9gpPtR-XzrMMD-bqn8Qs-bDa1AK-oV87g2-bqn8SE-7hKg3v-CyDj5-bDgHKF-ppTzHf-84Czrj-dWf3MY-eDXW3i-5nTPZb-oaFrev-bqf6Rw-58EpAQ-5bd2t8-9eyUFb-5zNBi9-6geKFz-ngaqHa-6zDJtt-bvJrAQ-28v4k1Y-6s2qrs-3fPsLz-hDNitm-4nfhZC-7dZYt1-PUTxVi-4nuP2y-bDgdVg-96HPjm-bce6J8-5Mnhy
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[4]: https://www.facebook.com/NetworkWorld/
[5]: https://www.linkedin.com/company/network-world
