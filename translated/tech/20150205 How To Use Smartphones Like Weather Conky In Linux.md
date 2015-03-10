如何在 Linux 中使用类似智能手机外观的 Conky 天气插件
================================================================================
![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Use_Weather_Conky_Linux.jpeg)

智能手机都拥有一些平滑融入手机外观的天气小插件，幸亏有了 Flair Weather Conky，你便可以**在你的 Linux 桌面中拥有像智能手机一样的天气外观**。我们将使用一个 GUI 工具[Conky Manager 在 Linux 中轻松地管理 Conky][1]。那就先让我们看看如何在 Ubuntu 14.10，14.04、Linux Mint 17 及其他 Linux 发行版本中安装 Conky Manager 吧。

### 安装 Conky Manager ###

打开一个终端并使用下面的命令：

    sudo add-apt-repository ppa:teejee2008/ppa
    sudo apt-get update
    sudo apt-get install conky-manager

你可以阅读这篇关于[如何在 Linux 中使用 Conky Manager][1] 的文章。

### 确保 curl 已被安装 ###

请确保 [curl][2] 已被安装。(如若没有安装它，)可以使用下面的命令来安装：

    sudo apt-get install curl

### 下载 Flair Weather Conky ###

从下面的链接下载 Flair Weather Conky  的脚本：

- [下载 Flair Weather Conky 脚本][3]

### 在 Conky Manager 中使用 Flair Weather Conky 脚本  ###

#### 步骤 1: ####

同你在 Ubuntu 14.04 中安装主题一样，在你的家目录中应该有一个 `.conky` 目录。假如你使用命令行，则不需要让我来告诉你如何找到这个目录。对于新手，请用文件管理器切换到你的家目录下，并按 `Ctrl+H` 来 [在 Ubuntu 中显示隐藏文件][4]。在这里查找 `.conky` 文件夹，假如没有这个文件夹，则创建一个。

#### 步骤 2: ####

在 `.conky` 目录中，解压下载到的 Flair Weather 文件。请注意在默认情况下它会自动解压到一个名为 `.conky` 目录。所以请进入这个目录，将 Flair Weather 文件夹从中取出，然后将它粘贴到真正的 `.conky` 目录下。

#### 步骤 3: ####

Flair Weather 使用 Yahoo 的天气服务并且它不能自动地识别你的位置。你需要手动地编辑它。到[Yahoo 天气][5] 网页，然后通过键入你的城市/Pin 码来得到你所在城市的 位置 ID号。你可以从网页地址栏中取得 位置ID 号。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Yahoo_Weather_Location_Code.jpeg)

#### 步骤 4: ####

打开 Conky Manager，它应该能够读取新安装的 Conky 脚本。这里有两种样式可用，黑色主题或亮丽主题。你可以选择你偏爱的那一款。当你选择后，你就可以在桌面上看到 conky 的显示。

在 Flair Weather 中，默认位置被设定为 Melbourne。你必须手动地编辑 conky 文件。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Using_Weather_Conky_Ubuntu.jpeg)

#### 步骤 5: ####

在上面的截图中，你可以看到有一个编辑选定 conky 脚本的选项，在打开的编辑器中，查找 location 或 WOEID ，更换它为你在 步骤3 中得到的位置编号。然后重启 Conky。

![](http://itsfoss.itsfoss.netdna-cdn.com/wp-content/uploads/2015/02/Edit_Conky.jpeg)

在上面查找的相同位置，假如你将 C 替换为 F，则温度的单位将从摄氏温标改为华氏温标 。不要忘了重启 Conky 来查看已经做出的修改。

#### 尝试尝试 ####

在这篇文章中，我们实际上学到了许多东西。我们见证了如何轻松地使用任何 Conky 脚本，如何边界这个脚本和如何使用 Conky Manager 来达到不同的目的。我希望这些对你有用。

需要留心的是，Ubuntu 14.10 用户可能会看到重叠的时间数字。请提醒开发者注意这类问题。

我已经向你展示了在我的系统上 Flair Weather conky 外观的截图。现在该你尝试它并炫耀你的桌面的时间了。
--------------------------------------------------------------------------------

via: http://itsfoss.com/weather-conky-linux/

作者：[Abhishek][a]
译者：[FSSlc](https://github.com/FSSlc)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://itsfoss.com/author/Abhishek/
[1]:http://itsfoss.com/conky-gui-ubuntu-1304/
[2]:http://www.computerhope.com/unix/curl.htm
[3]:http://speedracker.deviantart.com/art/Flair-Weather-Conky-Made-for-Conky-Manager-510130311
[4]:http://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[5]:https://weather.yahoo.com/
