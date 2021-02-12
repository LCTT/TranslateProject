[#]: collector: (lujun9972)
[#]: translator: (Chao-zhi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13110-1.html)
[#]: subject: (Give Your GNOME Desktop a Tiling Makeover With Material Shell GNOME Extension)
[#]: via: (https://itsfoss.com/material-shell/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

使用 Material Shell 扩展将你的 GNOME 桌面打造成平铺式风格
======

平铺式窗口的特性吸引了很多人的追捧。也许是因为它很好看，也许是因为它能提高 [Linux 快捷键][1] 玩家的效率。又或者是因为使用不同寻常的平铺式窗口是一种新奇的挑战。

![Tiling Windows in Linux | Image Source][2]

从 i3 到 [Sway][3]，Linux 桌面拥有各种各样的平铺式窗口管理器。配置一个平铺式窗口管理器需要一个陡峭的学习曲线。

这就是为什么像 [Regolith 桌面][4] 这样的项目会存在，给你预先配置好的平铺桌面，让你可以更轻松地开始使用平铺窗口。

让我给你介绍一个类似的项目 —— Material Shell。它可以让你用上平铺式桌面，甚至比 [Regolith][5] 还简单。

### Material Shell 扩展：将 GNOME 桌面转变成平铺式窗口管理器

[Material Shell][6] 是一个 GNOME 扩展，这就是它最好的地方。这意味着你不需要注销并登录其他桌面环境。你只需要启用或关闭这个扩展就可以自如的切换你的工作环境。

我会列出 Material Shell 的各种特性，但是也许视频更容易让你理解：

- [video](https://youtu.be/Wc5mbuKrGDE)

这个项目叫做 Material Shell 是因为它遵循 [Material Design][8] 原则。因此这个应用拥有一个美观的界面。这就是它最重要的一个特性。

#### 直观的界面

Material Shell 添加了一个左侧面板，以便快速访问。在此面板上，你可以在底部找到系统托盘，在顶部找到搜索和工作区。

所有新打开的应用都会添加到当前工作区中。你也可以创建新的工作区并切换到该工作区，以将正在运行的应用分类。其实这就是工作区最初的意义。

在 Material Shell 中，每个工作区都可以显示为具有多个应用程序的行列，而不是包含多个应用程序的程序框。

#### 平铺式窗口

在工作区中，你可以一直在顶部看到所有打开的应用程序。默认情况下，应用程序会像在 GNOME 桌面中那样铺满整个屏幕。你可以使用右上角的布局改变器来改变布局，将其分成两半、多列或多个应用网格。

这段视频一目了然的显示了以上所有功能：

- [video](https://player.vimeo.com/video/460050750?dnt=1&app_id=122963)

#### 固定布局和工作区

Material Shell 会记住你打开的工作区和窗口，这样你就不必重新组织你的布局。这是一个很好的特性，因为如果你对应用程序的位置有要求的话，它可以节省时间。

#### 热建/快捷键

像任何平铺窗口管理器一样，你可以使用键盘快捷键在应用程序和工作区之间切换。

  * `Super+W` 切换到上个工作区；
  * `Super+S` 切换到下个工作区；
  * `Super+A` 切换到左边的窗口；
  * `Super+D` 切换到右边的窗口；
  * `Super+1`、`Super+2` … `Super+0` 切换到某个指定的工作区；
  * `Super+Q` 关闭当前窗口；
  * `Super+[鼠标拖动]` 移动窗口；
  * `Super+Shift+A` 将当前窗口左移；
  * `Super+Shift+D` 将当前窗口右移；
  * `Super+Shift+W` 将当前窗口移到上个工作区；
  * `Super+Shift+S` 将当前窗口移到下个工作区。

### 安装 Material Shell

> 警告！
>
> 对于大多数用户来说，平铺式窗口可能会导致混乱。你最好先熟悉如何使用 GNOME 扩展。如果你是 Linux 新手或者你害怕你的系统发生翻天覆地的变化，你应当避免使用这个扩展。

Material Shell 是一个 GNOME 扩展。所以，请 [检查你的桌面环境][9]，确保你运行的是 GNOME 3.34 或者更高的版本。

除此之外，我注意到在禁用 Material Shell 之后，它会导致 Firefox 的顶栏和 Ubuntu 的坞站消失。你可以在 GNOME 的“扩展”应用程序中禁用/启用 Ubuntu 的坞站扩展来使其变回原来的样子。我想这些问题也应该在系统重启后消失，虽然我没试过。

我希望你知道 [如何使用 GNOME 扩展][10]。最简单的办法就是 [在浏览器中打开这个链接][11]，安装 GNOME 扩展浏览器插件，然后启用 Material Shell 扩展即可。

![][12]

如果你不喜欢这个扩展，你也可以在同样的链接中禁用它。或者在 GNOME 的“扩展”应用程序中禁用它。

![][13]

### 用不用平铺式？

我使用多个电脑屏幕，我发现 Material Shell 不适用于多个屏幕的情况。这是开发者将来可以改进的地方。

除了这个毛病以外，Material Shell 是个让你开始使用平铺式窗口的好东西。如果你尝试了 Material Shell 并且喜欢它，请 [在 GitHub 上给它一个星标或赞助它][14] 来鼓励这个项目。

由于某些原因，平铺窗户越来越受欢迎。最近发布的 [Pop OS 20.04][15] 也增加了平铺窗口的功能。有一个类似的项目叫 PaperWM，也是这样做的。

但正如我前面提到的，平铺布局并不适合所有人，它可能会让很多人感到困惑。

你呢？你是喜欢平铺窗口还是喜欢经典的桌面布局？

--------------------------------------------------------------------------------

via: https://itsfoss.com/material-shell/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[Chao-zhi](https://github.com/Chao-zhi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-shortcuts/
[2]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux-ricing-example-800x450.jpg?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/sway-window-manager/
[4]: https://itsfoss.com/regolith-linux-desktop/
[5]: https://regolith-linux.org/
[6]: https://material-shell.com
[7]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[8]: https://material.io/
[9]: https://itsfoss.com/find-desktop-environment/
[10]: https://itsfoss.com/gnome-shell-extensions/
[11]: https://extensions.gnome.org/extension/3357/material-shell/
[12]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/install-material-shell.png?resize=800%2C307&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/09/material-shell-gnome-extension.png?resize=799%2C497&ssl=1
[14]: https://github.com/material-shell/material-shell
[15]: https://itsfoss.com/pop-os-20-04-review/
