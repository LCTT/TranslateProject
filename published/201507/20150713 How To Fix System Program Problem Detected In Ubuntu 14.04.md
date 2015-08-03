如何修复 ubuntu 中检测到系统程序错误的问题
================================================================================

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/system_program_Problem_detected.jpeg)

在过去的几个星期，（几乎）每次都有消息 **Ubuntu 15.04在启动时检测到系统程序错误** 跑出来“欢迎”我。那时我是直接忽略掉它的，但是这种情况到了某个时刻，它就让人觉得非常烦人了！

> 检测到系统程序错误(System program problem detected)
> 
> 你想立即报告这个问题吗？
> 
> ![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/System_Program_Problem_Detected.png)


我肯定地知道如果你是一个Ubuntu用户，你可能曾经也遇到过这个恼人的弹窗。在本文中，我们将探讨在Ubuntu 14.04和15.04中遇到"检测到系统程序错误(system program problem detected)"时	应该怎么办。
### 怎么解决Ubuntu中"检测到系统程序错误"的错误 ###

#### 那么这个通知到底是关于什么的？ ####

大体上讲，它是在告知你，你的系统的一部分崩溃了。可别因为“崩溃”这个词而恐慌。这不是一个严重的问题，你的系统还是完完全全可用的。只是在之前的某个时刻某个程序崩溃了，而Ubuntu想让你决定要不要把这个问题报告给开发者，这样他们就能够修复这个问题。

#### 那么，我们点了“报告错误”的按钮后，它以后就不再显示了？####

不，不是的！即使你点了“报告错误”按钮，最后你还是会被一个如下的弹窗再次“欢迎”一下：

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Ubuntu_Internal_error.png)

[对不起，Ubuntu发生了一个内部错误][1]是个Apport（LCTT 译注：Apport是Ubuntu中错误信息的收集报告系统，详见Ubuntu Wiki中的Apport篇），它将会进一步的打开网页浏览器，然后你可以通过登录或创建[Launchpad][2]帐户来填写一份漏洞（Bug)报告文件。你看，这是一个复杂的过程，它要花整整四步来完成。

#### 但是我想帮助开发者，让他们知道这个漏洞啊 !####

你这样想的确非常地周到体贴,而且这样做也是正确的。但是这样做的话，存在两个问题。第一，存在非常高的概率，这个漏洞已经被报告过了；第二，即使你报告了个这次崩溃，也无法保证你不会再看到它。

#### 那么，你的意思就是说别报告这次崩溃了？####

对，也不对。如果你想的话，在你第一次看到它的时候报告它。你可以在上面图片显示的“显示细节（Show Details)”中，查看崩溃的程序。但是如果你总是看到它，或者你不想报告漏洞（Bug)，那么我建议你还是一次性摆脱这个问题吧。

### 修复Ubuntu中“检测到系统程序错误”的错误 ###

这些错误报告被存放在Ubuntu中目录/var/crash中。如果你翻看这个目录的话，应该可以看到有一些以crash结尾的文件。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/07/Crash_reports_Ubuntu.jpeg)

我的建议是删除这些错误报告。打开一个终端，执行下面的命令：

    sudo rm /var/crash/*

这个操作会删除所有在/var/crash目录下的所有内容。这样你就不会再被这些报告以前程序错误的弹窗所扰。但是如果又有一个程序崩溃了，你就会再次看到“检测到系统程序错误”的错误。你可以再次删除这些报告文件，或者你可以禁用Apport来彻底地摆脱这个错误弹窗。

#### 彻底地摆脱Ubuntu中的系统错误弹窗 ####

如果你这样做，系统中任何程序崩溃时，系统都不会再通知你。如果你想问问我的看法的话，我会说，这不是一件坏事，除非你愿意填写错误报告。如果你不想填写错误报告，那么这些错误通知存不存在都不会有什么区别。

要禁止Apport，并且彻底地摆脱Ubuntu系统中的程序崩溃报告，打开一个终端，输入以下命令：

    gksu gedit /etc/default/apport

这个文件的内容是：

    # 设置0表示禁用Apportw，或者1开启它。
    # 你可以用下面的命令暂时关闭它：
    # sudo service apport start force_start=1
    enabled=1

把**enabled=1**改为**enabled=0**。保存并关闭文件。完成之后你就再也不会看到弹窗报告错误了。很显然，如果我们想重新开启错误报告功能，只要再打开这个文件，把enabled设置为1就可以了。

#### 你的有效吗？ ####

我希望这篇教程能够帮助你修复Ubuntu 14.04和Ubuntu 15.04中检测到系统程序错误的问题。如果这个小窍门帮你摆脱了这个烦人的问题，请让我知道。

--------------------------------------------------------------------------------

via: http://itsfoss.com/how-to-fix-system-program-problem-detected-ubuntu/

作者：[Abhishek][a]
译者：[XLCYun](https://github.com/XLCYun)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/how-to-solve-sorry-ubuntu-12-04-has-experienced-an-internal-error/
[2]:https://launchpad.net/
