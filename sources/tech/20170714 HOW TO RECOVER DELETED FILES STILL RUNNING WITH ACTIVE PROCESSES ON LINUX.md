translating---geekpi

HOW TO RECOVER DELETED FILES STILL RUNNING WITH ACTIVE PROCESSES ON LINUX
============================================================

A quick guide for recovering deleted files which still have running processes on your Linux system using Terminal.

In many cases, deleted files are applicable to recover even if the file has an active process and currently used by a single or multiple users. On Linux system every currently running process gets ID and it will be stated as a process identifier “PID” and all stacked up in /proc directory. This exactly what we need to recover deleted files which still running and it has a PID. So, here’s how we are going to do that.

Let’s say you have opened a compressed file and later on you have deleted this file. For the demonstration purpose, the compressed file is called “opengapps.zip” that would be the file we will open and deleted afterward.

### CALCULATE THE MD5 HASH OF THE ORIGINAL FILE

We will calculate the MD5 for this file before deleting it. So, we could compare the original MD5 hash to the MD5 hash of the recovered file. This process will guarantee that the integrity of the compressed file we have recovered is the same and it’s not corrupted.

```
md5sum opengapps.zip >> md5-opengapps.txt
```

To display the content of the text file

```
cat md5-opengapps.txt
```

```
Terminal Output
86489b68b40d144f0e00a0ea8407f7c0  opengapps.zip
```

After checking the MD5 hash for the compressed file. We will keep the compressed file opened and we will delete it. Afterward, we will start with the recovering process of that file with the following steps:

```
rm opengapps.zip
```

### THE RECOVERING PROCESS FOR A DELETED FILE

As we have mentioned earlier the running processes are available in the /proc directory. We can search for that process we need inside that directory with the following command:

Since we already know that the filename includes .zip file extension we could search using .zip extension. It will limit the output result and display the required process.

```
ps -axu | grep .zip
```

```
Terminal Output
m        13119  0.8  1.0 121788 30788 ?        Sl   06:17   0:00 file-roller /home/m/Downloads/Compressed/opengapps.zip
m        13164  0.0  0.0   5108   832 pts/20   S+   06:18   0:00 grep --color=auto .zip
```

Then we will navigate to the directory which includes the process with PID **13119** and open /fd directory.

```
cd /proc/13119/fd
```

/fd (file descriptor) directory includes multiple files including the file we need to recover. That file is connected with a hard link to the original one we kept running in the background. All files inside /fd directory comes with numbers for the “file name”. So, to identify which one of these files is linked to the original one, we will list the /fd directory contents with long listing format option.

```
ls -l
```

```
Terminal Output
total 0
lr-x------ 1 m m 64 Jul 14 06:17 0 -> /dev/null
lrwx------ 1 m m 64 Jul 14 06:17 1 -> socket:[26161]
lrwx------ 1 m m 64 Jul 14 06:17 10 -> anon_inode:[eventfd]
lr-x------ 1 m m 64 Jul 14 06:17 11 -> anon_inode:inotify
lrwx------ 1 m m 64 Jul 14 06:17 12 -> socket:[5752671]
lr-x------ 1 m m 64 Jul 14 06:17 13 -> /home/m/Downloads/Compressed/opengapps.zip (deleted)
lrwx------ 1 m m 64 Jul 14 06:17 2 -> socket:[26161]
lrwx------ 1 m m 64 Jul 14 06:17 3 -> anon_inode:[eventfd]
lrwx------ 1 m m 64 Jul 14 06:17 4 -> anon_inode:[eventfd]
lrwx------ 1 m m 64 Jul 14 06:17 5 -> socket:[5751361]
lrwx------ 1 m m 64 Jul 14 06:17 6 -> anon_inode:[eventfd]
lrwx------ 1 m m 64 Jul 14 06:17 7 -> anon_inode:[eventfd]
lrwx------ 1 m m 64 Jul 14 06:17 8 -> socket:[5751363]
lrwx------ 1 m m 64 Jul 14 06:17 9 -> socket:[5751365]
```

As you can see in the terminal output, that the original file “opengapps.zip” has been deleted and it is still linked to a file name **13** with the process PID **13119**. However, we still can recover it by copying the file linked to it to a safe location.

```
cp 13 /home/m/Downloads/Compressed
```

After the file has been copied. we will return the directory which includes the recovered file and rename it with the following command.

```
mv 13 opengapps-recovered.zip
```

### CALCULATE THE MD5 HASH OF THE RECOVERED FILE

Since we had recovered the file. let’s check the integrity of the file, just to make sure the file is not corrupted and it’s as same as the original one. Earlier we have saved the MD5 hash for the original file.

```
md5sum opengapps-recovered.zip >> md5-opengapps.txt
```

This command will check MD5 hash for the file and it will overwrite the text file to include the MD5 hash for the new recovered file to easily compare both MD5 hashes.

Time to display the contents of the text file to compare both MD5 hashes of the original file and recovered file.

```
cat md5-opengapps.txt
```

```
Terminal Output
86489b68b40d144f0e00a0ea8407f7c0  opengapps.zip
86489b68b40d144f0e00a0ea8407f7c0  opengapps-recovered.zip
```

The MD5 hash for the recovered file is the same. So, we successfully recovered the file we had deleted earlier and it has been recovered with the same file integrity and works fine.

 [![](http://www.linuxnov.com/wp-content/uploads/2017/07/Recovering-a-deleted-file-using-terminal-LinuxNov.png)][5] 

**Note:** in some cases, some files are not visible with **ps -axu** command. So, try to check the application running that file to recover the file from it running process.

Let’s say we have a video with .avi extension running using Totem media player. All you need to check the PID of the Totem application and go through the same instructions mentioned in this example.

To find out the PID of a running application use the following command followed by the application name.

```
pidof application name
```
Support Us By Sharing

--------------------------------------------------------------------------------

via: http://www.linuxnov.com/recover-deleted-files-still-running-active-processes-linux/

作者：[mhnassif ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.linuxnov.com/author/mhnassif/
[1]:http://www.linuxnov.com/author/mhnassif/
[2]:http://www.linuxnov.com/category/how-to/
[3]:http://www.linuxnov.com/category/shell-cli/
[4]:http://www.linuxnov.com/recover-deleted-files-still-running-active-processes-linux/#comments
[5]:http://www.linuxnov.com/wp-content/uploads/2017/07/Recovering-a-deleted-file-using-terminal-LinuxNov.png
