在 Linux 下体验谷歌 Material风格的GTK和图标主题Paper
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Paper_theme_Material_Design.jpg)

[Paper][1]是一款即将与广大朋友们见面的一个图形工具包和图标主题，它的设计灵感来自于谷歌的设计语言[Material风格][2]。Paper由Sam Hewitt发起，Sam是[Moka项目][3]的一员，Moka总会设计出[让人满意的Ubuntu主题][4]。对于Paper，我敢说只要它一经推出，它必将是[最好的GTK主题开发包][5]之一。

对的，你没有听错，Paper主题还在开发阶段。因此我建议，如果你想在你的Ubuntu或者它的衍生版本上安装Paper，最好抱着试一试的实验心态。因为你多多少少会发现一些破损的图标，但这并不影响整体体验非常棒！

### 通过PPA在Ubuntu及其衍生版本上安装Paper主题 ###

Sam为Ubuntu和它的衍生版本设置了一个专用的PPA(Presonal Package Archives,个人软件包档案)。我推荐你通过PPA安装而不是下载Paper主题，因为你将会定期更新主题。这个PPA可供使用的系统有Ubuntu 15.04, Ubuntu 14.10, Ubuntu 14.04, Elementary OS Freya, Elementary OS Luna, Linux Mint 17, Linux Mint 16 和其它的Ubuntu衍生版本。

打开终端，输入下列命令：

    sudo add-apt-repository ppa:snwh/pulp
    sudo apt-get update
    sudo apt-get install paper-gtk-theme paper-icon-theme

### 下载Paper GTK和图标主题 ###


如果你不想用PPA，你可以手动下载主题和图标。但是就像刚才所说，这样你就无法自动更新。

- [下载Paper图标主题][6]
- [下载Paper的GTK主题][7]

#### 把它们用起来吧 ####

我希望你知道怎么在你的Ubuntu中安装或者更改主题。如果你不知道，下面几个教程将帮助你安装一个新的主题。

- [如何在标准Ubuntu中更改主题][8]
- [如何在GNOME Shell中更改主题][9]
- [如何在Ubuntu Mint中更改主题][10]
- [如何在Elementary OS Freya中更改主题][11]

#### 就是这样！ ####

因为我用过[Elementary OS Freya][12]一段时间，这里有一些看起来像Elementary OS Freya的Paper主题和图标的截图。我使用了一张Material Design风格的墙纸，这样可以更好的匹配主题和图标。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Material_Design_Paper_Theme_Elementary_OS_Freya_1.jpeg)

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Material_Design_Paper_Theme_Elementary_OS_Freya.jpeg)

How do you find this Material design inspired theme? If you did use it, do share the screenshot of your desktop with rest of us here.

你觉得这个Material风格的主题怎么样？如果你使用它的话，在评论里和我们分享你的桌面截图吧！

--------------------------------------------------------------------------------

via: http://itsfoss.com/install-paper-theme-linux/

作者：[Abhishek][a]
译者：[sevenot](https://github.com/sevenot)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://snwh.org/paper/
[2]:http://www.google.fr/design/spec/material-design/introduction.html
[3]:http://mokaproject.com/moka-icon-theme/
[4]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
[5]:http://itsfoss.com/gnome-shell-themes-ubuntu-1404/
[6]:https://github.com/snwh/paper-icon-theme
[7]:https://github.com/snwh/paper-gtk-theme
[8]:http://itsfoss.com/how-to-install-themes-in-ubuntu-13-10/
[9]:http://itsfoss.com/install-switch-themes-gnome-shell/
[10]:http://itsfoss.com/install-icon-linux-mint/
[11]:http://itsfoss.com/install-themes-icons-elementary-os-freya/
[12]:http://itsfoss.com/tag/elementary-os-freya/
