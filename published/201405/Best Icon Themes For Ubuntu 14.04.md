五个 Ubuntu 14.04 最佳图标集
================================================================================
![](http://itsfoss.com/wp-content/uploads/2014/05/Ubuntu_Trusty_Tahr_Best_Icons.jpeg)

还在苦苦折腾让你的 Ubuntu 14.04 更加漂亮的方法吗？那就赶紧给你的系统换套图标吧！如果你还没发现哪些图标主题很棒，不用着急，我已经整理了一些适用于**Ubuntu 14.04的最佳图标集**。不过在欣赏这些图标集之前，我还是先向你介绍一下如何应用图标主题吧。

### 如何在 Ubuntu 系统中应用新图标集： ###

你可以通过两种方式来安装一个新的图标主题。一个是添加PPA源。你可以添加PPA软件源，然后安装某个图标集。但并不是所有的图标集可以通过该方法获得。所以，另一种方法就是，下载该图标集的压缩文件，然后将之解压到**~/.icons**文件夹。如果这个文件夹不存在的话，你可以使用下面的命令来新建：

    mkdir ~/.icons

解压到以上路径的图标只对当前用户有效。如果你希望所有的用户都可以使用该图标主题，你应该将该图标解压到**/usr/share/icons**。

到此，你已经安装了该图标。这样的话，你就可以使用[Unity Tweak Tool][1]来应用该图标主题。你可以使用下面的命令来安装 Unity Tweak Tool：

    sudo apt-get install unity-tweak-tool

安装完毕后，打开该软件，点击**外观**选项下面的**图标**：

![](http://itsfoss.com/wp-content/uploads/2014/05/Unity_Tweak_Tool.jpeg)

现在，你可以选择你所喜欢的图标集啦。到此为止，我想你已经掌握了如何在 Ubuntu 中更换图标，下面我们一起来欣赏 Ubuntu 中最棒的图标主题吧。

### Ubuntu 14.04最棒的图标主题： ###

废话不多说，我们一起来欣赏一些 Ubuntu Unity 桌面可用的图标主题吧（可能也支持Gnome桌面环境，小编未在该桌面环境下测试）：

#### Moka: ####

![](http://itsfoss.com/wp-content/uploads/2014/05/moka-Ubuntu-themes.jpeg)

你可以使用以下命令在 Ubuntu 以及同类的发行版中安装该图标主题：

    sudo add-apt-repository ppa:snwh/moka-icon-theme-daily
    sudo apt-get update
    sudo apt-get install moka-icon-theme moka-icon-theme-symbolic moka-icon-theme-extras

#### Numix: ####

![](http://itsfoss.com/wp-content/uploads/2014/05/Numix_Circle.jpeg)

上图中展示的是 Numix 圆形图标主题。一些相似的图标主题和壁纸资源也是可以通过 Numix PPA 软件源获得的：

    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install numix-icon-theme numix-icon-theme-circle

#### Uniform: ####

![](http://itsfoss.com/wp-content/uploads/2014/05/Uniform_Icons.jpeg)

你可以通过下面的链接获取该图标主题：

- [下载Uniform icon theme][2]

#### Plateau: ####

![](http://itsfoss.com/wp-content/uploads/2014/05/Plateau_Icon_Themes.jpeg)

你可以通过下面的链接获取该图标主题：

- [下载Plateau icon theme][3]

#### Simple [只支持Gnome桌面环境]: ####

![](http://itsfoss.com/wp-content/uploads/2014/05/simple_icon_theme.jpeg)

你可以通过下面的链接获取该图标主题：

- [下载Simple icon theme for Gnome][4]

到此，这一次精美图标主题介绍就结束了，但这绝不意味着终止。之后我还会继续给大家介绍更多的精美图标主题。此外，如果你有很棒的图标主题，而且没有在我们这次的**图标主题介绍**中提到，一定记得分享给我们哦。

--------------------------------------------------------------------------------

via: http://itsfoss.com/best-icon-themes-ubuntu-1404/

译者：[JonathanKang](https://github.com/JonathanKang) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://itsfoss.com/how-to-install-themes-in-ubuntu-13-10/
[2]:http://0rax0.deviantart.com/art/Uniform-Icon-Theme-453054609
[3]:http://malysss.deviantart.com/art/Plateau-0-2-391110900
[4]:http://www.deviantart.com/art/Simple-icon-theme-426040287
