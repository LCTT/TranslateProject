Hegemon：使用 Rust 编写的模块化系统监视程序
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/hegemon-720x340.png)

在类 Unix 系统中监视运行进程时，最常用的程序是 `top` 和它的增强版 `htop`。我个人最喜欢的是 `htop`。但是，开发人员不时会发布这些程序的替代品。`top` 和 `htop` 工具的一个替代品是 `Hegemon`。它是使用 Rust 语言编写的模块化系统监视程序。

关于 Hegemon 的功能，我们可以列出以下这些：

* Hegemon 会监控 CPU、内存和交换页的使用情况。
* 它监控系统的温度和风扇速度。
* 更新间隔时间可以调整。默认值为 3 秒。
* 我们可以通过扩展数据流来展示更详细的图表和其他信息。
* 单元测试。
* 干净的界面。
* 自由开源。

### 安装 Hegemon

确保已安装 Rust 1.26 或更高版本。要在 Linux 发行版中安装 Rust，请参阅以下指南：

- [在 Linux 中安装 Rust 编程语言][2]

另外要安装 [libsensors][1] 库。它在大多数 Linux 发行版的默认仓库中都有。例如，你可以使用以下命令将其安装在基于 RPM 的系统（如 Fedora）中：

```
$ sudo dnf install lm_sensors-devel
```

在像 Ubuntu、Linux Mint 这样的基于 Debian 的系统上，可以使用这个命令安装它：

```
$ sudo apt-get install libsensors4-dev
```

在安装 Rust 和 libsensors 后，使用命令安装 Hegemon：

```
$ cargo install hegemon
```

安装 hegemon 后，使用以下命令开始监视 Linux 系统中正在运行的进程：

```
$ hegemon
```

以下是 Arch Linux 桌面的示例输出。

![](https://www.ostechnix.com/wp-content/uploads/2018/09/Hegemon-in-action.gif)

要退出，请按 `Q`。


请注意，hegemon 仍处于早期开发阶段，并不能完全取代 `top` 命令。它可能存在 bug 和功能缺失。如果你遇到任何 bug，请在项目的 GitHub 页面中报告它们。开发人员计划在即将推出的版本中引入更多功能。所以，请关注这个项目。

就是这些了。希望这篇文章有用。还有更多的好东西。敬请关注！

干杯!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/hegemon-a-modular-system-monitor-application-written-in-rust/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://github.com/lm-sensors/lm-sensors
[2]: https://www.ostechnix.com/install-rust-programming-language-in-linux/
