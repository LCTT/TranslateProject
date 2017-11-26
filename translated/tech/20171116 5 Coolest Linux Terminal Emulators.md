5 款最酷的 Linux 终端模拟器
============================================================


![Cool retro term](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner2.png)

> Carla Schroder 正在看着那些她喜欢的终端模拟器， 包括展示在这儿的 Cool Retro Term。

虽然，我们可以继续使用老旧的 GNOME 终端、Konsole，以及好笑而孱弱的旧式 xterm。 不过，让我们带着尝试某种新东西的心境，回过头来看看 5 款酷炫并且实用的 Linux 终端。

### Xiki

首先我要推荐的第一个终端是 [Xiki][10]。 Xiki 是 Craig Muth 的智慧结晶，他是一个天才程序员，也是一个有趣的人（有趣在此处的意思是幽默，可能还有其它的意思）。 很久以前我在 [遇见 Xiki，Linux 和 Mac OS X 下革命性命令行 Shell][11] 一文中介绍过 Xiki。 Xiki 不仅仅是又一款终端模拟器；它也是一个扩展命令行用途、加快命令行速度的交互式环境。

视频： https://youtu.be/bUR_eUVcABg

Xiki 支持鼠标，并且在绝大多数命令行 Shell 上都支持。 它有大量的屏显帮助，而且可以使用鼠标和键盘快速导航。 它体现在速度上的一个简单例子就是增强了 `ls` 命令。 Xiki 可以快速穿过文件系统上的多层目录，而不用持续的重复输入 `ls` 或者 `cd`， 或者利用那些巧妙的正则表达式。

Xiki 可以与许多文本编辑器相集成， 提供了一个永久的便签， 有一个快速搜索引擎， 同时像他们所说的，还有许许多多的功能。 Xiki 是如此的有特色、如此的不同， 所以学习和了解它的最快的方式可以看 [Craig 的有趣和实用的视频][12]。

### Cool Retro Term

我推荐 [Cool Retro Term][13] （如题图显示） 主要因为它的外观，以及它的实用性。 它将我们带回了阴极射线管显示器的时代，这不算很久以前，而我也没有怀旧的意思，我死也不会放弃我的 LCD 屏幕。它基于 [Konsole][14]， 因此有着 Konsole 的优秀功能。可以通过 Cool Retro Term 的配置文件菜单来改变它的外观。配置文件包括 Amber、Green、Pixelated、Apple 和 Transparent Green 等等，而且全都包括一个像真的一样的扫描线。并不是全都是有用的，例如 Vintage 配置文件看起来就像一个闪烁着的老旧的球面屏。

Cool Retro Term 的 GitHub 仓库有着详细的安装指南，且 Ubuntu 用户有 [PPA][15]。

### Sakura

你要是想要一个优秀的轻量级、易配置的终端，可以尝试下 [Sakura][16]（图 1）。 它依赖少，不像 GNOME 终端 和 Konsole，在 GNOME 和 KDE 中牵扯了很多组件。其大多数选项是可以通过右键菜单配置的，例如选项卡的标签、 颜色、大小、选项卡的默认数量、字体、铃声，以及光标类型。 你可以在你个人的配置文件 `~/.config/sakura/sakura.conf` 里面设置更多的选项，例如绑定快捷键。

![sakura](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-1_9.png)

*图 1： Sakura 是一个优秀的、轻量级的、可配置的终端。*

命令行选项详见 `man sakura`。可以使用这些来从命令行启动 sakura，或者在你的图形启动器上使用它们。 例如，打开 4 个选项卡并设置窗口标题为 “MyWindowTitle”：

```
$ sakura -t MyWindowTitle -n 4
```

### Terminology

[Terminology][17] 来自 Enlightenment 图形环境的郁葱可爱的世界，它能够被美化成任何你所想要的样子 (图 2)。 它有许多有用的功能：独立的拆分窗口、打开文件和 URL、文件图标、选项卡，林林总总。 它甚至能运行在没有图形界面的 Linux 控制台上。

![Terminology](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-2_6.png)

*图 2: Terminology 也能够运行在没有图形界面的 Linux 控制台上。*

当你打开多个拆分窗口时，每个窗口都能设置不同的背景，并且背景文件可以是任意媒体文件：图像文件、视频或者音乐文件。它带有一堆便于清晰可读的暗色主题和透明主题，它甚至一个 Nyan 猫主题。它没有滚动条，因此需要使用组合键 `Shift+PageUp` 和 `Shift+PageDown` 进行上下导航。

它有多个控件：一个右键单击菜单，上下文对话框，以及命令行选项。右键单击菜单里包含世界上最小的字体，且 Miniview 可显示一个微观的文件树，但我没有找到可以使它们易于辨读的选项。当你打开多个标签时，可以点击小标签浏览器来打开一个可以上下滚动的选择器。任何东西都是可配置的；通过 `man terminology` 可以查看一系列的命令和选项，包括一批不错的快捷键快捷方式。奇怪的是，帮助里面没有包括以下命令，这是我偶然发现的：

*   tyalpha
*   tybg
*   tycat
*   tyls
*   typop
*   tyq

使用 `tybg [filename]` 命令来设置背景，不带参数的 `tybg` 命令来移除背景。 运行 `typop [filename]` 来打开文件。 `tyls` 命令以图标视图列出文件。 加上 `-h` 选项运行这些命令可以了解它们是干什么的。 即使有可读性的怪癖，Terminology 依然是快速、漂亮和实用的。

### Tilda

已经有几个优秀的下拉式终端模拟器，包括 Guake 和 Yakuake。 [Tilda][18] (图 3) 是其中最简单和轻量级的一个。 打开 Tilda 后它会保持打开状态， 你可以通过快捷键来显示和隐藏它。 Tilda 快捷键是默认设置的， 你可以设置自己喜欢的快捷键。 它一直打开着的，随时准备工作，但是直到你需要它的时候才会出现。

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-3_3.png)

*图 3: Tilda 是最简单和轻量级的一个终端模拟器。*

Tilda 选项方面有很好的补充，包括默认的大小、位置、外观、绑定键、搜索条、鼠标动作，以及标签条。 这些都被右键单击菜单控制。

_学习更多关于 Linux 的知识可以通过 Linux 基金会 和 edX 的免费课程 ["Linux 介绍" ][9]。_

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/5-coolest-linux-terminal-emulators

作者：[CARLA SCHRODER][a]
译者：[cnobelw](https://github.com/cnobelw)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.linux.com/licenses/category/used-permission
[2]:https://www.linux.com/licenses/category/used-permission
[3]:https://www.linux.com/licenses/category/used-permission
[4]:https://www.linux.com/licenses/category/used-permission
[5]:https://www.linux.com/files/images/fig-1png-9
[6]:https://www.linux.com/files/images/fig-2png-6
[7]:https://www.linux.com/files/images/fig-3png-3
[8]:https://www.linux.com/files/images/banner2png
[9]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
[10]:http://xiki.org/
[11]:https://www.linux.com/learn/meet-xiki-revolutionary-command-shell-linux-and-mac-os-x
[12]:http://xiki.org/screencasts/
[13]:https://github.com/Swordfish90/cool-retro-term
[14]:https://www.linux.com/learn/expert-tips-and-tricks-kate-and-konsole
[15]:https://launchpad.net/~bugs-launchpad-net-falkensweb/+archive/ubuntu/cool-retro-term
[16]:https://bugs.launchpad.net/sakura
[17]:https://www.enlightenment.org/about-terminology
[18]:https://github.com/lanoxx/tilda
