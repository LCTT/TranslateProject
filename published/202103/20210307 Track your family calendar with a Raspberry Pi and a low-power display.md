[#]: subject: (Track your family calendar with a Raspberry Pi and a low-power display)
[#]: via: (https://opensource.com/article/21/3/family-calendar-raspberry-pi)
[#]: author: (Javier Pena https://opensource.com/users/jpena)
[#]: collector: (lujun9972)
[#]: translator: (wyxplus)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13222-1.html)

利用树莓派和低功耗显示器来跟踪你的家庭日程表
======

> 通过利用开源工具和电子墨水屏，让每个人都清楚家庭的日程安排。

![](https://img.linux.net.cn/data/attachment/album/202103/21/091512dkbgb3vzgjrz2935.jpg)

有些家庭的日程安排很复杂：孩子们有上学活动和放学后的活动，你想要记住的重要事情，每个人都有多个约会等等。虽然你可以使用手机和应用程序来关注所有事情，但在家中放置一个大型低功耗显示器以显示家人的日程不是更好吗？电子墨水日程表刚好满足！

![E Ink calendar][2]

### 硬件

这个项目是作为假日项目开始，因此我试着尽可能多的旧物利用。其中包括一台已经闲置了太长时间树莓派 2。由于我没有电子墨水屏，因此我需要购买一个。幸运的是，我找到了一家供应商，该供应商为支持树莓派的屏幕提供了 [开源驱动程序和示例][4]，该屏幕使用 [GPIO][5] 端口连接。

我的家人还想在不同的日程表之间切换，因此需要某种形式的输入。我没有添加 USB 键盘，而是选择了一种更简单的解决方案，并购买了一个类似于在 [这篇文章][6] 中所描述 1x4 大小的键盘。这使我可以将键盘连接到树莓派中的某些 GPIO 端口。

最后，我需要一个相框来容纳整个设置。虽然背面看起来有些凌乱，但它能完成工作。

![Calendar internals][7]

### 软件

我从 [一个类似的项目][8] 中获得了灵感，并开始为我的项目编写 Python 代码。我需要从两个地方获取数据：

  * 天气信息：从 [OpenWeather API][9] 获取
  * 时间信息：我打算使用 [CalDav 标准][10] 连接到一个在我家服务器上运行的日程表

由于必须等待一些零件的送达，因此我使用了模块化的方法来进行输入和显示，这样我可以在没有硬件的情况下调试大多数代码。日程表应用程序需要驱动程序，于是我编写了一个 [Pygame][11] 驱动程序以便能在台式机上运行它。

编写代码最好的部分是能够重用现有的开源项目，所以访问不同的 API 很容易。我可以专注于设计用户界面，其中包括每个人的周历和每个人的日历，以及允许使用小键盘来选择日程。并且我花时间又添加了一些额外的功能，例如特殊日子的自定义屏幕保护程序。

![E Ink calendar screensaver][12]

最后的集成步骤将确保我的日程表应用程序将在启动时运行，并且能够容错。我使用了一个基本的 [树莓派系统][13] 镜像，并将该应用程序配置到 systemd 服务，以便它可以在出现故障和系统重新启动依旧运行。

做完所有工作，我把代码上传到了 [GitHub][14]。因此，如果你要创建类似的日历，可以随时查看并重构它！

### 结论

日程表已成为我们厨房中的日常工具。它可以帮助我们记住我们的日常活动，甚至我们的孩子在上学前，都可以使用它来查看日程的安排。

对我而言，这个项目让我感受到开源的力量。如果没有开源的驱动程序、库以及开放 API，我们依旧还在用纸和笔来安排日程。很疯狂，不是吗？

需要确保你的日程不冲突吗？学习如何使用这些免费的开源项目来做到这点。

------
via: https://opensource.com/article/21/3/family-calendar-raspberry-pi

作者：[Javier Pena][a]
选题：[lujun9972][b]
译者：[wyxplus](https://github.com/wyxplus)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jpena
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/calendar-coffee.jpg?itok=9idm1917 "Calendar with coffee and breakfast"
[2]: https://opensource.com/sites/default/files/uploads/calendar.jpg "E Ink calendar"
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://github.com/waveshare/e-Paper
[5]: https://opensource.com/article/19/3/gpio-pins-raspberry-pi
[6]: https://www.instructables.com/1x4-Membrane-Keypad-w-Arduino/
[7]: https://opensource.com/sites/default/files/uploads/calendar_internals.jpg "Calendar internals"
[8]: https://github.com/zli117/EInk-Calendar
[9]: https://openweathermap.org
[10]: https://en.wikipedia.org/wiki/CalDAV
[11]: https://github.com/pygame/pygame
[12]: https://opensource.com/sites/default/files/uploads/calendar_screensaver.jpg "E Ink calendar screensaver"
[13]: https://www.raspberrypi.org/software/
[14]: https://github.com/javierpena/eink-calendar
