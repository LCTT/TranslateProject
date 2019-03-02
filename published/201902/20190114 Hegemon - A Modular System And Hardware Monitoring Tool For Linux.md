[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10503-1.html)
[#]: subject: (Hegemon – A Modular System And Hardware Monitoring Tool For Linux)
[#]: via: (https://www.2daygeek.com/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

Hegemon：一个 Linux 的模块化系统和硬件监控工具
======

我知道每个人都更喜欢使用 [top 命令][1]来监控系统利用率。这是被 Linux 系统管理员大量使用的原生命令之一。

在 Linux 中，每个包都有一个替代品。Linux 中有许多可用于此的工具，我更喜欢 [htop 命令][2]。

如果你想了解其他替代方案，我建议你浏览每个链接了解更多信息。它们有 htop、CorFreq、glances、atop、Dstat、Gtop、Linux Dash、Netdata、Monit 等。

所有这些只允许我们监控系统利用率而不能监控系统硬件。但是 Hegemon 允许我们在单个仪表板中监控两者。

如果你正在寻找系统硬件监控软件，那么我建议你看下 [lm_sensors][3] 和 [s-tui 压力终端 UI][4]。

### Hegemon 是什么？

Hegemon 是一个正在开发中的模块化系统监视器，以安全的 Rust 编写。

它允许用户在单个仪表板中监控两种使用情况。分别是系统利用率和硬件温度。

### Hegemon 目前的特性

  * 监控 CPU 和内存使用情况、温度和风扇速度
  * 展开任何数据流以显示更详细的图表和其他信息
  * 可调整的更新间隔
  * 干净的 MVC 架构，具有良好的代码质量
  * 单元测试

### 计划的特性包括

  * macOS 和 BSD 支持（目前仅支持 Linux）
  * 监控磁盘和网络 I/O、GPU 使用情况（可能）等
  * 选择并重新排序数据流
  * 鼠标控制

### 如何在 Linux 中安装 Hegemon？

Hegemon 需要 Rust 1.26 或更高版本以及 libsensors 的开发文件。因此，请确保在安装 Hegemon 之前安装了这些软件包。

libsensors 库在大多数发行版官方仓库中都有，因此，使用以下命令进行安装。

对于 Debian/Ubuntu 系统，使用 [apt-get 命令][5] 或 [apt 命令][6] 在你的系统上安装 libsensors。

```
# apt install lm_sensors-devel
```

对于 Fedora 系统，使用 [dnf 包管理器][7]在你的系统上安装 libsensors。

```
# dnf install libsensors4-dev
```

运行以下命令安装 Rust 语言，并按照指示来做。如果你想要看 [Rust 安装][8]的方便教程，请进入该 URL。

```
$ curl https://sh.rustup.rs -sSf | sh
```

如果你已成功安装 Rust。运行以下命令安装 Hegemon。

```
$ cargo install hegemon
```

### 如何在 Linux 中启动 Hegemon？

成功安装 Hegemon 包后，运行下面的命令启动。

```
$ hegemon
```

![][10]

由于 libsensors.so.4 库的问题，我在启动 Hegemon 时遇到了一个问题。

```
$ hegemon
error while loading shared libraries: libsensors.so.4: cannot open shared object file: No such file or directory manjaro
```

我使用的是 Manjaro 18.04。它存在 libsensors.so 和 libsensors.so.5 共享库，而没有 libsensors.so.4。所以，我刚刚创建了以下符号链接来解决问题。

```
$ sudo ln -s /usr/lib/libsensors.so /usr/lib/libsensors.so.4
```

这是从我的 Lenovo-Y700 笔记本中截取的示例 gif。

![][11]

默认它仅显示总体摘要，如果你想查看详细输出，则需要展开每个部分。如下是 Hegemon 的展开视图。

![][12]

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/top-command-examples-to-monitor-server-performance/
[2]: https://www.2daygeek.com/linux-htop-command-linux-system-performance-resource-monitoring-tool/
[3]: https://www.2daygeek.com/view-check-cpu-hard-disk-temperature-linux/
[4]: https://www.2daygeek.com/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency/
[5]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[7]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[8]: https://www.2daygeek.com/how-to-install-rust-programming-language-in-linux/
[9]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]: https://www.2daygeek.com/wp-content/uploads/2019/01/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux-1.png
[11]: https://www.2daygeek.com/wp-content/uploads/2019/01/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux-2a.gif
[12]: https://www.2daygeek.com/wp-content/uploads/2019/01/hegemon-a-modular-system-and-hardware-monitoring-tool-for-linux-3.png
