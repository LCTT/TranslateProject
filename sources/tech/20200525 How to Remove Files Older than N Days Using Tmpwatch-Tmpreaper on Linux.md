[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Remove Files Older than N Days Using Tmpwatch/Tmpreaper on Linux)
[#]: via: (https://www.2daygeek.com/how-to-remove-files-older-than-n-days-using-tmpwatch-tmpreaper-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Remove Files Older than N Days Using Tmpwatch/Tmpreaper on Linux
======

You may have missed deleting files that are no longer needed on your computer in some directory.

This can be “Download” or any other directory.

It may have grown up over a period of time.

If you have enough storage, you should remove them, as this will slow down your system when you list files.

Also, it can be clumsy when you have thousands of files in one directory.

It is very difficult to find a file in a specific directory when you do not know the file name you want to check.

We can do this by using the find command with some combination, and we have written an article about this in the past.

  * [**Bash Script to Delete Files/Folders Older Than “X” Days in Linux**][1]
  * [**How To Find And Delete Files Older Than “X” Days And “X” Hours In Linux?**][1]
  * [**How To Automatically Delete Or Clean Up /tmp Folder Contents In Linux?**][1]



Today we are going to show you how to achieve this using the Tmpwatch utility on Linux.

### What is Tmpwatch

Tmpwatch recursively removes files that have not been accessed for a specified period of time in the specified directories.

Typically, it is used to automatically clean directories used for temporary file systems, such as / tmp and /var/tmp.

It only remove empty directories, regular files, and symbolic links.

It doesn’t switch to other file systems, and avoids the “lost+found” directory belonging to the root user.

By default, tmpwatch deletes files based on their atime (access time), not their mtime (conversion time).

You can change this behavior by adding other parameters in the tmpwatch command.

**WARNING:** Please do not run “tmpwatch” or “tmpreaper” in “/” because there is no mechanism in the program to protect against this.

### How to Install Tmpwatch on Linux

Tmpwatch can be installed as follows from the distribution official repository.

For **RHEL/CentOS 6** systems, use the **[yum command][2]** to install Tmpwatch.

```
$ sudo yum install -y tmpwatch
```

For **Debian** and **Ubuntu** systems, use the **[apt command][3]** or **[apt-get command][4]** to install Tmpreaper.

```
$ sudo apt-get install tmpreaper
```

For **openSUSE** systems, use the **[zypper command][5]** to install Tmpwatch.

```
$ sudo zypper install -y tmpwatch
```

For **Fedora** systems, use the **[dnf command][6]** to install Tmpwatch.

```
$ sudo dnf install -y tmpwatch
```

**Make a note:** If you are using Debian-based systems, use “tmpreaper” instead of tmpwatch. All examples will work as expected.

### Understanding Key Options and Arguments

  * **atime** (File Last Access Time) – Access time shows the last time the data from a file was accessed by any of the process such as command or script, etc,.
  * **mtime** (File Last Modify Time) – mtime shows when you modify a file contents or save a file. Most of the times ctime and mtime will be the same, unless the file attributes are updated.
  * **ctime** (File Last Change Time) – ctime shows when your file metadata got changed. It means when the file attributes are changed like ownership or group, etc,.
  * **dirmtime** (Directory Last modification time) – dirmtime shows when your directory last modified.



The time parameter defines the threshold for removing files.

  * d – for days
  * h – for hours
  * m – for minutes
  * s – for seconds



### How to Removes Files That Haven’t Been Accessed for a Period of Time Using the Tmpwatch Command

As I said at the beginning of the article, Tmpwatch deletes files by default (atime) depending on the time of access to the files. Also, since hours are the default parameter, you do not need to add the suffix to time if the action is performed using the hour unit.

For example, run the command below to recursively remove files that have not been accessed for the past 5 hours.

```
# tmpwatch 5 /tmp
```

Run the command below to delete files that have not been modified for the last 10 hours. If you want to delete files using mtime, you need to add the “-m” option with the tmpwatch command.

```
# tmpwatch -m 10 /home/daygeek/Downloads
```

### How to Delete Files That Haven’t Been Accessed more than “X” Days Using the Tmpwatch Command

If you want to delete files using days, you need to add the suffix “d”. The example below deletes files older than 30 days.

```
# tmpwatch 30d /home/daygeek/Downloads
```

### How to Delete All Files That Haven’t Been Accessed for a Period of Time Using the Tmpwatch Command

The below command removes all file types, not just regular files, symbolic links and directories based on mtime.

```
# tmpwatch -am 12 /tmp
```

### How to Exclude a Directory with Tmpwatch

The below command will delete all files and excludes directories that haven’t been modified for the past 10 hours.

```
# tmpwatch -am 10 --nodirs /home/daygeek/Downloads
```

### How to Exclude a Specific Path with Tmpwatch

The command below will delete all files except the directory below which has not been modified for the past 10 hours.

```
# tmpwatch -am 10 --exclude=/home/daygeek/Downloads/Movies /home/daygeek/Downloads
```

### How to Exclude Specific Pattern with Tmpwatch

The command below will delete all files except the Pattern below which has not been modified for the past 10 hours.

```
# tmpwatch -am 10 --exclude-pattern='*.pdf' /home/daygeek/Downloads
```

### How to Perform Dry Run with Tmpwatch Command

Run the below command if you want to perform dry run.

```
# tmpwatch -t 5h /home/daygeek/Downloads
```

### How to Setup a Cronjob to Delete files Periodically Using Tmpwatch

By default it leaves a **[cronjob][7]** file under the **“/etc/cron.daily/tmpreaper”** directory. This cronjob works according to the configuration file located in **“/etc/timereaper.conf”**. You can customize the file according to your needs.

It runs once a day and deletes files older than 7 days.

Alternatively, if you would like to perform an action routinely, you can manually add a conjob based on your needs.

```
# crontab -e

0 10 * * * /usr/sbin/tmpwatch 15d /home/daygeek/Downloads
```

The above cronjob will delete files that are older than 15 days daily at 10AM.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-remove-files-older-than-n-days-using-tmpwatch-tmpreaper-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/bash-script-to-delete-files-folders-older-than-x-days-in-linux/
[2]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[3]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[5]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[6]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[7]: https://www.2daygeek.com/linux-crontab-cron-job-to-schedule-jobs-task/
