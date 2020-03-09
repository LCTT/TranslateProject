[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11975-1.html)
[#]: subject: (How to Add New Brushes in GIMP [Quick Tip])
[#]: via: (https://itsfoss.com/add-brushes-gimp/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

快速技巧：如何在 GIMP 中添加新画笔
======

[GIMP][1] 是最流行的自由开源的图像编辑器，它也许是 Linux 上最好的 [Adobe Photoshop 替代品][2]。

当你[在 Ubuntu 或其他任何操作系统上安装了 GIMP 后][3]，你会发现已经安装了一些用于基本图像编辑的画笔。如果你需要更具体的画笔，你可以随时在 GIMP 中添加新画笔。

怎么样？让我在这个快速教程中向你展示。

### 如何在 GIMP 中添加画笔

![][4]

在 GIMP 中安装新画笔需要三个步骤：

* 获取新画笔
* 将其放入指定的文件夹中
* 刷新 GIMP 中的画笔

#### 步骤 1：下载新的 GIMP 画笔

第一步是获取新的 GIMP 画笔。你从哪里获取？当然是从互联网上。

你可以在 Google 或[如 Duck Duck Go 这种隐私搜索引擎][5]来搜索 “GIMP brushes”，并从网站下载一个你喜欢的。

GIMP 画笔通常以 .gbr 和 .gih 文件格式提供。.gbr 文件用于常规画笔，而 .gih 用于动画画笔。

> 你知道吗？
> 
> 从 2.4 版本起，GIMP 使安装和使用 Photoshop 画笔（.abr 文件）非常简单。你只需将 Photoshop 画笔文件放在正确的文件夹中。
>
> 请记住，最新的 Photoshop 画笔可能无法完美地在 GIMP 中使用。

#### 步骤 2：将新画笔复制到它的位置

获取画笔文件后，下一步是复制该文件并将其粘贴到 GIMP 配置目录中所在的文件夹。

> 在微软 Windows 上，你必须进入类似 `C:\Documents and Settings\myusername.gimp-2.10\brushes` 这样的文件夹。

我将展示 Linux 上的详细步骤，因为我们是一个专注于 Linux 的网站。

选择画笔文件后，在家目录中按下 `Ctrl+h` [查看 Linux 中的隐藏文件][6]。

![Press Ctrl+H to see hidden files in the home directory][7]

你应该进入 `.config/GIMP/2.10/brushes` 文件夹（如果你使用的是 GIMP 2.10）。如果使用其他版本，那么应在 `.config/GIMP` 下看到相应文件夹。

![Adding New Brushes in GIMP][8]

将画笔文件粘贴到此文件夹中。可选地，你可以通过再次按 `Ctrl+h` 来隐藏隐藏的文件。

#### 步骤 3：刷新画笔（避免重启 GIMP）

GIMP 将在启动时自动加载画笔。如果已在运行，并且不想关闭它，你可以刷新画笔。

在 GIMP 的主菜单中找到 “Windows->Dockable Dialogues->Brushes”。

![Refresh GIMP Brushes by going go to Windows->Dockable Dialogues-> Brushes][9]

在右侧栏的 Brushes 对话框中找到“refresh”图标。

![Refresh GIMP Brushes][10]

如果你的画笔没有出现，那么你可以试试重启 GIMP。

> 额外的技巧！
>
> 在 [GIMP 中添加新画笔还能让你轻松给图片添加水印][11]。只需将 logo 用作画笔，并点击一下就可添加到图片中。

我希望你喜欢这个快速 GIMP 技巧。敬请期待更多。

--------------------------------------------------------------------------------

via: https://itsfoss.com/add-brushes-gimp/

作者：[Community][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://itsfoss.com/open-source-photoshop-alternatives/
[3]: https://itsfoss.com/gimp-2-10-release/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Install-New-Brushes-in-GIMP.jpg?ssl=1
[5]: https://itsfoss.com/privacy-search-engines/
[6]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/adding-brushes-GIMP-1.jpg?ssl=1
[8]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/adding-brushes-GIMP.png?ssl=1
[9]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/Refresh-GIMP-Brushes.jpg?ssl=1
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/03/Refresh-GIMP-Brushes-2.jpg?ssl=1
[11]: https://itsfoss.com/add-watermark-gimp-linux/
