[#]: subject: (Fotoxx: An Open Source App for Managing and Editing Large Photo Collection)
[#]: via: (https://itsfoss.com/fotoxx/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13559-1.html)

Fotoxx：用于管理和编辑大型照片集合的开源应用
======

![](https://img.linux.net.cn/data/attachment/album/202107/07/131024ej2kzv824zqb4zz8.jpg)

说到 [Linux 中的照片管理软件][1]，Shotwell 可能是其中最有名的。难怪它在许多发行版中都预装了。

但是，如果你正在寻找一个类似 Shotwell 而速度更快的应用，Fotoxx 可能是一个不错的选择。

它可能没有一个现代的用户界面，但它在处理大量照片集合时速度很快。这一点很重要，因为索引和显示成千上万张照片的缩略图可能需要相当多的时间和计算资源。

### 用 Fotoxx 在 Linux 中管理照片并编辑它们

![Fotoxx interface][2]

正如你在上面的截图中看到的，它没有漂亮的界面。看起来更像是一个 2010 年左右的应用。它在视觉上的不足，在功能和性能上得到了弥补。

你可以导入大量的照片，包括 RAW 图像。这些图片保持原样。它们不会被复制或移动。它们只是在应用中被索引。

你可以编辑图像元数据，如标签、地理标签、日期、评级、标题等。你可以根据这些元数据来搜索图片。

它还有一个地图功能，可以分组并显示属于某个地点的图片（基于图片上的地理标签数据）。

![Map view][3]

由于它专注于管理大型照片集合，有几个批处理功能，可以重命名、调整大小、复制/移动、转换图像格式和编辑元数据。

你可以选择图片来创建相册和幻灯片，所有这些都是在去重图片的情况下进行的。照片可以组合成 360 度的全景图。

Fotoxx 还有几个编辑功能，可以用来修饰图片，添加效果（如素描、绘画）、修剪、旋转等。

还有一些选项可以去除旧的、扫描照片打印件上的红眼和尘斑。

我可以继续列举功能清单，但这太长了。它的网站描述了它的[全部功能][4]，你应该去看看。

### 在 Linux 上安装 Fotoxx

请记住，**Fotoxx 的开发者建议使用一台强大的计算机**，有 4 个以上的 CPU 核心，16GB 以上的内存，以便正常运行。较小的计算机可能会很慢，或可能无法编辑大型图像。

Fotoxx 在大多数 Linux 发行版中都有，如 Debian、Ubuntu、Fedora 和 Arch Linux。只需使用你的发行版的包管理器或软件中心来搜索 Fotoxx 并安装它。

在基于 Ubuntu 和 Debian 的发行版上，你可以使用 apt 命令来安装它，像这样：

```
sudo apt install fotoxx
```

当你第一次运行它时，它会要求搜索主目录中的图像。你可以继续使用它，或者将搜索位置限制在选定的文件夹。

![][6]

我注意到，尽管在一分钟左右的时间内索引了 4700 多张，但它并没有立即开始显示图片。我不得不**点击 Gallery->All Folders，然后选择文件夹，然后它就显示了图片**。所以，这一点要记住。

Fotoxx 是一个功能广泛的工具，你需要一些时间来适应它并探索它的[所有功能][4]。它的网站列出了几个例子，你应该看看。

正如我前面所说，它不是最漂亮的应用，但它大量的功能列表可以完成任务。如果你是一个摄影师或有大量的图片收藏，你可以试试 Fotoxx，看看它是否符合你的需要。当你试过后，请在评论区分享你的经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/fotoxx/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/linux-photo-management-software/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/06/fotoxx-interface.jpg?resize=800%2C561&ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/06/fotoxx-geotag-map-view.jpg?resize=800%2C466&ssl=1
[4]: https://kornelix.net/fotoxx/fotoxx.html
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/06/fotoxx-indexing.png?resize=800%2C617&ssl=1
