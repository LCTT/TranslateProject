Translating by zhb127
10 Interesting Linux Command Line Tricks and Tips Worth Knowing
============================================================

I passionately enjoy working with commands as they offer more control over a Linux system than GUIs(Graphical User Interfaces) applications, therefore am always on the look out to discover or figure out interesting ways and ideas to make [Linux so easy and fun to operate][1], primarily from the terminal.

It is always thrilling when we discover [new tricks or tips while using Linux][2] especially a command line geek like myself.

And the feeling of wanting to share newly learned practices or commands with millions of Linux users out there, particularly the newbies who are still getting their way around this exciting operating system normally sets in.

**Suggested Read:** [10 Useful Linux Command Line Tricks for Newbies – Part 2][3]

In this article, we will review a number of [useful command line tricks and tips][4] that can significantly enhance your Linux usage skills.

### 1\. Lock or Hide a File or Directory in Linux

The simplest way of locking a file or directory is by using Linux file permissions. In case your the owner of a file or directory, you can block (remove read, write and execute privileges) other users and groups from accessing it as follows:

```
$ chmod 700 tecmint.info
OR
$ chmod go-rwx tecmint.info
```

To know more about Linux file permissions, read this article [Managing Users & Groups, File Permissions & Attributes in Linux][5].

To hide the file/directory from other system users, rename it with a `(.)` at the start of the file or directory:

```
$ mv filename .tecmint.info
```

### 2\. Translate rwx Permissions into Octal Format in Linux

By default, when you run the [ls command][6], it displays file permissions in `rwx` format, but to understand the equivalence of this format and the octal format, you can learn how to [translate rwx permissions into Octal format in Linux][7].

### 3\. How to Use ‘su’ When ‘sudo’ Fails

Although [sudo command][8] is used to execute commands with superuser privileges, there are moments when it fails to work as in the example below.

Here, I want to [empty the contents of a large file][9] named `uptime.log` but the operation has failed even when I used sudo.

```
$ cat /dev/null >/var/log/uptime.log 
$ sudo cat /dev/null >/var/log/uptime.log
```
[
 ![Empty Large File Content in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Empty-Large-File-Content-in-Linux.png) 
][10]

Empty Large File Content in Linux

In such as case, you need to switch to the root user account using su command to perform the operation like so:

