[#]: subject: "How to Install themes on Xubuntu and Other Distros Using Xfce Desktop Environment"
[#]: via: "https://itsfoss.com/install-themes-xfce-xubuntu/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13932-1.html"

如何在使用 Xfce 桌面环境的 Xubuntu 上安装主题
======

![](https://img.linux.net.cn/data/attachment/album/202110/29/103958hrv6vruu163zrtvr.png)

> 这是一个循序渐进的初学者教程，展示了如何在 Xubuntu 和其他使用 Xfce 桌面环境的 Linux 发行版中安装主题和图标。

在 Xubuntu 上安装主题与 Ubuntu 或其他 Linux 发行版类似。你把主题文件放在 `~/.themes` 文件夹中，然后用一个工具来改变它。

然而，考虑到 Xubuntu 使用 [Xfce 桌面环境][1]，一些选项或用户界面看起来会有所不同。这就是为什么我创建了这个教程，用适当的截图来展示步骤。

### 在 Xubuntu（Xfce）中安装新主题

开始前，你需要在主目录下创建一个 `.themes` 文件夹。注意文件夹名称前的点（`.`）。它很重要，可以从正常的视图中隐藏该文件夹。

要检查你是否已经有了它，你可以 [启用查看隐藏文件][2]，然后在它不存在的时候创建它。

![][3]

完成后，你需要下载一个主题。

1、你可以在 [Xfce-look][4] 门户网站上浏览 XFCE 主题。你所要做的就是下载存档（压缩）文件。

2、接下来，你需要 [解压缩文件][5]，如下面的截图所示。

![][6]

3、解压后，你会发现出现一个文件夹，你要复制它。

![][7]

4、然后你要把这个文件夹粘贴到你最初创建的 `.themes` 目录中。

![][8]

5、最后，你需要到外观设置中找到它，并选择它/应用它以使其生效。

![][9]

正如你在下面的截图中注意到的，新的主题已经被添加和应用：

![][10]

除了主题之外，如果你需要定制你的 Xubuntu 桌面的图标，你需要在主目录中创建另一个 `.icons` 文件夹。

就像你安装主题一样，你将不得不遵循一个类似的过程来应用图标主题。

为了给你一个例子，让我在这里强调这些步骤：

### 在 Xubuntu（Xfce） 中添加图标主题

你可以浏览同样的 [xfce-look portal][11] 来寻找完整的图标主题。

或者，你可以寻找一些最好的 [可用于 Ubuntu 的图标主题][12]，它们应该也适用于 Xubuntu。

一旦你找到了你喜欢的，就下载它，并按下面的方式解压。

![][13]

接下来，你需要把这个文件夹复制并粘贴到 `.icons` 文件夹中。

![][14]

现在，你可以回到外观设置中，找到列在“图标”下的可用图标。

为了向你展示区别，**我把默认的 Xubuntu 主题改为 adwaita-dark**，你可以在这里看到：

![][15]

**注意**：一些图标或主题文件可能包含有不同变体的嵌套文件夹。你会注意到它们并没有出现在外观工具中。如果是这种情况，直接将内部文件夹复制到 `~/.themes` 或 `~/.icons` 文件夹中。

### 总结

通过对风格和图标的调整，你可以 [定制你的 Xubuntu 体验][16] 以融入你的品味。

你是喜欢默认的 Xubuntu 外观还是使用不同的主题/图标来定制它的外观？请在评论中告诉我你的想法。

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-themes-xfce-xubuntu/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://xfce.org/
[2]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/xubuntu-hidden-files.png?resize=674%2C300&ssl=1
[4]: https://www.xfce-look.org/browse?cat=138&ord=latest
[5]: https://itsfoss.com/unzip-linux/
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/extract-xubuntu-theme.png?resize=719%2C537&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/extracted-xubuntu-theme.png?resize=709%2C272&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/copy-theme-xubuntu.png?resize=705%2C328&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/10/appearance-xfce.png?resize=703%2C544&ssl=1
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/xpro-xubuntu-theme.png?resize=1162%2C599&ssl=1
[11]: https://www.xfce-look.org/browse?cat=132&ord=latest
[12]: https://itsfoss.com/best-icon-themes-ubuntu-16-04/
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/10/xubuntu-icon-theme.png?resize=756%2C560&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/xubuntu-icon-theme-selection.png?resize=739%2C534&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/10/xubuntu-icon-theme-change.png?resize=1154%2C619&ssl=1
[16]: https://itsfoss.com/customize-xfce/
