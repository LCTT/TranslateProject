[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (https://linux.cn/article-10467-1.html)
[#]: url: (wxy)
[#]: subject: (s-tui: A Terminal Tool To Monitor CPU Temperature, Frequency, Power And Utilization In Linux)
[#]: via: (https://www.2daygeek.com/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency/)
[#]: author: (Prakash Subramanian https://www.2daygeek.com/author/prakash/)

s-tui：在 Linux 中监控 CPU 温度、频率、功率和使用率的终端工具
======

一般每个 Linux 管理员都会使用 [lm_sensors 监控 CPU 温度][1]。lm_sensors （Linux 监控传感器）是一个自由开源程序，它提供了监控温度、电压和风扇的驱动和工具。

如果你正在找替代的 CLI 工具，我会建议你尝试 s-tui。

它其实是一个压力测试的终端 UI，可以帮助管理员通过颜色查看 CPU 温度。

### s-tui 是什么

s-tui 是一个用于监控计算机的终端 UI。s-tui 可以在终端以图形方式监控 CPU 温度、频率、功率和使用率。此外，它还显示由发热量限制引起的性能下降，它需要很少的资源并且不需要 X 服务器。它是用 Python 编写的，需要 root 权限才能使用它。

s-tui 是一个独立的程序，可以开箱即用，并且不需要配置文件就可以使用其基本功能。

s-tui 使用 psutil 来探测你的一些硬件信息。如果不支持你的一些硬件，你可能看不到所有信息。

以 root 身份运行 s-tui 时，当压测所有 CPU 核心时，可以将 CPU 发挥到最大睿频频率。它在后台使用 Stress 压力测试工具，通过对系统施加某些类型的计算压力来检查其组件的温度是否超过其可接受的范围。只要计算机稳定并且其组件的温度不超过其可接受的范围，PC 超频就没问题。有几个程序可以通过压力测试得到系统的稳定性，从而评估超频水平。

### 如何在 Linux 中安装 s-tui

它是用 Python 写的，`pip` 是在 Linux 上安装 s-tui 的推荐方法。确保你在系统上安装了 python-pip 软件包。如果还没有，请使用以下命令进行安装。

对于 Debian/Ubuntu 用户，使用 [apt 命令][2] 或 [apt-get 命令][3] 来安装 `pip`。

```
$ sudo apt install python-pip stress
```

对于 Archlinux 用户，使用 [pacman 命令][4] 来安装 `pip`。

```
$ sudo pacman -S python-pip stress
```

对于 Fedora 用户，使用 [dnf 命令][5] 来安装 `pip`。

```
$ sudo dnf install python-pip stress
```

对于 CentOS/RHEL 用户，使用 [yum 命令][5] 来安装 `pip`。

```
$ sudo yum install python-pip stress
```

对于 openSUSE 用户，使用 [zypper 命令][5] 来安装 `pip`。

```
$ sudo zypper install python-pip stress
```

最后运行下面的 [pip 命令][8] 在 Linux 中安装 s-tui 工具。

对于 Python 2.x：

```
$ sudo pip install s-tui
```

对于Python 3.x：

```
$ sudo pip3 install s-tui
```

### 如何使用 s-tui

正如我在文章开头所说的那样。它需要 root 权限才能从系统获取所有信息。只需运行以下命令即可启动 s-tui。

```
$ sudo s-tui
```

![][10]

默认情况下，它启用硬件监控并选择 “Stress” 选项以对系统执行压力测试。

![][11]

要查看其他选项，请到帮助页面查看。

```
$ s-tui --help
```

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency/

作者：[Prakash Subramanian][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/prakash/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/view-check-cpu-hard-disk-temperature-linux/
[2]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[3]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[4]: https://www.2daygeek.com/pacman-command-examples-manage-packages-arch-linux-system/
[5]: https://www.2daygeek.com/dnf-command-examples-manage-packages-fedora-system/
[6]: https://www.2daygeek.com/yum-command-examples-manage-packages-rhel-centos-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[8]: https://www.2daygeek.com/install-pip-manage-python-packages-linux/
[9]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]: https://www.2daygeek.com/wp-content/uploads/2018/12/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency-1.jpg
[11]: https://www.2daygeek.com/wp-content/uploads/2018/12/s-tui-stress-terminal-ui-monitor-linux-cpu-temperature-frequency-2.jpg
