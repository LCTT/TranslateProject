[#]: subject: "Using GDM Settings to Customize Login Screen in GNOME"
[#]: via: "https://itsfoss.com/customize-gdm-login/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

使用 GDM 设置自定义 GNOME 中的登录屏幕
======

从 Dock 到 grub 屏幕，GNOME 都可以根据你的喜好进行定制。

登录界面也在此列，因为一款名为 “GDM 设置”的新工具可让你更改 GNOME 登录界面的外观并调整其功能。

你可以更改壁纸、主题、图标、时间格式、顶部面板项目等。你还可以在登录界面启用点击功能（我喜欢这个）。

在本教程中，你将了解安装此工具的步骤以及如何使用它来更改 GDM 登录屏幕的各个方面。

不用说，你必须使用 GNOME 桌面环境和 GDM 显示管理器才能按照此处的说明进行操作。

🚧

以这种方式使用设置可能会产生问题。使用 Timeshift 备份系统设置。如果你很容易不知所措并且不喜欢排除故障，请完全避免使用它。

### 使用 GDM 设置工具进行调整

让我们首先看看你可以使用这个很棒的程序进行哪些更改。

#### 1\. 更改 shell 主题、图标和壁纸

你可以更改登录屏幕的主题、图标和壁纸。这是一个例子。

![][1]

要更改主题，你应该先下载它。从 [GNOME Look 网站][2]获取一个。

接下来，确保主题位于 `/usr/share/themes` 中。存储在 `~/.themes` 中的主题对 GDM 设置应用不可见。

在 GDM 设置工具中，转到外观选项卡并选择主题/图标/光标。

![GDM 主题设置][3]

如果要设置壁纸，请将背景更改为“图像”，然后从文件浏览器浏览图片。

![更换壁纸][4]

完成后，单击“应用”。这将要求输入密码。出现提示时提供。

你将收到注销通知以应用更改。注销后，更改将可见。

![注销提示][5]

💡

你可以更改所有设置然后单击“应用”，或者每次设置后单击“应用”。如果按“应用”，则会提示你注销，每次都需要重新登录并再次打开设置应用。

#### 2\. 更改字体

在更改字体之前，你需要为所有用户在系统上安装该字体。

为了确保这一点，请将下载的自定义字体文件粘贴到 `/usr/local/share/fonts`，然后使用以下命令创建字体缓存：

````

     fc-cache -f -v

````

现在，打开 GDM 设置并转到“字体”选项卡。在那里，你可以设置字体、抗锯齿设置等。

![更改字体设置][6]

你可以看到新字体现已设置为你的登录屏幕。

![自定义字体][7]

#### 3\. 更改顶部面板的颜色

要更改顶部面板颜色，请转到侧栏中的顶部栏选项。在“调整”下，启用“更改背景颜色”按钮，然后设置所需的颜色。

![更改顶部面板颜色设置][8]

将顶部栏的文本颜色更改为适合你选择的背景的颜色也同样重要。

![更改顶栏颜色][9]

#### 4\. 更改时间显示格式

使用下拉菜单将时钟更改为 24 小时或 12 小时格式。

![更改时间显示格式设置][10]

此外，你可以通过切换相应的按钮使秒在顶部栏上可见。

![顶栏显示秒][11]

#### 5\. 启用登录屏幕点击

在大多数发行版中，这是默认行为。即使在系统中启用了点击，GNOME 登录界面也需要使用鼠标左键点击。

要更改此设置，请转到鼠标和触摸板部分并启用点击按钮。

![启用屏幕点击][12]

在同一菜单上，你可以选择调整鼠标光标大小（如果你觉得它很小）。

![更改鼠标光标大小][13]

#### 6\。启用夜灯

你可以为 GDM 启用预定的夜灯。

转到显示，打开夜灯按钮。现在，安排日落到日出或你选择的方便时间。

![启用夜灯][14]

#### 7\. 添加 logo 和欢迎消息

转到登录屏幕选项卡，然后启用“启用 logo” 按钮。这将为你提供一个浏览图像的按钮。

![添加 logo][15]

选择图像并按应用。

📋

在我的系统显示器上，尺寸高达 128×128 像素的图像看起来是可以接受的，超出这个尺寸对我来说看起来很大。因此，请相应地选择尺寸。

应用图像后，要设置欢迎消息，请启用欢迎消息按钮，然后添加你想要显示的文本。

![添加欢迎信息][16]

当你选择用户输入密码时，将显示该消息。

![登录屏幕欢迎消息][17]

#### 8\. 导出和导入设置

如果你想在其他系统上应用相同的设置，你可以导出设置并将其导入到运行 GDM 设置工具的其他系统上。

单击左上角的菜单，然后选择“**导出到文件**”。

![导出到文件][18]

将文件命名为“.ini”并将其保存在安全的地方。你可以稍后导入。

![命名文件][19]

#### 9\. 重置所有设置

不喜欢你所做的更改？ 有一个简单的方法可以恢复默认值。

要重置调整，请单击左上角的菜单并选择“重置”。

![重置设置][20]

现在，按“应用”。它会询问你的密码。提供后，系统将提示你注销。

你可以看到，所有更改均已恢复。

#### 10\. 更多设置

还有其他可用的调整，例如：

   1. 在顶栏显示电池百分比，通过**顶栏 ⇾ 电源 ⇾ 显示电池百分比**。
   2. 通过**登录屏幕 ⇾ 禁用用户列表**，在登录屏幕上禁用或启用用户列表。
   3. 通过**电源**选项卡更改屏幕关闭时间、暂停时间和其他电源设置。



### 安装 GDM 设置工具

既然你知道该工具可以进行哪些调整，你可能想自己尝试一下。让我们看看如何安装它。

📋

在 Ubuntu/Pop!\_OS 上，GDM 设置工具对我不起作用。我将其作为 Flatpak 应用在 Debian 12 Bookworm 上使用。

GDM 设置工具可以作为 Flatpak 安装。

```

    flatpak install flathub io.github.realmazharhussain.GdmSettings

```

或者，它可以作为 [AppImage][21] 提供。

对于 Arch Linux 用户，请使用 AUR 中的任何 AUR 助手进行安装。

```

    yay -S gdm-settings

```

### 结论

登录屏幕并不是每个人都可以定制的。除了“点击”更改之外，大多数其他更改都只是外观更改。

总的来说，对于喜欢自定义设置的每个角落的人们来说，有这样的选项是件好事。

🗨️ 你是那些痴迷于定制的 Linux 用户之一吗？ 你会尝试 GDM 设置吗？

--------------------------------------------------------------------------------

via: https://itsfoss.com/customize-gdm-login/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2024/01/gdm-settings-applied.webp
[2]: https://www.gnome-look.org/browse/
[3]: https://itsfoss.com/content/images/2023/12/gdm-settings-set-log-in-themes-settings.png
[4]: https://itsfoss.com/content/images/2023/12/gdm-settings-set-an-image-settings.png
[5]: https://itsfoss.com/content/images/2023/12/gdm-settings-click-on-logout.png
[6]: https://itsfoss.com/content/images/2023/12/gdm-settings-apply-custom-font-settings.png
[7]: https://itsfoss.com/content/images/2023/12/different-font-applied-1.png
[8]: https://itsfoss.com/content/images/2023/12/gdm-settings-change-topbar-background-color.png
[9]: https://itsfoss.com/content/images/2023/12/panel-color-changed.png
[10]: https://itsfoss.com/content/images/2023/12/gdm-settings-top-bar-clock-settings.png
[11]: https://itsfoss.com/content/images/2023/12/gdm-settings-show-seconds-on-top-bar.png
[12]: https://itsfoss.com/content/images/2023/12/gdm-settings-enable-tap-to-click-settings.png
[13]: https://itsfoss.com/content/images/2023/12/gdm-settings-add-different-cursor-size-settings.png
[14]: https://itsfoss.com/content/images/2023/12/gdm-settings-change-night-light-settings.png
[15]: https://itsfoss.com/content/images/2023/12/gdm-settings-enable-logo-settings.png
[16]: https://itsfoss.com/content/images/2023/12/gdm-settings-enable-welcome-message-settings.png
[17]: https://itsfoss.com/content/images/2023/12/logo-and-welcome-message-added.png
[18]: https://itsfoss.com/content/images/2023/12/gdm-settings-click-on-export-to-file.png
[19]: https://itsfoss.com/content/images/2023/12/gdm-settings-save-the-export-file-as-gdm-settings-ini.png
[20]: https://itsfoss.com/content/images/2023/12/gdm-settings-click-on-reset.png
[21]: https://github.com/gdm-settings/gdm-settings/releases
