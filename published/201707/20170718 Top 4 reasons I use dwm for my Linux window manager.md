我选择 dwm 作为窗口管理器的 4 大理由
============================================================

> <ruby>窗口管理器<rt>window manager</rt></ruby>负责管理打开窗口的大小、布置以及其它相关的方面。


![Top 4 reasons I use dwm for my Linux window manager](https://opensource.com/sites/default/files/styles/image-full-size/public/images/life/car-penguin-drive-linux-yellow.png?itok=ueZE5mph "我选择 dwm 作为窗口管理器的 4 大理由")

（图片来自：Internet Archive [Book][4] [Images][5] 由 Opensource.com 修改 CC BY-SA 4.0）

我喜欢极简。如果可能，我会尽量在一个终端下运行所有需要的程序。这避免了一些浮夸的特效占用我的资源或者分散我的注意力。而且，无论怎么调整窗口大小和位置却依旧无法使它们完美地对齐，这也让我感到厌烦。

出于对极简化的追求，我喜欢上了 [Xfce][6] 并且把它作为我主要的 Linux [桌面环境][7]好几年了。直到后来我看了 [Bryan Lunduke][8] 关于他所使用的名为 [Awesome][10]  的[窗口管理器][9]的视频。Awesome 为用户整齐地布置好他们的窗口，看起来就是我想要的效果。但在我尝试之后却发现我难以把它配置成我喜欢的样子。于是我继续搜寻，发现了 [xmonad][11]，然而我遇到了同样的问题。[xmonad][11] 可以良好运作但为了把它配置成我理想中的样子我却不得不先通过 Haskell 语言这关。（LCTT 译注： AwesomeWM 使用 lua 语言作为配置语言，而 xmonad 使用 Haskell 语言）

几年后，我无意间发现了 [suckless.org][12] 和他们的窗口管理器 [dwm][13]。

简而言之，一个窗口管理器，例如 KDE，Gnome 或者 Xfce，包括了许多部件，其中除了窗口管理器还有其它应用程序。窗口管理器负责管理打开窗口的大小、布置（以及其它窗口相关的方面）。不同的桌面环境使用不同的窗口管理器，KDE 使用 KWin，Gnome 2 使用 Metacity， Gnome 3 使用 Mutter， 以及 Xfce 使用 Xfwm。当然，你可以方便地替换这些桌面环境的默认窗口管理器。我已经把我的窗口管理器替换成 dwm，下面我说说我喜欢 dwm 的理因。

### 动态窗口管理

与 Awesome 及 xmonad 一样，dwm 的杀手锏是它能利用屏幕的所有空间为你自动排布好窗口。当然，在现在的大多数桌面环境中，你也可以设置相应的快捷键把你的窗口放置在屏幕的上下左右或者是全屏，但是有了 dwm  我们就不需要考虑这么多了。

dwm 把屏幕分为主区域和栈区域。它包含三种布局：平铺，单片镜（monocle）和浮动。平铺模式是我最常使用的，它把一个主要的窗口放置在主区域来获取最大关注力，而将其余窗口平铺在栈区域中。在单片镜模式中，所有窗口都会被最大化，你可以在它们之间相互切换。浮动模式允许你自由调整窗口大小（就像在大多数窗口管理器下那样），这在你使用像 Gimp 这类需要自定义窗口大小的应用时更为方便。

一般情况下，在你的桌面环境下你可以使用不同的工作空间（workspace）来分类你的窗口，把相近的应用程序放置在计划好的工作空间中。在工作时，我会使用一个工作空间来进行工作，同时使用另一个工作空间来浏览网页。dwm 有一个相似的功能叫标签。你可以使用标签给窗口分组，当你选中一个标签时，就能显示具有相应标签的窗口。

### 高效

dwm 能让你的计算机尽量地节省电量。Xfce 和其它轻量桌面环境在较旧或者较低性能的机器上很受欢迎，但是相比于 Xfce，dwm 在登录后只使用了它们 1/3 的资源（在我的例子中）。当我在使用一台 1 GB 内存的 Eee PC （LCTT 译注：华硕生产的一款上网本，已停产）时，占用 660 MB 和 230MB 的差别就很大了。这让我有足够的内存空间运行我的编辑器和浏览器。

### 极简

通常，我让我的应用程序彼此相邻：作为主窗口的终端（通常运行着 Vim）、用来查阅邮件的浏览器，和另外一个用来查阅资料或者打开 [Trello][14] 的浏览器窗口。对于临时的网页浏览，我会在另一个工作空间或者说是另一个 _标签_ 中开启一个 Chromium 窗口。

![](https://opensource.com/sites/default/files/dwm.png)

*来自作者的屏幕截图。*

在标准的桌面环境下，通常会有一或两个面板占据着屏幕上下或者两侧的空间。我尝试过使用自动隐藏功能，但当光标太靠近边缘导致面板弹出造成的不便实在让我很厌烦。你也可以把它们设置得更小，但我还是更喜欢 dwm 的极简状态栏。

### 速度

评判速度时，我比较看重 dwm 在登录后的加载速度和启动程序的速度。如果使用更快、更新的计算机，你可能不会在意这些细节，但是对我来说，不同的桌面环境和窗口管理器会有明显的差距。我实在不想连这种简单的操作也要等待，它们应该一下子就完成。另外，使用键盘快捷键来启动程序比起用鼠标或者触控板要快一些，而且我不想让双手离开键盘。

### 小结

即便如此，我也不会向新手用户推荐 dwm。研究如何配置它需要耗费一些时间（除非你对你的发行版提供的默认配置感到满意）。我发现要让一些你想要的补丁正常工作可能会有点棘手，而且相应的社区也比较小（其 IRC 频道明确表示不提供补丁的手把手帮助）。所以，为了得到你想要的效果，你得有些付出才行。不过，这也是值得的。

而且你看，它就像 Awesome 一样 awesome。

--------------------------------------------------------------------------------

作者简介：

Jimmy Sjölund - 他是 Telia Company 的高级 IT 服务经理，关注团队开发、探索敏捷工作流和精益工作流的创新导师，以及可视化方向爱好者。他同时也是一名开源布道者，先前从事于 Ubuntu Studio 和 Plume Creator。

-----------------

via: https://opensource.com/article/17/7/top-4-reasons-i-use-dwm-linux-window-manager

作者：[Jimmy Sjölund][a]
译者：[haoqixu](https://github.com/haoqixu)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jimmysjolund
[1]:https://opensource.com/file/363336
[2]:https://opensource.com/article/17/7/top-4-reasons-i-use-dwm-linux-window-manager?rate=T8qhopZLfd1eum_NMLOSGckUh2nIjfeRpkERGjGhu7w
[3]:https://opensource.com/user/56551/feed
[4]:https://www.flickr.com/photos/internetarchivebookimages/14746482994/in/photolist-ot6zCN-odgbDq-orm48o-otifuv-otdyWa-ouDjnZ-otGT2L-odYVqY-otmff7-otGamG-otnmSg-rxnhoq-orTmKf-otUn6k-otBg1e-Gm6FEf-x4Fh64-otUcGR-wcXsxg-tLTN9R-otrWYV-otnyUE-iaaBKz-ovcPPi-ovokCg-ov4pwM-x8Tdf1-hT5mYr-otb75b-8Zk6XR-vtefQ7-vtehjQ-xhhN9r-vdXhWm-xFBgtQ-vdXdJU-vvTH6R-uyG5rH-vuZChC-xhhGii-vvU5Uv-vvTNpB-vvxqsV-xyN2Ai-vdXcFw-vdXuNC-wBMhes-xxYmxu-vdXxwS-vvU8Zt
[5]:https://www.flickr.com/photos/internetarchivebookimages/14774719031/in/photolist-ovAie2-otPK99-xtDX7p-tmxqWf-ow3i43-odd68o-xUPaxW-yHCtWi-wZVsrD-DExW5g-BrzB7b-CmMpC9-oy4hyF-x3UDWA-ow1m4A-x1ij7w-tBdz9a-tQMoRm-wn3tdw-oegTJz-owgrs2-rtpeX1-vNN6g9-owemNT-x3o3pX-wiJyEs-CGCC4W-owg22q-oeT71w-w6PRMn-Ds8gyR-x2Aodm-owoJQm-owtGp9-qVxppC-xM3Gw7-owgV5J-ou9WEs-wihHtF-CRmosE-uk9vB3-wiKdW6-oeGKq3-oeFS4f-x5AZtd-w6PNuv-xgkofr-wZx1gJ-EaYPED-oxCbFP
[6]:https://xfce.org/
[7]:https://en.wikipedia.org/wiki/Desktop_environment
[8]:http://lunduke.com/
[9]:https://en.wikipedia.org/wiki/Window_manager
[10]:https://awesomewm.org/
[11]:http://xmonad.org/
[12]:http://suckless.org/
[13]:http://dwm.suckless.org/
[14]:https://opensource.com/node/22546
[15]:https://opensource.com/users/jimmysjolund
[16]:https://opensource.com/users/jimmysjolund
[17]:https://opensource.com/article/17/7/top-4-reasons-i-use-dwm-linux-window-manager#comments
