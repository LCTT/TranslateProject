对于开发者来说5个最好的Linux发行版
============================================================
 ![Linux distros for devs](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/king-penguins_1920.jpg?itok=qmy8htw6 "Linux distros for devs")
 Jack Wallen介绍了一些非常适合用来做开发工作的Linux发行版本.[Creative Commons Zero][6]
 在考虑使用Linux时，需要做很多的考量。你希望使用什么包管理器？你更喜欢现代还是比较旧的桌面界面？易用性是你使用Linux的首选吗？你希望分发的灵活性？发行版的服务性任务是什么？
这是你在开始使用Linux之前必须考虑的问题。发行版是作为桌面还是服务器运行？你会做网络或者系统审计吗？或者你会开发？如果你花了很多时间考虑Linux，你知道每个任务都有非常合适的Linux发行版。这当然非常适用于开发人员。尽管Linux在设计上对于开发人员来说是一个理想的平台，但某些发行版高于其他的发行版，可以作为最好的开发人员的操作系统去服务开发人员。
 我想来分享我自己认为是你在做开发工作当中的最佳Linux发行版。虽然这五个发行版的每一个都可以用来通用开发（可能有一个是例外），但是它们都有各自的特定目的，你看会或不会对这些选择感觉到惊讶
 话虽如此，让我们做出选择
 ### Debian
 在[Debian][14]的发行版中许多Linux列表中排名靠前。 有充分的理由。 Debian是许多人所依赖的发行版. 这就是为什么更多的开发人员去选择debian的理由。 当你在Debian上开发一个软件的时候，很有可能该软件包可以适用于[Ubuntu][15], [Linux Mint][16], [Elementary OS][17],以及大量的其他Debian发行版。
 除了这个非常明显的答案之外，Debian还通过默认存储库提供了大量可用的应用程序（图1）。
 ![Debian apps](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_1.jpg?itok=3mpkS3Kp "Debian apps")
 图 1: 标准的Debian存储库里面可用的应用程序。[Used with permission][1]
 为了让程序员友好,这些应用程序 (以及它们的依赖项) 易于安装.例如，构建必需的包（可以安装在Debian的任何衍生发行版上）。该软件包包括dkpg-dev，g ++，gcc，hurd-dev，libc-dev以及开发过程所需的make-all工具。可以使用命令sudo apt install build-essential安装build-essential软件包。
 标准存储库当中提供了数百种的特定于开发人员的应用程序，例如:
 *   Autoconf—配置构建脚本的软件
 *   Autoproject—为新程序创建源码包
 *   Bison—通用的解析生成器
 *   Bluefish—面向程序员的强大GUI编辑器
 *   Geany—轻量化的IDE
 *   Kate—强大的文本编辑器
 *   Eclipse—帮助构建者独立开发与其他工具的集成性软件
 这个清单一直在继续更新.
 Debian也是你能找到的坚于磐石的发行版，因此很少有人担心因为桌面崩溃而让你失去宝贵的工作。作为奖励，Debian的所有应用程序都必须符合[Debian自由软件指南][18], 该指南遵守以下 “社会契约”:
 *   Debian 保持完全免费.
 *   我们将无偿回馈自由软件社区.
 *   我们不会隐藏问题.
 *   我们的首要任务是我们的用户和自由软件
 *   不符合我们的免费软件标准的作品在非免费档案中..
 此外，你不熟悉在Linux上进行开发，Debian在其[用户手册][19]中有一个方便编程的部分。
 ### openSUSE Tumbleweed （滚动更新版)
 如果你希望开发出最前沿的滚动发行版本， [openSUSE][20] 将提供最好的[Tumbleweed][21]之一。 还可以借助openSUSE当中令人惊叹的管理员工具（其中包括YaST）来实现这一目标。如果你不熟悉YaST（又一个设置工具）的话，它是一个非常强大的软件，允许您从一个方便的位置来管理整个平台。在YaST中，您还可以使用RPM组进行安装。打开YaST，单击RPM Groups（按目的分组的软件），然后向下滚动到Development部分以查看可安装的大量组（图2）
 ![openSUSE](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_2.jpg?itok=EeCjn1cx "openSUSE")
 图 2: 在openSUSE Tumbleweed中安装软件包组.[Creative Commons Zero][2]
 openSUSE还允许您通过简单的单击链接快速安装所有必需的devtools [rpmdevtools安装页面][22]， 然后单击Tumbleweed的链接。这将自动添加必要的存储库并安装rpmdevtools
 对于开发者来说，通过滚动版本进行开发，你可以知道你已安装的软件是最新版本。
 ### CentOS
 让我们来看一下, [红帽企业版Linux][23] (RHEL) 是企业事务的事实标准. 如果你正在寻找针对特定平台进行开发，并且你有点担心无法承担RHEL的许可证，那么[CentOS][24]就是你不错的选择— 实际上，它是RHEL的社区版本。你会发现CentOS上的许多软件包与RHEL中的软件包相同 - 所以一旦熟悉了一个软件包，你就可以使用其他的软件包。
 如果你认真考虑在企业级平台上进行开发，那么CentOS就是不错的选择。而且由于CentOS是特定于服务器的发行版，因此您可以更轻松地以Web为中心的平台进行开发。您可以轻松地将CentOS作为开发和测试的理想主机，而不是开发您的工作然后将其迁移到服务器（托管在不同的计算机上）.
 寻找满足你开发需求的软件? 你只需要打开CentOS软件中心, 其中包含了集成开发环境（IDE - 图3）的专用子部分
 ![CentOS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_3.jpg?itok=0oe4zj9j "CentOS")
 图 3: 在CentOS中安装功能强大的IDE很简单。.[Used with permission][3]
 Centos还包括安全增强性的Linux（SElinux），它使你可以更加轻松的去测试你的软件与RHEL中的同一安全平台的集成功能，SElinux经常会让设计不佳的软件感到头疼，因此准备了它可以真正有利于确保你的应用程序在RHEL之类的应用程序上面运行。如果你不确定如何在Centos上进行开发工作。你可以阅读[RHEL 7 开发人员指南][25].
 ### Raspbian
 让我们来看一下, 嵌入式操作系统风靡一时. 使用这种 操作系统最简单的一种方法就是通过Raspberry Pi——一种极小的单片机（也可以称为小型计算机）. 事实上,Raspberry Pi 已经成为了全球喜爱DIY用户使用的硬件. 为这些 设备供电的是 [Raspbian][26]操作系统. Raspbian包含[BlueJ][27], [Geany][28], [Greenfoot][29], [Sense HAT Emulator][30], [Sonic Pi][31], 和 [Thonny Python IDE][32], [Python][33], 和 [Scratch][34]等一些工具, 因此你不需要开发软件。Raspbian还包括一个用户友好的桌面UI（图4），使事情变得更加容易。
 ![Raspbian](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_4.jpg?itok=VLoYak6L "Raspbian")
 图 4: Raspbian主菜单，显示预安装的开发人员软件.[Used with permission][4]
 对于任何想要对Raspberry Pi平台开发的人来说，Raspbian是必要的。如果你想在不使用Raspberry Pi硬件的情况下使用Raspbian系统，您可以通过下载[此处][35]的ISO映像将其安装在VirtualBox虚拟机中
 ### Pop!_OS
 不要让这个名字迷惑你,,不要让这个名字迷惑你, 进入[System76][36]的 [Pop!_OS][37]操作系统世界是非常严格的. 虽然System76对这个Ubuntu衍生产品做了很多修改但不是很明显，但这是特别的。
 System76的目标是创建一个特定于开发人员，制造商和计算机科学专业人员的操作系统。通过新设计的GNOME主题，Pop！_OS非常漂亮（图5），并且功能与硬件制造商使桌面设计人员一样强大。
