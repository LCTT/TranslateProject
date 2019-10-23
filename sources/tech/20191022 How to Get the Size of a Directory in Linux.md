[#]: collector: (lujun9972)
[#]: translator: (lnrCoder)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Get the Size of a Directory in Linux)
[#]: via: (https://www.2daygeek.com/find-get-size-of-directory-folder-linux-disk-usage-du-command/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Get the Size of a Directory in Linux
======

You may have noticed that the size of a directory is showing only 4KB when you use the **[ls command][1]** to list the directory content in Linux.

Is this the right size? If not, what is it, and how to get a directory or folder size in Linux?

This is the default size, which is used to store the meta information of the directory on the disk.

There are some applications on Linux to **[get the actual size of a directory][2]**.

But the disk usage (du) command is widely used by the Linux administrator.

I will show you how to get folder size with various options.

### What’s du Command?

**[du command][3]** stands for `Disk Usage`. It’s a standard Unix program which used to estimate file space usage in present working directory.

It summarize disk usage recursively to get a directory and its sub-directory size.

As I said, the directory size only shows 4KB when you use the ls command. See the below output.

```
$ ls -lh | grep ^d

drwxr-xr-x  3 daygeek daygeek 4.0K Aug  2 13:57 Bank_Details
drwxr-xr-x  2 daygeek daygeek 4.0K Mar 15  2019 daygeek
drwxr-xr-x  6 daygeek daygeek 4.0K Feb 16  2019 drive-2daygeek
drwxr-xr-x 13 daygeek daygeek 4.0K Jan  6  2019 drive-mageshm
drwxr-xr-x 15 daygeek daygeek 4.0K Sep 29 21:32 Thanu_Photos
```

### 1) How to Check Only the Size of the Parent Directory on Linux

Use the below du command format to get the total size of a given directory. In this example, we are going to get the total size of the **“/home/daygeek/Documents”** directory.

```
$ du -hs /home/daygeek/Documents
or
$ du -h --max-depth=0 /home/daygeek/Documents/

20G    /home/daygeek/Documents
```

**Details**:

  * du – It is a command
  * h – Print sizes in human readable format (e.g., 1K 234M 2G)
  * s – Display only a total for each argument
  * –max-depth=N – Print levels of directory



### 2) How to Get the Size of Each Directory on Linux

Use the below du command format to get the total size of each directory, including sub-directories.

In this example, we are going to get the total size of each **“/home/daygeek/Documents”** directory and it’s sub-directories.

```
$ du -h /home/daygeek/Documents/ | sort -rh | head -20

20G    /home/daygeek/Documents/
9.6G    /home/daygeek/Documents/drive-2daygeek
6.3G    /home/daygeek/Documents/Thanu_Photos
5.3G    /home/daygeek/Documents/Thanu_Photos/Camera
5.3G    /home/daygeek/Documents/drive-2daygeek/Thanu-videos
3.2G    /home/daygeek/Documents/drive-mageshm
2.3G    /home/daygeek/Documents/drive-2daygeek/Thanu-Photos
2.2G    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month
916M    /home/daygeek/Documents/drive-mageshm/Tanisha
454M    /home/daygeek/Documents/drive-mageshm/2g-backup
415M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Video
300M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Jan-2017
288M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Oct-2017
226M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Sep-2017
219M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Documents
213M    /home/daygeek/Documents/drive-mageshm/photos
163M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Video/Sent
161M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Images
154M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/June-2017
150M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Nov-2016
```

### 3) How to Get a Summary of Each Directory on Linux

Use the below du command format to get only the summary for each directory.

```
$ du -hs /home/daygeek/Documents/* | sort -rh | head -10

9.6G    /home/daygeek/Documents/drive-2daygeek
6.3G    /home/daygeek/Documents/Thanu_Photos
3.2G    /home/daygeek/Documents/drive-mageshm
756K    /home/daygeek/Documents/Bank_Details
272K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-TouchInterface1.png
172K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-NightLight.png
164K    /home/daygeek/Documents/ConfigServer Security and Firewall (csf) Cheat Sheet.pdf
132K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-Todo.png
112K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-ZorinAutoTheme.png
96K    /home/daygeek/Documents/distro-info.xlsx
```

### 4) How to Display the Size of Each Directory and Exclude Sub-Directories on Linux

Use the below du command format to display the total size of each directory, excluding subdirectories.

```
$ du -hS /home/daygeek/Documents/ | sort -rh | head -20

5.3G    /home/daygeek/Documents/Thanu_Photos/Camera
5.3G    /home/daygeek/Documents/drive-2daygeek/Thanu-videos
2.3G    /home/daygeek/Documents/drive-2daygeek/Thanu-Photos
1.5G    /home/daygeek/Documents/drive-mageshm
831M    /home/daygeek/Documents/drive-mageshm/Tanisha
454M    /home/daygeek/Documents/drive-mageshm/2g-backup
300M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Jan-2017
288M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Oct-2017
253M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Video
226M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Sep-2017
219M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Documents
213M    /home/daygeek/Documents/drive-mageshm/photos
163M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Video/Sent
154M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/June-2017
150M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Nov-2016
127M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Dec-2016
100M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Oct-2016
94M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Nov-2017
92M    /home/daygeek/Documents/Thanu_Photos/WhatsApp Images
90M    /home/daygeek/Documents/drive-2daygeek/Thanu-photos-by-month/Dec-2017
```

### 5) How to Get Only the Size of First-Level Sub-Directories on Linux

If you want to get the size of the first-level sub-directories, including their subdirectories, for a given directory on Linux, use the command format below.

```
$ du -h --max-depth=1 /home/daygeek/Documents/

3.2G    /home/daygeek/Documents/drive-mageshm
4.0K    /home/daygeek/Documents/daygeek
756K    /home/daygeek/Documents/Bank_Details
9.6G    /home/daygeek/Documents/drive-2daygeek
6.3G    /home/daygeek/Documents/Thanu_Photos
20G    /home/daygeek/Documents/
```

### 6) How to Get Grand Total in the du Command Output

If you want to get the grand total in the du Command output, use the below du command format.

```
$ du -hsc /home/daygeek/Documents/* | sort -rh | head -10

20G    total
9.6G    /home/daygeek/Documents/drive-2daygeek
6.3G    /home/daygeek/Documents/Thanu_Photos
3.2G    /home/daygeek/Documents/drive-mageshm
756K    /home/daygeek/Documents/Bank_Details
272K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-TouchInterface1.png
172K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-NightLight.png
164K    /home/daygeek/Documents/ConfigServer Security and Firewall (csf) Cheat Sheet.pdf
132K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-Todo.png
112K    /home/daygeek/Documents/user-friendly-zorin-os-15-has-been-released-ZorinAutoTheme.png
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/find-get-size-of-directory-folder-linux-disk-usage-du-command/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[lnrCoder](https://github.com/lnrCoder)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-unix-ls-command-display-directory-contents/
[2]: https://www.2daygeek.com/how-to-get-find-size-of-directory-folder-linux/
[3]: https://www.2daygeek.com/linux-check-disk-usage-files-directories-size-du-command/
