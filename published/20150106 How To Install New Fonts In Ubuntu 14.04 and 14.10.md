如何在Ubuntu 14.04 和14.10 上安装新的字体
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/fonts.jpg)

Ubuntu默认自带了很多字体。但有时候你或许对这些字体还不满意。因此，你可以做的是在**Ubuntu 14.04、 14.10或者像Linux Mint之类的其它Linux系统中安装额外的字体**。

### 第一步: 获取字体 ###

第一步也是最重要的一步，下载你选择的字体。现在你或许在考虑从哪里下载字体。不要担心，Google搜索可以给你提供几个免费的字体网站。你可以先去看看[ Lost Type 的字体][1]。[Squirrel][2]同样也是一个下载字体的好地方。

### 第二步：在Ubuntu中安装新字体 ###

下载的字体文件可能是一个压缩包，先解压它。大多数字体文件的格式是[TTF][3] (TrueType字体) 或者[OTF][4] (OpenType字体)。无论是哪种，只要双击字体文件。它会自动用字体查看器打开。这里你可以在右上角看到安装选项。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Install_New_Fonts_Ubuntu.png)

在安装字体时不会看到其他信息。几秒钟后，你会看到状态变成已安装。不用猜，字体已经安装完毕。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Install_New_Fonts_Ubuntu_1.png)

安装完毕后，你就可以在GIMP、Pina等应用中看到你新安装的字体了。

### 第二步：在Linux上一次安装几个字体 ###

我没有打错。这仍旧是第二步但是只是一个备选方案。我们上面看到的在Ubuntu中安装字体的方法是不错的。但是这有一个小问题。当你有20个新字体要安装时。一个个单独双击即繁琐又麻烦。你不这么认为么？

要在Ubuntu中一次安装几个字体，你唯一要做的是在你的家目录下创建一个.fonts文件夹，如果它不存在的话。并把解压后的TTF和OTF文件复制到这个文件夹内。

在文件管理器中进入家目录。按下Ctrl+H [显示Ubuntu中的隐藏文件][5]。 右键创建一个文件夹并命名为.fonts。 这里的点很重要。在Linux中，在文件的前面加上点意味在普通的视图中都会隐藏。

#### 备选方案： ####

另外你可以安装字体管理程序，在图形用户界面管理字体。要在Ubuntu中安装字体管理程序，打开终端并输入下面的命令：

    sudo apt-get install font-manager


从Unity Dash中打开字体管理器。在这里你可以看到已安装的字体和安装新字体、删除字体等选项。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/01/Font_Manager_Ubuntu.jpeg)

要卸载字体管理器，使用下面的命令：

    sudo apt-get remove font-manager

我希望这篇文章可以帮助你在Ubuntu或其它Linux系统上安装字体。如果你有任何问题或建议请在下方评论中告诉我。

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-fonts-ubuntu-1404-1410/

作者：[Abhishek][a]
译者：[geekpi](https://github.com/geekpi)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://www.losttype.com/browse/
[2]:http://www.fontsquirrel.com/
[3]:http://en.wikipedia.org/wiki/TrueType
[4]:http://en.wikipedia.org/wiki/OpenType
[5]:http://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
