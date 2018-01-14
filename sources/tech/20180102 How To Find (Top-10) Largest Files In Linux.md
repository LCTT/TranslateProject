How To Find (Top-10) Largest Files In Linux
======
When you are running out of disk space in system, you may prefer to check with df command or du command or ncdu command but all these will tell you only current directory files and doesn't shows the system wide files.

You have to spend huge amount of time to get the largest files in the system using the above commands, that to you have to navigate to each and every directory to achieve this.

It's making you to face trouble and this is not the right way to do it.

If so, what would be the suggested way to get top 10 largest files in Linux?

I have spend a lot of time with google but i didn't found this. Everywhere i could see an article which list the top 10 files in the current directory. So, i want to make this article useful for people whoever looking to get the top 10 largest files in the system.

In this tutorial, we are going to teach you how to find top 10 largest files in Linux system using below four methods.

### Method-1 :

There is no specific command available in Linux to do this, hence we are using more than one command (all together) to get this done.
```
# find / -type f -print0 | xargs -0 du -h | sort -rh | head -n 10

1.4G	/swapfile
1.1G	/home/magi/ubuntu-17.04-desktop-amd64.iso
564M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqTFU0XzkzUlJUZzA
378M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqeldzUmhPeC03Zm8
377M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqRGd4V0VrOXM4YVU
100M	/usr/lib/x86_64-linux-gnu/libOxideQtCore.so.0
93M	/usr/lib/firefox/libxul.so
84M	/var/lib/snapd/snaps/core_3604.snap
84M	/var/lib/snapd/snaps/core_3440.snap
84M	/var/lib/snapd/snaps/core_3247.snap

```

**Details :**
**`find`** : It 's a command, Search for files in a directory hierarchy.
**`/`** : Check in the whole system (starting from / directory)
**`-type`** : File is of type

**`f`** : Regular file
**`-print0`** : Print the full file name on the standard output, followed by a null character
**`|`** : Control operator that send the output of one program to another program for further processing.

**`xargs`** : It 's a command, which build and execute command lines from standard input.
**`-0`** : Input items are terminated by a null character instead of by whitespace
**`du -h`** : It 's a command to calculate disk usage with human readable format

**`sort`** : It 's a command, Sort lines of text files
**`-r`** : Reverse the result of comparisons
**`-h`** : Print the output with human readable format

**`head`** : It 's a command, Output the first part of files
**`n -10`** : Print the first 10 files.

### Method-2 :

This is an another way to find or check top 10 largest files in Linux system. Here also, we are putting few commands together to achieve this.
```
# find / -type f -exec du -Sh {} + | sort -rh | head -n 10

1.4G	/swapfile
1.1G	/home/magi/ubuntu-17.04-desktop-amd64.iso
564M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqTFU0XzkzUlJUZzA
378M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqeldzUmhPeC03Zm8
377M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqRGd4V0VrOXM4YVU
100M	/usr/lib/x86_64-linux-gnu/libOxideQtCore.so.0
93M	/usr/lib/firefox/libxul.so
84M	/var/lib/snapd/snaps/core_3604.snap
84M	/var/lib/snapd/snaps/core_3440.snap
84M	/var/lib/snapd/snaps/core_3247.snap

```

**Details :**
**`find`** : It 's a command, Search for files in a directory hierarchy.
**`/`** : Check in the whole system (starting from / directory)
**`-type`** : File is of type

**`f`** : Regular file
**`-exec`** : This variant of the -exec action runs the specified command on the selected files
**`du`** : It 's a command to estimate file space usage.

**`-S`** : Do not include size of subdirectories
**`-h`** : Print sizes in human readable format
**`{}`** : Summarize disk usage of each FILE, recursively for directories.

**`|`** : Control operator that send the output of one program to another program for further processing.
**`sort`** : It 's a command, Sort lines of text files
**`-r`** : Reverse the result of comparisons

**`-h`** : Compare human readable numbers
**`head`** : It 's a command, Output the first part of files
**`n -10`** : Print the first 10 files.

### Method-3 :

It 's an another method to find or search top 10 largest files in Linux system.
```
# find / -type f -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}

84M	/var/lib/snapd/snaps/core_3247.snap
84M	/var/lib/snapd/snaps/core_3440.snap
84M	/var/lib/snapd/snaps/core_3604.snap
93M	/usr/lib/firefox/libxul.so
100M	/usr/lib/x86_64-linux-gnu/libOxideQtCore.so.0
377M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqRGd4V0VrOXM4YVU
378M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqeldzUmhPeC03Zm8
564M	/home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqTFU0XzkzUlJUZzA
1.1G	/home/magi/ubuntu-17.04-desktop-amd64.iso
1.4G	/swapfile

```

**Details :**
**`find`** : It 's a command, Search for files in a directory hierarchy.
**`/`** : Check in the whole system (starting from / directory)
**`-type`** : File is of type

**`f`** : Regular file
**`-print0`** : Print the full file name on the standard output, followed by a null character
**`|`** : Control operator that send the output of one program to another program for further processing.

**`xargs`** : It 's a command, which build and execute command lines from standard input.
**`-0`** : Input items are terminated by a null character instead of by whitespace
**`du`** : It 's a command to estimate file space usage.

**`sort`** : It 's a command, Sort lines of text files
**`-n`** : Compare according to string numerical value
**`tail -10`** : It 's a command, output the last part of files (last 10 files)

**`cut`** : It 's a command, remove sections from each line of files
**`-f2`** : Select only these fields value.
**`-I{}`** : Replace occurrences of replace-str in the initial-arguments with names read from standard input.

**`-s`** : Display only a total for each argument
**`-h`** : Print sizes in human readable format
**`{}`** : Summarize disk usage of each FILE, recursively for directories.

### Method-4 :

It 's an another method to find or search top 10 largest files in Linux system.
```
# find / -type f -ls | sort -k 7 -r -n | head -10 | column -t | awk '{print $7,$11}'

1494845440 /swapfile
1085984380 /home/magi/ubuntu-17.04-desktop-amd64.iso
591003648 /home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqTFU0XzkzUlJUZzA
395770383 /home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqeldzUmhPeC03Zm8
394891761 /home/magi/.gdfuse/magi/cache/0B5nso_FPaZFqRGd4V0VrOXM4YVU
103999072 /usr/lib/x86_64-linux-gnu/libOxideQtCore.so.0
97356256 /usr/lib/firefox/libxul.so
87896064 /var/lib/snapd/snaps/core_3604.snap
87793664 /var/lib/snapd/snaps/core_3440.snap
87089152 /var/lib/snapd/snaps/core_3247.snap

```

**Details :**
**`find`** : It 's a command, Search for files in a directory hierarchy.
**`/`** : Check in the whole system (starting from / directory)
**`-type`** : File is of type

**`f`** : Regular file
**`-ls`** : List current file in ls -dils format on standard output.
**`|`** : Control operator that send the output of one program to another program for further processing.

**`sort`** : It 's a command, Sort lines of text files
**`-k`** : start a key at POS1
**`-r`** : Reverse the result of comparisons

**`-n`** : Compare according to string numerical value
**`head`** : It 's a command, Output the first part of files
**`-10`** : Print the first 10 files.

**`column`** : It 's a command, formats its input into multiple columns.
**`-t`** : Determine the number of columns the input contains and create a table.
**`awk`** : It 's a command, Pattern scanning and processing language
**`'{print $7,$11}'`** : Print only mentioned column.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-find-search-check-print-top-10-largest-biggest-files-in-linux/

作者：[Magesh Maruthamuthu][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.2daygeek.com/author/magesh/
