Ubuntu 13.10安装后你要做的8件事
================================================================================

Ubuntu 13.10 已经发布了，对于那些打算安装“纯净版”的用户，安装完系统后你可以考虑下面的8件事。

![](http://dl.dropboxusercontent.com/u/1113424/img/ubuntu13.10-saucy-salamander.jpg)

### 1. 安装一些绚丽的小零件 ###

![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-systemload.png)

**系统负载** 是系统监控工具GNOME里的一个小应用。它能在面板上展示出CPU、内存、网络使用、硬盘I/O等信息。点击下面的按钮从Ubuntu软件中心安装。

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][1]

或者通过命令行进行安装：

    sudo apt-get install indicator-multiload

![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-cpufreq.png)

**CPU频率**是一款等效于“GNOME-CPU调频”的应用。你可以实时的调整CPU的频率。点击下面的按钮从Ubuntu软件中心安装。

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][2]

或者通过命令行安装：

    sudo apt-get install indicator-cpufreq

**我的天气**是一款显示当前天气的应用，它能显示5天内的预报并支持四大天气服务站点：OpenWeatherMap, Yahoo, Wunderground 和 World Weather Online。

通过命令行进行安装：

    sudo add-apt-repository ppa:atareao/atareao
    sudo apt-get update
    sudo apt-get install my-weather-indicator

