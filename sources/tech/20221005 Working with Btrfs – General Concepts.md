[#]: subject: "Working with Btrfs – General Concepts"
[#]: via: "https://fedoramagazine.org/working-with-btrfs-general-concepts/"
[#]: author: "Andreas Hartmann https://fedoramagazine.org/author/hartan/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Working with Btrfs – General Concepts
======
![][1]

Photo by [Heliberto Arias][2] on [Unsplash][3]

This article is part of a series of articles that takes a closer look at Btrfs. This is  the default filesystem for Fedora Workstation and Fedora Silverblue since Fedora Linux 33.

### Introduction

Filesystems are one of the foundations of modern computers. They are an essential part of every operating system and they usually work unnoticed. However, modern filesystems such as Btrfs offer many great features that make working with computers more convenient. Next to other things they can, for example, transparently compress your files for you or build a solid foundation for incremental backups.

This article gives you a high-level overview of how the Btrfs filesystem works and some of the features it has. It will not go into much technical detail nor look at the implementation. More detailed explanations of some highlighted features follow in later articles of this series.

### What is a filesystem?

If you’ve heard before how filesystems work on the most basic level, then this isn’t new to you and you can skip to the next section. Otherwise, read ahead for a short introduction into what makes a filesystem in the first place.

In simple terms, a filesystem allows your PC to find the data that it stores on disk. This sounds like a trivial task, but in essence any type of non-volatile storage device today (such as HDDs, SSDs, SD cards, etc…) is still mostly what it was back in 1970 when PCs were being invented: A (huge) collection of storage blocks.

Blocks are the most granular addressable storage unit. Every file on your PC is stored across one or more blocks. A block is typically 4096 bytes in size. This depends on the hardware you have and the software (i.e. the filesystem) on top of it.

Filesystems allow us to find the contents of our files from the vast amount of available storage blocks. This is done via so-called *inodes*. An inode contains information about a file in a specially formatted storage block. This includes the file’s size, where to find the storage blocks that make up the file contents, its access rules (i.e. who can read, write or execute the file) and much more.

Below is an example of what this looks like:

![A text file “myfile.txt” and a hypothetical example of its representation on disk. All the squares are individual storage blocks.][4]

The structure of an inode has big implications on a filesystem’s capabilities, so it is one of the central datastructures for any file system. For this reason every filesystem has its own inode structure. If you want to know more about this, have a look at the inode structure of the Btrfs filesystem linked below . For a more detailed explanation of what the individual fields mean, you can refer to the inode structure of the ext4 filesystem .

### Copy-on-Write filesystems

One of the outstanding features of Btrfs, compared to ext4, for example, is that it is a CoW (Copy-on-Write) filesystem. When a file is changed and written back to disk, it intentionally is not written back to where it was before. Instead, it is copied and stored in an entirely new location on disk. In this sense, it may  be simpler to think of CoW as a kind of “redirection”, because the file write is redirected to different storage blocks.

This may sound wasteful, but in practice it isn’t. This is because the modified data must be written back to the disk in any case, regardless of how the filesystem works. Btrfs merely makes sure that the data is written to previously unoccupied blocks, so the old data remains intact. The only real drawback is that this behavior can lead to file fragmentation quicker than on other filesystems. In regular desktop usage scenarios it is unlikely you will notice a difference.

What is the advantage of CoW? In simple terms: a history of the modified and edited files can be kept. Btrfs will keep the references to the old file versions (inodes) somewhere they can be easily accessed. This reference is a *snapshot*: An image of the filesystem state at some point in time. This will be the topic of a separate article in this series, so it will be left at that for now.

Beyond keeping file histories, CoW filesystems are always in a consistent state, even if a previous filesystem transaction (like writing to a file) didn’t complete due to e.g. power loss. That is because filesystem metadata updates are also CoW: The file system itself is never overwritten, so an interruption can’t leave it in a partially written state

### Copy-on-Write for files

You can think of filenames as pointers to the inodes of the file they belong to. Upon writing to a file, Btrfs creates a copy of the modified file content (the data), along with a new inode (the metadata), and then makes your filename point to this new inode. The old inode remains untouched. Below you see another hypothetical example to illustrate this:

![Continuation of the example above: 3 more bytes of data were added][5]

Here “myfile.txt” has had three bytes appended. A traditional filesystem would have updated the “Data” block in the middle to contain the new contents. A CoW filesystem keeps the old blocks intact (greyed out) and writes (copies) changed data and metadata somewhere new. It is important to note that only changed data blocks are copied, and not the whole file.

If there are no more unused blocks to write new contents to, Btrfs will reclaim space from data blocks occupied by old file versions (Unless they are part of a snapshot, see later article in this series).

### Copy-on-Write for folders

From a filesystem’s point of view, a folder is a special type of file. In contrast to regular files, the filesystem interprets the underlying contents directly. A folder has some metadata associated with it (an inode, as seen for files above) that governs access permissions or modification time. In the simplest case, the data stored in a folder (so called “directory entries”) is a list of references to inodes, where each inode is in turn another file or folder. However, modern filesystems store at least a filename, together with a reference to an inode of the file in question, in a directory entry.

Earlier it was pointed out that writing to a file creates a copy of the previous inode and modifies the contents accordingly. In essence, this yields a new inode that isn’t related to its predecessor. To make the modified file show up in the filesystem,  all the directory entries containing a reference to it are updated as well.

This is a recursive process! Since a folder is itself a file with an inode, modifying any of its folder entries creates a new inode for the folder file. This recursion occurs all the way up the filesystem tree, until it arrives at the filesystem root.

As a consequence, as long as a reference is kept to any of the old directories and they are not deleted or overwritten,  the filesystem tree can be traversed in it’s previous state. This, again, is exactly what snapshots do.

### What to expect in future articles

Btrfs is more than just a CoW filesystem. It aims to implement “advanced features while also focusing on fault tolerance, repair and easy administration” (See ). Future articles of this series will have a look at these features in particular:

* Subvolumes – Filetrees within your filetree
* Snapshots – Going back in time
* Compression – Transparently saving storage space
* Qgroups – Limiting your filesystem size
* RAID – Replace your mdadm configuration

This is by far not an exhaustive list of Btrfs features. If you want the full overview of available features, check out the Wiki  and Docs .

### Conclusion

I hope that I managed to whet your appetite for getting to know your PC filesystem. If you have questions so far, please leave a comment about what you come up with so they can be discussed in future articles. In the meantime, feel free to study the linked resources in the text. If you stumble over a Btrfs feature that you find particularly intriguing, please add a comment below, too. If there’s enough interest in a particular topic, maybe I’ll add an article to the series. See you in the next article!

### Sources

1. [https://btrfs.wiki.kernel.org/index.php/Data_Structures#btrfs_inode_item][6]
2. [https://ext4.wiki.kernel.org/index.php/Ext4_Disk_Layout#Inode_Table][7]
3. [https://btrfs.readthedocs.io/en/latest/Introduction.html][8]
4. [https://btrfs.wiki.kernel.org/index.php/Main_Page][9]

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/working-with-btrfs-general-concepts/

作者：[Andreas Hartmann][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/hartan/
[b]: https://github.com/lkxed
[1]: https://fedoramagazine.org/wp-content/uploads/2022/07/working_w_btrfs_general-816x345.jpg
[2]: https://unsplash.com/@helibertoarias?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]: https://unsplash.com/s/photos/hdd?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[4]: https://fedoramagazine.org/wp-content/uploads/2022/07/file_regular.png
[5]: https://fedoramagazine.org/wp-content/uploads/2022/07/file_cow.png
[6]: https://btrfs.wiki.kernel.org/index.php/Data_Structures#btrfs_inode_item
[7]: https://ext4.wiki.kernel.org/index.php/Ext4_Disk_Layout#Inode_Table
[8]: https://btrfs.readthedocs.io/en/latest/Introduction.html
[9]: https://btrfs.wiki.kernel.org/index.php/Main_Page
