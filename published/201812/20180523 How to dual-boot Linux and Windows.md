如何实现 Linux + Windows 双系统启动
=====
> 设置你的计算机根据需要启动 Windows 10 或 Ubuntu 18.04。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/migration_innovation_computer_software.png?itok=VCFLtd0q)

尽管 Linux 是一个有着广泛的硬件和软件支持的操作系统，但事实上有时你仍需要使用 Windows，也许是因为有些不能在 Linux 下运行的重要软件。但幸运地是，双启动 Windows 和 Linux 是很简单的 —— 在这篇文章中我将会向你展示如何实现 Windows 10 + Ubuntu 18.04 双系统启动。

在你开始之前，确保你已经备份了你的电脑文件。虽然设置双启动过程不是非常复杂，但意外有可能仍会发生。所以花一点时间来备份你的重要文件以防混沌理论发挥作用。除了备份你的文件之外，考虑制作一份备份镜像也是个不错的选择，虽然这不是必需的且会变成一个更高级的过程。

### 要求

为了开始，你将需要以下 5 项东西：

#### 1、两个 USB 闪存盘（或者 DVD-R）

我推荐用 USB 闪存盘来安装 Windows 和 Ubuntu，因为他们比 DVD 更快。这通常是毋庸置疑的， 但是创建一个可启动的介质会抹除闪存盘上的一切东西。因此，确保闪存盘是空的或者其包含的文件是你不再需要的。

如果你的电脑不支持从 USB 启动，你可以创建 DVD 介质来代替。不幸的是，因为电脑上的 DVD 烧录软件似乎各有不同，所以我无法使用这一过程。然而，如果你的 DVD 烧录软件有从一个 ISO 镜像中烧录的选项，这个选项是你需要的。

#### 2、一份 Windows 10 许可证

如果你的电脑已经安装 Windows 10，那么许可证将会被安装到你的电脑中，所以你不需要担心在安装过程中输入它。如果你购买的是零售版，你应该拥有一个需要在安装过程中输入的产品密钥。

#### 3、Windows 10 介质创建工具

下载并运行 Windows 10 [介质创建工具][1]。一旦你运行这个工具，它将会引导你完成在一个 USB 或者 DVD-R 上创建 Windows 安装介质的所需步骤。注意：即使你已经安装了 Windows 10，创建一个可引导的介质也是一个不错的主意，万一刚好系统出错了且需要你重新安装。

#### 4、Ubuntu 18.04 安装介质

下载 [Ubuntu 18.04][2] ISO 镜像。

#### 5、Etcher 软件（用于制作一个可引导 Ubuntu 的 USB 驱动器）

用于为任何 Linux 发行版创建可启动的介质的工具，我推荐 [Etcher][3]。Etcher 可以在三大主流操作系统（Linux、MacOS 和 Windows）上运行且不会让你覆盖当前操作系统的分区。

一旦你下载完成并运行 Etcher，点击选择镜像并指向你在步骤 4 中下载的 Ubuntu ISO 镜像， 接下来，点击驱动器以选择你的闪存驱动器，然后点击 “Flash!” 开始将闪存驱动器转化为一个 Ubuntu 安装器的过程。 （如果你正使用一个 DVD-R，使用你电脑中的 DVD 烧录软件来完成此过程。）

### 安装 Windows 和 Ubuntu

你应该准备好了，此时，你应该完成以下操作：

  * 备份你重要的文件
  * 创建 Windows 安装介质
  * 创建 Ubuntu 安装介质

有两种方法可以进行安装。首先，如果你已经安装了 Windows 10 ，你可以让 Ubuntu 安装程序调整分区大小，然后在空白区域上进行安装。或者，如果你尚未安装 Windows 10，你可以在安装过程中将它（Windows）安装在一个较小的分区上（下面我将描述如何去做）。第二种方法是首选的且出错率较低。很有可能你不会遇到任何问题，但是手动安装 Windows 并给它一个较小的分区，然后再安装 Ubuntu 是最简单的方法。

如果你的电脑上已经安装了 Windows 10，那么请跳过以下的 Windows 安装说明并继续安装 Ubuntu。 

#### 安装 Windows

