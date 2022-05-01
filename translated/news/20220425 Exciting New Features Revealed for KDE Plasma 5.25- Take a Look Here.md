[#]: subject: "Exciting New Features Revealed for KDE Plasma 5.25! Take a Look Here"
[#]: via: "https://news.itsfoss.com/plasma-5-25-features/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "PeterPan0106"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

KDE Plasma 5.25 推出了令人激动的新特性！先睹为快
======

[KDE Plasma 5.24][1] 提供了关于 breeze 主题的更新，并对多任务 overview 界面进行了修改。

现在，开发者们已经准备好向大家介绍 KDE Plasma 5.25 令人激动的新特性。

### KDE Plasma 5.25 ：拥有哪些新功能？

Nate Graham 在一篇博文中着重介绍了一些最为有趣的变化，让我们一起先睹为快。

#### 样式可以部分应用到全局主题

![来源： Pointiestick Blog / Nate Graham][2]

当你在系统设置里应用一个全局主题时，你将可以选择应用全部的样式或是仅仅应用其中一部分样式。

例如，当你更换桌面背景以及应用样式时，你可能并不愿意更换鼠标指针和 icon。

总体而言，当你在基于 KDE 的系统上应用全局主题时，你将能够更为自由地设置你的样式。

令人惊叹的贡献来自 **Dominic Hayes** [贡献][3]。

#### 根据当前壁纸自动生成强调色

尽管能够使用预设或自定义的强调色已经很好了。

但在 KDE Plasma 5.25 上，我们进一步允许用户选择系统根据当前壁纸自动生成强调色供用户选择。

只要你选择了这一选项，每次跟换壁纸时系统仍将自动重新生成匹配的强调色，无需额外操作。

你可以在这里找到相关选项：

![来源： Pointiestick Blog / Nate Graham][4]

所以如果你希望桌面和你的壁纸更为匹配，你无需反复进入设置去调整强调色来做到这一点。自动生成功能将会使这一需求更容易完成。

这是一个对新特性库增添的很小但十分强大的功能。感谢来自 **Tanbir Jishan** 的贡献 [贡献][5]。

#### 基于强调色的配色方案

为了进一步加强个性化的视觉体验， KDE Plasma 5.25 允许你增加基于强调色的个性化配色方案。

![来源： Jan Blackquill][6]

你可以自由选择是否使用个性化配色方案。

关于这一特性的详情请见来自 **Jan Blackquill** 的贡献 [贡献][7]。

#### 为 Flatpak/Snap 应用提供桌面文件编辑权限

之前， Flatpak/Snap 应用在 KDE 上并不支持桌面文件的编辑。

基于最新的 **Dynamic launcher** 门户 （详见 [贡献][8] 来自 Harald Sitter ）。这将允许你创建和编辑桌面文件，从而使沙盒应用程序无缝集成到系统。

#### 更多优化，等你发现

在 Discover 软件中心里，我们做出了一些细微的调整。你将可以在侧边栏中找到所有的应用程序，而无需经由“应用”、“插件”或是“ Plasma 插件”等子类别分别选择。

KDE Discover 修改前和修改后（贡献者： **[Taavi Juursalu][9]**）

Use the cursor to slide through the before/after in the images above.（**译者注**：这句话本意是“上图可用鼠标滑动来看前后变化”，但是我不确定我们的网站和其他平台有没有这个功能。如果没有这个功能可以把这句话删掉，并在图片注解中直接写明“修改前”和“修改后”，这将需要排版人员分别保存两张图片。阅读完本注解后排版人员通过访问源网站可以轻易理解。**括号内内容正式版本请务必删掉**）

关于这一变化详情请见 [合并请求][10] 。

#### 其他优化

针对 KDE Plasma 5.25 已经计划的其他优化包含以下内容：

  * 针对 KRunner 的性能优化
  * Network 组件增添了频率信息以及 Wi-Fi 网络的 BSSID 详细信息



所有bug修复与优化在此可见： [Nate’s blog post][11].

_期待 KDE Plasma 5.25 吗？有了这些新特性，我十分期待它的正式发布。如果你有任何想法欢迎在下方评论_

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/plasma-5-25-features/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[PeterPan0106](https://github.com/PeterPan0106)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://news.itsfoss.com/kde-plasma-5-24-lts-release/
[2]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijc3OSIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[3]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1043
[4]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9Ijc3OCIgd2lkdGg9IjEwMjQiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgdmVyc2lvbj0iMS4xIi8+
[5]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1325
[6]: data:image/svg+xml;base64,PHN2ZyBoZWlnaHQ9IjExNDMiIHdpZHRoPSIxNTU4IiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZlcnNpb249IjEuMSIvPg==
[7]: https://invent.kde.org/plasma/plasma-workspace/-/merge_requests/1620
[8]: https://invent.kde.org/plasma/xdg-desktop-portal-kde/-/commit/d5f958e149705e27bbba9f3bbec659ff5bed1d80
[9]: https://invent.kde.org/taavi
[10]: https://invent.kde.org/plasma/discover/-/merge_requests/234
[11]: https://pointieststick.com/2022/04/22/this-week-in-kde-major-accent-color-and-global-theme-improvements/
