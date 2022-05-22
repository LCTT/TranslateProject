[#]: subject: (Why I love using bspwm for my Linux window manager)
[#]: via: (https://opensource.com/article/21/4/bspwm-linux)
[#]: author: (Stephen Adams https://opensource.com/users/stevehnh)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13308-1.html)

为什么我喜欢用 bspwm 来做我的 Linux 窗口管理器
======

> 在 Fedora Linux 上安装、配置并开始使用 bspwm 窗口管理器。

![](https://img.linux.net.cn/data/attachment/album/202104/18/114637hxvqp4hfvbbhihb4.jpg)

有些人喜欢重新布置家具。还有的人喜欢尝试新鞋或定期重新装修他们的卧室。我呢，则是尝试 Linux 桌面。

在对网上看到的一些不可思议的桌面环境流口水之后，我对一个窗口管理器特别好奇：[bspwm][2]。

![bspwm desktop][3]

我喜欢 [i3][5] 窗口管理器已经有一段时间了，我很喜欢它的布局方式和上手的便捷性。但 bspwm 的某些特性吸引了我。有几个原因让我决定尝试一下：

  * 它_只是_一个窗口管理器（WM）。
  * 它由几个易于配置的脚本管理。
  * 它默认支持窗口之间的间隙。

可能是最需要指出的第一个原因是它只是一个窗口管理器。和 i3 一样，默认情况下没有任何图形化的那些花哨东西。你当然可以随心所欲地定制它，但_你_需要付出努力来使它看起来像你想要的。这也是它吸引我的部分原因。

虽然它可以在许多发行版上使用，但在我这个例子中使用的是 Fedora Linux。

### 安装 bspwm

bspwm 在大多数常见的发行版中都有打包，所以你可以用系统的包管理器安装它。下面这个命令还会安装 [sxkhd][6]，这是一个 X 窗口系统的守护程序，它“通过执行命令对输入事件做出反应”；还有 [dmenu][7]，这是一个通用的 X 窗口菜单：

```
dnf install bspwm sxkhd dmenu
```

因为 bspwm 只是一个窗口管理器，所以没有任何内置的快捷键或键盘命令。这也是它与 i3 等软件的不同之处。所以，在你第一次启动窗口管理器之前，请先配置一下 `sxkhd`：

```
systemctl start sxkhd
systemctl enable sxkhd
```

这样就可以在登录时启用 `sxkhd`，但你还需要一些基本功能的配置：

```
curl https://raw.githubusercontent.com/baskerville/bspwm/master/examples/sxhkdrc --output ~/.config/sxkhd/sxkhdrc
```

在你深入了解之前，不妨先看看这个文件，因为有些脚本调用的命令可能在你的系统中并不存在。一个很好的例子是调用 `urxvt` 的 `super + Return` 快捷键。把它改成你喜欢的终端，尤其是当你没有安装 `urxvt` 的时候：

```
#
# wm independent hotkeys
#
   
# terminal emulator
super + Return
        urxvt
   
# program launcher
super + @space
        dmenu_run
```

如果你使用的是 GDM、LightDM 或其他显示管理器（DM），只要在登录前选择 `bspwm` 即可。

### 配置 bspwm

当你登录后，你会看到屏幕上什么都没有。这不是你感觉到的空虚感。而是无限可能性！你现在可以开始摆弄桌面环境的所有部分了。你现在可以开始摆弄这些年你认为理所当然的桌面环境的所有部分了。从头开始构建并不容易，但一旦你掌握了诀窍，就会非常有收获。

任何窗口管理器最困难的是掌握快捷键。你开始会很慢，但在很短的时间内，你就可以只使用键盘在系统中到处操作，在你的朋友和家人面前看起来像一个终极黑客。

你可以通过编辑 `~/.config/bspwm/bspwmrc`，在启动时添加应用，设置桌面和显示器，并为你的窗口应该如何表现设置规则，随心所欲地定制系统。有一些默认设置的例子可以让你开始使用。键盘快捷键都是由 `sxkhdrc` 文件管理的。

还有更多的开源项目可以安装，让你的电脑看起来更漂亮，比如用于桌面背景的 [Feh][8]、状态栏的 [Polybar][9]、应用启动器的 [Rofi][10]，还有 [Compton][11] 可以给你提供阴影和透明度，可以让你的电脑看起来焕然一新。

玩得愉快！

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/4/bspwm-linux

作者：[Stephen Adams][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/stevehnh
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/windows_building_sky_scale.jpg?itok=mH6CAX29 (Tall building with windows)
[2]: https://github.com/baskerville/bspwm
[3]: https://opensource.com/sites/default/files/uploads/bspwm-desktop.png (bspwm desktop)
[4]: https://creativecommons.org/licenses/by-sa/4.0/
[5]: https://i3wm.org/
[6]: https://github.com/baskerville/sxhkd
[7]: https://linux.die.net/man/1/dmenu
[8]: https://github.com/derf/feh
[9]: https://github.com/polybar/polybar
[10]: https://github.com/davatorium/rofi
[11]: https://github.com/chjj/compton
