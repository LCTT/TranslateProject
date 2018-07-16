Linux touch 命令 - 为什么我们需要改变时间戳？
================================================================================
我们可能在 Linux 下运用 touch 命令创建一个空文件。当然我们也可以使用其他命令例如 vi, nano 或是任意一个编辑工具来实现。但是你可能需要更多的步骤来完成操作。其实你要知道 touch 命令的主要功能并不是为了创建一个空文件哦。

### 什么是 touch 命令 ###

众所周知，每个文件都被附有时间戳。这个时间戳记包括访问时间和修改时间。而 Touch 命令主要就是用来修改文件的访问时间和修改时间。

### 为什么我们需要使用 touch 命令 ###

既然 touch 命令描述的是改变时间戳，那么我们可能会想为什么我们需要去改变时间戳呢?这个问题会引发我们的深思。然而，我想有个理由可以解释为什么我们需要使用它。如果你参加了一个全球范围的开源项目，那么时间戳可能变得很重要。编译源代码文件可能需要同一地区的时间戳。如果未统一，程序可能会编译失败。（译注：有强迫症的同学也很喜欢这个命令——就看不得乱七八糟的时间，;>）

### 不带任何选项下运行 touch ###

最简单的使用 touch 命令。只需键入：

    $ touch file_name

请观察下面的一张截图。

![Touch command](http://linoxide.com/wp-content/uploads/2014/01/touch.png)

**File_1.txt**原来的时间戳是 12:42。在我们使用 touch 命令后，它改变为了 17:08。由此看出，默认情况下，touch 会将文件的时间戳改为当前时间。

### 只改变访问时间 ###

正如我们之前提到的，每个文件都附有访问时间和修改时间。上面的时间戳是 17:08。我们可以看更多的细节。

![Detail timestamp](http://linoxide.com/wp-content/uploads/2014/01/touch_stat.png)

我们发现**访问**时间和**修改**时间的值是相同的都是 17:08:35 ,还有它们属于同一时区 GMT +7。

如果现在我们要只改变访问时间，我们需要使用**-a**选项。

    $ touch -a file_1.txt

![Touch -a option](http://linoxide.com/wp-content/uploads/2014/01/touch_a.png)

如你所见，**访问时间变为**了 17:51:37 ,但是**修改时间仍为**17:08:35。[译注：原文为 Change time(状态改变时间)应是作者笔误]

### 只改变修改时间 ###

我们可以使用**-m**选项来实现。现在我们用**file_2.txt**作个示例。

![File_2.txt detail timestamp](http://linoxide.com/wp-content/uploads/2014/01/touch_stat_file_2.png)

    $ touch -m file_2.txt

![Touch -m option](http://linoxide.com/wp-content/uploads/2014/01/touch_m.png)

现在**修改时间从 12:42:20 改为了 17:57:20。请注意**,当文件被访问或修改时，状态改变时间域的值总会对其记录。

### 更改为自定义时间戳 ###

**-a**和**-m**选项都会将文件的时间戳改为现在当前时间。当然我们也可以更改为自定义时间戳。使用**-t**选项实现。

从上面示例示例中的 file_2.txt，我们看出它的时间戳是：

    访问时间:12:42:20
    修改时间:17:57:20
    执行日期:2014-01-14

假如我们想要将**访问时间和修改时间**改为**2014年1月12日 09:58:27**。我们可以用下列命令来完成：

    $ touch -t 201401120958.27 file_2.txt

![Touch using -t option](http://linoxide.com/wp-content/uploads/2014/01/touch_t.png)

**-t** 选项语法组成 :

#### [[CC]YY]MMDDhhmm [.SS] ####

    CC - 年份的前两位 
    YY - 年份的后两位 
    MM - 月份 [01-12]
    DD - 日期 [01-31]
    hh - 时 [00-23]
    mm - 分 [00-59]
    SS - 秒 [00-61]

### 改变日期和时间的另一种方式 ###

如果你觉得**[[CC]YY]MMDDhhmm [.SS]**格式不适合你，我们也可以使用 -d 选项。下面是**-d**选项使用的一个示例。

#### 更改指定日期 ####

举例来说，我们有个名为 file_3.txt 的文件，它的相关属性在下面的截图中展示了。

![File_3.txt detail timestamp](http://linoxide.com/wp-content/uploads/2014/01/stat_file_3.png)

现在**我们要将日期2014年1月14日改为2013年12月20日**。可以使用下列命令：

    $ touch -d '10-December-2013' file_3.txt

![Change date using -d option](http://linoxide.com/wp-content/uploads/2014/01/touch_d_date.png)

不出意料，访问时间和修改时间的日期已经改为了2013年12月10日。

### 改变时区 ###

如果我们想改变指定GMT的时间，我们也可以使用**-d**选项。先让file_3.txt 移回当前时间。

    $ touch file_3.txt

![Reset file_3.txt timestamp](http://linoxide.com/wp-content/uploads/2014/01/touch_return_file_3.png)

不难发现 file_3.txt 的时区为 GMT +0700。要改为 GMT3 时区，我们只需要键入如下命令：

    $ touch -d GMT3 file_3.txt

![Change into GMT3 timezone](http://linoxide.com/wp-content/uploads/2014/01/touch_gmt3.png)

好的，现在时间已经改为了 10:00:00 AM。

### 结合参数下使用-d选项 ###

还可以用很酷的方式使用**-d**选项。请观察下面的图片。

![Change date using keyword](http://linoxide.com/wp-content/uploads/2014/01/touch_next_sunday.png)

我们可以将单词 **next Sunday** 和 GMT 3合成一个值，而 touch 命令仍然能识别它。日期已经改为了2014年1月21日，而当前的日期为2014年1月14日。

还有另一个**-d**选项的示例。
首先，我们要将file3_3.txt重置到当前日期和时间。

    $ touch file_3.txt

![Reset file_3.txt timestamp](http://linoxide.com/wp-content/uploads/2014/01/touch_reset_file_3.png)

然后我们尝试这个命令：

    $ touch -d ‘1 year ago 13:43:07’ file_3.txt

![Change date using keyword](http://linoxide.com/wp-content/uploads/2014/01/touch_d_year_ago.png)

太震撼了，Touch 甚至能识别单词‘**1 year ago**’。现在的日期以及时间已经改为了2013年1月14日,13:43:07。

### 创建一个空文件 ###

当你运行 touch 命令目标文件不存在时，touch 会创建一个同名的空文件。

    $ touch file_10.txt

![Create an empty file](http://linoxide.com/wp-content/uploads/2014/01/touch_file_10.png)

### 同时创建多个文件 ###

你可以用空格将目标文件分割开来，以此来创建多个文件。

    $ touch doc_10.txt doc_20.txt doc_30.txt

![Create multiple files](http://linoxide.com/wp-content/uploads/2014/01/touch_multiple_files.png)

### 总结 ###

如果你要处理关于文件或目录的时间戳问题，那么 Touch 会对你很有用的。一如既往得你也可以键入**man touch**或**touch --help**来显示帮助页面了解更多细节。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-touch-command/

译者：[Luoxcat](https://github.com/Luoxcat) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
