[#]: collector: (lujun9972)
[#]: translator: (wxy)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11248-1.html)
[#]: subject: (Unboxing the Raspberry Pi 4)
[#]: via: (https://opensource.com/article/19/8/unboxing-raspberry-pi-4)
[#]: author: (Anderson Silva https://opensource.com/users/ansilvahttps://opensource.com/users/bennuttall)

树莓派 4 开箱记
======

> 树莓派 4 与其前代产品相比具有令人印象深刻的性能提升，而入门套件使其易于快速启动和运行。

![](https://img.linux.net.cn/data/attachment/album/201908/20/091730rl99q2ahycd4sz9h.jpg)

当树莓派 4 [在 6 月底宣布发布][2]时，我没有迟疑，在发布的同一天就从 [CanaKit][3] 订购了两套树莓派 4 入门套件。1GB RAM 版本有现货，但 4GB 版本要在 7 月 19 日才能发货。由于我想两个都试试，这两个都订购了让它们一起发货。

![CanaKit's Raspberry Pi 4 Starter Kit and official accessories][4]

这是我开箱我的树莓派 4 后所看到的。

### 电源

树莓派 4 使用 USB-C 连接器供电。虽然 USB-C 电缆现在非常普遍，但你的树莓派 4 [可能不喜欢你的USB-C 线][5]（至少对于树莓派 4 的第一版如此）。因此，除非你确切知道自己在做什么，否则我建议你订购含有官方树莓派充电器的入门套件。如果你想尝试手头的充电设备，那么该设备的输入是 100-240V ~ 50/60Hz 0.5A，输出为 5.1V - 3.0A。

![Raspberry Pi USB-C charger][6]

### 键盘和鼠标

官方的键盘和鼠标是和入门套件是[分开出售][7]的，总价 25 美元，并不很便宜，因为你的这台树莓派电脑也才只有 35 到 55 美元。但树莓派徽标印在这个键盘上（而不是 Windows 徽标），并且外观相宜。键盘也是 USB 集线器，因此它允许你插入更多设备。我插入了我的 [YubiKey][8] 安全密钥，它运行得非常好。我会把键盘和鼠标分类为“值得拥有”而不是“必须拥有”。你的常规键盘和鼠标应该也可以正常工作。

![Official Raspberry Pi keyboard \(with YubiKey plugged in\) and mouse.][9]

![Raspberry Pi logo on the keyboard][10]

### Micro-HDMI 电缆

可能让一些人惊讶的是，与带有 Mini-HDMI 端口的树莓派 Zero 不同，树莓派 4 配备了 Micro-HDMI。它们不是同一个东西！因此，即使你手头有合适的 USB-C 线缆/电源适配器、鼠标和键盘，也很有可能需要使用 Micro-HDMI 转 HDMI 的线缆（或适配器）来将你的新树莓派接到显示器上。

### 外壳

树莓派的外壳已经有了很多年，这可能是树莓派基金会销售的第一批“官方”外围设备之一。有些人喜欢它们，而有些人不喜欢。我认为将一个树莓派放在一个盒子里可以更容易携带它，可以避免静电和针脚弯曲。

另一方面，把你的树莓派装在盒子里会使电路板过热。这款 CanaKit 入门套件还配备了处理器散热器，这可能有所帮助，因为较新的树莓派已经[以运行相当热而闻名][11]了。

![Raspberry Pi 4 case][12]

### Raspbian 和 NOOBS

入门套件附带的另一个东西是 microSD 卡，其中预装了树莓派 4 的 [NOOBS][13] 操作系统的正确版本。（我拿到的是 3.19 版，发布于 2019 年 6 月 24 日）。如果你是第一次使用树莓派并且不确定从哪里开始，这可以为你节省大量时间。入门套件中的 microSD 卡容量为 32GB。

插入 microSD 卡并连接所有电缆后，只需启动树莓派，引导进入 NOOBS，选择 Raspbian 发行版，然后等待安装。

![Raspberry Pi 4 with 4GB of RAM][14]

我注意到在安装最新的 Raspbian 时有一些改进。（如果它们已经出现了一段时间，请原谅我 —— 自从树莓派 3 出现以来我没有对树莓派进行过全新安装。）其中一个是 Raspbian 会要求你在安装后的首次启动为你的帐户设置一个密码，另一个是它将运行软件更新（假设你有网络连接）。这些都是很大的改进，有助于保持你的树莓派更安全。我很希望能有一天在安装时看到加密 microSD 卡的选项。

![Running Raspbian updates at first boot][15]

![Raspberry Pi 4 setup][16]

运行非常顺畅！

### 结语

虽然 CanaKit 不是美国唯一授权的树莓派零售商，但我发现它的入门套件的价格物超所值。

到目前为止，我对树莓派 4 的性能提升印象深刻。我打算尝试用一整个工作日将它作为我唯一的计算机，我很快就会写一篇关于我探索了多远的后续文章。敬请关注！

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/8/unboxing-raspberry-pi-4

作者：[Anderson Silva][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/ansilvahttps://opensource.com/users/bennuttall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/raspberrypi4_board_hardware.jpg?itok=KnFU7NvR (Raspberry Pi 4 board, posterized filter)
[2]: https://opensource.com/article/19/6/raspberry-pi-4
[3]: https://www.canakit.com/raspberry-pi-4-starter-kit.html
[4]: https://opensource.com/sites/default/files/uploads/raspberrypi4_canakit.jpg (CanaKit's Raspberry Pi 4 Starter Kit and official accessories)
[5]: https://www.techrepublic.com/article/your-new-raspberry-pi-4-wont-power-on-usb-c-cable-problem-now-officially-confirmed/
[6]: https://opensource.com/sites/default/files/uploads/raspberrypi_usb-c_charger.jpg (Raspberry Pi USB-C charger)
[7]: https://www.canakit.com/official-raspberry-pi-keyboard-mouse.html?defpid=4476
[8]: https://www.yubico.com/products/yubikey-hardware/
[9]: https://opensource.com/sites/default/files/uploads/raspberrypi_keyboardmouse.jpg (Official Raspberry Pi keyboard (with YubiKey plugged in) and mouse.)
[10]: https://opensource.com/sites/default/files/uploads/raspberrypi_keyboardlogo.jpg (Raspberry Pi logo on the keyboard)
[11]: https://www.theregister.co.uk/2019/07/22/raspberry_pi_4_too_hot_to_handle/
[12]: https://opensource.com/sites/default/files/uploads/raspberrypi4_case.jpg (Raspberry Pi 4 case)
[13]: https://www.raspberrypi.org/downloads/noobs/
[14]: https://opensource.com/sites/default/files/uploads/raspberrypi4_ram.jpg (Raspberry Pi 4 with 4GB of RAM)
[15]: https://opensource.com/sites/default/files/uploads/raspberrypi4_rasbpianupdate.jpg (Running Raspbian updates at first boot)
[16]: https://opensource.com/sites/default/files/uploads/raspberrypi_setup.jpg (Raspberry Pi 4 setup)