将创建的 Windows 安装介质插入你的电脑中并引导其启动。这如何做取决于你的电脑。但大多数有一个可以按下以显示启动菜单的快捷键。例如，在戴尔的电脑上就是 F12 键。如果闪存盘并未作为一个选项显示，那么你可能需要重新启动你的电脑。有时候，只有在启动电脑前插入介质才能使其显示出来。如果看到类似“请按任意键以从安装介质中启动”的信息，请按下任意一个键。然后你应该会看到如下的界面。选择你的语言和键盘样式，然后单击 “Next”。

![Windows 安装][5]

点击“现在安装”启动 Windows 安装程序。

![现在安装][6]

在下一个屏幕上，它会询问你的产品密钥。如果因你的电脑在出厂时已经安装了 Windows 10 而没有密钥的话，请选择“我没有一个产品密钥”。在安装完成后更新该密码后会自动激活。如果你有一个产品密钥，输入密钥并单击“下一步”。

![输入产品密钥][7]

选择你想要安装的 Windows 版本。如果你有一个零售版，封面标签（LCTT 译注：类似于 CPU 型号的 logo 贴标）会告诉你你有什么版本。否则，它通常在你的计算机的附带文档中可以找到。在大多数情况下，它要么是 Windows 10 家庭版或者 Windows 10 专业版。大多数带有 家庭版的电脑都有一个简单的标签，上面写着“Windows 10”，而专业版则会明确标明。

![选择 Windows 版本][10]

勾选复选框以接受许可协议，然后单击“下一步”。

![接受许可协议][12]

在接受协议后，你有两种可用的安装选项。选择第二个选项“自定义：只安装 Windows （高级）”。

![选择 Windows 的安装方式][14]

接下来应该会显示你当前的硬盘配置。

![硬盘配置][16]

你的结果可能看起来和我的不一样。我以前从来没有用过这个硬盘，所以它是完全未分配的。你可能会看到你当前操作系统的一个或多个分区。选中每个分区并移除它。（LCTT 译注：确保这些分区中没有你需要的数据！！）

此时，你的电脑屏幕将显示未分配的整个磁盘。创建一个新的分区以继续安装。

![创建一个新分区][18]

你可以看到我通过创建一个 81920MB 大小的分区（接近 160GB 的一半）将驱动器分成了一半（或者说接近一半）。给 Windows 至少 40GB，最好 64GB 或者更多。把剩下的硬盘留着不要分配，作为以后安装 Ubuntu 的分区。

你的结果应该看起来像这样：

![保留未分配空间的分区][20]

确认分区看起来合理，然后单击“下一步”。现在将开始安装 Windows。

![安装 Windows][22]

如果你的电脑成功地引导进入了 Windows 桌面环境，你就可以进入下一步了。

![Windows 桌面][24]

#### 安装 Ubuntu

无论你是已经安装了 Windows，还是完成了上面的步骤，现在你已经安装了 Windows。现在用你之前创建的 Ubuntu 安装介质来引导进入 Ubuntu。继续插入安装介质并从中引导你的电脑，同样，启动引导菜单的快捷键因计算机型号而异，因此如果你不确定，请查阅你的文档。如果一切顺利的话，当安装介质加载完成之后，你将会看到以下界面：

![Ubuntu 安装欢迎屏幕][26]

在这里，你可以选择 “尝试 Ubuntu” 或者 “安装 Ubuntu”。现在不要安装，相反，点击 “尝试 Ubuntu”。当完成加载之后，你应该可以看到 Ubuntu 桌面。

![Ubuntu 桌面][28]

通过单击“尝试 Ubuntu”,你已经选择在安装之前试用 Ubuntu。 在 Live 模式下，你可以试用 Ubuntu，确保在你安装之前一切正常。Ubuntu 能兼容大多数 PC 硬件，但最好提前测试一下。确保你可以访问互联网并可以正常播放音频和视频。登录 YouTube 播放视频是一次性完成所有这些工作的好方法（LCTT 译注：国情所限，这个方法在这里并不奏效）。如果你需要连接到无线网络，请单击屏幕右上角的网络图标。在那里，你可以找到一个无线网络列表并连接到你的无线网络。

准备好之后，双击桌面上的 “安装 Ubuntu 18.04 LTS” 图标启动安装程序。

选择要用于安装过程的语言，然后单击 “继续”。

![选择 Ubuntu 的语言][30]

