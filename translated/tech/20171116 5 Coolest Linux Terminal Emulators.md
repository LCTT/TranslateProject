# 5 款最酷的linux终端模拟器
============================================================


![Cool retro term](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/banner2.png)
Carla Schroder 看着那些她喜欢的终端模拟器， 包括展示在这儿的 Cool Retro Term。[许可才能使用][4]

当然， 我们可以使用老旧的 GNOME 终端， Konsole， 和有趣的、虚弱的、老旧的 xterm。 然而， 当你带着尝试某种新东西的心境， 回过头来看看这 5 款酷炫并且实用的 Linux 终端。

### Xiki

首先我要推荐的第一个终端是 [Xiki][10]。 Xiki 是 Craig Muth 的智慧结晶, 他是一个有才的程序员和有趣的人 （幽默， 可能还有其他意义）。 很久以前我写了 Xiki，  在 [遇见 Xiki，  Linux 和 Mac OS X 下革命性的命令行Shell][11]。 Xiki 不仅仅是另一款终端模拟器; 它是一个扩展命令行范围、加快命令行速度的交互式环境。


Xiki 支持鼠标，并且能运行在绝大多数命令行Shell上。 它有大量的屏显帮助，而且使用鼠标和键盘能快速导航。 它在速度体现上的一个简单的例子就是增强了 `ls` 命令。 Xiki 在文件系统上可以实现多级缩放， 而不用持续的重复输入 `ls` 或者 `cd`， 或者使用巧妙的正则表达式。

Xiki 集成了许多文本编辑器， 提供了一个永久的便签， 有一个快速搜索引擎， 同时像他们所说的, 也有许许多多。 Xiki 是如此的有特色、如此的不同，  最快的方式来学习和了解它可以看 [Craig 的有趣和实用的视频][12]。

### Cool Retro Term

我推荐 [Cool Retro Term][13] （上面主页上的显示） 主要因为它的外观，以及它的实用性。 它将我们带回了阴极射线管显示器的时代， 这不是很久以前， 而我并没有怀旧， 因我的冷屏死亡而撬液晶显示屏， 它基于 [Konsole][14]， 因此有着 Konsole 的优秀功能。通过 Cool Retro Term 的配置文件菜单来改变它的外观。配置文件包括 Amber, Green, Pixelated, Apple ][, 和 Transparent Green, 以及一个现实的扫描线。它们中并不是所有的都是有用的， 例如 Vintage 配置文件就像一个现实的濒死的屏幕那样弯曲和闪烁。

Cool Retro Term 的 GitHub repository 有着详细的安装指南， 且 Ubuntu 用户有 [PPA][15]。

### Sakura

当你想要一个优秀的轻量级、易配置的终端， 尝试 [Sakura][16] （图 1）。 它依赖少， 不像 GNOME 终端 和 Konsole， 它们在 GNOME 和 KDE 中占大块。大多数选项是可以通过右键菜单配置的， 例如选项卡的标签， 颜色， 大小， 选项卡的字体、 铃声， 以及光标类型的默认值。 你可以设置更多的选项， 例如绑定快捷键， 在你个人的配置文件里面， `~/.config/sakura/sakura.conf`。

![sakura](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-1_9.png)
图 1： Sakura 是一个优秀的、轻量级的、可配置的终端。[许可才能使用][1]

命令行选项详见 `man sakura`。 使用这些来从命令行启动 sakura， 或者在你的图形启动器上使用它们。 例如， 打开 4 个选项卡并设置窗口标题为 MyWindowTitle ：

```
$ sakura -t MyWindowTitle -n 4
```

### Terminology

[Terminology][17] 来自 Enlightenment 图形环境的郁葱可爱的世界，它能够被美化成任何你所想要的 (图 2)。 它有许多有用的功能： 独立的拆分窗口， 打开文件和 URLs， 文件图标， 选项卡， 并采取了更多其他功能。 它甚至能运行在没有图形界面的 Linux 控制台上。


![Terminology](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-2_6.png)
图 2: Terminology 也能够运行在没有图形界面的 Linux 控制台上。[许可才能使用][2]

当你打开多个拆分窗口时，每个窗口都能设置不同的背景， 并且背景文件可以是任意媒体文件： 图像文件， 视频或者音乐文件。 它带有一堆黑色主题和透明度， 有的人需要可读的， 甚至一个 Nyan 猫主题。 没有滚动条， 因此需要使用组合键 Shift+PageUp 和 Shift+PageDown 进行上下导航。

他有多个控件： 一个右键单击菜单， 上下文对话框， 以及命令行选项。 右键单击菜单里包含最小字体， 且 Miniview 可显示一个微观的文件树。 如果有选项能使我找不到的东西可读， 当你打开多个标签时， 点击小标签浏览器来打开一个可以上下滚动的选择器。 任何东西都是可配置的; 通过 `man terminology` 查看一系列的命令和选项， 包括一批不错的快捷键快捷方式。 奇怪的是， 这不包括我偶然发现的以下命令：

*   tyalpha

*   tybg

*   tycat

*   tyls

*   typop

*   tyq

使用 `tybg [filename]` 命令来设置背景， 不带参数的 `tybg` 命令来移除背景。 运行 `typop [filename]` 来打开文件。 `tyls` 命令在图标视图中列出文件。 运行这些命令，加上 `-h` 选项来了解他们是干什么的。 即使有可读性的怪癖， Terminology 是快速、漂亮和实用的。

### Tilda

有几个优秀的下拉式终端模拟器， 包括 Guake 和 Yakuake。 [Tilda][18] (图 3) 是其中最简单和轻量级的一个。 打开 Tilda 后它保持打开， 你可以通过快捷键来显示和隐藏它。 Tilda 快捷键是o默认的， 你可以设置自己喜欢的快捷键。 它一直打开着的，随时准备工作， 但是直到你需要它的时候才会出现。


![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/fig-3_3.png)
图 3: Tilda 是最简单和轻量级的一个终端模拟器。[许可才能使用][3]

Tilda 有一个漂亮的选项组件， 包括默认的大小、位置、外观、绑定键、搜索条、鼠标图标， 以及标签条。 这些都被右键单击菜单控制。
 _学习更多关于 Linux 的知识可以通过 Linux 基金会 和 edX 的免费课程 ["Linux 介绍" ][9]。_

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2017/11/5-coolest-linux-terminal-emulators

作者：[CARLA SCHRODER ][a]
译者：[译者ID](https://github.com/cnobelw)
校对：[校对者ID](https://github.com/校对者ID)

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
