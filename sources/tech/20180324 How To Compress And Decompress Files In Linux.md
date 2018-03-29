How To Compress And Decompress Files In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/03/compress-720x340.jpg)
Compressing is quite useful when backing up important files and also sending large files over Internet. Please note that compressing an already compressed file adds extra overhead, hence you will get a slightly bigger file. So, stop compressing a compressed file. There are many programs to compress and decompress files in GNU/Linux. In this tutorial, we’re going to learn about two applications only.

### Compress and decompress files

The most common programs used to compress files in Unix-like systems are:

  1. gzip
  2. bzip2



##### 1\. Compress and decompress files using Gzip program

The gzip is an utility to compress and decompress files using Lempel-Ziv coding (LZ77) algorithm.

**1.1 Compress files**

To compress a file named **ostechnix.txt** , replacing it with a gzipped compressed version, run:
```
$ gzip ostechnix.txt

```

Gzip will replace the original file **ostechnix.txt** with a gzipped compressed version named **ostechnix.txt.gz**.

The gzip command can also be used in other ways too. One fine example is we can create a compressed version of a specific command’s output. Look at the following command.
```
$ ls -l Downloads/ | gzip > ostechnix.txt.gz

```

The above command creates compressed version of the directory listing of Downloads folder.

**1.2 Compress files and write the output to different files (Don’t replace the original file)
**

By default, gzip program will compress the given file, replacing it with a gzipped compressed version. You can, however, keep the original file and write the output to standard output. For example, the following command, compresses **ostechnix.txt** and writes the output to **output.txt.gz**.
```
$ gzip -c ostechnix.txt > output.txt.gz

```

Similarly, to decompress a gzipped file specifying the output filename:
```
$ gzip -c -d output.txt.gz > ostechnix1.txt

```

The above command decompresses the **output.txt.gz** file and writes the output to **ostechnix1.txt** file. In both cases, it won’t delete the original file.

**1.3 Decompress files**

To decompress the file **ostechnix.txt.gz** , replacing it with the original uncompressed version, we do:
```
$ gzip -d ostechnix.txt.gz

```

We can also use gunzip to decompress the files.
```
$ gunzip ostechnix.txt.gz

```

**1.4 View contents of compressed files without decompressing them**

To view the contents of the compressed file using gzip without decompressing it, use **-c** flag as shown below:
```
$ gunzip -c ostechnix1.txt.gz

```

Alternatively, use **zcat** utility like below.
```
$ zcat ostechnix.txt.gz

```

You can also pipe the output to “less” command to view the output page by page like below.
```
$ gunzip -c ostechnix1.txt.gz | less

$ zcat ostechnix.txt.gz | less

```

Alternatively, there is a **zless** program which performs the same function as the pipeline above.
```
$ zless ostechnix1.txt.gz

```

**1.5 Compress file with gzip by specifying compression level**

Another notable advantage of gzip is it supports compression level. It supports 3 compression levels as given below.

  * **1** – Fastest (Worst)
  * **9** – Slowest (Best)
  * **6** – Default level



To compress a file named **ostechnix.txt** , replacing it with a gzipped compressed version with **best** compression level, we use:
```
$ gzip -9 ostechnix.txt

```

**1.6 Concatenate multiple compressed files**

It is also possible to concatenate multiple compressed files into one. How? Have a look at the following example.
```
$ gzip -c ostechnix1.txt > output.txt.gz

$ gzip -c ostechnix2.txt >> output.txt.gz

```

The above two commands will compress ostechnix1.txt and ostechnix2.txt and saves them in one file named **output.txt.gz**.

You can view the contents of both files (ostechnix1.txt and ostechnix2.txt) without extracting them using any one of the following commands:
```
$ gunzip -c output.txt.gz

$ gunzip -c output.txt

$ zcat output.txt.gz

$ zcat output.txt

```

For more details, refer the man pages.
```
$ man gzip

```

##### 2\. Compress and decompress files using bzip2 program

The **bzip2** is very similar to gzip program, but uses different compression algorithm named the Burrows-Wheeler block sorting text compression algorithm, and Huffman coding. The files compressed using bzip2 will end with **.bz2** extension.

Like I said, the usage of bzip2 is almost same as gzip. Just replace **gzip** in the above examples with **bzip2** , **gunzip** with **bunzip2** , **zcat** with **bzcat** and so on.

To compress a file using bzip2, replacing it with compressed version, run:
```
$ bzip2 ostechnix.txt

```

If you don’t want to replace the original file, use **-c** flag and write the output to a new file.
```
$ bzip2 -c ostechnix.txt > output.txt.bz2

```

To decompress a compressed file:
```
$ bzip2 -d ostechnix.txt.bz2

```

Or,
```
$ bunzip2 ostechnix.txt.bz2

```

To view the contents of a compressed file without decompressing it:
```
$ bunzip2 -c ostechnix.txt.bz2

```

Or,
```
$ bzcat ostechnix.txt.bz2

```

For more details, refer man pages.
```
$ man bzip2

```

##### Summary

In this tutorial, we learned what is gzip and bzip2 programs and how to use them to compress and decompress files with some examples in GNU/Linux. In this next, guide we are going to learn how to archive files and directories in Linux.

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-compress-and-decompress-files-in-linux/

作者：[SK][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)
选题：[lujun9972](https://github.com/lujun9972)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
