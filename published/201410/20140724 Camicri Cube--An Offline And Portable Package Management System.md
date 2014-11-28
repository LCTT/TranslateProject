Camicri Cube: 可离线的便携包管理系统
================================================================================
![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/camicri-cube-206x205.jpg)

众所周知，在系统中使用新立得包管理工具或软件中心下载和安装应用程序的时候，我们必须得有互联网连接。但，如果您刚好没有网络或者是网络速度死慢死慢的呢？在您的 Linux 桌面系统中使用软件中心包管理工具来安装软件绝对是一个头痛的问题。反而，您可以从相应的官网上手工下载应用程序包并手工安装。但是，大多数的 Linux 用户并不知道他们希望安装的应用程序所需要的依赖关系包。如果您恰巧出现这种情况，应用怎么办呢？现在一切都不用担心了。今天，我们给您介绍一款非常棒的名叫 **Camicri Cube** 的离线包管理工具。

您可以把此包管理工具装在任何联网的系统上，下载您所需要安装的软件列表，然后把它们安装到没联网的机器上，就可以安装了。听起来很不错吧？是的，它就是这样操作的。Cube 是一款像新立得和 Ubuntu 软件中心这样的包管理工具，但是一款便携式的。它在任何平台（Windows 系统、基于 Apt 的 Linux 发布系统）、在线状态、离线状态、在闪存或任何可移动设备上都是可以使用和运行的。我们这个实验项目的主要目的是使处在离线状态的 Linux 用户能很容易的下载和安装 Linux 应用程序。

Cube 会收集您的离线电脑的详细信息，如操作系统的详细信息、安装的应用程序等等。然后使用 USB 迷你盘对 cube 应用程序进行拷贝，得到一副本，把其放在其它有网络连接的系统上使用，接着就可以下载您需要的应用程序列表。下载完所有需要的软件包之后，回到您原来的计算机，并开始安装。Cube 是由 **Jake Capangpangan** 开发和维护的，是用 C++ 语言编写，而且已经集成了所有必须的包。因此，使用它并不需要再安装任何额外的软件。

### 安装 ###

现在，让我们下载 Cube 程序包，然后在没有网络连接的离线系统上进行安装。既可以从[官网主站页面][1]下载，也可以从 [Sourceforge 网站][2]下载。要确保下载的版本跟您的离线计算机架构对应的系统相匹配。比如我使用的是64位的系统，就要下载64位版本的安装包。

    wget http://sourceforge.net/projects/camicricube/files/Camicri%20Cube%201.0.9/cube-1.0.9.2_64bit.zip/

对此 zip 文件解压，解压到 home 目录或者着是您想放的任何地方：

    unzip cube-1.0.9.2_64bit.zip

这就好了。接着，该是知道怎么使用的时候了。

### 使用 ###

这儿，我使用的是两台装有 Ubuntu 系统的机器。原机器（离线-没有网络连接）上面跑着的是 **Ubuntu 14.04** 系统，有网络连接的机器跑着的是 **Lubuntu 14.04** 桌面系统。

#### 离线系统上的操作步骤: ####

在离线系统上，进入已经解压的 Cube 文件目录，您会发现一个名叫 “cube-linux” 的可执行文件，双击它，并点击执行。如果它是不可执行的，用如下命令设置其可执行权限。

    sudo chmod -R +x cube/

然后，进入 cube 目录，

    cd cube/

接着执行如下命令来运行：

    ./cube-linux

输入项目的名称（比如sk）然后点击**创建**按纽。正如我上面提到的，这将会创建一个与您的系统相关的完整详细信息的新项目，如操作系统的详细信息、安装的应用程序列表、库等等。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Cube-Startup-Create-or-choose-a-project-to-be-managed_0013.png)

如您所知，我们的系统是离线的，意思是没有网络连接。所以我点击**取消**按纽来跳过资源库的更新过程。随后我们会在一台有网络连接的系统上更新此资源库。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0023.png)

再一次，在这台离线机器上我们点击 **No** 来跳过更新，因为我们没有网络连接。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0033.png)

就是这样。现在新的项目已经创建好了，它会保存在我们的主 cube 目录里面。进入 Cube 目录，您就会发现一个名叫 Projects 的目录。这个目录会保存有您的离线系统的必要完整详细信息。 

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Selection_004.png)

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Selection_005.png)

现在，关闭 cube 应用程序，然后拷贝整个主 **cube** 文件夹到任何的闪存盘里，接入有网络连接的系统。

#### 在线系统上操作步骤: ####

往下的操作步骤需要在有网络连接的系统上进行。在我们的例子中，用的是 **Lubuntu 14.04** 系统的机器。

跟在源机器上的操作一样设置使 cube 目录具有可执行权限。

    sudo chmod -R +x cube/

现在，双击 cube-linux 文件运行应用程序或者也可以在终端上加载运行，如下所示：

    cd cube/
    ./cube-linux

