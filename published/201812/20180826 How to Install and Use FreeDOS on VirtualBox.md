如何在 VirtualBox 上安装并使用 FreeDOS？
======

> 这份指南将带你如何一步一步在 Linux 平台下利用 VirtualBox 安装 FreeDOS。

### Linux 下借助 VirtualBox 安装 FreeDOS

- [How to Install FreeDOS in Linux using Virtual Box](https://www.youtube.com/p1MegqzFAqA)

2017 年的 11 月份，我[采访了 Jim Hall][1] 关于 [FreeDOS 项目][2] 背后的历史故事。今天，我将告诉你如何安装并使用 FreeDOS。需要注意到是：我将在 [Solus][4]（一种针对家庭用户的 Linux 桌面发行版）下使用 5.2.14 版本的 [VirtualBox][3] 来完成这些操作。

> 注意：在本教程我将使用 Solus 作为主机系统因为它很容易设置。另一个你需要注意的事情是 Solus 的软件中心有两个版本的 VirtualBox：`virtualbox` 和 `virtualbox-current`。Solus 会让你选择是使用 linux-lts 内核还是 linux-current 内核。最终区别就是，`virtualbox` 适用于 linux-lts 而 `virtualbx-current` 适用于 linux-current。

#### 第一步 – 创建新的虚拟机

![][5]

当你打开 VirtualBox，点击 “New” 按钮来新建一个虚拟机。你可以自定义这台虚拟机的名字，我将它命名为 “FreeDOS”。你也可以在标注栏内指明你正在安装的 FreeDOS 的版本。你还需要选择你将要安装的操作系统的类型和版本。选择 “Other” 下的 “DOS”。 

#### 第二步 – 设置内存大小

![][6]

下一个对话框会问你要给 FreeDOS 主机分配多少可用的内存空间。默认分配 32 MB。不必更改它。在 DOS 系统盛行的年代，32 MB 大小的内存对于一台搭载 FreeDOS 的机器已经很足够了。如果你有需要，你可以通过对你针对 FreeDOS 新建的虚拟机右键并选择 “Setting -> Symtem” 来增加内存。

![][7]

#### 第三步 – 创建虚拟硬盘

![][8]

下一步，你会被要求创建一个虚拟硬盘用来存储 FreeDOS 和它的文件。如果你还没有创建，只需要点击 “Create”。

下一个对话框会问你想用什么磁盘文件类型。默认的类型 (VirtualBox Disk Image) 效果就挺好。点击 “Next”。

下一个你遇到的问题是你想虚拟硬盘以何种方式创建。你是否希望虚拟硬盘占据的空间刚开始很小然后会随着你创建文件和安装软件逐渐增加直至达到你设置的上限？那么选择动态分配。如果你更喜欢虚拟硬盘 (VHD) 按照既定大小直接创建，选择固定大小即可。如果你不打算使用整个 VHD 或者你的硬盘空余空间不是太足够，那么动态分配是个很不错的分配方式。（需要注意的是，动态分配的虚拟硬盘占据的空间会随着你增加文件而增加，但不会因为你删除文件而变小） 我个人更喜欢动态分配，但你可以根据实际需要来选择最合适你的分配类型然后点击 “Next”。

![][9]

现在，你可以选择虚拟磁盘的大小和位置。500 MB 已经很足够了。需要注意的是很多你之后用到的程序都是基于文本的，这意味着它们占据的空间非常小。在你做好这些调整后，点击 “Create”。

#### 第四步 – 关联 .iso 文件

在我们继续之前，你需要[下载][10] FreeDOS 的 .iso 文件。你需要选择 CDROM 格式的 “standard” 安装程序。

![][11]

当文件下载完毕后，返回到 VirtualBox。选中你的虚拟机并打开设置。你可以通过对虚拟机右键并选中 “Setting” 或者选中虚拟机并点击 “Setting” 按钮。

接下来，点击 “Storage” 选项卡。在 “Storage Devices” 下面，选中 CD 图标。(它应该会在图标旁边显示 “Empty”。) 在右边的 “Attribute” 面板，点中 CD 图标然后在对应路径选中你刚下载的 .iso 文件。

> 提示：通常，在你通过 VirtualBox 安装完一个操作系统后你就可以删除对应的 .iso 文件了。但这并不适合 FreeDOS 。如果你想通过 FreeDOS 的包管理器来安装应用程序，你需要这个 .iso 文件。我通常会让这个 .iso 文件连接到虚拟机以便我安装一些程序。如果你也这么做了，你必须要确认下你让  FreeDOS 虚拟机每次启动的时候是从硬盘启动因为虚拟机的默认设置是从已关联的 .iso 文件启动。如果你忘了关联 .iso 文件，也不用担心。你可以通过选择 FreeDOS 虚拟机窗口上方的 “Devices” 来关联。然后就会发现 .iso 文件列在 “Optical Drives”。

#### 第五步 – 安装 FreeDOS

![][12]

既然我们已经完成了所有的准备工作，让我们来开始安装 FreeDOS 吧。

首先，你需要知道关于最新版本的 VirtualBox 的一个 bug。当我们创建好虚拟硬盘然后选中 “Install to harddisk” 后，如果你开启虚拟机你会发现在 FreeDOS 的欢迎界面出现过后就是不断滚动无群无尽的机器代码。我最近就遇到过这个问题而且不管是 Linux 还是 Windows 平台的 VirtualBox 都会碰到这个问题。（我知道解决办法。）

为了避开这个问题，你需要做一个简单的修改。当你看到 FreeDOS 的欢迎界面的时候，按下 Tab 键。（确认 “Install to harddrive” 已经选中。）在 “fdboot.img” 之后输入 `raw` 然后按下回车键。接下来就会启动 FreeDOS 的安装程序。

![][13]

安装程序会首先处理你的虚拟磁盘的格式化。当格式化完成后，安装程序会重启。当 FreeDOS 的欢迎界面再次出现的时候，你必须重新输入 `raw` 就像你之前输入的内容那样。

要确保在安装过程中你遇到的所有问题你选的都是 “Yes”。但也要注意有一个很重要的问题：“What FreeDOS packages do you want to install?” 的答案并不是 “Yes” 或者 “No”。答案有两个选择分别是 “Base packages” 和 “Full installation”。“Base packages” 针对的是想体验类似原始的 MS-DOS 环境的人群。“Full installation” 则包括了一系列工具和实用的程序来提升 DOS。  

在整个安装过程的最后，你可以选择重启或者继续停留在 DOS。选择“reboot”。

#### 第六步 – 设置网络

不同于原始的 DOS，FreeDOS 可以访问互联网。你可以安装新的软件包或者更新你已经安装的软件包。要想使用网络，你还需要在 FreeDOS 安装些应用程序。

![][14]

首先，启动进入你新创建的 FreeDOS 虚拟机。在 FreeDOS 的选择界面，选中 “Boot from System harddrive”。

![][15]

现在，你可以通过输入 `fdimples` 来访问 FreeDOS 的软件包管理工具。你也可以借助方向键来浏览软件包管理器，然后用空格键选择类别或者软件包。在 “Networking” 类别中，你需要选中 `fdnet`。FreeDOS project 推荐也安装 `mtcp` 和 `wget`。多次点击 Tab 键直到选中 “OK” 然后在按下回车键。安装完成后，输入 `reboot` 并按下回车键确认执行。系统重启后，引导你的系统驱动。如果网络安装成功的话，你会在终端看到一些关于你的网络信息的新消息。

![][16]

注意：

有时候 VirtualBox 的默认设置并没有生效。如果遇到这种情况，先关闭你的 FreeDOS 虚拟机窗口。在 VirtualBox 主界面右键你的虚拟机并选中 “Setting”。VirtualBox 默认的网络设置是 “NAT”。将它改为 “Bridged Adapter” 后再尝试安装 FreeDOS 的软件包。现在就应该能正常运作了。

#### 第七步 – FreeDOS 的基本使用

##### 常见命令

既然你已经成功安装了 FreeDOS，让我们来看些基础命令。如果你已经在 Windows 平台使用过命令提示符，那么你会发现有很多命令都是相似的。

  * `DIR`– 显示当前目录的内容
  * `CD` – 改变当前所在的目录
  * `COPY OLD.TXT NEW.TXT`– 复制文件
  * `TYPE TEST.TXT` – 显示文件内容
  * `DEL TEST.TXT` – 删除文件
  * `XCOPY DIR NEWDIR` – 复制目录及目录下的所有内容
  * `EDIT TEST.TXT`– 编辑一个文件
  * `MKDIR NEWDIR` – 创建一个新目录
  * `CLS` – 清除屏幕

你可以借助互联网或者 Jim Hall 所创建的 [方便的速查表][17] 来找到更多基本的 DOS 命令。 

##### 运行一个程序

在 FreeDOS 上运行程序相当简单。需要注意的是当你借助 `fdimples` 软件包管理器来安装一个应用程序的时候，要确保你指定了待安装程序的 .EXE 文件的路径。这个路径会在应用程序的详细信息中显示。要想运行程序，通常你还需要进入到程序所在文件夹并输入该程序的名字。

例如，FreeDOS 中你可以安装一个叫 `FED` 的编辑器。安装完成后，你还需要做的就是进入 `C:\FED` 这个文件夹下并输入 `FED`。 

对于位于 `\bin` 这个文件夹的程序，比如 Pico。这些程序可以在任意文件夹中被调用。

对于游戏通常会有一个或者两个 .EXE 程序，你玩游戏之前不得不先运行它们。这些设置文件通常能够修复你遇到的声音，视频，或者控制问题。

如果你遇到一些本教程中没指出的问题，别忘记访问 [FreeDOS 主站][2] 来寻求解决办法。他们有一个 wiki 和一些其他的支持选项。

你使用过 FreeDOS 吗？你还想看关于 FreeDOS 哪些方面的教程？请在下面的评论区告诉我们。

如果你觉得本篇文章很有趣，请花一分钟的时间将它分享在你的社交媒体，Hacker News 或者 [Reddit][18]。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-freedos/

作者：[John Paul][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[WangYueScream](https://github.com/WangYueScream)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[1]:https://itsfoss.com/interview-freedos-jim-hall/
[2]:http://www.freedos.org/
[3]:https://www.virtualbox.org/
[4]:https://solus-project.com/home/
[5]:https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-1.jpg?w=787&ssl=1
[6]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-2.jpg?w=792&ssl=1
[7]:https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-3.jpg?w=797&ssl=1
[8]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-4.jpg?w=684&ssl=1
[9]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-6.jpg?w=705&ssl=1
[10]:http://www.freedos.org/download/
[11]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-7.jpg?w=800&ssl=1
[12]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-8.png?w=789&ssl=1
[13]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-9.png?w=748&ssl=1
[14]:https://i1.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-10.png?w=792&ssl=1
[15]:https://i2.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-11.png?w=739&ssl=1
[16]:https://i0.wp.com/itsfoss.com/wp-content/uploads/2018/07/freedos-tutorial-12.png?w=744&ssl=1
[17]:https://opensource.com/article/18/6/freedos-commands-cheat-sheet
[18]:http://reddit.com/r/linuxusersgroup
