[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11245-1.html)
[#]: subject: (How To Turn On And Shutdown The Raspberry Pi [Absolute Beginner Tip])
[#]: via: (https://itsfoss.com/turn-on-raspberry-pi/)
[#]: author: (Chinmay https://itsfoss.com/author/chinmay/)

如何打开和关闭树莓派（绝对新手）
======

> 这篇短文教你如何打开树莓派以及如何在之后正确关闭它。

![](https://img.linux.net.cn/data/attachment/album/201908/19/192825rlrjy3sj77j7j79y.jpg)

[树莓派][1]是[最流行的 SBC（单板计算机）][2]之一。如果你对这个话题感兴趣，我相信你已经有了一个树莓派。我还建议你使用[其他树莓派配件][3]来开始使用你的设备。

你已经准备好打开并开始使用。与桌面和笔记本电脑等传统电脑相比，它有相似以及不同之处。

今天，让我们继续学习如何打开和关闭树莓派，因为它并没有真正的“电源按钮”。

在本文中，我使用的是树莓派 3B+，但对于所有树莓派变体都是如此。

### 如何打开树莓派

![Micro USB port for Power][7]

micro USB 口为树莓派供电，打开它的方式是将电源线插入 micro USB 口。但是开始之前，你应该确保做了以下事情。

* 根据官方[指南][8]准备带有 Raspbian 的 micro SD 卡并插入 micro SD 卡插槽。
* 插入 HDMI 线、USB 键盘和鼠标。
* 插入以太网线（可选）。

成上述操作后，请插入电源线。这会打开树莓派，显示屏将亮起并加载操作系统。

如果您将其关闭并且想要再次打开它，则必须从电源插座（首选）或从电路板的电源端口拔下电源线，然后再插上。它没有电源按钮。

### 关闭树莓派

关闭树莓派非常简单，单击菜单按钮并选择关闭。

![Turn off Raspberry Pi graphically][9]

或者你可以在终端使用 [shutdown 命令][10]

```
sudo shutdown now
```

`shutdown` 执行后**等待**它完成，接着你可以关闭电源。

再说一次，树莓派关闭后，没有真正的办法可以在不关闭再打开电源的情况下打开树莓派。你可以使用 GPIO 打开树莓派，但这需要额外的改装。

*注意：Micro USB 口往往是脆弱的，因此请关闭/打开电源，而不是经常拔出插入 micro USB 口。

好吧，这就是关于打开和关闭树莓派的所有内容，你打算用它做什么？请在评论中告诉我。

--------------------------------------------------------------------------------

via: https://itsfoss.com/turn-on-raspberry-pi/

作者：[Chinmay][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/chinmay/
[b]: https://github.com/lujun9972
[1]: https://www.raspberrypi.org/
[2]: https://linux.cn/article-10823-1.html
[3]: https://itsfoss.com/things-you-need-to-get-your-raspberry-pi-working/
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/04/raspberry-pi-3-microusb.png?fit=800%2C532&ssl=1
[8]: https://www.raspberrypi.org/documentation/installation/installing-images/README.md
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/04/Raspbian-ui-menu.jpg?fit=800%2C492&ssl=1
[10]: https://linuxhandbook.com/linux-shutdown-command/
