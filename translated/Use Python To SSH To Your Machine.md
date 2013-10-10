用Python来SSH到你的机器
================================================================================
是时间写点python代码了.我爱自动化的东西,这个时候我将告诉大家怎么通过**ssh using python**和命令连接你的机器.这不难,但是用python来做也不是很简单,因为要用很多模块和库来完成这个任务. 你是不是很好奇本教程将会使用什么模块?

我们将使用Python中的pxssh类和pexpect模块,它被用来对付一些自动化的需求,比如ssh和ftp.你想使你的系统管理生活尽可能的简单吗?那么,为什么不集中注意在本教程并且尝试尽可能多的学习?Ok,ok,我现在得到你的注意了,让我给你们一些关于pxssh简单的描述.你可以键入hepl(pxssh)得到更多关于pxssh的信息,之后把它import到一个python交互shell.

**Pxssh 描述**

Pxssh 基于pexpect.它的类扩展pexpect.spawn专门用来设置SSH连接.我经常使用python的pxssh进行ssh连接. Pxssh 使用shell命令提示从远程主机来同步输出.为了使这更牛x把shell提示符设置的更独特的一点,不仅仅用$或#.这应该可以在大多数Borne/bash或csh shell上工作.

你可以在[这里][1]看到更多关于pxssh.

现在开始欢乐吧.

第一步,我们import我们需要需要的一切并且给机器细目分配变量,就像图解1.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh1.png)

图解 1

之后我们创建一个函数来用pxssh建立并开始一个shh服务连接

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh2.png)

图解 2

仔细学习我们是是怎么用try和except来处理错误的.在这里可以阅读更多关于python的错误处理.

下一步是什么?


下一步是在两个机器的连接建立之后.创建一个函数来给机器发送命令.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh3.png)

图解 3

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh4.png)

图解 4

现在关闭文件并保存它. 现在它已经准备好可以运行了.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/use-python-ssh-machine/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf][] 校对：[校对者ID][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf]:http://linux.cn/space/flsf01
[校对者ID]:http://linux.cn/space/校对者ID

[1]:http://pexpect.sourceforge.net/pxssh.html