![](https://dl.dropboxusercontent.com/u/1113424/img/variety-wallpaper-changer.jpg)


[**Variety**][3]一款带有AppIndicator的应用，但是基本上你只需要配置一次就可以用指示器来使用此软件了。Variety是一款很酷的壁纸更换的应用，他能在设定的时间内自动下载并更换壁纸。用起来就有种高帅富的感觉。壁纸库每天都会有更新，你可以很快的切换到另外一个壁纸，收藏自己喜欢的壁纸，留着日后再用。

通过以下命令行安装：

    sudo add-apt-repository ppa:peterlevi/ppa
    sudo apt-get update
    sudo apt-get install variety

![](http://dl.dropboxusercontent.com/u/1113424/img/diodon-indicator.png)

你可能还需要一个剪切板管理器，试试**Diodon** 吧，这是款轻量型软件，支持文件、图像等。点击下面的按钮安装：

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][4]

或者通过命令行安装：

    sudo apt-get install diodon diodon-plugins

### 2. 设置 Unity ###

![](http://dl.dropboxusercontent.com/u/1113424/img/unity-tweak-tool.png)

**Unity Tweak Tool**让用户能改变一些Unity设置，比如：自动隐藏、窗口最大化、“触发角”、Dash、Unity启动器或平视显示器、改变GTK或图标主题、改变字体和大小，移动窗口控制器到右边等。


点击下面的按钮从软件中心安装

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][5]

或者通过命令行安装

    sudo apt-get install unity-tweak-tool

### 3. 隐私设置 ###

![](http://dl.dropboxusercontent.com/u/1113424/img/ubuntu13.10-privacy-security_2.png)

你应该知道可以通过默认的Dash来查看最近访问的文件和其他的一些文件。系统设置可以通过设置**“安全和隐私”**来选择显示的文件类型。这样就不用看到那些软件、文件夹之类的了。你也可以清除最近的记录。

此外你在使用搜索框的时候，可以设定不显示网络搜索的结果。但是这会屏蔽掉所有的网络信息。所以当你仅仅是想**“屏蔽购物推荐”**的话，你可以输入下面的命令:

    gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

更多插件屏蔽，点击[此处][6]

![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-privacy.png)


另外一种在Ubuntu 13.10中设置隐私的方法是使用**隐私指示器**，这是一款让你快捷设置启用/屏蔽Zeitgeist 或者在线搜索结果的软件，并能清除Zeitgeist日志和最近文件（显示先边栏的“最近”里面）。

[**下载 Privacy Indicator**][7]（此网页中含有deb文件下载）

### 4. 使用混合显卡功能###

Ubuntu的开发人员已经在Ubuntu 13.10 （和 12.04 LTS版 ）中实现了混合显卡技术，下面你会看到相关设置的说明。

![](http://dl.dropboxusercontent.com/u/1113424/img/nvidia-prime-nvsettings.png)

**Nvidia Optimus**:不幸的是，Linux平台下Nvidia显卡驱动并不完全支持Optimus，[更多][8]。

但是Ubuntu 13.10用了“nvidia-prime”包来过渡。这个包使默认支持Intel显卡芯片的Optimus平台也支持Nvidia显卡。通过下面指令你能Nvidia显卡一直处于工作状态，就是说没有办法让它停止工作来节能了。这样笔记本就会功耗更大和过热--——**对我而言，我是不会 用这个的，除非过热的问题解决了**，如果没有解决的话，你可以取消这个设置。


再次不幸的是，这不是唯一的问题。你会发现画面分割和热插拔并不工作。所以，如果你想用多个显示器的话。你需要手动的在xorg.conf进行设置。这样的好处就是，你可以玩那些不支持Intel显卡的游戏，用支持VDPAU的媒体播放器等。

即便如此，如果你还是想尝试一下的话，请确保你使用的是默认的显示管理器LightDM，并不是其他的，如GDN等。此外，如果你安装了Bumblebee，你需要卸载掉它：

    sudo apt-get purge bumblebee* bbswitch-dkms

然后安装最新的Nvidia驱动和“nvidia-prime”：

    sudo apt-get install nvidia-319 nvidia-settings-319 nvidia-prime

最后重启电脑（重启X是不够）。

如果你想撤销这些改变，你可以输入通过下面的指令：

    sudo apt-get remove nvidia-319 nvidia-settings-319 nvidia-prime

然后重启
 
**AMD 混合显卡**:我并没有测试过这个，因为我没有支持AMD显卡的系统，但是根据Ubuntu wiki上的[**HybridGraphics**][9]包说明，应该是没有问题。（再次申明，我并不确定，因为我没试过）


要想在Ubuntu 13.10下获得合适的AMD显卡支持。你需要安装最新的 fglrx驱动和fglrx-pxpress：

    sudo apt-get install fglrx fglrx-pxpress

并重启电脑。重启X是没有用的

### 5. 延长电池寿命 ###

有两个工具可以延长电池的寿命：laptop-mode-tools 和 TLP。这两个工具都是为了延长电池寿命，[**TLP**][10] 似乎效果更好一点，但是TLP仅有PPA，如果你不想添加APPs时，就安装 laptop-mode-tools吧。

注意：**不要同时安装laptop-mode-tools和TLP**

点击下面的按钮安装laptop-mode-tools。

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][11]

或者通过命令行安装：

    sudo apt-get install laptop-mode-tools

输入下面命令安装TLP:

    sudo add-apt-repository ppa:linrunner/tlp
    sudo apt-get update
    sudo apt-get install tlp tlp-rdw
    sudo tlp start

这两个工具都不需要额外的配置。

另外一种节约电池的方法是**Bumblebee**（是允许在独显运行软件或游戏的工具），Bumblebee是一款支持笔记本上双显卡智能切换的软件。能停止Nvidia显卡，当你不需要使用的时候。

**注意：如果你想在显卡自动切换技术的第4步采用混合显卡时，请不要安装Bumblebee**

点击下面的按钮进行安装：

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][12]

       sudo apt-get install bumblebee bumblebee-nvidia

然后重启。
 
在Ubuntu中有个禁止"optirun"工作的[**bug**][13]。通过下面的命令解决这个问题。

- 32位系统

    sudo ln -s /usr/lib/i386-linux-gnu/libturbojpeg.so.0 /usr/lib/i386-linux-gnu/libturbojpeg.so

- 64位系统

    sudo ln -s /usr/lib/x86_64-linux-gnu/libturbojpeg.so.0 /usr/lib/x86_64-linux-gnu/libturbojpeg.so

当你想用Nvidia显卡时，运行：

    optirun APP-EXECUTABLE

将"APP-EXECUTABLE"替换为你要运行的软件或者游戏的可执行文件。

### 6. 安装 编解码器， Java 和 加密DVD播放 ###

如果需要播放更多类型的音频视频文件，那就安装 **Ubuntu Restricted Extras** 吧

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][14]

或者输入下面的命令行：

    sudo apt-get install ubuntu-restricted-extras

我建议再安装一下“libavformat 和 libavcodec的无限制版”，这样当你使用一些编辑器或者转换器的时候就不会出现丢失编码丢失的情况。点击下面的按钮进行安装：

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][15]

或者输入一下命令行：

    sudo apt-get install libavformat-extra-53 libavcodec-extra-53

你可能需要Java，但是你得明确你到底需要的是什么，不少用户仅仅使用**OpenJRE**和java游览器插件，你可以点击下面的按钮安装：

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][16]

或者输入命令行：

    sudo apt-get install icedtea-7-plugin openjdk-7-jre

如果用于开发，你可能需要**OpenJDK**，点击下面的按钮进行安装:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][17]

或者输入下面的命令行:

    sudo apt-get install openjdk-7-jdk


如果你因为某些原因需要安装**Oracle Java**（包含JDK,JRE,游览器插件的包）时，你可以通过下面的命令进行安装[**Oracle Java 7**][18] ：

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java7-installer


