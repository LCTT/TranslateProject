每日Ubuntu小技巧——怎样修改你的计算机名字
================================================================================
其他blog更新过，这篇是面向新Ubuntu用户和初学者。这篇blog告诉你当在使用Ubuntu时怎么样简单改变你的计算机名字。许多用户将再也不用担心在Ubuntu上怎么改变他们的计算机名字和主机名，至少这是他们关心的。

许多人会使用创建好的名字或者安装的时候会给机器一个名字。但是对于那些新用户想要知道怎么做到改名字，请继续接下来的学习。这篇不是给专家的，是为那些刚刚开始使用Ubuntu的初学者用户。

所以，你为什么不想再一次改变你的计算机名字？如果你没有一个好的原因比学习怎么做更好，那就不要。如果你有一个好的理由学习怎么做，那就跟着学。

按下 **Ctrl – Alt – T** 组合键，打开终端。
当终端打开，输入下列命令，使用gedit编辑hostname文件

    sudo gedit /etc/hostname

接下来，无论文件里面有什么，改变一个新的计算机名字吧。例如，如果你想要你的计算机名字为“RDOMNU”，先删除文件内容，输入 **RDOMNU**，然后保存文件。

然后，输入下列命令来打开hosts文件

    sudo gedit /etc/hosts

改变第二行下面所指你早先输入的计算机名字的值，完后后保存。


![](http://www.liberiangeek.net/wp-content/uploads/2013/10/ubuntuhostnamechange.png)

就是这样！重启你的计算机，然后你的机器将会显示新的名字。这就是怎么改变Ubuntu机器的名字。

享受吧！


--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-change-computer-name/

译者：[Vic___](https://blog.csdn.net/Vic___) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出