### [devel_5.jpg][11]
 ![Pop!_OS](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/devel_5.jpg?itok=n4K7k7Gd "Pop!_OS")
 图 5: Pop!_OS 桌面.[Used with permission][5]
 但是，Pop！_OS的特殊之处在于它是由一家致力于Linux硬件的公司开发的。这意味着，当您购买System76笔记本电脑，台式机或服务器时，您就会知道操作系统将与硬件无缝协作 - 这是其他公司无法提供的。我预测，Pop！_OS将使System76将成为Linux界Apple。
 ### 工作时间
 以他们自己的方式，每个发行版。你有一个稳定的桌面（Debian），一个尖端的桌面（openSUSE Tumbleweed），一个服务器（CentOS），一个嵌入式平台（Raspbian），以及一个与硬件无缝融合的发行版（Pop！_OS）。除了Raspbian之外，这些发行版中的任何一个都将成为一个出色的开发平台。安装一个并开始自信地开展下一个项目。
可以通过Linux Foundation和edX 免费提供的["Linux简介" ][13]来了解更多的有关Linux信息
--------------------------------------------------------------------------------
 via: https://www.linux.com/blog/learn/intro-to-linux/2018/1/5-best-linux-distributions-development
 作者：[JACK WALLEN ][a]
译者：[geekmar](https://github.com/geekmar)
校对：[校对者ID](https://github.com/校对者ID)
 本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出
 [a]:https://www.linux.com/users/jlwallen
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/creative-commons-zero
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/licenses/category/used-permission
[6]:https://www.linux.com/licenses/category/creative-commons-zero
[7]:https://www.linux.com/files/images/devel1jpg
[8]:https://www.linux.com/files/images/devel2jpg
[9]:https://www.linux.com/files/images/devel3jpg
[10]:https://www.linux.com/files/images/devel4jpg
[11]:https://www.linux.com/files/images/devel5jpg
[12]:https://www.linux.com/files/images/king-penguins1920jpg
[13]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[14]:https://www.debian.org/
[15]:https://www.ubuntu.com/
[16]:https://linuxmint.com/
[17]:https://elementary.io/
[18]:https://www.debian.org/social_contract
[19]:https://www.debian.org/doc/manuals/debian-reference/ch12.en.html
[20]:https://www.opensuse.org/
[21]:https://en.opensuse.org/Portal:Tumbleweed
[22]:https://software.opensuse.org/download.html?project=devel%3Atools&package=rpmdevtools
[23]:https://www.redhat.com/en/technologies/linux-platforms/enterprise-linux
[24]:https://www.centos.org/
[25]:https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/pdf/developer_guide/Red_Hat_Enterprise_Linux-7-Developer_Guide-en-US.pdf
[26]:https://www.raspberrypi.org/downloads/raspbian/
[27]:https://www.bluej.org/
[28]:https://www.geany.org/
[29]:https://www.greenfoot.org/
[30]:https://www.raspberrypi.org/blog/sense-hat-emulator/
[31]:http://sonic-pi.net/
[32]:http://thonny.org/
[33]:https://www.python.org/
[34]:https://scratch.mit.edu/
[35]:http://rpf.io/x86iso
[36]:https://system76.com/
[37]:https://system76.com/pop
