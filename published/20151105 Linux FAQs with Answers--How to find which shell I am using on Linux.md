Linux 有问必答：如何知道当前正在使用的 shell 是哪个？
================================================================================
> **问题**: 我经常在命令行中切换 shell。是否有一个快速简便的方法来找出我当前正在使用的 shell 呢？此外，我怎么能找到当前 shell 的版本？

### 找到你当前正在使用的 Shell 版本 ###

有多种方式可以查看你目前在使用什么 shell，最简单的方法就是通过使用 shell 的特殊参数。

其一，[一个名为 "$$" 的特殊参数][1] 表示当前你正在运行的 shell 实例的 PID。此参数是只读的，不能被修改。所以，下面的命令也将显示你正在运行的 shell 的名字：

    $ ps -p $$

      PID TTY          TIME CMD
    21666 pts/4    00:00:00 bash

上述命令可在所有可用的 shell 中工作。

如果你不使用 csh，找到当前使用的 shell 的另外一个办法是使用特殊参数 “$0” ，它表示当前正在运行的 shell 或 shell 脚本的名称。这是 Bash 的一个特殊参数，但也可用在其他 shell 中，如 sh、zsh、tcsh 或 dash。使用 echo 命令可以查看你目前正在使用的 shell 的名称。

    $ echo $0

    bash

不要被一个叫做 $SHELL 的单独的环境变量所迷惑，它被设置为你的默认 shell 的完整路径。因此，这个变量并不一定指向你当前使用的 shell。例如，即使你在终端中调用不同的 shell，$SHELL 也保持不变。

    $ echo $SHELL

    /bin/shell

![](https://c2.staticflickr.com/6/5688/22544087680_4a9c180485_c.jpg)

因此，找出当前的shell，你应该使用 $$ 或 $0，但不是 $SHELL。

### 找出当前 Shell 的版本 ###

一旦你知道你使用的是哪个 shell，你可能想知道此 shell 的版本。为此，在命令行中输入 shell 并在后面加上 “--version” 参数可以查看版本信息。例如：

**对于** bash **shell** :

    $ bash --version

    GNU bash, version 4.3.30(1)-release (x86_64-pc-linux-gnu)
    Copyright (C) 2013 Free Software Foundation, Inc.
    License GPLv3+: GNU GPL version 3 or later 
    
    This is free software; you are free to change and redistribute it.
    There is NO WARRANTY, to the extent permitted by law.

**对于** zsh **shell**:

    $ zsh --version

    zsh 5.0.7 (x86_64-pc-linux-gnu)

**对于** tcsh **shell**:
    $ tcsh --version

    tcsh 6.18.01 (Astron) 2012-02-14 (x86_64-unknown-linux) options wide,nls,dl,al,kan,rh,nd,color,filec

对于某些 shell，你还可以使用 shell 特定的变量（例如，$BASH_VERSION 或 $ZSH_VERSION）。

    $ echo $BASH_VERSION

    4.3.8(1)-release

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/which-shell-am-i-using.html

作者：[Dan Nanni][a]
译者：[strugglingyouth](https://github.com/strugglingyouth)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
[1]:http://ask.xmodulo.com/process-id-pid-shell-script.html
