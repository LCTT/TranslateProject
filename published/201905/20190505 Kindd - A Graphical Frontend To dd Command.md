[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10847-1.html)
[#]: subject: (Kindd – A Graphical Frontend To dd Command)
[#]: via: (https://www.ostechnix.com/kindd-a-graphical-frontend-to-dd-command/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

Kindd：一个图形化 dd 命令前端
======

![Kindd - A Graphical Frontend To dd Command][1]

前不久，我们已经学习如何在类 Unix 系统中 [使用 dd 命令创建可启动的 ISO][2]。请记住，`dd` 命令是最具危险性和破坏性的命令之一。如果你不确定你实际在做什么，你可能会在几分钟内意外地擦除你的硬盘数据。`dd` 命令仅仅从 `if` 参数获取数据，并写入数据到 `of` 参数。它将不关心它正在覆盖什么，它也不关心是否在磁道上有一个分区表，或一个启动扇区，或者一个家文件夹，或者任何重要的东西。它将简单地做它被告诉去做的事。如果你是初学者，一般地尝试避免使用 `dd` 命令来做实验。幸好，这有一个支持 `dd` 命令的简单的 GUI 实用程序。向 “Kindd” 问好，一个属于 `dd` 命令的图形化前端。它是自由开源的、用 Qt Quick 所写的工具。总的来说，这个工具对那些对命令行不适应的初学者是非常有用的。

它的开发者创建这个工具主要是为了提供：

1. 一个用于 `dd` 命令的现代化的、简单而安全的图形化用户界面，
2. 一种简单地创建可启动设备的图形化方法，而不必使用终端。

### 安装 Kindd

Kindd 在 [AUR][3] 中是可用的。所以，如果你是 Arch 用户，使用任一的 AUR 助手工具来安装它，例如 [Yay][4] 。

要安装其 Git 发布版，运行：

```
$ yay -S kindd-git
```

要安装正式发布版，运行：

```
$ yay -S kindd
```

在安装后，从菜单或应用程序启动器启动 Kindd。

对于其它的发行版，你需要从源文件手动编译和安装它，像下面所示。

确保你已经安装下面的必要条件。

  * git
  * coreutils
  * polkit
  * qt5-base
  * qt5-quickcontrols
  * qt5-quickcontrols2
  * qt5-graphicaleffects

一旦所有必要条件安装，使用 `git` 克隆 Kindd 储存库：

```
git clone https://github.com/LinArcX/Kindd/
```

转到你刚刚克隆 Kindd 的目录，并编译和安装它：

```
cd Kindd
qmake
make
```

最后运行下面的命令来启动 Kindd 应用程序：

```
./kindd
```

Kindd 内部使用 pkexec。pkexec 代理被默认安装在大多数桌面环境中。但是，如果你使用 i3 (或者可能还有一些其它的桌面环境)，你应该首先安装 polkit-gnome ，然后粘贴下面的行到 i3 配置文件：

```
exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
```

### 使用 Kindd 创建可启动的 ISO

为从一个 ISO 创建一个可启动的 USB，插入 USB 驱动器。然后，从菜单或终端启动 Kindd 。

这是 Kindd 默认界面的外观：

![][5]

*Kindd 界面*

正如你所能看到的，Kindd 界面是非常简单的和明白易懂的。这里仅有两部分，即设备列表，它显示你的系统上的可用的设备（hdd 和 Usb），并创建可启动的 .iso 。默认情况下，你将在“创建可启动 .iso”部分。

在第一列中输入块大小，在第二列中选择 ISO 文件的路径，并在第三列中选择正确的设备（USB 驱动器路径）。单击“转换/复制”按钮来开始创建可启动的 ISO 。

![][6]

一旦进程被完成，你将看到成功的信息。

![][7]

现在，拔出 USB 驱动器，并用该 USB 启动器启动你的系统，来检查它是否真地工作。

如果你不知道真实的设备名称（目标路径），只需要在列出的设备上单击，并检查 USB 驱动器名称。

![][8]

Kindd 还处在早期开发阶段。因此，可能有错误。如果你找到一些错误，请在这篇的指南的结尾所给的 GitHub 页面报告它们。

这就是全部。希望这是有用的。更多的好东西将会来。敬请期待！

谢谢！

资源：

  * [Kindd GitHub 储存库][11]

相关阅读：

  * [Etcher：一个来创建可启动 SD 卡或 USB 驱动器的漂亮的应用程序][9]
  * [Bootiso 让你安全地创建可启动的 USB 驱动器][10]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/kindd-a-graphical-frontend-to-dd-command/

作者：[sk][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/04/kindd-720x340.png
[2]: https://www.ostechnix.com/how-to-create-bootable-usb-drive-using-dd-command/
[3]: https://aur.archlinux.org/packages/kindd-git/
[4]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[5]: http://www.ostechnix.com/wp-content/uploads/2019/04/kindd-interface.png
[6]: http://www.ostechnix.com/wp-content/uploads/2019/04/kindd-1.png
[7]: http://www.ostechnix.com/wp-content/uploads/2019/04/kindd-2.png
[8]: http://www.ostechnix.com/wp-content/uploads/2019/04/kindd-3.png
[9]: https://www.ostechnix.com/etcher-beauitiful-app-create-bootable-sd-cards-usb-drives/
[10]: https://www.ostechnix.com/bootiso-lets-you-safely-create-bootable-usb-drive/
[11]: https://github.com/LinArcX/Kindd
