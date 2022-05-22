[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12719-1.html)
[#]: subject: (Present Slides in Linux Terminal With This Nifty Python Tool)
[#]: via: (https://itsfoss.com/presentation-linux-terminal/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 Linux 终端中展示幻灯片
======

![](https://img.linux.net.cn/data/attachment/album/202010/15/000226j34xnkzzg7z7x9ka.jpg)

演示文稿往往是枯燥的。这就是为什么有些人会添加动画或漫画/meme 来增加一些幽默和风格来打破单调。

如果你需要在你的大学或公司的演示文稿中加入一些独特的风格，那么使用 Linux 终端怎么样？想象一下，这将是多么酷的事情啊！

### Present：Linux 终端中进行演示

在终端中可以做很多[有趣好玩的事情][1]。制作和展示幻灯片只是其中之一。

这个基于 Python 的应用名为 [Present][2]，它可以让你创建基于 Markdown 和 YML 的幻灯片，你可以在你的大学或公司里演讲，并以真正的极客风格取悦人们。

我制作了一个视频，展示了在 Linux 终端中用 Present 演示一些东西的样子。

- [VIDEO](https://img.linux.net.cn/static/video/Makes%20ASCII%20Based%20Presentation%20Slides%20in%20Linux%20terminal-462902030.mp4)

#### Present 的功能

你可以用 Present 做以下事情：

  * 使用 Markdown 语法在幻灯片中添加文本
  * 用箭头或 `PgUp`/`Down` 键控制幻灯片
  * 改变前景和背景颜色
  * 在幻灯片中添加图像
  * 增加代码块
  * 播放模拟代码，并用 codio YML 文件输出

#### 在 Linux 上安装 Present

Present 是一个基于 Python 的工具，你可以使用 PIP 来安装它。你应该确保用这个命令[在 Ubuntu 上安装 Pip][4]：

```
sudo apt install python3-pip
```

如果你使用的是其他发行版，请检查你的包管理器来安装 PIP3。

安装 PIP 后，你就可以以这种方式全局安装 Present：

```
sudo pip3 install present
```

你也可以只为当前用户安装，但你也必须将 `~/.local/bin` 添加到你的 `PATH` 环境变量。

#### 在 Linux 终端中使用 Present 来创建和展示幻灯片

![][5]

由于 Present 使用了 Markdown 语法，你应该用它来创建自己的幻灯片。在这里使用 [Markdown 编辑器][6]会有帮助。

Present 需要一个 Markdown 文件来读取和播放幻灯片。你可以[下载这个示例幻灯片][7]，但你需要单独下载嵌入的图像，并将它放在图像文件夹内。

  * 在 Markdown 文件中使用 `—` 来分隔幻灯片。
  * 使用 Markdown 语法在幻灯片中添加文本。
  * 使用以下语法添加图片 `![RC] (images/name.png)`。
  * 通过添加像 `<!– fg=white bg=red –>` 这样的语法来改变幻灯片的颜色。
  * 使用像 `<!– effect=fireworks –>` 这样的语法来添加带有效果的幻灯片。
  * 使用 [codio 语法][8] 添加代码运行模拟。
  * 使用 `q` 退出演示，并用左/右箭头或 `PgUp`/`Down` 键控制幻灯片。

请记住，在演示时调整终端窗口的大小会把东西搞乱，按回车键也是如此。

### 总结

如果你熟悉 Markdown 和终端，使用 Present 对你来说并不困难。

你不能把它和常规的用 Impress、MS Office 等制作的幻灯片相比，但偶尔使用，它是一个很酷的工具。如果你是计算机科学/网络专业的学生，或者是开发人员或系统管理员，你的同事一定会觉得很有趣。

--------------------------------------------------------------------------------

via: https://itsfoss.com/presentation-linux-terminal/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/funny-linux-commands/
[2]: https://github.com/vinayak-mehta/present
[4]: https://itsfoss.com/install-pip-ubuntu/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/presentation-in-linux-terminal.png?resize=800%2C494&ssl=1
[6]: https://itsfoss.com/best-markdown-editors-linux/
[7]: https://github.com/vinayak-mehta/present/blob/master/examples/sample.md
[8]: https://present.readthedocs.io/en/latest/codio.html
