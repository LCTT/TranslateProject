How To Archive Files And Directories In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/Archive-Files-And-Directories-In-Linux-720x340.png)
In our previous tutorial, we discussed how to [**compress and decompress files using gzip and bzip2**][1] programs. In this tutorial, we are going to learn how to archive files in Linux. Aren’t archiving and compressing same? Some of you might often think these terms refers the same meaning. But, both are completely different. Archiving is the process of the combining multiple files and directories (same or different size) into one file. On the other hand, compressing is the process of reducing the size of of a file(s) or directory(s). Archiving is often used as part of the system backups or when moving the data from one system to another. Hope you understand the difference between archiving and compressing. Now, let us get into the topic.

### Archive files and directories

The most common programs to archive files and directories are;

  1. tar
  2. zip



This is a big topic. So, I am going to publish this article in two parts. In the first part, we will see how to archive files and directories using Tar command.

##### Archive files and directories using Tar command

**Tar** is an Unix command which stands for **T** ape **A** rchive. It is used to combine or store multiple files (same or different size) into a single file. There are 4 main operating modes in tar utility.

  1. **c** – Create an archive from a file(s) or directory(s).
  2. **x** – Extract an archive.
  3. **r** – Append files to the end of an archive.
  4. **t** – List the contents of the archive.



For complete list of modes, refer the man pages.

**Create a new archive**

For the purpose of this guide, I will be using a folder named **ostechnix** that contains three different type of files.
```
$ ls ostechnix/
file.odt image.png song.mp3

```

Now, let us create a new tar archive of the the directory ostechnix.
```
$ tar cf ostechnix.tar ostechnix/

```

Here, **c** flag refers create new archive and **f** refers the file name.

Similarly, to create an archive from a set of files in the current working directory, use this command:
```
$ tar cf archive.tar file1 file2 file 3

```

**Extract archives**

To extract an archive in the current directory, simply do:
```
$ tar xf ostechnix.tar

```

We can also extract the archive in a different directory using **C** flag(capital c). For example, the following command extracts the given archive file in **Downloads** directory.
```
$ tar xf ostechnix.tar -C Downloads/

```

Alternatively, go to the Downloads folder and extract the archive inside it like below.
```
$ cd Downloads/

$ tar xf ../ostechnix.tar

```

Some times you may want to extract files of a specific type. For example, the following command extracts the “.png” type files.
```
$ tar xf ostechnix.tar --wildcards "*.png"

```

**Create gzipped and bzipped archives**

By default, Tar creates the archive file ends with **.tar**. Also, tar command can be used in conjunction with the compression utilities **gzip** and **bzip2**. The files ends with **.tar** extensions refer the plain tar archive, the files ends with **tar.gz** or **.tgz** refers a **gzipped** archive, and the tar files ends with **tar.bz2** or **.tbz** refers **bzipped** archive, respectively.

First, let us **create a gzipped** archive:
```
$ tar czf ostechnix.tar.gz ostechnix/

```

Or,
```
$ tar czf ostechnix.tgz ostechnix/

```

Here, we use **z** flag to compress the archive using gzip compression method.

You can use **v** flag to view the progress while creating the archive.
```
$ tar czvf ostechnix.tar.gz ostechnix/
ostechnix/
ostechnix/file.odt
ostechnix/image.png
ostechnix/song.mp3

```

Here, **v** refers verbose.

To create gzipped archive from a list of files:
```
$ tar czf archive.tgz file1 file2 file3

```

To extract the gzipped archive in the current directory, use:
```
$ tar xzf ostechnix.tgz

```

To extract the archive in a different folder, use -C flag.
```
$ tar xzf ostechnix.tgz -C Downloads/

```

Now, let us create **bzipped archive**.

To do so, use **j** flag like below.

Create an archive of a directory:
```
$ tar cjf ostechnix.tar.bz2 ostechnix/

```

Or,
```
$ tar cjf ostechnix.tbz ostechnix/

```

Create archive from list of files:
```
$ tar cjf archive.tar.bz2 file1 file2 file3

```

