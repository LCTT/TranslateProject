Linux有问必答：如何检查PDF中使用了哪种字体
================================================================================

>**问题**：我想要知道PDF文件中使用了什么字体，或者嵌入了什么字体。Linux中有工具可以检查PDF文档中使用了哪种字体吗？

要检查PDF文件中包含了，或者使用了什么字体，你可以使用命令行工具：pdffonts，它是一个PDF字体分析工具。pdffonts是Poppler PDF工具集包中的一个部分。

### 安装PDF工具集到Linux ###

要安装Poppler到Debian，Ubuntu或Linux Mint：

    $ sudo apt-get install poppler-utils

要安装PDF工具集到Fedora，CentOS或RHEL：

    $ sudo yum install poppler-utils

### 检查PDF字体 ###

**pdffonts**可以列出PDF文档中使用的所有字体。pdffonts的基本用法如下。

    $ pdffonts doc.pdf

![](https://farm6.staticflickr.com/5592/14527744387_f8bb671955_z.jpg)

**pdffonts**工具显示了各个已使用的字体的各种信息，如字体名称/类型，或者字体是否内嵌等等。

如果一个PDF文档有多页，你可以使用“-f”（首页）和“-l”（末页）选项来限制字体扫描页面范围。例如，如果你想要找出某个文档中的5-10页中使用了哪种字体，运行该命令：

    $ pdffonts -f 5 -l 10 doc.pdf 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-which-fonts-are-used-pdf-document.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
