从命令行访问Linux命令小抄
================================================================================
Linux命令行的强大在于其灵活及多样化，各个Linux命令都带有它自己专属的命令行选项和参数。混合并匹配这些命令，甚至还可以通过管道和重定向来联结不同的命令。理论上讲，你可以借助几个基本的命令来产生数以百计的使用案例。甚至对于浸淫多年的管理员而言，也难以完全使用它们。那正是命令行小抄成为我们救命稻草的一刻。

[![](https://farm6.staticflickr.com/5562/14752051134_5a7c3d2aa4_z.jpg)][1]

我知道联机手册页（man）仍然是我们的良师益友，但我们想通过我们能自行支配的快速参考卡让这一切更为高效和有目的性。最终极的小抄可能被自豪地挂在你的办公室里，也可能作为PDF文件隐秘地存储在你的硬盘上，或者甚至设置成了你的桌面背景图。

做为一个选择，也可以通过另外一个命令来访问你最爱的命令行小抄。那就是，使用[cheat][2]。这是一个命令行工具，它可以让你从命令行读取、创建或更新小抄。这个想法很简单，不过cheat经证明是十分有用的。本教程主要介绍Linux下cheat命令的使用方法。你不需要为cheat命令做个小抄了，它真的很简单。

### 安装Cheat到Linux ###

首先，如果你还没有Git，那么就安装一个吧：

    $ sudo apt-get install git (Debian-based system)
    $ sudo yum install git (RedHat-based system)

同时，安装[Python包安装器pip][3]。

最后，使用下列命令来安装cheat。

    $ sudo pip install docopt pygments
    $ git clone https://github.com/chrisallenlane/cheat.git
    $ cd cheat
    $ sudo python setup.py install 

### 配置Cheat ###

cheat命令并不需要太多配置。

一个推荐的配置是启用命令行补全功能。那样，当你查询一个小抄时，就可以使用[TAB]键来自动补全你想要查看的命令名称了。以下操作可以启用bash下的自动补全功能。

    $ wget https://github.com/chrisallenlane/cheat/raw/master/cheat/autocompletion/cheat.bash
    $ sudo cp cheat.bash /etc/bash_completion.d/

他们也提供了用于其它shell的自动补全脚本，像zsh和fish也有。

另外一个要做的事是定义EDITOR环境变量。该变量应该指向创建或更新小抄时你想要用的文本编辑器。例如，如果你想要使用Vim编辑器，那就把下面的内容放进~/.bashrc。

    export EDITOR=/usr/bin/vim

注销并重新登录进来，以激活自动补全功能并更新.bashrc。

### Cheat基本用法 ###

cheat命令一个很酷的事是，它自带有超过90个的常用Linux命令的内建小抄。查看可用的小抄列表：

    $ cheat -l 

![](https://farm3.staticflickr.com/2932/14754370585_7133cbbc8c_z.jpg)

要访问某个指定命令的小抄，只要运行cheat命令，后面跟上该命令的名称：

    $ cheat <command-name> 

![](https://farm4.staticflickr.com/3899/14567722899_8b86c312ca_z.jpg)

你可以通过使用“-s”选项，在所有小抄中搜索包含有指定关键词的内容：

    $ cheat -s <keyword> 

在许多情况下，小抄适用于某些人，而对另外一些人却没什么帮助。要想让内建的小抄更具个性化，cheat命令也允许你创建新的小抄，或者更新现存的那些。要这么做的话，cheat命令也会帮你在本地~/.cheat目录中保存一份小抄的副本。

要使用cheat的编辑功能，首先确保EDITOR环境变量设置为你默认编辑器所在位置的完整路径。然后，复制（不可编辑）内建小抄到~/.cheat目录。你可以通过下面的命令找到内建小抄所在的位置。一旦你找到了它们的位置，只不过是将它们拷贝到~/.cheat目录。

    $ cheat -d 

----------

    /usr/lib/python2.6/site-packages/cheat/cheatsheets

----------

    $ cp /usr/lib/python2.6/site-packages/cheat/cheatsheets/* ~/.cheat

现在，你可以使用“-e”选项来创建或更新一个小抄了：

    $ cheat -e openssl 

正如你所能想象的，cheat的编辑功能十分有用，可以帮助你剪裁本地小抄库以满足你的需要。如果你深信知识分享，贡献你的小抄到cheat命令的[官方Git仓库][4]中，你会更加受欢迎，这样大家都能从中受益。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/07/access-linux-command-cheat-sheets-command-line.html

作者：[Dan Nanni][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/nanni
[1]:http://xkcd.com/1168/
[2]:https://github.com/chrisallenlane/cheat
[3]:http://ask.xmodulo.com/install-pip-linux.html
[4]:https://github.com/chrisallenlane/cheat
