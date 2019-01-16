[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Move Multiple File Types Simultaneously From Commandline)
[#]: via: (https://www.ostechnix.com/how-to-move-multiple-file-types-simultaneously-from-commandline/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Move Multiple File Types Simultaneously From Commandline
======

![](https://www.ostechnix.com/wp-content/uploads/2019/01/Move-Multiple-File-Types-720x340.png)

The other day I was wondering how can I move (not copy) multiple file types from directory to another. I already knew how to [**find and copy certain type of files from one directory to another**][1]. But, I don’t know how to move multiple file types simultaneously. If you’re ever in a situation like this, I know a easy way to do it from commandline in Unix-like systems.

### Move Multiple File Types Simultaneously

Picture this scenario.You have multiple type of files, for example .pdf, .doc, .mp3, .mp4, .txt etc., on a directory named **‘dir1’**. Let us take a look at the dir1 contents:

```
$ ls dir1
file.txt image.jpg mydoc.doc personal.pdf song.mp3 video.mp4
```

You want to move some of the file types (not all of them) to different location. For example, let us say you want to move doc, pdf and txt files only to another directory named **‘dir2’** in one go.

To copy .doc, .pdf and .txt files from dir1 to dir2 simultaneously, the command would be:

```
$ mv dir1/*.{doc,pdf,txt} dir2/
```

It’s easy, isn’t it?

Now, let us check the contents of dir2:

```
$ ls dir2/
file.txt mydoc.doc personal.pdf
```

See? Only the file types .doc, .pdf and .txt from dir1 have been moved to dir2.

![][3]

You can add as many file types as you want to inside curly braces in the above command to move them across different directories. The above command just works fine for me on Bash.

Another way to move multiple file types is go to the source directory i.e dir1 in our case:

```
$ cd ~/dir1
```

And, move file types of your choice to the destination (E.g dir2) as shown below.

```
$ mv *.doc *.txt *.pdf /home/sk/dir2/
```

To move all files having a particular extension, for example **.doc** only, run:

```
$ mv dir1/*.doc dir2/
```

For more details, refer man pages.

```
$ man mv
```

Moving a few number of same or different file types is easy! You could do this with couple mouse clicks in GUI mode or use a one-liner command in CLI mode. However, If you have thousands of different file types in a directory and wanted to move multiple file types to different directory in one go, it would be a cumbersome task. To me, the above method did the job easily! If you know any other one-liner commands to move multiple file types at a time, please share it in the comment section below. I will check and update the guide accordingly.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-move-multiple-file-types-simultaneously-from-commandline/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/find-copy-certain-type-files-one-directory-another-linux/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2019/01/mv-command.gif
