[#]: subject: "Using GNOME Screenshot Tool in Linux Like a Pro"
[#]: via: "https://itsfoss.com/using-gnome-screenshot-tool/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-14166-1.html"

在 Linux 中像专业人士一样使用 GNOME 截图工具
======

有 [几个可用于 Linux 的截图工具][1]，我喜欢 [使用 Flameshot 进行截图][2] 和 Shutter 来编辑现有的截图。

但不幸的是，Flameshot 不能在 4K 屏幕上工作。因此，我不得不使用默认的 GNOME 截图工具，它在我的带有超高清屏幕的戴尔 XPS 上工作得非常好。

![GNOME screenshot tool][3]

这一“被迫之举”让我意识到，如果你知道如何正确使用，[GNOME 截图][4] 并不是一个糟糕的工具。

在这里，我指的是用键盘快捷键来使用它，因为这样可以节省大量的时间。

让我展示一下如何像专家一样用那些方便的键盘快捷键来使用 GNOME 截图应用。

我假定你没有改变这里的默认的截图的键盘快捷键。

### 对整个屏幕进行截图：使用 Prt Scr 键

这是最简单的操作。在你的键盘上找到 `Prt Sc`（或称 `Prt Scr`、`Prt Scn`）键并按下它。它将对整个屏幕进行截图，并将其保存在你的主目录下的图片文件夹中。

![Screenshot of entire screen saved as PNG file][5]

在某些发行版（或版本）中，你可能会看到是否要保存截图的选项，但大多数情况下，它会自动保存屏幕截图。

这里需要注意的另一件事是，如果你有多个屏幕连接到系统上，它会把所有的屏幕一起截图。这意味着，你会得到一个超宽的图像。

但是，如果你只想对某个应用进行截图，而不是对整个屏幕进行截图呢？

### 给一个应用程序的窗口截图：使用 Alt+Prt Scr 键

要给正在运行的图形应用截图，你需要这样做：

点击正在运行的应用，使其获得焦点。现在，按住 `Alt` 键并按 `Prt Scr` 键。

它将得到应用窗口的截图，并保存到图片目录中。

![Screenshot of an application window in GNOME][6]

这样获取的截图也有一个阴影效果，看起来很不错。

这很好，但如果你只想给某个特定区域截图，而不是整个屏幕呢？这也有一个技巧。

### 对屏幕的选定区域进行截图：使用 Shift+Prt Scr 键

按住 `Shift` 键。然后按 `Prt Scr` 键。你会看到屏幕上出现一个选框。将鼠标移动到所需的区域，开始拖动光标。它将高亮显示该区域，并在你释放鼠标后立即进行截图。

![Taking screenshot of an area in GNOME][7]

### 复制截图到剪贴板而不是保存它们

当你在和别人聊天时，要和对方分享屏幕截图时，这非常有用。

![Screenshot copied to the clipboard can be used in various applications][8]

首先截图，但没必要将保存的截图文件附在聊天工具中。相反，你可以直接将截图复制到剪贴板，然后使用 `Ctrl+V` 快捷键将图像（从剪贴板）粘贴到聊天工具。

这样，你的系统就不会保留不必要的截图，你也可以节省一些鼠标点击次数。

要把截图保存到剪贴板，以便你能把它们粘贴到聊天工具、绘图工具或文档中，你必须把 `Ctrl` 键和你在前面几节中看到的其他截图快捷键一起使用。

  * `Ctrl+Prt Scr`：将整个屏幕的截图复制到剪贴板上。
  * `Ctrl+Alt+Prt Scr`：将应用窗口的截图复制到剪贴板上。
  * `Ctrl+Shift+Prt Scr`：将选定区域的截图复制到剪贴板上

我必须补充一点，在这种情况下，[使用像 Flameshot 这样的工具][2] 甚至更好一些，因为它允许你在将截图保存到剪贴板之前对其进行注释。这样，你可以很容易地高亮屏幕的重要部分。

### 在截图中添加延迟，以便对下拉菜单进行截图

到目前为止，一切都很好。你只需按下几个键，就可以随心所欲地进行截图了。

问题是，当你要对下拉菜单或右键动作等进行截图时。当你按下屏幕截图键时，想要的项目可能会消失。

为了处理这种情况，你可以对该区域或整个屏幕进行截图，但要有一个延迟。

![Taking screenshot with delay][9]

在 GNOME 屏幕截图工具中，你可以选择添加这个延迟。例如，你添加了 6 秒的延迟。你点击截图按钮，有 6 秒时间来做/显示你想做的事情。6 秒后，它就会自动截图了。

### 你有什么技巧吗？ 

这就是我使用 GNOME  截图工具的所有技巧。如果你还没有广泛地使用它，你应该会发现它很有帮助。如果你已经是一个专家，也许你知道一些可以添加到本文中的东西？请在评论区与我们其他人分享吧。

--------------------------------------------------------------------------------

via: https://itsfoss.com/using-gnome-screenshot-tool/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/take-screenshot-linux/
[2]: https://itsfoss.com/flameshot/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/gnome-screenshot-tool.jpg?resize=800%2C413&ssl=1
[4]: https://apps.gnome.org/app/org.gnome.Screenshot/
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/screenshot-of-entire-screen-gnome.jpg?resize=800%2C532&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/screenshot-of-an-application-windows-gnome.png?resize=800%2C437&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/take-screenshot-of-region-gnome.webp?resize=800%2C430&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/saving-screenshot-to-clipboard-and-using-it.webp?resize=800%2C476&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/taking-screenshot-with-delay-gnome.webp?resize=800%2C428&ssl=1
