[#]: subject: "How to Switch to Dark Mode in Fedora Linux [Beginner’s Tip]"
[#]: via: "https://itsfoss.com/fedora-dark-mode/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14002-1.html"

入门：如何在 Fedora Linux 中切换到深色模式
======

![](https://img.linux.net.cn/data/attachment/album/202111/20/114412oqqw4mdnxbwfbprb.jpg)

与 Ubuntu 不同，Fedora 提供的是真正的、原生般的 GNOME 体验，而且体验很好，横向布局、三指滑动，一切都很好。

我不喜欢的一点是默认的标准主题，它是 Adwaita Light（默认）主题和深色的 GNOME Shell 的混合体。

因此，虽然通知和通知区是深色的，但系统和应用的其他部分是浅色主题。老实说，对我来说，这看起来很不协调。

![Fedora GNOME standard theme][1]

另一方面，深色主题让它看起来更好。

![Fedora GNOME dark theme][2]

让我告诉你如何在 Fedora 或其他任何使用 GNOME 桌面环境的发行版中开启深色模式。

### 在 Fedora 中切换到深色模式

好了！我将分享命令行的方法，因为它更快。打开一个终端，使用这个命令：

```
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
```

完成了。这很容易，对吗？但我也要展示一下 GUI 的方法。

因为我主要使用 Ubuntu，所以我始终参照 Ubuntu。Ubuntu 在系统设置中本身就提供了在浅色和深色主题之间切换的选项。

然而，在原生 GNOME 中却没有这样的设置。你必须先 [在 Fedora 上安装 GNOME Tweaks 工具][3]，然后用它来切换主题。

你可以在软件中心搜索它并点击“<ruby>安装<rt>Install</rt></ruby>”按钮：

![Install GNOME Tweaks from the software center in Fedora][4]

或者，你在终端输入以下命令：

```
sudo dnf install gnome-tweaks
```

安装完成后，按 `Super` 键（`Windows` 键）在系统菜单中搜索它：

![Start GNOME Tweaks][5]

点击左侧边栏的“<ruby>外观<rt>Appearance</rt></ruby>”标签，点击主题部分下的应用。

![Changing theme in Fedora][6]

你会看到这里有几个可用的主题。你应该在这里选择 “Adwaita-dark”。当你选择了它，应用就会切换到深色主题。

![Selecting the Adwaita-dark theme][7]

就是你在 Fedora 中切换到深色模式所需要做的一切。由于 GNOME Shell 已经在使用深色主题，你不需要明确地将它设置为深色模式。所有的通知、信息栏等都是在深色模式下的。

### 总结

你可以找到各种深色 GTK 主题并安装它们来给你的 Fedora 带来不同的深色外观。然而，我注意到，只有系统自己的深色主题才能被网页浏览器识别。

所以，如果你访问一个根据你的系统主题自动启用深色模式的网站，它将与 Adwaita-dark 兼容，但可能与其他深色 GTK 主题不兼容。

这就是使用系统提供的深色主题的一个优势。

如你所见，在 Fedora 中启用深色模式并不是什么火箭科学。它只是一个了解和发现的过程。

享受深色色彩吧！

--------------------------------------------------------------------------------

via: https://itsfoss.com/fedora-dark-mode/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/fedora-gnome-standard-theme.webp?resize=800%2C450&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/fedora-gnome-dark-theme.webp?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/install-gnome-tweaks-fedora/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-gnome-tweaks-fedora.webp?resize=800%2C448&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/start-gnome-tweaks-tool-in-Fedora.png?resize=800%2C271&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/change-GTK-theme-Fedora.webp?resize=800%2C532&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/switching-dark-mode-fedora.png?resize=800%2C515&ssl=1
