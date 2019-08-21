[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Copying files in Linux)
[#]: via: (https://opensource.com/article/19/8/copying-files-linux)
[#]: author: (Seth Kenlon https://opensource.com/users/sethhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/greg-p)

Copying files in Linux
======
Learn multiple ways to copy files on Linux, and the advantages of each.
![Filing papers and documents][1]

Copying documents used to require a dedicated staff member in offices, and then a dedicated machine. Today, copying is a task computer users do without a second thought. Copying data on a computer is so trivial that copies are made without you realizing it, such as when dragging a file to an external drive.

The concept that digital entities are trivial to reproduce is pervasive, so most modern computerists don’t think about the options available for duplicating their work. And yet, there are several different ways to copy a file on Linux. Each method has nuanced features that might benefit you, depending on what you need to get done.

Here are a number of ways to copy files on Linux, BSD, and Mac.

### Copying in the GUI

As with most operating systems, you can do all of your file management in the GUI, if that's the way you prefer to work.

Drag and drop

The most obvious way to copy a file is the way you’re probably used to copying files on computers: drag and drop. On most Linux desktops, dragging and dropping from one local folder to another local folder _moves_ a file by default. You can change this behavior to a copy operation by holding down the **Ctrl** key after you start dragging the file.

Your cursor may show an indicator, such as a plus sign, to show that you are in copy mode:

![Copying a file.][2]

Note that if the file exists on a remote system, whether it’s a web server or another computer on your own network that you access through a file-sharing protocol, the default action is often to copy, not move, the file.

#### Right-click

If you find dragging and dropping files around your desktop imprecise or clumsy, or doing so takes your hands away from your keyboard too much, you can usually copy a file using the right-click menu. This possibility depends on the file manager you use, but generally, a right-click produces a contextual menu containing common actions.

The contextual menu copy action stores the [file path][3] (where the file exists on your system) in your clipboard so you can then _paste_ the file somewhere else:

![Copying a file from the context menu.][4]

In this case, you’re not actually copying the file’s contents to your clipboard. Instead, you're copying the [file path][3]. When you paste, your file manager looks at the path in your clipboard and then runs a copy command, copying the file located at that path to the path you are pasting into.

### Copying on the command line

While the GUI is a generally familiar way to copy files, copying in a terminal can be more efficient.

#### cp

The obvious terminal-based equivalent to copying and pasting a file on the desktop is the **cp** command. This command copies files and directories and is relatively straightforward. It uses the familiar _source_ and _target_ (strictly in that order) syntax, so to copy a file called **example.txt** into your **Documents** directory:


```
$ cp example.txt ~/Documents
```

Just like when you drag and drop a file onto a folder, this action doesn’t replace **Documents** with **example.txt**. Instead, **cp** detects that **Documents** is a folder, and places a copy of **example.txt** into it.

You can also, conveniently (and efficiently), rename the file as you copy it:


```
$ cp example.txt ~/Documents/example_copy.txt
```

That fact is important because it allows you to make a copy of a file in the same directory as the original:


```
$ cp example.txt example.txt
cp: 'example.txt' and 'example.txt' are the same file.
$ cp example.txt example_copy.txt
```

To copy a directory, you must use the **-r** option, which stands for --**recursive**. This option runs **cp** on the directory _inode_, and then on all files within the directory. Without the **-r** option, **cp** doesn’t even recognize a directory as an object that can be copied:


```
$ cp notes/ notes-backup
cp: -r not specified; omitting directory 'notes/'
$ cp -r notes/ notes-backup
```

#### cat

The **cat** command is one of the most misunderstood commands, but only because it exemplifies the extreme flexibility of a [POSIX][5] system. Among everything else **cat** does (including its intended purpose of con_cat_enating files), it can also copy. For instance, with **cat** you can [create two copies from one file][6] with just a single command. You can’t do that with **cp**.

The significance of using **cat** to copy a file is the way the system interprets the action. When you use **cp** to copy a file, the file’s attributes are copied along with the file itself. That means that the file permissions of the duplicate are the same as the original:


```
$ ls -l -G -g
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
$ cp foo.jpg bar.jpg
-rw-r--r--. 1 57368 Jul 29 13:37  bar.jpg
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
```

Using **cat** to read the contents of a file into another file, however, invokes a system call to create a new file. These new files are subject to your default **umask** settings. To learn more about `umask`, read Alex Juarez’s article covering [umask][7] and permissions in general.

Run **umask** to get the current settings:


```
$ umask
0002
```

This setting means that new files created in this location are granted **664** (**rw-rw-r--**) permission because nothing is masked by the first digits of the **umask** setting (and the executable bit is not a default bit for file creation), and the write permission is blocked by the final digit.

When you copy with **cat**, you don’t actually copy the file. You use **cat** to read the contents of the file, and then redirect the output into a new file:


```
$ cat foo.jpg &gt; baz.jpg
$ ls -l -G -g
-rw-r--r--. 1 57368 Jul 29 13:37  bar.jpg
-rw-rw-r--. 1 57368 Jul 29 13:42  baz.jpg
-rw-r--r--. 1 57368 Jul 25 23:57  foo.jpg
```

As you can see, **cat** created a brand new file with the system’s default umask applied.

In the end, when all you want to do is copy a file, the technicalities often don’t matter. But sometimes you want to copy a file and end up with a default set of permissions, and with **cat** you can do it all in one command**.**

#### rsync

The **rsync** command is a versatile tool for copying files, with the notable ability to synchronize your source and destination. At its most simple, **rsync** can be used similarly to **cp** command:


```
$ rsync example.txt example_copy.txt
$ ls
example.txt    example_copy.txt
```

The command’s true power lies in its ability to _not_ copy when it’s not necessary. If you use **rsync** to copy a file into a directory, but that file already exists in that directory, then **rsync** doesn’t bother performing the copy operation. Locally, that fact doesn’t necessarily mean much, but if you’re copying gigabytes of data to a remote server, this feature makes a world of difference.

What does make a difference even locally, though, is the command’s ability to differentiate files that share the same name but which contain different data. If you’ve ever found yourself faced with two copies of what is meant to be the same directory, then **rsync** can synchronize them into one directory containing the latest changes from each. This setup is a pretty common occurrence in industries that haven’t yet discovered the magic of version control, and for backup solutions in which there is one source of truth to propagate.

You can emulate this situation intentionally by creating two folders, one called **example** and the other **example_dupe**:


```
$ mkdir example example_dupe
```

Create a file in the first folder:


```
$ echo "one" &gt; example/foo.txt
```

Use **rsync** to synchronize the two directories. The most common options for this operation are **-a** (for _archive_, which ensures symlinks and other special files are preserved) and **-v** (for _verbose_, providing feedback to you on the command’s progress):


```
$ rsync -av example/ example_dupe/
```

The directories now contain the same information:


```
$ cat example/foo.txt
one
$ cat example_dupe/foo.txt
one
```

If the file you are treating as the source diverges, then the target is updated to match:


```
$ echo "two" &gt;&gt; example/foo.txt
$ rsync -av example/  example_dupe/
$ cat example_dupe/foo.txt
one
two
```

Keep in mind that the **rsync** command is meant to copy data, not to act as a version control system. For instance, if a file in the destination somehow gets ahead of a file in the source, that file is still overwritten because **rsync** compares files for divergence and assumes that the destination is always meant to mirror the source:


```
$ echo "You will never see this note again" &gt; example_dupe/foo.txt
$ rsync -av example/  example_dupe/
$ cat example_dupe/foo.txt
one
two
```

If there is no change, then no copy occurs.

The **rsync** command has many options not available in **cp**, such as the ability to set target permissions, exclude files, delete outdated files that don’t appear in both directories, and much more. Use **rsync** as a powerful replacement for **cp**, or just as a useful supplement.

### Many ways to copy

There are many ways to achieve essentially the same outcome on a POSIX system, so it seems that open source’s reputation for flexibility is well earned. Have I missed a useful way to copy data? Share your copy hacks in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/copying-files-linux

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/sethhttps://opensource.com/users/scottnesbitthttps://opensource.com/users/greg-p
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: https://opensource.com/sites/default/files/uploads/copy-nautilus.jpg (Copying a file.)
[3]: https://opensource.com/article/19/7/understanding-file-paths-and-how-use-them
[4]: https://opensource.com/sites/default/files/uploads/copy-files-menu.jpg (Copying a file from the context menu.)
[5]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[6]: https://opensource.com/article/19/2/getting-started-cat-command
[7]: https://opensource.com/article/19/7/linux-permissions-101
