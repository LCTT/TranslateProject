[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11712-1.html)
[#]: subject: (Customize your Linux desktop with FVWM)
[#]: via: (https://opensource.com/article/19/12/fvwm-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 FVWM 自定义 Linux 桌面
======

> 本文是 24 天 Linux 桌面特别系列的一部分。如果你正在寻找轻巧、快速且简单的 Linux 窗口管理器，那么 FVWM 可以胜任。但是，如果你正在寻找可以深入、探索和魔改的窗口管理器，那么 FVWM 是必须的。

![](https://img.linux.net.cn/data/attachment/album/201912/25/062800dwh3yhfcpx3ggjxp.jpg)

[FVWM][2] 窗口管理器最早脱胎于对 1993 年的 [TWM][3] 的修改。经过几年的迭代，诞生了一个可高度自定义的环境，它可以配置任何行为、动作或事件。它支持自定义键绑定、鼠标手势、主题、脚本等。

尽管 FVWM 在安装后即可投入使用，但默认分发版本仅提供了极其少的配置。这是开始自定义桌面环境的良好基础，但是，如果你只想将其用作桌面，那么可能要安装由其它用户发布的完整配置版本。FVWM 有几种不同的分发版，包括模仿 Windows 95 的 FVWM95（至少在外观和布局上）。我尝试了 [FVWM-Crystal][4]，这是一个具有一些现代 Linux 桌面约定的现代主题。

可以从 Linux 发行版的软件仓库中安装要尝试的 FVWM 分发版。如果找不到特定的 FVWM 分发版，那么可以安装基础的 FVWM2 包，然后进入 [Box-Look.org][5] 手动下载主题包。这样就需要更多的工作，但比从头开始构建要少。

安装后，请注销当前的桌面会话，以便你可以登录 FVWM。默认情况下，会话管理器（KDM、GDM、LightDM 或 XDM，取决于你的设置）将继续登录到以前的桌面，因此你必须在登录之前覆盖该桌面。

对于 GDM：

![Select your desktop session in GDM][6]

对于 KDM：

![Select your desktop session with KDM][7]

### FVWM 桌面

无论你使用什么主题和配置，当你在桌面上单击鼠标左键时，FVWM 至少会显示一个菜单。菜单的内容取决于你所安装的内容。FVWM-Crystal 分发版中的菜单包含对常用首选项的快速访问，例如屏幕分辨率、壁纸设置、窗口装饰等。

同 FVWM 中的几乎所有东西一样，你可以编辑菜单中你要想的内容，但 FVWM-Crystal 的特色在于其应用菜单栏。应用菜单位于屏幕的左上角，每个图标都包含了相关的应用启动器的菜单。例如，GIMP 图标表示图像编辑器，KDevelop 图标表示集成开发环境（IDE），GNU 图标表示文本编辑器，等等，具体取决于你在系统上安装的程序。

![FVWM-crystal running on Slackware 14.2][8]

FVWM-Crystal 还提供了虚拟桌面、任务栏、时钟和应用栏。

关于背景，你可以使用与 FVWM-Crystal 捆绑在一起的壁纸，也可以使用 `feh` 命令设置自己的壁纸（你可能需要从仓库中安装它）。此命令有一些设置背景的选项，包括 `--bg-scale` 使用你选择的图片缩放填充屏幕，`--bg-fill` 直接填充而不缩放图片，等等。

```
$ feh --bg-scale ~/Pictures/wallpapers/mybackground.jpg
```

大多数配置文件都包含在 `$HOME/.fvwm-crystal` 中，某些系统范围的默认文件位于 `/usr/share/fvwm-crystal`。

### 自己尝试一下

FVWM 是大多作为一个桌面构建平台，它也是窗口管理器。它不会为你做到面面俱到，它期望你来配置尽可能的一切。

如果你正在寻找轻巧、快速且简单的窗口管理器，那么 FVWM 可以胜任。但是，如果你正在寻找可以深入、探索和魔改的窗口管理器，那么 FVWM 是必须的。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/fvwm-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: http://www.fvwm.org/
[3]: https://en.wikipedia.org/wiki/Twm
[4]: https://www.box-look.org/p/1018270/
[5]: http://box-look.org
[6]: https://opensource.com/sites/default/files/advent-gdm_0.jpg (Select your desktop session in GDM)
[7]: https://opensource.com/sites/default/files/advent-kdm.jpg (Select your desktop session with KDM)
[8]: https://opensource.com/sites/default/files/advent-fvwm-crystal.jpg (FVWM-crystal running on Slackware 14.2)
