 十动然拒：一款 Linux 笔记本电脑点评
=============

简述：我是个 Mac 电脑重度用户，但我其实 [对目前最新的 MacBook Pro 是失望的][2]。由此我就开始去研究了下看是否有 [一些可以替代前者（New MacBook Pro）][3] 的选择。然而让我也意想不到的是，这居然使我产生了离开 Mac 平台的决定。

首先我们来看看 2017 年 CES（LCTT 译注：International Consumer Electronics Show，国际消费类电子产品展览会）大会后发布的 HP Spectre x360 13 寸笔记本电脑，拥有 4K 显示屏的新款笔记本电脑。我是从[百思买][4]（这不是一个赞助链接）买来的这款电脑，因为这是唯一售卖这款配置的零售商。我的目标是使用 Ubuntu 这个系统替代跑在这款笔记本上的  Windows 。

以下是我过去几个月使用这款笔记本的感受，还有一些在使用中对自己的使用习惯的重新认识。

### Ubuntu 系统

安装 Ubuntu 还是很简单的。当时电脑到手的时候预装的是 Windows 10 的系统。当时我使用 Windows 内建的硬盘管理工具来 [缩减主分区][5] 并将剩余的空间分配给 Linux 系统。我 [通过 USB 设备加载了 Ubuntu 系统镜像][6]，这款笔记本能够很方便的适配 USB-A 接口（这在新版的 Mac 系列电脑是没有的）。然后我就按照 [Ubuntu 的简便安装说明][7]，将 BIOS 设置为 [从 USB 启动][8]。

### 屏幕

Spectre x360 的 4k 显示屏简直令人惊艳。令我觉得吃惊的是，最新的 Ubuntu 系统在高 DPI 的屏幕上体验也是非常不错的。系统内建的设置工具配合 [gnome-tweak-tool][9] 这样的附加工具，你可以更好的控制用户界面在 4K 屏上的渲染，2 倍于原生大小的控件使得它们看起非常不错，你也可以将默认字体大小调整到一个合适的比例，甚至还可以调整窗口标题栏和任务管理器上的图标大小。虽然有点繁琐，但我自己设置时也没花多久时间。

### 触控板

实话说触控板有点细微的声音，但还是能够很不错的配合手指移动，Ubuntu 系统也默认支持多点触控。然而你会很快的发现你在打字的时候会误触触控板导致光标到处乱晃。在 Linux 上的默认 Synaptics 触控驱动并不能够很好的识别这款机型的手掌误触，解决方法是切换到 [新的 libinput 系统][10]，通过调整 [xinput 设置][11] 就可以让触控板工作的不错。

但我所习惯的手势操作，比如两指滑动回到 Chrome 浏览器，又或者说四指滑动切换工作区，这些操作在 Ubuntu 系统上就没法用了，或者实在想用可以通过 [libinput-gestures][12] 这样的工具来启用他们。令人失望的是，就算使用上面的工具体验其实也一般，因为其实只有 50% 的几率能识别那些手势。“点击触控板”的功能也有些问题：当你使用大拇指双击触控板或触控板按钮表面想要点击，系统会认为你要移动光标或者使用多点触控来调整大小，又一次的失望。

### 键盘

键盘手感就还不错。键盘的键程挺长，这样打起字来就会比较快。左侧 Ctrl 键在左下角所以对我来说就几乎用不上了（不像 Macs 系列电脑就会将 function 键放在那）。方向键工作的不错。比较奇特的是，键盘右侧有一列额外的键，分别是 Delete 键、Home 键、Page Up 键、Page Down 键和 End 键。由于使用习惯导致我在将手从箭头控制键换到 Home 键的时候没法额外考虑还有一列键。而且由于这样的设计我在打字时手没法维持在键盘中央，这让我觉得好像离键盘右侧的键远了许多。

起初我觉得那一列键（Home 键、Page Up 键之类）是多余的，但自从我使用 Sublime Text（一款代码编辑器）来写代码之后，我发现在 Linux 系统和 Windows 系统下输入文本时其实挺依赖那些键的，这就很好理解为什么惠普公司在设计时决定要加入这些键了。作为一个 Mac 用户，我经常会使用 Command 键和向右键来使光标到行结束的位置，而在 Linux 系统和 Windows 系统用户就直接使用 End 键。其实要将键盘映射成和 Mac 一样也不是不行的，但是却很难保证所有的程序都会一样的映射。我花了挺多时间在重组我的肌肉记忆上，这个过程蛮痛苦的，就好像我尝试去使用 [Dvorak 键盘布局][13] 的那个夏天。

