[#]: subject: "What’s new in Fedora Workstation 37"
[#]: via: "https://fedoramagazine.org/whats-new-fedora-37-workstation/"
[#]: author: "Merlin Cooper https://fedoramagazine.org/author/mxanthropocene/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Fedora Workstation 37 中的新功能
======

![][1]

Fedora Workstation 37 是 Fedora Project 桌面操作系统的最新版本，由致力于推动开源创新的全球社区开发。本文介绍了 Fedora Workstation 37 中一些面向用户的新功能。今天从 GNOME Software 升级，或者在你最喜欢的终端模拟器中使用 _[dnf system-upgrade][2]_！

### GNOME 43

Fedora Workstation 37 具有最新版本的 GNOME 桌面环境，其中包含更多移植到 GTK 4 的核心应用、用户界面调整和性能调整。查看 [GNOME 43 发行说明][3]了解更多信息！

#### 重新设计的快速设置菜单

![无需打开设置即可切换深色模式][4]

新的快速设置菜单提供更多控制和便利。你现在可以在菜单中轻松切换你的 Wi-Fi 网络，而不用进入全屏对话框，在默认模式和深色模式之间切换，以及在不打开“设置”应用的情况下启用夜灯。现在还提供了一个方便的截屏和截屏视频按钮。

#### 核心应用

Fedora Workstation 37 中包含的 GNOME 核心应用已经进行了一轮调整和改进。

  * 文件已移植到 GTK 4，并且用户界面有许多改进。这里只是其中的一些：
    * 它现在是自适应的，这意味着它会自动调整到更窄的尺寸，从而更好地利用可用空间。
    * 列表视图已重新设计，使橡皮筋选择更容易。
    * 重新设计了 “Properties” 和 “Open With…” 对话框。



![Files 43 中的橡皮筋选择][5]

  * 日历有一个新的边栏，可以一目了然地显示即将发生的事件。它与联系人一起，现在具有自适应用户界面。
  * 角色现在会向你显示不同的肤色、头发颜色和表情符号的性别选项。
  * Software 中的包源选择器已重新设计并移至更显眼的位置。
  * 地图已移植到 GTK 4。
  * 设置包括一个新的设备安全面板，让你可以轻松查看你的设备提供或缺少的硬件安全功能！



![呃哦！][6！]

### 新的补充默认壁纸

Fedora Workstation 37 附带一组新的补充壁纸。 [在这里看看它们是如何制作的！][7]

![六张新壁纸有浅色和深色两种][8]

### Fedora Linux 37 的底层变化

Fedora Linux 37 具有许多底层更改。以下是一些值得注意的：

  * 现已正式支持树莓派 4 单板机，包括 3D 加速！
  * BIOS 系统上的新安装将使用 GPT 磁盘布局，而不是传统的 MBR 布局。安装程序镜像现在还将使用 GRUB 而不是 syslinux 在 BIOS 系统上引导。
  * 如果你禁用然后重新启用 SELinux，或运行 _fixfiles onboot_ 命令，文件系统重新标记过程现在将并行完成，从而显着提高速度。
  * 波斯语的默认字体已从 DejaVu 和 Noto Sans Arabic 更改为 Vazirmatn，为在波斯语中使用 Fedora Linux 的用户提供更一致的体验。


### 还有这些...

Fedora 项目中发生的很酷的事情！

  * Fedora CoreOS 和 Fedora Cloud Base 已升级为 Edition 状态！
  * Fedora Linux 系统安装程序 Anaconda 的带有新 GUI 的预览安装程序镜像将在大约一周内可用。我将发布一篇文章以提供更多详细信息，敬请关注此空间！



--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-37-workstation/

作者：[Merlin Cooper][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/mxanthropocene/
[b]: https://github.com/lujun9972
[1]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/10/f37-whats_new-816x345.jpg
[2]: https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/
[3]: https://release.gnome.org/43/
[4]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/ezgif.com-gif-maker1.gif
[5]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/ezgif.com-gif-maker2.gif
[6]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/Screenshot-from-2022-09-16-20-25-28-1024x708.png
[7]: https://blog.linuxgrrl.com/2022/06/27/abstract-wallpapers-in-blender-using-geometry-nodes/
[8]: https://fedoramag.wpenginepowered.com/wp-content/uploads/2022/09/dfg-1-1024x679.png
