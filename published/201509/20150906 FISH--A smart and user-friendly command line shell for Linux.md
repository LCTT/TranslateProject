FISH：Linux 的一个智能易用的 Shell
================================================================================

FISH（friendly interactive shell）是一个用户友好的命令行 shell，主要是用来进行交互式使用。shell 就是一个用来执行其他程序的程序。

### FISH 特性 ###

#### 自动建议 ####

fish 会根据你的历史输入和补完来提供命令建议，就像一个网络浏览器一样。注意了，就是Netscape Navigator 4.0!

![](http://www.tecmint.com/wp-content/uploads/2015/07/Fish-Auto-Suggestion.gif)

#### 漂亮的VGA 色彩 ####

fish 原生支持 term256， 它就是一个终端技术的艺术国度。 你将可以拥有一个难以置信的、256 色的shell 来使用。

#### 理智的脚本 ####

fish 是完全可以通过脚本控制的，而且它的语法又是那么的简单、干净，而且一致。你甚至不需要去重写。

#### 基于 web 的配置 ####

对于少数能使用图形计算机的幸运儿， 你们可以在网页上配置你们自己的色彩方案，以及查看函数、变量和历史记录。

#### 帮助手册补全 ####

其它的 shell 支持可配置的补全， 但是只有 fish 可以通过自动转换你安装好的 man 手册来实现补全功能。

#### 开箱即用 ####

fish 将会通过 tab 补全和语法高亮使你非常愉快的使用shell， 同时不需要太多的学习或者配置。

### 在ubuntu 15.04 上安装FISH

打开终端，运行下列命令：

    sudo apt-add-repository ppa:fish-shell/release-2
    sudo apt-get update
    sudo apt-get install fish

###使用FISH###

打开终端，运行下列命令来启动FISH：

    fish

欢迎来到 fish，友好的交互式shell，输入指令 help 来了解怎么使用fish。

阅读[FISH 文档][1] ，掌握使用方法。

--------------------------------------------------------------------------------

via: http://www.ubuntugeek.com/fish-a-smart-and-user-friendly-command-line-shell-for-linux.html

作者：[ruchi][a]
译者：[oska874](https://github.com/oska874)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.ubuntugeek.com/author/ubuntufix
[1]:http://fishshell.com/docs/current/index.html#introduction
