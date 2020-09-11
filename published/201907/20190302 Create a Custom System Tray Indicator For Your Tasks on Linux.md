[#]: collector: (lujun9972)
[#]: translator: (lujun9972)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11061-1.html)
[#]: subject: (Create a Custom System Tray Indicator For Your Tasks on Linux)
[#]: via: (https://fosspost.org/tutorials/custom-system-tray-icon-indicator-linux)
[#]: author: (M.Hanny Sabbagh https://fosspost.org/author/mhsabbagh)

在 Linux 上为你的任务创建一个自定义的系统托盘指示器
======

系统托盘图标如今仍是一个很神奇的功能。只需要右击图标，然后选择想要的动作，你就可以大幅简化你的生活并且减少日常行为中的大量无用的点击。

一说到有用的系统托盘图标，我们很容易就想到 Skype、Dropbox 和 VLC：

![Create a Custom System Tray Indicator For Your Tasks on Linux][1]

然而系统托盘图标实际上要更有用得多；你可以根据自己的需求创建自己的系统托盘图标。本指导将会教你通过简单的几个步骤来实现这一目的。

### 前置条件

我们将要用 Python 来实现一个自定义的系统托盘指示器。Python 可能已经默安装在所有主流的 Linux 发行版中了，因此你只需要确定一下它已经被安装好了（此处使用版本为 2.7）。另外，我们还需要安装好  `gir1.2-appindicator3` 包。该库能够让我们很容易就能创建系统图标指示器。

在 Ubuntu/Mint/Debian 上安装：

```
sudo apt-get install gir1.2-appindicator3
```

在 Fedora 上安装：

```
sudo dnf install libappindicator-gtk3
```

对于其他发行版，只需要搜索包含 “appindicator” 的包就行了。

在 GNOME Shell 3.26 开始，系统托盘图标被删除了。你需要安装 [这个扩展][2]（或者其他扩展）来为桌面启用该功能。否则你无法看到我们创建的指示器。

### 基础代码

下面是该指示器的基础代码：

```
#!/usr/bin/python
import os
from gi.repository import Gtk as gtk, AppIndicator3 as appindicator
def main():
  indicator = appindicator.Indicator.new("customtray", "semi-starred-symbolic", appindicator.IndicatorCategory.APPLICATION_STATUS)
  indicator.set_status(appindicator.IndicatorStatus.ACTIVE)
  indicator.set_menu(menu())
  gtk.main()
def menu():
  menu = gtk.Menu()
  
  command_one = gtk.MenuItem('My Notes')
  command_one.connect('activate', note)
  menu.append(command_one)
  exittray = gtk.MenuItem('Exit Tray')
  exittray.connect('activate', quit)
  menu.append(exittray)
  
  menu.show_all()
  return menu
  
def note(_):
  os.system("gedit $HOME/Documents/notes.txt")
def quit(_):
  gtk.main_quit()
if __name__ == "__main__":
  main()
```

我们待会会解释一下代码是怎么工作的。但是现在，让我们将该文本保存为 `tray.py`，然后使用 Python 运行之：

```
python tray.py
```

我们会看到指示器运行起来了，如下图所示：

![Create a Custom System Tray Indicator For Your Tasks on Linux 13][3]

现在，让我们解释一下这个魔法的原理：

  * 前三行代码仅仅用来指明 Python 的路径并且导入需要的库。
  * `def main()` ：此为指示器的主函数。该函数的代码用来初始化并创建指示器。
  * `indicator = appindicator.Indicator.new("customtray"，"semi-starred-symbolic"，appindicator.IndicatorCategory.APPLICATION_STATUS)` ：这里我们指明创建一个名为 `customtray` 的新指示器。这是指示器的唯一名称，这样系统就不会与其他运行中的指示器搞混了。同时我们使用名为 `semi-starred-symbolic` 的图标作为指示器的默认图标。你可以将之改成任何其他值；比如 `firefox` (如果你希望该指示器使用 FireFox 的图标)，或任何其他你想用的图标名。最后与 `APPLICATION_STATUS` 相关的部分是指明指示器类别/范围的常规代码。
  * `indicator.set_status(appindicator.IndicatorStatus.ACTIVE)`：这一行激活指示器。
  * `indicator.set_menu(menu())`：这里说的是我们想使用 `menu()` 函数（我们会在后面定义) 来为我们的指示器创建菜单项。这很重要，可以让你右击指示器后看到一个可以实施行为的列表。
  * `gtk.main()`：运行 GTK 主循环。
  * 在 `menu()` 中我们定义了想要指示器提供的行为或项目。`command_one = gtk.MenuItem('My Notes')` 仅仅使用文本 “My notes” 来初始化第一个菜单项，接下来 `command_one.connect('activate'，note)` 将菜单的 `activate` 信号与后面定义的 `note()` 函数相连接；换句话说，我们告诉我们的系统：“当该菜单项被点击，运行 `note()` 函数”。最后，`menu.append(command_one)` 将菜单项添加到列表中。
  *  `exittray` 相关的行是为了创建一个退出的菜单项，以便让你在想要的时候关闭指示器。
  * `menu.show_all()` 以及 `return menu` 只是返回菜单项给指示器的常规代码。
  * 在 `note(_)` 下面是点击 “My Notes” 菜单项时需要执行的代码。这里只是 `os.system("gedit $HOME/Documents/notes.txt")` 这一句话；`os.system` 函数允许你在 Python 中运行 shell 命令，因此这里我们写了一行命令来使用 `gedit` 打开家目录下 `Documents` 目录中名为 `notes.txt` 的文件。例如，这个可以称为你今后的日常笔记程序了！

### 添加你所需要的任务

你只需要修改代码中的两块地方：

  1. 在 `menu()` 中为你想要的任务定义新的菜单项。
  2. 创建一个新的函数让给该菜单项被点击时执行特定的行为。

所以，比如说你想要创建一个新菜单项，在点击后，会使用 VLC 播放硬盘中某个特定的视频/音频文件？要做到这一点，只需要在第 17 行处添加下面三行内容：

```
command_two = gtk.MenuItem('Play video/audio')
command_two.connect('activate', play)
menu.append(command_two)
```

然后在第 30 行添加下面内容：

```
def play(_):
  os.system("vlc /home/<username>/Videos/somevideo.mp4")
```

将` `/home/<username>/Videos/somevideo.mp4` 替换成你想要播放的视频/音频文件路径。现在保存该文件然后再次运行该指示器：

```
python tray.py
```

你将会看到：

![Create a Custom System Tray Indicator For Your Tasks on Linux 15][4]

而且当你点击新创建的菜单项时，VLC 会开始播放！

要创建其他项目/任务，只需要重复上面步骤即可。但是要小心，需要用其他命令来替换 `command_two`，比如 `command_three`，这样在变量之间才不会产生冲突。然后定义新函数，就像 `play(_)` 函数那样。

可能性是无穷的；比如我用这种方法来从网上获取数据（使用 urllib2 库）并显示出来。我也用它来在后台使用 `mpg123` 命令播放 mp3 文件，而且我还定义了另一个菜单项来 `killall mpg123` 以随时停止播放音频。比如 Steam 上的 CS:GO 退出很费时间（窗口并不会自动关闭），因此，作为一个变通的方法，我只是最小化窗口然后点击某个自建的菜单项，它会执行 `killall -9 csgo_linux64` 命令。

你可以使用这个指示器来做任何事情：升级系统包、运行其他脚本——字面上的任何事情。

### 自动启动

我们希望系统托盘指示器能在系统启动后自动启动，而不用每次都手工运行。要做到这一点，只需要在自启动应用程序中添加下面命令即可（但是你需要将 `tray.py` 的路径替换成你自己的路径）:

```
nohup python /home/<username>/tray.py &
```

下次重启系统，指示器会在系统启动后自动开始工作了！

### 结论

你现在知道了如何为你想要的任务创建自己的系统托盘指示器了。根据每天需要运行的任务的性质和数量，此方法可以节省大量时间。有些人偏爱从命令行创建别名，但是这需要你每次都打开终端窗口或者需要有一个可用的下拉式终端仿真器，而这里，这个系统托盘指示器一直在工作，随时可用。

你以前用过这个方法来运行你的任务吗？很想听听你的想法。


--------------------------------------------------------------------------------

via: https://fosspost.org/tutorials/custom-system-tray-icon-indicator-linux

作者：[M.Hanny Sabbagh][a]
选题：[lujun9972][b]
译者：[lujun9972](https://github.com/lujun9972)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fosspost.org/author/mhsabbagh
[b]: https://github.com/lujun9972
[1]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/02/Screenshot-at-2019-02-28-0808.png?resize=407%2C345&ssl=1 (Create a Custom System Tray Indicator For Your Tasks on Linux 12)
[2]: https://extensions.gnome.org/extension/1031/topicons/
[3]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/03/Screenshot-at-2019-03-02-1041.png?resize=434%2C140&ssl=1 (Create a Custom System Tray Indicator For Your Tasks on Linux 14)
[4]: https://i2.wp.com/fosspost.org/wp-content/uploads/2019/03/Screenshot-at-2019-03-02-1141.png?resize=440%2C149&ssl=1 (Create a Custom System Tray Indicator For Your Tasks on Linux 16)
