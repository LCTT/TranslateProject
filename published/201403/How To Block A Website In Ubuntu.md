如何在Ubuntu中屏蔽一个网站
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/02/block-websites.jpg)

亲爱的**ubuntu**极客们，

在本教程中我将教你如何通过编辑**/etc/hosts**文件来屏蔽在Ubuntu Linux上不受欢迎的网站，这是用来处理DNS和Linux网络的系统文件。

我很喜欢这种方法，因为我不需要依靠第三方应用程序，这是非常容易使用的。您需要做的就是在**/etc/hosts文件**文件中做一个简单的变化。

请确保您有使用此方法时在机器上处于root用户访问状态，因为**/etc/hosts文件**文件由root用户拥有的，所以它不能被不被普通用户编辑。

编辑 **/etc/hosts** 文件您需要什么？root权限和一个文本编辑器。

在本教程中我将用我喜欢的文本编辑器，vim。好了，打开一个新的终端（**CTRL+ALT+T**），然后运行下面的命令来打开/etc/hosts文件进行编辑。

    vim /etc/hosts

添加下面这行

    127.0.0.1   domain.com

更换domain.com为你要屏蔽的网站，你完成了编辑处理后，保存该文件并退出。

现在是时候来测试该方法是否成功了。尝试访问你屏蔽的网站。

我的表弟是沉迷于Facebook的社交网络，每次他发现我的笔记本电脑的时候，他就打开它，并去facebook.com陪陪他的朋友。

我应该怎么做呢？

我编辑**/etc/hosts**文件，这样他想访问的网站就像已关闭了一样。

您也可以使用这个方法来保护孩子免受互联网成人内容的危害，如色情和恐怖电影。

--------------------------------------------------------------------------------

via: http://www.unixmen.com/block-website-ubuntu/

译者：[乌龙茶](https://github.com/yechunxiao19) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
