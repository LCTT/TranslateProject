[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Working with tarballs on Linux)
[#]: via: (https://www.networkworld.com/article/3328840/linux/working-with-tarballs-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Working with tarballs on Linux
======
![](https://images.idgesg.net/images/article/2018/12/tarball-100783148-large.jpg)

The word “tarball” is often used to describe the type of file used to back up a select group of files and join them into a single file. The name comes from the **.tar** file extension and the **tar** command that is used to group together the files into a single file that is then sometimes compressed to make it smaller for its move to another system.

Tarballs are often used to back up personal or system files in place to create an archive, especially prior to making changes that might have to be reversed. Linux sysadmins, for example, will often create a tarball containing a series of configuration files before making changes to an application just in case they have to reverse those changes. Extracting the files from a tarball that’s sitting in place will generally be faster than having to retrieve the files from backups.

### How to create a tarball on Linux

You can create a tarball and compress it in a single step if you use a command like this one:

```
$ tar -cvzf PDFs.tar.gz *.pdf
```

The result in this case is a compressed (gzipped) file that contains all of the PDF files that are in the current directory. The compression is optional, of course. A slightly simpler command would just put all of the PDF files into an uncompressed tarball:

```
$ tar -cvf PDFs.tar *.pdf
```

Note that it’s the **z** in that list of options that causes the file to be compressed or “zipped”. The **c** specifies that you are creating the file and the **v** (verbose) indicates that you want some feedback while the command is running. Omit the **v** if you don't want to see the files listed.

Another common naming convention is to give zipped tarballs the extension **.tgz** instead of the double extension **.tar.gz** as shown in this command:

```
$ tar cvzf MyPDFs.tgz *.pdf
```

### How to extract files from a tarball

To extract all of the files from a gzipped tarball, you would use a command like this:

```
$ tar -xvzf file.tar.gz
```

If you use the .tgz naming convention, that command would look like this:

```
$ tar -xvzf MyPDFs.tgz
```

To extract an individual file from a gzipped tarball, you do almost the same thing but add the file name:

```
$ tar -xvzf PDFs.tar.gz ShenTix.pdf
ShenTix.pdf
ls -l ShenTix.pdf
-rw-rw-r-- 1 shs shs 122057 Dec 14 14:43 ShenTix.pdf
```

You can even delete files from a tarball if the tarball is not compressed. For example, if we wanted to remove tile file that we extracted above from the PDFs.tar.gz file, we would do it like this:

```
$ gunzip PDFs.tar.gz
$ ls -l PDFs.tar
-rw-rw-r-- 1 shs shs 10700800 Dec 15 11:51 PDFs.tar
$ tar -vf PDFs.tar --delete ShenTix.pdf
$ ls -l PDFs.tar
-rw-rw-r-- 1 shs shs 10577920 Dec 15 11:45 PDFs.tar
```

Notice that we shaved a little space off the tar file while deleting the ShenTix.pdf file. We can then compress the file again if we want:

```
$ gzip -f PDFs.tar
ls -l PDFs.tar.gz
-rw-rw-r-- 1 shs shs 10134499 Dec 15 11:51 PDFs.tar.gzFlickr / James St. John
```

The versatility of the command line options makes working with tarballs easy and very convenient.

Join the Network World communities on [Facebook][1] and [LinkedIn][2] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3328840/linux/working-with-tarballs-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.facebook.com/NetworkWorld/
[2]: https://www.linkedin.com/company/network-world
