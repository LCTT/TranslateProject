如何在 Arch Linux 中设置日语环境
======

![](https://www.ostechnix.com/wp-content/uploads/2017/11/Setup-Japanese-Language-Environment-In-Arch-Linux-720x340.jpg)

在本教程中，我们将讨论如何在 Arch Linux 中设置日语环境。在其他类 Unix 操作系统中，设置日文布局并不是什么大不了的事情。你可以从设置中轻松选择日文键盘布局。然而，在 Arch Linux 下有点困难，ArchWiki 中没有合适的文档。如果你正在使用 Arch Linux 和/或其衍生产品如 Antergos、Manajaro Linux，请遵循本指南以在 Arch Linux 及其衍生系统中使用日语。

### 在 Arch Linux 中设置日语环境

首先，为了正确查看日语字符，先安装必要的日语字体：

```
sudo pacman -S adobe-source-han-sans-jp-fonts otf-ipafont
pacaur -S ttf-monapo
```

如果你尚未安装 `pacaur`，请参阅[此链接][1]。

确保你在 `/etc/locale.gen` 中注释掉了（添加 `#` 注释）下面的行。

```
#ja_JP.UTF-8
```

然后，安装 iBus 和 ibus-anthy。对于那些想知道原因的，iBus 是类 Unix 系统的输入法（IM）框架，而 ibus-anthy 是 iBus 的日语输入法。

```
sudo pacman -S ibus ibus-anthy
```

在 `~/.xprofile` 中添加以下几行（如果不存在，创建一个）：

```
# Settings for Japanese input
export GTK_IM_MODULE='ibus'
export QT_IM_MODULE='ibus'
export XMODIFIERS=@im='ibus'

#Toolbar for anthy
ibus-daemon -drx
```

`~/.xprofile` 允许我们在 X 用户会话开始时且在窗口管理器启动之前执行命令。

保存并关闭文件。重启 Arch Linux 系统以使更改生效。

登录到系统后，右键单击任务栏中的 iBus 图标，然后选择 “Preferences”。如果不存在，请从终端运行以下命令来启动 iBus 并打开偏好设置窗口。

```
ibus-setup
```

选择 “Yes” 来启动 iBus。你会看到一个像下面的页面。点击 Ok 关闭它。

[![][2]][3]

现在，你将看到 iBus 偏好设置窗口。进入 “Input Method” 选项卡，然后单击 “Add” 按钮。

[![][2]][4]

在列表中选择 “Japanese”：

[![][2]][5]

然后，选择 “Anthy” 并点击添加：

[![][2]][6]

就是这样了。你现在将在输入法栏看到 “Japanese - Anthy”：

[![][2]][7]

根据你的需求在偏好设置中更改日语输入法的选项（点击 “Japanese-Anthy” -> “Preferences”）。

[![][2]][8]

你还可以在键盘绑定中编辑默认的快捷键。完成所有更改后，点击应用并确定。就是这样。从任务栏中的 iBus 图标中选择日语，或者按下 `SUPER + 空格键”（LCTT 译注：SUPER 键通常为 `Command` 或 `Window` 键）来在日语和英语（或者系统中的其他默认语言）之间切换。你可以从 iBus 首选项窗口更改键盘快捷键。

现在你知道如何在 Arch Linux 及其衍生版中使用日语了。如果你发现我们的指南很有用，那么请您在社交、专业网络上分享，并支持我们。

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/setup-japanese-language-environment-arch-linux/

作者：[SK][a]
译者：[geekpi](https://github.com/geekpi)
校对：[Locez](https://github.com/locez)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com
[1]:https://www.ostechnix.com/install-pacaur-arch-linux/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2017/11/ibus.png 
[4]:http://www.ostechnix.com/wp-content/uploads/2017/11/iBus-preferences.png 
[5]:http://www.ostechnix.com/wp-content/uploads/2017/11/Choose-Japanese.png 
[6]:http://www.ostechnix.com/wp-content/uploads/2017/11/Japanese-Anthy.png 
[7]:http://www.ostechnix.com/wp-content/uploads/2017/11/iBus-preferences-1.png 
[8]:http://www.ostechnix.com/wp-content/uploads/2017/11/ibus-anthy.png 
