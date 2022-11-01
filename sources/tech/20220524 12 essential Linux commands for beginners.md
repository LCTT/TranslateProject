[#]: subject: "12 essential Linux commands for beginners"
[#]: via: "https://opensource.com/article/22/5/essential-linux-commands"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lkxed"
[#]: translator: "chai001125"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

12 essential Linux commands for beginners
======
I recommend these commands to anyone who is getting started with Linux.

![Command line prompt][1]

Image by: Opensource.com

When operating on the Linux command line, it is easy to get disoriented, which can have disastrous consequences. I once issued a remove command before realizing that I'd moved the boot directory of my computer. I learned to use the `pwd` command to know exactly which part of the file system I was in (and these days, there are command projects, like [trashy and trash-cli][2], that serve as intermediates when removing files).

When I was new to Linux, I had a cheat sheet that hung over my desk to help me remember those commands as I managed my Linux servers. It was called the *101 commands for Linux* cheat sheet. As I became more familiar with these commands, I became more proficient with server administration.

Here are 12 Linux commands I find most useful.

### 1. Print working directory (pwd)

The `pwd` command prints your working directory. In other words, it outputs the path of the directory you are currently working in. There are two options: `--logical` to display your location with any symlinks and `--physical` to display your location after resolving any symlinks.

### 2. Make directory (mkdir)

Making directories is easy with the `mkdir` command. The following command creates a directory called `example` unless `example` already exists:

```
$ mkdir example
```

You can make directories within directories:

```
$ mkdir -p example/one/two
```

If directories `example` and `one` already exist, only directory `two` is created. If none of them exist, then three nested directories are created.

### 3. List (ls)

Coming from MS-DOS, I was used to listing files with the `dir` command. I don't recall working on Linux at the time, although today, `dir` is in the GNU Core Utilities package. Most people use the `ls` command to display the files, along with all their properties, are in a directory. The `ls` command has many options, including `-l` to view a long listing of files, displaying the file owner and permissions.

### 4. Change directory (cd)

It is often necessary to change directories. That's the `cd` command's function. For instance, this example takes you from your home directory into the `Documents` directory:

```
$ cd Documents
```

You can quickly change to your home directory with `cd ~` or just `cd` on most systems. You can use `cd ..` to move up a level.

### 5. Remove a file (rm)

Removing files is inherently dangerous. Traditionally, the Linux terminal has no Trash or Bin like the desktop does, so many terminal users have the bad habit of permanently removing data they believe they no longer need. There's no "un-remove" command, though, so this habit can be problematic should you accidentally delete a directory containing important data.

A Linux system provides `rm` and `shred` for data removal. To delete file `example.txt`, type the following:

```
$ rm example.txt
```

However, it's much safer to install a trash command, such as [trashy][3] or [trash-cli][4]. Then you can send files to a staging area before deleting them forever:

```
$ trash example.txt
```

### 6. Copy a file (cp)

Copy files with the `cp` command. The syntax is copy *from-here* *to-there*. Here's an example:

```
$ cp file1.txt newfile1.txt
```

You can copy entire directories, too:

```
$ cp -r dir1 newdirectory
```

### 7. Move and rename a file (mv)

Renaming and moving a file is functionally the same process. When you move a file, you take a file from one directory and put it into a new one. When renaming a file, you take a file from one directory and put it back into the same directory or a different directory, but with a new name. Either way, you use the `mv` command:

```
$ mv file1.txt file_001.txt
```

### 8. Create an empty file (touch)

Easily create an empty file with the `touch` command:

```
$ touch one.txt

$ touch two.txt

$ touch three.md
```

### 9. Change permissions (chmod)

Change the permissions of a file with the `chmod` command. One of the most common uses of `chmod` is making a file executable:

```
$ chmod +x myfile
```

This example is how you give a file permission to be executed as a command. This is particularly handy for scripts. Try this simple exercise:

```
$ echo 'echo Hello $USER' > hello.sh

$ chmod +x hello.sh

$ ./hello.sh
Hello, Don
```

### 10. Escalate privileges (sudo)

While administering your system, it may be necessary to act as the super user (also called root). This is where the `sudo` (or *super user do*) command comes in. Assuming you're trying to do something that your computer alerts you that only an administrator (or root) user can do, just preface it with the command `sudo` :

```
$ touch /etc/os-release && echo "Success"
touch: cannot touch '/etc/os-release': Permission denied

$ sudo touch /etc/os-release && echo "Success"
Success
```

### 11. Shut down (poweroff)

The `poweroff` command does exactly what it sounds like: it powers your computer down. It requires `sudo` to succeed.

There are actually many ways to shut down your computer and some variations on the process. For instance, the `shutdown` command allows you to power down your computer after an arbitrary amount of time, such as 60 seconds:

```
$ sudo shutdown -h 60
```

Or immediately:

```
$ sudo shutdown -h now
```

You can also restart your computer with `sudo shutdown -r now` or just `reboot`.

### 12. Read the manual (man)

The `man` command could be the most important command of all. It gets you to the documentation for each of the commands on your Linux system. For instance, to read more about `mkdir` :

```
$ man mkdir
```

A related command is `info`, which provides a different set of manuals (as long as they're available) usually written more verbosely than the often terse man pages.

### What's your favorite Linux command?

There are many more commands on a Linux system—hundreds! What's your favorite command, the one you find yourself using time and time again?

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/5/essential-linux-commands

作者：[Don Watkins][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/command_line_prompt.png
[2]: https://www.redhat.com/sysadmin/recover-file-deletion-linux
[3]: https://gitlab.com/trashy/trashy
[4]: https://github.com/andreafrancia/trash-cli
