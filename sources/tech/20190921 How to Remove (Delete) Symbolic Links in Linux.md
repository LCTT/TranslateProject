[#]: collector: (lujun9972)
[#]: translator: (arrowfeng)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Remove (Delete) Symbolic Links in Linux)
[#]: via: (https://www.2daygeek.com/remove-delete-symbolic-link-softlink-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Remove (Delete) Symbolic Links in Linux
======

You may have the opportunity to create or remove symbolic links on Linux.

If yes, do you know how to do it?

Have you already done that? Are you aware of that?

If yes then there is no problem. If not, don’t worry, we are here to help you with this.

This can be done using the rm and unlink commands.

### What is Symbolic Link?

A symbolic link, also known as a symlink or soft link, is a special type of file that points to another file or directory in Linux.

It’s similar to a shortcut in Windows.

It can point to a file or a directory on the same or a different filesystem or partition.

In general Symbolic links are used to link libraries. Also, used to link log files and folders on mounted NFS (Network File System) shares.

### What is rm Command?

The **[rm command][1]** is used to remove files or directories. This is very dangerous and be cautious every time you use the rm command.

### What is unlink Command?

The unlink command is used to remove the specified file. It is already installed as it is part of the GNU Gorutils.

### 1) How to Remove Symbolic Link Files Using the rm Command

The rm command is one of the most frequently used commands in Linux. Furthermore, it allows us to remove the symbolic links as described below.

```
# rm symlinkfile
```

Always use the rm command with the “-i” switch to understand what is being done.

```
# rm -i symlinkfile1
rm: remove symbolic link ‘symlinkfile1’? y
```

It also allows us to remove multiple symbolic links at once.

```
# rm -i symlinkfile2 symlinkfile3

rm: remove symbolic link ‘symlinkfile2’? y
rm: remove symbolic link ‘symlinkfile3’? y
```

### 1a) How to Remove Symbolic Link Directories Using the rm Command

This is like removing a symbolic link file.

Use the below command to remove Symbolic Link directory.

```
# rm -i symlinkdir

rm: remove symbolic link ‘symlinkdir’? y
```

Use the below command to remove multiple Symbolic Link directory.

```
# rm -i symlinkdir1 symlinkdir2

rm: remove symbolic link ‘symlinkdir1’? y
rm: remove symbolic link ‘symlinkdir2’? y
```

If you add _**“/”**_ trailing slash at the end, the symbolic link directory cannot be deleted. If you add, you get an error.

```
# rm -i symlinkdir/

rm: cannot remove ‘symlinkdir/’: Is a directory
```

You may need to add the **“-r”** switch to deal with the above problem. If you add this, it will delete the contents of the target directory, while it will not delete the symbolic link directory.

```
# rm -ri symlinkdir/

rm: descend into directory ‘symlinkdir/’? y
rm: remove regular file ‘symlinkdir/file4.txt’? y
rm: remove directory ‘symlinkdir/’? y
rm: cannot remove ‘symlinkdir/’: Not a directory
```

### 2) How to Remove Symbolic Links Using the unlink Command

The unlink command deletes a given file. It accepts only a single file at a time.

To delete symbolic link file

```
# unlink symlinkfile
```

To delete symbolic link directory

```
# unlink symlinkdir2
```

If you append the _**“/”**_ trailing slash at the end, you cannot remove the symbolic link directory using the unlink command.

```
# unlink symlinkdir3/

unlink: cannot unlink ‘symlinkdir3/’: Not a directory
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/remove-delete-symbolic-link-softlink-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/linux-remove-files-directories-folders-rm-command/
