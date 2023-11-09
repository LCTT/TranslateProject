[#]: subject: "Add Minimize and Maximize Buttons in GNOME"
[#]: via: "https://itsfoss.com/gnome-minimize-button/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972/lctt-scripts-1693450080"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-16295-1.html"

在 GNOME 中添加最小化和最大化按钮
======

![][0]

> 缺少了 GNOME 中的最小化按钮选项？下面教你如何轻松找回它。

与 Ubuntu 不同，[Fedora][1] 和 Arch Linux 等发行版为你提供了原生的 GNOME，但可能让你烦恼的一件事是应用窗口上缺少最小化和最大化按钮。

![No minimize or maximize button in application windows, only close button][2]

GNOME 希望你使用应用切换器（`Alt+Tab`）或使用活动区（`Super` 键）在正在运行的应用之间切换，而不是最小化它。

好消息是，如果你不喜欢的话，你不必这样。

让我分享一下如何使用 GUI 和命令行选项恢复 GNOME 中的最小化和最大化按钮。

### 方法 1：使用 GNOME 优化工具启用最小化和最大化按钮

GNOME <ruby>优化<rt>Tweaks</rt></ruby> 工具允许你自定义 GNOME 的各个方面。启用最小化窗口按钮就是其中之一。

首先使用发行版的包管理器安装 GNOME 优化工具。

运行应用并从左侧边栏进入 Windows 标题栏。你将在此处看到添加最小化和最大化按钮的选项，

![][3]

你可以选择其中一个或两者。如果你不再需要它，**你可以在 GNOME 调整工具中以相同的方式禁用按钮**。

> 💡 如果需要，你还可以选择将这些控制按钮放在左侧。该选项位于标题栏按钮选项的末尾。

### 方法 2：使用命令行启用最小化和最大化按钮

`gsettings` 命令可以选择更改按钮布局并添加最小化和最大化按钮。

```
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
```

正如你所猜测的，如果你想要**禁用任何按钮，你可以运行相同的命令，但从命令中省略不需要的按钮**。

> 💡 你还可以通过将冒号放在命令的右侧来将 Windows 控制按钮移动到左侧：
>
> ```
> gsettings set org.gnome.desktop.wm.preferences button-layout "close,minimize,maximize:"
> ```

### 受到 macOS 的启发并不总是一件好事

显然，这种“无最小化按钮”的设计灵感来自苹果的 macOS。我记得大约 10 年前，macOS 曾经将窗口控件放在左侧。因此 Ubuntu Unity 也尝试默认将控件保留在左侧。

苹果很奇怪。他们大多数时候都有很好的设计，但有时他们会优先考虑设计而不是使用体验。“Magic Mouse” 就是一个例子。

> “Magic Mouse 深受用户喜爱”。你确定？ 
> 
> ![][4]
>
> — Stuart (@stuwieface) [2021 年 4 月 20 日][5]

我不明白为什么 GNOME 开发者需要从各种设计中获得灵感，尤其是那些糟糕的设计。

但那只是我的个人意见。我很高兴有一个快速简单的解决方案可以恢复 GNOME 中的最小化和最大化按钮。

*（题图：MJ/f8ce0441-3d9b-498c-8e23-e48f7a90d040）*

--------------------------------------------------------------------------------

via: https://itsfoss.com/gnome-minimize-button/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/best-fedora-linux-distributions/
[2]: https://itsfoss.com/content/images/2023/10/missing-minimize-button-gnome.png
[3]: https://itsfoss.com/content/images/2023/10/enable-minimize-maximize-windows-option-gnome-tweaks.png
[4]: https://pbs.twimg.com/media/EzbzOQOXsAAwdE0?format=jpg&name=medium
[5]: https://twitter.com/stuwieface/status/1384561367223521286?ref_src=twsrc%5Etfw
[0]: https://img.linux.net.cn/data/attachment/album/202310/18/104631i5gbbz3mwkfp5gmu.jpg