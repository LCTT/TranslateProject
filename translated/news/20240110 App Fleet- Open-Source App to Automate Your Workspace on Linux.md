[#]: subject: "App Fleet: Open-Source App to Automate Your Workspace on Linux"
[#]: via: "https://news.itsfoss.com/app-fleet/"
[#]: author: "Sourav Rudra https://news.itsfoss.com/author/sourav/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

App Fleet：在 Linux 上实现工作空间自动化的开源应用
======
开源工作区自动化工具。听起来不错！

2024 年刚刚开始，你是否对必须在不同应用中完成的大量工作感到不知所措？ 为什么不使用工作区管理工具来简化这一切呢？

App Fleet 是**一个新的开源工作区管理器和启动自动化工具**，主要为 Linux 开发。我必须说，最后一点是你不常听到的！ 😃

在这里，我尝试一下 App Fleet，并与大家分享一下我的经验。

🚧

该应用相当新，正在积极开发中。它可能会也可能不会按照你期望的方式工作。

### App Fleet：主要功能 ⭐

![][1]

App Fleet 使用 **Flutter 框架** 编写，**针对 GNOME 桌面环境**，并且作为一个相当新的应用，它的开发进展相当顺利，不时定期发布。

一些**关键功能**包括：

   * **支持大多数应用。**
   * **直观的用户界面。**
   * **将应用设置到特定工作空间。**



#### ⚙️如何安装App Fleet？

![][2]

不幸的是，App Fleet **不能以 Flatpak、Snap、AppImage 或任何其他流行的打包格式使用**。

据开发人员称，App Fleet 需要系统范围的读取访问权限，并且使用这些格式对其进行打包对于此类应用来说是不可行的。

**安装 App Fleet 最直接的方法**是运行以下命令（网络安装程序脚本）：

```

    curl https://raw.githubusercontent.com/omegaui/app_fleet/main/network-install.sh | bash

```

对于大多数人来说，上述命令是推荐的解决方案。

如果你愿意，你可以从预编译的捆绑包或源代码中安装它。有关更多信息，你可以访问其 [GitHub 仓库][3]。

[App Fleet (GitHub)][3]

#### 初步印象👨‍💻

将其安装到我的 PC 上后，我启动了 App Fleet，然后迎接我的是一个面无表情的鬼魂，说这个系统上没有工作区配置。

![][4]

因此，我单击 “_Create Now_” 开始，并为工作区配置指定了一个合适的名称。

![][5]

然后我选择了它的图标。它有很多选项，也可以自由上传自定义选项。

![][6]

应用选择屏幕列出了我的所有应用，因此我选择了我在工作时经常使用的应用。

![][7]

我还可以**为这些应用提供特定的工作区**，以便它们可以直接在指定的工作区中启动，从而无需手动放置它们。（_这对我来说效果不太好，稍后会详细介绍。_）

![][8]

还有**能够从系统或外部存储手动添加应用**，我可以在其中为其指定名称、等待时间等。

![][9]

我还可以对添加的应用进行相同的调整。如果你不想被快速连续启动的应用数量淹没，“_等待时间_”设置可能会很有用。

![][10]

设置完所有内容后，我单击右上角的 “_Save_” 图标来保存我的工作区配置。

![][11]

然后，App Fleet 的主屏幕向我显示了创建的工作区配置。

![][12]

它还启动了 **App Fleet launcher** ，这是一个看起来像小部件的东西，让我启动保存的工作区配置。

![][13]

因此，为了测试它的工作原理，我快速重新启动了系统，当我登录系统时，启动器会自动弹出。正如你在下面看到的，**启动器是一个简洁的小东西**，并不碍事。

![][14]

但是，你可能已经注意到，**应用没有在我设置它们启动的工作区上启动**。尽管应用的启动和定制的等待时间确实开始了。

[官方网站][15] 提到 Ubuntu 22.10 已对其进行了“_精细测试_”，因此这一点值得注意。

当然，该应用是全新的。因此，我们不能期望一切都完美。

但是，如果你问我，**App Fleet 有很大的潜力**，如果你是使用 [Auto Move Windows][16] GNOME 扩展的人，这可能是一个非常方便的替代方案。

我是否说过 **App Fleet 不仅仅限于 GNOME？**

你还可以在其他[桌面环境][17]上使用它，例如 KDE Plasma、Budgie 和 Cinnamon。

_💬 那么，你对 App Fleet 有何看法？ 有类似的工具吗？ 它对你来说效果如何？ 请在下面的评论中告诉我！_

* * *

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/app-fleet/

作者：[Sourav Rudra][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/sourav/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_a.png
[2]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_b.png
[3]: https://github.com/omegaui/app_fleet
[4]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_c.png
[5]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_d.png
[6]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_e.png
[7]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_f.png
[8]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_g.png
[9]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_i.png
[10]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_j.png
[11]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_h.png
[12]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_k.png
[13]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_l.png
[14]: https://news.itsfoss.com/content/images/2024/01/App_Fleet_m.gif
[15]: https://omegaui.github.io/app_fleet_webpage/
[16]: https://extensions.gnome.org/extension/16/auto-move-windows/
[17]: https://itsfoss.com/what-is-desktop-environment/
[18]: https://itsfoss.com/content/images/size/w256h256/2022/12/android-chrome-192x192.png
