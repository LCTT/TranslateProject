Linux用户应知应会的7个‘ls’命令的独特技巧
================================================================================

在前面我们系列报道的两篇文章中，我们已经涵盖了关于‘ls’命令的绝大多数内容。本文时‘ls命令’系列的最后一部分。如果你还没有读过该系列的其它两篇文章，你可以访问下面的链接。

- [Linux中的15个基本‘ls’命令示例][1]
- [15  个‘ls’命令的面试问题（一）][2]
- [10 个‘ls’命令面试的问题（二）][3]

![7 Quirky ls Command Tricks](http://www.tecmint.com/wp-content/uploads/2015/03/ls-command-tricks.jpg)

*7个ls命令独特技巧*

### 1. 以各种时间格式附带时间戳列出目录中的内容 ###

要以时间格式列出目录内容，我们需要选择以下两种方法中的任何一种。

    # ls -l –time-style=[STYLE]               (方法 A)

**注意** - 上面的开关`--time`的格式必须和`-l`开关同时使用，否则达不到目的。

    # ls -full-time                           (方法 B)

可以用以下任何一个选项替换`[STYLE]`。

    full-iso
    long-iso
    iso
    locale
    +%H:%M:%S:%D

**注意** - 在上面行中，H（时），M（分），S（秒），D（日）的顺序可以任意调整。此外，你只需选择那些相关的选项，而不是所有选项。例如，`ls -l --time-style=+%H`将只显示小时。`ls -l --time-style=+%H:%M:%D`将显示小时、分钟和日。 

    # ls -l --time-style=full-iso

![ls Command Full Time Style](http://www.tecmint.com/wp-content/uploads/2015/03/ls-Command-Full-Time-Style.gif)

*ls命令的完整 ISO时间格式*

    # ls -l --time-style=long-iso

![Long Time Style Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Long-Time-Listing-Format.gif)

*长时间格式列表*

    # ls -l --time-style=iso

![Time Style Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Local-Time-Style-Listing.gif)

*时间格式列表*

    # ls -l --time-style=locale

![Locale Time Style Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Hour-Mintue-Time-Style-Listing.gif)

*本地时间格式列表*

    # ls -l --time-style=+%H:%M:%S:%D

![Date and Time Style Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Full-Time-Style-Listing.gif)

*日期和时间格式列表*

    # ls --full-time

![Full Style Time Listing](http://www.tecmint.com/wp-content/uploads/2015/03/Full-Style-Time-Listing.gif)

*完整格式时间列表*

### 2. 以多种格式列出目录内容，如以逗号分隔、水平格式、长格式、垂直格式、交叉格式等列出。 ###

目录内容可以用以下建议的ls命令各种格式列出：

    # ls --format=across		# 交叉
    # ls --format=comma			# 逗号
    # ls --format=horizontal	# 水平
    # ls --format=long			# 长格式
    # ls --format=single-column	# 单栏
    # ls --format=verbose		# 详情
    # ls --format=vertical		# 垂直

![Listing Formats of ls Command](http://www.tecmint.com/wp-content/uploads/2015/03/ls-command-Listing-Formats.gif)

*ls命令的列出格式*

### 3. 使用ls命令为目录内容输出结果添加像（/=@|）这样的指示符。 ###

带有`-p`选项的ls命令将实现该目的。它会根据文件类型添加上面这些指示符其中之一。

    # ls -p

![Append Indicators to Content](http://www.tecmint.com/wp-content/uploads/2015/03/Append-Indicators.gif)

*添加指示符到内容*

### 4. 根据扩展名、大小、时间和版本对目录内容排序。 ###

我们可以使用`--extension`选项来按照扩展名对输出结果排序，`--size`扩展选项按照大小排序，`-t`扩展选项按照时间排序，`-v`扩展选项对版本排序。

我们也可以使用`--none`选项，它会以常规方式输出结果而不会进行排序。

    # ls --sort=extension
    # ls --sort=size
    # ls --sort=time
    # ls --sort=version
    # ls --sort=none

![Sort Listing of Content by Options](http://www.tecmint.com/wp-content/uploads/2015/03/Sort-Content-by-Extensions.gif)

*通过选项对内容排序列出*

### 5. 使用ls命令打印目录中各个项的数字UID和GID。 ###

上面的环境可以通过使用带有-n标识的ls命令来实现。

    # ls -n

![Print Listing of Content by UID and GID](http://www.tecmint.com/wp-content/uploads/2015/03/Print-UID-GID-of-Contents.gif)

*通过UID和GID对打印内容列表*

### 6. 标准输出结果中打印目录内容中比默认指定的更多栏目。 ###

好吧，ls命令根据屏幕大小自动输出目录内容。

然而，我们可以手动分配屏幕宽度的值和出现的栏目的控制数。这可以通过使用‘`--width`’开关实现。

    # ls --width 80
    # ls --width 100
    # ls --width 150

![List Content Based on Window Sizes](http://www.tecmint.com/wp-content/uploads/2015/03/List-Content-By-More-Column.gif)

*根据窗口大小列出内容*

**注意**： 你可以试验你可以给width标识传递什么值。

### 7. 通过ls命令为列出的目录内容手动指定的制表符大小而不是默认的8。 ###

    # ls --tabsize=[value]

![List Content by Table Size](http://www.tecmint.com/wp-content/uploads/2015/03/List-Content-by-Table-Size.gif)

*按表尺寸列出内容*

**注意**： 指定`[Value]`的数值。

到目前为止，都讲完了。保持连线，我们会推出下一篇文章。别忘了在下面的评论中为我们提供有价值的反馈。为我们点赞并分享，帮我们推广。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/linux-ls-command-tricks/

作者：[Avishek Kumar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-5109-1.html
[2]:https://linux.cn/article-5349-1.html
[3]:https://linux.cn/article-5350-1.html
