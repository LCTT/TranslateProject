用Python来SSH到你的机器
================================================================================
是时间写点python代码了。我爱自动化的东西,今天我将告诉大家怎么**使用python 通过ssh**连接你的机器并在上面运行命令。这并不难,但是用python来做也不是很简单,因为要用很多模块和库来完成这个任务。 你是不是很好奇本教程将会使用什么模块呢?

我们将使用Python中 pexpect 模块的 pxssh 类,它用于处理一些自动化的需求,比如ssh和ftp。想使你的系统管理生活尽可能的简单吗?那么,请关注本教程并且尝试尽可能多的学习吧。Ok,ok,我现在得到你的关注了,下面我将给出关于pxssh的一些简单的描述。你也可以在python交互shell导入pxssh 后，键入hepl(pxssh)以得到更多关于pxssh的信息。

**Pxssh 描述**

Pxssh 基于pexpect。它的类扩展pexpect.spawn 以专门用来设置SSH连接。我经常使用python的pxssh进行ssh连接。 Pxssh 使用shell提示符从远程主机来同步输出。为了使这更牛x，它把shell提示符设置的比$或#还独特。这应该可以在大多数Borne/bash或csh shell上工作。

你可以在[这里][1]看到更多关于pxssh。

现在开始欢乐吧.

第一步,我们导入所有需要的东西，并且给机器详情分配变量,就像图解1.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh1.png)

图解 1

之后我们创建一个函数，使用pxssh创建并开始一个到ssh服务器的连接。

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh2.png)

图解 2

请仔细学习我们是是怎么用try和except来处理错误的.在这里可以阅读更多关于python的错误处理.

下一步是什么?


下一步是在两个机器间的ssh连接建立之后，创建一个函数来给机器发送命令.

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh3.png)

图解 3

![](http://180016988.r.cdn77.net/wp-content/uploads/2013/10/ssh4.png)

图解 4

关闭文件并保存它. 现在它已经准备好可以运行了.

--------------------------------------------------------------------------------

via: http://www.unixmen.com/use-python-ssh-machine/

本文由 [LCTT][] 原创翻译，[Linux中国][] 荣誉推出

译者：[flsf][] 校对：[jasminepeng][]

[LCTT]:https://github.com/LCTT/TranslateProject
[Linux中国]:http://linux.cn/portal.php
[flsf]:http://linux.cn/space/flsf01
[jasminepeng]:http://linux.cn/space/jasminepeng

[1]:http://pexpect.sourceforge.net/pxssh.html
