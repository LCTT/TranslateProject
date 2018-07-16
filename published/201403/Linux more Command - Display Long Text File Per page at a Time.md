Linux中的more命令－逐页显示长文本文件
================================================================================
如果你已经习惯了在Linux系统上工作，那你一定会发现在Linux世界中存在着大量的文本文件。配置文件和日志文件通常都采用文本格式。这些文件通常都有很长的内容，不能在一屏内全部显示。所以在处理这种文件时，我们需要分页显示。这时我们可以用上**more**命令。

### more是干嘛的 ###

more是一个用来分页显示大文本文件的命令，它默认是内置在各个Linux发行版中的。

### 怎么用more ###

使用more命令，只需要键入:

    $ more file_name

比如，我们想检查/var/log目录下的日志文件syslog，只需要键入：

    $ more /var/log/syslog

![more命令](http://linoxide.com/wp-content/uploads/2014/01/more.png)

然后我们可以看到**在屏幕左下角有个提示**，告诉我们当前的显示比例为0%。看上去这个文件相当大，所以第一页是全部页数的0%。使用空格键可以往下翻页，然后就可以看到提示的百分比会增加。

![Scroll page](http://linoxide.com/wp-content/uploads/2014/01/more_2.png)

### 限制每页显示的行数 ###

在执行more命令的时候，它会占用你终端窗口的全部空间用于显示。但是你可以通过参数**-数字**来限制每页显示的行数。

例如，你希望每页**限制显示12行**，可以通过下面的命令：

    $ more -12 /var/log/syslog

![限制每页显示12行](http://linoxide.com/wp-content/uploads/2014/01/more_12.png)

现在，你会看到每页只显示12行，在按下空格键后，就会翻页显示后面的12行。

### Display user message ###

我们知道，more命令会在显示区域的左下角提示当前内容所占的百分比。对于第一次使用more命令的人来说，他或她可能会想知道怎么才能往下翻页。为了避免这种情况，我们可以在执行时增加**-d**参数，这样就会额外显示一行用户信息“[**按空格键继续，‘q‘推出.**]”

![More with -d option](http://linoxide.com/wp-content/uploads/2014/01/more_d1.png)

如果用户按了**‘空格‘或’q‘**之外的按键，more会显示一行帮助信息**“ [按‘h’键查看提示。]”**

![More displaying help message](http://linoxide.com/wp-content/uploads/2014/01/more_d2.png)

如果按下h键，会显示一个帮助信息：

![Display help](http://linoxide.com/wp-content/uploads/2014/01/more_dh.png)

一个有意思的指令是**b**按钮，**b按钮允许你**退回到前面的页面。换句话说，b按钮可以允许**向前翻页**。

你可以通过左上角的**...前1页**信息来确认当前显示的是前面的页面。

![在more中往前翻页](http://linoxide.com/wp-content/uploads/2014/01/more_back.png)

### 禁止滚动 ###

通过参数**-c**，more命令不会滚动页面，而是直接清除之前的内容，替换为下一页的内容。
With **-c** option, more will not scroll the page. It will clear the previous page and put the next page or lines there.

    $ more -10 -c lynis.log

![Suppress scroll](http://linoxide.com/wp-content/uploads/2014/01/more_c.png)

如果按下空格键，下一页会仍然有相同的大小。

![Suppress scroll](http://linoxide.com/wp-content/uploads/2014/01/more_c2.png)

### 忽略多余的空白行 ###

使用参数**-s**来忽略多余的空白行，下面是个例子：

![多个空白行的文件](http://linoxide.com/wp-content/uploads/2014/01/more_s.png)

当我们增加参数**-s**后：

    $ more -s doc_30.txt

![忽略了多余空白行](http://linoxide.com/wp-content/uploads/2014/01/more_s2.png)

### 查找字符串 ###

如果你的日志文件非常大，那么在其中查找你想要的字符串并不是那么容易。more命令的查找功能可以帮你，通过参数**+/string**可以用来搜索字符串，找到的关键字会显示在第一行。比如我们要在**/var/logs/syslog**文件中搜索“**dhclient**”，那more命令的格式：

    $ more +/dhclient /var/log/syslog

![查找字符串](http://linoxide.com/wp-content/uploads/2014/01/more_string.png)

然后，如果要在文件中继续搜索下一个，只需要按下**/按钮**，后面跟有关键字dhclient。

### 从指定行开始显示 ###

你也可以通过参数**+数字**来指定开始显示的行，例如，我们有一个15行的文件：

![多行文件](http://linoxide.com/wp-content/uploads/2014/01/more_num1.png)

然后我们想从第5行开始显示这个文件的内容，命令看起来会是这个样子：

    $ more +5 doc_30.txt

![从指定行开始显示](http://linoxide.com/wp-content/uploads/2014/01/more_num2.png)

### 可以显示二进制文件吗? ###

**答案是不行**. more命令会提示这样的信息，例如：

![显示二进制文件](http://linoxide.com/wp-content/uploads/2014/01/more_binary.png)

### 结论 ###

more是一个用来查看文本文件的基础工具，它不能用来显示二进制文件。通常，我们可以通过命令**man more**或者**more --help**来获取更多关于more怎么使用的信息。

--------------------------------------------------------------------------------

via: http://linoxide.com/linux-command/linux-more-command/

译者：[zpl1025](https://github.com/zpl1025) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
