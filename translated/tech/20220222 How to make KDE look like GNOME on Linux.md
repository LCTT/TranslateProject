[#]: subject: "How to make KDE look like GNOME on Linux"
[#]: via: "https://opensource.com/article/22/2/make-kde-look-like-gnome"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Linux 上让 KDE 看起来像 GNOME
======
在不放弃你的 Plasma 桌面的情况下获得 GNOME 的感觉。
![Digital images of a computer desktop][1]

GNOME 有一种极简主义设计的倾向。它是一种美丽的桌面体验，并且是第一个在我使用 Linux 时引起别人赞叹的自由桌面。然后（请原谅我的哲理），没有复杂性就没有极简主义，而 KDE 以其非常可定制而闻名。我认为测试一下 KDE 的配置可能会很有趣，并尝试在 KDE Plasma 桌面上重新实现，至少在表面上实现 GNOME 的体验。

如果你尝试这个，请在一个临时用户帐户中进行。这些变化相对来说比较剧烈，撤销它以回到你的标准 KDE 布局可能是一个很大的工作。

### Adwaita 主题

GNOME 的默认主题，叫做 Adwaita，是为 GTK 设计的，这是 GNOME 用于窗口和部件的工具包。KDE 使用 Qt 工具包，但 Fedora-Qt 项目已经开发了一个模仿 Adwaita 的 Qt 主题。这是在 KDE 上模仿 GNOME 的第一步，也是最明显的一步。使用你的发行版的包管理器安装 Adwaita for Qt：


```
`$ sudo dnf install adwaita-qt{,5}`
```

在基于 Debian 的发行版上，使用 `apt` 命令而不是 `dnf`。

安装完毕后，进入**系统设置**，选择**应用风格**。选择你喜欢的 Adwaita 主题变体：有一个浅色主题和一个深色主题，以及两者之间的变化。点击**应用**按钮来更新你的主题，但先不要关闭这个控制面板。

### 窗口装饰

在**应用风格**窗口的左侧面板中选择**窗口装饰**的分类。如果有一个适合 Adwaita 的标题栏样式，通过选择它并点击**应用**来激活它。如果没有安装额外的装饰，点击面板右下方的**获取新窗口装饰**按钮，下载合适的东西。我使用了用户 x-varlesh-x 的 **Arc** 主题，但你可以四处看看，看看什么最适合你的其他主题。

GNOME 著名的是它的窗口标题栏上只有一个按钮，所以导航到**标题栏按钮**标签，然后通过将**关闭**按钮从标题栏图像拖到处置区域来删除所有按钮。

![Removing buttons][2]

（Seth Kenlon，CC BY-SA 4.0）

取消选择**显示标题栏按钮提示**，因为 GNOME 不倾向于在系统部件上做提示。

点击**应用**来保存你的修改。

### GTK 主题

在 KDE 上，使用 GTK 的应用通常会被重新设计成与 KDE 的默认主题一致。现在你已经把你的主题从 KDE Breeze 改为 GNOME Adwaita，你必须告诉 GTK 使用 Adwaita 主题。

点击**应用风格**面板底部的**配置 GNOME/GTK 应用风格**按钮，在下拉菜单中选择 **Adwaita**。

### 工作区行为

GNOME 在视觉上比 KDE 更安静，所以在**系统设置**中找到**工作区行为**面板，停用**在鼠标悬停时显示信息提示**和**显示状态变化的视觉反馈**。

你也可以把打开文件和文件夹改为需要双击而不是单击（在现实生活中，这对我来说太远了）。

### 图标和光标

你可以在**系统设置**中把光标改为 Adwaita 主题，然后选择一个图标主题。我喜欢 Breeze 的图标，但它们确实感觉像 KDE。GNOME 使用 Adwaita 图标集，但由于它们是为 GNOME 设计的，所以缺少一些重要的 KDE 组件的图标。你可以点击**图标**控制面板中的**获取新图标**按钮来浏览很多图标集，最后我选择了用户 alvatip 的 **Nordzy**。不过，有很多不错的图标集可用，所以查看它们，看看你喜欢什么。我发现任何不属于 Breeze 的东西都会使 KDE 看起来与我习惯的东西有足够的不同。

### 系统面板

GNOME 的面板在屏幕的顶部，而 KDE 的面板默认在屏幕的底部。GNOME 的面板在默认情况下也是比较空的，所以我发现最简单的做法是先把当前的 KDE 面板完全删除。

右键点击并选择**编辑面板**。进入编辑模式后，再次右键点击面板，选择**删除面板**。当它消失了，右击桌面上的任何地方，选择**添加面板**并添加一个空面板。这样就在屏幕底部添加了一个面板，所以右击它，选择**编辑面板**，然后点击并拖动**屏幕边缘**按钮到屏幕的顶部。

当仍处于编辑模式时，点击**添加部件**按钮，将**应用仪表板**部件添加到面板的最左端。然后从**编辑面板**视图中添加一个**间隔**块，然后是一个**时钟**，然后是另一个**间隔**。你可以拖动这些小部件来排列它们，所以我发现最简单的做法是把应用仪表板和时钟加在一起，然后是两个间隔，再把它们排列起来。

![Editing the panel][3]

（Seth Kenlon，[CC BY-SA 4.0][4]）

你可以右键点击每个小组件来定制图标和布局。例如，我把日期从时钟上移走了，因为它在附加了日期后看起来很挤，尽管 GNOME 确实包含了日期。

通过进入**系统设置**，选择一个深色的 Plasma 主题，比如 **Breeze Dark**，将面板改为黑色。

### GNOME Plasma 桌面

通过一些快速的调整，你的桌面现在在一些不同的方面接近于 GNOME。布局是类似的。

![GNOME layout][5]

（Seth Kenlon，[CC BY-SA 4.0][4]）

应用仪表板提供了一个 GNOME 风格的应用启动器。

![Application dashboard][6]

（Seth Kenlon，[CC BY-SA 4.0][4]）

其他小的修改进一步有助于产生这种错觉。例如，我简化了 Dolphin 文件管理器，去掉了**布局**面板，也去掉了工具条上的大部分按钮。

### 一个不同的视角

这不是一个完全的匹配，比我更学究的人可以更努力地工作，得到更接近正确的结果。然而，像这样有趣的变化证明了 KDE 是多么的灵活，以及拥有大量的选项意味着你可以缩减你的交互内容以适应你的偏好。一个类似 GNOM E的桌面可以给你一个新的视角来看待你与桌面的互动，即使你不会永远保持这种布局，它可以帮助你发现你可能没有想到要寻找的选项。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/make-kde-look-like-gnome

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/computer_browser_web_desktop.png?itok=Bw8ykZMA (Digital images of a computer desktop)
[2]: https://opensource.com/sites/default/files/kde-decoration-remove.jpg (Removing buttons)
[3]: https://opensource.com/sites/default/files/kde-panel-edit.jpg (Editing the panel)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://opensource.com/sites/default/files/kde-like-gnome_0.jpg (GNOME layout)
[6]: https://opensource.com/sites/default/files/kde-application-dashboard_0.jpg (Application dashboard)
