3种方法来创建轻量、持久化的Xubuntu Linux USB系统盘
================================================================================

### 使用Universal USB Install创建持久化USB Xubuntu系统盘 ###

![](http://f.tqn.com/y/linux/1/S/2/J/1/xubuntudesktop.png)

这个教程为你介绍如何使用Xubuntu Linux创建一个轻量并且[持久化][1]的Linux USB系统盘。

> 译者注：持久化Linux USB系统盘（Persistent Linux USB drive），安装在优盘的Linux系统，允许用户保存数据到优盘而不是仅仅将这些修改留在内存中。这些数据可以在重启后恢复并且重新使用，甚至是在其他的机器上面启动也没有关系。一般情况下，持久化系统盘会安装一个压缩过的Linux操作系统。

为什么要这样做呢，这里有5个很好的理由：

1. 你想要在你的电脑上安装一个轻量并且功能完善的Linux版本。
2. 你的电脑没有硬盘，那么一个Linux USB系统盘就可以让这台电脑摆脱被扔到垃圾堆的命运。
3. 你想体验一下Linux，但是你却不想花太多的时间去准备。
4. 你想创建一个USB系统恢复盘，并且在优盘上安装一些特定的应用程序。
5. 你想要一个可定制的Linux版本，能装在后兜或者挂在钥匙圈上。

现在，我们有了充足的理由，那么开始做一些准备工作吧。

如果你使用的是Windows：

1. 下载Xubuntu。
2. 下载Universal USB Installer。
3. 插入一个空的优盘。
4. 使用Universal USB Installer创建一个常驻系统启动盘。

如果你使用的是Ubuntu：

1. 下载Xubuntu。
2. 使用Ubuntu Startup Creator。

如果你使用的是其他版本的Linux：

1. 下载Xubuntu。
2. 使用UNetbootin。

还有一些场景，可能需要使用命令行，会更难一些，但是上面列的三种应该已经可以满足大部分的情况。

### 下载Xubuntu和Universal USB Installer ###

![](http://f.tqn.com/y/linux/1/S/G/J/1/xubuntuwebsite.JPG)

访问[Xubuntu网站][2]，然后选一个你喜欢的版本下载。

目前有两个版本可供使用：

- [Trusty Tahr (14.04 LTS)][3]
- [Utopic Unicorn (14.10)][4]

14.04版是一个长期维护的版本，维护周期会持续3年。14.10是最新版本，但是只提供9个月的维护。

你选择了下载站点以后，会提示你选择32位版本或者64位版本。如果你的电脑是32位，就选32位版本，同样，如果你的电脑是64位，那就选64位版本。

[点击这里，有一个教程来教你辨别你的电脑是32位还是64位][5]。

可以从[Pendrive Linux网站][6]下载Universal USB Installer，点击download链接，过一会下载页面就会弹出来了。

### 使用Universal USB Installer创建一个Xubuntu启动优盘 ###

![](http://f.tqn.com/y/linux/1/S/-/J/1/uui1l.JPG)

下载完Universal USB Installer和Xubuntu以后，运行Universal USB Installer，出现安全警告时，点击“Accept”。

Universal USB Installer用来创建一个持久化的Xubuntu启动优盘。

第一屏是许可协议。点击“I Agree”继续。

![](http://f.tqn.com/y/linux/1/S/0/J/1/uui2l.JPG)

Universal USB Installer主界面出现以后，从下拉列表中选择你想要的配置（i.e Xubuntu），第二步，点击“Browse”选择你下载的ISO文件的路径。

在电脑上插入一个空的优盘，然后选中“Showing all drives”复选框。

在下拉列表中选中你的优盘（一定要确定选的是正确的盘符哦）。如果优盘不是空的，选中格式化复选框。

> 注：格式化优盘会清除优盘上的所有数据，首先一定要确认是否以及备份过相关的数据。

在第四步中选择用于保存“持久化”系统数据的存储空间大小。

点击“Create”按钮继续。

![](http://f.tqn.com/y/linux/1/S/1/J/1/uu3l.JPG)

最后一个界面提示你如果点击“Yes”，那么将会直接应用你的配置。

这是停止安装的最后一个机会，一定要确定你选了正确的优盘盘符，并且优盘上没有需要备份的其他文件。

点击“Yes”，然后耐心等待优盘创建完成。

> 注：创建持久化保存空间会花费一些时间，并且这时候进度条不会继续滚动。

这个过程完成以后，重启电脑，如果从优盘启动，就会加载Xubuntu。

### 使用Ubuntu的Startup Disk Creator创建Xubuntu启动优盘 ###

![](http://f.tqn.com/y/linux/1/S/H/J/1/ubuntustartupdiskcreator.png)

如果你已经安装了Ubuntu，那么创建持久化USB Xubuntu系统盘的最简单的办法就是使用Startup Disk Creator。

按下超级键（Windows键），打开Dash，搜索“Startup Disk Creator”，图标出现以后点击它。

如果你对Ubuntu Dash不太熟悉，你可以[点击这里，查看一个完整的教程][7]。

Startup Disk Creator使用起来很简单。

界面被划分成两个部分。上部分指定下载的系统盘路径，下部分指定安装的优盘。

首先，点击“Other”按钮，第二步，选择你所下载的Xubuntu ISO文件。

然后插入优盘，点击“Erase”按钮清除优盘数据。

> 注：点击“Erase”会删除优盘中所有的数据，记得先备份数据。

选中“Stored in reserved extra sapce”单选按钮，然后拖动“How much”来确定你想要用来存储“持久化”数据的空间。

点击“Make Startup Disk”。

你创建的过程中，你可能需要输入几次你的系统密码，USB系统盘创建完成以后，你就可以使用它启动到Xubuntu了。

### 使用UNetbootin创建持久化的Xubuntu系统盘 ###

![](http://f.tqn.com/y/linux/1/S/I/J/1/unetbootin1.png)

我要介绍的最后一个工具是UNetbootin，这个工具在Windows和Linux上都可以使用。

个人来说，在Windows系统上面我喜欢用Universal USB Installer，但Linux的话，UNetbootin更合适一些。

> 注：UNetbootin并不是100%完美的，不是所有的Linux发行版都支持。

Windows平台可以点击[这里][8]下载UNetbootin。

Linux平台可以使用package manager安装UNetbootin。

确认你的优盘已经连接到电脑上，确认优盘已经格式化，并且在优盘上没有其他的数据。

在Windows平台上运行UNetbootin只需要双击可执行程序即可，在Linux运行的话则需要提升权限。

在Linux上如何运行取决于你使用的是何种桌面环境以及Linux发行版。从命令行运行的话，输入下列命令：

> sudo unetbootin

UNetbootin的界面分为两个部分。你可以在上半部分选择一个Linux发行版，然后下载它，如果已经下载了某个发行版，可以在下半部分选择已经下载的系统盘。

点击“Diskimage”单选框，然后点击三个点的按钮。找到已经下载的Xubuntu ISO文件。路径会显示到按钮旁边的文本框里面。

设置“Space used to preserve files across reboots”的值，来指定你想要用来存储“持久化”数据的空间大小。

类型选择USB drive，然后选择优盘的盘符。

点击“OK”来创建一个持久化Xubuntu启动优盘。

创建的过程要花一些时间，创建完成以后，你就可以通过优盘启动到Xubuntu系统了。

如果你想要创建一个支持UEFI的Xubuntu启动优盘，[照着这个教程来做][8]，只需要把Ubuntu ISO替换为Xubuntu ISO就可以了。

via : http://linux.about.com/od/howtos/ss/How-To-Create-A-Persistent-Bootable-Xubuntu-Linux-USB-Drive.htm

作者：[Gary Newell][a]
译者：[zhouj-sh](https://github.com/Zhouj-sh)
校对：[Caroline](https://github.com/carolinewuyan)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[a]:http://linux.about.com/bio/Gary-Newell-132058.htm
[1]:http://www.pendrivelinux.com/what-is-persistent-linux/
[2]:http://xubuntu.org/getxubuntu/
[3]:http://www.dedoimedo.com/computers/xubuntu-trusty.html
[4]:http://www.dedoimedo.com/computers/xubuntu-utopic.html
[5]:http://pcsupport.about.com/od/fixtheproblem/f/32-bit-64-bit-windows.htm
[6]:http://www.pendrivelinux.com/universal-usb-installer-easy-as-1-2-3/
[7]:http://linux.about.com/od/howtos/fl/Learn-Ubuntu-The-Unity-Dash.htm
[8]:http://linux.about.com/od/howtos/ss/How-To-Create-A-UEFI-Bootable-Ubuntu-USB-Drive-Using-Windows.htm
