[#]: collector: (lujun9972)
[#]: translator: (amwps290)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11434-1.html)
[#]: subject: (Mirror your Android screen on your computer with Guiscrcpy)
[#]: via: (https://opensource.com/article/19/9/mirror-android-screen-guiscrcpy)
[#]: author: (Seth Kenlon https://opensource.com/users/seth)

使用 guiscrcpy 将你的安卓手机的屏幕投射到你的电脑
======

> 使用这个基于 scrcpy 的开源应用从你的电脑上访问你的安卓设备。

![](https://img.linux.net.cn/data/attachment/album/201910/08/123143nlz718152v5nf5n8.png)

在未来，你所需的一切信息皆触手可及，并且全部会以全息的形式出现在空中，即使你在驾驶汽车时也可以与之交互。不过，那是未来，在那一刻到来之前，我们所有人都只能将信息分散在笔记本电脑、手机、平板电脑和智能冰箱上。不幸的是，这意味着当我们需要来自该设备的信息时，我们通常必须查看该设备。

虽然不完全是像全息终端或飞行汽车那样酷炫，但 [srevin saju][3] 开发的 [guiscrcpy][2] 是一个可以在一个地方整合多个屏幕，让你有一点未来感觉的应用程序。

Guiscrcpy 是一个基于屡获殊荣的一个开源引擎 [scrcpy][4] 的一个开源项目（GUN GPLv3 许可证）。使用 Guiscrcpy 可以将你的安卓手机的屏幕投射到你的电脑，这样你就可以查看手机上的一切东西。Guiscrcpy 支持 Linux、Windows 和 MacOS。

不像其他 scrcpy 的替代软件一样，Guiscrcpy 并不仅仅是 scrcpy 的一个简单的复制品。该项目优先考虑了与其他开源项目的协作。因此，Guiscrcpy 对 scrcpy 来说是一个扩展，或者说是一个用户界面层。将 Python 3 GUI 与 scrcpy 分开可以确保没有任何东西干扰 scrcpy 后端的效率。你可以投射到 1080P 分辨率的屏幕，因为它的超快的渲染速度和超低的 CPU 使用，即使在低端的电脑上也可以运行的很顺畅。

Scrcpy 是 Guiscrcpy 项目的基石。它是一个基于命令行的应用，因此它没有处理你的手势操作的用户界面。它也没有提供返回按钮和主页按钮，而且它需要你对 [Linux 终端][5]比较熟悉。Guiscrcpy 给 scrcpy 添加了图形面板。因此，任何用户都可以使用它，而且不需要通过网络发送任何信息就可以投射和控制他的设备。Guiscrcpy 同时也为 Windows 用户和 Linux 用户提供了编译好的二进制文件，以方便你的使用。

### 安装 Guiscrcpy

在你安装 Guiscrcpy 之前，你需要先安装它的依赖包。尤其是要安装 scrcpy。安装 scrcpy 最简单的方式可能就是使用对于大部分 Linux 发行版都安装了的 [snap][6] 工具。如果你的电脑上安装并使用了 snap，那么你就可以使用下面的命令来一步安装 scrcpy。

```
$ sudo snap install scrcpy
```

当你安装完 scrcpy，你就可以安装其他的依赖包了。[Simple DirectMedia Layer][7]（SDL 2.0） 是一个显示和控制你设备屏幕的工具包。[Android Debug Bridge][8] (ADB) 命令可以连接你的安卓手机到电脑。

在 Fedora 或者 CentOS：

```
$ sudo dnf install SDL2 android-tools
```

在 Ubuntu 或者 Debian：

```
$ sudo apt install SDL2 android-tools-adb
```

在另一个终端中，安装 Python 依赖项：

```
$ python3 -m pip install -r requirements.txt --user
```

### 设置你的手机

为了能够让你的手机接受 adb 连接。必须让你的手机开启开发者选项。为了打开开发者选项，打开“设置”，然后选择“关于手机”，找到“版本号”（它也可能位于“软件信息”面板中）。不敢置信，只要你连续点击“版本号”七次，你就可以打开开发者选项。（LCTT 译注：显然这里是以 Google 原生的 Android 作为说明的，你的不同品牌的安卓手机打开开发者选项的方式或有不同。）

![Enabling Developer Mode][9]

更多更全面的连接手机的方式，请参考[安卓开发者文档][10]。

一旦你设置好了你的手机，将你的手机通过 USB 线插入到你的电脑中（或者通过无线的方式进行连接，确保你已经配置好了无线连接）。

### 使用 Guiscrcpy

当你启动 guiscrcpy 的时候，你就能看到一个主控制窗口。点击窗口里的 “Start scrcpy” 按钮。只要你设置好了开发者模式并且通过 USB 或者 WiFi 将你的手机连接到电脑。guiscrcpy 就会连接你的手机。

![Guiscrcpy main screen][11]

它还包括一个可写入的配置系统，你可以将你的配置文件写入到 `~/.config` 目录。可以在使用前保存你的首选项。

guiscrcpy 底部的面板是一个浮动的窗口，可以帮助你执行一些基本的控制动作。它包括了主页按钮、返回按钮、电源按钮以及一些其他的按键。这些按键在安卓手机上都非常常用。值得注意的是，这个模块并不是与 scrcpy 的 SDL 进行交互。因此，它可以毫无延迟的执行。换句话说，这个操作窗口是直接通过 adb 与你的手机进行交互而不是通过 scrcpy。

![guiscrcpy's bottom panel][12]

这个项目目前十分活跃，不断地有新的特性加入其中。最新版本的具有了手势操作和通知界面。

有了这个 guiscrcpy，你不仅仅可以在你的电脑屏幕上看到你的手机，你还可以就像操作你的实体手机一样点击 SDL 窗口，或者使用浮动窗口上的按钮与之进行交互。

![guiscrcpy running on Fedora 30][13]

Guiscrcpy 是一个有趣且实用的应用程序，它提供的功能应该是任何现代设备（尤其是 Android 之类的平台）的正式功能。自己尝试一下，为当今的数字生活增添一些未来主义的感觉。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/9/mirror-android-screen-guiscrcpy

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[amwps290](https://github.com/amwps290)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/code_computer_laptop_hack_work.png?itok=aSpcWkcl (Coding on a computer)
[2]: https://github.com/srevinsaju/guiscrcpy
[3]: http://opensource.com/users/srevinsaju
[4]: https://github.com/Genymobile/scrcpy
[5]: https://www.redhat.com/sysadmin/navigating-filesystem-linux-terminal
[6]: https://snapcraft.io/
[7]: https://www.libsdl.org/
[8]: https://developer.android.com/studio/command-line/adb
[9]: https://opensource.com/sites/default/files/uploads/developer-mode.jpg (Enabling Developer Mode)
[10]: https://developer.android.com/studio/debug/dev-options
[11]: https://opensource.com/sites/default/files/uploads/guiscrcpy-main.png (Guiscrcpy main screen)
[12]: https://opensource.com/sites/default/files/uploads/guiscrcpy-bottompanel.png (guiscrcpy's bottom panel)
[13]: https://opensource.com/sites/default/files/uploads/guiscrcpy-screenshot.jpg (guiscrcpy running on Fedora 30)
