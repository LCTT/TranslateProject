[#]: subject: "How To Enable Minimize And Maximize Buttons In Fedora 36 Workstation"
[#]: via: "https://ostechnix.com/how-to-enable-minimize-and-maximize-buttons-in-fedora/"
[#]: author: "sk https://ostechnix.com/author/sk/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

如何在 Fedora 36 Workstation 中启用最小化和最大化按钮
======
今天，我们将看到 Fedora 桌面的安装后步骤之一。这个简短的指南解释了如何在 Fedora GNOME Workstation 和 Silverblue 版本的应用窗口中启用最小化和最大化按钮。

### 介绍

你可能已经知道，Fedora Silverblue 和 Fedora GNOME Workstation 版本的应用窗口中没有最小化和最大化按钮。

如果要最小化应用窗口，需要右键单击其标题栏并从上下文菜单中选择最小化选项。

不幸的是，你甚至无法在 Firefox 中使用鼠标获得该选项。要最小化 Firefox 窗口，你要点击**左 ALT+空格**键并选择最小化选项。

我不知道隐藏最常用的按钮有什么好处。 Ubuntu GNOME 桌面有最小/最大按钮，但 Fedora 没有。

如果你想恢复 Fedora GNOME 和 Silverblue 版本中的最小化和最大化按钮，你可以借助 Fedora 中的 **Gnome Tweaks** 程序和 **Dash to Panel** 扩展来启用它们。

### 在 Fedora 中安装 Gnome Tweaks

**Gnome Tweaks**，以前称为 **Tweak Tool**，是用于高级 GNOME 3 设置的图形界面。它主要是为 GNOME Shell 设计的，但也可以在其他桌面中使用。如果你在不同的桌面上使用 Tweaks，你可能无法拥有所有功能。它在 Fedora 的默认仓库中可用。因此，你可以使用 dnf 包管理器在 Fedora 上安装 Gnome Tweaks，如下所示：

```
$ sudo dnf install gnome-tweaks
```

如果你使用 Fedora Silverblue，你需要使用以下命令进入你的 toolbox 容器：

```
$ toolbox enter
```

然后按照前面的命令安装 Tweaks。

### 在浏览器中添加 Gnome Shell Integration 插件

确保你在浏览器中添加了 **“Gnome Shell Integration”** 插件。此扩展提供与 GNOME shell 和相应扩展仓库的集成。

如果你尚未添加它，请转到插件页并搜索并安装它。

![Add Gnome Shell Integration Add-on In Firefox Browser][1]

将出现一个弹出窗口。单击“添加”以启用加载项。添加此扩展程序后，你将在浏览器的工具栏上看到 GNOME 图标。

### 在 Fedora 中启用 Dash 到面板扩展

**Dash to panel** 扩展是 Gnome Shell 的图标任务栏。此扩展将 dash 移动到 gnome 主面板中，以便将应用启动器和系统托盘组合到一个面板中，类似于 KDE Plasma 和 Windows 7 以上操作系统中的面板。

Dash to panel 扩展为你提供了一个永久可见的面板，其中包含最喜欢的快捷方式。因此，不再需要单独的 dock 来轻松访问正在运行和收藏的应用。

要启用 Dash to panel 扩展，请进入 **GNOME extensions** 站点并搜索 **“Dash to panel”** 扩展。

![Search for Dash to panel extension in Gnome extensions site][2]

单击搜索结果中的 Dash to panel 链接。你将被重定向到 Dash to panel 扩展的官方页面。点击 **ON** 按钮。

![Enable Dash to panel extension][3]

在下一个窗口中，单击安装按钮以启用 Dash to panel 扩展。

![Install Dash to panel extension][4]

激活此扩展程序后，你将在底部看到 Dash 面板以及你最喜欢的快捷方式。

### 在 Fedora 中启用最小化和最大化按钮

打开 **Gnome Tweaks** 应用。进入 **Windows Tittlebars** 并打开最小/最大按钮。

![Enable minimize and maximize buttons in application windows in Fedora][5]

当你打开最小/最大按钮，最小化和最大化按钮将出现在所有应用的窗口中。

![Minimize, maximize buttons appears in applications windows in Fedora][6]

默认情况下，最小/最大按钮在右侧可见。你可以将其位置更改为左侧或右侧。

Dash to panel 扩展有很多微调和自定义选项。右键单击 Dash 面板并选择设置选项，然后根据你的喜好开始对其进行自定义。

**资源：**

* [Dash to panel 网站][7]

--------------------------------------------------------------------------------

via: https://ostechnix.com/how-to-enable-minimize-and-maximize-buttons-in-fedora/

作者：[sk][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://ostechnix.com/author/sk/
[b]: https://github.com/lkxed
[1]: https://ostechnix.com/wp-content/uploads/2022/05/Add-Gnome-Shell-Integration-Add-on-In-Firefox-Browser.png
[2]: https://ostechnix.com/wp-content/uploads/2021/01/Search-for-Dash-to-panel-extension-in-Gnome-extensions-site.png
[3]: https://ostechnix.com/wp-content/uploads/2021/01/Enable-Dash-to-panel-extension.png
[4]: https://ostechnix.com/wp-content/uploads/2021/01/Install-Dash-to-panel-extension.png
[5]: https://ostechnix.com/wp-content/uploads/2021/01/Enable-Minimize-And-Maximize-Buttons-In-Application-Windows-In-Fedora.png
[6]: https://ostechnix.com/wp-content/uploads/2021/01/Minimize-maximize-buttons-appears-in-applications-windows-in-Fedora.png
[7]: https://extensions.gnome.org/extension/1160/dash-to-panel/
