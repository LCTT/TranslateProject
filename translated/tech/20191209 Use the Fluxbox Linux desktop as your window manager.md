[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use the Fluxbox Linux desktop as your window manager)
[#]: via: (https://opensource.com/article/19/12/fluxbox-linux-desktop)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 Fluxbox Linux desktop 作为你的窗口管理器
======
这篇文章是Linux 桌面24天的特别系列的一部分。
Fluxbox 对系统资源的占用非常轻量，但是它拥有重要的 Linux
桌面特色来使你的用户体验轻松快速高效。
![在蓝色区域中是，在浏览器上的文本编辑器][1]

桌面的概念可谓是仁者见仁智者见智。很多人把桌面看作一个家基地，或者一个舒适的客厅，甚至是一个字面意义上的桌面，在其中放置着他们经常使用的记事本，最好的笔和铅笔，还有他们最喜欢的咖啡杯。KDE, GNOME, Pantheon (等等)在 Linux 上提供了这种舒适的生活方式。

但是对一些用户来说，桌面只是一个空荡荡的监控控件，将还没有自由浮动的应用程序窗口直接投射到显示器上的一个侧面效果。对于这些用户来说，桌面是真空的，在其中他们可以运行应用程序—不管的大型办公软件和图形套件，还是一个简单的终端窗口，或是来管理服务的停靠小程序。这种操作一台 [POSIX][2] 计算机的模式有很长的历史，该家族树的一支是 *box 窗口管理器：Blackbox, Fluxbox 和 Openbox 。

[Fluxbox][3] 是一个针对 X11 系统的窗口管理器，它基于一个较老的名为 Blackbox 的项目。当我发现 Linux 时，Blackbox 的开发已进入衰退期，因此我进入 Fluxbox ，此后我至少在一个以上的活跃的系统上使用它。它使用 C++ 编写，并在 MIT 开源许可证下授权。

### 安装 Fluxbox

你很可能会在你的 Linux 发行版的存储库中找到 Fluxbox ，但是你也可以在 [Fluxbox.org][4] 上找到它。如果你正在运行一个不同的桌面，在同一个系统上安装 Fluxbox 是安全的，因为 Fluxbox 不预先决定任何配置或附带应用程序。

在安装 Fluxbox 后，注销你当前的桌面会话，以便你可以登录一个新的桌面会话。默认情况下，你的桌面会话管理器 (KDM, GDM, LightDM 或 XDM，取决于你的安装设置) 将你继续登录到上一个在桌面，所以你在登录前必需要覆盖上一个桌面。

使用 GDM 覆盖一个桌面：

![在 GDM 中选择你的桌面会话][5]

或者使用 KDM:

![使用 KDM 选择你的桌面会话][6]

### 配置 Fluxbox 桌面

当你第一次登录到桌面时，屏幕大部分是空的，因为 Fluxbox 提供的所有东西是面板(用于任务栏，系统托盘等等)和用于应用程序窗口的窗口装饰品。

![在 CentOS 7 上的默认 Fluxbox 配置][7]

如果你的发行版提供一个简单的 Fluxbox 桌面，你可以使用 **feh** 命令 (你可能需要从你的发行版存储库中来安装它) 来为你的桌面设置背景。这个命令有一些用于设置背景的选项，包括使用你选择的墙纸来填充屏幕的 **\--bg-fill** ，来按比例缩放的 **\--bg-scale** 等等选项。


```
`$ feh --bg-fill ~/photo/oamaru/leaf-spiral.jpg`
```

![应用主题的 Fluxbox ][8]

默认情况下，Fluxbox 自动生成一个菜单，在桌面上任意位置右键单击可用该菜单，这给予你访问应用程序的能力。取决于你的发行版，这个菜单可能非常小，也可能列出 **/usr/share/applications** 目录中的所有启动程序。

Fluxbox 配置是在文本文件中设置的，这些文本文件包含在 **$HOME/.fluxbox** 目录中。你可以：

  * 在 **keys** 中设置键盘快捷键
  * 在 **startup** 中启动服务和应用程序
  * 在 **init** 设置桌面首选项(例如工作区数量、面板位置等等)
  * 在 **menu** 中设置菜单项



该文本配置文件非常易于逆向工程，但是你也可以 (并且是应该) 阅读 Fluxbox [文档][9] 。

例如，这是我的典型菜单 (或者说至少有它的基本结构)：


```
# 为使用你自己的菜单，复制这些文本到 ~/.fluxbox/menu，然后编辑
# ~/.fluxbox/init ，并更改 session.menuFile 文件到 ~/.fluxbox/menu

[begin] (fluxkbox)
 [submenu] (apps) {}
  [submenu] (txt) {}
   [exec] (Emacs 23 (text\)) { x-terminal-emulator -T "Emacs (text)" -e /usr/bin/emacs -nw} <>
   [exec] (Emacs (X11\)) {/usr/bin/emacs} <>
   [exec] (LibreOffice) {/usr/bin/libreoffice}
  [end]
  [submenu] (code) {}
   [exec] (qtCreator) {/usr/bin/qtcreator}
   [exec] (eclipse) {/usr/bin/eclipse}
  [end]
  [submenu] (graphics) {}
   [exec] (ksnapshot) {/usr/bin/ksnapshot}
   [exec] (gimp) {/usr/bin/gimp}
   [exec] (blender) {/usr/bin/blender}
  [end]
  [submenu] (files) {}
   [exec] (dolphin) {/usr/bin/dolphin}
   [exec] (konqueror) { /usr/bin/kfmclient openURL $HOME }
  [end]
  [submenu] (network) {}
   [exec] (firefox) {/usr/bin/firefox}
   [exec] (konqueror) {/usr/bin/konqueror}
  [end]
 [end]
## 更改窗口管理器或工作环境
[submenu] (environments) {}
 [restart] (flux)  {/usr/bin/startfluxbox}
 [restart] (ratpoison)  {/usr/bin/ratpoison}
 [exec] (openIndiana) {/home/kenlon/qemu/startSolaris.sh}
[end]

[config] (config)
 [submenu] (styles) {}
  [stylesdir] (/usr/share/fluxbox/styles)
  [stylesdir] (~/.fluxbox/styles)
 [end]
[workspaces] (workspaces)
[reconfig] (reconfigure)
[restart] (restart)
[exit] (exeunt)
[end]
```

该菜单也提供一些首选项设置，例如，选择一个主题和从 Fluxbox 会话中重启或注销的能力。

我使用键盘快捷键来启动大多数的应用程序，这些快捷键写入到 **keys** 配置文件中。这里有一些示例 ( **Mod4** 按键是超级按键，我使用其来指定全局快捷键)：


```
# 打开应用程序
Mod4 t :Exec konsole
Mod4 k :Exec konqueror
Mod4 z :Exec fbrun
Mod4 e :Exec emacs
Mod4 f :Exec firefox
Mod4 x :Exec urxvt
Mod4 d :Exec dolphin
Mod4 q :Exec xscreensaver-command -activate
Mod4 3 :Exec ksnapshot
```

在这些快捷方式和一个打开的终端之间，在我工作日的大部分时间内很少使用鼠标，因此从一个控制器切换到另一个控制器不会浪费时间。并且因为 Fluxbox 很好地避开了控制器之间切换的方法，因此在其中操作没有一丝干扰。

### 为什么你应该使用 Fluxbox

Fluxbox 对系统资源的占用非常轻量，但是它拥有重要的功能来使你的用户体验轻松快速高效。它很容易定制，并且它允许你定义你自己的工作流。你不必使用 Fluxbox 的面板，因为在这里有其它的极好的面板。你甚至可以鼠标双击和拖动两个独立的应用程序窗口到彼此之中，以便它们成为一个窗口，每个窗口都有自己的选项卡。


无穷的可能性，所以今天就在你的 Linux 上尝试一下 Fluxbox 的简单稳定吧！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/12/fluxbox-linux-desktop

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/browser_blue_text_editor_web.png?itok=lcf-m6N7 (Text editor on a browser, in blue)
[2]: https://opensource.com/article/19/7/what-posix-richard-stallman-explains
[3]: http://fluxbox.org
[4]: http://fluxbox.org/download/
[5]: https://opensource.com/sites/default/files/advent-gdm_0.jpg (Select your desktop session in GDM)
[6]: https://opensource.com/sites/default/files/advent-kdm.jpg (Select your desktop session with KDM)
[7]: https://opensource.com/sites/default/files/advent-fluxbox-default.jpg (Default Fluxbox configuration on CentOS 7)
[8]: https://opensource.com/sites/default/files/advent-fluxbox-green.jpg (Fluxbox with a theme applied)
[9]: http://fluxbox.org/features/
