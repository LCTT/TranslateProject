<<<<<<< HEAD
每日Ubuntu小技巧-更改Samba工作组和计算机名
================================================================================
这是另一个Ubuntu的新用户问的最多的问题。这个问题的答案很简单，但当你接触新事物时，你需要时间来完全理解它。

这是我们前几天收到的问题；

> 如何更改Samba的工作组名和Ubuntu的计算机名称？

对于大多数Ubuntu用户，改变他们的计算机名称是极少发生的事情，更别说samba工作组了。一些进阶使用者可能要学习如何用Ubuntu很简单的做到这一点。

当涉及到在Ubuntu中更改计算机名时，我们曾写过一个简单的帖子，可以点击这里[这里][1]找到。按照这个简易指南[changing your computer name in Ubuntu][1]来实现要求。 

也许还有其他方法来改变你在Ubuntu中的计算机名，但是这是最简单和最快的。对于那些使用Ubuntu系统的服务器，你可以用vi或vim编辑的主机名和主机文件。那些不了解这些编辑器的人也许很难使用vi或vim。 

在键盘上按**Ctrl – Alt – T**打开终端来更改Ubuntu中的Samba工作组。当终端打开时，运行以下命令来编辑的Samba的配置文件。 

    sudo gedit /etc/samba/smb.conf

打开这个文件后，请确保在[global]段中workgroup起始的那行的单词或值是你想要的工作组。例如，如果你希望工作组变成UBGP，将WORKGROUP替换成UBGP，并保存该文件。在大多数情况下，你必须重启动计算机以使之生效。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/workgroupubuntu.png)

以上就是如何在Ubuntu中更改你的计算机名以及工作组的方法。记住，如果你这样做是为了共享或访问Windows文件和文件夹，还必须​​安装Samba。没有Samba，你将难以与Windows共享文件。 

To install Samba, run the commands below.

运行下面的命令安装Samba。

    sudo apt-get install samba
 
欢迎回来掌握更多的Ubuntu小技巧。

尽情享受吧！
=======
Ubuntu小贴士-改变Samba工作组和计算机名
================================================================================
这里还有另一个Ubuntu新手经常问的问题，答案很简单，但是对于新人来说完全理解需要花费一些时间。

这里有一些我们几天前收到的问题:

> 怎样在Ubuntu里改变Samba工作组和计算机名？

对于大多数的Ubuntu用户来说，给计算机改一个名字一定会在最低限度完成的列表上，更不用说Samba工作组了，一些少量的高级用户或者也会想轻松地在使用Ubuntu时做到这些。

如果是在Ubuntu里改变计算机名这个问题的话，我们之前已经写过一个简单的文章了，你真可以在[这里][1]找到。紧紧跟随[在Ubuntu里改变计算机名(changing your computer name in Ubuntu)][1]这篇向导性文章就可以达到你的目标。

或许还有别的方法可以在Ubuntu里改变你的计算机名但是这是最简单而快速的方法。对于那些使用Ubuntu服务器的，你可以使用Vi或者Vim编辑hostname和host等文件。使用Vi或者Vim对大多数人有点儿难，所以只有部分由使用这些编辑器的知识的人才会使用它。

要在Ubuntu里改变Samba工作组，按下键盘上的**Ctrl – Alt – T** 打开终端。但它（终端）打开后，运行下面的命令以编辑Samba的配置文件。

    sudo gedit /etc/samba/smb.conf

这个文件打开之后，确定在[global]段的以workgroup开头的行有你想要起给工作组的名字。例如，如果你想要让工作组叫UBGP，将WORKGROUP替换成UBGP然后保存文件。在大多数情况下，你会必须重启计算机以应用这些改变。

![](http://www.liberiangeek.net/wp-content/uploads/2013/11/workgroupubuntu.png)

这就是怎样在Unbuntu里改变你的计算机的名字和它的工作组。切记，如果你想做这些以分享或者访问Windows的文件或者文件夹，你必须安装Samba。离了Samba，和Windows共享文件会很难。

运行以下命令以安装Samba。

    sudo apt-get install samba

请继续关注和访问更多关于Ubuntu的小贴士。

尽情享受吧!
>>>>>>> c011190f089700f3e40aad9289d60f1a5b609f05

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2013/11/daily-ubuntu-tips-change-samba-workgroup-and-computer-name/

<<<<<<< HEAD
译者：[whatever1992](https://github.com/whatever1992) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-change-computer-name/
=======
译者：[crowner](https://github.com/crowner) 校对：[wxy](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://www.liberiangeek.net/2013/10/daily-ubuntu-tips-change-computer-name/
>>>>>>> c011190f089700f3e40aad9289d60f1a5b609f05
