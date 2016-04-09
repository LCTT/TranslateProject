在 Linux 命令行中使用和执行 PHP 代码（二）：12 个 PHP 交互性 shell 的用法 
================================================================================
在上一篇文章“[在 Linux 命令行中使用和执行 PHP 代码（一）][1]”中，我同时着重讨论了直接在Linux命令行中运行PHP代码以及在Linux终端中执行PHP脚本文件。

![Run PHP Codes in Linux Commandline](http://www.tecmint.com/wp-content/uploads/2015/07/Run-PHP-Codes-in-Linux-Commandline.jpeg)

本文旨在让你了解一些相当不错的Linux终端中的PHP交互性 shell 的用法特性。

让我们先在PHP 的交互shell中来对`php.ini`设置进行一些配置吧。

**6. 设置PHP命令行提示符**

要设置PHP命令行提示，你需要在Linux终端中使用下面的php -a（启用PHP交互模式）命令开启一个PHP交互shell。

    $ php -a

然后，设置任何东西（比如说Hi Tecmint ::）作为PHP交互shell的命令提示符，操作如下：

    php > #cli.prompt=Hi Tecmint ::

![Enable PHP Interactive Shell](http://www.tecmint.com/wp-content/uploads/2015/07/Enable-PHP-Interactive-Shell.png)

*启用PHP交互Shell*

同时，你也可以设置当前时间作为你的命令行提示符，操作如下：

    php > #cli.prompt=`echo date('H:m:s');` >
    
    22:15:43 >

**7. 每次输出一屏**

在我们上一篇文章中，我们已经在原始命令中通过管道在很多地方使用了`less`命令。通过该操作，我们可以在那些不能一屏全部输出的地方获得分屏显示。但是，我们可以通过配置php.ini文件，设置pager的值为less以每次输出一屏，操作如下：

    $ php -a
    php > #cli.pager=less

![Fix PHP Screen Output](http://www.tecmint.com/wp-content/uploads/2015/07/Fix-PHP-Screen-Output.png)

*限制PHP屏幕输出*

这样，下次当你运行一个命令（比如说条调试器`phpinfo();`）的时候，而该命令的输出内容又太过庞大而不能固定在一屏，它就会自动产生适合你当前屏幕的输出结果。

    php > phpinfo();

![PHP Info Output](http://www.tecmint.com/wp-content/uploads/2015/07/PHP-Info-Output.png)

*PHP信息输出*

**8. 建议和TAB补全**

PHP shell足够智能，它可以显示给你建议和进行TAB补全，你可以通过TAB键来使用该功能。如果对于你想要用TAB补全的字符串而言有多个选项，那么你需要使用两次TAB键来完成，其它情况则使用一次即可。

如果有超过一个的可能性，请使用两次TAB键。

    php > ZIP [TAB] [TAB]

如果只有一个可能性，只要使用一次TAB键。

    php > #cli.pager [TAB]

你可以一直按TAB键来获得建议的补全，直到该值满足要求。所有的行为都将记录到`~/.php-history`文件。

要检查你的PHP交互shell活动日志，你可以执行：

    $ nano ~/.php_history | less

![Check PHP Interactive Shell Logs](http://www.tecmint.com/wp-content/uploads/2015/07/Check-PHP-Interactive-Shell-Logs.png)

*检查PHP交互Shell日志*

**9. 你可以在PHP交互shell中使用颜色，你所需要知道的仅仅是颜色代码。**

使用echo来打印各种颜色的输出结果，类似这样：

    php > echo "color_code1 TEXT second_color_code";

具体来说是：

    php > echo "\033[0;31m Hi Tecmint \x1B[0m";

![Enable Colors in PHP Shell](http://www.tecmint.com/wp-content/uploads/2015/07/Enable-Colors-in-PHP-Shell.png)

*在PHP Shell中启用彩色*

到目前为止，我们已经看到，按回车键意味着执行命令，然而PHP Shell中各个命令结尾的分号是必须的。

**10. 在PHP shell中用basename()输出路径中最后一部分**

PHP shell中的basename函数可以从给出的包含有到文件或目录路径的最后部分。

basename()样例#1和#2。

    php > echo basename("/var/www/html/wp/wp-content/plugins");
    php > echo basename("www.tecmint.com/contact-us.html");

上述两个样例将输出：

    plugins
    contact-us.html

![Print Base Name in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Print-Base-Name-in-PHP.png)

*在PHP中打印基本名称*

**11. 你可以使用PHP交互shell在你的桌面创建文件（比如说test1.txt），就像下面这么简单**

    php> touch("/home/avi/Desktop/test1.txt");

我们已经见识了PHP交互shell在数学运算中有多优秀，这里还有更多一些例子会令你吃惊。

**12. 使用PHP交互shell打印比如像tecmint.com这样的字符串的长度**

strlen函数用于获取指定字符串的长度。

    php > echo strlen("tecmint.com");

![Print Length String in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Print-Length-String-in-PHP.png)

*在PHP中打印字符串长度*

**13. PHP交互shell可以对数组排序，是的，你没听错**

声明变量a，并将其值设置为array(7,9,2,5,10)。

    php > $a=array(7,9,2,5,10);

对数组中的数字进行排序。

    php > sort($a);

以排序后的顺序打印数组中的数字，同时打印序号，第一个为[0]。

    php > print_r($a);
    Array
    (
        [0] => 2
        [1] => 5
        [2] => 7
        [3] => 9
        [4] => 10
    )

![Sort Arrays in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Sort-Arrays-in-PHP.png)

*在PHP中对数组排序*

**14. 在PHP交互Shell中获取π的值**

    php > echo pi();
    
    3.1415926535898

**15. 打印某个数比如32的平方根**

    php > echo sqrt(150);
    
    12.247448713916

**16. 从0-10的范围内挑选一个随机数**

    php > echo rand(0, 10);

![Get Random Number in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Get-Random-Number-in-PHP.png)

*在PHP中获取随机数*

**17. 获取某个指定字符串的md5校验和sha1校验，例如，让我们在PHP Shell中检查某个字符串（比如说avi）的md5校验和sha1校验，并交叉校验bash shell生成的md5校验和sha1校验的结果。**

    php > echo md5(avi);
    3fca379b3f0e322b7b7967bfcfb948ad
    
    php > echo sha1(avi);
    8f920f22884d6fea9df883843c4a8095a2e5ac6f

----------

    $ echo -n avi | md5sum
    3fca379b3f0e322b7b7967bfcfb948ad  -
    
    $ echo -n avi | sha1sum
    8f920f22884d6fea9df883843c4a8095a2e5ac6f  -

![Check md5sum and sha1sum in PHP](http://www.tecmint.com/wp-content/uploads/2015/07/Check-md5sum-and-sha1sum.png)

*在PHP中检查md5校验和sha1校验*

这里只是PHP Shell中所能获取的功能和PHP Shell的交互特性的惊鸿一瞥，这些就是到现在为止我所讨论的一切。保持连线，在评论中为我们提供你有价值的反馈吧。为我们点赞并分享，帮助我们扩散哦。

--------------------------------------------------------------------------------

via: http://www.tecmint.com/execute-php-codes-functions-in-linux-commandline/

作者：[Avishek Kumar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:https://linux.cn/article-5906-1.html
