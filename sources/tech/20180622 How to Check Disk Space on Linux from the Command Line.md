Translating...by SunWave

How to Check Disk Space on Linux from the Command Line
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace-main.jpg?itok=t9Oxxc9X)

Quick question: How much space do you have left on your drives? A little or a lot? Follow up question: Do you know how to find out? If you happen to use a GUI desktop (e.g., GNOME, KDE, Mate, Pantheon, etc.), the task is probably pretty simple. But what if you’re looking at a headless server, with no GUI? Do you need to install tools for the task? The answer is a resounding no. All the necessary bits are already in place to help you find out exactly how much space remains on your drives. In fact, you have two very easy-to-use options at the ready.

In this article, I’ll demonstrate these tools. I’ll be using [Elementary OS][1], which also includes a GUI option, but we’re going to limit ourselves to the command line. The good news is these command-line tools are readily available for every Linux distribution. On my testing system, there are a number of attached drives (both internal and external). The commands used are agnostic to where a drive is plugged in; they only care that the drive is mounted and visible to the operating system.

With that said, let’s take a look at the tools.

### df

The df command is the tool I first used to discover drive space on Linux, way back in the 1990s. It’s very simple in both usage and reporting. To this day, df is my go-to command for this task. This command has a few switches but, for basic reporting, you really only need one. That command is df -H. The -H switch is for human-readable format. The output of df -H will report how much space is used, available, percentage used, and the mount point of every disk attached to your system (Figure 1).


![df output][3]

Figure 1: The output of df -H on my Elementary OS system.

[Used with permission][4]

What if your list of drives is exceedingly long and you just want to view the space used on a single drive? With df, that is possible. Let’s take a look at how much space has been used up on our primary drive, located at /dev/sda1. To do that, issue the command:
```
df -H /dev/sda1

```

The output will be limited to that one drive (Figure 2).


![disk usage][6]

Figure 2: How much space is on one particular drive?

[Used with permission][4]

You can also limit the reported fields shown in the df output. Available fields are:

  * source — the file system source

  * size — total number of blocks

  * used — spaced used on a drive

  * avail — space available on a drive

  * pcent — percent of used space, divided by total size

  * target — mount point of a drive




Let’s display the output of all our drives, showing only the size, used, and avail (or availability) fields. The command for this would be:
```
df -H --output=size,used,avail

```

The output of this command is quite easy to read (Figure 3).


![output][8]

Figure 3: Specifying what output to display for our drives.

[Used with permission][4]

The only caveat here is that we don’t know the source of the output, so we’d want to include source like so:
```
df -H --output=source,size,used,avail

```

Now the output makes more sense (Figure 4).

![source][10]

Figure 4: We now know the source of our disk usage.

[Used with permission][4]

### du

Our next command is du. As you might expect, that stands for disk usage. The du command is quite different to the df command, in that it reports on directories and not drives. Because of this, you’ll want to know the names of directories to be checked. Let’s say I have a directory containing virtual machine files on my machine. That directory is /media/jack/HALEY/VIRTUALBOX. If I want to find out how much space is used by that particular directory, I’d issue the command:
```
du -h /media/jack/HALEY/VIRTUALBOX

```

The output of the above command will display the size of every file in the directory (Figure 5).

![du command][12]

Figure 5: The output of the du command on a specific directory.

[Used with permission][4]

So far, this command isn’t all that helpful. What if we want to know the total usage of a particular directory? Fortunately, du can handle that task. On the same directory, the command would be:
```
du -sh /media/jack/HALEY/VIRTUALBOX/

```

Now we know how much total space the files are using up in that directory (Figure 6).

![space used][14]

Figure 6: My virtual machine files are using 559GB of space.

[Used with permission][4]

You can also use this command to see how much space is being used on all child directories of a parent, like so:
```
du -h /media/jack/HALEY

```

The output of this command (Figure 7) is a good way to find out what subdirectories are hogging up space on a drive.

![directories][16]

Figure 7: How much space are my subdirectories using?

[Used with permission][4]

The du command is also a great tool to use in order to see a list of directories that are using the most disk space on your system. The way to do this is by piping the output of du to two other commands: sort and head. The command to find out the top 10 directories eating space on a drive would look something like this:
```
du -a /media/jack | sort -n -r | head -n 10

```

The output would list out those directories, from largest to least offender (Figure 8).

![top users][18]

Figure 8: Our top ten directories using up space on a drive.

[Used with permission][4]

### Not as hard as you thought

Finding out how much space is being used on your Linux-attached drives is quite simple. As long as your drives are mounted to the Linux system, both df and du will do an outstanding job of reporting the necessary information. With df you can quickly see an overview of how much space is used on a disk and with du you can discover how much space is being used by specific directories. These two tools in combination should be considered must-know for every Linux administrator.

And, in case you missed it, I recently showed how to [determine your memory usage on Linux][19]. Together, these tips will go a long way toward helping you successfully manage your Linux servers.

Learn more about Linux through the free ["Introduction to Linux"][20]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/6how-check-disk-space-linux-command-line

作者：[Jack Wallen][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/jlwallen
[1]:https://elementary.io/
[2]:/files/images/diskspace1jpg
[3]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_1.jpg?itok=aJa8AZAM (df output)
[4]:https://www.linux.com/licenses/category/used-permission
[5]:/files/images/diskspace2jpg
[6]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_2.jpg?itok=_PAq3kxC (disk usage)
[7]:/files/images/diskspace3jpg
[8]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_3.jpg?itok=51m8I-Vu (output)
[9]:/files/images/diskspace4jpg
[10]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_4.jpg?itok=SuwgueN3 (source)
[11]:/files/images/diskspace5jpg
[12]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_5.jpg?itok=XfS4s7Zq (du command)
[13]:/files/images/diskspace6jpg
[14]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_6.jpg?itok=r71qICyG (space used)
[15]:/files/images/diskspace7jpg
[16]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_7.jpg?itok=PtDe4q5y (directories)
[17]:/files/images/diskspace8jpg
[18]:https://www.linux.com/sites/lcom/files/styles/rendered_file/public/diskspace_8.jpg?itok=v9E1SFcC (top users)
[19]:https://www.linux.com/learn/5-commands-checking-memory-usage-linux
[20]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
