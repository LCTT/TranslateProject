[#]: subject: "Use secret keyboard keys on Linux"
[#]: via: "https://opensource.com/article/22/7/linux-compose-key-cheat-sheet"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lkxed"
[#]: translator: "Donkey-Hao"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14882-1.html"

在 Linux 中使用组合键输入隐藏的字形
======

> 使用组合键，你不会被键盘所限制住。

![](https://img.linux.net.cn/data/attachment/album/202207/31/095532p72762ekberw7eb6.jpg)

典型的键盘只有约 100 个键位。

由于 `Shift` 键，许多键得以有两个字符（也称之为 <ruby>字形<rt>glyph</rt></ruby>）。字形常用于键入带有重音和变音符号的字母，生成数学公式或者货币中的符号，或者添加有趣的表情符号。在一些地区，有些键甚至有三个字形。

然而，不论你身处何处，有一些字形不会出现在你的键盘上。幸运的是，Linux 提供了使用 <ruby>组合键<rt>Compose Key</rt></ruby> 来获取这些字形。

在你的键盘上没有组合键这个键，至少默认情况下没有，但是你可以设定一个你不用的键作为组合键。我在电脑上使用空格键旁边的 `Alt` 键，而在平板上使用菜单键，来作为组合键。

> **[下载 Linux 组合键速查表][2]**

### 在 GNOME 中设置组合键

![A screenshot shows the keyboard and mouse options visible. The "Compose Key" option is set to Right Alt.][3]

在 GNOME 桌面，从软件库中安装 <ruby>优化<rt>Tweaks</rt></ruby> 应用。你也可以从终端安装（基于 Debian 发行版用 `apt` 命令，Fedora 用 `dnf`）：

```
$ sudo dnf install gnome-tweaks
```

启动优化应用后：

1. 单击左侧栏中的 <ruby>键盘和鼠标<rt>Keyboard & Mouse</rt></ruby >类别
2. 找到 <ruby>组合键<rt>Compose key</rt></ruby> 设置并指定一个键
3. 关闭优化应用

### 在 KDE Plasma 桌面设置组合键

![A screenshot shows the advanced options threaded under Keyboard settings. "Configure keyboard options" is checked, "Position of Compose Key" is checked within that menu, and "Right Alt" is checked within that menu.][4]

在 KDE Plasma 桌面上，打开 <ruby>系统设置<rt>System Settings</rt></ruby>，找到 <ruby>输入设备<rt>Input Devices</rt></ruby> 控制界面。然后：

1. 在 <ruby>输入设备<rt>Input Devices</rt></ruby> 界面，点击 “<ruby>高级<rt>Advanced</rt></ruby>” 标签
2. 找到 <ruby>组合键<rt>Compose key</rt></ruby> 列表项并指定一个键
3. 点击右下角 “<ruby>应用<rt>Apply</rt></ruby>” 按钮，然后关闭 <ruby>系统设置<rt>System Settings</rt></ruby>

### 使用组合序列

为了输入隐藏字符，需要按下组合键后松开。这样就可以进入组合模式。处于组合模式，你按下然后松开键，然后再按下一个键来组合字符。

例如：

1. 按下组合键并释放，你会进入组合模式
2. 按下单引号（`'`）并松开
3. 按下 `E` 并松开，这是一个有效的组合，所以现在退出了组合模式

你输入了一个字符：`É`！

一些组合序列只需要两个键的组合，然而还有一些需要三个键，并且至少有一个特殊字符要按四次键。

### 变音字符

这是一个很小众的世界，所以你的朋友的名字很有可能使用的字形不是你的键盘原生的字形。你现在可以跳过变音符号并使用适当的修饰符输入名字。

以下是常见变音符号的组合序列示例：

* `' + <字母>` = `á é í ó ú ć ń ý j́́ ẃ ź`
* "\` + <字母>" = `à è ì ò ù ǹ ỳ ẁ`
* `~ + <字母>` = `ã ẽ ĩ õ ũ ñ ỹ`
* `^ + <字母>` = `â ê î ô û ĉ ŷ ĵ ŵ ẑ`
* `u + <字母>` = `ă ĕ ĭ ŏ ŭ`
* `c + c` = `č`
* `- + <字母>` = `ā ē ī ō ū đ`
* `, + <字母>` = `ą ę į ǫ ų ç ḑ ţ`

这里仅仅罗列了常见的几个，并不是所有的组合。

#### 货币符号

得益于组合键，国际银行业务也变得容易：

* `- + Y` = `¥`
* `- + L` = `£`
* `= + E` = `€`
* `= + L` = `₤`
* `= + N` = `₦`
* `= + R` = `₹`
* `= + W` = `₩`
* `/ + m` = `₥`
* `R + s` = `₨`
* `C + r` = `₢`
* `F + r` = `₣`

重申，这不是完整的列表，但是一个好的开始。

#### 有趣的字形

变音符号和货币符号具有实用性，但是组合键也可以用来娱乐：

* `< + 3` = `♥`
* `< + >` = `⋄`
* `# + q` = `♩`
* `: + )` = `☺`
* `: + (` = `☹`
* `p + o + o` = `💩`

#### 长寿和繁荣

在 Linux 中我最喜欢的“秘密”字形是传统的 Vulcan 称呼，“长寿和繁荣”。

* `L + L + A + P` = `🖖`

### 找到所有的字形

通过组合键可以使用更多字形，你可以通过按随机组合序列来发现新的字形。查找字形的一种更有条理的方法是参考位于 `/usr/share/X11/locale/en_US.UTF-8` 中的 `Compose` 文件（需要根据你键盘使用的语言环境调整绝对路径）。

这个文件令人崩溃，因为它包含超过 6000 行的组合序列，其中许多是 ASCII 和 Unicode 的复杂组合。要快速轻松地参考常见和基础序列，你可以 [下载我们的组合键速查表][5]。它提供涵盖数学、排版、音乐、箭头、变音符号、货币等的序列。

现在你知道了这个秘密，你可以表达更多内容了。

*（图片源自：Seth Kenlon, CC BY-SA 4.0）*

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/7/linux-compose-key-cheat-sheet

作者：[Seth Kenlon][a]
选题：[lkxed][b]
译者：[Donkey](https://github.com/Donkey-Hao)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/linux_keyboard_desktop.png
[2]: https://opensource.com/downloads/linux-compose-key-cheat-sheet
[3]: https://opensource.com/sites/default/files/2022-04/gnome-tweaks-compose.jpeg
[4]: https://opensource.com/sites/default/files/2022-04/kde-settings-input-advanced-compose.jpeg
[5]: https://opensource.com/downloads/linux-compose-key-cheat-sheet
