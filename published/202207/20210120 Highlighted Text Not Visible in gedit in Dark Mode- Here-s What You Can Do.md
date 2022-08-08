[#]: collector: "lujun9972"
[#]: translator: "void-mori"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14833-1.html"
[#]: subject: "Highlighted Text Not Visible in gedit in Dark Mode? Here’s What You Can Do"
[#]: via: "https://itsfoss.com/gedit-dark-mode-problem/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"

gedit 深色模式下高亮文本不可见？以下是你能做的
======

![](https://img.linux.net.cn/data/attachment/album/202207/16/094145b0gdwez5zo0zyuhz.jpg)

我喜欢 [在 Ubuntu 中使用深色模式][1]。在我看来深色模式能够缓解视觉疲劳，让系统看起来更加的赏心悦目。

我发现了一个 [gedit][2] 文本编辑器的小麻烦，如果你在深色模式下使用它，你也许也会遇到。

默认情况下 gedit 高亮当前光标所在的行。这是一个非常有用的功能，但是如果你在 Linux 系统中开启了深色模式，那么你将会感到痛苦。为什么？因为被高亮的文本将不再变得可读。你自己看吧：

![Text on the highlighted line is hardly visible][3]

如果你选择文本，它将变得可读，但这并不是一个让人感到有多么愉快的阅读或者编辑体验。（LCTT 校注：在新的 Ubuntu 22.04 中，这一情况已经有所改善，“高亮当前行”已被取消勾选）

![Selecting the text makes it better but that’s not a convenient thing to do for all lines][4]

好消息是你不需要再忍受它。我将演示几个步骤让你能够同时享受 gedit 以及系统的深色模式。

### 让 gedit 在深色模式下阅读体验友好

你基本上有两个选择：

  1. 禁用高亮当前行，但也同时意味着你必须清楚地知道你在哪一行。
  2. 改变默认的颜色设置，但编辑器的颜色会变得稍微有些不同，而且如果你更改系统主题，它不会自动切换到浅色模式。

在 gedit 或者 GNOME 的开发者解决这个问题之前，这是你必须要做的应变和妥协。

#### 选项1： 禁止高亮当前行

当你打开 gedit 后，点击汉堡菜单然后选择“<ruby>首选项<rt>Preferences</rt></ruby>”。

![Go to Preferences][5]

在查看选项卡，你应该看到在 “<ruby>高亮<rt>Highlighting</rt></ruby>” 区域的下方的 “<ruby>高亮当前行<rt>Highlight current line</rt></ruby>” 选项。取消勾选这个选项，马上就可以看到效果。

![Disable highlighting current line][6]

“高亮当前行”是一个有用的功能，如果你想继续使用它，请选择第二个选项。

#### 选项2： 更改编辑器的颜色主题

在“<ruby>首选项<rt>Preferences</rt></ruby>”窗口，找到 “字体与颜色<rt>Font & Colors</rt></ruby>” 标签页，然后将颜色主题更改为 “Oblivion”、“Solarized Dark”，或者 “Cobalt”。

![Change the color scheme][7]

正如我前面所提到的，缺点就是当你把系统主题切换为浅色模式时，编辑器将不会自动切换到浅色模式。

### 开发者应该修复的一个 bug

这里 [有几个 Linux 可用的文本编辑器][8] ，但是为了快速阅读或编辑文本文件，我更推荐使用 gedit。尽管如此，小烦恼仍旧是小烦恼。开发者应该在将来的版本中为这个很好的文本编辑器修复这个问题，让我们不再求助于这些应对办法。

你呢？你在你的系统上使用深色模式还是浅色模式？你注意到 gedit 的这个问题了吗？你有使用什么方法去解决它吗？欢迎分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gedit-dark-mode-problem/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[void-mori](https://github.com/void-mori)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/dark-mode-ubuntu/
[2]: https://wiki.gnome.org/Apps/Gedit
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/01/gedit-dark-mode-problem.png?resize=779%2C367&ssl=1
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/gedit-dark-mode-issue.png?resize=779%2C367&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/gedit-preference.jpg?resize=777%2C527&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/01/disable-highlight-line-gedit.jpg?resize=781%2C530&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/01/change-color-scheme-gedit.jpg?resize=785%2C539&ssl=1
[8]: https://itsfoss.com/best-modern-open-source-code-editors-for-linux/
