[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11720-1.html)
[#]: subject: (Build a retro Apple desktop with the Linux MLVWM)
[#]: via: (https://opensource.com/article/19/12/linux-mlvwm-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Linux MLVWM 打造复古苹果桌面
======

> 本文是 24 天 Linux 桌面特别系列的一部分。如果老式的苹果电脑是用开源 POSIX 构建的呢？你可以通过构建 Macintosh 式的虚拟窗口管理器来实现。

![Person typing on a 1980's computer][1]

想象一下穿越到另一段平行历史，Apple II GS 和 MacOS 7 是基于开源 [POSIX][2] 构建的，它使用了与现代 Linux 相同的所有惯例，例如纯文本配置文件和模块化系统设计。这样的操作系统将为其用户带来什么？你可以使用 [Macintosh 式的虚拟窗口管理器（MLVWM）][3]来回答这些问题（甚至更多！）。

![MLVWM running on Slackware 14.2][4]

### 安装 MLVWM

MLVWM 安装并不容易，并且可能不在你的发行版软件仓库中。如果你有时间理解翻译不佳的 README 文件，编辑一些配置文件，收集并调整一些旧的 .xpm 图片，编辑一两个 Xorg 选项，那么你就可以体验 MLVWM。不管怎么说，这是一个新奇的窗口管理器，其最新版本可以追溯到 2000 年。

要编译 MLVWM，你必须安装 imake，它提供了 `xmkmf` 命令。你可以从发行版的软件仓库中安装 imake，也可以直接从 [Freedesktop.org][5] 获得。假设你已经有 `xmkmf` 命令，请进入包含 MLVWM 源码的目录，然后运行以下命令进行构建：

```
$ xmkmf -a
$ make
```

构建后，编译后的 `mlvwm` 二进制文件位于 `mlvwm` 目录中。将其移动到[你的 PATH][6] 的任何位置：

```
$ mv mlvwm/mlvwm /usr/local/bin/
```

#### 编辑配置文件

现在已经安装好 MLVWM，但是如果不调整几个配置文件并仔细放好所需的图像文件，它将无法正确启动。示例配置文件位于你下载的源代码的 `sample_rc` 目录中。将文件 `Mlvwm-Netscape` 和 `Mlvwm-Xterm` 复制到你的主目录：

```
$ cp sample_rc/Mlvwm-{Netscape,Xterm} $HOME
```

将 `Mlvwmrc` 改名为 `$HOME/.mlvwmrc`（是的，即使示例文件的名称看似是大写字母，但你也必须使用小写的 “m”）：

```
$ cp sample_rc/Mlvwmrc $HOME/.mlvwmrc
```

打开 `.mlwmrc` 并找到第 54-55 行，它们定义了 MLVWM 在菜单和 UI 中使用的像素图的路径（`IconPath`）：

```
# Set icon search path. It needs before "Style".
IconPath /usr/local/include/X11/pixmaps:/home2/tak/bin/pixmap
```

调整路径以匹配你填充图像的路径（我建议使用 `$HOME/.local/share/pixmaps`）。MLVWM 不提供像素图，因此需要你提供构建桌面所需图标。

即使你有位于系统其他位置的像素图（例如 `/usr/share/pixmaps`），也要这样做，因为你需要调整像素图的大小，你可能也不想在系统范围内执行此操作。

```
# Set icon search path. It needs before "Style".
IconPath /home/seth/.local/share/pixmaps
```

#### 选择像素图

你已将 `.local/share/pixmaps` 目录定义为像素图源路径，但是该目录和图像均不存在。创建目录：

```
$ mkdir -p $HOME/.local/share/pixmaps
```

现在，配置文件将图像分配给菜单项和 UI 元素，但是系统中不存在这些图像。要解决此问题，请通读配置文件并找到每个 .xpm 图像。对于配置中列出的每个图像，将具有相同文件名的图像（或更改配置文件中的文件名）添加到你的 IconPath 目录。

`.mlvwmrc` 文件的注释很好，因此你可以大致了解要编辑的内容。无论如何，这只是第一步。你可以随时回来更改桌面外观。

这有些例子。

此代码块设置屏幕左上角的图标：

```
# Register the menu
Menu Apple, Icon label1.xpm, Stick
```

`label1.xpm` 图像实际上在源代码的 `pixmap` 目录中，但我更喜欢使用来自 `/usr/share/pixmaps` 的 `Penguin.xpm`（在 Slackware 上）。无论使用什么，都必须将自定义像素图放在 `~/.local/share/pixmaps` 中，并在配置中更改像素图的名称，或者重命名像素图以匹配配置文件中当前的名称。

此代码块定义了左侧菜单中列出的应用：

```
"About this Workstation..." NonSelect, Gray, Action About
"" NonSelect
"Terminal"      Icon mini-display.xpm, Action Exec "kterm" exec kterm -ls
"Editor"  Action Exec "mule" exec mule, Icon mini-edit.xpm
"calculator" Action Exec "xcal" exec xcalc, Icon mini-calc.xpm
END
```

通过遵循与配置文件中相同的语法，你可以自定义像素图并将自己的应用添加到菜单中（例如，我将 `mule` 更改为 `emacs`）。这是你在 MLVWM GUI 中打开应用的入口，因此请列出你要快速访问的所有内容。你可能还希望包括指向 `/usr/share/applications` 文件夹的快捷方式。

```
"Applications" Icon Penguin.xpm, Action Exec "thunar /usr/share/applications" exec thunar /usr/share/applications
```

完成编辑配置文件并将自己的图像添加到 IconPath 目录后，必须将所有像素图的大小都调整为大约 16x16 像素。（MLVWM 的默认设置不一致，因此存在变化空间。）你可以使用 ImageMagick 进行批量操作：

```
$ for i in ~/.local/share/mlvwm-pixmaps/*xpm ; do convert -resize '16x16^' $i; done
```

### 启动 MLVWM

最简单的运行 MLVWM 的方式是让 Xorg 完成大部分工作。首先，你必须创建一个 `$HOME/.xinitrc` 文件。我从 Slackware 复制了这个，它也是从 Xorg 拿来的：

```
#!/bin/sh
# $XConsortium: xinitrc.cpp,v 1.4 91/08/22 11:41:34 rws Exp $

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f $userresources ]; then
    xrdb -merge $userresources
fi

if [ -f $usermodmap ]; then
    xmodmap $usermodmap
fi

# Start the window manager:
if [ -z "$DESKTOP_SESSION" -a -x /usr/bin/ck-launch-session ]; then
  exec ck-launch-session /usr/local/bin/mlvwm
else
  exec /usr/local/bin/mlvwm
fi
```

根据此文件，`startx` 命令的默认操作是启动 MLVWM。但是，你的发行版可能对于图形服务器启动（或被终止以重新启动）时会发生的情况有其他做法，因此此文件可能对你没有什么帮助。在许多发行版上，你可以添加 .desktop 文件到 `/usr/share/xsessions` 中，以将其列在 GDM 或 KDM 菜单中，因此创建名为 `mlvwm.desktop` 的文件并输入：

```
[Desktop Entry]
Name=Mlvwm
Comment=Macintosh-like virtual window manager
Exec=/usr/local/bin/mlvwm
TryExec=ck-launch-session /usr/local/bin/mlvwm
Type=Application
```

从桌面会话注销并重新登录到 MLVWM。默认情况下，会话管理器（KDM、GDM 或 LightDM，具体取决于你的设置）将继续登录到以前的桌面，因此在登录之前必须覆盖它。

对于 GDM：

![][7]

对于 SDDM：

![][8]

#### 强制启动

如果 MLVWM 无法启动，请尝试安装 XDM，这是一个轻量级会话管理器，它不会查询 `/usr/share/xsessions` 的内容，而是执行经过身份验证用户的所有 `.xinitrc` 操作。

![MLVWM][9]

### 打造自己的复古苹果

MLVWM 桌面未经打磨、不完美、模仿到位且充满乐趣。你看到的许多菜单项都是未实现的，但你可以使它们变得活跃且有意义。

这是一次让你时光倒流、改变历史，让老式苹果系列电脑成为开源堡垒的机会。成为一名修正主义者，设计你自己的复古苹果桌面，最重要的是，它有乐趣。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/linux-mlvwm-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/1980s-computer-yearbook.png?itok=eGOYEKK- (Person typing on a 1980's computer)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: http://www2u.biglobe.ne.jp/~y-miyata/mlvwm.html
[4]: https://opensource.com/sites/default/files/uploads/advent-mlvwm-file.jpg (MLVWM running on Slackware 14.2)
[5]: http://cgit.freedesktop.org/xorg/util/imake
[6]: https://opensource.com/article/17/6/set-path-linux
[7]: https://opensource.com/sites/default/files/advent-gdm_2.jpg
[8]: https://opensource.com/sites/default/files/advent-kdm_1.jpg
[9]: https://opensource.com/sites/default/files/uploads/advent-mlvwm-chess.jpg (MLVWM)
