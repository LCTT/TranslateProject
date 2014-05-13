每日Ubuntu 小技巧 － 以色辨夹
================================================================================

这篇简短的文章将教会你如何在Ubuntu 14.04或者其先前版本中通过使用美化工具实现以颜色来分辨文件夹。这个工具就是**Folder Color**,它允许用户改变文件浏览器中的文件夹的颜色，这样就可以让用户很容易地识别并区分出它们来。


这个工具的开发者设计的初衷是与Nautilus配合使用，其实它也可以与Ubuntu上其它的图标主题配合使用。这是一个很好的工具，比较小不会影响你的系统的性能。

这个软件安装起来方便，让下面这个简短的教程告诉你如何做吧。

假如你想将重要的文件夹变成红色的，或者将文档文件夹变为黄色，你可以用Folder Color轻松地改变它们的颜色。

教你来安装这个工具。

在Ubuntu 中**Ctrl - Alt - T**打开终端。添加下面的PPA源。

    sudo add-apt-repository ppa:costales/folder-color


然后运行下面的命令更新你的系统并安装Folder Color。

    sudo apt-get update && sudo apt-get install folder-color

这样安装就可以了。现在你要做的就是注销登录然后再次登入系统或者重新启动Nautilus 。打开Nautilus ，在你想改变的颜色的文件夹上右键单击选择你想要的颜色。预先定义的颜色可能无法满足你的需要，但是对于大多数用户来说这足够了。


如果你想卸载它，运行下面的命令移除PPA源。

    sudo add-apt-repository -r ppa:costales/folder-color


最后，运行下面的命令移除Folder Color 。

    sudo apt-get update && sudo apt-get remove folder-color

使用愉快！

![](http://www.liberiangeek.net/wp-content/uploads/2014/04/foldercolorubuntu.png)

--------------------------------------------------------------------------------

via: http://www.liberiangeek.net/2014/04/daily-ubuntu-tips-identify-folders-by-colors-in-ubuntu/

译者：[译者ID](https://github.com/Linchenguang) 校对：[校对者ID](https://github.com/校对者ID)

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
