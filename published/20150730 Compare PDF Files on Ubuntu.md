如何在 Ubuntu 上比较 PDF 文件
================================================================================

如果你想要对PDF文件进行比较，你可以使用下面工具之一。

### Comparepdf ###

comparepdf是一个命令行应用，用于将两个PDF文件进行对比。默认对比模式是文本模式，该模式会对各对相关页面进行文字对比。只要一检测到差异，该程序就会终止，并显示一条信息（除非设置了-v0）和一个指示性的返回码。

用于文本模式对比的选项有 -ct 或 --compare=text（默认），用于视觉对比（这对图标或其它图像发生改变时很有用）的选项有 -ca 或 --compare=appearance。而 -v=1 或 --verbose=1 选项则用于报告差异（或者对匹配文件不作任何回应）；使用 -v=0 选项取消报告，或者 -v=2 来同时报告不同的和匹配的文件。

#### 安装comparepdf到Ubuntu ####

打开终端，然后运行以下命令

    sudo apt-get install comparepdf

**Comparepdf 语法**

    comparepdf [OPTIONS] file1.pdf file2.pdf

###Diffpdf###

DiffPDF是一个图形化应用程序，用于对两个PDF文件进行对比。默认情况下，它只会对比两个相关页面的文字，但是也支持对图形化页面进行对比（例如，如果图表被修改过，或者段落被重新格式化过）。它也可以对特定的页面或者页面范围进行对比。例如，如果同一个PDF文件有两个版本，其中一个有页面1-12，而另一个则有页面1-13，因为这里添加了一个额外的页面4，它们可以通过指定两个页面范围来进行对比，第一个是1-12，而1-3,5-13则可以作为第二个页面范围。这将使得DiffPDF成对地对比这些页面（1,1），（2,2），（3,3），（4,5），（5,6），以此类推，直到（12,13）。

#### 安装 diffpdf 到 ubuntu ####

打开终端，然后运行以下命令

    sudo apt-get install diffpdf

#### 截图 ####

![](http://www.ubuntugeek.com/wp-content/uploads/2015/07/14.png)

![](http://www.ubuntugeek.com/wp-content/uploads/2015/07/23.png)

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/compare-pdf-files-on-ubuntu.html

作者：[ruchi][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
