[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (What is the Difference Between Soft link vs Hard link in Linux?)
[#]: via: (https://www.2daygeek.com/difference-between-soft-link-vs-hard-link-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

What is the Difference Between Soft link vs Hard link in Linux?
======

A link is a mechanism for creating a shortcut to the original file or directory. It contains information about another file or directory.

Links allow more than one filename to reference the same file.

### What’s Soft link

A symbolic link, also known as a symlink or a soft link, is a special type of file that points to another file or directory on Linux.

It’s like a shortcut in Windows. It contains the path of the original file and not the contents.

In general Symbolic links are used to link libraries. Also, used to link log files and folders on mounted NFS (Network File System) shares.

### What’s Hard link

Hard link is a mirror copy of the original file. Deleting the original file does not impact anything, because the hard link file serves as a mirror copy of the original file.

Why would you want to create a link file instead of copying them?

This is especially useful when you want to keep a same files in multiple location with updated contents.

When you copy a file to another location, it will copy the content and never get updated from the source file.

The contents of the file will be different from time to time.

### The difference between Soft link vs Hard link

I’ve included possible difference between soft link and hard link in the table below.

S.No | Soft Link | Hard Link
---|---|---
1 | The soft link is similar to the file shortcut on Windows. | Hard link is a mirror copy of the original file.
2 | Soft link can be called Symbolic link or symlink. | Hard link has no other name
3 | Changes in both file are reflected in the other. | It's like a soft link.
4 | Soft links can be created on different file systems. | Hard link can only be made on the same file system.
5 | Can create a soft link to files and directories | Only files can be linked
6 | It has different inode number and file permissions compared to the original file. | It has the same inode number and file permissions.
7 | It contains the path of the original file and not the contents. | It contains the actual contents of the original file.
8 | When the original file is removed, the link will die because it points to a non-existent file. This is called the hanging link. | Nothing happens when the original file is removed.
9 | You can create a soft link with the following command (# ln -s [Source Filename] [Link Name]) | Hard link can be created using the following command (# ln [Source Filename] [Link Name])
10 | The soft link file contains a special symbol "l" in the file permission field. | There is no special symbol for this.
11 | You can find the soft link file with the following command (# find / -type l) | You can find the hard link file with the following command (# find / -samefile [Source Filename])
12 | A broken soft link can be found using the following command (# symlinks [Path/to/Directory]). | Not applicable
--------------------------------------------------------------------------------

via: https://www.2daygeek.com/difference-between-soft-link-vs-hard-link-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
