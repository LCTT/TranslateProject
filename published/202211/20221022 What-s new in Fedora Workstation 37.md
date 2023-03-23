[#]: subject: "What’s new in Fedora Workstation 37"
[#]: via: "https://fedoramagazine.org/whats-new-fedora-37-workstation/"
[#]: author: "Merlin Cooper https://fedoramagazine.org/author/mxanthropocene/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-15272-1.html"

Fedora Workstation 37 中的新功能
======

![][1]

Fedora Workstation 37 是 Fedora Project 桌面操作系统的最新版本，由致力于推动开源创新的全球社区开发。本文介绍了 Fedora Workstation 37 中一些面向用户的新功能。现在就从 GNOME “<ruby>软件<rt>Software</rt></ruby>”应用升级，或者在你最喜欢的终端模拟器中使用 [dnf system-upgrade][2] 升级！

### GNOME 43

Fedora Workstation 37 具有最新版本的 GNOME 桌面环境，其中包含更多移植到 GTK 4 的核心应用、用户界面调整和性能调整。查看 [GNOME 43 发行说明][3] 了解更多信息！

#### 重新设计的快速设置菜单

![无需打开设置即可切换深色模式][4]

新的“<ruby>快速设置<rt>Quick Settings</rt></ruby>”菜单提供更多控制和便利。你现在可以在菜单中轻松切换你的 Wi-Fi 网络，而不用进入全屏对话框；在默认模式和深色模式之间切换；以及在不打开“<ruby>设置<rt>Settings</rt></ruby>”应用的情况下启用夜灯。现在还提供了一个方便的截屏和录屏按钮。

#### 核心应用

Fedora Workstation 37 中包含的 GNOME 核心应用已经进行了一轮调整和改进：

  * “<ruby>文件<rt>Files</rt></ruby>”应用已移植到 GTK 4，并且用户界面有许多改进。这里只是其中的一些：
    * 它现在是自适应的，这意味着它会自动调整到更窄的尺寸，从而更好地利用可用空间。
    * 列表视图已重新设计，使橡皮筋选择更容易。
    * 重新设计了 “<ruby>属性<rt>Properties</rt></ruby>” 和 “<ruby>打开方式……<rt>Open With…</rt></ruby>” 对话框。
  
      ![Files 43 中的橡皮筋选择][5]

  * “<ruby>日历<rt>Calendar</rt></ruby>”应用有一个新的边栏，可以一目了然地显示即将发生的事件。它与“<ruby>联系人<rt>Contacts</rt></ruby>”应用一起，现在具有自适应用户界面。
  * “<ruby>角色<rt>Characters</rt></ruby>”应用现在会向你显示不同的肤色、头发颜色和表情符号的性别选项。
  * “<ruby>软件<rt>Software</rt></ruby>” 中的包源选择器已重新设计并移至更显眼的位置。
  * “<ruby>地图<rt>Maps</rt></ruby>”应用已移植到 GTK 4。
  * “<ruby>设置<rt>Settings</rt></ruby>”应用包括一个新的“<ruby>设备安全<rt>Device Security</rt></ruby>”面板，让你可以轻松查看你的设备提供或缺少的硬件安全功能！
    ![呃哦！][6]

### 新补充的默认壁纸

Fedora Workstation 37 附带一组新的补充壁纸。 [在这里看看它们是如何制作的！][7]

![六张新壁纸有浅色和深色两种][8]

### Fedora Linux 37 的底层变化

Fedora Linux 37 具有许多底层更改。以下是一些值得注意的：

  * 现已正式支持树莓派 4 单板机，包括 3D 加速！
  * 在 BIOS 系统上的新安装将使用 GPT 磁盘布局，而不是传统的 MBR 布局。在 BIOS 系统上，安装程序镜像现在还将使用 GRUB 而不是 syslinux 进行引导。
  * 如果你禁用然后重新启用 SELinux，或运行 `fixfiles onboot` 命令，文件系统的重新标记过程现在将并行完成，从而显着提高速度。
  * 波斯语的默认字体已从 DejaVu 和 Noto Sans Arabic 更改为 Vazirmatn，为在波斯语中使用 Fedora Linux 的用户提供更一致的体验。

### 还有这些...

Fedora 项目中发生的很酷的事情！

  * Fedora CoreOS 和 Fedora Cloud Base 已升级为 “<ruby>版本<rt>Edition</rt></ruby>” 级别！
  * Fedora Linux 系统安装程序，带有新 GUI 的 Anaconda 预览安装程序镜像将在大约一周内可用。我将发布一篇文章以提供更多详细信息，敬请关注！

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/whats-new-fedora-37-workstation/

作者：[Merlin Cooper][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

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
