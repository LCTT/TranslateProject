[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11235-1.html)
[#]: subject: (Let’s try dwm — dynamic window manager)
[#]: via: (https://fedoramagazine.org/lets-try-dwm-dynamic-window-manger/)
[#]: author: (Adam Šamalík https://fedoramagazine.org/author/asamalik/)

试试动态窗口管理器 dwm 吧
======

![][1]

如果你崇尚效率和极简主义，并且正在为你的 Linux 桌面寻找新的窗口管理器，那么你应该尝试一下<ruby>动态窗口管理器<rt>dynamic window manager</rt></ruby> dwm。以不到 2000 标准行的代码写就的 dwm，是一个速度极快而功能强大，且可高度定制的窗口管理器。

你可以在平铺、单片和浮动布局之间动态选择，使用标签将窗口组织到多个工作区，并使用键盘快捷键快速导航。本文将帮助你开始使用 dwm。

### 安装

要在 Fedora 上安装 dwm，运行：

```
$ sudo dnf install dwm dwm-user
```

`dwm` 包会安装窗口管理器本身，`dwm-user` 包显著简化了配置，本文稍后将对此进行说明。

此外，为了能够在需要时锁定屏幕，我们还将安装 `slock`，这是一个简单的 X 显示锁屏。

```
$ sudo dnf install slock
```

当然，你可以根据你的个人喜好使用其它的锁屏。

### 快速入门

要启动 dwm，在登录屏选择 “dwm-user” 选项。

![][2]

登录后，你将看到一个非常简单的桌面。事实上，顶部唯一的一个面板列出了代表工作空间的 9 个标签和一个代表窗户布局的 `[]=` 符号。

#### 启动应用

在查看布局之前，首先启动一些应用程序，以便你可以随时使用布局。可以通过按 `Alt+p` 并键入应用程序的名称，然后回车来启动应用程序。还有一个快捷键 `Alt+Shift+Enter` 用于打开终端。

现在有一些应用程序正在运行了，请查看布局。

#### 布局

默认情况下有三种布局：平铺布局，单片布局和浮动布局。

平铺布局由条形图上的 `[]=` 表示，它将窗口组织为两个主要区域：左侧为主区域，右侧为堆叠区。你可以按 `Alt+t` 激活平铺布局。

![][3]

平铺布局背后的想法是，主窗口放在主区域中，同时仍然可以看到堆叠区中的其他窗口。你可以根据需要在它们之间快速切换。

要在两个区域之间交换窗口，请将鼠标悬停在堆叠区中的一个窗口上，然后按 `Alt+Enter` 将其与主区域中的窗口交换。

![][4]

单片布局由顶部栏上的 `[N]` 表示，可以使你的主窗口占据整个屏幕。你可以按 `Alt+m` 切换到它。

最后，浮动布局可让你自由移动和调整窗口大小。它的快捷方式是 `Alt+f`，顶栏上的符号是 `><>`。

#### 工作区和标签

每个窗口都分配了一个顶部栏中列出的标签（1-9）。要查看特定标签，请使用鼠标单击其编号或按 `Alt+1..9`。你甚至可以使用鼠标右键单击其编号，一次查看多个标签。

通过使用鼠标突出显示后，并按 `Alt+Shift+1..9`，窗口可以在不同标签之间移动。

### 配置

为了使 dwm 尽可能简约，它不使用典型的配置文件。而是你需要修改代表配置的 C 语言头文件，并重新编译它。但是不要担心，在 Fedora 中你只需要简单地编辑主目录中的一个文件，而其他一切都会在后台发生，这要归功于 Fedora 的维护者提供的 `dwm-user` 包。

首先，你需要使用类似于以下的命令将文件复制到主目录中：

```
$ mkdir ~/.dwm
$ cp /usr/src/dwm-VERSION-RELEASE/config.def.h ~/.dwm/config.h
```

你可以通过运行 `man dwm-start` 来获取确切的路径。

其次，只需编辑 `~/.dwm/config.h` 文件。例如，让我们配置一个新的快捷方式：通过按 `Alt+Shift+L` 来锁定屏幕。

考虑到我们已经安装了本文前面提到的 `slock` 包，我们需要在文件中添加以下两行以使其工作：

在 `/* commands */` 注释下，添加：

```
static const char *slockcmd[] = { "slock", NULL };
```

添加下列行到 `static Key keys[]` 中：

```
{ MODKEY|ShiftMask, XK_l, spawn, {.v = slockcmd } },
```

最终，它应该看起来如下：

```
...
 /* commands */
 static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
 static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", normbgcolor, "-nf", normfgcolor, "-sb", selbgcolor, "-sf", selfgcolor, NULL };
 static const char *termcmd[]  = { "st", NULL };
 static const char *slockcmd[] = { "slock", NULL };

 static Key keys[] = {
     /* modifier                     key        function        argument */
     { MODKEY|ShiftMask,             XK_l,      spawn,          {.v = slockcmd } },
     { MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
     { MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
 ...
```

保存文件。

最后，按 `Alt+Shift+q` 注销，然后重新登录。`dwm-user` 包提供的脚本将识别你已更改主目录中的`config.h` 文件，并会在登录时重新编译 dwm。因为 dwm 非常小，它快到你甚至都不会注意到它重新编译了。

你现在可以尝试按 `Alt+Shift+L` 锁定屏幕，然后输入密码并按回车键再次登录。

### 总结

如果你崇尚极简主义并想要一个非常快速而功能强大的窗口管理器，dwm 可能正是你一直在寻找的。但是，它可能不适合初学者，你可能需要做许多其他配置才能按照你的喜好进行配置。

要了解有关 dwm 的更多信息，请参阅该项目的主页： <https://dwm.suckless.org/>。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/lets-try-dwm-dynamic-window-manger/

作者：[Adam Šamalík][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/asamalik/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/03/dwm-magazine-image-816x345.png
[2]: https://fedoramagazine.org/wp-content/uploads/2019/03/choosing-dwm-1024x469.png
[3]: https://fedoramagazine.org/wp-content/uploads/2019/03/dwm-desktop-1024x593.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/03/Screenshot-2019-03-15-at-11.12.32-1024x592.png
