CPU 电源管理器：Linux 系统中 CPU 主频的控制和管理
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Manage-CPU-Frequency-720x340.jpeg)

你使用笔记本的话，可能知道 Linux 系统的电源管理做的很不好。虽然有 **TLP**、[**Laptop Mode Tools** 和 **powertop**][1] 这些工具来辅助减少电量消耗，但跟 Windows 和 Mac OS 系统比较起来，电池的整个使用周期还是不尽如意。此外，还有一种降低功耗的办法就是限制 CPU 的频率。这是可行的，然而却需要编写很复杂的终端命令来设置，所以使用起来不太方便。幸好，有一款名为 **CPU Power Manager** 的 GNOME 扩展插件，可以很容易的就设置和管理你的 CPU 主频。GNOME 桌面系统中，CPU Power Manager 使用名为 **intel_pstate** 的频率调整驱动程序（几乎所有的 Intel CPU 都支持）来控制和管理 CPU 主频。

使用这个扩展插件的另一个原因是可以减少系统的发热量，因为很多系统在正常使用中的发热量总让人不舒服，限制 CPU 的主频就可以减低发热量。它还可以减少 CPU 和其他组件的磨损。

### 安装 CPU Power Manager

首先，进入[扩展插件主页面][2]，安装此扩展插件。

安装好插件后，在 GNOME 顶部栏的右侧会出现一个 CPU 图标。点击图标，会出现安装此扩展一个选项提示，如下示：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager-icon.png)

点击“尝试安装”按纽，会弹出输入密码确认框。插件需要 root 权限来添加 policykit 规则，进而控制 CPU 主频。下面是弹出的提示框样子：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager-1.png)

输入密码，点击“认证”按纽，完成安装。最后在 `/usr/share/polkit-1/actions` 目录下添加了一个名为 `mko.cpupower.setcpufreq.policy` 的 policykit 文件。

都安装完成后，如果点击右上脚的 CPU 图标，会出现如下所示：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager.png)

### 功能特性

  * **查看 CPU 主频：** 显然，你可以通过这个提示窗口看到 CPU 的当前运行频率。
  * **设置最大、最小主频：** 使用此扩展，你可以根据列出的最大、最小频率百分比进度条来分别设置其频率限制。一旦设置，CPU 将会严格按照此设置范围运行。
  * **开/关 Turbo Boost：** 这是我最喜欢的功能特性。大多数 Intel CPU 都有 “Turbo Boost” 特性，为了提高额外性能，其中的一个内核为自动进行超频。此功能虽然可以使系统获得更高的性能，但也大大增加功耗。所以，如果不做 CPU 密集运行的话，为节约电能，最好关闭 Turbo Boost 功能。事实上，在我电脑上，我大部分时间是把 Turbo Boost 关闭的。
  * **生成配置文件：** 可以生成最大和最小频率的配置文件，就可以很轻松打开/关闭，而不是每次手工调整设置。

### 偏好设置

你也可以通过偏好设置窗口来自定义扩展插件显示形式：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager-preferences.png)

如你所见，你可以设置是否显示 CPU 主频，也可以设置是否以 **Ghz** 来代替 **Mhz** 显示。

你也可以编辑和创建/删除配置文件：

![](https://www.ostechnix.com/wp-content/uploads/2018/09/CPU-Power-Manager-preferences-1.png)

可以为每个配置文件分别设置最大、最小主频及开/关 Turbo boost。

### 结论

正如我在开始时所说的，Linux 系统的电源管理并不是最好的，许多人总是希望他们的 Linux 笔记本电脑电池能多用几分钟。如果你也是其中一员，就试试此扩展插件吧。为了省电，虽然这是非常规的做法，但有效果。我确实喜欢这个插件，到现在已经使用了好几个月了。

你对此插件有何看法呢？请把你的观点留在下面的评论区吧。

祝贺!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/cpu-power-manager-control-and-manage-cpu-frequency-in-linux/

作者：[EDITOR][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[runningwater](https://github.com/runningwater)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/editor/
[1]: https://www.ostechnix.com/improve-laptop-battery-performance-linux/
[2]: https://extensions.gnome.org/extension/945/cpu-power-manager/
