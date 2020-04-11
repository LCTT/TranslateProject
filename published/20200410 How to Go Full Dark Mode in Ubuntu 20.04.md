[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12098-1.html)
[#]: subject: (How to Go Full Dark Mode in Ubuntu 20.04)
[#]: via: (https://itsfoss.com/dark-mode-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Ubuntu 20.04 中完全进入深色模式
======

> 深色模式是 Ubuntu 20.04 最受瞩目的[新功能][1]之一了。任何版本的 Ubuntu 都可以通过[安装深色主题][2]让用户界面拥有一个深色的外观，但在 Ubuntu 20.04 中，这个过程变得更简单。

![](https://img.linux.net.cn/data/attachment/album/202004/11/200841gvvaja25jaz5z7hv.jpg)

在 Ubuntu 20.04 中，无需额外安装主题，默认主题（称为 Yaru）本身就带有三种模式，其中就包括深色模式。

下面我会展示如何将 Ubuntu 系统完全设置为深色模式。

### 在 Ubuntu 20.04 打开深色模式

- [video](https://player.vimeo.com/video/405726943)

这个步骤是在 GNOME 桌面上进行的，如果你[使用的是其它桌面][4]，你看到的可能会和下面的截图不一样。

按下 super 键（或 Windows 键），然后输入 “settings”，就可以找到系统设置。

![Search for Settings][5]

在系统设置中，进入“<ruby>外观<rt>Appearance</rt></ruby>”部分，就可以看到<ruby>浅色<rt>light</rt></ruby>、<ruby>标准<rt>standard</rt></ruby>和<ruby>深色<rt>dark</rt></ruby>三个选项。既然要使用深色模式，那自然而然要选择“深色”这个选项了。

![Enable Dark Theme in Ubuntu][6]

完成设置以后，使用了 GTK3 的应用程序都可以跟随深色模式。因此你会看到系统中包括文本编辑器、终端、LibreOffice 等在内的大多数应用程序都已经切换成深色了。但未使用 GTK3 的应用程序可能并没有跟随进入深色模式，下面我会展示如何更完整地进入深色模式。

### 继续调整，进入完整深色模式

这个时候你会发现，shell 主题、屏幕顶部面板中的消息托盘和系统托盘还仍然保持在原有的模式当中。

![No Dark Shell by default in Ubuntu][7]

现在就需要使用 [GNOME 扩展][8]安装 Yaru 深色 shell 主题了。[在 Ubuntu 中通过 Ctrl+Alt+T 打开终端][9]，然后执行以下这个命令安装浏览器扩展：

```
sudo apt install chrome-gnome-shell
```

进入[扩展页面][10]启用这个扩展：

![Enable User Themes GNOME Extension][11]

执行以下命令安装 [GNOME 调整工具][12]：

```
sudo apt install gnome-tweaks
```

打开 GNOME 调整工具，进入“<ruby>外观<rt>Appearance</rt></ruby>”部分，就可以看到 shell 主题的选项，现在只需要把它启用就可以了。

![Enable Yaru Dark Shell Theme in Ubuntu][13]

设置完之后再观察一下，桌面通知、消息托盘、系统托盘等等都已经进入深色模式了。

![Yaru Dark Shell Theme in Ubuntu][14]

现在感觉好多了。但你可能还会注意到，在使用浏览器访问网站的时候，很多网站都使用了白色的背景色。如果期望网站方提供深色模式，那是很不现实的，但我们可以自己实现这一件事。

你需要用到的东西就是诸如 [Dark Reader][15] 这样的浏览器扩展。《[在 Firefox 中启用深色模式][16]》这篇文章中也有讨论过这个浏览器扩展，它的使用过程并不复杂，如果你使用的浏览器是 Firefox、Chrome 或 [Ubuntu 下的 Chromium][17]，就可以直接安装[其官方网站][15]上列出的扩展。

Dark Reader 安装完成后，就会以深色模式打开网站了。

![It’s FOSS Homepage in Dark Mode with Dark Reader][18]

当然，有些外部的第三方应用程序可能仍然是浅色状态。如果它们自己附带了深色模式的选项，就需要手动启用它们的深色模式。

如今，深色模式在非开发者人群中也越来越流行了。按照以上的步骤，你就可以轻松进入深色模式。

请享受深色模式。


--------------------------------------------------------------------------------

via: https://itsfoss.com/dark-mode-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-20-04-release-features/
[2]: https://itsfoss.com/install-themes-ubuntu/
[3]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[4]: https://itsfoss.com/find-desktop-environment/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/settings-search-ubuntu-20-04.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/enable-dark-theme-ubuntu.png?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/no-dark-shell-ubuntu.jpg?ssl=1
[8]: https://itsfoss.com/gnome-shell-extensions/
[9]: https://itsfoss.com/ubuntu-shortcuts/
[10]: https://extensions.gnome.org/extension/19/user-themes/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/enable-user-themes-gnome.jpg?ssl=1
[12]: https://itsfoss.com/gnome-tweak-tool/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/ubuntu-yaru-dark-shell-theme.jpeg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/yaru-dark-shell-theme-ubuntu.jpg?ssl=1
[15]: https://darkreader.org/
[16]: https://itsfoss.com/firefox-dark-mode/
[17]: https://itsfoss.com/install-chromium-ubuntu/
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/itsfoss_dark_mode.jpg?ssl=1
