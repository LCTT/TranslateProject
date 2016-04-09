如何在 Linux 上运行命令前临时清空 Bash 环境变量
================================================================================
我是个 bash shell 用户。我想临时清空 bash shell 环境变量。但我不想删除或者 unset 一个输出的环境变量。我怎样才能在 bash 或 ksh shell 的临时环境中运行程序呢？

你可以在 Linux 或类 Unix 系统中使用 env 命令设置并打印环境。env 命令可以按命令行指定的变量来修改环境，之后再执行程序。

### 如何显示当前环境？ ###

打开终端应用程序并输入下面的其中一个命令：

    printenv

或

    env

输出样例：

![Fig.01： Unix/Linux： 列出所有环境变量](http://s0.cyberciti.org/uploads/faq/2015/08/env-unix-linux-command-output.jpg)

*Fig.01： Unix/Linux： 列出所有环境变量*

### 统计环境变量数目 ###

输入下面的命令：

    env | wc -l
    printenv | wc -l    # 或者

输出样例：

    20

### 在干净的  bash/ksh/zsh  环境中运行程序 ###

语法如下所示：

    env -i your-program-name-here arg1 arg2 ...

例如，要在不使用 http_proxy 和/或任何其它环境变量的情况下运行 wget 程序。临时清除所有 bash/ksh/zsh 环境变量并运行 wget 程序：

    env -i /usr/local/bin/wget www.cyberciti.biz
    env -i wget www.cyberciti.biz     # 或者

这当你想忽视任何已经设置的环境变量来运行命令时非常有用。我每天都会多次使用这个命令，以便忽视 http_proxy 和其它我设置的环境变量。

#### 例子：使用 http_proxy ####

    $ wget www.cyberciti.biz
    --2015-08-03 23:20:23--  http://www.cyberciti.biz/
    Connecting to 10.12.249.194:3128... connected.
    Proxy request sent, awaiting response... 200 OK
    Length: unspecified [text/html]
    Saving to: 'index.html'
    index.html                 [  <=>                         ]  36.17K  87.0KB/s   in 0.4s
    2015-08-03 23:20:24 (87.0 KB/s) - 'index.html' saved [37041]

#### 例子：忽视 http_proxy ####

    $ env -i /usr/local/bin/wget www.cyberciti.biz
    --2015-08-03 23:25:17--  http://www.cyberciti.biz/
    Resolving www.cyberciti.biz... 74.86.144.194
    Connecting to www.cyberciti.biz|74.86.144.194|:80... connected.
    HTTP request sent, awaiting response... 200 OK
    Length: unspecified [text/html]
    Saving to: 'index.html.1'
    index.html.1               [  <=>                         ]  36.17K   115KB/s   in 0.3s
    2015-08-03 23:25:18 (115 KB/s) - 'index.html.1' saved [37041]

-i 选项使 env 命令完全忽视它继承的环境。但是，它并不会阻止你的命令（例如 wget 或 curl）设置新的变量。同时，也要注意运行 bash/ksh shell 的副作用：

    env -i env | wc -l ## 空的 ##
    # 现在运行 bash ##
    env -i bash
    ## bash 设置了新的环境变量 ##
    env | wc -l

#### 例子：设置一个环境变量 ####

语法如下：

    env var=value /path/to/command arg1 arg2 ...
    ## 或 ## 
    var=value  /path/to/command arg1 arg2 ...

例如设置 http_proxy:

    env http_proxy="http://USER:PASSWORD@server1.cyberciti.biz:3128/" /usr/local/bin/wget www.cyberciti.biz

--------------------------------------------------------------------------------

via: http://www.cyberciti.biz/faq/linux-unix-temporarily-clearing-environment-variables-command/

作者：Vivek Gite
译者：[ictlyh](https://github.com/ictlyh)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出