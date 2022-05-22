[#]: subject: "How to change Ubuntu Terminal Font and Size [Beginner’s Tip]"
[#]: via: "https://itsfoss.com/change-terminal-font-ubuntu/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "robsean"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13992-1.html"

入门：如何更改 Ubuntu 的终端的字体和大小
======

![](https://img.linux.net.cn/data/attachment/album/202111/17/132645otre44u7ge68tzzb.jpg)

如果你在 Ubuntu 上使用终端的时间很长，你可能会希望调整终端的字体和大小以获取一种良好的体验。

更改字体是一种最简单但最直观的 [Linux 的终端自定义][1] 的方法。让我向你展示在 Ubuntu 中更改终端的字体的详细步骤，以及一些字体选择的提示和建议。

注意：这些步骤可能也对大多数的其它的 [Linux 的终端模拟器][2] 有效，但是你访问选项的方法可能会有所不同。

### 使用 GUI 更改 Ubuntu 的终端的字体和大小

**步骤 1.** [在 Ubuntu 中打开终端窗口][3] ，方法是按 `Ctrl+Alt+T` 组合键。

**步骤 2.** 打开终端“<ruby>首选项<rt>Preferences</rt></ruby>”。你可以单击菜单按钮来找到它。

![][4]

你也可以右击终端屏幕的任意位置来访问首选项，如下图所示。

![][5]

**步骤 3.** 现在，你应该能够访问针对终端的设置。在默认情况下，在这里将会有一个未命名的配置文件。这就是默认的配置文件。**我建议创建一个新的配置文件**，以便你的更改不会影响默认的设置。

![][6]

**步骤 4.** 为了更改字体，你需要启用“<ruby>自定义字体<rt>Custom font</rt></ruby>” 选项，接下来单击 “**Monospace Regular**” 。

![][7]

它将显示针对这个选项的可用的一个字体列表。

![][8]

在这里，你可以在字体列表的底部快速预览字体，也可以调整你的 Ubuntu 的终端的字体大小。

在默认情况下，字体的大小是 **12** ，字体的样式是 **Ubuntu mono** 。

**步骤 5.** 最后，你也可以搜索你喜欢的字体样式，并在查看预览和调整字体大小后，通过点击 “<ruby>选择<rt>Select</rt></ruby>” 来完成更改字体。

![][9]

这就是全部的步骤。你已经成功地更改字体。在下面的图像中查看更改。移动划款来查看不同点。

![Ubuntu terminal font change][10]

### 获取针对 Ubuntu 的终端的新字体的提示

你可以中从因特网上下载 TTF 格式的字体文件，右击这些 TTF 文件 [可以很容易在 Ubuntu 中安装这些新的字体][11] 。

![][12]

你可以打开一个新的终端窗口来加载新安装的字体。

不过，请记住，**Ubuntu 不会在终端中显示所有新安装的字体**。为什么？因为终端已经被分配使用 monospaced 字体。如果字体中字母间靠得很近的，那看起来就很诡异了。一些字体不能清晰区分字母 “o” 和数字 “0” 。同样，你也可能面临区分小写字母 “l” 和小写字母 “i” 的难题。

这就是为什么你会在终端中所看到的字体的名称中通常会带有 “mono” 的原因。

一般来说，在字体方面可能会有很多可读性难题，这可能会造成更加混乱的局面。因此，最好选择一种不会在终端上使人难易阅读的字体。

你还应该检查在你增大/减少字体大小期间该字体是否看起来良好/诡异，以确保在你自定义你的终端时没有问题。

### 针对终端自定义的字体建议

Free mono 和 Noto mono 是默认字体选择列表中可用的一些好字体，可应用于你的终端。

你可以尝试 [在 Linux 中安装新的字体][11] ，像 **JetBrains Mono** 、**Robo Mono** 、Larabiefont 、Share Tech Mono 以及来自 Google 和其它来源的字体。

你喜欢在 Ubuntu 的终端上使用什么样的字体和大小？请在下面的评论区告诉我们！

--------------------------------------------------------------------------------

via: https://itsfoss.com/change-terminal-font-ubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/customize-linux-terminal/
[2]: https://itsfoss.com/linux-terminal-emulators/
[3]: https://itsfoss.com/open-terminal-ubuntu/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/terminal-preference.png?resize=800%2C428&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/terminal-right-click-menu.png?resize=800%2C341&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-terminal-preference-option.png?resize=800%2C303&ssl=1
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/09/enable-font-change-ubuntu-terminal.png?resize=798%2C310&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/monospace-font-default.png?resize=800%2C651&ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-custom-font-selection.png?resize=800%2C441&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/09/ubuntu-terminal-font-2.png?resize=723%2C353&ssl=1
[11]: https://itsfoss.com/install-fonts-ubuntu/
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/12/install-new-fonts-ubuntu.png?resize=800%2C463&ssl=1
