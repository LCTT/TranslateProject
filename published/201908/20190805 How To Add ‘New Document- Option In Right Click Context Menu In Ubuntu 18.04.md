[#]: collector: (lujun9972)
[#]: translator: (scvoet)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11232-1.html)
[#]: subject: (How To Add ‘New Document’ Option In Right Click Context Menu In Ubuntu 18.04)
[#]: via: ((https://www.ostechnix.com/how-to-add-new-document-option-in-right-click-context-menu-in-ubuntu-18-04/)
[#]: author: (sk https://www.ostechnix.com/author/sk/)

如何在 Ubuntu 18.04 的右键单击菜单中添加“新建文档”按钮
======

![Add 'New Document' Option In Right Click Context Menu In Ubuntu 18.04 GNOME desktop][1]

前几天，我在各种在线资源站点上收集关于 [Linux 包管理器][2] 的参考资料。在我想创建一个用于保存笔记的文件，我突然发现我的 Ubuntu 18.04 LTS 桌面并没有“新建文件”的按钮了，它好像离奇失踪了。在谷歌一下后，我发现原来“新建文档”按钮不再被集成在 Ubuntu GNOME 版本中了。庆幸的是，我找到了一个在 Ubuntu 18.04 LTS 桌面的右键单击菜单中添加“新建文档”按钮的简易解决方案。

就像你在下方截图中看到的一样，Nautilus 文件管理器的右键单击菜单中并没有“新建文件”按钮。

![][3]

*Ubuntu 18.04 移除了右键点击菜单中的“新建文件”的选项。*

如果你想添加此按钮，请按照以下步骤进行操作。

### 在 Ubuntu 的右键单击菜单中添加“新建文件”按钮

首先，你需要确保你的系统中有 `~/Templates` 文件夹。如果没有的话，可以按照下面的命令进行创建。

```
$ mkdir ~/Templates
```

然后打开终端应用并使用 `cd` 命令进入 `~/Templates` 文件夹：

```
$ cd ~/Templates
```

创建一个空文件：

```
$ touch Empty\ Document
```

或

```
$ touch "Empty Document"
```

![][4]

新打开一个 Nautilus 文件管理器，然后检查一下右键单击菜单中是否成功添加了“新建文档”按钮。

![][5]

*在 Ubuntu 18.04 的右键单击菜单中添加“新建文件”按钮*

如上图所示，我们重新启用了“新建文件”的按钮。

你还可以为不同文件类型添加按钮。

```
$ cd ~/Templates

$ touch New\ Word\ Document.docx
$ touch New\ PDF\ Document.pdf
$ touch New\ Text\ Document.txt
$ touch New\ PyScript.py
```

![][6]

在“新建文件”子菜单中给不同的文件类型添加按钮

注意，所有文件都应该创建在 `~/Templates` 文件夹下。

现在，打开 Nautilus 并检查“新建文件” 菜单中是否有相应的新建文件按钮。

![][7]

如果你要从子菜单中删除任一文件类型，只需在 Templates 目录中移除相应的文件即可。

```
$ rm ~/Templates/New\ Word\ Document.docx
```

我十分好奇为什么最新的 Ubuntu GNOME 版本将这个常用选项移除了。不过，重新启用这个按钮也十分简单，只需要几分钟。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-add-new-document-option-in-right-click-context-menu-in-ubuntu-18-04/

作者：[sk][a]
选题：[lujun9972][b]
译者：[scvoet](https://github.com/scvoet)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux 中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/wp-content/uploads/2019/07/Add-New-Document-Option-In-Right-Click-Context-Menu-1-720x340.png
[2]: https://www.ostechnix.com/linux-package-managers-compared-appimage-vs-snap-vs-flatpak/
[3]: https://www.ostechnix.com/wp-content/uploads/2019/07/new-document-option-missing.png
[4]: https://www.ostechnix.com/wp-content/uploads/2019/07/Create-empty-document-in-Templates-directory.png
[5]: https://www.ostechnix.com/wp-content/uploads/2019/07/Add-New-Document-Option-In-Right-Click-Context-Menu-In-Ubuntu.png
[6]: https://www.ostechnix.com/wp-content/uploads/2019/07/Add-options-for-different-files-types.png
[7]: https://www.ostechnix.com/wp-content/uploads/2019/07/Add-New-Document-Option-In-Right-Click-Context-Menu.png
