[#]: subject: "3 ways to use the Linux inxi command"
[#]: via: "https://opensource.com/article/22/9/linux-inxi-command"
[#]: author: "Don Watkins https://opensource.com/users/don-watkins"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Linux inxi 命令的 3 种使用方法
======
我在 Linux 上使用 inxi 来检查我的笔记本电脑电池、CPU 信息，甚至天气。

![Coding on a computer][1]

当我在查询有关笔记本电脑电池健康状况的信息时，我偶然发现了 `inxi`。它是一个命令行系统信息工具，可提供有关你的 Linux 计算机（无论是笔记本电脑、台式机还是服务器）的大量信息。

`inxi` 命令使用 GPLv3 [许可][2]，许多 Linux 发行版都包含它。根据它的 Git 存储库：“inxi 努力支持最广泛的操作系统和硬件，从最简单的消费台式机到最先进的专业硬件和服务器。”

文档很完善，并且该项目在线维护了完整的[手册页][3]。安装后，你可以使用 `man inxi` 命令访问系统上的手册页。

### 在 Linux 上安装 inxi

通常，你可以从发行版的软件仓库或应用中心安装 `inxi`。例如，在 Fedora、CentOS、Mageia 或类似发行版上：

```
$ sudo dnf install inxi
```

在 Debian、Elementary、Linux Mint 或类似发行版上：

```
$ sudo apt install inxi
```

你可以在[此处][4]找到有关 Linux 发行版安装选项的更多信息。

### 在 Linux 上使用 inxi 的 3 种方法

当你安装了 `inxi`，你可以探索它的所有选项。有许多选项可帮助你了解有关系统的更多信息。最基本的命令提供了系统的基本概览：

```
$ inxi -b
System:
  Host: pop-os Kernel: 5.19.0-76051900-generic x86_64 bits: 64
        Desktop: GNOME 42.3.1 Distro: Pop!_OS 22.04 LTS
Machine:
  Type: Laptop System: HP product: Dev One Notebook PC v: N/A
        serial: <superuser required>
  Mobo: HP model: 8A78 v: KBC Version 01.03 serial: <superuser required>
        UEFI: Insyde v: F.05 date: 06/14/2022
Battery:
  ID-1: BATT charge: 50.6 Wh (96.9%) condition: 52.2/53.2 Wh (98.0%)
CPU:
  Info: 8-core AMD Ryzen 7 PRO 5850U with Radeon Graphics [MT MCP]
        speed (MHz): avg: 915 min/max: 400/4507
Graphics:
  Device-1: AMD Cezanne driver: amdgpu v: kernel
  Device-2: Quanta HP HD Camera type: USB driver: uvcvideo
  Display: x11 server: X.Org v: 1.21.1.3 driver: X: loaded: amdgpu,ati
        unloaded: fbdev,modesetting,radeon,vesa gpu: amdgpu
        resolution: 1920x1080~60Hz
  OpenGL:
        renderer: AMD RENOIR (LLVM 13.0.1 DRM 3.47 5.19.0-76051900-generic)
        v: 4.6 Mesa 22.0.5
Network:
  Device-1: Realtek RTL8822CE 802.11ac PCIe Wireless Network Adapter
        driver: rtw_8822ce
Drives:
  Local Storage: total: 953.87 GiB used: 75.44 GiB (7.9%)
Info:
  Processes: 347 Uptime: 15m Memory: 14.96 GiB used: 2.91 GiB (19.4%)
  Shell: Bash inxi: 3.3.13
```

### 1. 显示电池状态

你可以使用 `-B` 选项检查电池健康状况。结果显示系统电池 ID、充电情况和其他信息：

```
$ inxi -B
Battery:
ID-1: BATT charge: 44.3 Wh (85.2%) condition: 52.0/53.2 Wh (97.7%)
```

### 2. 显示 CPU 信息

使用 `-C` 选项了解有关 CPU 的更多信息：

```
$ inxi -C
CPU:
  Info: 8-core model: AMD Ryzen 7 PRO 5850U with Radeon Graphics bits: 64
	type: MT MCP cache: L2: 4 MiB
  Speed (MHz): avg: 400 min/max: 400/4507 cores: 1: 400 2: 400 3: 400
	4: 400 5: 400 6: 400 7: 400 8: 400 9: 400 10: 400 11: 400 12: 400 13: 400
	14: 400 15: 400 16: 400
```

`inxi` 的输出默认使用彩色文本。你可以根据需要使用“颜色开关”进行更改以提高可读性。

命令选项是 `-c` 后跟 0 到 42 之间的任意数字以适合你的习惯。

```
$ inxi -c 42
```

以下是使用颜色 5 和 7 的几个不同选项的示例：

![inxi -c 5 command][5]

该软件可以使用 Linux 系统中的传感器显示硬件温度、风扇速度和有关系统的其他信息。输入 `inxi -s` 并读取以下结果：

![inxi -s][6]

### 3. 组合选项

如果支持，你可以组合 `inxi` 的选项以获得复杂的输出。例如，`inxi -S` 提供系统信息，`-v` 提供详细输出。将两者结合起来可以得到以下结果：

```
$ inxi -S
System:
  Host: pop-os Kernel: 5.19.0-76051900-generic x86_64 bits: 64
        Desktop: GNOME 42.3.1 Distro: Pop!_OS 22.04 LTS

$ inxi -Sv
CPU: 8-core AMD Ryzen 7 PRO 5850U with Radeon Graphics (-MT MCP-)
speed/min/max: 634/400/4507 MHz Kernel: 5.19.0-76051900-generic x86_64
Up: 20m Mem: 3084.2/15318.5 MiB (20.1%) Storage: 953.87 GiB (7.9% used)
Procs: 346 Shell: Bash inxi: 3.3.13
```

### 额外功能：查看天气

`inxi` 可以收集到的信息并不只有你的电脑。使用 `-w` 选项，你还可以获取你所在地区的天气信息：

```
$ inxi -w
Weather:
  Report: temperature: 14 C (57 F) conditions: Clear sky
  Locale: Wellington, G2, NZL
        current time: Tue 30 Aug 2022 16:28:14 (Pacific/Auckland)
        Source: WeatherBit.io
```

你可以通过指定你想要的城市和国家以及 `-W` 来获取世界其他地区的天气信息：

```
$ inxi -W rome,italy
Weather:
  Report: temperature: 20 C (68 F) conditions: Clear sky
  Locale: Rome, Italy current time: Tue 30 Aug 2022 06:29:52
        Source: WeatherBit.io
```

### 总结

有许多很棒的工具可以收集有关你的计算机的信息。 我根据机器、桌面或我的心情使用不同的。 你最喜欢的系统信息工具是什么？

图片来源：（Don Watkins，CC BY-SA 4.0）

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/9/linux-inxi-command

作者：[Don Watkins][a]
选题：[lkxed][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lkxed
[1]: https://opensource.com/sites/default/files/lead-images/code_computer_laptop_hack_work.png
[2]: https://github.com/smxi/inxi/blob/master/LICENSE.txt
[3]: https://smxi.org/docs/inxi-man.htm
[4]: https://smxi.org/docs/inxi-installation.htm#inxi-repo-install
[5]: https://opensource.com/sites/default/files/2022-09/inxi-c5.png
[6]: https://opensource.com/sites/default/files/2022-09/inxi-s.png
