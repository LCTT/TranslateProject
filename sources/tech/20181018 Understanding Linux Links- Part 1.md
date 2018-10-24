Understanding Linux Links: Part 1
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/linux-link-498708.jpg?itok=DyVEcEsc)

Along with `cp` and `mv`, both of which we talked about at length in [the previous installment of this series][1], links are another way of putting files and directories where you want them to be. The advantage is that links let you have one file or directory show up in several places at the same time.

As noted previously, at the physical disk level, things like files and directories don't really exist. A filesystem conjures them up for our human convenience. But at the disk level, there is something called a _partition table_ , which lives at the beginning of every partition, and then the data scattered over the rest of the disk.

Although there are different types of partition tables, the ones at the beginning of a partition containing your data will map where each directory and file starts and ends. The partition table acts like an index: When you load a file from your disk, your operating system looks up the entry on the table and the table says where the file starts on the disk and where it finishes. The disk header moves to the start point, reads the data until it reaches the end point and, hey presto: here's your file.

### Hard Links

A hard link is simply an entry in the partition table that points to an area on a disk that **has already been assigned to a file**. In other words, a hard link points to data that has already been indexed by another entry. Let's see how this works.

Open a terminal, create a directory for tests and move into it:

```
mkdir test_dir
cd test_dir
```

Create a file by [touching][1] it:

```
touch test.txt
```

For extra excitement (?), open _test.txt_ in a text editor and add some a few words into it.

Now make a hard link by executing:

```
ln test.txt hardlink_test.txt
```

Run `ls`, and you'll see your directory now contains two files... Or so it would seem. As you read before, really what you are seeing is two names for the exact same file: _hardlink_test.txt_ contains the same content, has not filled any more space in the disk (try with a large file to test this), and shares the same inode as _test.txt_ :

```
$ ls -li *test*
16515846 -rw-r--r-- 2 paul paul 14 oct 12 09:50 hardlink_test.txt
16515846 -rw-r--r-- 2 paul paul 14 oct 12 09:50 test.txt
```

_ls_ 's `-i` option shows the _inode number_ of a file. The _inode_ is the chunk of information in the partition table that contains the location of the file or directory on the disk, the last time it was modified, and other data. If two files share the same inode, they are, to all practical effects, the same file, regardless of where they are located in the directory tree.

### Fluffy Links

Soft links, also known as _symlinks_ , are different: a soft link is really an independent file, it has its own inode and its own little slot on the disk. But it only contains a snippet of data that points the operating system to another file or directory.

You can create a soft link using `ln` with the `-s` option:

```
ln -s test.txt softlink_test.txt
```

This will create the soft link _softlink_test.txt_ to _test.txt_ in the current directory.

By running `ls -li` again, you can see the difference between the two different kinds of links:

```
$ ls -li
total 8
16515846 -rw-r--r-- 2 paul paul 14 oct 12 09:50 hardlink_test.txt
16515855 lrwxrwxrwx 1 paul paul 8 oct 12 09:50 softlink_test.txt -> test.txt
16515846 -rw-r--r-- 2 paul paul 14 oct 12 09:50 test.txt
```

_hardlink_test.txt_ and _test.txt_ contain some text and take up the same space *literally*. They also share the same inode number. Meanwhile, _softlink_test.txt_ occupies much less and has a different inode number, marking it as a different file altogether. Using the _ls_ 's `-l` option also shows the file or directory your soft link points to.

### Why Use Links?

They are good for **applications that come with their own environment**. It often happens that your Linux distro does not come with the latest version of an application you need. Take the case of the fabulous [Blender 3D][2] design software. Blender allows you to create 3D still images as well as animated films and who wouldn't to have that on their machine? The problem is that the current version of Blender is always at least one version ahead of that found in any distribution.

Fortunately, [Blender provides downloads][3] that run out of the box. These packages come, apart from with the program itself, a complex framework of libraries and dependencies that Blender needs to work. All these bits and piece come within their own hierarchy of directories.

Every time you want to run Blender, you could `cd` into the folder you downloaded it to and run:

```
./blender
```

But that is inconvenient. It would be better if you could run the `blender` command from anywhere in your file system, as well as from your desktop command launchers.

The way to do that is to link the _blender_ executable into a _bin/_ directory. On many systems, you can make the `blender` command available from anywhere in the file system by linking to it like this:

```
ln -s /path/to/blender_directory/blender /home/<username>/bin
```

Another case in which you will need links is for **software that needs outdated libraries**. If you list your _/usr/lib_ directory with `ls -l,` you will see a lot of soft-linked files fly by. Take a closer look, and you will see that the links usually have similar names to the original files they are linking to. You may see _libblah_ linking to _libblah.so.2_ , and then, you may even notice that _libblah.so.2_ links in turn to _libblah.so.2.1.0_ , the original file.

This is because applications often require older versions of alibrary than what is installed. The problem is that, even if the more modern versions are still compatible with the older versions (and usually they are), the program will bork if it doesn't find the version it is looking for. To solve this problem distributions often create links so that the picky application believes it has found the older version, when, in reality, it has only found a link and ends up using the more up to date version of the library.

Somewhat related is what happens with **programs you compile yourself from the source code**. Programs you compile yourself often end up installed under _/usr/local_ : the program itself ends up in _/usr/local/bin_ and it looks for the libraries it needs _/_ in the _/usr/local/lib_ directory. But say that your new program needs _libblah_ , but _libblah_ lives in _/usr/lib_ and that's where all your other programs look for it. You can link it to _/usr/local/lib_ by doing:

```
ln -s /usr/lib/libblah /usr/local/lib
```

Or, if you prefer, by `cd`ing into _/usr/local/lib_...

```
cd /usr/local/lib
```

... and then linking with:

```
ln -s ../lib/libblah
```

There are dozens more cases in which linking proves useful, and you will undoubtedly discover them as you become more proficient in using Linux, but these are the most common. Next time, we’ll look at some linking quirks you need to be aware of.

Learn more about Linux through the free ["Introduction to Linux" ][4]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/blog/intro-to-linux/2018/10/linux-links-part-1

作者：[Paul Brown][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.linux.com/users/bro66
[b]: https://github.com/lujun9972
[1]: https://www.linux.com/blog/2018/8/linux-beginners-moving-things-around
[2]: https://www.blender.org/
[3]: https://www.blender.org/download/
[4]: https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
