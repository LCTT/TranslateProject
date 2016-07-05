ReactOS 新手指南
====================================

ReactOS 是一个比较年轻的开源操作系统，它提供了一个和 Windows NT 类似的图形界面，并且它的目标也是提供一个与 NT 功能和应用程序兼容性差不多的系统。这个项目在没有使用任何 Unix 架构的情况下实现了一个类似 Wine 的用户模式。它的开发者们从头实现了 NT 的架构以及对于 FAT32 的兼容，因此它也不需要负任何法律责任。这也就是说，它不是又双叒叕一个 Linux 发行版，而是一个独特的类 Windows 系统，并且是开源世界的一部分。这份快速指南是给那些想要一个易于使用的 Windows 的开源替代品的人准备的。

### 安装系统

在开始安装这个系统之前，我需要说明一下，ReactOS 的最低硬件要求是 500MB 硬盘以及仅仅 96MB 内存。我会在一个 32 位的虚拟机里面演示安装过程。

现在，你需要使用箭头键来选择你想要语言，而后通过回车键来确认。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_1.png)

之后，再次敲击回车键来继续安装。你也可以选择按“R”键来修复现有的系统。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_2.png)

在第三屏中，你将看到一个警告说这个系统还是早期开发版本。再次敲击回车键，你将看到一个需要你最后确认的配置概览。如果你认为没问题，就按回车。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_3.png)

然后，我们就到了分区这一步，在这里，你可以使用“D”键删除高亮分区，分别使用“P”键、“E”键以及“L”键来添加一个主分区、拓展分区或逻辑分区。如果你想要自己添加一个分区，你需要输入这个分区的大小（以 MB 为单位），然后通过回车来确认。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_4.png)

但是，如果你有未使用的硬盘空间，在分区过程直接敲击回车键可以自动在你选中的分区上安装 ReactOS。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_5.png)

下一步是选择分区的格式，不过现在我们只能选择 FAT32。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_6.png)

再下一步是选择安装文件夹。我就使用默认的“/ReactOS”了，应该没有问题。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_7.png)

然后就是等待...

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_8.png)

最后，我们要选择启动程序的安装位置。如果你是在实机上操作的话，第一个选项应该是最安全的。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_9.png)

总地来说，我认为 ReactOS 的安装向导很直接。尽管安装程序的界面可能看起来一点也不现代、不友好，但是大多数情况下作为用户的我们只需要狂敲回车就能安个差不多。这就是说，ReactOS 的开发版安装起来也是相对简单方便的。

### 设置 ReactOS

在我们重启进入新系统之后，“设置向导”会帮助你设置系统。目前，这个向导仅支持设置语言和键盘格式。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_10.png)

我在这里选择了第二个键盘格式。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_11.png)

我还可以设置一个改变键盘布局的快捷键。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_12.png)

之后我添加了用户名…

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_13.png)

…以及管理员密码…

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_14.png)

在设置好时间之后，我们就算完成了系统设置。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_15.png)

### ReactOS 之内

当我们历经千辛万苦，终于首次进入 ReactOS 的界面时，系统会检测硬件并自动帮助我们安装驱动。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_16.png)

这是我这里被自动检测出来的三个硬件：

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_17.png)

在上一张图片里你看到的是 ReactOS 的“应用管理器”，这东西是 Linux 的标配。不过你不会在这里找到任何与 Linux 有关系的东西。只有在这个系统里工作良好的开源软件才会在这个管理器中出现。这就导致了管理器中有的分类下挤得满满当当，有的却冷清异常。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_18.png)

我试着通过软件中心安装了 Firefox 以及通过直接下载 exe 文件双击安装 Notepad++。这两个应用都能完美运行：它们的图标出现在了桌面上，在菜单中也出现了它们的名字，Notepad++ 也出现在了软件中心右侧的分类栏里。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_19.png)

我没有尝试运行任何现代的 Windows 游戏，如果你想配置 Direct 3D 的话，你可以转到 “我的电脑/控制选项/WineD3D 配置”。在那里，你能看到很多 Direct3D 选项，大致与 dx 8 的选项类似。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_20.png)

ReactOS 还有一个好的地方，就是我们可以通过“我的电脑”来操作注册表。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_21.png)

如果你需要一个简单点的工具，你可以在应用菜单里打开注册表编辑器。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_22.png)

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_23.png)

最后，如果你认为 ReactOS 看起来有点过时了的话，你可以在桌面右击选择“属性”，之后在“外观”那里选择你喜欢的主题和颜色。

![](https://www.howtoforge.com/images/getting-started-with-eeactos/pic_24.png)

### 结论

老实说，我对 ReactOS 的工作方式印象深刻。它相当稳定、连贯、快速，并且真正人性化。抛开 Windows 的阴影（过时的应用菜单，不合理的菜单结构）不谈的话，ReactOS 几乎做到了尽善尽美。它可能不会有太多应用可供选择，现有的功能也可能不够强大，但是我确信它将会繁荣壮大。关于它的数据显示出了它的人气，我确定将要围绕它建立起来的社区将会很快就壮大到能把这个项目带往成功之路的地步。如今，ReactOS 的最新版本是 0.4.1。如果想要以开源的方式运行 Windows 的应用，那么它就是你的菜！


--------------------------------------------------------------------------------

via: https://www.howtoforge.com/tutorial/getting-started-with-reactos/

作者：[Bill Toulas][a]
译者：[name1e5s](https://github.com/name1e5s)
校对：[PurlingNayuki](https://github.com/PurlingNayuki)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.howtoforge.com/tutorial/getting-started-with-reactos/
