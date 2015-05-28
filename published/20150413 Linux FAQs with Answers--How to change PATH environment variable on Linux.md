Linux有问必答：如何在Linux中修改环境变量PATH
================================================================================
> **提问**: 当我试着运行一个程序时，它提示“command not found”。 但这个程序就在/usr/local/bin下。我该如何添加/usr/local/bin到我的PATH变量下，这样我就可以不用指定路径来运行这个命令了。

在Linux中，PATH环境变量保存了一系列的目录用于用户在输入的时候搜索命令。PATH变量的值由一系列的由分号分隔的绝对路径组成。每个用户都有特定的PATH环境变量（由系统级的PATH变量初始化）。

要检查用户的环境变量，用户模式下运行下面的命令：

    $ echo $PATH

----------

    /usr/lib64/qt-3.3/bin:/bin:/usr/bin:/usr/sbin:/sbin:/home/xmodulo/bin

或者运行：

    $ env | grep PATH

----------

    PATH=/usr/lib64/qt-3.3/bin:/bin:/usr/bin:/usr/sbin:/sbin:/home/xmodulo/bin

如果你的命令不存在于上面任何一个目录内，shell就会抛出一个错误信息：“command not found”。

如果你想要添加一个另外的目录（比如：/usr/local/bin）到你的PATH变量中，你可以用下面这些命令。

### 为特定用户修改PATH环境变量 ###

如果你只想在当前的登录会话中临时地添加一个新的目录（比如：/usr/local/bin）给用户的默认搜索路径，你只需要输入下面的命令。

    $ PATH=$PATH:/usr/local/bin

检查PATH是否已经更新：

    $ echo $PATH

----------

    /usr/lib64/qt-3.3/bin:/bin:/usr/bin:/usr/sbin:/sbin:/home/xmodulo/bin:/usr/local/bin

更新后的PATH会在当前的会话一直有效。然而，更改将在新的会话中失效。

如果你想要永久更改PATH变量，用编辑器打开~/.bashrc (或者 ~/.bash_profile)，接着在最后添加下面这行。

    export PATH=$PATH:/usr/local/bin

接着运行下面这行永久激活更改：

    $ source ~/.bashrc (或者 source ~/.bash_profile)

### 改变系统级的环境变量 ###

如果你想要永久添加/usr/local/bin到系统级的PATH变量中，像下面这样编辑/etc/profile。

    $ sudo vi /etc/profile

----------

    export PATH=$PATH:/usr/local/bin

你重新登录后，更新的环境变量就会生效了。

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/change-path-environment-variable-linux.html

作者：[Dan Nanni][a]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://ask.xmodulo.com/author/nanni
