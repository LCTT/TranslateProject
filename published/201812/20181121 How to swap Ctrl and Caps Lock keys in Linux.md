在 Linux 下交换 Ctrl 与大写锁定键
======

> Linux 桌面环境使你可以根据需要轻松设置键盘。下面来演示如何去做。

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/keyboard_numbers_letters_type_game.jpg?itok=fLlWGw1K)

对于许多使用计算机很多年的用户来说，自从第一批 PC 键盘从生产线上下线后不久，Ctrl 和大写锁定键就已经在错误的位置上了。对我来说，这张 1995 年 Sun 工作站的老式键盘照片上的两个键的位置才是正确的。（原谅我放了一张模糊的图片，它是在昏暗的光线下使用 Minox 间谍相机拍摄的。）

![](https://opensource.com/sites/default/files/uploads/keyboard.jpg)

感兴趣的话，可以读一下维基百科上对于 [Ctrl 键位置的历史][1] 的介绍。我不打算讨论将 Ctrl 键放在“a”旁边而不是 Shift 键下方的各种理由，也不评论大写锁定键的无用性，也没有打算与那些主张使用手掌根来触发 Ctrl 键的人争论，即使在一些笔记本电脑键盘上不可能这样做到，因为有的键会位于腕托以下。

相反，我将假设我不是唯一喜欢把 Ctrl 键放在“a”旁边的人，并说明如何使用 Linux 自带的灵活性在各种桌面环境中交换 Ctrl 和大写锁定键的位置。请注意，下面的演示可能只有有限的有效期，因为调整桌面设置的方法经常发生变化，但我希望这为你开了一个好头。

### GNOME 3

[GNOME 3][2] 桌面环境用户可以使用 [Tweaks][3] 工具交换大写锁定和 Ctrl 键，如下所示。

![](https://opensource.com/sites/default/files/uploads/tweaks-tool.png)

具体步骤如下：

  1. 从你的 Linux 发行版的软件仓库安装 Tweaks 工具。
  2. 启动 Tweaks 程序。
  3. 从左侧菜单中选择 “Keyboard & Mouse”。
  4. 单击 “Additional Layout Options”。
  5. 在打开的窗口中单击 “Ctrl position”，然后选择 “Swap Ctrl and Caps Lock”。

完成！顺便说一句，你可以使用 Tweaks 工具做很多很酷的事情。例如，我将我的右 Ctrl 键设置为 Compose 键，这让我可以使用键盘快捷键打出各种字符，例如通过 `Compose+c+,`、`Compose+e+'`、`Compose+o+^` 以及 `Compose+n+~` 分别键入 ç、é、ô 和 ñ。（LCTT 译注：可参考 [Special characters listed by extended compose sequence](https://www.ibm.com/support/knowledgecenter/en/SSKTWP_9.0.0/com.ibm.notes900.help.doc/acc_spec_characters_r.html)）

### KDE

我不使用 [KDE][4]，但我的同事 Seth Kenlon 写的 [将改变你的生命的 KDE tweaks][5] 这篇文章的第 5 项演示了如何重新映射按键。

### Xfce

据我所知，[Xfce][6] 桌面环境没有一个方便的工具来管理这些（指交换按键）设置。 但是，`setxkbmap` 命令的 `ctrl:swapcaps` 选项可以帮助你完成交换按键的修改。这个修改包含两部分：

  1. 弄清楚命令的用法；
  2. 找出调用命令的位置，以便在桌面启动时激活它。

第一部分非常简单，命令是：

```
/usr/bin/setxkbmap -option "ctrl:nocaps"
```

在终端窗口中执行此命令，以确保结果符合你的预期。

假设上述命令有效，应该在哪里调用此命令呢？这需要一些实验。一种可能是在用户主目录的 `.profile` 文件中；另一个可能是将命令添加到 Xfce 的自启动配置（在设置管理器中查找 “Session and Startup”）里。

还有一种可能性是在文件 `/etc/default/keyboard` 中使用相同的选项，最终可能看起来像这样：

```
# KEYBOARD CONFIGURATION FILE

# Consult the keyboard(5) manual page.

XKBMODEL="pc105"
XKBLAYOUT="us"
XKBVARIANT=""
XKBOPTIONS="ctrl:swapcaps"

BACKSPACE="guess"
```

注意，这个更改将影响所有用户，因此如果你和其他人共享计算机，请准备好进行一些说明。此外，系统更新可能会覆盖此文件，因此如果你的设置失效了，就需要再次编辑它。将相同的信息放在用户主目录中的 `.keyboard` 文件内，可以为每个用户进行设置。

最后请注意，这些更改需要重新启动 Xfce（除非在终端窗口中的命令行上运行，但这在会话结束之后便会失效）。

### LXQt 和其他桌面环境

我没有用过 [LXQt][7]，但根据我使用 [LXDE][8] 的经验，我会尝试上面用于 Xfce 的方法。我也希望适用于 Xfce 的方法可以用于其他 Linux 桌面环境。当然了，在其他桌面环境上遇到问题的时候，可以通过你最喜欢的搜索引擎来查找解决办法。

### 控制台

我没有在控制台上进行过尝试，因为我很少有机会与控制台（你在服务器上看到的或你的窗口系统没有正确显示时出现的界面）进行交互。上面给出的方法以人们希望的方式（即与其他应用程序一致）调整终端窗口。

但是，如果像上面一样已经编辑了 `/etc/default/keyboard` 文件或 `〜/.keyboard`，则实用程序 `setupcon` 可以用于更改控制台的键盘设置，以便实现相同的功能。[链接 1][9]、[链接 2][10] 和 [链接 3][11] 给出了一些关于如何从这两个文件实现这些更改的想法。第三个链接还讨论了使用 `dumpkeys` 和 `loadkeys` 来实现想要的效果。[setupcon 的手册][12] 简短而重要，值得阅读，再结合上面 StackExchange 问题的一些评论，应该足以得到一个解决办法。

### 其他环境

最后，上面 StackExchange 的链接中提到的这一点值得强调 —— 配置控制台与配置终端窗口不同；如前所述，后者是通过桌面管理器进行配置的。

`setxkbmap`、`xkeyboard-config`、`keyboard`、`console-setup` 和 `setupcon` 命令的手册都是有用的参考资料。或者，如果你不喜欢阅读手册，可以看一下 [这篇极好的文章][13]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/11/how-swap-ctrl-and-caps-lock-your-keyboard

作者：[Chris Hermansen][a]
选题：[lujun9972][b]
译者：[jlztan](https://github.com/jlztan)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/clhermansen
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Control_key
[2]: https://www.gnome.org/gnome-3/
[3]: https://wiki.gnome.org/Apps/Tweaks
[4]: https://www.kde.org/
[5]: https://opensource.com/article/17/5/7-cool-kde-tweaks-will-improve-your-life
[6]: https://www.xfce.org/
[7]: https://lxqt.org/
[8]: https://lxde.org/
[9]: https://askubuntu.com/questions/485454/how-to-remap-keys-on-a-user-level-both-with-and-without-x
[10]: https://unix.stackexchange.com/questions/198791/how-do-i-permanently-change-the-console-tty-font-type-so-it-holds-after-reboot
[11]: https://superuser.com/questions/290115/how-to-change-console-keymap-in-linux
[12]: http://man.he.net/man1/setupcon
[13]: http://www.noah.org/wiki/CapsLock_Remap_Howto
