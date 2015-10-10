Xenlism WildFire:  Linux 桌面的极简风格图标主题
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icon-theme-linux-3.png)

有那么一段时间我没更换主题了，可能最近的一段时间没有一款主题能让我眼前一亮了。我考虑过更换 [Ubuntu 上最好的图标主题][1]，但是它们和 Numix 和 Moka 差不多，而且我觉得 Numix 也不错。

但是前几天我试了试 [Xenslim WildFire][2]，我必须承认，它看起来太棒了。极简风格是设计界当前的流行趋势，而 Xenlism 完美的表现了这种风格。平滑而美观，Xenlism 显然受到了诺基亚的 Meego 和苹果图标的影响。

让我们来看一下它的几个不同应用的图标:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons.png)

文件夹图标看起来像这样:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons-1.png)

主题开发者 [Nattapong Pullkhow][3] 说，这个图标主题最适合 GNOME，但是在 Unity 和 KDE，Mate 上也表现良好。

### 安装 Xenlism Wildfire ###

Xenlism Theme 大约有 230 MB, 对于一个主题来说确实很大，但是考虑到它所支持的庞大的软件数量，这个大小，确实也不是那么令人吃惊。

#### 在 Ubuntu/Debian 上安装 Xenlism ####

在 Ubuntu 系列中安装之前，用以下的命令添加 GPG 秘钥：

    sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 90127F5B

添加完成之后，输入如下的命令进行安装：

    echo "deb http://downloads.sourceforge.net/project/xenlism-wildfire/repo deb/" | sudo tee -a /etc/apt/sources.list
    sudo apt-get update
    sudo apt-get install xenlism-wildfire-icon-theme

除了主题之外，你也可以选择是否下载配套的桌面背景图：

    sudo apt-get install xenlism-artwork-wallpapers

#### 在 Arch 上安装 Xenlism ####

你需要编辑 Pacman 软件仓库。在终端中使用如下命令：

    sudo nano /etc/pacman.conf

添加如下的代码块，在配置文件中:

    [xenlism-arch]
    SigLevel = Never
    Server = http://downloads.sourceforge.net/project/xenlism-wildfire/repo/arch

更新系统并且安装：

    sudo pacman -Syyu
    sudo pacman -S xenlism-wildfire

#### 使用 Xenlism 主题 ####

在 Ubuntu Unity, [可以使用 Unity Tweak Tool 来改变主题][4]。 在 GNOME 中，[使用 Gnome Tweak Tool 改变主题][5]。 我确信你会接下来的步骤，如果你不会，请来信通知我，我会继续完善这篇文章。

这就是 Xenlism 在 Ubuntu 15.04 Unity 中的截图。同时也使用了 Xenlism 桌面背景。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons-2.png)

这看来真棒，不是吗？如果你试用了，并且喜欢它，你可以感谢它的开发者：

> [Xenlism 是一个用于 Linux 的、令人兴奋的极简风格的图标主题，感谢 @xenatt 做出这么漂亮的主题。][6]

我希望你喜欢它。同时也希望你分享你对这个主题的看法，或者你喜欢的主题。Xenlism 真的很棒，可能会替换掉你最喜欢的主题。

--------------------------------------------------------------------------------

via: http://itsfoss.com/xenlism-wildfire-theme/

作者：[Abhishek][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
[2]:http://xenlism.github.io/wildfire/
[3]:https://plus.google.com/+NattapongPullkhow
[4]:http://itsfoss.com/install-numix-ubuntu/
[5]:http://itsfoss.com/install-switch-themes-gnome-shell/
[6]:https://twitter.com/share?text=Xenlism+is+a+stunning+minimal+icon+theme+for+Linux.+Thanks+%40xenatt+for+this+beautiful+theme.&via=itsfoss&related=itsfoss&url=http://itsfoss.com/xenlism-wildfire-theme/
