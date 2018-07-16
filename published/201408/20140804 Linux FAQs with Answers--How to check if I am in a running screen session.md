Linux FAQ与答案：如何检查我是否处于一个运行着的screen会话中
================================================================================
>**问题**：我经常使用screen命令来运行多个伪终端会话。好多次，我发现都记不得自己是否在一个screen会话中，还是在一个常规终端中。是否有一种简便的方法来检查我是否在一个运行着的screen会话中？

一个快捷而又简单的方法来检查你是否处于一个screen伪终端中，还是在一个常规终端中，就是检查STY环境变量。当调用了screen，就会把STY变量值设置为会话名。因此，如果STY环境变量被设置为任何非空字符串，就意味着你正处于一个screen会话中。

     $ echo $STY 

> 2858.pts-3.my_host

然而，请注意，上面的方法**只有当**你是在本地计算机上运行screen命令的时候。如果你从本地计算机的screen会话中SSH到任何远程计算机上，远程计算机上的STY变量不会被设置，尽管在技术上看，你仍然处于一个screen会话中。

事实上，一个更为可靠的检查你是否处于一个screen会话中的方法，是按“Ctrl-a”+“Ctrl-t”。如果你处于screen会话中，终端会在底部显示时间信息。

![](https://farm6.staticflickr.com/5578/14821730712_6a139d72e9_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/check-running-screen-session.html

译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出
