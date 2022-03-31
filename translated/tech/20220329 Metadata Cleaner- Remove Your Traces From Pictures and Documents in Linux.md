[#]: subject: "Metadata Cleaner: Remove Your Traces From Pictures and Documents in Linux"
[#]: via: "https://itsfoss.com/metadata-cleaner/"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Metadata Cleaner：在 Linux 中清除你在图片和文件中的痕迹
======

**简介：** _摆脱元数据对增强隐私至关重要。Metadata Cleaner 是一个开源的 Linux 应用，可以帮助你做到这一点。让我们在这里探讨更多。_

元数据无处不在，无论是文档、信息、图片还是其他文件类型。

当你检查一个文件的属性时，你可以很容易地访问元数据。

然而，用户在共享文件之前，往往不注重消除或摆脱元数据。主要是因为他们可能不知道有什么简单的工具可以使这项工作更容易。

Metadata Cleaner 就是这样一个供 Linux 用户使用的工具。

### Metadata Cleaner：轻松摆脱你的元数据

![][1]

Metadata Cleaner 帮助你删除与元数据相关的信息的痕迹。它利用 [mat2][2] 来删除元数据。

换句话说，你可以假设 GUI 是 mat2 的前端。

例如，一张照片包括拍摄地点、使用的相机、镜头信息等信息。

虽然这对某些人来说可能是有用的信息，但如果你想保持所有细节的私密性，你就需要删除元数据。

文件的情况也是如此。删除元数据可以确保提高隐私性，无论是对你的业务还是个人使用。

你必须添加目标文件，并使用 Metadata Cleaner 处理它们，使它们得到清理。

**注意**：_在清理之前，你必须保留一份文件的备份。摆脱你的元数据可能会导致你的文件发生剧烈的变化，比如无法选择 PDF 文件中的文本，压缩图片等_。

### Metadata Cleaner 的特性

![][3]

Metadata Cleaner 是一个简单的工具，具有一些有用的功能。让我在下面提到它的主要亮点：

  * 能够添加多个文件进行清理。
  * 检查每个添加的文件的元数据信息。
  * 查看与每个添加的文件相关的元数据信息的数量。
  * 一键式清理，最大限度地去除元数据。
  * 有一个轻量级的清理模式，不会对文件造成很大影响。
  * 支持键盘快捷键。
  * 可以从内部创建一个新的窗口。
  * 你可以添加整个文件夹来处理多个文件。



我开始用一般的截图、几张照片和从网上下载的文件来测试。

![][4]

正如你在上面的截图中注意到的，PDF 文件包含了很多关于其来源的信息。

这只是一个例子。同样，如果你想与某人或公众分享一个 PDF 文件，不想让别人看到它的来源信息，你可以使用 Metadata Cleaner 清理你的踪迹。

如前所述，如果文件对你很重要，如果清理过程以你不希望的方式影响文件，请确保适当的备份。

![][5]

你也可以使用它的轻量级清理模式，在不影响文件的情况下进行最小的元数据清除。

例如，我对一个 PDF 样本使用了标准清理方法，下面是它的样子：

![][6]

同样，在处理文档和图片时，你会有大部分的基本数据被移除。

### 在 Linux 中安装 Metadata Cleaner

Metadata Cleaner 是以 [Flatpak 包][7]的形式提供的。因此，考虑到你[设置了 Flatpak][8]或者你已经启用了它，你可以在任何 Linux 发行版上安装它。

你可以在终端使用以下命令来安装它（如果你没有软件中心集成）：

```

    flatpak install flathub fr.romainvigier.MetadataCleaner

```

你可以到它的[网站][9]或 [GitLab 页面][10]去探索更多关于它的信息。

[Metadata Cleaner][9]

_你以前尝试过清除元数据的痕迹吗？你对这个工具有什么看法？请在下面的评论中告诉我你的想法。_

--------------------------------------------------------------------------------

via: https://itsfoss.com/metadata-cleaner/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner.jpg?resize=800%2C561&ssl=1
[2]: https://0xacab.org/jvoisin/mat2
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner-3.png?resize=800%2C592&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner-1.png?resize=800%2C592&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner-lightweight-mode.png?resize=800%2C199&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2022/03/metadatacleaner-example.png?resize=800%2C326&ssl=1
[7]: https://itsfoss.com/what-is-flatpak/
[8]: https://itsfoss.com/flatpak-guide/
[9]: https://metadatacleaner.romainvigier.fr/
[10]: https://gitlab.com/rmnvgr/metadata-cleaner/
