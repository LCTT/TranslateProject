Xenlism WildFire: 一个精美的 Linux 桌面版主题
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icon-theme-linux-3.png)

有那么一段时间，我一直使用一个主题，没有更换过。可能是在最近的一段时间都没有一款主题能满足我的需求。有那么一些我认为是[Ubuntu 上最好的图标主题][1]，比如 Numix 和 Moka，并且，我一直也对 Numix 比较满意。

但是，一段时间后，我使用了[Xenslim WildFire][2]，并且我必须承认，他看起来太好了。Minimail 是当前比较流行的设计趋势。并且 Xenlism 完美的表现了它。平滑和美观。Xenlism 收到了诺基亚的 Meego 和苹果图标的影响。

让我们来看一下他的几个不同应用的图标:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons.png)

文件夹图标看起来像这样:

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons-1.png)

主题开发者，[Nattapong Pullkhow][3], 说，这个图标主题最适合 GNOME，但是在 Unity 和 KDE,Mate 上也表现良好。

### 安装 Xenlism Wildfire ###

Xenlism Theme 大约有 230 MB, 对于一个主题来说确实很大，但是考虑到它支持的庞大的软件数量，这个大小，确实也不是那么令人吃惊。

#### 在 Ubuntu/Debian 上安装 Xenlism ####

在 Ubuntu 的变种中安装前，用以下的命令添加 GPG 秘钥：

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

在 Ubuntu Unity, [可以使用 Unity Tweak Tool 来改变主题][4]. In GNOME, [使用 Gnome Tweak Tool 改变主题][5]. 我确信你会接下来的步骤，如果你不会，请来信通知我，我会继续完善这篇文章。

这就是 Xenlism 在 Ubuntu 15.04 Unity 中的截图。同时也使用了 Xenlism 桌面背景。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/09/Xenlism-icons-2.png)

这看来真棒，不是吗？如果你试用了，并且喜欢他，你可以感谢他的开发者：

> [Xenlism is a stunning minimal icon theme for Linux. Thanks @xenatt for this beautiful theme.][6]

我希望你喜欢他。同时也希望你分享你对这个主题的看法，或者你喜欢的主题。Xenlism 真的很棒，可能会替换掉你最喜欢的主题。

--------------------------------------------------------------------------------

via: http://itsfoss.com/xenlism-wildfire-theme/

作者：[Abhishek][a]
译者：[MikeCoder](https://github.com/MikeCoder)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/abhishek/
[1]:http://itsfoss.com/best-icon-themes-ubuntu-1404/
[2]:http://xenlism.github.io/wildfire/
[3]:https://plus.google.com/+NattapongPullkhow
[4]:http://itsfoss.com/install-numix-ubuntu/
[5]:http://itsfoss.com/install-switch-themes-gnome-shell/
[6]:https://twitter.com/share?text=Xenlism+is+a+stunning+minimal+icon+theme+for+Linux.+Thanks+%40xenatt+for+this+beautiful+theme.&via=itsfoss&related=itsfoss&url=http://itsfoss.com/xenlism-wildfire-theme/
