[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12893-1.html)
[#]: subject: (How to Go Full Dark Mode With LibreOffice)
[#]: via: (https://itsfoss.com/libreoffice-dark-mode/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

如何在 LibreOffice 中完全启用深色模式
======

![](https://img.linux.net.cn/data/attachment/album/202012/07/083812n0zgss9qt175pm9z.jpg)

[LibreOffice][1] 是一款自由开源的跨平台办公生产力软件。如果你没有充分利用它，那么必须看下 [LibreOffice 小技巧][2]。

甚至在非编程人员中，深色主题也越来越受欢迎。它减轻了眼睛的压力，特别适合长时间使用屏幕。有人认为，这使文本看起来清晰明了，有助于提高生产率。

如今，某些 Linux 发行版例如 [Ubuntu 带有深色模式][3]，使你的系统具有更暗的色彩。当你打开<ruby>深色模式<rt>dark mode</rt></ruby>时，某些应用将自动切换到深色模式。

LibreOffice 也会这样，但你编辑的主区域除外：

![LibreOffice semi dark mode matching with the system theme][4]

你可以更改它。如果要让 LibreOffice 进入完全深色模式，只需更改一些设置。让我告诉你如何做。

### 如何在 LibreOffice 中完全启用深色模式

如前所述，你需要先启用系统范围的深色模式。这样可以确保窗口颜色（或标题栏）与应用内深色完全融合。

接下来，打开套件中的**任意** LibreOffice 应用，例如 **Writer**。然后从菜单中，依次点击 **Tools -> Options -> Application Colors**，然后选择 **Document background 和 Application background** 为 **Black** 或 **Automatic**（任意适合你的方式）。

![][5]

如果图标不是深色，那么可以从菜单（如下图所示）中更改它们，**Tools -> Options -> View** ，我在 MX Linux 上的个人选择是 Ubuntu 的 [Yaru][6] 图标样式（如果你使用的图标包为深色版本，请选择它） 。

![][7]

当然，你也可以尝试其他 Linux 发行版的 [icon 主题][8]。

最终结果应如下所示：

![][9]

#### LibreOffice flatpak 软件包的其他技巧

如果你使用的是 LibreOffice 套件的 [Flatpak 软件包][10]，那么 LibreOffice 的标题区域（或菜单区域）可能看起来是白色的。在这种情况下，你可以尝试进入 **Tools -> Options -> Personalization**，然后选择 “**灰色主题**”，如下截图所示。

![][11]

它并不完全是黑色的，但应该可以使外观看起来更好。希望可以帮助你切换到深色主题的 LibreOffice 体验！

#### 总结

深色主题逐渐开始在我们的台式机中占主导地位，它具有现代品味并减少了眼睛疲劳，尤其是在弱光条件下。

LibreOffice 使你可以自由地将工作环境切换为深色主题或保留浅色主题元素。实际上，你将有大量的自定义选项来调整你喜欢的内容。你是否已在 LibreOffice 上切换为深色主题？你首选哪种颜色组合？在下面的评论中让我们知道！

--------------------------------------------------------------------------------

via: https://itsfoss.com/libreoffice-dark-mode/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.libreoffice.org
[2]: https://itsfoss.com/libreoffice-tips/
[3]: https://itsfoss.com/dark-mode-ubuntu/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/libreOffice-dark-mode.png?resize=799%2C450&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/11/1-libreoffice-application-colours.png?resize=800%2C551&ssl=1
[6]: https://extensions.libreoffice.org/en/extensions/show/yaru-icon-theme
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/11/2-libreoffice-iconstyle-1.png?resize=800%2C531&ssl=1
[8]: https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/3-libreoffice-dark.png?resize=800%2C612&ssl=1
[10]: https://itsfoss.com/what-is-flatpak/
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/11/libre-office-personalization.png?resize=800%2C636&ssl=1
