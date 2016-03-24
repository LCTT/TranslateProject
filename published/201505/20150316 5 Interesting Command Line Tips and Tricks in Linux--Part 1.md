5个有趣的Linux命令行技巧
================================================================================
你有将Linux物尽其用吗？对很多Linux用户来说，有很多看起来是技巧的有用特性。有些时候你会需要这些技巧。本文会帮助你更好得使用一些命令，发挥其更强大的功能。

![5个命令行技巧](http://www.tecmint.com/wp-content/uploads/2015/03/5-Command-Line-Tips.jpg)

*图1：5个命令行技巧*

我们开始一个新的系列，在这里我们还会写一些技巧，并且用尽量小的篇幅写清楚。

### 1. 我们可以使用[`history`命令][1]来查看曾经运行过的命令。 ###

这里是一个`history`命令的示例输出。

    # history

![history命令例子](http://www.tecmint.com/wp-content/uploads/2015/03/history-command.gif)

*图2：history命令例子*

从`history`命令输出看，很明显，命令的执行时间没有被打出来。有解决方法吗？有的！运行如下命令：

    # HISTTIMEFORMAT="%d/%m/%y %T "
    # history

如果你想让这个修改永久生效，添加如下的一行内容到`~/.bashrc`文件中：

    export HISTTIMEFORMAT="%d/%m/%y %T "

然后，在终端中运行：

    # source ~/.bashrc

命令和选项的解释：

- history – 查看运行过的命令
- HISTIMEFORMAT – 设置时间格式的环境变量
- %d – 天
- %m – 月
- %y – 年
- %T – 时间戳
- source – 简而言之就是将文件内容发送给shell来执行
- .bashrc – BASH以交互方式启动时运行的脚本文件

![history命令输出的日志](http://www.tecmint.com/wp-content/uploads/2015/03/History-Command-Logs.gif)

*图3：`history`命令输出的日志*

### 2. 如何测试磁盘写入速度？###

一行`dd`命令脚本就可以实现。

    # dd if=/dev/zero of=/tmp/output.img bs=8k count=256k conv=fdatasync; rm -rf /tmp/output.img

![dd命令例子](http://www.tecmint.com/wp-content/uploads/2015/03/dd-Command-Example.gif)

*图4：`dd`命令例子*

命令和选项的解释：

- dd – 转换和复制文件
- if=/dev/zero – 指定输入文件，默认为stdin（标准输入）
- of=/tmp/output.img – 指定输出文件，默认为stdout（标准输出）
- bs – 一次读和写的块大小，最大可以以MB为单位
- count – 复制次数
- conv – 使用逗号分隔的策略来转换文件（LCTT 译注：比如将大写字母转换成小写，echo AA | dd conv=lcase）
- rm – 删除文件和目录
- -rf – （-r） 递归地删除目录和其中的内容，（-f）强行删除而不输出确认信息

### 3. 你如何获取吃掉你磁盘空间的最大的6个文件？###

一个使用[`du`命令][2]的简单单行脚本即可实现，`du`命令主要用于获取文件的空间使用情况。

    # du -hsx * | sort -rh | head -6

![获取磁盘空间使用情况的方法](http://www.tecmint.com/wp-content/uploads/2015/03/check-disk-space-usage.gif)

*图5：获取磁盘空间使用情况的方法*

命令和选项的解释：

- du – 估计文件的空间使用情况
- -hsx – （-h）更易读的格式，（-s）汇总输出，（-x）跳过其他文件系统的文件
- sort – 对文本文件按行排序
- -rf – （-r）将比较的结果逆序输出，（-f）忽略大小写
- head – 输出文件的头几行

### 4. 获取一个文件的详细状态信息###

可以使用`stat`命令

    # stat filename_ext  （例如：stat abc.pdf）

![获取文件的详细信息](http://www.tecmint.com/wp-content/uploads/2015/03/Check-File-Statistics.gif)

*图6：获取文件的详细信息*

### 5. 显示帮助 ###

最后一个技巧是为那些入门者准备的，如果你是有经验的用户，可能不需要它，除非你想从中寻找乐趣。入门者可能有Linux命令行恐惧症，下面的命令会随机显示一个man手册页。对入门者来说，好处是总会学到新的东西，而且不会厌倦。

    # man $(ls /bin | shuf | head -1)

![查看随机的man手册页](http://www.tecmint.com/wp-content/uploads/2015/03/Generate-Random-Man-Pages.gif)

*图7：查看随机的man手册页*

命令和选项的解释：

- man – Linux man手册
- ls – 列出文件
- /bin – 系统可执行文件的路径
- shuf – 把输入内容按行随机打乱并输出
- head – 输出文件的头几行

这就是所有的内容了。如果你知道任何类似的技巧，可以分享给我们，我们会用你的语言在网站上发表出来。

不要忘记在下边评论框中留下有价值的反馈。保持联系。可以点赞或者将本文分享来帮助我们更好地传播内容。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/5-linux-command-line-tricks/

作者：[Avishek Kumar][a]
译者：[goreliu](https://github.com/goreliu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-1143-1.html
[2]:http://www.tecmint.com/check-linux-disk-usage-of-files-and-directories/