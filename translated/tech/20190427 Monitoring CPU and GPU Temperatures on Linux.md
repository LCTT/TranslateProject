[#]: collector: (lujun9972)
[#]: translator: (cycoe)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Monitoring CPU and GPU Temperatures on Linux)
[#]: via: (https://itsfoss.com/monitor-cpu-gpu-temp-linux/)
[#]: author: (It's FOSS Community https://itsfoss.com/author/itsfoss/)

在 Linux 上监控 CPU 和 GPU 温度
======

_**摘要：本篇文章讨论了在 Linux 命令行中监控 CPU 和 GPU 温度的两种简单方式。**_

由于 **[Steam][1]**（包括 _[Steam Play][2]_，也就是我们所熟知的 _Proton_）和一些其他的发展，**GNU/Linux** 正在成为越来越多计算机用户的日常游戏平台的选择。也有相当一部分用户在遇到像[视频编辑][3]或图形设计等（_Kdenlive_ 和 _[Blender][4]_ 是这类应用程序中很好的例子）资源消耗型计算任务时，也会使用 **GNU/Linux**。

不管你是否是这些用户中的一员或其他用户，你也一定想知道你的电脑 CPU 和 GPU 能有多热（如果你想要超频的话更会如此）。如果情况是这样，那么继续读下去。我们会介绍两个非常简单的命令来监控 CPU 和 GPU 温度。

我的装置包括一台 [Slimbook Kymera][5] 和两台显示器（一台 TV 和一台 PC 监视器），使得我可以用一台来玩游戏，另一台来留意监控温度。另外，因为我使用 [Zorin OS][6]，我会将关注点放在 **Ubuntu** 和 **Ubuntu** 的衍生发行版上。

为了监控 CPU 和 GPU 的行为，我们将利用实用的 `watch` 命令在每几秒钟之后动态地得到示数。

![][7]

### 在 Linux 中监控 CPU 温度

对于 CPU 温度，我们将结合使用 `watch` 与 `sensors` 命令。一篇关于[此工具的图形用户界面版本][8]的有趣文章已经在 It's FOSS 中介绍过了。然而，我们将在此处使用命令行版本：

```
watch -n 2 sensors
```

`watch` 保证了示数会在每 2 秒钟更新一次（-当然- 这个周期值能够根据你的需要去更改）：

```
Every 2,0s: sensors

iwlwifi-virtual-0
Adapter: Virtual device
temp1:        +39.0°C

acpitz-virtual-0
Adapter: Virtual device
temp1:        +27.8°C  (crit = +119.0°C)
temp2:        +29.8°C  (crit = +119.0°C)

coretemp-isa-0000
Adapter: ISA adapter
Package id 0:  +37.0°C  (high = +82.0°C, crit = +100.0°C)
Core 0:        +35.0°C  (high = +82.0°C, crit = +100.0°C)
Core 1:        +35.0°C  (high = +82.0°C, crit = +100.0°C)
Core 2:        +33.0°C  (high = +82.0°C, crit = +100.0°C)
Core 3:        +36.0°C  (high = +82.0°C, crit = +100.0°C)
Core 4:        +37.0°C  (high = +82.0°C, crit = +100.0°C)
Core 5:        +35.0°C  (high = +82.0°C, crit = +100.0°C)
```

除此之外，我们还能得到如下信息：

  * 我们有 5 个核心正在被使用（并且当前的最高温度为 37.0ºC）。
  * 温度超过 82.0ºC 会被认为是过热。
  * 超过 100.0ºC 的温度会被认为是超过临界值。



[推荐阅读：Linux 上排行前 10 的命令行游戏][9]


根据以上的温度值我们可以得出结论，我的电脑目前的工作负载非常小。

### 在 Linux 中监控 GPU 温度

现在让我们来看看显示卡。我从来没使用过 **AMD** 的显示卡，因此我会将重点放在 **Nvidia** 的显示卡上。我们需要做的第一件事是从 [Ubuntu 的附加驱动][10] 中下载合适的最新驱动。

在 **Ubuntu**（**Zorin** 或 **Linux Mint** 也是相同的）中，进入_软件和更新_ > _附加驱动_选项，选择最新的可用驱动。另外，你可以添加或启用显示卡的官方 _ppa_（通过命令行或通过_软件和更新_ > _其他软件_来实现）。安装驱动程序后，你将可以使用 _Nvidia X Server_ 的 GUI 程序以及命令行工具 _nvidia-smi_（Nvidia 系统管理界面）。因此我们将使用 `watch` 和 `nvidia-smi`：

```
watch -n 2 nvidia-smi
```

与 CPU 的情况一样，我们会在每两秒得到一次更新的示数：

```
Every 2,0s: nvidia-smi

Fri Apr 19 20:45:30 2019
+-----------------------------------------------------------------------------+
| Nvidia-SMI 418.56       Driver Version: 418.56       CUDA Version: 10.1     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce GTX 106...  Off  | 00000000:01:00.0  On |                  N/A |
|  0%   54C    P8    10W / 120W |    433MiB /  6077MiB |      4%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
|    0      1557      G   /usr/lib/xorg/Xorg                           190MiB |
|    0      1820      G   /usr/bin/gnome-shell                         174MiB |
|    0      7820      G   ...equest-channel-token=303407235874180773    65MiB |
+-----------------------------------------------------------------------------+
```

从这个表格中我们得到了关于显示卡的如下信息：

  * 它正在使用版本号为 418.56 的开源驱动。
  * 显示卡的当前温度为 54.0ºC，并且风扇的使用量为 0%。
  * 电量的消耗非常低：仅仅 10W。
  * 总量为 6GB 的 vram（视频随机存取存储器），只使用了 433MB。
  * vram 正在被 3 个进程使用，他们的 ID 分别为 1557、1820 和 7820。



[推荐阅读：现在你可以在 Linux 终端中使用谷歌了！][11]


大部分这些事实或数值都清晰地表明，我们没有在玩任何消耗系统资源的游戏或处理大负载的任务。当我们开始玩游戏、处理视频或其他类似任务时，这些值就会开始上升。

#### 结论

即便我们有 GUI 工具，但我还是发现这两个命令对于实时监控硬件非常的顺手。

你将如何去使用它们呢？你可以通过阅读他们的 man 手册来学习更多关于这些工具的使用技巧。

你有其他偏爱的工具吗？在评论里分享给我们吧 ;)。

玩得开心！

![化身][12]

### Alejandro Egea-Abellán

It's FOSS 社区贡献者

我对电子、语言学、爬虫学、计算机（尤其是 GNU/Linux 和 FOSS）有着浓厚兴趣。我通过了 LPIC-2 认证，目前在西班牙穆尔西亚教育部终身学习部们担任技术顾问和 Moodle（译注：Moodle 是一个开源课程管理系统）管理员。我是终身学习、知识共享和计算机用户自由的坚定信奉者。

--------------------------------------------------------------------------------

via: https://itsfoss.com/monitor-cpu-gpu-temp-linux/

作者：[It's FOSS Community][a]
选题：[lujun9972][b]
译者：[cycoe](https://github.com/cycoe)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/install-steam-ubuntu-linux/
[2]: https://itsfoss.com/steam-play-proton/
[3]: https://itsfoss.com/best-video-editing-software-linux/
[4]: https://www.blender.org/
[5]: https://slimbook.es/
[6]: https://zorinos.com/
[7]: https://itsfoss.com/wp-content/uploads/2019/04/monitor-cpu-gpu-temperature-linux-800x450.png
[8]: https://itsfoss.com/check-laptop-cpu-temperature-ubuntu/
[9]: https://itsfoss.com/best-command-line-games-linux/
[10]: https://itsfoss.com/install-additional-drivers-ubuntu/
[11]: https://itsfoss.com/review-googler-linux/
[12]: https://itsfoss.com/wp-content/uploads/2019/04/EGEA-ABELLAN-Alejandro.jpg
