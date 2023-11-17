[#]: subject: "An Interesting Bluetooth App for Linux Just Appeared!"
[#]: via: "https://news.itsfoss.com/bluetooth-app-linux-overskride/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16315-1.html"

Overskride：刚刚出现的一款有趣的 Linux 蓝牙应用！
======

![][0]

> 通过这个全新的应用可以实现所有蓝牙功能！

一款适用于 Linux 的新应用已经出现，它可能是满足你所有蓝牙需求的一站式应用。

这款名为 “**Overskride**” 的开源应用首次发布。尽管它还处于开发阶段，但已经提供了一些不错的功能。

请允许我带你看一下。

### Overskride：可以期待什么？

![][1]

Overskride 将会吸引 Rust 爱好者，因为它**主要是用 Rust 语言**编写的，带有 **GTK4/libadwaita 风格**。

根据开发人员的说法，它是一个**简单的蓝牙和 Obex 客户端** _（未来计划）_，无论使用什么桌面环境或窗口管理器都可以工作。

一些主要功能包括：

   * 信任/阻止设备。
   * 能够发送/接收文件。
   * 设置连接超时时间。
   * 支持配置适配器。

查看上面的截图，你可以看到自定义蓝牙设备和连接的所有基本选项，包括适配器名称。

当然，考虑到这是该应用的第一次发布，人们不应该抱有太高的期望。因此，还有改进的空间。

以下是 **Overskride 的一些预览**，以查看它提供的功能。

我在 Ubuntu 22.04 LTS 和 GNOME 42.9 上使用提供的 Flatpak 包进行安装。在此安装上运行似乎没有任何问题。

Overskride 能够检测到我的智能手机，并提供多种配置选项。

![][3]

你可以将设备添加到受信任列表或阻止列表、重命名并发送文件。

我尝试了**文件传输功能**，但在此之前，我必须使用 [Flatseal][4] 允许访问用户文件，以便它可以读取我系统上的文件。

![][5]

我在手机上接受文件传输后，传输开始。速度还可以，文件确实完整地到达那里，没有任何问题。

![][6]

我必须说，在其首次发布时，开发人员为我们提供了一个有用的实用程序。我很高兴看到其未来版本将提供什么样的改进。

一位 Reddit 用户 [询问][7] 是否有任何计划**支持显示无线耳机的电池百分比**。对此，开发人员提到这样做很棘手，因为 每个设备都遵循不同的规范，这使得这一目标更难实现。

### 📥 获得 Overskride

目前，Overskride 只能通过 [GitHub 仓库][9] 以 Flatpak 软件包的形式提供。或者，你也可以从源代码开始编译。

> **[Overskride (GitHub)][10]**

我希望开发者在发布稳定版本后将其发布在 [Flathub][11] 上，以便用户可以使用。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/bluetooth-app-linux-overskride/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2023/10/Overskride_1.png
[2]: https://news.itsfoss.com/content/images/2023/04/Follow-us-on-Google-News.png
[3]: https://news.itsfoss.com/content/images/2023/10/Overskride_2.png
[4]: https://itsfoss.com/flatseal/
[5]: https://news.itsfoss.com/content/images/2023/10/Overskride_3.png
[6]: https://news.itsfoss.com/content/images/2023/10/Overskride_4.png
[7]: https://www.reddit.com/r/gnome/comments/17a5m99/full_release_of_my_bluetooth_app_d/k5b3ybg/
[9]: https://github.com/kaii-lb/overskride
[10]: https://github.com/kaii-lb/overskride/releases/
[11]: https://flathub.org/en
[0]: https://img.linux.net.cn/data/attachment/album/202310/25/092956c1jb1bqxx8qryrju.jpg