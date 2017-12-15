How to squeeze the most out of Linux file compression
======
If you have any doubt about the many commands and options available on Linux systems for file compression, you might want to take a look at the output of the **apropos compress** command. Chances are you'll be surprised by the many commands that you can use for compressing and decompressing files, as well as for comparing compressed files, examining and searching through the content of compressed files, and even changing a compressed file from one format to another (i.e., .z format to .gz format).

You're likely to see all of these entries just for the suite of bzip2 compression commands. Add in zip, gzip, and xz, and you've got a lot of interesting options.
```
$ apropos compress | grep ^bz
bzcat (1) - decompresses files to stdout
bzcmp (1) - compare bzip2 compressed files
bzdiff (1) - compare bzip2 compressed files
bzegrep (1) - search possibly bzip2 compressed
 files for a regular expression
bzexe (1) - compress executable files in place
bzfgrep (1) - search possibly bzip2 compressed
 files for a regular expression
bzgrep (1) - search possibly bzip2 compressed
 files for a regular expression
bzip2 (1) - a block-sorting file compressor,
 v1.0.6
bzless (1) - file perusal filter for crt viewing
 of bzip2 compressed text
bzmore (1) - file perusal filter for crt viewing
 of bzip2 compressed text

```

On my Ubuntu system, over 60 commands were listed in response to the apropos compress command.

### Compression algorithms

Compression is not a one-size-fits-all issue. Some compression tools are "lossy," such as those used to reduce the size of mp3 files while allowing listeners to have what is nearly the same musical experience as listening to the originals. But algorithms used on the Linux command line to compress or archive user files have to be able to reproduce the original content exactly. In other words, they have to be lossless.

How is that done? It's easy to imagine how 300 of the same character in a row could be compressed to something like "300X," but this type of algorithm wouldn't be of much benefit for most files because they wouldn't contain long sequences of the same character any more than they would completely random data. Compression algorithms are far more complex and have only been getting more so since compression was first introduced in the toddler years of Unix.

### Compression commands on Linux systems

The commands most commonly used for file compression on Linux systems include zip, gzip, bzip2 and xz. All of those commands work in similar ways, but there are some tradeoffs in terms of how much the file content is squeezed (how much space you save), how long the compression takes, and how compatible the compressed files are with other systems you might need to use them on.

Sometimes the time and effort of compressing a file doesn't pay off very well. In the example below, the "compressed" file is actually larger than the original. While this isn't generally the case, it can happen -- especially when the file content approaches some degree of randomness.
```
$ time zip bigfile.zip bigfile
 adding: bigfile (deflated 0%)

real 1m6.310s
user 0m52.424s
sys 0m2.288s
$
$ ls -l bigfile*
-rw-rw-r-- 1 shs shs 1073741824 Dec 8 10:06 bigfile
-rw-rw-r-- 1 shs shs 1073916184 Dec 8 11:39 bigfile.zip

```

Note that the compressed version of the file (bigfile.zip) is actually a little larger than the original file. If compression increases the size of a file or reduces its size by some very small percentage, the only benefit may be that you may have a convenient online backup. If you see a message like this after compressing a file, you're not gaining much.
```
(deflated 1%)

```

The content of a file plays a large role in how well it will compress. The file that grew in size in the example above was fairly random. Compress a file containing only zeroes, and you'll see an amazing compression ratio. In this admittedly extremely unlikely scenario, all three of the commonly used compression tools do an excellent job.
```
-rw-rw-r-- 1 shs shs 10485760 Dec 8 12:31 zeroes.txt
-rw-rw-r-- 1 shs shs 49 Dec 8 17:28 zeroes.txt.bz2
-rw-rw-r-- 1 shs shs 10219 Dec 8 17:28 zeroes.txt.gz
-rw-rw-r-- 1 shs shs 1660 Dec 8 12:31 zeroes.txt.xz
-rw-rw-r-- 1 shs shs 10360 Dec 8 12:24 zeroes.zip

```

While impressive, you're not likely to see files with over 10 million bytes compressing down to fewer than 50, since files like these are extremely unlikely.

In this more realistic example, the size differences are altogether different -- and not very significant -- for a fairly small jpg file.
```
-rw-r--r-- 1 shs shs 13522 Dec 11 18:58 image.jpg
-rw-r--r-- 1 shs shs 13875 Dec 11 18:58 image.jpg.bz2
-rw-r--r-- 1 shs shs 13441 Dec 11 18:58 image.jpg.gz
-rw-r--r-- 1 shs shs 13508 Dec 11 18:58 image.jpg.xz
-rw-r--r-- 1 shs shs 13581 Dec 11 18:58 image.jpg.zip

```

Do the same thing with a large text file, and you're likely to see some significant differences.
```
$ ls -l textfile*
-rw-rw-r-- 1 shs shs 8740836 Dec 11 18:41 textfile
-rw-rw-r-- 1 shs shs 1519807 Dec 11 18:41 textfile.bz2
-rw-rw-r-- 1 shs shs 1977669 Dec 11 18:41 textfile.gz
-rw-rw-r-- 1 shs shs 1024700 Dec 11 18:41 textfile.xz
-rw-rw-r-- 1 shs shs 1977808 Dec 11 18:41 textfile.zip

```

In this case, xz reduced the size considerably more than the other commands with bzip2 coming in second.

### Looking at compressed files

The *more commands (bzmore and others) allow you to view the contents of compressed files without having to uncompress them first.
```
bzmore (1) - file perusal filter for crt viewing of bzip2 compressed text
lzmore (1) - view xz or lzma compressed (text) files
xzmore (1) - view xz or lzma compressed (text) files
zmore (1) - file perusal filter for crt viewing of compressed text

```

These commands are all doing a good amount of work, since they have to decompress a file's content just to display it to you. They do not, on the other hand, leave uncompressed file content on the system. They simply decompress on the fly.
```
$ xzmore textfile.xz | head -1
Here is the agenda for tomorrow's staff meeting:

```

### Comparing compressed files

While several of the compression toolsets include a diff command (e.g., xzdiff), these tools pass the work off to cmp and diff and are not doing any algorithm-specific comparisons. For example, the xzdiff command will compare bz2 files as easily as it will compare xz files.

### How to choose the best Linux compression tool

The best tool for the job depends on the job. In some cases, the choice may depend on the content of the data being compressed, but it's more likely that your organization's conventions are just as important unless you're in a real pinch for disk space. The best general suggestions seem to be these:

 **zip** is best when files need to be shared with or used on Windows systems.

 **gzip** may be best when you want the files to be usable on any Unix/Linux system. Though bzip2 is becoming nearly as ubiquitous, it is likely to take longer to run.

 **bzip2** uses a different algorithm than gzip and is likely to yield a smaller file, but they take a little longer to get the job done.

 **xz** generally offers the best compression rates, but also takes considerably longer to run. It's also newer than the other tools and may not yet exist on all the systems you need to work with.

### Wrap-up

There are a number of choices when it comes to how to compress files and only a few situations in which they don't yield valuable disk space savings.


--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3240938/linux/how-to-squeeze-the-most-out-of-linux-file-compression.html

作者：[Sandra Henry-Stocker][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.networkworld.com
