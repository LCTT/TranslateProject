[#]: subject: "Screen Recording in Linux With OBS and Wayland"
[#]: via: "https://itsfoss.com/screen-record-obs-wayland/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13802-1.html"

在 Linux 中使用 OBS 和 Wayland 进行屏幕录制
======

有 [大量可用于 Linux 的屏幕录像机][1]。但是当涉及到支持 [Wayland][2] 时，几乎所有的都不能用。

这是个问题，因为许多新发布的版本都再次默认切换到 Wayland 显示管理器。而如果像屏幕录像机这样基本的东西不能工作，就会给人留下不好的体验。

[GNOME 的内置屏幕录像机][3] 可以工作，但它是隐藏的，没有 GUI，也没有办法配置和控制记录内容。此外，还有一个叫 [Kooha][4] 的工具，但它一直在屏幕上显示一个计时器。

只是为了录制屏幕而 [在 Xorg 和 Wayland 之间切换][5]，这不是很方便。

这种情况下，我很高兴地得知，由于 Pipewire 的帮助，在 OBS Studio v27 中支持了 Wayland。但即使是这样，也不是很简单，因此我将向你展示使用 [OBS Studio][6] 在 Wayland 上录制屏幕的步骤。

### 使用 OBS 在 Wayland 上进行屏幕录制

![][7]

让我们来看看它是如何完成的。

#### 第一步：安装 OBS Studio

你应该先安装 OBS Studio v27。它已经包含在 Ubuntu 21.10 中，我会在本教程中使用它。

要在 Ubuntu 18.04、20.04、Linux Mint 20 等系统上安装 OBS Studio 27，请使用 [官方的 OBS Studio PPA][8]。

打开终端，逐一使用以下命令：

```
sudo add-apt-repository ppa:obsproject/obs-studio
sudo apt update
sudo apt install obs-studio
```

如果已经安装了 OBS Studio 的旧版本，它将被升级到较新的版本。

对于 Fedora、Arch 和其他发行版，请检查你的包管理器或非官方仓库以安装最新版本的 OBS Studio。

#### 第二步：检查 Wayland 捕获是否工作

请确认你正在使用 Wayland。现在启动 OBS Studio，查看它在第一次运行时显示的所有内容。我不打算展示这些。

主要步骤是添加 Pipewire 作为屏幕捕捉源。点击 “Sources” 列表下的 “+” 符号。

![Add screen capture source in OBS Studio][9]

你有没有看到 “Screen Capture (PipeWire)” 的字样？

![Do you see PipeWire option in the screen sources?][10]

**如果没看到，请退出 OBS Studio**。这很正常。至少在 Ubuntu 下，OBS Studio 不会自动切换到使用 Wayland。对此有一个修复方法。

打开一个终端，使用以下命令：

```
export QT_QPA_PLATFORM=wayland
```

在同一个终端，运行以下命令，启动 OBS Studio：

```
obs
```

它将在终端上显示一些信息。不要理会它们。你的注意力应该放在 OBS Studio GUI 上。再次尝试添加屏幕捕捉。你现在应该看到 PipeWire 选项了。

![][10]

你这次用 `QT_QPA_PLATFORM` 变量明确要求 OBS Studio 使用 Wayland。

选择 PipeWire 作为源，然后它要求你选择一个显示屏幕。选择它并点击分享按钮。

![][11]

现在它应该无限次递归地显示你的屏幕。如果你看到了，你现在就可以开始在 Wayland 中录制屏幕了。

![][12]

#### 第三步：让改变成为永久性的

这很好。你刚刚验证了你可以在 Wayland 上录制屏幕。但每次设置环境变量并从终端启动 OBS 并不方便。

你可以做的是**把这个变量导出到你的 `~/.bash_profile`（对你而言）或 `/etc/profile`（对系统中的所有用户而言）。**

```
export QT_QPA_PLATFORM=wayland
```

退出并重新登录。现在 OBS 会自动开始使用这个参数，你可以用它来录制 Wayland 的屏幕。

我希望这个快速技巧对你有帮助。如果你还有问题或建议，请在评论区告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/screen-record-obs-wayland/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-linux-screen-recorders/
[2]: https://wayland.freedesktop.org/
[3]: https://itsfoss.com/gnome-screen-recorder/
[4]: https://itsfoss.com/kooha-screen-recorder/
[5]: https://itsfoss.com/switch-xorg-wayland/
[6]: https://obsproject.com/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/obs-screen-record-wayland.webp?resize=800%2C450&ssl=1
[8]: https://launchpad.net/~obsproject/+archive/ubuntu/obs-studio
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/obs-studio-add-screen-capture-source.png?resize=800%2C537&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/obs-studio-wayland-support.png?resize=800%2C538&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/obs-studio-screen.png?resize=800%2C578&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/start-screen-recording-obs-wayland.jpg?resize=800%2C537&ssl=1
