[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12301-1.html)
[#]: subject: (How to Install Nvidia Drivers on Fedora Linux)
[#]: via: (https://itsfoss.com/install-nvidia-drivers-fedora/)
[#]: author: (John Paul https://itsfoss.com/author/john/)

如何在 Fedora Linux 中安装 Nvidia 驱动
======

![](https://img.linux.net.cn/data/attachment/album/202006/10/094702c7of7scjyucmc5f1.jpg)

与大多数 Linux 发行版一样，[Fedora][1] 并未默认安装专有的 [Nvidia][2] 驱动。

默认的开源 [Nouveau 驱动][3]在大多数情况下都可以使用，但是你可能会遇到屏幕撕裂等问题。

![Display issue in Fedora with Nouveau graphics driver][4]

如果遇到此类图形/视频问题，那么可能需要在 Fedora 中安装官方专有的 Nvidia 驱动。让我告诉你如何安装。

### 在 Fedora 中安装 Nvidia 驱动

我在本教程中使用 [Fedora 32][5]，但它应适用于其他 Fedora 版本。

#### 步骤 1

在做其他任何操作之前，请先确保你的系统是最新的。你可以使用软件中心，也可以在终端中使用以下命令：

```
sudo dnf update
```

#### 步骤 2

由于 Fedora 没有提供 Nvidia 驱动，因此你需要在系统中添加 [RPMFusion 仓库][6]。你可以在终端中使用以下命令：

```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

> 不喜欢终端么？那使用 GUI 的方法添加 RPMFusion 仓库。
> 
> 如果你使用 Firefox，那么还可以从浏览器添加 RPMFusion 仓库。进入这个[配置页面][7]，然后向下滚动到 “Graphical Setup via Firefox web browser”。单击自由和非自由仓库的链接。这将下载 .rpm 文件，并安装仓库。
> 
> ![RPMFusion Browser Installation][8]
>
> 你可以双击下载的 RPM 文件进行安装。
> 
> ![RPMFusion in the Software Center][9]

#### 步骤 3

现在，你需要确定 [Linux 系统中有哪些显卡（或芯片）][10]。打开终端并输入以下命令：

```
lspci -vnn | grep VGA
```

![Video Card Lookup in Fedora][11]

接下来，你需要查找与该芯片对应的驱动。你可以在[此处][12]找到 Nvidia 芯片的列表。你也可以使用[此工具][13]搜索设备。

**注意**：请记住，即使 Nvidia 列表显示了更多驱动，但也只有三个驱动可以安装。Nvidia 驱动支持最新的显卡。nvidia-390 和 nvidia-340 驱动支持旧设备。

#### 步骤 4

要安装所需的驱动，请在终端中输入以下一个命令。下面的命令是用于我的显卡的命令。根据你的系统相应调整。

```
sudo dnf install akmod-nvidia sudo dnf install xorg-x11-drv-nvidia-390xx akmod-nvidia-390xx sudo dnf install xorg-x11-drv-nvidia-340xx akmod-nvidia-340xx
```

![Nvidia terminal installation][14]

#### 步骤 5

要使更改生效，请重启系统。你的系统重启可能需要比较长的时间，因为它将 Nvidia 驱动注入到 Linux 内核中。

重启并登录系统后，你会看到更好的视觉效果，并且不会出现屏幕撕裂的情况。

![Fedora with Nvidia drivers][15]

### 额外的提示

这是可选步骤，但建议这样做。添加 RPMFusion 仓库时，你可以访问常规仓库中不可用的多媒体包。

此命令将为使用 [gstreamer][16] 的应用安装软件包：

```
sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
```

此命令将安装声音和视频软件包所需的包：

```
sudo dnf groupupdate sound-and-video
```

希望本教程对在 Fedora 上安装 Nvidia 驱动很有用。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-nvidia-drivers-fedora/

作者：[John Paul][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/john/
[b]: https://github.com/lujun9972
[1]: https://getfedora.org/
[2]: https://www.nvidia.com/en-us/
[3]: https://en.wikipedia.org/wiki/Nouveau_(software)
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/fedora-nouveau.jpg?resize=800%2C500&ssl=1
[5]: https://itsfoss.com/fedora-32/
[6]: https://rpmfusion.org/RPM%20Fusion
[7]: https://rpmfusion.org/Configuration
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/rpmfusion-gui-install.png?resize=800%2C500&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/rpmfusion-gui-install2.png?resize=800%2C500&ssl=1
[10]: https://itsfoss.com/check-graphics-card-linux/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/video-card-lookup-fedora.png?ssl=1
[12]: https://us.download.nvidia.com/XFree86/Linux-x86/367.57/README/supportedchips.html
[13]: https://www.nvidia.com/Download/index.aspx?lang=en-us
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/nvidia-cli-install.png?resize=800%2C500&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/fedora-nvidia.jpg?resize=800%2C500&ssl=1
[16]: https://en.wikipedia.org/wiki/GStreamer
