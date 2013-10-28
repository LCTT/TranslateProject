注：这篇文章的原文不小心被删了。所以我保留了英文部分。麻烦校正玩把英文部分删掉。谢谢。


8 Things To Do After Installing Ubuntu 13.10 (Saucy Salamander)

Ubuntu 13.10安装后你要做的8件事
================================================================================

Ubuntu 13.10 was released today and for those of you who plan on doing a clean install, here are 8 useful things to do after the installation.

Ubuntu 13.10 今天发布了，对于那些打算安装“纯净版”的用户，安装完系统后你可以考虑下面的8件事。

![](http://dl.dropboxusercontent.com/u/1113424/img/ubuntu13.10-saucy-salamander.jpg)

### 1. Install some extra AppIndicators (applets) ###
### 1. 安装一些绚丽的AppIndicators(应用) ###

![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-systemload.png)

**System Load Indicator** is a port of the popular System Monitor GNOME Panel applet and it can display CPU, memory, network usage, hard disk I/O and more on the panel. Install it from the Ubuntu Software Center by clicking the button below:

**System Load Indicator** 是系统监控工具GNOME里的一个小应用。它能在面板上展示出CPU、内存、网络使用、硬盘I/O等信息。点击下面的按钮从Ubuntu软件中心安装。

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][1]

Or, to install it via command line, use:

或者通过命令行进行安装：

    sudo apt-get install indicator-multiload

![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-cpufreq.png)

**Cpufreq Indicator** is the equivalent of the old GNOME CPU frequency scaling applet which can be used for changing the CPU frequency on-the-fly. Install it in Ubuntu by clicking the button below:

**Cpufreq Indicator**是一款等效于“GNOME-CPU调频”的应用。你可以实时的调整CPU的频率。点击下面的按钮从Ubuntu软件中心安装。

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][2]

Or install it from the command line:

或者通过命令行安装：

    sudo apt-get install indicator-cpufreq

**My Weather Indicator** is an appindicator that displays the current weather on the Unity panel. The appindicator can also display a 5-day forecast, a desktop widget and supports four weather services: OpenWeatherMap, Yahoo, Wunderground and World Weather Online.

**My Weather Indicator**是一款显示当前天气的应用，它能显示5天内的预报并支持四大天气服务站点：OpenWeatherMap, Yahoo, Wunderground 和 World Weather Online。

To install it in Ubuntu 13.10, use the commands below:
通过命令行进行安装：

    sudo add-apt-repository ppa:atareao/atareao
    sudo apt-get update
    sudo apt-get install my-weather-indicator

