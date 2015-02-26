Linux有问必答：如何在Linux下重命名多个文件
================================================================================
> **提问**：我知道我可以用mv命令重命名文件。但是当我想重命名很多文件怎么办？如果为每个文件都这么做将会是很乏味的。有没有办法一次性重命名多个文件？

在Linux中，当你想要改变一个文件名，使用mv命令就好了。然而mv不能使用通配符重命名多个文件。可以用sed、awk或者与[xargs][1]结合使用来处理多个文件的情况。然而，这些命令行即繁琐又不友好，并且如果不小心的话还很容易出错。你不会想要撤销1000个文件的错误名吧！

当你想要重命名多个文件的时候，rename 工具或许是最简单、最安全和最强大的命令行工具。这个rename命令实际上是一个Perl脚本，它预安装在所有的现在Linux发行版上。

下面是重命名命令的基本语法。

    rename [-v -n -f] <pcre> <files>

\<pcre> 是Perl兼容正则表达式，它表示的是要重命名的文件和该怎么做。正则表达式的形式是‘s/old-name/new-name/’。

‘-v’选项会显示文件名改变的细节（比如：XXX重命名成YYY）。

‘-n’选项告诉rename命令在不实际改变名称的情况下显示文件将会重命名的情况。这个选项在你想要在不改变文件名的情况下模拟改变文件名的情况下很有用。

‘-f’选项强制覆盖存在的文件。

下面，就让我们看下rename命令的几个实际例子。

### 改变文件扩展名 ###

假设你有许多.jpeg的图片文件。你想要把它们的名字改成*.jpg。下面的命令就会将*.jpeg 文件改成 *.jpg。

    $ rename 's/\.jpeg$/\.jpg/' *.jpeg 

### 大写改成小写，反之亦然 ###

有时你想要改变文件名的大小写，你可以使用下面的命令。

把所有的文件改成小写：

    # rename 'y/A-Z/a-z/' *

把所有的文件改成大写：

    # rename 'y/a-z/A-Z/' * 

![](https://farm9.staticflickr.com/8655/16054304245_bcf9d23b59_b.jpg)

### 更改文件名模式 ###

现在让我们考虑更复杂的包含子模式的正则表达式。在PCRE中，子模式包含在圆括号中，$符后接上数字（比如$1，$2）。

比如，下面的命令会将‘img_NNNN.jpeg’变成‘dan_NNNN.jpg’。

    # rename -v 's/img_(\d{4})\.jpeg$/dan_$1\.jpg/' *.jpeg

----------

    img_5417.jpeg renamed as dan_5417.jpg
    img_5418.jpeg renamed as dan_5418.jpg
    img_5419.jpeg renamed as dan_5419.jpg
    img_5420.jpeg renamed as dan_5420.jpg
    img_5421.jpeg renamed as dan_5421.jpg

比如，下面的命令会将‘img\_000NNNN.jpeg’变成‘dan\_NNNN.jpg’。

    # rename -v 's/img_\d{3}(\d{4})\.jpeg$/dan_$1\.jpg/' *jpeg

----------

    img_0005417.jpeg renamed as dan_5417.jpg
    img_0005418.jpeg renamed as dan_5418.jpg
    img_0005419.jpeg renamed as dan_5419.jpg
    img_0005420.jpeg renamed as dan_5420.jpg
    img_0005421.jpeg renamed as dan_5421.jpg

上面的例子中，子模式‘\d{4}’会捕捉4个连续的数字，捕捉的四个数字就是$1, 将会用于新的文件名。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/rename-multiple-files-linux.html

译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://xmodulo.com/xargs-command-linux.html