translating--geekpi

How to Compress and Decompress a .bz2 File in Linux
============================================================

To compress a file(s), is to significantly decrease the size of the file(s) by encoding data in the file(s) using less bits, and it is normally a useful practice [during backup and transfer of a file(s)][1] over a network. On the other hand, decompressing a file(s) means restoring data in the file(s) to its original state.

There are several [file compression and decompression tools][2] available in Linux such as gzip, 7-zip, Lrzip, [PeaZip][3] and many more.

In this tutorial, we will look at how to compress and decompress `.bz2` files using the bzip2 tool in Linux.

Bzip2 is a well known compression tool and it’s available on most if not all the major Linux distributions, you can use the appropriate command for your distribution to install it.

```
$ sudo apt install bzip2     [On Debian/Ubuntu] 
$ sudo yum install  bzip2    [On CentOS/RHEL]
$ sudo dnf install bzip2     [On Fedora 22+]
```

The conventional syntax of using bzip2 is:

```
$ bzip2 option(s) filenames 
```

### How to Use “bzip2” to Compress Files in Linux

You can compress a file as below, where the flag `-z` enables file compression:

```
$ bzip2 filename
OR
$ bzip2 -z filename
```

To compress a `.tar` file, use the command format:

```
$ bzip2 -z backup.tar
```

Important: By default, bzip2 deletes the input files during compression or decompression, to keep the input files, use the `-k` or `--keep` option.

In addition, the `-f` or `--force` flag will force bzip2 to overwrite an existing output file.

```
------ To keep input file  ------
$ bzip2 -zk filename
$ bzip2 -zk backup.tar
```

You can as well set the block size to 100k upto 900k, using `-1` or `--fast` to `-9` or –best as shown in the below examples:

```
$ bzip2 -k1  Etcher-linux-x64.AppImage
$ ls -lh  Etcher-linux-x64.AppImage.bz2 
$ bzip2 -k9  Etcher-linux-x64.AppImage 
$ bzip2 -kf9  Etcher-linux-x64.AppImage 
$ ls -lh Etcher-linux-x64.AppImage.bz2 
```

The screenshot below shows how to use options to keep the input file, force bzip2 to overwrite an output file and set the block size during compression.

[
 ![Compress Files Using bzip2 in Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Compress-Files-Using-bzip2-in-Linux.png) 
][4]

Compress Files Using bzip2 in Linux

### How to Use “bzip2” to Decompress Files in Linux

To decompress a `.bz2` file, make use of the `-d` or `--decompress` option like so:

```
$ bzip2 -d filename.bz2
```

Note: The file must end with a `.bz2` extension for the command above to work.

```
$ bzip2 -vd Etcher-linux-x64.AppImage.bz2 
$ bzip2 -vfd Etcher-linux-x64.AppImage.bz2 
$ ls -l Etcher-linux-x64.AppImage 
```
[
 ![Decompress bzip2 File in Linux](http://www.tecmint.com/wp-content/uploads/2016/11/Decompression-bzip2-File-in-Linux.png) 
][5]

Decompress bzip2 File in Linux

To view the bzip2 help page and man page, type the command below:

```
$ bzip2  -h
$ man bzip2
```

Lastly, with the simple elaborations above, I believe you are now capable of compressing and decompressing `.bz2` files using the bzip2 tool in Linux. However, for any questions or feedback, reach us using the comment section below.

Importantly, you may want to go over a few important [Tar command examples][6] in Linux so as to learn using the tar utility to [create compressed archive files][7].

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-compress-decompress-bz2-files-using-bzip2

作者：[Aaron Kili][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/aaronkili/
[1]:http://www.tecmint.com/rsync-local-remote-file-synchronization-commands/
[2]:http://www.tecmint.com/command-line-archive-tools-for-linux/
[3]:http://www.tecmint.com/peazip-linux-file-manager-and-file-archive-tool/
[4]:http://www.tecmint.com/wp-content/uploads/2016/11/Compress-Files-Using-bzip2-in-Linux.png
[5]:http://www.tecmint.com/wp-content/uploads/2016/11/Decompression-bzip2-File-in-Linux.png
[6]:http://www.tecmint.com/18-tar-command-examples-in-linux/
[7]:http://www.tecmint.com/compress-files-and-finding-files-in-linux/


