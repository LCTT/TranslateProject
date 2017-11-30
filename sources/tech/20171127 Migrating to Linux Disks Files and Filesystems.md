Migrating to Linux: Disks, Files, and Filesystems
============================================================

![Migrating to LInux ](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/butterflies-807551_1920.jpg?itok=pxTxwvFO "Migrating to LInux ")
Installing and using Linux on your main desktop will help you quickly become familiar with the methods and tools you need.[Creative Commons Zero][1]Pixabay

This is the second article in our series on migrating to Linux. If you missed the first one, [you can find it here][4]. As mentioned previously, there are several reasons why you might want to migrate to Linux. You might be using or developing code for Linux in your job, or you might just want to try something new.

In any case, having Linux on your main desktop will help you quickly become familiar with the methods and tools you’ll need. In this article, I’ll provide an introduction to Linux files, filesystems and disks.

### Where's My C:\?

If you are coming from a Mac, Linux should feel fairly familiar to you, as the Mac uses files, filesystems, and disks pretty closely to the way Linux does. On the other hand, if your experience is primarily Windows, accessing disks under Linux may seem a little confusing. Generally, Windows assigns a drive letter (like C:\) to each disk. Linux does not do this. Instead Linux presents a single hierarchy of files and directories for everything in your system.

Let's look at an example. Suppose you use a computer with a main hard drive, a CD-ROM with folders called  _Books_  and  _Videos_  and a USB thumb drive with a directory called  _Transfer_ . Under Windows, you would see the following:

```
C:\  [Hard drive]

├ System

├ System32

├ Program Files

├ Program Files (x86)

└ <additional folders>

D:\ [CD-ROM]

├ Books

└ Videos

E:\ [USB thumb drive]

└ Transfer
```

A typical Linux system would instead have this:

```
/ (the top most directory, called the root directory) [Hard drive]

├ bin

├ etc

├ lib

├ sbin

├ usr

├ <additional directories>

└ media

   └ <your user name>

       ├ cdrom  [CD-ROM]

       │  ├ Books

       │  └ Videos

       └ Kingme_USB [USB thumb drive]

           └ Transfer
```

If you are using a graphical environment, usually, the file manager in Linux will present the CD-ROM and the USB thumb drive with icons that look like the device, so you may not need to know the media's specific directory.

### Filesystems

Linux emphasizes these things called filesystems. A filesystem is a set of structures on media (like a hard drive) that keep track of all the files and directories on the media. Without a filesystem we could store information on a hard drive, but all the data would be in a jumbled mess. We wouldn't know which blocks of data belonged to which file. You may have heard of names like Ext4, XFS, and Btrfs. These are Linux filesystem types.

Every type of media that holds files and directories has a filesystem on it. Different media types may use specific filesystem types that are optimized for the media. So CD-ROMs use ISO9660 or UDF filesystem types. USB thumbdrives typically use FAT32 so they can be easily shared with other computer systems.

Windows uses filesystems, too. It just doesn't talk about them as much. For example, when you insert a CD-ROM, Windows will read the ISO9660 filesystem structures, assign a drive letter to it and display the files and directories under the letter (D:\ for example). So if you're picky about details, technically Windows assigns a drive letter to a filesystem, not the whole disk.

Using that same example, Linux will also read the ISO9660 filesystem structures, but instead of a drive letter, it will attach the filesystem to a directory (a process called mounting). Linux will then display the files and directories on the CD-ROM under the attached directory ( _/media/<your user name>/cdrom,_  for example).

So to answer the question "Where's my C:\?" On Linux, there is no C:\. It works differently.

### Files

Windows stores files and directories (also called folders) in its filesystem. Linux, however, lets you put other things into the filesystem as well. These additional types of things are native objects in the filesystem, and they're actually different from regular files. Linux allows you to create and use hard links, symbolic links, named pipes, device nodes, and sockets, in addition to the regular files and directories. We won't get into all the types of filesystem objects here, but there are a few that are useful to know about.