![](https://dl.dropboxusercontent.com/u/1113424/img/variety-wallpaper-changer.jpg)

[**Variety**][3] is an application that comes with an AppIndicator but since you basically only have to configure it once and after that you'll only need to use the AppIndicator, I'll list it here. Variety is a cool wallpaper changer that automatically downloads and changes your wallpaper on a given interval. Using it, you'll get cool, fresh wallpapers each day. From the AppIndicator you can quickly switch to the next (random) wallpaper or copy the wallpaper to favourites, for later use.

[**Variety**][3]一款带有AppIndicator的应用,但是基本上你只需要配置一次就可以用AppIndicator来使用此软件了。Variety一款壁纸更换器的应用，他能在设定的时间内自动下载并更换壁纸。用起来就有种高帅富的感觉。壁纸库每天都会有更新，你可以很快的切换到另外一个壁纸，收藏自己喜欢的壁纸，留着日后再用。

To install Variety in Ubuntu, use the following commands:

通过一下命令行安装：

    sudo add-apt-repository ppa:peterlevi/ppa
    sudo apt-get update
    sudo apt-get install variety

![](http://dl.dropboxusercontent.com/u/1113424/img/diodon-indicator.png)

You'll probably also want a clipboard manager. I recommend **Diodon** which is lightweight, supports files, image sections and more. To install it in Ubuntu 13.10 Saucy Salamander, click the button below:

你可能需要一个剪切板管理器，试试**Diodon** 吧，这是款轻量型软件，支持文件、图像等。点击下面的按钮安装：

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][4]

Or open a terminal and copy/paste the following command to install it:

或者通过命令行安装：

    sudo apt-get install diodon diodon-plugins

### 2. Tweak Unity ###

### 2. 设置 Unity ###
![](http://dl.dropboxusercontent.com/u/1113424/img/unity-tweak-tool.png)

**Unity Tweak Tool** allows users to change various Unity settings such as auto-hide bahavior, window snapping and hot corners, tweak Dash, the Unity Launcher or HUD, change the GTK or icon theme, change the font face or size, move the window controls to the right and much more.

**Unity Tweak Tool**让用户能改变一些Unity设置，比如：自动隐藏、窗口最大化、“触发角”、Dash、Unity启动器或平视显示器、改变GTK或图标主题、改变字体和大小，移动窗口控制器到右边等。

To install Unity Tweak Tool from the Ubuntu Software Center, click the button below: 

点击下面的按钮从软件中心安装
[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][5]

Or, install it in Ubuntu 13.10 via command line:

或者通过命令行安装

    sudo apt-get install unity-tweak-tool

### 3. Privacy tweaks ###

### 3. 隐私设置 ###
![](http://dl.dropboxusercontent.com/u/1113424/img/ubuntu13.10-privacy-security_2.png)

As you probably know, by default Dash shows all the recently accessed files as well as other files found on your filesystem. By selecting **Security & Privacy** from System Settings, you can choose what file types can show up in Dash, exclude various applications or folders/partitions from showing up in Dash and there's also an option to clear usage data.

你应该知道可以通过默认的Dash来查看最近访问的文件和其他的一些文件。系统设置可以通过设置**“安全和隐私”**来选择显示的文件类型。这样就不用看到那些软件、文件夹之类的了。你也可以清除最近的记录。

Furthermore, on the Search tab, you can disable online search results from being displayed in Dash. However, this option disables all the online search results so if for instance you only want to **disable the shopping suggestions**, you can run the following command:

此外你在使用搜索框的时候，可以设定不显示网络搜索的结果。但是这会屏蔽掉所有的网络信息。所以当你仅仅是想**“屏蔽购物推荐”**的话，你可以输入下面的命令:

    gsettings set com.canonical.Unity.Lenses disabled-scopes "['more_suggestions-amazon.scope', 'more_suggestions-u1ms.scope', 'more_suggestions-populartracks.scope', 'music-musicstore.scope', 'more_suggestions-ebay.scope', 'more_suggestions-ubuntushop.scope', 'more_suggestions-skimlinks.scope']"

More on disabling Dash (search) plugins, [HERE][6].

更多插件屏蔽，点击[此处][6]
![](http://dl.dropboxusercontent.com/u/1113424/img/indicator-privacy.png)


Another way to deal with privacy in Ubuntu 13.10 is to use the **Privacy Indicator**, a tool hat lets you quickly enable/disable Zeitgeist (activity logging) or online search results from showing up in Dash, clear the Zeitgeist log or recent files (which show up in the Nautilus "Recent" sidebar item for instance).

另外一种在Ubuntu 13.10中设置隐私的方法是使用**Privacy Indicator**，这是一款让你快捷设置启用/屏蔽Zeitgeist 或者在线搜索结果的软件，并能清除Zeitgeist日志和最近文件（显示先边栏的“最近”里面）。

[**Download Privacy Indicator**][7] (there's a deb available at the bottom of the page)

[**下载 Privacy Indicator**][7]（此网页中含有deb文件下载）

### 4. Enable the discrete card on systems with Hybrid graphics ###

The Ubuntu developers have worked to support Hybrid graphics in Ubuntu 13.10 (and 12.04 LTS). Below you'll find instructions on how to set this up.
Ubuntu的开发人员已经在Ubuntu 13.10 （和 12.04 LTS版 ）中实现了混合显卡技术，下面你会看到相关设置的说明。

![](http://dl.dropboxusercontent.com/u/1113424/img/nvidia-prime-nvsettings.png)

**Nvidia Optimus**: unfortunately, the Nvidia Linux graphics drivers don't yet fully support Optimus - more on this subject, [HERE][8].


Ubuntu 13.10 (Saucy Salamander) ships with a new package called "nvidia-prime" which enables the Nvidia graphics card on Optimus systems (which by default use the integrated Intel graphics chip). By using the instructions below, the Nvidia card will always be in use, so there's no way to switch it off to save power. Because of this, the laptop will consume more power and possibly overheat - **in my case, the laptop gets really hot and for this reason I'm not using this solution but things may work better for your laptop** (and if not, you can easily revert the changes).

**Nvidia Optimus**:不幸的是，Linux平台下Nvidia显卡驱动并不完全支持Optimus，[更多][8]。但是Ubuntu 13.10用了“nvidia-prime”包来过渡。这个包使默认支持Intel显卡芯片的Optimus平台也支持Nvidia显卡。通过下面指令你能Nvidia显卡永远处于工作状态，就是说没有办法让它停止工作了。这样笔记本就会功耗更大和过热--——**对我而言，我是不会 用这个的，除非过热的问题解决了**，如果没有解决的话，你可以撤销更改。


Unfortunately, that's not the only issue. You may also experience screen tearing and hotplug won't work so if you want to use multiple monitors, you'll have to manually set them up in xorg.conf. The advantages are that you'll be able to play games that aren't supported by the Intel graphics, use VDPAU-enabled media players, etc.

不幸的是，这不是唯一的问题。你会发现画面分割和热插拔并不工作。所以，如果你想用多个显示器的话。你需要手动的在xorg.conf进行设置。这个的好处就是，你可以玩那些不支持Intel显卡的游戏，用支持VDPAU的媒体播放器等。

That said, if you want to give this a try in Ubuntu 13.10 Saucy Salamander, make sure you're using LightDM (the default Ubuntu display manager) and not some other display manager like GDM. Also, if you've installed Bumblebee, you'll need to purge it:

即便如此，如果你还是想尝试一下的话，请确保你使用的是默认的显示管理器LightDM，并不是其他的，如GDN等。此外，如果你安装了Bumblebee，你需要卸载掉它：

    sudo apt-get purge bumblebee* bbswitch-dkms

Then, install the latest Nvidia drivers and "nvidia-prime":

然后安装最新的Nvidia驱动和“nvidia-prime”：

    sudo apt-get install nvidia-319 nvidia-settings-319 nvidia-prime

And finally, reboot (restarting X isn't enough).
最后重启电脑（重启X是不够）。

If you want to revert this change, simply remove the installed packages:

如果你想撤销这些改变，你可以输入通过下面的指令：

    sudo apt-get remove nvidia-319 nvidia-settings-319 nvidia-prime

And reboot.

然后重启
 
**AMD Hybrid graphics**: I didn't test this because I don't have a system with AMD graphics, but according to the [**HybridGraphics**][9] Ubuntu wiki page, there aren't any known issues, so I assume that everything works properly (again, I'm not sure since I can't test it!).

**AMD 混合显卡**:我并没有测试过这个，因为我没有支持AMD显卡的系统，但是根据Ubuntu wiki上的[**HybridGraphics**][9]包说明，应该是没有问题。（再次申明，我并不确定，因为我没试过）



To get proper AMD Hybrid graphics support in Ubuntu 13.10, all you have to do is install the latest fglrx driver and fglrx-pxpress from the repositories:

要想在Ubuntu 13.10下获得合适的AMD显卡支持。你需要安装最新的 fglrx驱动和fglrx-pxpress：

    sudo apt-get install fglrx fglrx-pxpress

And then reboot the system (restarting X isn't enough).
并重启电脑。重启X是没有用的

### 5. Improve battery life ###

### 5. 延长电池寿命 ###

There are two tools you can use to improve your laptop's battery life: laptop-mode-tools or TLP. Both try to achieve the same thing, but from what I've read, [**TLP**][10] seems to save a bit more power. However, TLP is only available in a PPA so if you don't like adding PPAs, install laptop-mode-tools.

有两个工具可以延长电池的寿命：laptop-mode-tools 和 TLP。这两个工具都是为了延长电池寿命，[**TLP**][10] 似乎效果更好一点，但是TLP仅有PPA，如果你不想添加APPs时，就安装 laptop-mode-tools吧。

Important note: **don't install both laptop-mode-tools and TLP!**

注意：**不要同时安装laptop-mode-tools和TLP**

To install laptop-mode-tools, click the button below:

点击下面的按钮安装laptop-mode-tools。

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][11]

Or install it from the command line:

或者通过命令行安装：

    sudo apt-get install laptop-mode-tools

Or, to install TLP, use the commands below:

输入下面命令安装TLP:

    sudo add-apt-repository ppa:linrunner/tlp
    sudo apt-get update
    sudo apt-get install tlp tlp-rdw
    sudo tlp start

No configuration is needed for either TLP or laptop-mode-tools.

这两个工具都不需要额外的配置。

Another way to save power and prevent your laptop from overheating (the tool also allows running apps or games on the discrete graphics card on demand, using the "optirun" command - see below) is **Bumblebee**. Bumblebee is a tool for laptops that use Nvidia Optimus, that disables the Nvidia card when not in use.

另外一种节约电池的方法是**Bumblebee**（是允许在独显运行软件或游戏的工具），Bumblebee是一款支持笔记本上双显卡智能切换的软件。能停止Nvidia显卡，当你不需要使用的时候。

**Note: if you plan on using the hybrid graphics solution under step 4 for Nvidia Optimus, don't install Bumblebee!**

**注意：如果你想在显卡自动切换技术的第4步采用混合显卡时，请不要安装Bumblebee**

To install Bumblebee, click the button below:

点击下面的按钮进行安装：

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][12]

Or install it via command line:

    sudo apt-get install bumblebee bumblebee-nvidia

Then reboot.
然后重启。
 
Currently there's a [**bug**][13] in Ubuntu 13.10 that prevents "optirun" from working. To fix it, use the following command:

在Ubuntu中有个禁止"optirun"工作的[**bug**][13]。通过下面的命令解决这个问题。

- 32位系统
- 32bit:

    sudo ln -s /usr/lib/i386-linux-gnu/libturbojpeg.so.0 /usr/lib/i386-linux-gnu/libturbojpeg.so

- 64位系统
- 64bit:

    sudo ln -s /usr/lib/x86_64-linux-gnu/libturbojpeg.so.0 /usr/lib/x86_64-linux-gnu/libturbojpeg.so

When you want to use the Nvidia graphics card for an application, run:

当你想用Nvidia显卡时，运行：

    optirun APP-EXECUTABLE

replacing "APP-EXECUTABLE" with the application (or game) executable.

将"APP-EXECUTABLE"替换为你要运行的软件或者游戏的可执行文件。

### 6. Install codecs, Java and encrypted DVD playback ###
### 6. 安装 编解码器, Java 和 加密DVD播放 ###

To be able to play most audio and video formats, install **Ubuntu Restricted Extras** by clicking the button below:

如果需要播放更多类型的音频视频文件，那就安装 **Ubuntu Restricted Extras** 吧

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][14]

Or install it using the following command:

或者输入下面的命令行：

    sudo apt-get install ubuntu-restricted-extras

I suggest to also install the **unrestricted versions of libavformat and libavcodec** so you don't encounter issues with missing codecs when trying to use some video editors or transcoders - install them by clicking the button below:

我建议再安装一下“libavformat 和 libavcodec的无限制版”，这样当你使用一些编辑器或者转换器的时候就不会出现丢失编码丢失的情况。点击下面的按钮进行安装：

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][15]

Or by using the following command:
或者输入一下命令行：

    sudo apt-get install libavformat-extra-53 libavcodec-extra-53

You may also need Java, but you must figure out what you need. Most users will only need **OpenJRE** and the Java browser plugin which you can install by clicking the button below:

你可能需要Java,但是你得明确你到底需要的是什么，不少用户仅仅使用**OpenJRE**和java游览器插件，你可以点击下面的按钮安装：

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][16]

Or by using the following command:

或者输入命令行：

    sudo apt-get install icedtea-7-plugin openjdk-7-jre

For development, you'll also want **OpenJDK** which you can install by using the button below:

对于开发者而言，你可能需要**OpenJDK**,点击下面的按钮进行安装:

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][17]

Or by using the following command:

或者输入下面的命令行:

    sudo apt-get install openjdk-7-jdk


If for various reasons, you need **Oracle Java** (the package includes JDK, JRE and the browser plugin), you can install [**Oracle Java 7**][18] by using the following commands:

如果你因为某些原因需要安装**Oracle Java**（包含JDK,JRE,游览器插件的包）时，你可以通过下面的命令进行安装[**Oracle Java 7**][18] ：

    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install oracle-java7-installer


**Encrypted DVD playback**: the Medibuntu repository [**no longer exists**][19] and while most packages in the archive are obsolete or unnecessary because most are now in the official Ubuntu repository or have better equivalents, livdvdcss is still required for playing encrypted DVDs. 

**加密DVD播放**： 由于现在很多安装包都能在官方的库中找到，或者有更好的替代物，Medibuntu也渐渐的[**被废弃**][19]了。但是在播放加密视频时仍然需要livdvdcss包。

You can enable encrypted DVD playback in Ubuntu 13.10 by using the following commands:

 输入以下指令启动加密DVD播放功能:

    sudo apt-get install libdvdread4
    sudo /usr/share/doc/libdvdread4/install-css.sh

### 7. Get the latest Rhythmbox and VLC ###
### 7. 安装最新的 Rhythmbox 和 VLC ###


![](http://dl.dropboxusercontent.com/u/1113424/img/rhythmbox-n-vlc.png)

Two popular applications: Rhythmbox and VLC, haven't been updated to the latest version in Ubuntu 13.10. If you want to install the latest version for these apps, you can use PPAs.

在Ubuntu13.10中，Rhythmbox 和 VLC并没有升级到最新的版本，如果你想安装最新的版本，你可以使用PPAs
 
Please note that by upgrading Rhythmbox, the plugins in the Rhythmbox [**third-party plugins PPA**][20] will stop working. The plugins Rhythmbox ships with will obviously work.

请注意：升级Rhythmbox后，里面的[**第三方插件**][20]将停止工作。Rhythmbox插件可以正常的运行。

**Rhythmbox** (version in Ubuntu 13.10: 2.99.1, version in PPA: 3.0.1):

**Rhythmbox**（Ubuntu 13.10下的版本：2.99.1，PPA中的版本：3.0.1）：

    sudo add-apt-repository ppa:jacob/media
    sudo apt-get update
    sudo apt-get install rhythmbox

**VLC** (version in Ubuntu 13.10: 2.0.8, version in the PPA: 2.1.0):

**VLC**（Ubuntu 13.10下的版本：2.0.8，PPA中的版本：2.1.0）：

    sudo add-apt-repository ppa:videolan/stable-daily
    sudo apt-get update
    sudo apt-get install vlc

### 8. Tweak Nautilus: disable recursive search and install a quick file previewer ###

### 8. Tweak Nautilus: 禁用递归搜索和文件快速预览 ###
![](http://dl.dropboxusercontent.com/u/1113424/img/nautilus-no-recursive.png)


The type-ahead find feature was remove from Nautilus starting with version 3.6. Later versions perform a search in the current directory and all its subdirectories when you start typing a file name. And this makes it unusable at times so if you find this behavior annoying, you can install Nautilus patched to allow [**disabling recursive search**][21] (you can easily enable it back if you want).

在Nautilus V3.6之后，提前键入查找功能就被去除掉了。之后版本的搜索就只是在当前文件夹和其子文件下进行搜索。这用起来就很不爽了，如果你为此感到烦恼的话就安装Nautilus的补丁[**禁用递归搜索**][21]（你可以很方便的启用它）。

**To upgrade Nautilus to the patched version that allows disabling recursive search, use the following commands:**

**用下面的命令将Nautilus升级到可以禁用递归搜过的版本**

    sudo add-apt-repository ppa:dr3mro/personal
    sudo apt-get update
    sudo apt-get upgrade
    nautilus -q

**Then, disable recursive search using the following command:**

**然后使用下面的命令禁用递归搜索**

    gsettings set org.gnome.nautilus.preferences enable-recursive-search false

If later on you want to re-enable recursive search, use the command below:

如果你还想恢复递归搜索的功能，使用下面的命令行：

    gsettings set org.gnome.nautilus.preferences enable-recursive-search true

![](http://dl.dropboxusercontent.com/u/1113424/img/gnome-sushi.png)

**GNOME Sushi** is a quick file previewer for Nautilus. To install it, click the button below (this will install gnome-sushi and unoconv, required to be able to preview some files such as documents):

**GNOME Sushi**是一款快速预览的软件。点击西面的按钮安装。（会安装gnome-sushi 和 unoconv来实现预览）。

[![](https://apps.ubuntu.com/assets/images/scbutton-free-200px.png)][22]

or install it via command line:

或者输入命令行：

    sudo apt-get install gnome-sushi unoconv

To use it, select a file (picture, text or document, sound file and so on) and press the SPACE key to preview that file. You can close the preview either by clicking the SPACE key again or clicking the window close button.

要使用这个软件，需选择一个文件（图片、文本文档、音乐文件等）然后点击SPACE按钮来预览。再次点击SPACE按钮或者关闭窗口可以关闭预览。

**Now it's your turn. What are the first things you install or tweak after a fresh Ubuntu installation?**

**你的时间到啦！在Ubuntu安装介绍之后，你会选择哪个作为第一个安装的呢？**
--------------------------------------------------------------------------------

via: http://www.webupd8.org/2013/10/8-things-to-do-after-installing-ubuntu.html

译者：[Timeszoro](https://github.com/Timeszoro) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

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