### 音响

此款机型有四个扬声器：两个 B&O（Bang & Olufsen，音响制造商）扬声器在上部，两个在下部。上部的两个扬声器在 Ubuntu 系统中没法工作，这是一个 [内核问题][14]，尚未解决。下部的两个扬声器正常工作但声音有点小。耳机插孔使用正常，当插上耳机时扬声器也会自动静音。但我相信这可能是由于我为了让其他的硬件工作而将内核升级到了 [4.10 测试版本][15] 才出现的。我觉得社区最终会解决内核问题，所以上部扬声器无法工作的问题应该只是暂时性的。这些情况其实也就证明了为什么惠普公司自带的是带有一堆额外的神奇驱动的 Windows 系统。

### 电池续航

电池续航的问题真的就很糟糕了，我想主要是因为 4k 显示屏太耗电了。此外我还发现了 CPU 散热风扇在高速运转使会从笔记本左侧的出风口吹出热风。这风热的程度如果你把它放到你的腿上会让你感觉很不舒服。我觉得这应该是 Ubuntu 的默认电源管理配置的缺陷。为了解决这个问题，你可以使用诸如 [powertop][16] 或者 [pm-powersave][17] 这样的工具。Intel 公司也提供 [Linux 系统固件支持][18] 来使 GPU 更好的工作。通过各种优化，我可以使电池续航能力接近 5 小时：和广告中宣传的 9 小时以上相去甚远。其实也有好的一点，使用 USB-C 接口充电速度快很多。这个接口也能很好的配合我得 Nexus X 手机充电，因为它们都是一样的接口。

### 二合一

惠普 Spectre x360 这款机型名字来源于它独特的设计，通过屏幕旋转可以变成一台平板电脑。变形后在 Ubuntu 系统上无需设置就可以完成点击、滚动和缩放操作。它甚至支持直接使用前进/后退手势操作，这些操作连它的触摸板也不支持。当你将它旋转为平板模式，键盘和触摸板会自动禁用。你可以将系统设置为 [便携模式][19]，Gnome 桌面键盘就会启用，体验还不错哦。比较糟糕的是不支持屏幕自动旋转，但我还是使用 [iio-sensor-proxy][20] 和 [这个一次性脚本][21] 东拼西凑地实现了这个功能。最后我虽然实现了这个功能，但是我发现使用 16:9 的屏幕好伤我的眼睛，当电脑处于平板电脑时候我需要使我的眼睛移动很长一段距离。

### 窗口管理器和各种软件

从 1998 年 RedHat 5.0 版开始我就不怎么常用 Linux 桌面版本了。时光飞逝，Ubuntu 发展迅猛，默认用户界面是他们自主研发的 Unity（Gnome 的变体），感觉还不错。我其实用过原生的 Gnome ，但它与别的桌面比较起来让我觉得非常的笨拙。我最后还是最喜欢 KDE，而且如果让我再次选择，我也会选择 KDE 的 [Kubuntu][22]。总体来说 KDE 的窗口管理器让我觉得非常棒而且我想要的它都有！

在这次的回归 Linux 探索中，我意识到其实我基本上就在使用以下 8 个软件：浏览器（Chrome）、终端（没什么特别喜欢的）、文本编辑器（Sublime Text 3）、配置工具、可视化文件管理器、自动化备份工具（Arq）、类似 Flux 的屏幕亮度调节器，和图片编辑器（GIMP）。这几乎就是我所需要的软件了，其他别的需求非常容易满足。此外，我还比较依赖几个控件：时钟、WIFI 状态、电池状态和音量调节。我一般也会使用任务管理器（比如 Dock）和虚拟工作空间（比如 Mission Control 或 Expose）。我几乎不会用桌面图标、桌面提醒、最近使用的软件、搜索功能和应用软件菜单，所以我就可以适应 Linux 系统的种种设置了。

### 十动然拒

如果你正在考虑购入一款笔记本电脑，或许可以试试这款。尽管我是这样说，我还是准备要卖掉这台 Spectre x360，然后回到我的 2012 年中期款的 MacBook Air 怀抱中去。也不能说惠普公司或是 Linux 桌面平台的错吧，主要还是因为时间更宝贵。

