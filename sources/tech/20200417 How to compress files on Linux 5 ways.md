[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to compress files on Linux 5 ways)
[#]: via: (https://www.networkworld.com/article/3538471/how-to-compress-files-on-linux-5-ways.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to compress files on Linux 5 ways
======
There are a number of tools that you use to compress files on Linux systems, but they don't all behave the same way or yield the same level of compression. In this post, we compare five of them.
Getty Images

There are quite a few commands on Linux for compressing files. One of the newest and most effective is **xz**, but they all have advantages for both saving disk space and preserving files for later use. In this post, we compare the compression commands and point out the significant differences.

### tar

The tar command is not specifically a compression command. It’s generally used to pull a number of files into a single file for easy transport to another system or to back the files up as a related group. It also provides compression as a feature, which makes a lot of sense, and the addition of the **z** compression option is available to make this happen.

When compression is added to a **tar** command with the **z** option, tar uses **gzip** to do the compressing.

You can use **tar** to compress a single file as easily as a group though this offers no particular advantage over using **gzip** directly. To use **tar** for this, just identify the file as you would a group of files with a “tar cfz newtarfile filename” command like this:

```
$ tar cfz bigfile.tgz bigfile
            ^            ^
            |            |
            +- new file  +- file to be compressed

$ ls -l bigfile*
-rw-rw-r-- 1 shs shs 103270400 Apr 16 16:09 bigfile
-rw-rw-r-- 1 shs shs 21608325 Apr 16 16:08 bigfile.tgz
```

Note the significant reduction in the file size.

If you prefer, you can use the **tar.gz** extension which might make the character of the file a bit more obvious, but most Linux users will probably recognize **tgz** as meaning the same thing – the combination of **tar** and **gz** to indicate that the file is a compressed tar file. You will be left with both the original file and the compressed file once the compression is complete.

To collect a number of files together and compress the resultant “tar ball” in one command, use the same basic syntax, but specify the files to be included as a group in place of the single file. Here’s an example:

[][1]

```
$ tar cfz bin.tgz bin/*
          ^         ^
          |         +-- files to include
          + new file
```

### zip

The **zip** command creates a compressed file while leaving the original file intact. The syntax is straightforward except that, as with **tar**, you have to remember that your original file should be the last argument on the command line.

```
$ zip ./bigfile.zip bigfile
updating: bigfile (deflated 79%)
$ ls -l bigfile bigfile.zip
-rw-rw-r-- 1 shs shs 103270400 Apr 16 11:18 bigfile
-rw-rw-r-- 1 shs shs  21606889 Apr 16 11:19 bigfile.zip
```

### gzip

The **gzip** command is very simple to use. You just type "gzip" followed by the name of the file you want to compress. Unlike the commands described above, **gzip** will encrypt the files "in place". In other words, the original file will be replaced by the encrypted file.

```
$ gzip bigfile
$ ls -l bigfile*
-rw-rw-r-- 1 shs shs  21606751 Apr 15 17:57 bigfile.gz
```

### bzip2

As with the **gzip** command, **bzip2** will compress the file that you select "in place", leaving only the original file.

```
$ bzip bigfile
$ ls -l bigfile*
-rw-rw-r-- 1 shs shs  18115234 Apr 15 17:57 bigfile.bz2
```

### xz

A relative newcomer to the compression command team, **xz** is a front runner in terms of how well it compresses files. Like the two previous commands, you only need to supply the file name to the command. Again, the original file is compressed in place.

```
$ xz bigfile
$ ls -l bigfile*
-rw-rw-r-- 1 shs shs 13427236 Apr 15 17:30 bigfile.xz
```

For large files, you are likely to notice that **xz** takes longer to run than other compression commands, but the compression results are very impressive.

### Comparisons to consider

Most people have heard it said that "size isn't everything". So, let's compare file size as well as some other issues to be considered when you make plans for how you want to compress your files.

The stats shown below all relate to compressing the single file – bigfile – used in the example commands shown above. This file is a large and fairly random text file. Compression rates will depend to some extent on the content of the files.

#### Size reduction

When compared, the various compression commands shown above yielded the following results. The percentages represent how the compressed files compare with the original file.

```
-rw-rw-r-- 1 shs shs 103270400 Apr 16 14:01 bigfile
------------------------------------------------------
-rw-rw-r-- 1 shs shs 18115234 Apr 16 13:59 bigfile.bz2    ~17%
-rw-rw-r-- 1 shs shs 21606751 Apr 16 14:00 bigfile.gz     ~21%
-rw-rw-r-- 1 shs shs 21608322 Apr 16 13:59 bigfile.tgz    ~21%
-rw-rw-r-- 1 shs shs 13427236 Apr 16 14:00 bigfile.xz     ~13%
-rw-rw-r-- 1 shs shs 21606889 Apr 16 13:59 bigfile.zip    ~21%
```

The **xz** commands wins, ending up at only 13% the size of the original file, but all of these compression commands reduced the original file size quite significantly.

#### Whether the original files are replaced

The **bzip2**, **gzip** and **xz** commands all replace the original files with compressed versions. The **tar** and **zip** commands to not.

#### Run time

The **xz** command seems to take more time than the other commands to encrypt the files. For bigfile, the approximate times were:

```
command   run-time
tar       4.9 seconds
zip       5.2 seconds
bzip2    22.8 seconds
gzip      4.8 seconds
xz       50.4 seconds
```

Decompression times are likely to be considerably smaller than compression times.

#### File permissions

Regardless of what permissions you have set on your original file, permissions for the compressed file will be based on your **umask** setting, except for **bzip2** which retains the original file's permissions.

#### Compatibility with Windows

The **zip** command creates a file which can be used (i.e., decompressed) on Windows systems as well as Linux and other Unix systems without having to install other tools which may or may not be available.

### Decompressing files

The commands for decompressing files are similar to those used to compress the files. These commands would work for decompressing bigfile after the compression commands shown above were run.

  * tar: **tar xf bigfile.tgz**
  * zip: **unzip bigfile.zip**
  * gzip: **gunzip bigfile.gz**
  * bzip2: **bunzip2 bigfile.gz2**
  * xz: **xz -d bigfile.xz** or **unxz bigfile.xz**



### Running your own compression comparisons

If you'd like to run some tests on your own, grab a large but replaceable file and compress it using each of the commands shown above – preferably using a new subdirectory. You might have to first install **xz** if you want to include it in the tests.This script can make the comparison easier, but will likely take a few minutes to complete.

```
#!/bin/bash

# ask user for filename
echo -n "filename> "
read filename

# you need this because some commands will replace the original file
cp $filename $filename-2

# clean up first (in case previous results are still available)
rm $filename.*

tar cvfz ./$filename.tgz $filename > /dev/null
zip $filename.zip $filename > /dev/null
bzip2 $filename
# recover original file
cp $filename-2 $filename
gzip $filename
# recover original file
cp $filename-2 $filename
xz $filename

# show results
ls -l $filename.*

# replace the original file
mv $filename-2 $filename
```

Join the Network World communities on [Facebook][2] and [LinkedIn][3] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3538471/how-to-compress-files-on-linux-5-ways.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.networkworld.com/blog/itaas-and-the-corporate-storage-technology/?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE22140&utm_content=sidebar (ITAAS and Corporate Storage Strategy)
[2]: https://www.facebook.com/NetworkWorld/
[3]: https://www.linkedin.com/company/network-world
