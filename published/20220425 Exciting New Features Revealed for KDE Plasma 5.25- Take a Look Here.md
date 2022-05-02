[#]: subject: "Exciting New Features Revealed for KDE Plasma 5.25! Take a Look Here"
[#]: via: "https://news.itsfoss.com/plasma-5-25-features/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "PeterPan0106"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14532-1.html"

KDE Plasma 5.25 推出了令人激动的新特性！先睹为快
======

> 作为 KDE 的下一次桌面环境升级，Plasma 5.25 包含了一些令人耳目一新的新功能！在这里，我们可以看到它的一些新功能。敬请阅读。

![](https://news.itsfoss.com/wp-content/uploads/2022/04/kde-5-25-release.png)

[KDE Plasma 5.24][1] 提供了关于 breeze 主题的更新，并对多任务“概览”界面进行了修改。

现在，开发者们已经准备好向大家介绍 KDE Plasma 5.25 令人激动的新特性。

### KDE Plasma 5.25 ：拥有哪些新功能？

Nate Graham 在一篇博文中着重介绍了一些最为有趣的变化，让我们一起先睹为快。

#### 有选择地应用全局主题的部分样式

![来源： Pointiestick Blog / Nate Graham][2]

当你在系统设置里应用一个全局主题时，系统会提示你应用全部的样式或是仅仅应用其中一部分样式。

例如，当你更换桌面背景以及应用样式时，你可能并不愿意更换鼠标指针和图标。

总体而言，当你在基于 KDE 的系统上应用全局主题时，你将能够更为自由地设置你的样式。

这个令人惊叹的 [贡献][3] 来自 Dominic Hayes。

#### 根据当前壁纸自动生成强调色

尽管能够使用预设或自定义的强调色已经很好了。

但在 KDE Plasma 5.25 上，他们更进一步，允许让系统根据当前壁纸自动生成并使用强调色。

只要你选择了这一选项，每次更换壁纸时系统会自动生成匹配的强调色，无需额外操作。

你可以在这里找到相关选项：

![来源： Pointiestick Blog / Nate Graham][4]

所以如果你希望桌面和你的壁纸更为匹配，你无需反复进入设置去调整强调色来做到这一点。这个自动生成的功能将会使这一需求更容易完成。

这是一个对新特性库增添的很小但十分强大的功能。感谢来自 Tanbir Jishan 的 [贡献][5]。

#### 基于强调色的配色方案

为了进一步加强个性化的视觉体验， KDE Plasma 5.25 允许你增加基于强调色的个性化配色方案。

![来源： Jan Blackquill][6]

你可以自由选择是否使用个性化配色方案。

关于这一特性的详情请见 Jan Blackquill 的 [贡献][7]。

#### 为 Flatpak/Snap 应用提供桌面文件编辑权限

之前， Flatpak/Snap 应用在 KDE 上并不支持桌面文件（`.desktop`）。

得益于最新的 “动态启动器” 门户（来自 Harald Sitter 的 [贡献][8]），这将允许你创建和编辑桌面文件，从而使沙盒应用程序无缝集成到系统。

#### 对“发现”的更多优化

在“发现”软件中心有一些细微的调整。你将可以在侧边栏中找到所有的应用程序类别，而无需经由“应用”、“插件”和“Plasma 插件”等子类别分别选择。

KDE Discover 修改前和修改后（贡献者：[Taavi Juursalu][9]）

![修改前][12]

![修改后][13]

关于这一变化详情请见 [合并请求][10] 。

#### 其他优化

针对 KDE Plasma 5.25 还计划的其他优化，包括：

  * 针对 KRunner 的性能优化
  * 网络组件增添了频率信息以及 Wi-Fi 网络的 BSSID 详细信息

所有错误修复与优化可在 [Nate 的博文][11] 中查看：

期待 KDE Plasma 5.25 吗？有了这些新特性，我十分期待它的正式发布。如果你有任何想法欢迎在下方评论。

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/plasma-5-25-features/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/kde-plasma-5-24-lts-release/
[2]: https://news.itsfoss.com/wp-content/uploads/2022/04/kde-plasma-5-25.jpg
[3]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1043
[4]: https://news.itsfoss.com/wp-content/uploads/2022/04/plasma-5-25-tinted-wallpaper-accent.jpg
[5]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1325
[6]: https://news.itsfoss.com/wp-content/uploads/2022/04/tint-color-scheme.png
[7]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1620
[8]: https://invent.kde.org/plasma/xdg-desktop-portal-kde/-/commit/d5f958e149705e27bbba9f3bbec659ff5bed1d80
[9]: https://invent.kde.org/taavi
[10]: https://invent.kde.org/plasma/discover/-/merge_requests/234
[11]: https://pointieststick.com/2022/04/22/this-week-in-kde-major-accent-color-and-global-theme-improvements/
[12]: https://news.itsfoss.com/wp-content/uploads/2022/04/kde-discover-plasma-5-25.png
[13]: https://news.itsfoss.com/wp-content/uploads/2022/04/kde-plasma-5-25-discover.png
