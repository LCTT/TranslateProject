[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12086-1.html)
[#]: subject: (How to Find Which Graphics Card do You Have in Linux?)
[#]: via: (https://itsfoss.com/check-graphics-card-linux/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何知道你的 Linux 用的哪种显卡？
======

无论是 [Nvidia][1] 还是 [Radeon][2] 或者 Intel，它们的显卡都可能在 Linux 中有问题。当你要对图形问题进行故障排除时，首先要了解系统中装有哪种显卡。

Linux 有几个命令可以检查硬件信息。你可以使用它们来检查你有哪些显卡（也称为视频卡）。让我向你展示一些命令来获取 Linux 中的 GPU 信息。

### 在 Linux 命令行中检查显卡详细信息

![][3]

#### 使用 lspci 命令查找显卡

`lspci` 命令显示通过 [PCI][4]（<ruby>外设组件互连<rt>Peripheral Component Interconnect</rt></ruby>）总线连接的设备的信息。基本上，此命令提供有关系统从键盘和鼠标到声卡、网卡和显卡的所有外设的详细信息。

默认情况下，你会有大量的此类外设列表。这就是为什么你需要用 `grep` 命令过滤出显卡的原因：

```
lspci | grep VGA
```

这应该会显示一行有关你显卡的信息：

```
abhishek@itsfoss:~$ lspci | grep VGA
00:02.0 VGA compatible controller: Intel Corporation HD Graphics 620 (rev 02)
```

如你所见，我的系统中有 Intel HD 620 显卡。

#### 在 Linux 中使用 lshw 命令获取显卡详细信息

`lspci` 命令足以查看你的显卡，但是并不能告诉你很多信息。你可以使用 `lshw` 命令获取有关它的更多信息。

此命令要求你有 root 用户权限。你需要以这种方式查找视频卡（显卡）信息：

```
sudo lshw -C video
```

正如你在下面的输出中看到的那样，此命令提供了有关显卡的更多信息，例如时钟频率、位宽、驱动等。

```
abhishek@itsfoss:~$ sudo lshw -C video
[sudo] password for abhishek:
  *-display
       description: VGA compatible controller
       product: HD Graphics 620
       vendor: Intel Corporation
       physical id: 2
       bus info: [email protected]:00:02.0
       version: 02
       width: 64 bits
       clock: 33MHz
       capabilities: pciexpress msi pm vga_controller bus_master cap_list rom
       configuration: driver=i915 latency=0
       resources: irq:139 memory:db000000-dbffffff memory:90000000-9fffffff ioport:f000(size=64) memory:c0000-dffff
```

#### 附赠技巧：以图形方式检查显卡详细信息

并非必须使用命令行在 Linux 中查找显卡详细信息。大多数 Linux 发行版（或者应该说是桌面环境）在设置中提供了必要的详细信息。

例如，如果你使用的是 [GNOME 桌面环境][5]，那么可以进入“设置”的“关于”部分来检查详细信息。[Ubuntu 20.04][6] 中看上去像这样：

![Graphics card information check graphically][7]

我希望这个快速技巧对你有所帮助。你也可以使用相同的命令来[查找网卡][8]和 [Linux 中的 CPU 信息][9]。

如果你有任何疑问或建议，请随时发表评论。

--------------------------------------------------------------------------------

via: https://itsfoss.com/check-graphics-card-linux/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.nvidia.com/en-us/
[2]: https://www.amd.com/en/graphics/radeon-rx-graphics
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/check-gpu-info-linux.jpg?ssl=1
[4]: https://en.wikipedia.org/wiki/Conventional_PCI
[5]: https://www.gnome.org/
[6]: https://itsfoss.com/ubuntu-20-04-release-features/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/ubuntu-gpu-check.jpg?ssl=1
[8]: https://itsfoss.com/find-network-adapter-ubuntu-linux/
[9]: https://linuxhandbook.com/check-cpu-info-linux/
