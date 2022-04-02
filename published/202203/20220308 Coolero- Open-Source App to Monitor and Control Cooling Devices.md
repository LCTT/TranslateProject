[#]: subject: "Coolero: Open-Source App to Monitor and Control Cooling Devices"
[#]: via: "https://itsfoss.com/coolero/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14350-1.html"

Coolero：监测和控制冷却设备的开源应用
======

> 正在寻找一个 GUI 程序来管理 Linux 上的 AIO 和其他冷却设备么？让我们来了解一下 Coolero，以获得一些帮助。

![](https://img.linux.net.cn/data/attachment/album/202203/12/092109g9stmnmmmnootown.jpg)

说到 Linux，我们无法从 NZXT、Corsair、MSI、ASUS 等品牌那里获得官方软件支持来管理 PC 上的硬件组件。

虽然有开源的驱动/工具可以使事情顺利进行，但在具有图形用户界面（GUI）的程序中，它仍然是一项正在进行的工作。例如，[配置游戏鼠标][1] 或 [在 Linux 上设置 Razer 设备][1]。

幸运的是，这些年来情况有所改善，现在可以在 Linux 上管理/调整各种最新的外围设备和组件。

其中一个改进就是有了一个开源的 GUI 程序来管理和监控冷却设备，即 Coolero。

**注意：** 该程序正在积极开发中，并慢慢向其第一个主要版本发展。

### Coolero：轻松地管理你的水冷

![][2]

当我去年升级我的电脑时，我对我的 AIO（All-in-One）水冷（Corsair Hydro 100i Pro XT）缺乏软件支持感到恼火。

这不仅仅是控制 RGB 灯光（为了美观），而且我找不到一个方便的方法（使用 GUI 程序）来平衡风扇配置。

现在，有了 [Coolero][3] 就可以做到了。Coolero 是一个使用 [liquidctl][4] 和其他一些库来控制冷却设备的前端，主要包括 AIO、风扇集线器/控制器，还有 PSU 和一些 RGB 照明支持。

它支持一系列的水冷和一些 PSU。你可以在其 GitLab 页面上获得所有支持设备的细节。请注意，对一些冷却器的支持仍然是试验性的，而且你还不能让你的 Kraken Z 上的 LCD 屏幕与它一起工作。

让我强调一下主要的特点。

### Coolero 的特点

![][5]

现在有无数的冷却设备。但是，Coolero 支持一些流行的选项和它的变体来控制基本功能：

  * 系统概览图
  * CPU 温度/负载
  * GPU 温度/负载
  * 支持多个设备，以及同一设备的多个版本。
  * 能够使用该图表定制风扇配置文件。
  * 提供了几个预设的风扇配置文件。
  * 能够调整 RGB 照明配置文件。
  * 保存配置文件并在启动时应用它。

用户界面简单易懂，易于使用。你可以与图表互动以启用/禁用对特定组件的监控。

你所连接的 AIO 或控制器应该作为单独的组件出现在界面上，使你很容易控制它们。

![][6]

你会有两种类型的功能，控制风扇和灯光（如果有的话）。我使用风扇图表来定制我的 AIO 上的风扇配置文件。

根据我的简单测试，它与 Corsair AIO 工作很好。你可以用它来尝试 NZXT 冷却器、PSU、控制器和智能设备（或集线器）。

### 在 Linux 中安装 Coolero

Coolero 以 AppImage、Flatpak（通过 [Flathub][7]）的形式提供，或者你可以从源代码中构建它。

如果你是 Linux 的新手，你可能想参考我们的 [AppImage 指南][8] 和 [Flatpak 帮助资源][9]。

要探索更多关于它的信息，请前往下面链接的 GitLab 页面。

- [Coolero][3]

### 总结

如果你有 AIO、集线器和控制器需要按照你的要求进行调整，那么 Coolero 是一个令人兴奋的项目，值得关注。

虽然你可以尝试使用一些命令行工具，但这并不是实现你的 PC 中的组件的基本控制的最方便的方法。

你试过了吗？你用什么来管理你的 Linux 系统上的 AIO 或冷却器？请在下面的评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/coolero/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/set-up-razer-devices-linux/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/coolero-ui-home.png?resize=800%2C468&ssl=1
[3]: https://gitlab.com/codifryed/coolero
[4]: https://github.com/liquidctl/liquidctl
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/coolero-fan-settings.png?resize=800%2C443&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/coolero-fan.png?resize=800%2C443&ssl=1
[7]: https://flathub.org/apps/details/org.coolero.Coolero
[8]: https://itsfoss.com/appimagepool/
[9]: https://itsfoss.com/flatpak-guide/
