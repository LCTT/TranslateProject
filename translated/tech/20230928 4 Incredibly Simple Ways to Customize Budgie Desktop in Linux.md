[#]: subject: "4 Incredibly Simple Ways to Customize Budgie Desktop in Linux"
[#]: via: "https://itsfoss.com/budgie-customization/"
[#]: author: "Sagar Sharma https://itsfoss.com/author/sagar/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "Drwhooooo"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux 4 种极简方式自定义 budgie 桌面
======

如果你想向我咨询有关制作夹带特性和支持 GTK 的自定义 MATE 桌面方面的内容，我会想到 Budgie！

Budgie，一款令人惊艳的桌面环境（DE），为你提供与过去相似的配置以及独特的用户体验。

那么，如何自定义你的 Budgie 桌面才能提升个人体验呢？莫慌；我这里有几条妙计助你改善你的 Budgie 体验。

我们的目标大致如下：

  * **修改壁纸**
  * **修改主题，图标以及光标——简易操作**
  * **自定义面板**
  * **自定义工具栏**



让我们开始吧！🤩

### 1\. 改变 Budgie 桌面环境壁纸

Budgie 桌面在安装前会自带一些好看的壁纸。

修改 Budgie 桌面壁纸，你们只需要做这两个小步骤：

  1. 在主界面点击右键，选择`Change Desktop Backgroun`
  2. 选择图片，然后该图片就会应用在你的主界面中



![点击放大图片][1]

要是你不太中意其中的可用选项，你也可以自网络下载相关壁纸。

下好后，打开文件管理器至图片存放位，右键点击该图片，选择`Set as Wallpaper...`选项。

![][2]

### 2\. 修改桌面主题，图标以及光标主题

通常情况下，我们从网络上下载了主题，提取下载的文件，然后就会将文件移动到相应目录以便[应用于 Linux 主题][3]。

![][4]

但要那么整的话，既需要花费些功夫，又不是最高效的方法。（如果你好奇去试试的话）

那么此处便是**ocs-url**工具发力的地方了。

**ocs-url**————一款一键安装所有主题风格（比如说来自_gnome-look.org_门户网站内容）的工具。

💡

Gnome-look.org 和 pling.com 是依附在[Opendesktop.org][5]的两个络站点，帮助你一站式搜索主题风格，壁纸，图标，以及其它好物。

它与任何桌面环境都没有官方隶属关系。

但也正是如此，它没法被任何软件包管理器中的 Linux 解析器识别，也就是说你得在你的系统里手动安装它。

那么首先，移动至[ocs-url 的官方下载页面][6]，转到`Files`子页面，将软件包下载至你的系统中：

![][7]

完成后，打开你的命令提示符，将文件地址改成文件下载的位置。对于大多数用户来说，便是，`Downloads`文件所处的位置：

```

    cd Downloads

```

现在，使用你们Linux版本的指令：

**适用于 Ubuntu:**

```

    sudo dpkg -i ocs-url*.deb

```

**适用于 Fedora:**

```

    sudo dnf install qt5-qtbase qt5-qtbase-gui qt5-qtsvg qt5-qtdeclarative qt5-qtquickcontrols && sudo rpm -i ocs-url*.rpm

```

**适用于 Arch:**

```

    sudo pacman -S qt5-base qt5-svg qt5-declarative qt5-quickcontrols && sudo pacman -U ocs-url*.pkg.tar.xz

```

**适用于 openSUSE:**

```

    sudo zypper install libQt5Svg5 libqt5-qtquickcontrols && sudo rpm -i ocs-url*.rpm

```

现在，让我们看看该如何安装主题风格，图标以及光标风格。

#### 修改系统主题风格

修改系统主题风格的第一步————访问[Gnome Look][8]门户网站并选择你中意的主题风格（你可以在 GTK 3 和 GTK 4 之间选择）。

![][9]

选择任意你最喜欢的主题风格；这里我选择`Kripton`风格,你可以看到有一个`Install`选项。

在这里，你需要遵循两个小步骤：

  * 点击`Install`按钮之后，会呈现该主题风格的不同类型。选择其中一个。
  * 然后会跳出一个提示符，你需要再点击一次`Install`按钮：



![][10]

然后它会拉取 ocs-url 工具询问你是否安装所选主题风格。

点击`OK`按钮安装该主题风格：

![][11]

现在，进入**Budgie Desktop Settings**界面然后在**Style**子菜单下的`Widget`选择面板中点击需要安装的主题风格。

![][12]

#### 修改图标

修改图标，先访问有关[Gnome-look中的图标部分][13]门户网站，来搜索你中意的图标：

![][14]

找到图标后，可以看到有两个按钮：Download 和 Install。点击`Install`按钮。

可以看到有多个图标，但大多数例子里只展现了一个内容。点击其中一选项，弹出一提示符，再次点击`Install`按钮：

![][15]

然后，可以看到来自 ocs-url 弹出的提示符询问你是否安装所选图标包，点击`OK`安装图标包：

![][16]

下一步，打开**Budgie Desktop Settings**的 icons 子菜单，你便可以使用最近安装过的图标风格（我用过 elementary-kde 风格）：

![][17]

#### 修改光标主题风格

和之前步骤类似，访问[Gnome Look的光标图标部分][18]门户网站搜索最适合你的光标图标：

![][19]

选好心仪的光标风格后，点击相应选项，然后你就可以安装相对应的光标风格了。

弹出提示符，再次点击安装按钮：

![][20]

弹出来自 ocs-url 工具的提示符，点击安装光标主题风格。只需要点个`OK`然后开始安装：

![][21]

完成后，打开 Budgie 桌面设置界面，在对应子页面的`Cursors`面板中选择刚刚安装的光标主题风格：

![][22]

### 3\. 自定义 Budgie 桌面面板

考虑到不同的 Linux 发行版本。就举个例子：假设你用的是 Solus 的 Budgie 或者 Ubuntu 的 Budgie。 

打开 Budgie 桌面设置，在那里你可以寻找到对于面板的相关设置：

![][23]

你可以看到该界面三个分区下已启用的小程序：

**Start**（最左侧），**Center**，以及**End**（最右侧）。

📋+

注意，每个小程序有自己不同的设置选项，所以还能单独设置他们。

你可以在他们之间做些调整。比如，在这个地方我将 clock 工具挪到左边以便它和我的工作流界面看起来更加融洽：

![][24]

要想移动小程序，只需要选中该小程序然后点击上下箭头按钮（位于小程序列表上方）。

如果你想移除小程序，只需要选中该程序然后点击删除按钮即可：

![][25]

这里有一个`+`图标样式的选项，可以添加更多小程序。点击它，会为你弹出所有小程序可选项。

找到一个有用的小程序，选中该程序并点击`Add`按钮：

![][26]

要是你希望面板变透明，想添加阴影，想增加或减少小程序之间的距离，那么就访问设置菜单中的这个页面（如下图）：

![][27]

举个例子，这里，我将自己的面板设置了透明和阴影，让它看起来更舒服点：

![][28]

### 4\. 在 Desktop Budgie 桌面自定义工具栏

在这一环节，我会传授你如何将自己的工具栏设计得更好，功能性更强：

  * 修改工具栏主题风格
  * 添加更多工具应用以赋予工具栏更多特性



#### 修改工具栏主题风格

可惜啦，这次 ocs-url 工具可就帮不上什么忙了，设置该内容的唯一方式就是手动操作！

首先，[访问 Gnome Look 的底部面板主题风格][29]，下载你心仪的工具栏底部面板主题风格。

这里，我选了模仿 macOS 系统的 Monterey 主题风格（dark-inline 版）：

![][30]

现在，打开命令提示符，寻址到该主题风格下载位置。

对大多数用户来说，即`Downloads`文件所在位置：

```

    cd ~/Downloads

```

现在，[使用解压指令][31]将文件释放到`.local/share/plank/themes/`：

```

    unzip <theme_name.zip> -d .local/share/plank/themes/

```

在我的环境下是这样：

```

    unzip Monterey-Dark-inline.zip -d ~/.local/share/plank/themes/

```

![][32]

然后，打开`Plank preferences`，改成刚下载的主题风格。

我将我的风格改成`Monterey -Dark inline`：

![][33]

#### 添加工具应用以增加更多特性

就把工具应用当作小程序，把工具栏当作小程序页面就行，再无其他内容。

想要添加或移除工具应用，首先得需要打开`Plank preferences`，然后访问`Docklets`菜单，列出可用选项：

![][34]

现在，如果你想添加一些工具应用，只需要把他们拖进工具栏即可：

![][35]

但如果你想把添加的工具应用移出出去呢？

简单，把他们从工具栏中拖拽出去就行了：

![][36]

### 准备好使用 Budgie 了吗？

当然，通常情况下，为了图方便，你也可以安装拷贝过 Budgie 桌面环境的 Linux 发行版的系统。

或者你还是可以选择在你现行的系统版本中[安装 Budgie][37]，比如说 Ubuntu：
 
![][4]

在本教程中，我使用的是 Ubuntu 版本的 Budgie。期间在 Budgie 桌面上的操作步骤适用于任何你们现行所使用的发行版本。

_💬你是怎么自定义你的 Budgie 桌面的呢？你想为这篇文章贡献更多内容吗？在下方评论区分享你的经验吧。_

--------------------------------------------------------------------------------

via: https://itsfoss.com/budgie-customization/

作者：[Sagar Sharma][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sagar/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2023/08/Change-wallpaper.png
[2]: https://itsfoss.com/content/images/2023/08/Set-third-party-wallpaper-in-budgie-desktop.png
[3]: https://itsfoss.com/install-themes-ubuntu/
[4]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
[5]: https://www.opendesktop.org/
[6]: https://www.opendesktop.org/p/1136805/
[7]: https://itsfoss.com/content/images/2023/08/Download-ocs-url-in-budgie.png
[8]: https://www.gnome-look.org/browse?cat=135&ord=latest
[9]: https://itsfoss.com/content/images/2023/09/Open-gnome-look-to-install-system-themes-in-budgie-desktop.png
[10]: https://itsfoss.com/content/images/2023/09/Install-theme-from-ocs-url-in-budgie-dekstop.png
[11]: https://itsfoss.com/content/images/2023/09/Install-theme-from-ocs-url.png
[12]: https://itsfoss.com/content/images/2023/09/Change-theme-in-Budgie-desktop-using-the-budgie-desktop-settings-1.png
[13]: https://www.gnome-look.org/browse?cat=132&ord=latest
[14]: https://itsfoss.com/content/images/2023/09/Download-icons-for-budgie-desktop.png
[15]: https://itsfoss.com/content/images/2023/09/Install-icons-for-budgie-desktop-environment.png
[16]: https://itsfoss.com/content/images/2023/09/Use-ocs-url-to-install-icons-in-budgie-desktop-environment.png
[17]: https://itsfoss.com/content/images/2023/09/Select-icon-to-customize-the-budgie-desktop-from-budgie-desktop-settings.png
[18]: https://www.gnome-look.org/browse?cat=107&ord=latest
[19]: https://itsfoss.com/content/images/2023/09/Download-cursor-icons-for-budgie-desktop.png
[20]: https://itsfoss.com/content/images/2023/09/Install-cursor-icons-for-the-budgie-desktop-environment.png
[21]: https://itsfoss.com/content/images/2023/09/Install-the-cursor-icon-theme-in-budgie-desktop-environment-using-the-ocs-url.png
[22]: https://itsfoss.com/content/images/2023/09/Select-the-cursor-icon-theme-from-the-budgie-desktop-settings-for-custoomizing-the-budgie-desktop-environment.png
[23]: https://itsfoss.com/content/images/2023/09/Access-budgie-desktop-panel-settings.png
[24]: https://itsfoss.com/content/images/2023/09/Move-applets-in-budgie-desktop.png
[25]: https://itsfoss.com/content/images/2023/09/Delete-applet-from-the-panel.png
[26]: https://itsfoss.com/content/images/2023/09/Add-applet-in-budgie-desktop-environment.png
[27]: https://itsfoss.com/content/images/2023/09/Tweak-panel-of-the-budgie-desktop.png
[28]: https://itsfoss.com/content/images/2023/09/Add-transparency-and-shadows-in-budgie-desktop-panel-1.png
[29]: https://www.gnome-look.org/browse?cat=273&ord=latest
[30]: https://itsfoss.com/content/images/2023/09/Download-theme-for-the-plank-dock-in-budgie-desktop-environment.png
[31]: https://itsfoss.com/unzip-linux/
[32]: https://itsfoss.com/content/images/2023/09/extract-plank-dock-themes-in-budgie-desktop.png
[33]: https://itsfoss.com/content/images/2023/09/Change-theme-in-plank-dock-1.png
[34]: https://itsfoss.com/content/images/2023/09/Docklets-in-Plank-dock.png
[35]: https://itsfoss.com/content/images/2023/09/Add-docklets-in-Plank-dock-budgie-desktop-configuration.gif
[36]: https://itsfoss.com/content/images/2023/09/Remove-docklets-from-the-plank-budgie-desktop.gif
[37]: https://itsfoss.com/install-budgie-ubuntu/
