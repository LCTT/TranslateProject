look: Linux 下验证拼写并显示以某字符串开头的行的命令
================================================================================
你有没有感到需要一款Linux下的命令行工具，它可以验证你的拼写？一款可以显示包含特定前缀字符串的行？好的，本篇中，我们会讨论Linux下的 **look**命令，它满足了上面的这些要求。

### Linux下的look命令 ###

下面是来自look命令man页面描述的截图：

![](http://mylinuxbook.com/wp-content/uploads/2013/12/look-main.png)

### 测试环境 ###

- **OS** – Ubuntu 13.04
- **Shell** – Bash 4.2.45
- **Application** – look 2.20.1-5.1ubuntu8

#### 简要教程 ####

现在让我们通过一些特定例子来讨论这个命令。

假设你要验证单词'rendezvous'的拼写。你可以轻松地用look命令做到。

这是个例子 :

    $ look rendez
    rendezvous
    rendezvous's
    rendezvoused
    rendezvouses
    rendezvousing

如你所见，我只传入了单词的前面几个字符作为命令行参数，命令产生了所有的相关单词。这些单词通过look命令从文件 **/usr/share/dict/words**取回。

另外一种情况是需要打印所有包含特定字符串的行。比如，如果我想要显示c文件中所有的头文件，那么我就用下面的方法：

    $ look "#include" efence_test.c 
    #include <stdio.h>
    #include <stdlib.h>

如你所见，它生成了所有的在文件efence_test.c中以"#include"开始的行，因此我知道了原文件中包含的头文件。

默认上，所有look命令的匹配都是大小写敏感的。你可以使用非大小写敏感匹配的选项**-f**。

下面是一些look命令提供了其他一些命令行选项：

![](http://mylinuxbook.com/wp-content/uploads/2013/12/look-options.png)

想要获取这个命令的更多信息，阅读这个 [man 页][1].

#### 下载/安装/配置 ####

下面是关于look命令的一些链接：

- 主页 [*如果你知道这个工具的主页的话让我知道一下*]
- 下载链接

look命令成了**util-linux**包的一部分，它在大多数Linux发行版中已经预安装了。

#### 优点 ####

- 非常容易地在命令行验证拼写。
- 在大多数Linux发行版中已经预安装。

#### 缺点 ####

- 依赖于/usr/share/dict/words 来做拼写验证。

#### 总结 ####

一款出色的用来验证拼写的命令行工具。节省了大量时间如果你想要显示以特定字符串为开头的行的话。试一下，你一定会喜欢上它的。

--------------------------------------------------------------------------------

via: http://mylinuxbook.com/look-verify-spellings-and-display-lines/

译者：[geekpi](https://github.com/geekpi) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.about.com/library/cmd/blcmdl1_look.htm