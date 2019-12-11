[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Breaking Linux files into pieces with the split command)
[#]: via: (https://www.networkworld.com/article/3489256/breaking-linux-files-into-pieces-with-the-split-command.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

Breaking Linux files into pieces with the split command
======
Some simple Linux commands allow you to break up files and reassemble them as needed in order to accommodate size restrictions on file size for storage or email attachments
[Marco Verch][1] [(CC BY 2.0)][2]

Linux systems provide a very easy-to-use command for breaking files into pieces. This is something that you might need to do prior to uploading your files to some storage site that limits file sizes or emailing them as attachments. To split a file into pieces, you simply use the split command.

```
$ split bigfile
```

By default, the split command uses a very simple naming scheme. The file chunks will be named xaa, xab, xac, etc., and, presumably, if you break up a file that is sufficiently large, you might even get chunks named xza and xzz.

[[Get regularly scheduled insights by signing up for Network World newsletters.]][3]

Unless you ask, the command runs without giving you any feedback. You can, however, use the --verbose option if you would like to see the file chunks as they are being created.

[][4]

BrandPost Sponsored by HPE

[Take the Intelligent Route with Consumption-Based Storage][4]

Combine the agility and economics of HPE storage with HPE GreenLake and run your IT department with efficiency.

```
$ split –-verbose bigfile
creating file 'xaa'
creating file 'xab'
creating file 'xac'
```

You can also contribute to the file naming by providing a prefix. For example, to name all the pieces of your original file bigfile.xaa, bigfile.xab and so on, you would add your prefix to the end of your split command like so:

```
$ split –-verbose bigfile bigfile.
creating file 'bigfile.aa'
creating file 'bigfile.ab'
creating file 'bigfile.ac'
```

Note that a dot is added to the end of the prefix shown in the above command. Otherwise, the files would have names like bigfilexaa rather than bigfile.xaa.

Note that the split command does _not_ remove your original file, just creates the chunks. If you want to specify the size of the file chunks, you can add that to your command using the -b option. For example:

```
$ split -b100M bigfile
```

File sizes can be specified in kilobytes, megabytes, gigabytes … up to yottabytes! Just use the appropriate letter from K, M, G, T, P, E, Z and Y.

If you want your file to be split based on the number of lines in each chunk rather than the number of bytes, you can use the -l (lines) option. In this example, each file will have 1,000 lines except, of course, for the last one which may have fewer lines.

```
$ split --verbose -l1000 logfile log.
creating file 'log.aa'
creating file 'log.ab'
creating file 'log.ac'
creating file 'log.ad'
creating file 'log.ae'
creating file 'log.af'
creating file 'log.ag'
creating file 'log.ah'
creating file 'log.ai'
creating file 'log.aj'
```

If you need to reassemble your file from pieces on a remote site, you can do that fairly easily using a cat command like one of these:

```
$ cat x?? > original.file
$ cat log.?? > original.file
```

Splitting and reassembling with the commands shown above should work for binary files as well as text files. In this example, we’ve split the zip binary into 50 kilobyte chunks, used cat to reassemble them and then compared the assembled and original files. The diff command verifies that the files are the same.

```
$ split --verbose -b50K zip zip.
creating file 'zip.aa'
creating file 'zip.ab'
creating file 'zip.ac'
creating file 'zip.ad'
creating file 'zip.ae'
$ cat zip.a? > zip.new
$ diff zip zip.new
$                    <== no output = no difference
```

The only caution I have to give at this point is that, if you use split often and use the default naming, you will likely end up overwriting some chunks with others and maybe sometimes having more chunks than you were expecting because some were left over from some earlier split.

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3489256/breaking-linux-files-into-pieces-with-the-split-command.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://www.flickr.com/photos/30478819@N08/34879296673/in/photolist-V9avJ2-LysA9-qVeu6t-dV4dkC-RWNeA5-LFKPG-aLpKTg-aLpJoK-4rN35a-97zDK4-7fevx8-mBSVT-64r2D4-8TbXFw-4g2Wgv-4pAdnq-4g6Ycf-9pt9t9-ceyN2u-LYckrJ-23sDdLH-dAQgiK-25eyt6N-UuAEk9-koNDTn-dAVK2j-ea8feG-bWpNKQ-bzJNPM-dAQ22K-dnkd1e-8qkaFp-dnCtBr-dnknKi-TKXaei-dnkjzV-RxvhHd-pQXTfa-c3crQf-dnkwXG-dnfW2K-2SKdMh-efHTUr-5mMzpp-XdMr5c-88H1s3-d67Gth-aMuG6v-Uio4v1-KZt3M
[2]: https://creativecommons.org/licenses/by/2.0/legalcode
[3]: https://www.networkworld.com/newsletters/signup.html
[4]: https://www.networkworld.com/article/3440100/take-the-intelligent-route-with-consumption-based-storage.html?utm_source=IDG&utm_medium=promotions&utm_campaign=HPE20773&utm_content=sidebar ( Take the Intelligent Route with Consumption-Based Storage)
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
