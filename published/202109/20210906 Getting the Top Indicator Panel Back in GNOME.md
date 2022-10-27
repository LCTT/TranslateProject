[#]: subject: "Getting the Top Indicator Panel Back in GNOME"
[#]: via: "https://itsfoss.com/enable-applet-indicator-gnome/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "imgradeone"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13785-1.html"

恢复 GNOME 顶栏的托盘图标
======

GNOME 是一款流行的 Linux 桌面环境，致力于为 Linux 用户提供现代化的桌面体验。

虽然这款桌面绝大部分功能都不错，但 GNOME 团队的某些决定确实也让许多用户恼火、质疑。

前脚不能在桌面摆放图标和文件，后脚将右键菜单中的 [新建文档选项移除][1]，现在，除此之外，GNOME 同样也移除了托盘图标栏功能。

怎么说，你总得知道托盘图标栏是什么吧？这些小图标允许你使用相应应用程序的附加功能。我自己的 Ubuntu 系统里就有许多托盘图标。

![托盘图标栏][2]

这一砍就砍出了大问题，尤其是针对那些完全依赖托盘图标的软件的致命打击。就拿 [Dropbox][3] 举例子吧，你只能通过 Dropbox 的托盘图标菜单来访问 Dropbox 的设置页面，很不幸，你在 GNOME 中就完全找不到这个图标。

这确实是个大问题，好在，我们还是有解决办法的。

### 借助插件来重新启用 GNOME 的托盘图标栏

如果你在用 GNOME，想必你已经知道 GNOME 插件是什么了。这些小插件基本上是由热心的独立开发者开发的。

如果你没有准备好，那么就去 [启用 GNOME 插件][4] 吧。这一步其实非常简单，使用 Chrome 或 Firefox 打开任意一个插件的页面，然后页面会提示你安装浏览器扩展。安装这个扩展，然后就可以启程了。

![启用 GNOME 插件的浏览器扩展][5]

现在，有一些可以向顶栏增加托盘图标的 GNOME 插件。在撰写本篇教程的时候，[AppIndicator and KStatusNotifierItem Support][6] 这款插件在 GNOME 的较新版本中已经有良好的开发优化与支持。

前往插件的页面：

- [AppIndicator 插件][6]

在这个页面中，你应该能看到一个开关按钮。点击这个按钮即可安装该插件。

![][7]

接下来会有一个弹窗，弹出后请点击“安装”。

![安装插件][8]

也许安装插件后，插件不会立即生效。此时，你必须重启 GNOME。在 Xorg 会话中，你只需要按下 `Alt + F2` 并输入 `r` 即可重启 GNOME，但这个操作不支持 Wayland 会话。

注销当前会话，并且重新登录，此后托盘图标应该就能成功启用了。如果你安装了任何一款带托盘图标的软件，那么你应该可以在顶栏上看见这些图标的身影了。

于我而言，我已经安装了 Dropbox，因此托盘图标就直接出现在顶栏上了。

![Dropbox 托盘图标在 GNOME 下可用的截图][9]

希望这个小技巧能帮助你恢复 GNOME 顶栏中的托盘图标。

我完全不理解，为什么 GNOME 的开发者会认为把这种实用性极强的功能删除会是个好主意。不过，上帝关上了一扇门，却（通常）会再打开一扇窗。好好享受按你的偏好运作的 GNOME 吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/enable-applet-indicator-gnome/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[imgradeone](https://github.com/imgradeone)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/add-new-document-option/
[2]: https://itsfoss.com/wp-content/uploads/2021/09/indicator-applet-linux.webp
[3]: https://www.dropbox.com
[4]: https://itsfoss.com/gnome-shell-extensions/
[5]: https://itsfoss.com/wp-content/uploads/2021/09/installing-gnome-extension-add-on-800x355.webp
[6]: https://extensions.gnome.org/extension/615/appindicator-support/
[7]: https://itsfoss.com/wp-content/uploads/2021/09/appindicator-extension-800x329.webp
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/installing-appindicator-extension.png?resize=800%2C269&ssl=1
[9]: https://itsfoss.com/wp-content/uploads/2021/09/gnome-dropbox-indicator-800x561.webp
