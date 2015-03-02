非Linux的自由开源软件：Homebrew
================================================================================
我日常工作中使用的是OS X。我能容忍它很大程序上是因为它的终端。如果我不能在黑色背景绿色文字的终端下工作，我想我会疯了。不幸的是，OS X 没有我需要的全部命令行工具。Homebrew的到来拯救了我。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1002061/11811fossf1.png)

Homebrew扮演了OS X中所缺乏的包管理器的角色。命令的使用很像apt-get，它能够安装无数的应用。一个最好的例子是wget。我很惊讶OS X中没有包含wget，但是homebrew中有，很简单就安装上了。

最棒的是homebrew在/usr/local文件夹下安装软件。你不必担心homebrew会破坏你的系统，因为它不会访问/usr/local之外的其他文件。OSX系统更新不会覆盖你的程序，并且/usr/local/bin已经在PATH中，使用homebrew安装的程序可以直接工作。

homebrew使用ruby管理它的包和功能，但是使用它不需要任何编程知识。并且安装过程只需要在命令行中复制粘贴就好了。如果你使用的是OS X，但是你希望像在Linux中那样方便地安装，就试一试homrbrew吧：[http://brew.sh][1]。

--------------------------------------------------------------------------------

via: http://www.linuxjournal.com/content/non-linux-foss-homebrew

作者：[Shawn Powers][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.linuxjournal.com/users/shawn-powers
[1]:http://brew.sh/
