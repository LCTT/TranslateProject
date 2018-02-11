Translating by erialin


Linux Gunzip Command Explained with Examples
======

We have [already discussed][1] the **gzip** command in Linux. For starters, the tool is used to compress or expand files. To uncompress, the command offers a command line option **-d** , which can be used in the following way:

gzip -d [compressed-file-name]

However, there's an entirely different tool that you can use for uncompressing or expanding archives created by gzip. The tool in question is **gunzip**. In this article, we will discuss the gunzip command using some easy to understand examples. Please note that all examples/instructions mentioned in the tutorial have been tested on Ubuntu 16.04.

### Linux gunzip command

So now we know that compressed files can be restored using either 'gzip -d' or the gunzip command. The basic syntax of gunzip is:

gunzip [compressed-file-name]

The following Q&A-style examples should give you a better idea of how the tool works:

### Q1. How to uncompress archives using gunzip?

This is very simple - just pass the name of the archive file as argument to gunzip.

gunzip [archive-name]

For example:

gunzip file1.gz

[![How to uncompress archives using gunzip][2]][3]

### Q2. How to make gunzip not delete archive file?

As you'd have noticed, the gunzip command deletes the archive file after uncompressing it. However, if you want the archive to stay, you can do that using the **-c** command line option.

gunzip -c [archive-name] > [outputfile-name]

For example:

gunzip -c file1.gz > file1

[![How to make gunzip not delete archive file][4]][5]

So you can see that the archive file wasn't deleted in this case.

### Q3. How to make gunzip put the uncompressed file in some other directory?

We've already discussed the **-c** option in the previous Q &A. To make gunzip put the uncompressed file in a directory other than the present working directory, just provide the absolute path after the redirection operator.

gunzip -c [compressed-file] > [/complete/path/to/dest/dir/filename]

Here's an example:

gunzip -c file1.gz > /home/himanshu/file1

### More info

The following details - taken from the common manpage of gzip/gunzip - should be beneficial for those who want to know more about the command:
```
 gunzip takes a list of files on its command line and replaces each file
       whose  name ends with .gz, -gz, .z, -z, or _z (ignoring case) and which
       begins with the correct magic number with an uncompressed file  without
       the  original extension.  gunzip also recognizes the special extensions
       .tgz and .taz as shorthands for .tar.gz and .tar.Z respectively.   When
       compressing, gzip uses the .tgz extension if necessary instead of trun
       cating a file with a .tar extension.

       gunzip can currently decompress files created by gzip,  zip,  compress,
       compress  -H  or pack.  The detection of the input format is automatic.
       When using the first two formats, gunzip checks a 32 bit CRC. For  pack
       and gunzip checks the uncompressed length. The standard compress format
       was not designed to allow consistency checks. However gunzip  is  some
       times  able  to  detect  a bad .Z file. If you get an error when uncom
       pressing a .Z file, do not assume that the .Z file  is  correct  simply
       because the standard uncompress does not complain. This generally means
       that the standard uncompress does not check its input, and happily gen
       erates  garbage  output.   The  SCO compress -H format (lzh compression
       method) does not include a CRC but also allows some consistency checks.
```

### Conclusion

As far as basic usage is concerned, there isn't much of a learning curve associated with Gunzip. We've covered pretty much everything that a beginner needs to learn about this command in order to start using it. For more information, head to its [man page][6].


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/linux-gunzip-command/

作者：[Himanshu Arora][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.howtoforge.com
[1]:https://www.howtoforge.com/linux-gzip-command/
[2]:https://www.howtoforge.com/images/linux_gunzip_command/gunzip-basic-usage.png
[3]:https://www.howtoforge.com/images/linux_gunzip_command/big/gunzip-basic-usage.png
[4]:https://www.howtoforge.com/images/linux_gunzip_command/gunzip-c.png
[5]:https://www.howtoforge.com/images/linux_gunzip_command/big/gunzip-c.png
[6]:https://linux.die.net/man/1/gzip
