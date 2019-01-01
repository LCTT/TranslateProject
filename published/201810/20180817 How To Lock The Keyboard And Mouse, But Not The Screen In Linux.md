如何在 Linux 下锁住键盘和鼠标而不锁屏
======

![](https://www.ostechnix.com/wp-content/uploads/2017/09/Lock-The-Keyboard-And-Mouse-720x340.jpg)

我四岁的侄女是个好奇的孩子，她非常喜爱“阿凡达”电影，当阿凡达电影在播放时，她是如此的专注，好似眼睛粘在了屏幕上。但问题是当她观看电影时，她经常会碰到键盘上的某个键或者移动了鼠标，又或者是点击了鼠标的按钮。有时她非常意外地按了键盘上的某个键，从而将电影关闭或者暂停了。所以我就想找个方法来将键盘和鼠标都锁住，但屏幕不会被锁住。幸运的是，我在 Ubuntu 论坛上找到了一个完美的解决方法。假如在你正看着屏幕上的某些重要的事情时，你不想让你的小猫或者小狗在你的键盘上行走，或者让你的孩子在键盘上瞎搞一气，那我建议你试试 **xtrlock** 这个工具。它很简单但非常实用，你可以锁定屏幕的显示直到用户在键盘上输入自己设定的密码（LCTT 译注：就是用户自己的密码，例如用来打开屏保的那个密码，不需要单独设定）。在这篇简单的教程中，我将为你展示如何在 Linux 下锁住键盘和鼠标，而不锁掉屏幕。这个技巧几乎可以在所有的 Linux 操作系统中生效。

### 安装 xtrlock

xtrlock 软件包在大多数 Linux 操作系统的默认软件仓库中都可以获取到。所以你可以使用你安装的发行版的包管理器来安装它。

在 **Arch Linux** 及其衍生发行版中，运行下面的命令来安装它：

```
$ sudo pacman -S xtrlock
```

在 **Fedora** 上使用：

```
$ sudo dnf install xtrlock
```

在 **RHEL、CentOS** 上使用：

```
$ sudo yum install xtrlock
```

在 **SUSE/openSUSE** 上使用：

```
$ sudo zypper install xtrlock
```

在 **Debian、Ubuntu、Linux Mint** 上使用：

```
$ sudo apt-get install xtrlock
```

### 使用 xtrlock 锁住键盘和鼠标但不锁屏

安装好 xtrlock 后，你需要根据你的选择来创建一个快捷键，通过这个快捷键来锁住键盘和鼠标。

（LCTT 译注：译者在自己的系统（Arch + Deepin）中发现这里的到下面创建快捷键的部分可以不必做，依然生效。）

在 `/usr/local/bin` 目录下创建一个名为 `lockkbmouse` 的新文件： 

```
$ sudo vi /usr/local/bin/lockkbmouse
```

然后将下面的命令添加到这个文件中：

```
#!/bin/bash
sleep 1 && xtrlock
```

保存并关闭这个文件。

然后使用下面的命令来使得它可以被执行：

```
$ sudo chmod a+x /usr/local/bin/lockkbmouse
```

接着，我们就需要创建快捷键了。

#### 创建快捷键

**在 Arch Linux MATE 桌面中**

依次点击 “System -> Preferences -> Hardware -> keyboard Shortcuts”

然后点击 “Add” 来创建快捷键。

![][2]

首先键入你的这个快捷键的名称，然后将下面的命令填入命令框中，最后点击 “Apply” 按钮。

```
bash -c "sleep 1 && xtrlock"
```

![][3]

为了能够给这个快捷键赋予快捷方式，需要选中它或者双击它然后输入你选定的快捷键组合，例如我使用 `Alt+k` 这组快捷键。

![][4]

如果要清除这个快捷键组合，按住 `BACKSPACE` 键就可以了。完成后，关闭键盘设定窗口。

**在 Ubuntu GNOME 桌面中**

依次进入 “System Settings -> Devices -> Keyboard”，然后点击 “+” 这个符号。

键入你快捷键的名称并将下面的命令加到命令框里面，然后点击 “Add” 按钮。

```
bash -c "sleep 1 && xtrlock"
```

![][5]

接下来为这个新建的快捷键赋予快捷方式。我们只需要选择或者双击 “Set shortcut” 这个按钮就可以了。

![][6]

然后你将看到下面的一屏。

![][7]

输入你选定的快捷键组合，例如我使用 `Alt+k`。

![][8]

如果要清除这个快捷键组合，则可以按 `BACKSPACE` 这个键。这样快捷键便设定好了，完成这个后，关闭键盘设定窗口。

从现在起，每当你输入刚才设定的快捷键（在我们的示例中是 `ATL+K`），鼠标的指针便会变成一个挂锁的模样。现在，键盘和鼠标便被锁定了，这时你便可以自在地观看你的电影或者做其他你想做的事儿。即便是你的孩子或者宠物碰了键盘上的某些键或者点击了鼠标，这些操作都不会起作用。

因为 `xtrlock` 已经在工作了。

![][9]

你看到了那个小的锁按钮了吗？它意味着键盘和鼠标已经被锁定了。即便你移动这个锁按钮，也不会发生任何事情。后台的任务在一直执行，直到你将屏幕解除，然后手动停掉运行中的任务。

### 将键盘和鼠标解锁

要将键盘和鼠标解锁，只需要输入你的密码然后敲击回车键就可以了，在输入的过程中你将看不到密码。只需要输入然后敲回车键就可以了。在你输入了正确的密码后，鼠标和键盘就可以再工作了。假如你输入了一个错误的密码，你将听到警告声。按 `ESC` 来清除输入的错误密码，然后重新输入正确的密码。要去掉未完全输入完的密码中的一个字符，只需要按 `BACKSPACE` 或者 `DELETE` 键就可以了。

### 要是我被永久地锁住了怎么办？

以防你被永久地锁定了屏幕，切换至一个 TTY（例如 `CTRL+ALT+F2`）然后运行：

```
$ sudo killall xtrlock
```

或者你还可以使用 `chvt` 命令来在 TTY 和 X 会话之间切换。

例如，如果要切换到 TTY1，则运行：

```
$ sudo chvt 1
```

要切换回 X 会话，则键入：

```
$ sudo chvt 7
```

不同的发行版使用了不同的快捷键组合来在不同的 TTY 间切换。请参考你安装的对应发行版的官方网站了解更多详情。

如果想知道更多 xtrlock 的信息，请参考 man 页：

```
$ man xtrlock
```

那么这就是全部了。希望这个指南可以帮到你。假如你发现这个指南很有用，请花点时间将这个指南共享到你的朋友圈并支持我们（OSTechNix）。

**资源：**

* [**Ubuntu 论坛**][10]

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/lock-keyboard-mouse-not-screen-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[FSSlc](https://github.com/FSSlc)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[2]:http://www.ostechnix.com/wp-content/uploads/2017/09/Keyboard-Shortcuts_001.png
[3]:http://www.ostechnix.com/wp-content/uploads/2017/09/Keyboard-Shortcuts_002.png
[4]:http://www.ostechnix.com/wp-content/uploads/2017/09/Keyboard-Shortcuts_003.png
[5]:http://www.ostechnix.com/wp-content/uploads/2018/01/Add-xtrlock-shortcut.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/01/set-shortcut-key-1.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/01/set-shortcut-key-2.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/01/set-shortcut-key-3.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/01/xtrclock-1.png
[10]:https://ubuntuforums.org/showthread.php?t=993800
