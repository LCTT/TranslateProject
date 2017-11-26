Translating by Snapcrafter
A user's guide to links in the Linux filesystem
============================================================

### Learn how to use links, which make tasks easier by providing access to files from multiple locations in the Linux filesystem directory tree.


![A user's guide to links in the Linux filesystem](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/links.png?itok=AumNmse7 "A user's guide to links in the Linux filesystem")
Image by : [Paul Lewin][8]. Modified by Opensource.com. [CC BY-SA 2.0][9]

In articles I have written about various aspects of Linux filesystems for Opensource.com, including [An introduction to Linux's EXT4 filesystem][10]; [Managing devices in Linux][11]; [An introduction to Linux filesystems][12]; and [A Linux user's guide to Logical Volume Management][13], I have briefly mentioned an interesting feature of Linux filesystems that can make some tasks easier by providing access to files from multiple locations in the filesystem directory tree.

There are two types of Linux filesystem links: hard and soft. The difference between the two types of links is significant, but both types are used to solve similar problems. They both provide multiple directory entries (or references) to a single file, but they do it quite differently. Links are powerful and add flexibility to Linux filesystems because [everything is a file][14].

More Linux resources

*   [What is Linux?][1]

*   [What are Linux containers?][2]

*   [Download Now: Linux commands cheat sheet][3]

*   [Advanced Linux commands cheat sheet][4]

*   [Our latest Linux articles][5]

I have found, for instance, that some programs required a particular version of a library. When a library upgrade replaced the old version, the program would crash with an error specifying the name of the old, now-missing library. Usually, the only change in the library name was the version number. Acting on a hunch, I simply added a link to the new library but named the link after the old library name. I tried the program again and it worked perfectly. And, okay, the program was a game, and everyone knows the lengths that gamers will go to in order to keep their games running.

In fact, almost all applications are linked to libraries using a generic name with only a major version number in the link name, while the link points to the actual library file that also has a minor version number. In other instances, required files have been moved from one directory to another to comply with the Linux file specification, and there are links in the old directories for backwards compatibility with those programs that have not yet caught up with the new locations. If you do a long listing of the **/lib64** directory, you can find many examples of both.

```
lrwxrwxrwx.  1 root root       36 Dec  8  2016 cracklib_dict.hwm -> ../../usr/share/cracklib/pw_dict.hwm 
lrwxrwxrwx.  1 root root       36 Dec  8  2016 cracklib_dict.pwd -> ../../usr/share/cracklib/pw_dict.pwd 
lrwxrwxrwx.  1 root root       36 Dec  8  2016 cracklib_dict.pwi -> ../../usr/share/cracklib/pw_dict.pwi
lrwxrwxrwx.  1 root root       27 Jun  9  2016 libaccountsservice.so.0 -> libaccountsservice.so.0.0.0 
-rwxr-xr-x.  1 root root   288456 Jun  9  2016 libaccountsservice.so.0.0.0 
lrwxrwxrwx   1 root root       15 May 17 11:47 libacl.so.1 -> libacl.so.1.1.0 
-rwxr-xr-x   1 root root    36472 May 17 11:47 libacl.so.1.1.0 
lrwxrwxrwx.  1 root root       15 Feb  4  2016 libaio.so.1 -> libaio.so.1.0.1 
-rwxr-xr-x.  1 root root     6224 Feb  4  2016 libaio.so.1.0.0 
-rwxr-xr-x.  1 root root     6224 Feb  4  2016 libaio.so.1.0.1 
lrwxrwxrwx.  1 root root       30 Jan 16 16:39 libakonadi-calendar.so.4 -> libakonadi-calendar.so.4.14.26 
-rwxr-xr-x.  1 root root   816160 Jan 16 16:39 libakonadi-calendar.so.4.14.26 
lrwxrwxrwx.  1 root root       29 Jan 16 16:39 libakonadi-contact.so.4 -> libakonadi-contact.so.4.14.26 
```

A few of the links in the **/lib64** directory

The long listing of the **/lib64** directory above shows that the first character in the filemode is the letter "l," which means that each is a soft or symbolic link.

### Hard links

In [An introduction to Linux's EXT4 filesystem][15], I discussed the fact that each file has one inode that contains information about that file, including the location of the data belonging to that file. [Figure 2][16] in that article shows a single directory entry that points to the inode. Every file must have at least one directory entry that points to the inode that describes the file. The directory entry is a hard link, thus every file has at least one hard link.

In Figure 1 below, multiple directory entries point to a single inode. These are all hard links. I have abbreviated the locations of three of the directory entries using the tilde (**~**) convention for the home directory, so that **~** is equivalent to **/home/user** in this example. Note that the fourth directory entry is in a completely different directory, **/home/shared**, which might be a location for sharing files between users of the computer.

![fig1directory_entries.png](https://opensource.com/sites/default/files/images/life/fig1directory_entries.png)
Figure 1

Hard links are limited to files contained within a single filesystem. "Filesystem" is used here in the sense of a partition or logical volume (LV) that is mounted on a specified mount point, in this case **/home**. This is because inode numbers are unique only within each filesystem, and a different filesystem, for example, **/var**or **/opt**, will have inodes with the same number as the inode for our file.

Because all the hard links point to the single inode that contains the metadata about the file, all of these attributes are part of the file, such as ownerships, permissions, and the total number of hard links to the inode, and cannot be different for each hard link. It is one file with one set of attributes. The only attribute that can be different is the file name, which is not contained in the inode. Hard links to a single **file/inode** located in the same directory must have different names, due to the fact that there can be no duplicate file names within a single directory.

The number of hard links for a file is displayed with the **ls -l** command. If you want to display the actual inode numbers, the command **ls -li** does that.

### Symbolic (soft) links

The difference between a hard link and a soft link, also known as a symbolic link (or symlink), is that, while hard links point directly to the inode belonging to the file, soft links point to a directory entry, i.e., one of the hard links. Because soft links point to a hard link for the file and not the inode, they are not dependent upon the inode number and can work across filesystems, spanning partitions and LVs.

The downside to this is: If the hard link to which the symlink points is deleted or renamed, the symlink is broken. The symlink is still there, but it points to a hard link that no longer exists. Fortunately, the **ls** command highlights broken links with flashing white text on a red background in a long listing.

### Lab project: experimenting with links

I think the easiest way to understand the use of and differences between hard and soft links is with a lab project that you can do. This project should be done in an empty directory as a  _non-root user_ . I created the **~/temp** directory for this project, and you should, too. It creates a safe place to do the project and provides a new, empty directory to work in so that only files associated with this project will be located there.

### **Initial setup**

First, create the temporary directory in which you will perform the tasks needed for this project. Ensure that the present working directory (PWD) is your home directory, then enter the following command.

```
mkdir temp
```

Change into **~/temp** to make it the PWD with this command.

```
cd temp
```

To get started, we need to create a file we can link to. The following command does that and provides some content as well.

```
du -h > main.file.txt
```

Use the **ls -l** long list to verify that the file was created correctly. It should look similar to my results. Note that the file size is only 7 bytes, but yours may vary by a byte or two.

```
[dboth@david temp]$ ls -l 
total 4 
-rw-rw-r-- 1 dboth dboth 7 Jun 13 07:34 main.file.txt
```

Notice the number "1" following the file mode in the listing. That number represents the number of hard links that exist for the file. For now, it should be 1 because we have not created any additional links to our test file.

### **Experimenting with hard links**

Hard links create a new directory entry pointing to the same inode, so when hard links are added to a file, you will see the number of links increase. Ensure that the PWD is still **~/temp**. Create a hard link to the file **main.file.txt**, then do another long list of the directory.

```
[dboth@david temp]$ ln main.file.txt link1.file.txt 
[dboth@david temp]$ ls -l 
total 8 
-rw-rw-r-- 2 dboth dboth 7 Jun 13 07:34 link1.file.txt 
-rw-rw-r-- 2 dboth dboth 7 Jun 13 07:34 main.file.txt
```

Notice that both files have two links and are exactly the same size. The date stamp is also the same. This is really one file with one inode and two links, i.e., directory entries to it. Create a second hard link to this file and list the directory contents. You can create the link to either of the existing ones: **link1.file.txt** or **main.file.txt**.

```
[dboth@david temp]$ ln link1.file.txt link2.file.txt ; ls -l
total 16 
-rw-rw-r-- 3 dboth dboth 7 Jun 13 07:34 link1.file.txt 
-rw-rw-r-- 3 dboth dboth 7 Jun 13 07:34 link2.file.txt 
-rw-rw-r-- 3 dboth dboth 7 Jun 13 07:34 main.file.txt
```

Notice that each new hard link in this directory must have a different name because two files—really directory entries—cannot have the same name within the same directory. Try to create another link with a target name the same as one of the existing ones.

```
[dboth@david temp]$ ln main.file.txt link2.file.txt 
ln: failed to create hard link 'link2.file.txt': File exists
```

Clearly that does not work, because **link2.file.txt** already exists. So far, we have created only hard links in the same directory. So, create a link in your home directory, the parent of the temp directory in which we have been working so far.

```
[dboth@david temp]$ ln main.file.txt ../main.file.txt ; ls -l ../main*
-rw-rw-r--    4 dboth dboth     7 Jun 13 07:34 main.file.txt
```

The **ls** command in the above listing shows that the **main.file.txt** file does exist in the home directory with the same name as the file in the temp directory. Of course, these are not different files; they are the same file with multiple links—directory entries—to the same inode. To help illustrate the next point, add a file that is not a link.

```
[dboth@david temp]$ touch unlinked.file ; ls -l
total 12
-rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 link1.file.txt
-rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 link2.file.txt
-rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 main.file.txt
-rw-rw-r-- 1 dboth dboth 0 Jun 14 08:18 unlinked.file
```

Look at the inode number of the hard links and that of the new file using the **-i**option to the **ls** command.

```
[dboth@david temp]$ ls -li
total 12
657024 -rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 link1.file.txt
657024 -rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 link2.file.txt
657024 -rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 main.file.txt
657863 -rw-rw-r-- 1 dboth dboth 0 Jun 14 08:18 unlinked.file
```

Notice the number **657024** to the left of the file mode in the example above. That is the inode number, and all three file links point to the same inode. You can use the **-i** option to view the inode number for the link we created in the home directory as well, and that will also show the same value. The inode number of the file that has only one link is different from the others. Note that the inode numbers will be different on your system.

Let's change the size of one of the hard-linked files.

```
[dboth@david temp]$ df -h > link2.file.txt ; ls -li
total 12
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 link1.file.txt
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 link2.file.txt
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 main.file.txt
657863 -rw-rw-r-- 1 dboth dboth    0 Jun 14 08:18 unlinked.file
```

The file size of all the hard-linked files is now larger than before. That is because there is really only one file that is linked to by multiple directory entries.

I know this next experiment will work on my computer because my **/tmp**directory is on a separate LV. If you have a separate LV or a filesystem on a different partition (if you're not using LVs), determine whether or not you have access to that LV or partition. If you don't, you can try to insert a USB memory stick and mount it. If one of those options works for you, you can do this experiment.

Try to create a link to one of the files in your **~/temp** directory in **/tmp** (or wherever your different filesystem directory is located).

```
[dboth@david temp]$ ln link2.file.txt /tmp/link3.file.txt
ln: failed to create hard link '/tmp/link3.file.txt' => 'link2.file.txt': 
Invalid cross-device link
```

Why does this error occur? The reason is each separate mountable filesystem has its own set of inode numbers. Simply referring to a file by an inode number across the entire Linux directory structure can result in confusion because the same inode number can exist in each mounted filesystem.

There may be a time when you will want to locate all the hard links that belong to a single inode. You can find the inode number using the **ls -li** command. Then you can use the **find** command to locate all links with that inode number.

```
[dboth@david temp]$ find . -inum 657024 
./main.file.txt
./link1.file.txt
./link2.file.txt
```

Note that the **find** command did not find all four of the hard links to this inode because we started at the current directory of **~/temp**. The **find** command only finds files in the PWD and its subdirectories. To find all the links, we can use the following command, which specifies your home directory as the starting place for the search.

```
[dboth@david temp]$ find ~ -samefile main.file.txt 
/home/dboth/temp/main.file.txt
/home/dboth/temp/link1.file.txt
/home/dboth/temp/link2.file.txt
/home/dboth/main.file.txt
```

You may see error messages if you do not have permissions as a non-root user. This command also uses the **-samefile** option instead of specifying the inode number. This works the same as using the inode number and can be easier if you know the name of one of the hard links.

### **Experimenting with soft links**

As you have just seen, creating hard links is not possible across filesystem boundaries; that is, from a filesystem on one LV or partition to a filesystem on another. Soft links are a means to answer that problem with hard links. Although they can accomplish the same end, they are very different, and knowing these differences is important.

Let's start by creating a symlink in our **~/temp** directory to start our exploration.

```
[dboth@david temp]$ ln -s link2.file.txt link3.file.txt ; ls -li
total 12
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 link1.file.txt
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 link2.file.txt
658270 lrwxrwxrwx 1 dboth dboth   14 Jun 14 15:21 link3.file.txt -> 
link2.file.txt
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 main.file.txt
657863 -rw-rw-r-- 1 dboth dboth    0 Jun 14 08:18 unlinked.file
```

The hard links, those that have the inode number **657024**, are unchanged, and the number of hard links shown for each has not changed. The newly created symlink has a different inode, number **658270**. The soft link named **link3.file.txt**points to **link2.file.txt**. Use the **cat** command to display the contents of **link3.file.txt**. The file mode information for the symlink starts with the letter "**l**" which indicates that this file is actually a symbolic link.

The size of the symlink **link3.file.txt** is only 14 bytes in the example above. That is the size of the text **link3.file.txt -> link2.file.txt**, which is the actual content of the directory entry. The directory entry **link3.file.txt** does not point to an inode; it points to another directory entry, which makes it useful for creating links that span file system boundaries. So, let's create that link we tried before from the **/tmp** directory.

```
[dboth@david temp]$ ln -s /home/dboth/temp/link2.file.txt 
/tmp/link3.file.txt ; ls -l /tmp/link*
lrwxrwxrwx 1 dboth dboth 31 Jun 14 21:53 /tmp/link3.file.txt -> 
/home/dboth/temp/link2.file.txt
```

### **Deleting links**

There are some other things that you should consider when you need to delete links or the files to which they point.

First, let's delete the link **main.file.txt**. Remember that every directory entry that points to an inode is simply a hard link.

```
[dboth@david temp]$ rm main.file.txt ; ls -li
total 8
657024 -rw-rw-r-- 3 dboth dboth 1157 Jun 14 14:14 link1.file.txt
657024 -rw-rw-r-- 3 dboth dboth 1157 Jun 14 14:14 link2.file.txt
658270 lrwxrwxrwx 1 dboth dboth   14 Jun 14 15:21 link3.file.txt -> 
link2.file.txt
657863 -rw-rw-r-- 1 dboth dboth    0 Jun 14 08:18 unlinked.file
```

The link **main.file.txt** was the first link created when the file was created. Deleting it now still leaves the original file and its data on the hard drive along with all the remaining hard links. To delete the file and its data, you would have to delete all the remaining hard links.

Now delete the **link2.file.txt** hard link.

```
[dboth@david temp]$ rm link2.file.txt ; ls -li 
total 8 
657024 -rw-rw-r-- 3 dboth dboth 1157 Jun 14 14:14 link1.file.txt 
658270 lrwxrwxrwx 1 dboth dboth   14 Jun 14 15:21 link3.file.txt -> 
link2.file.txt 
657024 -rw-rw-r-- 3 dboth dboth 1157 Jun 14 14:14 main.file.txt 
657863 -rw-rw-r-- 1 dboth dboth    0 Jun 14 08:18 unlinked.file
```

Notice what happens to the soft link. Deleting the hard link to which the soft link points leaves a broken link. On my system, the broken link is highlighted in colors and the target hard link is flashing. If the broken link needs to be fixed, you can create another hard link in the same directory with the same name as the old one, so long as not all the hard links have been deleted. You could also recreate the link itself, with the link maintaining the same name but pointing to one of the remaining hard links. Of course, if the soft link is no longer needed, it can be deleted with the **rm** command.

The **unlink** command can also be used to delete files and links. It is very simple and has no options, as the **rm** command does. It does, however, more accurately reflect the underlying process of deletion, in that it removes the link—the directory entry—to the file being deleted.

### Final thoughts

I worked with both types of links for a long time before I began to understand their capabilities and idiosyncrasies. It took writing a lab project for a Linux class I taught to fully appreciate how links work. This article is a simplification of what I taught in that class, and I hope it speeds your learning curve.

--------------------------------------------------------------------------------

作者简介：

David Both - David Both is a Linux and Open Source advocate who resides in Raleigh, North Carolina. He has been in the IT industry for over forty years and taught OS/2 for IBM where he worked for over 20 years. While at IBM, he wrote the first training course for the original IBM PC in 1981. He has taught RHCE classes for Red Hat and has worked at MCI Worldcom, Cisco, and the State of North Carolina. He has been working with Linux and Open Source Software for almost 20 years. 

---------------------------------

via: https://opensource.com/article/17/6/linking-linux-filesystem

作者：[David Both ][a]
译者：[runningwater](https://github.com/runningwater)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/dboth
[1]:https://opensource.com/resources/what-is-linux?src=linux_resource_menu
[2]:https://opensource.com/resources/what-are-linux-containers?src=linux_resource_menu
[3]:https://developers.redhat.com/promotions/linux-cheatsheet/?intcmp=7016000000127cYAAQ
[4]:https://developers.redhat.com/cheat-sheet/advanced-linux-commands-cheatsheet?src=linux_resource_menu&intcmp=7016000000127cYAAQ
[5]:https://opensource.com/tags/linux?src=linux_resource_menu
[6]:https://opensource.com/article/17/6/linking-linux-filesystem?rate=YebHxA-zgNopDQKKOyX3_r25hGvnZms_33sYBUq-SMM
[7]:https://opensource.com/user/14106/feed
[8]:https://www.flickr.com/photos/digypho/7905320090
[9]:https://creativecommons.org/licenses/by/2.0/
[10]:https://opensource.com/article/17/5/introduction-ext4-filesystem
[11]:https://opensource.com/article/16/11/managing-devices-linux
[12]:https://opensource.com/life/16/10/introduction-linux-filesystems
[13]:https://opensource.com/business/16/9/linux-users-guide-lvm
[14]:https://opensource.com/life/15/9/everything-is-a-file
[15]:https://opensource.com/article/17/5/introduction-ext4-filesystem
[16]:https://opensource.com/article/17/5/introduction-ext4-filesystem#fig2
[17]:https://opensource.com/users/dboth
[18]:https://opensource.com/article/17/6/linking-linux-filesystem#comments