```
$ su
$ sudo cat /dev/null >/var/log/uptime.log
$ cat /var/log/uptime.log
```
[
 ![Switch to Super User](http://www.tecmint.com/wp-content/uploads/2016/12/Switch-to-Super-User.png) 
][11]

Switch to Super User

Try to understand the [difference between su and sudo][12], in addition, read through their man pages for more guidelines:

```
$ man sudo
$ man su
```

### 4\. Kill a Process in Linux

Sometimes when you want to [terminate a process using kill or killall or pkill][13] commands, it may fail to work, you realize that the process still continues to run on the system.

In order to destructively kill a process, send the `-KILL` siganl to it.

First [determine its process ID][14] and then kill it like so:

```
$ pidof vlc
$ sudo kill -KILL 10279
```
[
 ![Find and Kill Process in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Find-and-Kill-Process-in-Linux.png) 
][15]

Find and Kill Process in Linux

Check the [kill command][16] for additional usage options and information.

### 5\. Delete File Permanently in Linux

Normally, we use the rm command to delete files from a Linux system, however, these files do not completely get deleted, they are simply stored and hidden on the hard disk and can still be [recovered these files in Linux][17]and viewed by another person.

To prevent this, we can use the shred command which overwrites the file content and optionally deletes the file as well.

```
$ shred -zvu tecmint.pdf
```

The options used in the above command:

1.  `-z` – adds a final overwrite with zeros to hide shredding.
2.  `-u` – helps to truncate and remove file after overwriting.
3.  `-v` – shows progress.

[
 ![Delete File Permanently in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Delete-File-Permanently-in-Linux.png) 
][18]

Delete File Permanently in Linux

Read through shred man page for additional usage instructions:

```
$ man shred
```

### 6\. Rename Multiple Files in Linux

You can [rename multiple files in Linux][19] on the go by invoking the rename command.

It renames the filenames supplied according to a rule specified in the first argument.

The command below renames all `.pdf` files to `.doc`, here `'s/\.pdf$/\.doc/'` is the rule:

```
$ rename -v 's/\.pdf$/\.doc/' *.pdf
```
[
 ![Rename Multiple Files in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Rename-Multiple-Files-in-Linux.png) 
][20]

Rename Multiple Files in Linux

The next example renames all files matching `"*.bak"` to strip the extension, where `'s/\e.bak$//'` is the rule:

### 7\. Check for Spelling of Words in Linux

The look command displays lines beginning with a given string, it can help you to check for the spelling of word from within the command line. Although it is not so effective and reliable, look is still a useful alternative to other powerful spelling-checkers:

```
$ look linu
$ look docum
```
[
 ![Spell Checking in Linux](http://www.tecmint.com/wp-content/uploads/2016/12/Spell-Checking-in-Linux.png) 
][21]

Spell Checking in Linux

### 8\. Search for Description of Keyword in Manual Page

The man command is used to display manual entry pages of commands, when used with the `-k` switch, it searches the short descriptions and manual page names for the keyword `printf` (such as adjust, apache and php in the commands below) as regular expression.

```
$ man -k adjust
$ man -k apache
$ man -k php
```
[
 ![Show Description of Keyword in Manual Pages](http://www.tecmint.com/wp-content/uploads/2016/12/Show-Description-of-Keyword-in-Manual-Pages.png) 
][22]

Show Description of Keyword in Manual Pages

### 9\. Watch Logs in Real-Time in Linux

With watch command, you can run [another Linux command periodically][23] while displaying its output on fullscreen and alongside [tail command][24] which is used to view the last parts of a file, it is possible to watch the recording of log entries in a logfile.

In the example below, you will watch the system authentication logfile. Open two terminal windows, display the logfile for watching in real-time in the first window like so:

```
$ sudo watch tail /var/log/auth.log
```

You can also use [tail command][25] which shows the last parts of a file. Its `-f` flag enables watching changes in a file in real-time, therefore it is possible to watch the recording of log entries in a logfile.

```
$ sudo tail -f /var/log/auth.log
```

And run the commands below in the second terminal as you observe the logfile content from the first window:

```
$ sudo mkdir -p /etc/test
$ sudo rm -rf /etc/test
```

### 10\. List All Shell builtin Commands

A shell builtin is a command or a function, called from within and executed directly in the shell itself, instead of an external executable program which the shell would load from the hard disk and execute.

To list all shell builtins and their usage syntax, run:

```
$ help
```

As a concluding remark, [command line tricks and tips][26] always come in handy and make learning and using Linux easy and fun especially for newbies.

You can as well share with us other [useful and interesting command line tricks or tips][27] in Linux that you have come across via the comment form below.

--------------------------------------------------------------------------------


作者简介：

![](http://1.gravatar.com/avatar/4e444ab611c7b8c7bcb76e58d2e82ae0?s=128&d=blank&r=g)

Aaron Kili is a Linux and F.O.S.S enthusiast, an upcoming Linux SysAdmin, web developer, and currently a content creator for TecMint who loves working with computers and strongly believes in sharing knowledge.

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-command-line-tricks-and-tips-worth-knowing/

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/20-funny-commands-of-linux-or-linux-is-fun-in-terminal/
[2]:http://www.tecmint.com/tag/linux-tricks/
[3]:http://www.tecmint.com/10-useful-linux-command-line-tricks-for-newbies/
[4]:http://www.tecmint.com/10-useful-linux-command-line-tricks-for-newbies/
[5]:http://www.tecmint.com/manage-users-and-groups-in-linux/
[6]:http://www.tecmint.com/tag/linux-ls-command/
[7]:http://www.tecmint.com/check-linux-file-octal-permissions-using-stat-command/
[8]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[9]:http://www.tecmint.com/empty-delete-file-content-linux/
[10]:http://www.tecmint.com/wp-content/uploads/2016/12/Empty-Large-File-Content-in-Linux.png
[11]:http://www.tecmint.com/wp-content/uploads/2016/12/Switch-to-Super-User.png
[12]:http://www.tecmint.com/su-vs-sudo-and-how-to-configure-sudo-in-linux/
[13]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
[14]:http://www.tecmint.com/find-process-name-pid-number-linux/
[15]:http://www.tecmint.com/wp-content/uploads/2016/12/Find-and-Kill-Process-in-Linux.png
[16]:http://www.tecmint.com/how-to-kill-a-process-in-linux/
[17]:http://www.tecmint.com/recover-deleted-file-in-linux/
[18]:http://www.tecmint.com/wp-content/uploads/2016/12/Delete-File-Permanently-in-Linux.png
[19]:http://www.tecmint.com/rename-multiple-files-in-linux/
[20]:http://www.tecmint.com/wp-content/uploads/2016/12/Rename-Multiple-Files-in-Linux.png
[21]:http://www.tecmint.com/wp-content/uploads/2016/12/Spell-Checking-in-Linux.png
[22]:http://www.tecmint.com/wp-content/uploads/2016/12/Show-Description-of-Keyword-in-Manual-Pages.png
[23]:http://www.tecmint.com/run-repeat-linux-command-every-x-seconds/
[24]:http://www.tecmint.com/view-contents-of-file-in-linux/
[25]:http://www.tecmint.com/view-contents-of-file-in-linux/
[26]:http://www.tecmint.com/tag/linux-tricks/
[27]:http://www.tecmint.com/5-linux-command-line-tricks/