Or,
```
$ tar cjf archive.tbz file1 file2 file3

```

To display the progress, use **v** flag.

Now, let us extract bzipped archive in the current directory. To do so, we do:
```
$ tar xjf ostechnix.tar.bz2

```

Or, extract the archive to some other directory:
```
$ tar xjf ostechnix.tar.bz2 -C Downloads

```

**Create archive of multiple directories and/or files at a time**

This is another coolest feature of tar command. To create an gzipped archive of multiple directories or files at once, use this command:
```
$ tar czvf ostechnix.tgz Downloads/ Documents/ ostechnix/file.odt

```

The above command will create an archive of **Downloads** , **Documents** directories and **file.odt** file in **ostechnix** directory and save the archive in the current working directory.

**Exclude directories and/or files from while creating an archive**

This is quite useful when backing up your data. You can exclude the non-important files or directories from your backup. This is where **–exclude** switch comes in help. For example, you want to create an archive of your /home directory, but exclude Downloads, Documents, Pictures, Music directories.

This is how we do it.
```
$ tar czvf ostechnix.tgz /home/sk --exclude=/home/sk/Downloads --exclude=/home/sk/Documents --exclude=/home/sk/Pictures --exclude=/home/sk/Music

```

The above command will create an gzipped archive of my $HOME directory, excluding Downloads, Documents, Pictures and Music folders. To create bzipped archive, replace **z** with **j** and use the extension .bz2 in the above example.

**List contents of archive files without extracting them**

To list the contents of an archive file, we use **t** flag.
```
$ tar tf ostechnix.tar
ostechnix/
ostechnix/file.odt
ostechnix/image.png
ostechnix/song.mp3

```

To view the verbose output, use **v** flag.
```
$ tar tvf ostechnix.tar
drwxr-xr-x sk/users 0 2018-03-26 19:52 ostechnix/
-rw-r--r-- sk/users 9942 2018-03-24 13:49 ostechnix/file.odt
-rw-r--r-- sk/users 36013 2015-09-30 11:52 ostechnix/image.png
-rw-r--r-- sk/users 112383 2018-02-22 14:35 ostechnix/song.mp3

```

**Append files to existing archives**

Files or directories can be added/updated to the existing archives using **r** flag. Take a look at the following command.
```
$ tar rf ostechnix.tar ostechnix/ sk/ example.txt

```

The above command will add the directory named **sk** and a file named **example.txt** to ostechnix.tar archive.

You can verify if the files are added or not using command:
```
$ tar tvf ostechnix.tar
drwxr-xr-x sk/users 0 2018-03-26 19:52 ostechnix/
-rw-r--r-- sk/users 9942 2018-03-24 13:49 ostechnix/file.odt
-rw-r--r-- sk/users 36013 2015-09-30 11:52 ostechnix/image.png
-rw-r--r-- sk/users 112383 2018-02-22 14:35 ostechnix/song.mp3
drwxr-xr-x sk/users 0 2018-03-26 19:52 sk/
-rw-r--r-- sk/users 0 2018-03-26 19:39 sk/linux.txt
-rw-r--r-- sk/users 0 2018-03-26 19:56 example.txt

```

##### **TL;DR**

**Create tar archives:**

  * **Plain tar archive:** tar -cf archive.tar file1 file2 file3
  * **Gzipped tar archive:** tar -czf archive.tgz file1 file2 file3
  * **Bzipped tar archive:** tar -cjf archive.tbz file1 file2 file3



**Extract tar archives:**

  * **Plain tar archive:** tar -xf archive.tar
  * **Gzipped tar archive:** tar -xzf archive.tgz
  * **Bzipped tar archive:** tar -xjf archive.tbz



We just have covered the basic usage of tar command. It is enough to get started with tar command. However, if you to know more details, refer the man pages.
```
$ man tar

```

And, that’s all for now. In the next part, we will see how to archives files and directories using Zip utility.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-archive-files-and-directories-in-linux-part-1/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/how-to-compress-and-decompress-files-in-linux/
