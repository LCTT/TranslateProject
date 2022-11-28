[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12414-1.html)
[#]: subject: (How to Disable Dock on Ubuntu 20.04 and Gain More Screen Space)
[#]: via: (https://itsfoss.com/disable-ubuntu-dock/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

如何在 Ubuntu 20.04 上禁用坞站（dock）
======

左侧的启动器已成为 [Ubuntu][1] 桌面的标识。它是在 [Unity 桌面][2]中引入的，甚至在 [Ubuntu 切换到 GNOME][3]时就有了，它复刻了 “Dash to Panel”，以在 [GNOME][4] 上创建一个类似的<ruby>坞站<rt>dock</rt></ruby>。

就个人而言，我发现它对于快速访问常用应用非常方便，但并非所有人都希望它额外占用屏幕上的一些空间。

从 [Ubuntu 20.04][5] 开始，你可以轻松禁用坞站。在本教程中，让我向你展示如何以图形和命令的方式执行此操作。

![][6]

### 通过扩展应用禁用 Ubuntu Dock

[Ubuntu 20.04 的主要功能][7]之一是引入“<ruby>扩展<rt>Extension</rt></ruby>”应用来管理系统上的 GNOME 扩展。只需在 GNOME 菜单中查找它（按下 Windows 键并输入）：

![Look for Extensions app in the menu][8]

> 没有找到扩展应用？
> 
> 如果尚未安装，你应该启用 GNOME Shell 扩展，“扩展” GUI 是此软件包的一部分。
>
> ```
> sudo apt install gnome-shell-extensions
> ```
>
> 这仅对 [GNOME 3.36][9] 或 Ubuntu 20.04（或更高版本） 中的更高版本有效。

启动“扩展”应用，你应该在“内置”扩展下看到 Ubuntu Dock。你只需要关闭即可禁用坞站。

![Disable Ubuntu Dock][10]

更改是即时的，你会看到坞站立即消失。

你可以用相同的方式恢复。只需打开它，它就会立即显示。

在 Ubuntu 20.04 中非常容易隐藏坞站，不是吗？

### 替代方法：通过命令行禁用 Ubuntu 坞站

如果你是终端爱好者，并且喜欢在终端中做事，那么我有一个对你而言的好消息。你可以从命令行禁用 Ubuntu 坞站。

使用 `Ctrl+Alt+T` 打开终端。你可能已经知道 [Ubuntu 中的键盘快捷键][11]。

在终端中，使用以下命令列出所有可用的 GNOME 扩展：

```
gnome-extensions list
```

这将显示类似于以下的输出：

![List GNOME Extensions][12]

默认的 Ubuntu 坞站扩展是 `ubuntu-dock@ubuntu.com`。你可以使用以下命令将其禁用：

```
gnome-extensions disable ubuntu-dock@ubuntu.com
```

屏幕上不会显示任何输出，但是你会注意到启动器（坞站）从左侧消失了。

如果需要，你可以使用与上面相同的命令再次启用它，但使用启用选项：

```
gnome-extensions enable ubuntu-dock@ubuntu.com
```

### 总结

在 Ubuntu 18.04 中也有禁用坞站的方法。但是，如果你尝试在 18.04 中删除它，这可能会导致不想要的结果。删除此软件包也会删除 ubuntu-desktop 包，最终可能会导致系统崩溃，例如没有应用菜单。

这就是为什么我不建议在 Ubuntu 18.04 上删除它的原因。

好消息是 Ubuntu 20.04 提供了一种隐藏任务栏的方法。用户拥有更大的自由度和更多的屏幕空间。说到更多的屏幕空间，你是否知道可以[从 Firefox 移除顶部标题栏并获得更多的屏幕空间][14]？

我想知道你喜欢怎样的 Ubuntu 桌面？要坞站，不要坞站，还是不要 GNOME？

--------------------------------------------------------------------------------

via: https://itsfoss.com/disable-ubuntu-dock/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://ubuntu.com/
[2]: https://itsfoss.com/keeping-ubuntu-unity-alive/
[3]: https://itsfoss.com/ubuntu-unity-shutdown/
[4]: https://www.gnome.org/
[5]: https://itsfoss.com/download-ubuntu-20-04/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/disable-dock-in-ubuntu.png?ssl=1
[7]: https://itsfoss.com/ubuntu-20-04-release-features/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/GNOME-extensions-app-ubuntu.jpg?ssl=1
[9]: https://itsfoss.com/gnome-3-36-release/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/disable-ubuntu-dock.png?ssl=1
[11]: https://itsfoss.com/ubuntu-shortcuts/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/list-gnome-extensions.png?ssl=1
[13]: https://itsfoss.com/cdn-cgi/l/email-protection
[14]: https://itsfoss.com/remove-title-bar-firefox/
