Translating by Jamkr

Understanding Linux Links: Part 2
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/links-fikri-rasyid-7853.jpg?itok=0jBT_1M2)

In the [first part of this series][1], we looked at hard links and soft links and discussed some of the various ways that linking can be useful. Linking may seem straightforward, but there are some non-obvious quirks you have to be aware of. That’s what we’ll be looking at here. Consider, for example, at the way we created the link to _libblah_ in the previous article. Notice how we linked from within the destination folder:

```
cd /usr/local/lib

ln -s /usr/lib/libblah
```

That will work. But this:

```
cd /usr/lib

ln -s libblah /usr/local/lib
```

That is, linking from within the original folder to the destination folder, will not work.

The reason for that is that _ln_ will think you are linking from inside _/usr/local/lib_ to _/usr/local/lib_ and will create a linked file from _libblah_ in _/usr/local/lib_ to _libblah_ also in _/usr/local/lib_. This is because all the link file gets is the name of the file ( _libblah_ ) but not the path to the file. The end result is a very broken link.

However, this:

```
cd /usr/lib

ln -s /usr/lib/libblah /usr/local/lib
```

will work. Then again, it would work regardless of from where you executed the instruction within the filesystem. Using absolute paths, that is, spelling out the whole the path, from root (/) drilling down to to the file or directory itself, is just best practice.

Another thing to note is that, as long as both _/usr/lib_ and _/usr/local/lib_ are on the same partition, making a hard link like this:

```
cd /usr/lib

ln -s libblah /usr/local/lib
```

will also work because hard links don't rely on pointing to a file within the filesystem to work.

Where hard links will not work is if you want to link across partitions. Say you have _fileA_ on partition A and the partition is mounted at _/path/to/partitionA/directory_. If you want to link _fileA_ to _/path/to/partitionB/directory_ that is on partition B, this will not work:

```
ln /path/to/partitionA/directory/file /path/to/partitionB/directory
```

As we saw previously, hard links are entries in a partition table that point to data on the *same partition*. You can't have an entry in the table of one partition pointing to data on another partition. Your only choice here would be to us a soft link:

```
ln -s /path/to/partitionA/directory/file /path/to/partitionB/directory
```

Another thing that soft links can do and hard links cannot is link to whole directories:

```
ln -s /path/to/some/directory /path/to/some/other/directory
```

will create a link to _/path/to/some/directory_ within _/path/to/some/other/directory_ without a hitch.

Trying to do the same by hard linking will show you an error saying that you are not allowed to do that. And the reason for that is unending recursiveness: if you have directory B inside directory A, and then you link A inside B, you have situation, because then A contains B within A inside B that incorporates A that encloses B, and so on ad-infinitum.

You can have recursive using soft links, but why would you do that to yourself?

### Should I use a hard or a soft link?

In general you can use soft links everywhere and for everything. In fact, there are situations in which you can only use soft links. That said, hard links are slightly more efficient: they take up less space on disk and are faster to access. On most machines you will not notice the difference, though: the difference in space and speed will be negligible given today's massive and speedy hard disks. However, if you are using Linux on an embedded system with a small storage and a low-powered processor, you may want to give hard links some consideration.

Another reason to use hard links is that a hard link is much more difficult to break. If you have a soft link and you accidentally move or delete the file it is pointing to, your soft link will be broken and point to... nothing. There is no danger of this happening with a hard link, since the hard link points directly to the data on the disk. Indeed, the space on the disk will not be flagged as free until the last hard link pointing to it is erased from the file system.

Soft links, on the other hand can do more than hard links and point to anything, be it file or directory. They can also point to items that are on different partitions. These two things alone often make them the only choice.

### Next Time

Now we have covered files and directories and the basic tools to manipulate them, you are ready to move onto the tools that let you explore the directory hierarchy, find data within files, and examine the contents. That's what we'll be dealing with in the next installment. See you then!

Learn more about Linux through the free ["Introduction to Linux" ][2]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/2018/10/understanding-linux-links-part-2

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/intro-to-linux/2018/10/linux-links-part-1
[2]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
