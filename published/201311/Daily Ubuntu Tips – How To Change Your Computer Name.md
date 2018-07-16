每日Ubuntu小技巧——怎样修改你的计算机名字
================================================================================
本文又是一篇为Ubuntu新用户和新手准备的文章，将会指导你怎样在使用Ubuntu时轻松更改你的计算机名字，许多用户从来不会考虑在Ubuntu更改计算机名字或者主机名，那是他们最不用考虑担心的事情。

许多用户会使用安装Ubuntu过程中创建或设定的名字，但是对于想要知道怎么更改名字的新用户，可以继续接下来的学习。本文不是为Ubuntu专家所准备，是为那些刚刚开始使用Ubuntu的初学者用户。

那么，为什么你又想要更改你的计算机名字？如果除了想要学习怎样操作，你没有一个好的理由，那么就不要学了，反之，如果你有一个好的理由或者想要学习怎样操作，那么请继续。

按下 **Ctrl - Alt - T** 组合键，打开终端。
当终端打开，输入下列命令，使用gedit编辑hostname文件

    sudo gedit /etc/hostname

接下来，无论旧的计算机名字是什么，换一个新的吧。例如，如果你想要你的计算机名字为“RDOMNU”，先删除文件内容，输入 **RDOMNU**，然后保存文件。

然后，再输入下列命令来打开hosts文件

    sudo gedit /etc/hosts

更改第二行箭头标记位置的值，使它与你刚才输入的计算机名字相符，完成后保存文件。


![](http://www.liberiangeek.net/wp-content/uploads/2013/10/ubuntuhostnamechange.png)

就是这样！重启你的计算机，然后你的机器将会显示新的名字。这就是怎么改变Ubuntu机器的名字。

试一试吧！


--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-change-computer-name/

译者：[Vic___](https://blog.csdn.net/Vic___) 校对：[Caroline](https://github.com/carolinewuyan) 

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