我是如此的被 Mac 系统的高端用户体验所宠爱着，以至于我对别的东西都特别难以高效起来。我的脑袋几乎已经被 Mac 的触摸板、键盘布局和打字输入习惯等等体验所征服。所以我用起来惠普的电脑和 Linux 系统就觉得被拖慢了很多，感觉好像我就要完蛋了。当我使用计算机的时候，我只希望花更多的时间在提高我的技术（编程、写作等等）上。我只希望我将我仅有的“再学习”能力使用在一些尚未明白和不熟悉的课题上，比如 [新型函数式编程语言][23] 和 [同态加密][24] 等等。我再也不想花更多的时间去学习什么基本使用方法了。

反过来说，我也曾花了超过 2 年时间去学习弹钢琴，弹钢琴需要我死记硬背和不断的机械性重复训练。当我在学习钢琴的时候我发现这个过程其实打开了我的思维，让我对曾经有了更深的理解。我对音乐的学习，也让我懂得了许多曾经没有理解的事。可以说，我对音乐的“再学习”打开了我的视野。所以，我也琢磨去适应惠普的硬件和 Linux 桌面系统会不会也对我有这样的影响。

最终说明，我还是固执的。可能以后吧，我也会需要去适应新的工作方式来让我保持最新的状态，就好像电报员终有一天一定会从摩斯电码转向去使用 [电传打字机][25] 一样。我希望到了未来的那天，我仍然会有耐心和远见让我平滑的过渡。可能，只有当这样东西会创造出更多的可能性，我才会选择那些需要“再学习”的东西，就好像一个为达到目的才去做的石蕊试验（测试液体酸碱度？）一样。至少目前来说，我还是会选择留在 Mac 下。

--------------------------------------------------------------------------------

作者简介：

我是《Effective Python》一书的作者，我是一名软件工程师，我曾在谷歌工作了 11 年，我目前专注于调查统计，此外，我还曾在云计算基础设施建设和开放协议上有过工作经验。

以后，如果你还想阅读我写的文章，可以关注我的推 @haxor。如果你遇到什么问题，也可以写邮件给我，或者直接在下面写评论。如果你觉得这篇文章还不错，点击这里也可以看看我别的兴趣爱好。

-----------------

via: http://www.onebigfluke.com/2017/04/discovering-my-inner-curmudgeon-linux.html

作者：[Brett Slatkin][a]
译者：[kenxx](https://github.com/kenxx)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:http://www.onebigfluke.com/
[1]:http://www.onebigfluke.com/2017/04/discovering-my-inner-curmudgeon-linux.html
[2]:http://www.onebigfluke.com/2016/10/lamenting-progress.html
[3]:http://www.onebigfluke.com/2016/10/alternatives-to-apple-computers.html
[4]:http://www.bestbuy.com/site/hp-spectre-x360-2-in-1-13-3-4k-ultra-hd-touch-screen-laptop-intel-core-i7-16gb-memory-512gb-solid-state-drive-dark-ash-silver/5713178.p?skuId=5713178
[5]:https://www.howtogeek.com/101862/how-to-manage-partitions-on-windows-without-downloading-any-other-software/
[6]:https://www.ubuntu.com/download/desktop/create-a-usb-stick-on-windows
[7]:https://www.ubuntu.com/download/desktop/install-ubuntu-desktop
[8]:http://support.hp.com/us-en/document/c00364979
[9]:https://launchpad.net/gnome-tweak-tool
[10]:https://launchpad.net/xserver-xorg-input-libinput
[11]:https://wiki.archlinux.org/index.php/Libinput#Configuration
[12]:https://github.com/bulletmark/libinput-gestures
[13]:https://en.wikipedia.org/wiki/Dvorak_Simplified_Keyboard
[14]:https://bugzilla.kernel.org/show_bug.cgi?id=189331
[15]:http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.10/
[16]:https://blog.sleeplessbeastie.eu/2015/08/10/how-to-set-all-tunable-powertop-options-at-system-boot/
[17]:http://askubuntu.com/questions/765840/does-pm-powersave-start-automatically-when-running-on-battery
[18]:https://01.org/linuxgraphics/downloads/firmware
[19]:https://launchpad.net/onboard
[20]:https://github.com/hadess/iio-sensor-proxy
[21]:http://askubuntu.com/questions/634151/auto-rotate-screen-on-dell-13-7000-with-15-04-gnome/889591#889591
[22]:https://www.kubuntu.org/
[23]:http://docs.idris-lang.org/en/latest/tutorial/index.html#tutorial-index
[24]:https://arxiv.org/abs/1702.07588
[25]:https://en.wikipedia.org/wiki/Teleprinter
