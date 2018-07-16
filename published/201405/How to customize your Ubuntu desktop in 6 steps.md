教你6步定制你的Ubuntu桌面
================================================================================
![](http://www.muktware.com/wp-content/uploads/2014/05/ubuntu-customize-1.jpg)
对于那些想要一个易于使用的界面的用户，Ubuntu是一个很好的Linux发行版，并且对于一个Linux新手也可以说是最好的Linux发行版。不过这产生了一些副作用，那就是，对于界面和外观，Canonical公司已经为用户做了很多设定，尤其是Unity桌面环境。

然而这些不是一成不变的。下面是一些关于怎样让你更加舒心地使用Ubuntu的技巧。看过上面的截图中我对Ubuntu的设定，你可以看到我的的Unity桌面，相比于默认设定的桌面有何不同。

下面让我们分步来实现定制Ubuntu桌面。

### 1. 安装Unity Tweak Tool ###

在你能对Ubuntu外观做任何有效地修改之前，你不得不安装[Unity Tweak Tool][1]。这是一个Unity桌面环境下特殊设置管理软件，并且通过它你可以实现替换系统图标和主题。你可以从Ubuntu软件中心下载该软件，如果你更加偏爱terminal终端的话，你也可以使用下面的命令：

    sudo apt-get install unity-tweak-tool

如果你正在使用Gnome桌面环境，那么你可能需要尝试Gnome Tweak Tool这款软件。你也可以从Ubuntu软件中心和使用以下命令来安装该软件：

    sudo apt-get install gnome-tweak-tool

### 2. 安装GTK主题 ###

对于Ubuntu有很多定制的主题，这些主题可以影响应用和窗口的外观。我正在使用的主题是Numix GTK+。你可以在[http://numixproject.org/][2]找到关于Numix主题和图标的更多信息。你可以通过打开终端并输入以下命令来安装Numix主题：

    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update && sudo apt-get install numix-gtk-theme

为了使该主题生效，我们需要打开Unity Tweak Tool，选择“外观标题”下的“主题”选项，然后在“已有主题”一栏中选择该主题。只要相应的软件仓库名字一致，对于其他主题，你可以重复该过程来应用。你可以访问[Gnome-Look.org][3]获得更多的主题。另一个和Numix主题很相似的主题是Moka，你可以在[http://mokaproject.com/][4]获得更多关于Moka主题的信息。

### 3. 安装图标 ###

以上截图中使用的图标是来自Numix主题的Numix圆形图标。你可以通过在终端输入以下命令来安装该图标集：

    sudo apt-add-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install numix-icon-theme-circle

为了使该图标集生效，我们需要在Unity Tweak Tool中选择“图标”选项，然后选择该图标集。再一次声明，这个方法对于任何图标集是可行的。Moka也提供给你的桌面带来多彩的、一致性设计的图标集。

### 4. 安装conky系统监视软件 ###

Conky是一个轻量级桌面系统监视软件。该软件本身是非常简单的，不过它是可定制的，这样一来它就可以显示很多的有用的信息。你可以通过在终端输入以下命令来安装Conky：

    sudo apt-get install conky conky-all

你将会需要curl这个软件，你可以通过以下这个命令来安装该软件：

    sudo apt-get install curl

上面截图中使用的conky主题是[Harmattan][5]，它可以以15种不同的样式来显示时间、天气、以及系统进程。要安装该主题，你可以从[deviantART][6]下载zip文件，然后解压。将.conky-weather文件夹和位于主题文件夹的.conkyrc文件（你可能需要按Ctrl+H来显示这些隐藏文件）移动到你的home文件夹。Conky有[很多的主题][7]。尝试这些主题，你所需要做的就是用所要使用主题的.conkyrc文件替换在home文件夹的.conkyrc文件。

### 5. 安装一些指示器程序 ###

有很多第三方的指示器程序，通过这些程序你可以监视你的桌面信息，例如天气、系统性能等。我所使用的指示器程序相当简单。因为天气和系统性能已经在conky中显示，所以我没有安装这些指示器。不过你可以在终端输入以下命令来安装他们：

    sudo apt-get install indicator-weather
    sudo apt-get install indicator-multiload

我所使用的两个指示器程序是大小写指示程序以及触摸板控制器，这是因为我的笔记本没有大小写指示灯和控制触摸板开关的热键。你可以通过以下命令来安装这两个软件：

    sudo add-apt-repository ppa:tsbarnes/indicator-keylock
    sudo add-apt-repository ppa:atareao/atareao
    sudo apt-get update
    sudo apt-get install indicator-keylock
    sudo apt-get install touchpad-indicator

你可能需要注销并重新登录来使用这些应用。

### 6. 通过Compiz设置管理器深度定制你的桌面 ###

如果对于你来说Unity Tweak Tool不够强大，那么你可以尝试[Compiz设置管理器][8].

**警告:**

如果错误的设置被应用的话，Compiz设置管理器可能会损害到你的系统。所以使用时要格外小心。你可以看到Ubuntu系统中隐藏的各种设置。你可以在Ubuntu软件中心获取该软件或者终端输入以下命令来安装：

    sudo apt-get install compiz compizconfig-settings-manager compiz-fusion-plugins-extra compiz-fusion-plugins-main compiz-plugins

现在你的Ubuntu桌面变得具有超棒了！所有的这些步骤都有成千上万种选择，所以折腾是无极限的。还在等什么？还不赶紧去享受你的新Ubuntu桌面！

--------------------------------------------------------------------------------

via: http://www.muktware.com/2014/05/customize-ubuntu-desktop-6-steps/26750

译者：[JonathanKang](https://github.com/JonathanKang) 校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:https://apps.ubuntu.com/cat/applications/unity-tweak-tool/
[2]:http://numixproject.org/
[3]:http://gnome-look.org/?xcontentmode=100
[4]:http://mokaproject.com/
[5]:http://zagortenay333.deviantart.com/art/Conky-Harmattan-426662366
[6]:http://www.deviantart.com/art/Conky-Harmattan-426662366
[7]:http://www.deviantart.com/?qh=&section=&global=1&q=conky
[8]:https://apps.ubuntu.com/cat/applications/compizconfig-settings-manager/
