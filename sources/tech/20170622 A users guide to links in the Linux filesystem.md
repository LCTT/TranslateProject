Translating by yongshouzhang

linux 文件链接用户指南
============================================================

### 学习如何使用链接，通过提供对 linux 文件系统多个位置的文件访问，来让日常工作变得轻松


![A user's guide to links in the Linux filesystem](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/links.png?itok=AumNmse7 "A user's guide to links in the Linux filesystem")
Image by : [Paul Lewin][8]. Modified by Opensource.com. [CC BY-SA 2.0][9]

在我为 opensource.com 写过的关于linux文件系统方方面面的文章中，包括 [An introduction to Linux's EXT4 filesystem][10]; [Managing devices in Linux][11]; [An introduction to Linux filesystems][12]; and [A Linux user's guide to Logical Volume Management][13]，我曾简要的提到过linux文件系统一个有趣的特性，它允许用户访问linux文件目录树中多个位置的文件来简化一些任务

linux 文件系统中有两种链接：硬链接和软链接。虽然二者差别显著，但都用来解决相似的问题。它们都提供了对单个文件进行多个目录项的访问（引用），但实现却大为不同。链接的强大功能赋予了 linux 文件系统灵活性，因为[一切即文件][14]。

更多 linux 资源

*   [什么是 linux ？][1]

*   [什么是 linux 容器？][2]

*   [现在下载: linux 命令速查表][3]

*   [linux 高级命令速查表][4]

*   [我们最新的 linux 文章][5]

举个例子，我曾发现一些程序要求特定的版本库方可运行。 当用升级后的库替代旧库后，程序会崩溃，提示就版本库缺失。 同城库中唯一变化是版本号。出于该直觉，我仅仅给程序添加了一个新的库链接，并以旧库名称命名。我试着再次启动程序，运行良好。 程序就是一个游戏，人人都明白，每个玩家都会尽力使游戏进行下去。

事实上，几乎所有的应用程序链接库都使用通用的命名规则，链接名称中包含了住版本号，链接所指文件的文件名中同样包含了最小版本号。再比如，程序的一些必需文件为了迎合 linux 文件系统的规范从一个目录移动到另一个目录中，系统为了向后兼容那些不能获取这些文件新位置的程序在旧的目录中存放了这些文件的链接。如果你对 /lib64 目录做一个长清单列表，你会发现很多这样的例子。 

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

**/lib64** 目录下的一些链接

T在上面展示的 **/lib64** 目录清单列表中，文件模式第一个字母 I 表示这是一个符号链接或软链接。

### 硬链接

在 [An introduction to Linux's EXT4 filesystem][15]一文中，我曾探讨过这样一个事实，每个文件都有一个包含该文件信息的节点，包含了该文件的位置信息。上述文章中的[图2][16]展示了一个指向文件节点的单一目录项。每个文件都至少有一个目录项指向描述该文件信息的文件节点，目录项是一个硬链接，因此每个文件至少都有一个硬链接。

如下图1所示，多个目录项指向了同一文件节点。这些目录项都是硬链接。我曾使用波浪线 (**~**) 表示三级目录项的缩写，这是用户目录的惯例表示，因此在该例中波浪线等同于 **/home/user** 。值得注意的是，四级目录项是一个完全不同的目录，**/home/shared** 可能是该计算机上用户的共享文件目录。

![fig1directory_entries.png](https://opensource.com/sites/default/files/images/life/fig1directory_entries.png)
Figure 1

单一文件系统中的文件硬链接数是有限制的。”文件系统“ 是就挂载在特定挂载点上的分区或逻辑卷而言的，此例中是 /home。这是因为文件系统中的节点号都是唯一的。在不同的文件系统中，如 **/var** 或 **/opt**，会有和 **/home** 中相同的节点号。

因为所有的硬链接都指向了包含文件元信息的节点，这些特性都是文件的一部分，像所属关系，权限，节点硬链接数目，这些特性不能区分不同的硬链接。这是一个文件所具有的一组属性。唯一能区分这些文件的是包含在节点信息中的文件名。对单靠 **file/inode** 来定位文件的同一目录中的硬链接必须拥有不同的文件名，基于上述事实，同一目录下不能存在重复的文件名。

文件的硬链接数目可通过 **ls -l** 来查看，如果你想查看实际节点号，可使用 **ls -li** 命令。

### 符号（软）链接

软链接（符号链接）和硬链接的区别在于，硬链接直接指向文件中的节点而软链接直接指向一个目录项，即一个硬链接。因为软链接指向一个文件的硬链接而非该文件的节点信息，所以它们并不依赖于文件节点，这使得它们能在不同的文件系统中起作用，跨越不同的分区和逻辑卷。

软链接的缺点是，一旦它所指向的硬链接被删除或重命名后，该软链接就失效了。软链接虽然还在，但所指向的硬链接已不存在。所幸的是，**ls** 命令能以红底白字的方式在其列表中高亮显示失效的软链接。

### 实验项目: 链接实验

我认为最容易理解链接用法及其差异的方法即使动手搭建一个项目。这个项目应以非超级用户的身份在一个空目录下进行。我创建了 **~/tmp** 目录做这个实验，你也可以这么做。这么做可为项目创建一个安全的环境且提供一个新的空目录让程序运作，如此以来这儿仅存放和程序有关的文件。

### **初始工作**

首先，在你要进行实验的目录下为该项目中的任务创建一个临时目录，确保当前工作目录（PWD）是你的主目录，然后键入下列命令。

```
mkdir temp
```

使用这个命名将当前工作目录切换到 *~/temp** 

```
cd temp
```

实验开始，我们创建一个能够链接的文件，下列命令可完成该工作并向其填充内容。

```
du -h > main.file.txt
```

使用 *ls -l** 长列表命名确认文件被正确地创建。运行结果应类似于我的。注意文件大小只有 7 字节，但你的可能会有 1～2 字节的变动。

```
[dboth@david temp]$ ls -l 
total 4 
-rw-rw-r-- 1 dboth dboth 7 Jun 13 07:34 main.file.txt
```

在列表中，文件模式串后的数字 1 代表存在于该文件上的硬链接数。现在应该是 1 ，因为我们还没有为这个测试文件建立任何硬链接。

### **对硬链接进行实验**

硬链接创建一个指向同一文件节点的目录项，当为文件添加一个硬链接时，你会看到链接数目的增加。确保当前工作目录仍为 **~/temp**。创建一个指向 **main.file.txt** 的硬链接，然后查看该目录下文件列表。

```
[dboth@david temp]$ ln main.file.txt link1.file.txt 
[dboth@david temp]$ ls -l 
total 8 
-rw-rw-r-- 2 dboth dboth 7 Jun 13 07:34 link1.file.txt 
-rw-rw-r-- 2 dboth dboth 7 Jun 13 07:34 main.file.txt
```

目录中两个文件都有两个链接且大小相同，时间戳也一样。这是同一文件节点的两个不同的硬链接，即该文件的目录项。再建立一个该文件的硬链接，并列出目录清单内容，你可以建立 **link1.file.txt** 或 **main.file.txt** 的硬链接。

```
[dboth@david temp]$ ln link1.file.txt link2.file.txt ; ls -l
total 16 
-rw-rw-r-- 3 dboth dboth 7 Jun 13 07:34 link1.file.txt 
-rw-rw-r-- 3 dboth dboth 7 Jun 13 07:34 link2.file.txt 
-rw-rw-r-- 3 dboth dboth 7 Jun 13 07:34 main.file.txt
```

注意，该目录下的每个硬链接必须使用不同的名称，因为同一目录下的两个文件不能拥有相同的文件名。试着创建一个和现存链接名称相同的硬链接。

```
[dboth@david temp]$ ln main.file.txt link2.file.txt 
ln: failed to create hard link 'link2.file.txt': File exists
```

显然不行，因为 **link2.file.txt** 已经存在。目前为止我们只在同一目录下创建硬链接，接着在临时目录的父目录，你的主目录中创建一个链接。

```
[dboth@david temp]$ ln main.file.txt ../main.file.txt ; ls -l ../main*
-rw-rw-r--    4 dboth dboth     7 Jun 13 07:34 main.file.txt
```

 上面的 **ls** 命令显示 **main.file.txt** 文件确实存在于主目录中，且与该文件在 temp 目录中的名称一致。当然它们是没有区别的两个文件，它们是同一文件的两个链接，指向了同一文件的目录项。为了帮助说明下一点，在 temp 目录中添加一个非链接文件。
```
[dboth@david temp]$ touch unlinked.file ; ls -l
total 12
-rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 link1.file.txt
-rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 link2.file.txt
-rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 main.file.txt
-rw-rw-r-- 1 dboth dboth 0 Jun 14 08:18 unlinked.file
```

使用 **ls** 命令的 **i** 选项查看文件节点的硬链接号和新创建文件的硬链接号。

```
[dboth@david temp]$ ls -li
total 12
657024 -rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 link1.file.txt
657024 -rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 link2.file.txt
657024 -rw-rw-r-- 4 dboth dboth 7 Jun 13 07:34 main.file.txt
657863 -rw-rw-r-- 1 dboth dboth 0 Jun 14 08:18 unlinked.file
```

注意上面文件模式左边的数字 **657024** ，这是三个硬链接文件所指的同一文件的节点号，你也可以使用 **i** 选项查看主目录中所创建的链接节点号，和该值相同。只有一个链接的文件节点号和其他的不同，在你的系统上看到的不同于本文中的。

接着改变其中一个硬链接文件的大小。

```
[dboth@david temp]$ df -h > link2.file.txt ; ls -li
total 12
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 link1.file.txt
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 link2.file.txt
657024 -rw-rw-r-- 4 dboth dboth 1157 Jun 14 14:14 main.file.txt
657863 -rw-rw-r-- 1 dboth dboth    0 Jun 14 08:18 unlinked.file
```

现在的硬链接文件大小比原来大，因为多个目录项链接着同一文件。

我知道下个实验在我的电脑上会成功，因为我的 **/tmp** 目录是一个独立的逻辑卷，如果你有单独的逻辑卷或文件系统在不同的分区上（如果未使用逻辑卷），确定你是否能访问那个分区或逻辑卷，如果不能，你可以在电脑上挂载一个 U盘，如果上述选项适合你，你可以进行这个实验。

试着在 **/tmp** 目录中建立一个 **~/temp** 目录下文件的链接（或你的文件系统所在的位置）

```
[dboth@david temp]$ ln link2.file.txt /tmp/link3.file.txt
ln: failed to create hard link '/tmp/link3.file.txt' => 'link2.file.txt': 
Invalid cross-device link
```

为什么会出现这个错误呢？ 原因是每一个单独的挂载文件系统都有一套自己的节点号。 Simply referring to a file by an inode number across the entire Linux directory structure can result in confusion because the same inode number can exist in each mounted filesystem.

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
