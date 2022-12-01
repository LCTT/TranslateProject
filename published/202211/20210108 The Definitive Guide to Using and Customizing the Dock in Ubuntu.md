[#]: collector: (lujun9972)
[#]: translator: (chai001125)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-15281-1.html)
[#]: subject: (The Definitive Guide to Using and Customizing the Dock in Ubuntu)
[#]: via: (https://itsfoss.com/customize-ubuntu-dock/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Ubuntu 中使用和自定义程序坞
======

![][0]

当你登录 Ubuntu 时，你会看到屏幕左侧的 <ruby>程序坞/停靠栏<rt> dock </rt></ruby>，上面有一些应用程序的图标。程序坞（也称为 <ruby>启动器<rt> launcher </rt></ruby>，或者 <ruby>面板<rt> panel </rt></ruby>）可以让你快速启动某个常用的应用程序。

![][1]

我经常使用程序坞。在本文中，我将分享一些关于有效使用程序坞的小技巧，并介绍自定义程序坞的外观和位置的方法。

你将在本教程中学习到以下内容：

  * 程序坞的基本用途：添加应用程序，并使用快捷方式来启动应用程序
  * 自定义程序坞的外观：更改图标大小、图标位置
  * 更改程序坞的位置：可用于单屏和多显示器的设置
  * 在程序坞中隐藏已安装的磁盘图标
  * 自动隐藏或禁用程序坞
  * 使用 `dconf-editor` 对程序坞进行额外的定制
  * 用其他程序坞应用程序替换 Ubuntu 默认的程序坞

我将在教程中使用 <ruby>程序坞<rt> dock </rt></ruby>、<ruby>面板<rt> panel </rt></ruby>和 <ruby>启动器<rt> launcher </rt></ruby> 等术语，它们的意思是等同的。

### 如何使用 Ubuntu 程序坞：你必须知道的基础知识

如果你是 Ubuntu 的新手，你需要掌握如何使用程序坞。尽管，在一段时间后你总会熟悉程序坞的功能，但是阅读本文能让你更快地明白。

#### 向程序坞添加新的应用程序（或删除应用程序）

这一步骤十分简单。从菜单中搜索你想要添加在程序坞的应用程序，然后运行它。

正在运行的应用程序会显示在程序坞中，它的图标在程序坞中所有图标的下方。右键单击该图标，然后选择 “<ruby>添加到收藏夹<rt> Add to Favorites </rt></ruby>” 选项。这会把该应用程序的图标锁定到程序坞上。

![Right-click on the icon and select “Add to Favorites”][2]

从程序坞中删除应用程序的图标，操作起来更为简单。你不需要运行你想要在程序坞删除的应用程序，只需右键单击应用程序图标，然后选择 “<ruby>从收藏夹中删除<rt> Remove From Favorites </rt></ruby>” 即可。

![Right-click on the icon and select “Remove from Favorites”][3]

#### 更改程序坞中的图标顺序

默认情况下，新添加到程序坞的应用程序图标会放置在程序坞上的所有图标之后。但是，你也可以改变图标的位置。

要更改图标的顺序，你只需将它拖放到另一个位置即可，不用 “<ruby>锁定位置<rt> lock it </rt></ruby>”，或者做其他的事情。如果你不做任何的更改，这个图标会一直停留在那个位置。

![Reorder Icons On Ubuntu Docks][4]

#### 右键单击程序坞中的图标，以获取应用程序的额外选项

左键单击程序坞中的图标会启动应用程序，或者如果应用程序已经在运行，则这个应用程序会被聚焦，即它会出现在所有其他正在运行的应用程序窗口前面。

右键单击程序坞中的图标会为你提供应用程序的额外选项。不同的应用程序会有不同的选项。

右键单击**浏览器**图标，在它的额外选项中，你可以打开一个新的私人窗口，或预览所有正在运行的窗口。

![][5]

右键单击**文件管理器**图标，在它的额外选项中，你可以查看所有已添加书签的目录，或预览打开的窗口。

当然，你也可以通过右键单击图标，来退出应用程序。大多数应用程序能够通过右键单击而退出，而一些应用程序（例如 Telegram 等），将被最小化到 <ruby>系统托盘<rt> system tray </rt></ruby> 中。

#### 使用键盘快捷键，以快速启动程序坞中的应用程序 [知道这个的人不多]

你只需用鼠标单击程序坞上的图标，即可启动应用程序。但是，你也可以用键盘快捷键，来启动应用程序。

使用 `WIN`/`Super` + `数字键` 的组合，能够启动程序坞中该位置的应用程序。

![][6]

如果应用程序已经在运行了，它将被聚焦。

由于这个功能是基于位置的，所以请不要一直对图标进行重新排序。就我个人而言，我把 Firefox 放在程序坞的第 1 个位置，文件管理器放在第 2 个位置，备用浏览器放在第 3 个位置，以此类推，直到第 9 个位置。这样，我可以使用 `Super + 2`，从而快速启动文件管理器。

因为我的系统连接了 3 个屏幕，所以我发现这个快速启动应用程序的功能特别好用，我不必再将鼠标移动到第一个屏幕上的程序坞上了。你也可以在其他屏幕上启用或禁用程序坞，我将在本教程的后面部分向你展示如何设置。

### 改变程序坞在屏幕上的位置

默认情况下，程序坞位于屏幕的左侧。但是，有些人喜欢将程序坞放置在屏幕底部。

Ubuntu 允许你更改程序坞的位置。你可以将程序坞移至底部或右侧。我不觉得有很多人真的想要把扩展坞放在了顶部，所以没有将扩展坞移到顶部的选项。

![Change Launcher Position][7]

要更改程序坞位置，请进入 “<ruby>设置<rt> Settings </rt></ruby>” 菜单，然后点击 “<ruby>外观<rt> Appearance </rt></ruby>” ，你可以在 Dock 栏下看到一些选项，然后你可以在此处更改 “<ruby>屏幕上的位置<rt> Position on screen </rt></ruby>” 这一设置。

![Go to Settings->Appearance->Dock][8]

#### 程序坞在多显示器设置中的位置

如果你的系统连接了多个屏幕，你可以选择是在所有的屏幕上还是在某个选定的屏幕上，显示扩展坞。

![Ubuntu Dock Settings Multimonitor][9]

对于我个人而言，我只在我的笔记本电脑屏幕上显示程序坞，因为这是我的主屏幕。这样在我的另外两个屏幕会留有最大的空间。

### 更改程序坞的外观

让我们继续看看 Ubuntu 程序坞中的更多自定义选项吧。

想象一下，如果你在程序坞中添加了太多的应用程序或打开了太多应用程序，那么程序坞的空间会被填满。如果你想要进入到程序坞端点处的应用程序，那么你必须滚动到程序坞顶部和底部才可以。

你可以更改程序坞的图标大小，来解决这个问题，这样程序坞就能够容纳更多图标来。不过，也不要让图标太小。

![][10]

要更改程序坞的图标大小，请进入 “<ruby>设置<rt> Settings </rt></ruby>” 菜单，然后点击 “<ruby>外观<rt> Appearance </rt></ruby>” ，并通过移动 “<ruby>图标大小<rt> Icon size </rt></ruby>” 下的滑块来更改它。默认的图标大小为 48 像素。

![Changing Icon Size In Ubuntu Dock][11]

#### 在程序坞中隐藏已安装的磁盘图标

当你插入 U 盘或 SD 卡时，它的驱动器会安装到系统中，并且在程序坞中会立即出现一个图标。这个图标很有用，因为你可以直接通过右键单击它，来安全地删除驱动器选项。

![Mounted disks are displayed In the Ubuntu Dock][12]

如果你认为在程序坞中显示已安装的磁盘图标很麻烦的话，你也可以关闭这个功能。别担心，你仍然可以从文件管理器访问已安装的驱动器。

打开终端，使用以下命令，来隐藏程序坞中已安装的磁盘图标：

```
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
```

更改会立即生效。你不再会为程序坞中显示已安装的磁盘而烦恼了。

如果你想要恢复默认情况，请使用以下命令：

```
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts true
```

### 改变程序坞的行为

接下来，让我们自定义程序坞的默认行为，使它能更适合你的需求吧。

#### 启用点击最小化

如果你单击一个正在运行的应用程序的图标，那么这个应用程序的窗口将成为焦点。当如果你**再次单击**这个图标时，将什么都不会发生。这是因为，在默认情况下，第二次点击同一图标不会最小化应用程序。

这是现代桌面的默认行为，但我不太喜欢，我更喜欢的是：当我**第二次点击图标时，应用程序会被最小化**。

如果你像我一样，那么你可能想要在 Ubuntu 中 [启用点击最小化选项][13]：

为此，请打开终端并输入以下命令：

```
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

#### 自动隐藏 Ubuntu 程序坞，以获得更多屏幕空间

如果你想要有最大的屏幕空间，你可以在 Ubuntu 中为程序坞启用自动隐藏选项。

自动隐藏选项会隐藏程序坞，你就能获得整个屏幕。不过，程序坞仍然可以使用。将光标移动到程序坞原来所在的位置，它就会再次出现。当程序坞重新出现时，它会覆盖在正在运行的应用程序窗口上。这是一件好事，否则太多元素会开始在屏幕上移动。

要设置程序坞自动隐藏，请进入 “<ruby>设置<rt> Settings </rt></ruby>” 菜单，然后点击 “<ruby>外观<rt> Appearance </rt></ruby>” ，你可以在 Dock 栏下开启 <ruby>自动隐藏选项<rt> Auto-hide the Dock </rt></ruby>” 。

![Auto-hide the dock][14]

如果你不喜欢自动隐藏程序坞的话，你可以用同样的方式禁用它。

#### 禁用 Ubuntu 默认的程序坞

Ubuntu 程序坞的自动隐藏选项对很多人来说已经足够好了，但是依旧有些用户根本不喜欢 Ubuntu 自带的程序坞。如果你也是其中的一员，你可以选择完全禁用 Ubuntu 的程序坞。

从 Ubuntu 20.04 开始，你可以使用 <ruby>扩展应用程序<rt> Extensions application </rt></ruby>，来管理 [GNOME 扩展][15]。

![Look for Extensions app in the menu][16]

使用这个扩展应用程序，你就可以轻松地禁用或重新启用程序坞了。

![Disable Ubuntu Dock][17]

### 使用 dconf-editor 进行高级的程序坞定制 [不推荐]

##### 请注意

`dconf-editor` 能让你更改 GNOME 桌面环境的几乎每个方面。这个性质喜忧参半，因为你在更改时必须小心，而且大多数设置都可以即时更改，无需确认。虽然你可以重置你的更改，但你仍可能会将系统置于难以恢复正常的状态。

出于这个原因，我不推荐你使用 `dconf-editor`，特别是如果你不喜欢花时间在故障排除和修复问题上，或者如果你不太熟悉 Linux 和 GNOME。

[dconf-editor][18] 给你提供了在 Ubuntu 中自定义程序坞的其他选项。你可以在从软件中心安装 `dconf-editor`，然后导航到 `org > gnome > shell > extensions > dash-to-dock`，在这里你会找到很多自定义程序坞的选择。

![][19]

### 替换 Ubuntu 默认的程序坞

有几个第三方的程序坞应用程序可用于 Ubuntu 和其他 Linux 发行版。你可以安装你想要的第三方程序坞，并使用它。

例如，你可以从软件中心下载 “Plank dock”，并以与 Ubuntu 程序坞类似的方式来使用它。

![Plank Dock in Ubuntu][20]

在这种情况下，禁用 Ubuntu 默认的程序坞会是一个更好的主意，因为同时使用多个扩展坞是不太明智的。

### 总结

本教程介绍了在 GNOME 实现中，如何自定义 Ubuntu 默认的程序坞。上述程序坞的更改在 vanilla GNOME 的程序坞上运行良好。

我已经向你展示了大多数常见的 Ubuntu 程序坞的定制方法。你不需要去盲目地跟随教程中的所有步骤。阅读并思考哪一个是你需要的，然后根据教程中的方法更改配置。

如果你不喜欢 Ubuntu 默认的程序坞，也有其他的程序坞可供试验。

这个教程让你学到了新东西吗？你还想看到更多这样的教程吗？欢迎你在评论区中建议和反馈。

--------------------------------------------------------------------------------

via: https://itsfoss.com/customize-ubuntu-dock/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[chai001125](https://github.com/chai001125)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/ubuntu-dock.png?resize=800%2C450&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/add-icons-to-dock.png?resize=800%2C450&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/remove-icons-from-dock.png?resize=800%2C450&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/reorder-icons-on-ubuntu-docks.gif?resize=800%2C430&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/right-click-icons-ubuntu-dock.png?resize=800%2C450&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/keyboard-shortcut-for-ubuntu-dock.png?resize=800%2C450&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/change-launcher-position-ubuntu.png?resize=800%2C450&ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/change-dock-position-ubuntu.png?resize=800%2C450&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/ubuntu-dock-settings-multimonitor.png?resize=800%2C450&ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/normal-icon-size-dock.jpg?resize=1024%2C1080&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/changing-icon-size-in-ubuntu-dock.png?resize=800%2C450&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/external-mounted-disks-in-ubuntu-dock.png?resize=800%2C450&ssl=1
[13]: https://itsfoss.com/click-to-minimize-ubuntu/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/autohide-dock-ubuntu.png?resize=800%2C450&ssl=1
[15]: https://itsfoss.com/gnome-shell-extensions/
[16]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/GNOME-extensions-app-ubuntu.jpg?resize=800%2C240&ssl=1
[17]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/disable-dock-ubuntu.png?resize=800%2C450&ssl=1
[18]: https://wiki.gnome.org/Apps/DconfEditor
[19]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/dconf-editor-dock.png?resize=592%2C599&ssl=1
[20]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/plank-dock-Ubuntu.jpg?resize=800%2C382&ssl=1
[0]: https://img.linux.net.cn/data/attachment/album/202211/23/143533heym0bybbfm0bfbj.jpg