在窗口的 “Open Existing Projects” 部分会看到您的项目列表，选择您需要的项目。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Cube-Startup-Create-or-choose-a-project-to-be-managed_0014.png)

随后，cube 会询问这是否是您的项目所在的源机器。它并不是我的源（离线）机器，所以我点击 **No**。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0024.png)

接着会询问是否想要更新您的资源库。点击 **OK** 来更新资料库。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0034.png)

下一步，我们得更新所有过期的包/应用程序。点击 Cube 工具栏上的 “**Mark All updates**” 按纽。然后点击 “**Download all marked**” 按纽来更新所有过期的包/应用程序。如下截图所示，在我的例子当中，有302个包需要更新。这时，点击 **OK** 来继续下载所标记的安装包。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_005.png)

现在，Cube 会开始下载所有已标记的包。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Downloading-packages_006.png)

我们已经完成了对资料库和安装包的更新。此时，如果您在离线系统上还需要其它的安装包，您也可以下载这些新的安装包。

#### 下载新的应用程序 ####

例如，现在我想下载 **apache2** 包。在**搜索**框里输入包的名字，点击搜索按纽。Cube   程序会获取您想查找的应用程序的详细信息。点击 “**Download this package now**”按纽，接着点击 **OK** 就开始下载了。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_008.png)

Cube 将会下载 apache2 的安装包及所有的依赖包。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Downloading-packages_009.png)

如果您想查找和下载更多安装包的话，只要简单的点击 “**Mark this package**” 按纽就可以搜索到需要的包了。只要您想在源机器上安装的包都可以标记上。一旦标记完所有的包，就可以点击位于顶部工具栏的 “**Download all marked**” 按纽来下载它们。

在完成资源库、过期软件包的更新和下载好新的应用程序后，就可以关闭 Cube 应用程序。然后，拷贝整个 Cube 文件夹到任何的闪盘或者外接硬盘。回到您的离线系统中来。

#### 离线机器上的操作步骤: ####

把 Cube 文件夹拷回您的离线系统的任意位置。进入 cube 目录，并且双击 **cube-linux** 文件来加载启动 Cube 应用程序。

或者，您也可以从终端下启动它，如下所示：

    cd cube/
    ./cube-linux

选择您的项目，点击打开。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Cube-Startup-Create-or-choose-a-project-to-be-managed_0012.png)

然后会弹出一个对话框询问是否更新系统，尤其是已经下载好新的资源库的时候，请点击“是”。因为它会把所有的资源库传输到您的机器上。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0021.png)

您会看到，在没有网络连接的情况下这些资源库会更新到您的离线机器上。那是因为我们已经在有网络连接的系统上下载更新了此资源库。看起来很酷，不是吗？

更新完资源库后，让我们来安装所有的下载包。点击 “Mark all Downloaded” 按纽选中所有的下载包，然后点击 Cube 工具栏上的 “Install All Marked” 按纽来安装它们。Cube 应用程序会自动打开一个新的终端窗口来安装所有的软件包。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Terminal_001.png)

如果遇到依赖的问题，进入 **Cube Menu -> Packages -> Install packages with complete dependencies** 来安装所有的依赖包。

如果您只想安装特定的包，定位到列表包位置，点击 “Downloaded” 按纽，所有的已下载包都会被列出来。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0035.png)

然后双击某个特定的包，点击 “Install this”按纽来安装或者如果想过后再安装它的话可以先点击 “Mark this” 按纽。

![](http://180016988.r.cdn77.net/wp-content/uploads/2014/07/Camicri-Systems-%C2%A9-Cube-Portable-Package-Manager-1.0.9.2-sk_0043.png)

顺便提一句，您可以在任意已经连接网络的系统上下载所需要的包，然后在没有网络连接的离线系统上安装。

### 结论 ###

这是我曾经使用过的最好、最有用的软件工具之一。但我在用 Ubuntu 14.04 测试盒子测试的时候，遇到了很多依赖问题，还经常会出现闪退的情况。也仅仅是在最新 Ubuntu 14.04 离线系统上使用没有遇到任何问题。希望这些问题在老版本的 Ubuntu 上不会发生。除了这些小问题，这个小工具就如同宣传的一样，像魔法一样神奇。

欢呼吧!


原文作者：

![](http://1.gravatar.com/avatar/1ba62ac2b395f541750b6b4f873eb37b?s=70&d=monsterid&r=G)

[SK][a](Senthilkumar，又名SK，来自于印度的泰米尔纳德邦，Linux 爱好者，FOSS 论坛支持者和 Linux 板块顾问。一个充满激情和活力的人，致力于提供高质量的 IT 专业文章，非常喜欢写作以及探索 Linux、开源、电脑和互联网等新事物。)

--------------------------------------------------------------------------------

via: http://www.unixmen.com/camicri-cube-offline-portable-package-management-system/

译者：[runningwater](https://github.com/runningwater) 校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://www.unixmen.com/author/sk/
[1]:https://launchpad.net/camicricube
[2]:http://sourceforge.net/projects/camicricube/
