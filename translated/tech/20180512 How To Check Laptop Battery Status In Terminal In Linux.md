如何在 Linux 终端下检查笔记本电池状态
======
![](https://www.ostechnix.com/wp-content/uploads/2016/12/Check-Laptop-Battery-Status-In-Terminal-In-Linux-720x340.png)

在图形界面下查看你的笔记本电池状态是很容易的，只需将鼠标指向任务栏中的电池图标上，你便可以很容易地知道电池的电量。但如果我们想要从命令行中获得这些信息呢？并不是所有人都知道如何做到这点。前几天我的一个朋友询问我如何从他的 Ubuntu 系统里，在终端中查看他的笔记本电池的电量。这便是我写这篇文章的起因。在本文中我概括了三种简单的方法来让你在任何 Linux 发行版本中从终端查看笔记本电池的状态。

### 在终端下检查笔记本电池状态

我们可以使用下面的三种方法来从命令行中查找到笔记本电池状态。

##### 方法一 – 使用 “Upower” 命令

**Upower** 命令预装在大多数的 Linux 发行版本中。为了使用 `upower` 命令来展示电池的状态，打开终端并运行如下命令：
```
$ upower -i /org/freedesktop/UPower/devices/battery_BAT0

```

**示例输出：**
```
native-path: BAT0
 vendor: Samsung SDI
 model: DELL 7XFJJA2
 serial: 4448
 power supply: yes
 updated: Sat 12 May 2018 06:48:48 PM IST (41 seconds ago)
 has history: yes
 has statistics: yes
 battery
 present: yes
 rechargeable: yes
 state: charging
 warning-level: none
 energy: 43.3011 Wh
 energy-empty: 0 Wh
 energy-full: 44.5443 Wh
 energy-full-design: 48.84 Wh
 energy-rate: 9.8679 W
 voltage: 12.548 V
 time to full: 7.6 minutes
 percentage: 97%
 capacity: 91.2045%
 technology: lithium-ion
 icon-name: 'battery-full-charging-symbolic'
 History (charge):
 1526131128 97.000 charging
 History (rate):
 1526131128 9.868 charging

```

正如你所看到的那样，我的电池正处于充电状态，并且它的电量百分比是 97%。

假如上面的命令因为某些未知原因不起作用，可以尝试使用下面的命令：
```
$ upower -i `upower -e | grep 'BAT'`

```

**示例输出：**
```
native-path: BAT0
 vendor: Samsung SDI
 model: DELL 7XFJJA2
 serial: 4448
 power supply: yes
 updated: Sat 12 May 2018 06:50:49 PM IST (22 seconds ago)
 has history: yes
 has statistics: yes
 battery
 present: yes
 rechargeable: yes
 state: charging
 warning-level: none
 energy: 43.6119 Wh
 energy-empty: 0 Wh
 energy-full: 44.5443 Wh
 energy-full-design: 48.84 Wh
 energy-rate: 8.88 W
 voltage: 12.552 V
 time to full: 6.3 minutes
 percentage: 97%
 capacity: 91.2045%
 technology: lithium-ion
 icon-name: 'battery-full-charging-symbolic'
 History (rate):
 1526131249 8.880 charging

```

Upower 不仅可以显示出电池的状态，它还可以显示出已安装电池的其他完整信息，例如
电池型号，供应商名称，电池的序列号，电池的状态，电池的电压等信息。

当然，如果你只想显示电池的状态，你可以可以结合使用 `upower` 命令和[**grep**][1] 命令，具体命令如下：
```
$ upower -i $(upower -e | grep BAT) | grep --color=never -E "state|to\ full|to\ empty|percentage"

```

**示例输出：**
```
state: fully-charged
percentage: 100%

```

![][3]

从上面的输出中可以看到我的笔记本电池已经完全充满了。

想知晓更多的细节，可以参看 man 页：
```
$ man upower

```

##### 方法二 – 使用 “acpi” 命令

**acpi** 命令可以用来显示你的 Linux 发行版本中电池的状态以及其他 ACPI 信息。

在某些 Linux 发行版本中，你可能需要安装 **acpi** 命令。

要在 Debian, Ubuntu 及其衍生版本中安装它，可以使用如下命令：
```
$ sudo apt-get install acpi

```

在 RHEL, CentOS, Fedora 等系统中使用：
```
$ sudo yum install acpi

```

或者使用如下命令：
```
$ sudo dnf install acpi

```

在 Arch Linux 及其衍生版本中使用：
```
$ sudo pacman -S acpi

```

一旦 `acpi` 安装好后，运行下面的命令：
```
$ acpi -V

```

**注意:** 在上面的命令中， “V” 是大写字母。

**示例输出：**
```
Battery 0: Charging, 99%, 00:02:09 until charged
Battery 0: design capacity 4400 mAh, last full capacity 4013 mAh = 91%
Battery 1: Discharging, 0%, rate information unavailable
Adapter 0: on-line
Thermal 0: ok, 77.5 degrees C
Thermal 0: trip point 0 switches to mode critical at temperature 84.0 degrees C
Cooling 0: Processor 0 of 3
Cooling 1: Processor 0 of 3
Cooling 2: LCD 0 of 15
Cooling 3: Processor 0 of 3
Cooling 4: Processor 0 of 3
Cooling 5: intel_powerclamp no state information available
Cooling 6: x86_pkg_temp no state information available

```

首先让我们来检查电池的电量，可以运行：
```
$ acpi

```

**示例输出：**
```
Battery 0: Charging, 99%, 00:01:41 until charged
Battery 1: Discharging, 0%, rate information unavailable

```

下面，让我们来查看电池的温度：
```
$ acpi -t

```

**示例输出：**
```
Thermal 0: ok, 63.5 degrees C

```

如果需要将温度以华氏温标显示，可以使用：
```
$ acpi -t -f

```

**示例输出：**
```
Thermal 0: ok, 144.5 degrees F

```

如果想看看交流电适配器是否连接上了没有，可以运行：
```
$ acpi -a

```

**示例输出：**
```
Adapter 0: on-line

```

假如交流电适配器没有连接上，则你将看到如下的输出：
```
Adapter 0: off-line

```

想获取更多的信息，可以查看 man 页：
```
$ man acpi

```

##### 方法三 - 使用 “Batstat” 程序

**batstat** 是一个基于 ncurses 的命令行小工具，使用它可以在类 Unix 系统中展示笔记本电池状态。它可以展示如下具体信息：

  * 当前电池电量
  * 当前电池所存能量
  * 充满时所存能量
  * 从程序启动开始经历的时间，它不会追踪记录机器休眠的时间
  * 电池电量消耗历史数据

安装 `batstat` 轻而易举。使用下面的命令来复刻(clone)该程序的最新版本：
```
$ git clone https://github.com/Juve45/batstat.git

```

上面的命令将拉取 batstat 的最新版本并将它的内容保存在一个名为 ”batstat“ 的文件夹中。

首先将目录切换到 `batstat/bin/` 中：
```
$ cd batstat/bin/

```

接着将 “batstat” 二进制文件复制到 PATH 环境变量中的某个目录中，例如 `/usr/local/bin/` 目录：
```
$ sudo cp batstat /usr/local/bin/

```

使用下面的命令来让它可被执行：
```
$ sudo chmod +x /usr/local/bin/batstat

```

最后，使用下面的命令来查看你的电池状态。
```
$ batstat

```

示例输出：

![][4]

从上面的截图中可以看到我的笔记本电池正处于充电状态。

这个小工具还有某些小的限制。在书写本文之时，batstat 仅支持显示一个电池的相关信息。而且它只从 **“/sys/class/power_supply/”** 目录搜集相关的信息。假如你的电池信息被存放在另外的目录中，则这个小工具就不会起作用了。

想知晓更多信息，可以查看 batstat 的 [github 主页][5]。

上面就是今天我要分享的所有内容。当然，可能还有很多其他的命令或者程序来从 Linux 终端检查笔记本的电池状态。据我所知，上面给出的命令都运行良好。假如你知道其他命令来查看电池的状态，请在下面的评论框中让我们知晓。假如你所给出的方法能够起作用，我将对我的这篇文章进行更新。

最后，上面便是今天的全部内容了。更多的优质内容敬请期待，敬请关注！

欢呼吧!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-check-laptop-battery-status-in-terminal-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[FSSlc](https://github.com/FSSlc)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/the-grep-command-tutorial-with-examples-for-beginners/
[2]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]:http://www.ostechnix.com/wp-content/uploads/2016/12/sk@sk_006-1.png
[4]:http://www.ostechnix.com/wp-content/uploads/2016/12/batstat-1.png
[5]:https://github.com/Juve45/batstat