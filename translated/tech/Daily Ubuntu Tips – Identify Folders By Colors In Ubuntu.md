每日Ubuntu技巧 - 在Ubuntu中通过色彩辨别文件夹
================================================================================
这里有一个简单的技巧来给你展示如何用这个漂亮的工具在Ubuntu 14.04 或者先前的版本中通过色彩辨别文件夹。这个工具称为**Folder Color**，它允许用户在Nautilus中改变文件夹的颜色，这样他们就能简单地与其他文件夹区别开来。

它被设计与Nautilus协同工作，可以在Ubuntu的其他图标主题中使用。它很容易安装。它轻量级且不会影响你系统的性能。

安装它很容易，这个简易的教程会接下来教你怎么做。

比如你希望将你重要的文件夹设成红色，或者旅行文档设成黄色，你可以使用'Folder Color'简单地改变它们。

这里是如何安装这个工具。

在Ubuntu，按下键盘的**Ctrl – Alt – T** 打开终端。当打开后，运行下面的命令加入PPA仓库。

    sudo add-apt-repository ppa:costales/folder-color

接下来，运行下面的命令来升级你的系统并安装‘Folder Color’

    sudo apt-get update && sudo apt-get install folder-color

就是这样。现在你要做的是登出并登陆回系统或者重启Nautils。接下来进入Nautilus，右键你想改变的文件夹，改变并选择颜色。预设的颜色可能没有你所需要的那么多，但是对普通用户足够了。

如果你希望卸载它，运行下面的命令来移除PPA仓库。

    sudo add-apt-repository -r ppa:costales/folder-color

最后，运行下面的命令卸载'Folder Color'

    sudo apt-get update && sudo apt-get remove folder-color

享受吧

![](http://www.liberiangeek.net/wp-content/uploads/2014/04/foldercolorubuntu.png)

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-identify-folders-by-colors-in-ubuntu/

译者：[geekpi](https://github.com/geekpi) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:
[2]:
[3]:
[4]:
[5]:
[6]:
[7]:
[8]:
[9]:
[10]:
[11]:
[12]:
[13]:
[14]:
[15]:
[16]:
[17]:
[18]:
[19]:
[20]:
