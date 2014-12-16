Arch Linux 安装捷径：Evo/Lution
================================================================================
有些人只体验过Ubuntu或Mint的安装，却鼓起勇气想要安装Arch Linux，他们的学习道路是那样的陡峭和严峻，安装过程中半途而废的人数可能要比顺利过关的人多得多。如果你成功搭建并按你所需的配置好了Arch Linux，那么它已经把你培养成了一个饱经风霜的Linux用户。

即使有[可以帮助你的维基][1]为新手提供指南，对于那些想要征服Arch的人而言要求仍然太高。你需要至少熟悉诸如fdisk或mkfs之类的终端命令，并且听过mc、nano或chroot这些，并努力掌握它们。这让我回想起了10年前的Debian安装。

对于那些满怀抱负而又缺乏知识的生灵，有一个叫[Evo/Lution Live ISO][2]的ISO镜像格式安装器可以拯救他们。即便它貌似像发行版一样启动，但它其实除了辅助安装Arch Linux准系统之外啥都不干。Evo/Lution是一个项目，它旨在通过提供Arch的简单安装方式来为Arch的增加更多的用户基数，就像为那些用户提供全面帮助和文档的社区一样。在这样一个组合中，Evo是Live CD（不可安装），而Lution是个安装器本身。项目创立者看到了Arch及其衍生发行版的开发者和用户之间的巨大鸿沟，而想要在所有参与者之间构筑一个身份平等的社区。

![](https://farm6.staticflickr.com/5559/15067088008_ecb221408c_z.jpg)

项目的软件部分是命令行安装器Lution-AIS，它负责解释一个普通的纯净的Arch安装过程中的每一步。安装完毕后，你将获得Arch提供的没有从AUR添加任何东西的最新软件或其它任何自定义的包。

启动这个422MB大小的ISO镜像后，一个由显示在右边的带有选项快捷方式的Conky和一个左边等待运行安装器的LX-Terminal组成的工作区便呈现在我们眼前。

![](https://farm6.staticflickr.com/5560/15067056888_6345c259db_z.jpg)

在通过右击桌面或使用ALT-i启动实际的安装器后，一个写满了16个等待运行的任务列表就出现在你面前了。除非你知道你在做什么，否则请将这些任务全部运行一遍。你可以一次运行，也可以进行选择，如1 3 6，或者1-4，也可以一次将它们全部运行，输入1-16。大多数步骤需要‘y’，即‘yes’，来确认，敲击回车即可。在此期间，你有足够的时间来阅读安装指南，它可以通过ALT-g来打开。当然，你也可以出去溜达一圈再回来。

![](https://farm4.staticflickr.com/3868/15253227082_5e7219f72d_z.jpg)

这16个步骤分成“基础安装”和“桌面安装”两组。第一个组安装主要关注本地化、分区，以及安装启动器。

安装器带领你穿越分区世界，你可以选择使用gparted、gdisk，以及cfdisk。

![](https://farm4.staticflickr.com/3873/15230603226_56bba60d28_z.jpg)

![](https://farm4.staticflickr.com/3860/15253610055_e6a2a7a1cb_z.jpg)

创建完分区后（如，像截图中所示，用gparted划分/dev/sda1用于root，/dev/sda2用于swap），你可以在10个文件系统中选择其中之一。在下一步中，你可以选择内核（最新或长期支持LTS）和基础系统。

![](https://farm6.staticflickr.com/5560/15253610085_aa5a9557fb_z.jpg)

安装完你喜爱的启动加载器后，第一部分安装就完成了，这大约需要花费12分钟。这是在普通的Arch Linux中你第一次重启进入系统所处之处。

在Lution的帮助下，继续进入第二部分，在这一部分中将安装Xorg、声音和图形驱动，然后进入桌面环境。

![](https://farm4.staticflickr.com/3918/15066917430_c21e0f0a9e_z.jpg)

安装器会检测是否在VirtualBox中安装，并且会自动为VM安装并加载正确的通用驱动，然后相应地设置**systemd**。

在下一步中，你可以选择KDE、Gnome、Cinnamon、LXDE、Englightenment、Mate或XFCE作为你的桌面环境。如果你不喜欢臃肿的桌面，你也可以试试这些窗口管理器：Awesome、Fluxbox、i3、IceWM、Openbox或PekWM。

![](https://farm4.staticflickr.com/3874/15253610125_26f913be20_z.jpg)

在使用Cinnamon作为桌面环境的情况下，第二部分安装将花费不到10分钟的时间；而选择KDE的话，因为要下载的东西多得多，所以花费的时间也会更长。

Lution-AIS在Cinnamon和Awesome上像个妩媚的小妖精。在安装完成并提示重启后，它就带我进入了我所渴望的环境。

![](https://farm4.staticflickr.com/3885/15270946371_c2def59f37_z.jpg)

我要提出两点批评：一是在安装器要我选择一个镜像列表时，以及在创建fstab文件时。在这两种情况下，它都另外开了一个终端，给出了一些文本信息提示。这让我花了点时间才搞清楚，原来我得把它关了，安装器才会继续。在创建fstab后，它又会提示你，而你需要关闭终端，并在问你是否想要保存文件时回答‘是’。

![](https://farm4.staticflickr.com/3874/15067056958_3bba63da60_z.jpg)

我碰到的第二个问题，可能与VirtualBox有关了。在启动的时候，你可以看到没有网络被检测到的提示信息。点击顶部左边的图标，将会打开我们所使用的网络管理器wicd。点击“断开”，然后再点击“连接”并重启安装器，就可以让它自动检测到了。

Evo/Lution看起来是个有价值的项目，在这里Lution工作一切顺利，目前还没有什么可告诉社区的。他们开启了一个全新的网站、论坛和维基，需要填充内容进去啊。所以，如果你喜欢这主意，加入[他们的论坛][3]并告诉他们吧。本文中的ISO镜像可以从[此网站][4]下载。

--------------------------------------------------------------------------------

via: http://xmodulo.com/2014/09/install-arch-linux-easy-way-evolution.html

作者：[Ferdinand Thommes][a]
译者：[GOLinux](https://github.com/GOLinux)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://xmodulo.com/author/ferdinand
[1]:https://wiki.archlinux.org/
[2]:http://www.evolutionlinux.com/
[3]:http://www.evolutionlinux.com/forums/
[4]:http://www.evolutionlinux.com/downloads.html
