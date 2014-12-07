Linux 有问必答：在Linux上如何将文本文件转换成PDF格式
================================================================================
> **提问**： 我想要将一个纯文本文件转换成PDF文档。在Linux命令行下是否有一个简单的方法将文本文件转换成PDF文件？

当你有一大堆文本文件要维护的时候，把它们转换成PDF文档会好一些。比如，PDF更适合打印，因为PDF文档有预定义布局。除此之外，还可以减少文档被意外修改的风险。

要将文本文件转换成PDF格式，你要按照下面的两步。

### 准备工作 ###

首先你要安装两个需要的包。

在 Debian、Ubuntu 或者 Linux Mint上：

    $ sudo apt-get install enscript ghostscript 

在 Fedora、CentOS/RHEL上：

    $ sudo yum install enscript ghostscript 

在 Arch Linux上：

    $ sudo pacman -S enscript ghostscript 

### 将文本文件转换成PDF格式 ###

准备工作完成之后，按照下面的两步从文本文件生成一个PDF文件

首先，使用enscript命令行工具将文本文件转换成postscript格式。

    $ enscript -p output.ps input.txt 

最后将postscript格式文件转换成PDF文件。

    $ ps2pdf output.ps output.pdf 

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/convert-text-to-pdf-linux.html

译者：[geekpi](https://github.com/geekpi)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
