在Ubuntu上安装和配置Nvidia Optimus驱动
================================================================================
Nvidia Optimus是一款利用“双显卡切换”技术的混合GPU系统，但长期以来受限于Linux系统上的诸多不便与限制。在数年的等待之后，搭载这全新内核的Ubuntu 14.04最终实现了非常容易安装的专用驱动的兼容性。这篇文章首先为不熟悉Nvidia Optimus的读者简介相关背景，然后展示整个安装过程。对于对Xorg有着丰富配置经验的老手，可以直接跳到安装部分。

### 背景知识 ###
对那些不熟悉Nvidia Optimus的读者，在板载Intel图形芯片组和使用被称为“GPU切换”、对需求有着更强大处理能力的NVIDA显卡这两者之间的进行切换是很有必要的。这么做的主要目的是延长笔记本电池的使用寿命，以便在不需要Nvidia GPU的时候将其关闭。带来的好处是显而易见的，比如说你只是想简单地打打字，笔记本电池可以撑8个小时；如果看高清视频，可能就只能撑3个小时了。使用Windows时经常如此。

![](https://farm6.staticflickr.com/5581/14612159387_2e89a52085_z.jpg)

几年前，我买了一台上网本(Asus VX6)，犯的最蠢的一个错误就是没有检查Linux驱动兼容性。因为在以前，特别是对于一台上网本大小的设备，这根本不会是问题。即便某些驱动不是现成可用的，我也可以找到其它的办法让它正常工作，比如安装专门模块或者使用反向移植。对我来说这是第一次——我的电脑预先配备了Nvidia ION2图形显卡。

在那时候，Nvidia的Optimus混合GPU硬件还是相当新的产品，而我也没有预见到在这台机器上运行Linux会遇到什么限制。如果你读到了这里，恰好对Linux系统有经验，而且也在几年前买过一台笔记本，你可能对这种痛苦感同身受。

[Bumblebee][4]项目直到最近因为得到Linux系统对混合图形方面的支持才变得好起来。事实上，如果配置正确的话，通过命令行接口（如“optirun vlc”）让你选定的应用程序能利用Nvidia显卡功能是可行的，但让HDMI一类的功能运转起来就很不同了。(译者注：Bumblebee 项目是把Nvidia的Optimus技术移到Linux上来。)

我之所以使用“如果配置正确的话”这个短语，是因为实际上为了让它发挥出性能来往往不只是通过几次尝试去改变Xorg的配置就能做到的。如果你以前没有使用过ppa-purge或者运行过“dpkg-reconfigure -phigh xserver-xorg”这类命令，那么我可以向你保证修补Bumblebee的过程会让你受益匪浅。

[![](https://farm6.staticflickr.com/5588/14798680495_947c38b043_o.png)][2]

在等待了很长一段时间后，Nvidia才发布了支持Optimus的Linux驱动，但我们仍然没有得到对双显卡切换的真正支持。然而，现在有了Ubuntu 14.04、nvidia-prime和nvidia-331驱动，任何人都可以在Intel芯片和Nvidia显卡之间轻松切换。不过不幸的是，为了使切换生效，还是会受限于需要重启X11视窗系统（通过注销登录实现）。

为了减轻这种不便，有一个小型程序用于快速切换，稍后我会给出。这个驱动程序的安装就此成为一件轻而易举的事了，HDMI也可以正常工作，这足以让我心满意足了。

### 安装Nvidia Optimus驱动 ###

为了更快地描述这个过程，我假设你已经安装好Ubuntu 14.04或者Mint 17。

作为一名系统管理员，最近我发现90%的Linux操作通过命令行执行起来更快，但这次我推荐使用“Additional Drivers”这个应用程序，你可能使用它安装过网卡或声卡驱动。

![](https://farm4.staticflickr.com/3886/14795564221_753f9e2d99_z.jpg)

**注意：下面的所有命令都是在~#提示符下执行的，需要root权限执行。在运行命令前，要么使用“sudo su”（切换到root权限），要么在每条命令的开头使用sudo运行。**

你也可以在命令行输入如下命令进行安装：

     ~# apt-get install nvidia-331 nvidia-settings nvidia-prime 

接下来是重启。确保你没有安装类似于Bumblebee或其他已加载的Nvidia驱动，否则很可能会破坏你的X11。万一你没有进行全新安装，之前有安装过Bumblebee程序，那么在安装nvidia-331和nvidia-prime前运行下列命令：

     ~# apt-get purge libvdpau-va-gl1 bumblebee* nvidia*

### 在Nvidia和非Nvidia显卡之间切换 ###

你可以通过按下Alt+F2或者从命令行键入下列命令实现Nvidia和非Nvidia（如Intel）显卡之间的切换：

    ~$ nvidia-settings 

**注意：~$表示不以root用户身份执行。**

![](https://farm4.staticflickr.com/3921/14796320814_de5c9882c2_z.jpg)

你也可以使用命令行设置默认使用哪一块显卡：

    ~# prime-select intel (或 nvidia)

使用这个命令进行切换：

    ~# prime-switch intel (或 nvidia)

两个命令的生效都需要重启X11，可以通过注销和重新登录实现。当然重启电脑也行。

对Ubuntu用户键入命令：

    ~# service lightdm restart

对Mint用户键入命令：

    ~# service mdm restart

键入这个命令确认哪一块显卡在运行：

    ~# prime-select query

最后，你可以通过添加ppa:nilarimogard/webupd8来安装叫做prime-indicator的程序包，实现通过工具栏快速切换来重启Xserver会话。要安装它，只需要运行：

    ~# add-apt-repository ppa:nilarimogard/webupd8
    ~# apt-get update
    ~# apt-get install mesa-utils prime-indicator 

### 总结 ###

总而言之，这个方法仍不完美，但至少它能简单易用地提供合适的专门驱动支持。很多人不会使用这个安装方法来设置Bumblebee，因为他们发现使用Nvidia驱动会很快耗完电池。对我个人的使用来说，这是一个更好的方法，因为我使用Nvidia只为了满足HDMI输出，这表示我必须把电脑插上电源才行。不然的话，Intel的显卡对我的笔记本来说够用了，因为除了频繁地使用Libreoffice、Chromium和Terminator这几个软件我别无所求。

如果你宁愿选择在默认情况下使用Intel显卡，为运行特定的应用程序使用Nvidia显卡，你应该去阅读那些Bumblebee教程。一旦你得以让Bumblebee正常工作起来，我建议你记录下用来配置电脑的命令和过程。因为没有什么比9个月之后再来一次全新安装但忘记了上次是如何成功安装更糟糕的事情了。

也可以花时间查看一下这个我偶然发现的[脚本][3]，用来方便地在Bumblebee和Nvidia-Prime之间进行切换，但我必须强调并没有亲自对此进行实验。

最后，我感到非常惭愧，写了这么多才得以为Linux上的显卡提供了专门支持，但仍然不能实现双显卡切换，因为混合图形技术似乎是便携式设备的未来。一般情况下，AMD会发布Linux平台上的驱动支持，但我认为Optimus是目前为止我遇到过的最糟糕的硬件支持问题。

不管这篇教程对你的使用是否完美，但这确实是利用这块Nvidia显卡最容易的方法。你可以试着在Intel显卡上只运行最新的Unity，然后考虑2到3个小时的电池寿命是否值得权衡。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/08/install-configure-nvidia-optimus-driver-ubuntu.html

作者：[Christopher Ward][a]
译者：[KayGuoWhu](https://github.com/KayGuoWhu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/christopher
[1]:http://bumblebee-project.org/
[2]:http://xkcd.com/963
[3]:https://devtalk.nvidia.com/default/topic/705993/easy-switch-between-bumblebee-and-nvidia-prime/