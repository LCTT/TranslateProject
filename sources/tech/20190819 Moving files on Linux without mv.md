[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Moving files on Linux without mv)
[#]: via: (https://opensource.com/article/19/8/moving-files-linux-without-mv)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/seth)

Moving files on Linux without mv
======
Sometimes the mv command isn't the best option when you need to move a
file. So how else do you do it?
![Hand putting a Linux file folder into a drawer][1]

The humble **mv** command is one of those useful tools you find on every POSIX box you encounter. Its job is clearly defined, and it does it well: Move a file from one place in a file system to another. But Linux is nothing if not flexible, and there are other options for moving files. Using different tools can provide small advantages that fit perfectly with a specific use case.

Before straying too far from **mv**, take a look at this command’s default results. First, create a directory and generate some files with permissions set to 777:


```
$ mkdir example
$ touch example/{foo,bar,baz}
$ for i in example/*; do ls /bin &gt; "${i}"; done
$ chmod 777 example/*
```

You probably don't think about it this way, but files exist as entries, called index nodes (commonly known as **inodes**), in a [filesystem][2]. You can see what inode a file occupies with the [ls command][3] and its **\--inode** option:


```
$ ls --inode example/foo
7476868 example/foo
```

As a test, move that file from the example directory to your current directory and then view the file’s attributes:


```
$ mv example/foo .
$ ls -l -G -g --inode
7476868 -rwxrwxrwx. 1 29545 Aug  2 07:28 foo
```

As you can see, the original file—along with its existing permissions—has been "moved", but its inode has not changed.

That’s the way the **mv** tool is programmed to move a file: Leave the inode unchanged (unless the file is being moved to a different filesystem), and preserve its ownership and permissions.

Other tools provide different options.

### Copy and remove

On some systems, the move action is a true move action: Bits are removed from one point in the file system and reassigned to another. This behavior has largely fallen out of favor. Move actions are now either attribute reassignments (an inode now points to a different location in your file organization) or amalgamations of a copy action followed by a remove action.
The philosophical intent of this design is to ensure that, should a move fail, a file is not left in pieces.

The **cp** command, unlike **mv**, creates a brand new data object in your filesystem. It has a new inode location, and it is subject to your active umask. You can mimic a move using the **cp** and **rm** (or [trash][4] if you have it) commands:


```
$ cp example/foo .
$ ls -l -G -g --inode
7476869 -rwxrwxr-x. 29545 Aug  2 11:58 foo
$ trash example/foo
```

The new **foo** file in this example got 775 permissions because the location’s umask specifically excludes write permissions:


```
$ umask
0002
```

For more information about umask, read Alex Juarez’s article about [file permissions][5].

### Cat and remove

Similar to a copy and remove, using the [cat][6] (or **tac**, for that matter) command assigns different permissions when your "moved" file is created. Assuming a fresh test environment with no **foo** in the current directory:


```
$ cat example/foo &gt; foo
$ ls -l -G -g --inode
7476869 -rw-rw-r--. 29545 Aug 8 12:21 foo
$ trash example/foo
```

This time, a new file was created with no prior permissions set. The result is entirely subject to the umask setting, which blocks no permission bit for the user and group (the executable bit is not granted for new files regardless of umask), but it blocks the write (value two) bit from others. The result is a file with 664 permission.

### Rsync

The **rsync** command is a robust multipurpose tool to send files between hosts and file system locations. This command has many options available to it, including the ability to make its destination mirror its source.

You can copy and then remove a file with **rsync** using the **\--remove-source-files** option, along with whatever other option you choose to perform the synchronization (a common, general-purpose one is **\--archive**):


```
$ rsync --archive --remove-source-files example/foo .
$ ls example
bar  baz
$ ls -lGgi
7476870 -rwxrwxrwx. 1 seth users 29545 Aug 8 12:23 foo
```

Here you can see that file permission and ownership was retained, the timestamp was updated, and the source file was removed.

**A word of warning:** Do not confuse this option for **\--delete**, which removes files from your _destination_ directory. Misusing **\--delete** can wipe out most of your data, and it’s recommended that you avoid this option except in a test environment.

You can override some of these defaults, changing permission and modification settings:


```
$ rsync --chmod=666 --times \
\--remove-source-files example/foo .
$ ls example
bar  baz
$ ls -lGgi
7476871 -rw-rw-r--. 1 seth users 29545 Aug 8 12:55 foo
```

Here, the destination’s umask is respected, so the **\--chmod=666** option results in a file with 664 permissions.

The benefits go beyond just permissions, though. The **rsync** command has [many][7] useful [options][8] (not the least of which is the **\--exclude** flag so you can exempt items from a large move operation) that make it a more robust tool than the simple **mv** command. For example, to exclude all backup files while moving a collection of files:


```
$ rsync --chmod=666 --times \
\--exclude '*~' \
\--remove-source-files example/foo .
```

### Set permissions with install

The **install** command is a copy command specifically geared toward developers and is mostly invoked as part of the install routine of software compiling. It’s not well known among users (and I do often wonder why it got such an intuitive name, leaving mere acronyms and pet names for package managers), but **install** is actually a useful way to put files where you want them.

There are many options for the **install** command, including **\--backup** and **\--compare** command (to avoid "updating" a newer copy of a file).

Unlike **cp** and **cat**, but exactly like **mv**, the **install** command can copy a file while preserving its timestamp:


```
$ install --preserve-timestamp example/foo .
$ ls -l -G -g --inode
7476869 -rwxr-xr-x. 1 29545 Aug  2 07:28 foo
$ trash example/foo
```

Here, the file was copied to a new inode, but its **mtime** did not change. The permissions, however, were set to the **install** default of **755**.

You can use **install** to set the file’s permissions, owner, and group:


```
$ install --preserve-timestamp \
\--owner=skenlon \
\--group=dialout \
\--mode=666 example/foo .
$ ls -li
7476869 -rw-rw-rw-. 1 skenlon dialout 29545 Aug  2 07:28 foo
$ trash example/foo
```

### Move, copy, and remove

Files contain data, and the really important files contain _your_ data. Learning to manage them wisely is important, and now you have the toolkit to ensure that your data is handled in exactly the way you want.

Do you have a different way of managing your data? Tell us your ideas in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/moving-files-linux-without-mv

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/yearbook-haff-rx-linux-file-lead_0.png?itok=-i0NNfDC (Hand putting a Linux file folder into a drawer)
[2]: https://opensource.com/article/18/11/partition-format-drive-linux#what-is-a-filesystem
[3]: https://opensource.com/article/19/7/master-ls-command
[4]: https://gitlab.com/trashy
[5]: https://opensource.com/article/19/8/linux-permissions-101#umask
[6]: https://opensource.com/article/19/2/getting-started-cat-command
[7]: https://opensource.com/article/19/5/advanced-rsync
[8]: https://opensource.com/article/17/1/rsync-backup-linux
