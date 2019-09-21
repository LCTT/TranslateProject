如何为 Linux 虚拟控制台配置鼠标支持
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/GPM-1-720x340.png)

我使用 Oracle VirtualBox 来测试各种类 Unix 操作系统。我的大多数虚拟机都是<ruby>无头<rt>headless</rt></ruby>服务器，它们没有图形桌面环境。很长一段时间，我一直想知道如何在无头 Linux 服务器的基于文本的终端中使用鼠标。感谢 **GPM**，今天我了解到我们可以在虚拟控制台中使用鼠标进行复制和粘贴操作。 **GPM**，是<ruby>通用鼠标<rt>General Purpose Mouse</rt></ruby>的首字母缩写，它是一个守护程序，可以帮助你配置 Linux 虚拟控制台的鼠标支持。请不要将 GPM 与 **GDM**（<ruby>GNOME 显示管理器<rt>GNOME Display manager</rt></ruby>）混淆。两者有完全不同的用途。

GPM 在以下场景中特别有用：

  * 新的 Linux 服务器安装或默认情况下不能或不使用 X Windows 的系统，如 Arch Linux 和 Gentoo。
  * 在虚拟终端/控制台中使用复制/粘贴操作。
  * 在基于文本的编辑器和浏览器中使用复制/粘贴（例如，emacs、lynx）。
  * 在文本文件管理器中使用复制/粘贴（例如 Ranger、Midnight commander）。

在这个简短的教程中，我们将看到如何在类 Unix 操作系统中在基于文本的终端中使用鼠标。

### 安装 GPM

要在纯文本 Linux 系统中启用鼠标支持，请安装 GPM 包。它在大多数 Linux 发行版的默认仓库中都有。

在 Arch Linux 及其变体如 Antergos、Manjaro Linux 上，运行以下命令来安装 GPM：

```
$ sudo pacman -S gpm
```

在 Debian、Ubuntu、Linux Mint 中：

```
$ sudo apt install gpm
```

在 Fedora 上：

```
$ sudo dnf install gpm
```

在 openSUSE 上：

```
$ sudo zypper install gpm
```

安装后，使用以下命令启用并启动 GPM 服务：

```
$ sudo systemctl enable gpm
$ sudo systemctl start gpm
```

在基于 Debian 的系统中，gpm 服务将在你安装后自动启动，因此你无需如上所示手动启动服务。

### 为 Linux 虚拟控制台配置鼠标支持

无需特殊配置。GPM 将在你安装并启动 gpm 服务后立即开始工作。

在安装 GPM 之前，看下我的 Ubuntu 18.04 LTS 服务器的屏幕截图：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Ubuntu-18.04-CLI.png)

正如你在上面的截图中看到的，我的 Ubuntu 18.04 LTS 无头服务器中没有可见的鼠标指针。只有一个闪烁的光标，它不能让我选择文本，使用鼠标复制/粘贴文本。在仅限 CLI 的 Linux 服务器中，鼠标根本没用。

在安装 GPM 后查看 Ubuntu 18.04 LTS 服务器的以下截图：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/GPM.png)

看见了吗？我现在可以选择文字了。

要选择，复制和粘贴文本，请执行以下操作：

  * 要选择文本，请按下鼠标左键并拖动鼠标。
  * 选择文本后，放开鼠标左键，并按下中键在同一个或另一个控制台中粘贴文本。
  * 右键用于扩展选择，就像在 `xterm` 中。
  * 如果你使用的是双键鼠标，请使用右键粘贴文本。

就这么简单！

就像我已经说过的那样，GPM 工作得很好，并且不需要额外的配置。以下是 GPM 配置文件 `/etc/gpm.conf`（或在某些发行版中是 `/etc/conf.d/gpm`）的示例内容：

```
# protected from evaluation (i.e. by quoting them).
#
# This file is used by /etc/init.d/gpm and can be modified by
# "dpkg-reconfigure gpm" or by hand at your option.
#
device=/dev/input/mice
responsiveness=
repeat_type=none
type=exps2
append=''
sample_rate=
```

在我的例子中，我使用 USB 鼠标。如果你使用的是其他鼠标，则可能需要更改 `device=/dev/input/mice` 和 `type=exps2` 参数的值。

有关更多详细信息，请参阅手册页。

```
$ man gpm
```

就是这些了。希望这个有用。还有更多的好东西。敬请期待！

干杯!

--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-configure-mouse-support-for-linux-virtual-consoles/

作者：[SK][a]  选题：[lujun9972](https://github.com/lujun9972)  译者：[geekpi](https://github.com/geekpi)  校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
