每日Ubuntu小技巧-更改Samba工作组和计算机名
================================================================================

这是另一个Ubuntu的新用户问的最多的问题。这个问题的答案很简单，但当你接触新事物时，你需要时间来完全理解它。

这是我们前几天收到的问题；

> 如何更改Samba的工作组名和Ubuntu的计算机名称？

对于大多数Ubuntu用户，改变他们的计算机名称是极少发生的事情，更别说samba工作组了。一些进阶使用者可能要学习如何用Ubuntu很简单的做到这一点。

当涉及到在Ubuntu中更改计算机名时，我们曾写过一个简单的帖子，可以点击[这里][1]找到。按照这个[怎样修改你的计算机名字][1]的简易指南来实现目的。 

也许还有其他方法来改变你在Ubuntu中的计算机名，但是这是最简单和最快的。对于那些使用Ubuntu系统的服务器，你可以用vi或vim编辑的主机名和主机文件。那些不了解这些编辑器的人也许很难使用vi或vim。 

在键盘上按**Ctrl – Alt – T**打开终端来更改Ubuntu中的Samba工作组。当终端打开时，运行以下命令来编辑的Samba的配置文件。 

    sudo gedit /etc/samba/smb.conf

打开这个文件后，请确保在[global]段中workgroup起始的那行的单词或值是你想要的工作组。例如，如果你希望工作组变成UBGP，将WORKGROUP替换成UBGP，并保存该文件。在大多数情况下，你必须重启动计算机以使之生效。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/workgroupubuntu.png)

以上就是如何在Ubuntu中更改你的计算机名以及工作组的方法。记住，如果你这样做是为了共享或访问Windows文件和文件夹，还必须​​安装Samba。没有Samba，你将难以与Windows共享文件。 

运行下面的命令安装Samba。

    sudo apt-get install samba
 
欢迎回来掌握更多的Ubuntu小技巧。

尽情享受吧！

---

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-change-samba-workgroup-and-computer-name/ 

译者：[crowner](https://github.com/crowner)，[whatever1992](https://github.com/whatever1992) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://linux.cn/article-2199-1.html
