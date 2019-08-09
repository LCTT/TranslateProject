[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to manipulate PDFs on Linux)
[#]: via: (https://www.networkworld.com/article/3430781/how-to-manipulate-pdfs-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

How to manipulate PDFs on Linux
======
The pdftk command provides many options for working with PDFs, including merging pages, encrypting files, applying watermarks, compressing files, and even repairing PDFs -- easily and on the command line.
![Toshiyuki IMAI \(CC BY-SA 2.0\)][1]

While PDFs are generally regarded as fairly stable files, there’s a lot you can do with them on both Linux and other systems. This includes merging, splitting, rotating, breaking into single pages, encrypting and decrypting, applying watermarks, compressing and uncompressing, and even repairing. The **pdftk** command does all this and more.

The name “pdftk” stands for “PDF tool kit,” and the command is surprisingly easy to use and does a good job of manipulating PDFs. For example, to pull separate files into a single PDF file, you would use a command like this:

```
$ pdftk pg1.pdf pg2.pdf pg3.pdf pg4.pdf pg5.pdf cat output OneDoc.pdf
```

That OneDoc.pdf file will contain all five of the documents shown and the command will run in a matter of seconds. Note that the **cat** option directs the files to be joined together and the **output** option specifies the name of the new file.

**[ Two-Minute Linux Tips: [Learn how to master a host of Linux commands in these 2-minute video tutorials][2] ]**

You can also pull select pages from a PDF to create a separate PDF file. For example, if you wanted to create a new PDF with only pages 1, 2, 3, and 5 of the document created above, you could do this:

```
$ pdftk OneDoc.pdf cat 1-3 5 output 4pgs.pdf
```

If, on the other hand, you wanted pages 1, 3, 4, and 5, we might use this syntax instead:

```
$ pdftk OneDoc.pdf cat 1 3-end output 4pgs.pdf
```

You have the option of specifying all individual pages or using page ranges as shown in the examples above.

This next command will create a collated document from one that contains the odd pages (1, 3, etc.) and one that contains the even pages (2, 4, etc.):

```
$ pdftk A=odd.pdf B=even.pdf shuffle A B output collated.pdf
```

Notice that the **shuffle** option make this collation possible and dictates the order in which the documents are used. Note also: While the odd/even pages example might suggest otherwise, you are not restricted to using only two input files.

If you want to create an encrypted PDF that can only be opened by a recipient who knows the password, you could use a command like this one:

```
$ pdftk prep.pdf output report.pdf user_pw AsK4n0thingGeTn0thing
```

The options provide for 40 (**encrypt_40bit**) and 128 (**encrypt_128bit**) bit encryption. The 128 bit encryption is used by default.

You can also break a PDF file into individual pages using the **burst** option:

```
$ pdftk allpgs.pdf burst
$ ls -ltr *.pdf | tail -5
-rw-rw-r-- 1 shs shs   22933 Aug  8 08:18 pg_0001.pdf
-rw-rw-r-- 1 shs shs   23773 Aug  8 08:18 pg_0002.pdf
-rw-rw-r-- 1 shs shs   23260 Aug  8 08:18 pg_0003.pdf
-rw-rw-r-- 1 shs shs   23435 Aug  8 08:18 pg_0004.pdf
-rw-rw-r-- 1 shs shs   23136 Aug  8 08:18 pg_0005.pdf
```

The **pdftk** command makes pulling together, tearing apart, rebuilding and encrypting PDF files surprisingly easy. To learn more about its many options, I check out the examples page from [PDF Labs][3].

**[ Also see: [Invaluable tips and tricks for troubleshooting Linux][4] ]**

Join the Network World communities on [Facebook][5] and [LinkedIn][6] to comment on topics that are top of mind.

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3430781/how-to-manipulate-pdfs-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/book-pages-100807709-large.jpg
[2]: https://www.youtube.com/playlist?list=PL7D2RMSmRO9J8OTpjFECi8DJiTQdd4hua
[3]: https://www.pdflabs.com/docs/pdftk-cli-examples/
[4]: https://www.networkworld.com/article/3242170/linux/invaluable-tips-and-tricks-for-troubleshooting-linux.html
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