接下来，选择键盘布局。完成后选择后，单击“继续”。

![选择 Ubuntu 的键盘][32]

在下面的屏幕上有一些选项。你可以选择一个正常安装或最小化安装。对大多数人来说，普通安装是理想的。高级用户可能想要默认安装应用程序比较少的最小化安装。此外，你还可以选择下载更新以及是否包含第三方软件和驱动程序。我建议同时检查这两个方框。完成后，单击“继续”。

![选择 Ubuntu 安装选项][34]

下一个屏幕将询问你是要擦除磁盘还是设置双启动。由于你是双启动，因此请选择“安装 Ubuntu，与 Windows 10共存”，单击“现在安装”。

![安装 Ubuntu，与 Windows 10共存][36]

可能会出现以下屏幕。如果你从头开始安装 Windows 并在磁盘上保留了未分区的空间，Ubuntu 将会自动在空白区域中自行设置分区，因此你将看不到此屏幕。如果你已经安装了 Windows 10 并且它占用了整个驱动器，则会出现此屏幕，并在顶部为你提供一个选择磁盘的选项。如果你只有一个磁盘，则可以选择从 Windows 窃取多少空间给 Ubuntu。你可以使用鼠标左右拖动中间的垂直线以从其中一个分区中拿走一些空间并给另一个分区，按照你自己想要的方式调整它，然后单击“现在安装”。

![分配驱动器空间][38]

你应该会看到一个显示 Ubuntu 计划将要做什么的确认屏幕，如果一切正常，请单击“继续”。

![确认屏幕][39]

Ubuntu 正在后台安装。不过，你仍需要进行一些配置。当 Ubuntu 试图找到你的位置时，你可以点击地图来缩小范围以确保你的时区和其他设置是正确的。

![选择地理位置][40]

接下来，填写用户账户信息：你的姓名、计算机名、用户名和密码。完成后单击“继续”。

![账户设置][41]

现在你就拥有它了，安装完成了。继续并重启你的电脑。

![Ubuntu 安装完成][42]

如果一切按计划进行，你应该会在计算机重新启动时看到类似的屏幕，选择 Ubuntu 或 Windows 10，其他选项是用于故障排除，所以我们一般不会选择进入其中。

![选择操作系统][43]

尝试启动并进入 Ubuntu 或 Windows 以测试是否安装成功并确保一切按预期地正常工作。如果没有问题，你已经在你的电脑上安装了 Windows 和 Ubuntu 。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/5/dual-boot-linux

作者：[Jay LaCroix][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[Auk7F7](https://github.com/Auk7F7)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com/users/jlacroix
[1]:https://www.microsoft.com/en-us/software-download/windows10
[2]:https://www.ubuntu.com/download/desktop
[3]:http://www.etcher.io
[4]:/file/397066
[5]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_01.png "Windows setup"
[6]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_02a.png
[7]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_03.png "Enter product key"
[9]:/file/397081
[10]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_04.png "Select Windows version"
[11]:/file/397086
[12]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_05.png "Accept license terms"
[13]:/file/397091
[14]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_06.png "Select type of Windows installation"
[15]:/file/397096
[16]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_07.png "Hard drive configuration"
[17]:/file/397101
[18]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_08.png "Create a new partition"
[19]:/file/397106
[20]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_09.png "Leaving a partition with unallocated space"
[21]:/file/397111
[22]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_10.png "Installing Windows"
[23]:/file/397116
[24]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_11.png "Windows desktop"
[25]:/file/397121
[26]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_12.png "Ubuntu installation welcome screen"
[27]:/file/397126
[28]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_13.png "Ubuntu desktop"
[29]:/file/397131
[30]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_15.png "Select language in Ubuntu"
[31]:/file/397136
[32]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_16.png "Select keyboard in Ubuntu"
[33]:/file/397141
[34]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_17.png "Choose Ubuntu installation options"
[35]:/file/397146
[36]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_18.png "Install Ubuntu alongside Windows"
[37]:/file/397151
[38]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_18b.png "Allocate drive space"
[39]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_19.png "Confirmation screen"
[40]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_20.png "Select location"
[41]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_21.png "Account setup"
[42]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_22.png  "Installation complete"
[43]:https://opensource.com/sites/default/files/uploads/linux-dual-boot_23.png "Chose which OS to use"
