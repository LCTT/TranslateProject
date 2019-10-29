[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11230-1.html)
[#]: subject: (How to manipulate PDFs on Linux)
[#]: via: (https://www.networkworld.com/article/3430781/how-to-manipulate-pdfs-on-linux.html)
[#]: author: (Sandra Henry-Stocker https://www.networkworld.com/author/Sandra-Henry_Stocker/)

如何在 Linux 命令行操作 PDF
======

> pdftk 命令提供了许多处理 PDF 的命令行操作，包括合并页面、加密文件、添加水印、压缩文件，甚至还有修复 PDF。

![](https://img.linux.net.cn/data/attachment/album/201908/15/110119x6sjnjs6s22srnje.jpg)

虽然 PDF 通常被认为是相当稳定的文件，但在 Linux 和其他系统上你可以做很多处理。包括合并、拆分、旋转、拆分成单页、加密和解密、添加水印、压缩和解压缩，甚至还有修复。 `pdftk` 命令能执行所有甚至更多操作。

“pdftk” 代表 “PDF 工具包”（PDF tool kit），这个命令非常易于使用，并且可以很好地操作 PDF。例如，要将独立的文件合并成一个文件，你可以使用以下命令：

```
$ pdftk pg1.pdf pg2.pdf pg3.pdf pg4.pdf pg5.pdf cat output OneDoc.pdf
```

`OneDoc.pdf` 将包含上面显示的所有五个文档，命令将在几秒钟内运行完毕。请注意，`cat` 选项表示将文件连接在一起，`output` 选项指定新文件的名称。

你还可以从 PDF 中提取选定页面来创建单独的 PDF 文件。例如，如果要创建仅包含上面创建的文档的第 1、2、3 和 5 页的新 PDF，那么可以执行以下操作：

```
$ pdftk OneDoc.pdf cat 1-3 5 output 4pgs.pdf
```

另外，如果你想要第 1、3、4 和 5 页（总计 5 页），我们可以使用以下命令：

```
$ pdftk OneDoc.pdf cat 1 3-end output 4pgs.pdf
```

你可以选择单独页面或者页面范围，如上例所示。

下一个命令将从一个包含奇数页（1、3 等）的文件和一个包含偶数页（2、4 等）的文件创建一个整合文档：

```
$ pdftk A=odd.pdf B=even.pdf shuffle A B output collated.pdf
```

请注意，`shuffle` 选项使得能够完成整合，并指示文档的使用顺序。另请注意：虽然上面建议用的是奇数/偶数页，但你不限于仅使用两个文件。

如果要创建只能由知道密码的收件人打开的加密 PDF，可以使用如下命令：

```
$ pdftk prep.pdf output report.pdf user_pw AsK4n0thingGeTn0thing
```

选项提供 40（`encrypt_40bit`）和 128（`encrypt_128bit`）位加密。默认情况下使用 128 位加密。

你还可以使用 `burst` 选项将 PDF 文件分成单个页面：

```
$ pdftk allpgs.pdf burst
$ ls -ltr *.pdf | tail -5
-rw-rw-r-- 1 shs shs   22933 Aug  8 08:18 pg_0001.pdf
-rw-rw-r-- 1 shs shs   23773 Aug  8 08:18 pg_0002.pdf
-rw-rw-r-- 1 shs shs   23260 Aug  8 08:18 pg_0003.pdf
-rw-rw-r-- 1 shs shs   23435 Aug  8 08:18 pg_0004.pdf
-rw-rw-r-- 1 shs shs   23136 Aug  8 08:18 pg_0005.pdf
```

`pdftk` 命令使得合并、拆分、重建、加密 PDF 文件非常容易。要了解更多选项，请查看 [PDF 实验室][3]中的示例页面。

--------------------------------------------------------------------------------

via: https://www.networkworld.com/article/3430781/how-to-manipulate-pdfs-on-linux.html

作者：[Sandra Henry-Stocker][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.networkworld.com/author/Sandra-Henry_Stocker/
[b]: https://github.com/lujun9972
[1]: https://images.idgesg.net/images/article/2019/08/book-pages-100807709-large.jpg
[3]: https://www.pdflabs.com/docs/pdftk-cli-examples/
[5]: https://www.facebook.com/NetworkWorld/
[6]: https://www.linkedin.com/company/network-world
