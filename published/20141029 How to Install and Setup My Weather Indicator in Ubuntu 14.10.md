在Ubuntu 14.10中如何安装和配置‘天气信息指示器’
================================================================================
![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/my-weather-indicator.jpg)

**在Ubuntu桌面中有各种提供天气信息的方法，你可以使用Unity Dash和桌面应用来获得天气信息，比如[Typhoon][1]。**

但是可以提供快速查询天气状况和温度数据，并且只需要一次鼠标点击而获得大量气象数据的面板插件，才是到目前为止Linux平台下最受欢迎的天气应用。

Atareao开发的[My Weather Indicator][2]就是这类应用中的一个，也可以说是最好的一个。

它在Unity面板上显示实时温度和天气状况，并且有一个包括体感温度、云量和日升日落时间等天气数据的菜单。除此之外，该应用还支持桌面小部件、多地区支持、天气数据提供方选择以及其他很多的配置选项。

听起来很不错，是吧？那我们下面就来看看如何在Ubuntu上安装和配置它吧。

### 在Ubuntu上安装My Weather Indicator ###

My Weather Indicator无法从Ubuntu软件商店中直接获取。不过开发者为我们提供了.deb安装包和官方维护的PPA（为Ubuntu 14.04 LTS和14.10提供安装包）。

- 下载My Weather Indicator (.deb安装包)

为了确保你的应用是最新版本，我建议将[Atareao PPA][3]添加到你的软件镜像源，然后通过PPA来安装。

怎么做？**打开一个新的终端**窗口（Unity Dash > 终端，或者按Ctrl+Alt+T快捷键），然后**输入下面的两行命令**，期间你需要在提示处输入你的系统密码：

    sudo add-apt-repository ppa:atareao/atareao

    sudo apt-get update && sudo apt-get install my-weather-indicator

#### 配置My Weather Indicator ####

无论你是通过什么方法安装该应用，你都可以在Unity Dash中搜索“weather”并且点击该应用来打开它。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/weather-icon.jpg)

首次打开应用时会出现下面的配置窗口。在这里你可以手动设置地区或者使用geo-ip来自动获取。或者有时可能会不够精确，不过它可以省去手动设置过程。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/Screen-Shot-2014-10-27-at-17.39.07.jpeg)

如果你正在旅行（或者是出于聊天的需要），**你可以添加一个第二地区**。这个设置和第一地区的设置相同，只不过是出现在“第二地区”的标签栏罢了。

在“**小部件设置**”区域勾选“**显示桌面小部件**”选项就会在你的桌面上添加一个小的天气小部件。小部件提供许多不同的皮肤，所以你一定要精心挑选你最喜欢的一个（注释：点击“确定”后对小部件的更改才会保存）。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/widgets.jpg)

My Weather Indicator使用[Open Weather Map][4]作为默认的天气数据提供方。不过你可以在‘**Weather Services**’面板中选择其他的数据提供方(有*标记的需要提供相关API key)：

- Open Weather Map
- Yahoo! Weather
- Weather Underground*
- World Weather Online*

在‘**Units**’标签页中，你可以设置温度、压力、风速等数据的单位。这些设置适用于所有添加的地区，也就是说你不能在一个地区使用摄氏度，另一个地区使用华氏度。

![](http://www.omgubuntu.co.uk/wp-content/uploads/2014/10/Screen-Shot-2014-10-27-at-17.38.54.jpeg)

最后，在‘General Options‘标签页，你可以设置数据更新间隔、设置开机自动运行选项以及从两个图标中选择一个作为面板图标。

如果你是命令行控，你也可以尝试[Linux下查看天气数据的方法][5]。

--------------------------------------------------------------------------------

via: http://www.omgubuntu.co.uk/2014/10/install-weather-indicator-ubuntu-14-10

作者：[Joey-Elijah Sneddon][a]
译者：[JonathanKang](https://github.com/JonathanKang)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:https://plus.google.com/117485690627814051450/?rel=author
[1]:https://launchpad.net/typhoon
[2]:https://launchpad.net/my-weather-indicator
[3]:https://launchpad.net/~atareao/+archive/ubuntu/atareao
[4]:http://openweathermap.org/
[5]:http://www.omgubuntu.co.uk/2014/02/get-weather-forecast-terminal-linux