**加密DVD播放**： 由于现在很多安装包都能在官方的库中找到，或者有更好的替代物，Medibuntu也渐渐的[**被废弃**][19]了。但是在播放加密视频时仍然需要livdvdcss包。

 输入以下指令启动加密DVD播放功能:

    sudo apt-get install libdvdread4
    sudo /usr/share/doc/libdvdread4/install-css.sh

### 7. 安装最新的 Rhythmbox 和 VLC ###


![](http://dl.dropboxusercontent.com/u/1113424/img/rhythmbox-n-vlc.png)

在Ubuntu13.10中，Rhythmbox 和 VLC并没有升级到最新的版本，如果你想安装最新的版本，你可以使用PPAs
 
请注意：升级Rhythmbox后，里面的[**第三方插件**][20]将停止工作。Rhythmbox插件可以正常的运行。

**Rhythmbox**（Ubuntu 13.10下的版本：2.99.1，PPA中的版本：3.0.1）：

    sudo add-apt-repository ppa:jacob/media
    sudo apt-get update
    sudo apt-get install rhythmbox

**VLC**（Ubuntu 13.10下的版本：2.0.8，PPA中的版本：2.1.0）：

    sudo add-apt-repository ppa:videolan/stable-daily
    sudo apt-get update
    sudo apt-get install vlc

### 8. Tweak Nautilus: 打开被禁用的递归搜索和文件快速预览 ###

![](http://dl.dropboxusercontent.com/u/1113424/img/nautilus-no-recursive.png)

在Nautilus V3.6之后，提前键入查找功能就被去除掉了。之后版本的搜索就只是在当前文件夹和其子文件下进行搜索。这用起来就很不爽了，如果你为此感到烦恼的话就安装Nautilus的补丁来启用[**被禁用的递归搜索**][21]（你可以很方便的启用它）。

**用下面的命令将Nautilus升级到可以禁用递归搜过的版本**

    sudo add-apt-repository ppa:dr3mro/personal
    sudo apt-get update
    sudo apt-get upgrade
    nautilus -q

**然后使用下面的命令禁用递归搜索**

    gsettings set org.gnome.nautilus.preferences enable-recursive-search false

如果你还想恢复递归搜索的功能，使用下面的命令行：

    gsettings set org.gnome.nautilus.preferences enable-recursive-search true

![](http://dl.dropboxusercontent.com/u/1113424/img/gnome-sushi.png)

**GNOME Sushi**是一款快速预览的软件。点击下面的按钮安装。（会安装gnome-sushi 和 unoconv来实现预览）。

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][22]

或者输入命令行：

    sudo apt-get install gnome-sushi unoconv

要使用这个软件，需选择一个文件（图片、文本文档、音乐文件等）然后点击SPACE按钮来预览。再次点击SPACE按钮或者关闭窗口可以关闭预览。

**现在！看完我们的介绍之后，你会选择哪个作为第一个安装的呢？**

--------------------------------------------------------------------------------

via: http://www.webupd8.org/2013/10/8-things-to-do-after-installing-ubuntu.html

译者：[Timeszoro](https://github.com/Timeszoro)  校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject)  原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:apt://indicator-multiload
[2]:apt://indicator-cpufreq
[3]:http://www.webupd8.org/2013/06/variety-wallpaper-changer-0415-released.html
[4]:apt://diodon,diodon-plugins
[5]:apt://unity-tweak-tool
[6]:http://www.webupd8.org/2013/10/how-to-disable-amazon-shopping.html
[7]:http://www.florian-diesch.de/software/indicator-privacy/
[8]:http://www.webupd8.org/2013/08/using-nvidia-graphics-drivers-with.html
[9]:https://wiki.ubuntu.com/X/Config/HybridGraphics#Known_issues
[10]:http://www.webupd8.org/2013/04/improve-power-usage-battery-life-in.html
[11]:apt://laptop-mode-tools
[12]:apt://bumblebee,bumblebee-nvidia
[13]:http://www.webupd8.org/2013/10/fix-bumblebee-libturbojpegso-issue-in.html
[14]:apt://ubuntu-restricted-extras
[15]:apt://libavformat-extra-53,libavcodec-extra-53
[16]:apt://icedtea-7-plugin,openjdk-7-jre
[17]:apt://openjdk-7-jdk
[18]:http://www.webupd8.org/2012/01/install-oracle-java-jdk-7-in-ubuntu-via.html
[19]:http://gauvain.pocentek.net/node/61
[20]:http://www.webupd8.org/2012/08/rhythmbox-third-party-plugins-ubuntu-ppa.html
[21]:http://www.webupd8.org/2013/09/how-to-disable-recursive-search-in.html
[22]:apt://gnome-sushi,unoconv