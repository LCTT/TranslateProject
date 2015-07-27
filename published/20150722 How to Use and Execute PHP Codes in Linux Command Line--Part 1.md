在 Linux 命令行中使用和执行 PHP 代码（一）
================================================================================
PHP是一个开源服务器端脚本语言，最初这三个字母代表的是“Personal Home Page”，而现在则代表的是“PHP：Hypertext Preprocessor”，它是个递归首字母缩写。它是一个跨平台脚本语言，深受C、C++和Java的影响。

![Run PHP Codes in Linux Command Line](http://www.tecmint.com/wp-content/uploads/2015/07/php-command-line-usage.jpeg)

*在 Linux 命令行中运行 PHP 代码*

PHP的语法和C、Java以及带有一些PHP特性的Perl变成语言中的语法十分相似，它当下大约正被2.6亿个网站所使用，当前最新的稳定版本是PHP版本5.6.10。

PHP是HTML的嵌入脚本，它便于开发人员快速写出动态生成的页面。PHP主要用于服务器端（而Javascript则用于客户端）以通过HTTP生成动态网页，然而，当你知道可以在Linux终端中不需要网页浏览器来执行PHP时，你或许会大为惊讶。

本文将阐述PHP脚本语言的命令行方面。

**1. 在安装完PHP和Apache2后，我们需要安装PHP命令行解释器。**

    # apt-get install php5-cli 			[Debian 及类似系统]
    # yum install php-cli 				[CentOS 及类似系统]

接下来我们通常要做的是，在`/var/www/html`（这是 Apache2 在大多数发行版中的工作目录）这个位置创建一个内容为 `<?php phpinfo(); ?>`，名为 `infophp.php` 的文件来测试（PHP是否安装正确），执行以下命令即可。

    # echo '<?php phpinfo(); ?>' > /var/www/html/infophp.php

然后，将浏览器访问 http://127.0.0.1/infophp.php ，这将会在网络浏览器中打开该文件。

![Check PHP Info](http://www.tecmint.com/wp-content/uploads/2015/07/Check-PHP-Info.png)

*检查PHP信息*

不需要任何浏览器，在Linux终端中也可以获得相同的结果。在Linux命令行中执行`/var/www/html/infophp.php`，如：

    # php -f /var/www/html/infophp.php

![Check PHP info from Commandline](http://www.tecmint.com/wp-content/uploads/2015/07/Check-PHP-info-from-Commandline.png)

*从命令行检查PHP信息*

由于输出结果太大，我们可以通过管道将上述输出结果输送给 `less` 命令，这样就可以一次输出一屏了，命令如下：

    # php -f /var/www/html/infophp.php | less

![Check All PHP Info](http://www.tecmint.com/wp-content/uploads/2015/07/Check-All-PHP-Info.png)

*检查所有PHP信息*

这里，‘-f‘选项解析并执行命令后跟随的文件。

**2. 我们可以直接在Linux命令行使用`phpinfo()`这个十分有价值的调试工具而不需要从文件来调用，只需执行以下命令：**

    # php -r 'phpinfo();'

![PHP Debugging Tool](http://www.tecmint.com/wp-content/uploads/2015/07/PHP-Debugging-Tool.png)

*PHP调试工具*

这里，‘-r‘ 选项会让PHP代码在Linux终端中不带`<`和`>`标记直接执行。

**3. 以交互模式运行PHP并做一些数学运算。这里，‘-a‘ 选项用于以交互模式运行PHP。**

    # php -a
    
    Interactive shell
    
    php > echo 2+3;
    5
    php > echo 9-6;
    3
    php > echo 5*4;
    20
    php > echo 12/3;
    4
    php > echo 12/5;
    2.4
    php > echo 2+3-1;
    4
    php > echo 2+3-1*3;
    2
    php > exit

输入 ‘exit‘ 或者按下 ‘ctrl+c‘ 来关闭PHP交互模式。

![Enable PHP Interactive Mode](http://www.tecmint.com/wp-content/uploads/2015/07/Enable-PHP-interactive-mode1.png)

*启用PHP交互模式*

**4. 你可以仅仅将PHP脚本作为shell脚本来运行。首先，创建在你当前工作目录中创建一个PHP样例脚本。**

    # echo -e '#!/usr/bin/php\n<?php phpinfo(); ?>' > phpscript.php

注意，我们在该PHP脚本的第一行使用`#!/usr/bin/php`，就像在shell脚本中那样（`/bin/bash`）。第一行的`#!/usr/bin/php`告诉Linux命令行用 PHP 解释器来解析该脚本文件。

其次，让该脚本可执行：

    # chmod 755 phpscript.php

接着来运行它，

    # ./phpscript.php

**5. 你可以完全靠自己通过交互shell来创建简单函数，这你一定会被惊到了。下面是循序渐进的指南。**

开启PHP交互模式。

    # php -a

创建一个函数，将它命名为 `addition`。同时，声明两个变量 `$a` 和 `$b`。

    php > function addition ($a, $b)

使用花括号来在其间为该函数定义规则。

    php > {

定义规则。这里，该规则讲的是添加这两个变量。

    php { echo $a + $b;

所有规则定义完毕，通过闭合花括号来封装规则。

    php {}

测试函数，添加数字4和3，命令如下：

    php > var_dump (addition(4,3));

#### 样例输出 ####

    7NULL

你可以运行以下代码来执行该函数，你可以测试不同的值，你想来多少次都行。将里头的 a 和 b 替换成你自己的值。

    php > var_dump (addition(a,b));

----------

    php > var_dump (addition(9,3.3));

#### 样例输出 ####

    12.3NULL

![Create PHP Functions](http://www.tecmint.com/wp-content/uploads/2015/07/Create-PHP-Functions.png)

*创建PHP函数*

你可以一直运行该函数，直至退出交互模式（ctrl+z）。同时，你也应该注意到了，上面输出结果中返回的数据类型为 NULL。这个问题可以通过要求 php 交互 shell用 return 代替 echo 返回结果来修复。

只需要在上面的函数的中 ‘echo‘ 声明用 ‘return‘ 来替换 

替换

    php { echo $a + $b;

为

    php { return $a + $b;

剩下的东西和原理仍然一样。

这里是一个样例，在该样例的输出结果中返回了正确的数据类型。

![PHP Functions](http://www.tecmint.com/wp-content/uploads/2015/07/PHP-Functions.png)

*PHP函数*

永远都记住，用户定义的函数不会从一个shell会话保留到下一个shell会话，因此，一旦你退出交互shell，它就会丢失了。

希望你喜欢此次教程。保持连线，你会获得更多此类文章。保持关注，保持健康。请在下面的评论中为我们提供有价值的反馈。点赞并分享，帮助我们扩散。

还请阅读： [12个Linux终端中有用的的PHP命令行用法——第二部分][1]

--------------------------------------------------------------------------------

via: http://www.tecmint.com/run-php-codes-from-linux-commandline/

作者：[Avishek Kumar][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.tecmint.com/author/avishek/
[1]:http://www.tecmint.com/execute-php-codes-functions-in-linux-commandline/
