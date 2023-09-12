[#]: subject: "How I use the attr command with my Linux filesystem"
[#]: via: "https://opensource.com/article/22/6/linux-attr-command"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "wznmickey"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How I use the attr command with my Linux filesystem
======
I use the open source XFS filesystem because of the subtle convenience of extended attributes. Extended attributes are a unique way to add context to my data.

![Why the operating system matters even more in 2017][1]

Image by: Internet Archive Book Images. Modified by Opensource.com. CC BY-SA 4.0

The term *filesystem* is a fancy word to describe how your computer keeps track of all the files you create. Whether it's an office document, a configuration file, or thousands of digital photos, your computer has to store a lot of data in a way that's useful for both you and it. Filesystems like Ext4, XFS, JFS, BtrFS, and so on are the "languages" your computer uses to keep track of data.

Your desktop or terminal can do a lot to help you find your data quickly. Your file manager might have, for instance, a filter function so you can quickly see just the image files in your home directory, or it might have a search function that can locate a file by its filename, and so on. These qualities are known as *file attributes* because they are exactly that: Attributes of the data object, defined by code in file headers and within the filesystem itself. Most filesystems record standard file attributes such as filename, file size, file type, time stamps for when it was created, and time stamps for when it was last visited.

I use the open source XFS filesystem on my computers not for its reliability and high performance but for the subtle convenience of extended attributes.

### Common file attributes

When you save a file, data about it are saved along with it. Common attributes tell your operating system whether to update the access time, when to synchronize the data in the file back to disk, and other logistical details. Which attributes get saved depends on the capabilities and features of the underlying filesystem.

In addition to standard file attributes (insofar as there are standard attributes), the XFS, Ext4, and BtrFS filesystems can all use extending filesystems.

### Extended attributes

XFS, Ext4, and BtrFS allow you to create your own arbitrary file attributes. Because you're making up attributes, there's nothing built into your operating system to utilize them, but I use them as "tags" for files in much the same way I use EXIF data on photos. Developers might choose to use extended attributes to develop custom capabilities in applications.

There are two "namespaces" for attributes in XFS: **user** and **root**. When creating an attribute, you must add your attribute to one of these namespaces. To add an attribute to the **root** namespace, you must use the `sudo` command or be logged in as root.

### Add an attribute

You can add an attribute to a file on an XFS filesystem with the `attr` or `setfattr` commands.

The `attr` command assumes the `user` namespace, so you only have to set (`-s` ) a name for your attribute followed by a value (`-V` ):

```
$ attr -s flavor -V vanilla example.txt
Attribute "flavor" set to a 7 byte value for example.txt:
vanilla
```

The `setfattr` command requires that you specify the target namespace:

```
$ setfattr --name user.flavor --value chocolate example.txt
```

### List extended file attributes

Use the `attr` or `getfattr` commands to see extended attributes you've added to a file. The `attr` command defaults to the **user** namespace and uses the `-g` option to *get* extended attributes:

```
$ attr -g flavor example.txt
Attribute "flavor" had a 9 byte value for example.txt:
chocolate
```

The `getfattr` command requires the namespace and name of the attribute:

```
$ getfattr --name user.flavor example.txt 
# file: example.txt
user.flavor="chocolate"
```

### List all extended attributes

To see all extended attributes on a file, you can use `attr -l` :

```
$ attr -l example.txt
Attribute "md5sum" has a 32 byte value for example.txt
Attribute "flavor" has a 9 byte value for example.txt
```

Alternately, you can use `getfattr -d` :

```
$ getfattr -d example.txt
# file: example.txt
user.flavor="chocolate"
user.md5sum="969181e76237567018e14fe1448dfd11"
```

Any extended file attribute can be updated with `attr` or `setfattr`, just as if you were creating the attribute:

```
$ setfattr --name user.flavor --value strawberry example.txt

$ getfattr -d example.txt
# file: example.txt
user.flavor="strawberry"
user.md5sum="969181e76237567018e14fe1448dfd11"
```

### Attributes on other filesystems

The greatest risk when using extended attributes is forgetting that these attributes are specific to the filesystem they're on. That means when you copy a file from one drive or partition to another, the attributes are lost *even if the target filesystem supports extended attributes*.

To avoid losing extended attributes, you must use a tool that supports retaining them, such as the `rsync` command.

```
$ rsync --archive --xattrs ~/example.txt /tmp/
```

No matter what tool you use, if you transfer a file to a filesystem that doesn't know what to do with extended attributes, those attributes are dropped.

### Search for attributes

There aren't many mechanisms to interact with extended attributes, so the options for using the file attributes you've added are limited. I use extended attributes as a tagging mechanism, which allows me to associate files that have no obvious relation to one another. For instance, suppose I need a Creative Commons graphic for a project I'm working on. Assume I've had the foresight to add the extended attribute **license** to my collection of graphics. I could search my graphic folder with `find` and `getfattr` together:

```
find ~/Graphics/ -type f \
-exec getfattr \
--name user.license \
-m cc-by-sa {} \; 2>/dev/null

# file: /home/tux/Graphics/Linux/kde-eco-award.png
user.license="cc-by-sa"
user.md5sum="969181e76237567018e14fe1448dfd11"
```

### Secrets of your filesystem

Filesystems aren't generally something you're meant to notice. They're literally systems for defining a file. It's not the most exciting task a computer performs, and it's not something users are supposed to have to be concerned with. But some filesystems give you some fun, and safe, special abilities, and extended file attributes are a good example. Its use may be limited, but extended attributes are a unique way to add context to your data.

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/6/linux-attr-command

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/yearbook-haff-rx-linux-file-lead_0.png