Hard links are used to create one or more aliases for a file. Each alias is a different name to the same contents on disk. If you edit the file under one file name, the changes appear under the other file names as well. For example. you might have  _MyResume_2017.doc_  also have a hard link called  _JaneDoeResume.doc_ . (Note that you can create a hard link by using the _ln_  command from the command line.) This way you can find and edit  _MyResume_2017.doc_ , then send out  _JaneDoeResume.doc_  to your prospects to help them keep track where it's from -- which will contain all your updates.

Symbolic links are a little like Windows shortcuts. The filesystem entry contains a path to another file or directory. In a lot of ways, they work like hard links in that they can create an alias to another file. However, symbolic links can alias directories as well as files, and symbolic links can refer to items in a different filesystem on different media where hard links cannot. (Note that you can create symbolic links also with the _ln_ command, but with the  _-s_ option.)

### Permissions

Another big difference between Windows and Linux involves the permissions on filesystem objects (files, directories, and others). Windows implements a fairly complex set of permissions on files and directories. For example, users and groups can have permissions to read, write, execute, modify, and more. Users and groups can be given permission to access everything in a directory with exceptions, or they can be given no permission to anything in a directory with exceptions.

Most folks using Windows don't make use of special permissions, however; so, it's surprising when they discover that a default set of permissions are used and enforced on Linux. Linux can enforce more sophisticated permissions by using SELinux or AppArmor. However most Linux installations just use the built-in default permissions.

In the default permissions, each item in the filesystem has a set of permissions for the owner of the file, the group for the file, and for everyone else. These permissions allow for: reading, writing, and executing. The permissions have a hierarchy to them. First, it checks whether the user (the login name) is the owner and has permission. If not, then it checks whether your user (login name) is in the group for the file and the group has permission. If not, then it checks whether everyone else has permission. There are other permission settings as well, but the three sets of three are the ones most commonly used.

If you are using the command line, and you type ls -l, you may see permissions represented as:

```
rwxrw-r-- 1 stan dndgrp 25 Oct 33rd 25:01 rolldice.sh
```

The letters at the beginning, rwxrw-r--, show the permissions. In this case, the owner (stan) can read, write, and execute the file (the first three letters, rwx); members of the group dndgrp can read and write the file but not execute (the second three letters, rw-); and everyone else can only read the file (the last three letters, r--).

(Note that on Windows to make a script executable, you make the file's extension something specific, .bat for example. On Linux, the file's extension doesn't mean anything to the operating system. Instead its permissions need to be set so the file is executable.)

If you get a  _permission denied_  error, chances are you are attempting to run a program or command that requires administrator privilege, or you're trying to access a file that doesn't hold permissions for your user account to access it. If you are trying to do something that requires administrator privilege, you will need to switch to the user account called  _root_  by logging in as root, or by using a helper program called  _sudo_  on the command line, which will allow you to temporarily run as root. The sudo tool will, of course, ask for a password to make sure you really should have permission.

### Hard Drive Filesystems

Windows predominately uses a filesystem type called NTFS for hard drives. On Linux, you get to pick which type of filesystem you want to use for the hard drive. Different types of filesystems exhibit different features and different performance characteristics. The main native Linux filesystem used today is Ext4\. However, you can choose from an abundance of filesystem types at installation time, such as: Ext3 (predecessor to Ext4), XFS, Btrfs, UBIFS (for embedded systems), and more. If you're not sure which one to use, Ext4 will work great.

 _Learn more about Linux through the free ["Introduction to Linux" ][2]course from The Linux Foundation and edX._

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/learn/intro-to-linux/2017/11/migrating-linux-disks-files-and-filesystems

作者：[JOHN BONESIO][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/johnbonesio
[1]:https://www.linux.com/licenses/category/creative-commons-zero
[2]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[3]:https://www.linux.com/files/images/butterflies-8075511920jpg
[4]:https://www.linux.com/blog/learn/intro-to-linux/2017/10/migrating-linux-introduction
