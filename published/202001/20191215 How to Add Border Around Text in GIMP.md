[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-11799-1.html)
[#]: subject: (How to Add Border Around Text in GIMP)
[#]: via: (https://itsfoss.com/gimp-text-outline/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

在 GIMP 中如何在文本周围添加边框
======

![](https://img.linux.net.cn/data/attachment/album/202001/19/230506fzkyktqglfcyzkuh.jpg)

这个简单的教程介绍了在 [GIMP][1] 中显示文本的轮廓的步骤。文本轮廓可以帮助你在其它颜色下高亮显示该文本。

![Outlined Text created in GIMP][2]

让我们看看如何在你的文本周围添加一个边框。

### 在 GIMP 中添加文本轮廓

整个过程可以用这些简单的步骤描述：

* 创建文本，并复制它的轮廓路径
* 添加一层新的透明层，并添加轮廓路径到透明层中
* 更改轮廓的大小，给它添加一种不同的颜色

这就是全部的东西。不用担心，我将使用适当地截图详细的展示每个步骤。按照这个教程，你应该能够为文本添加轮廓，即使你在此之前从未使用过 GIMP 。

仅需要确保你已经 [在 Linux 上安装 GIMP][3]，或者也可以使用的其它任何操作系统。

这篇教程在 GIMP 2.10 版本下演示。

#### 步骤 1: 创建你的主要文本，并复制它的轮廓

打开 GIMP ，并通过转到 “菜单 -> 文件 -> 新建” 来创建一个新的文件。你应该可以使用 `Ctrl+N` 键盘快捷键。

![Create New File][4]

你可以在这里选择画布的大小。你也可以选择要白色背景或一种透明背景。它在 “高级选项 -> 颜色” 配置文件下。

我选择默认的白色背景。它在以后能够更改。

现在从左边栏的工具箱中选择文本工具。

![Adding text in GIMP][5]

写你想要的文本。你可以根据你的选择以更改文本的字体、大小和对齐方式。我保持这篇文章的文本的默认左对齐。

我故意为文本选择一种浅色，以便难于阅读。在这篇教程中我将添加一个深色轮廓到这个浅色的文本。

![Text added in GIMP][6]

当你写完文本后，右键文本框并选择 “文本的路径” 。

![Right click on the text box and select ‘Path from Text’][7]

#### 步骤 2: 添加一个带有文本轮廓的透明层

现在，转到顶部菜单，转到“层”，并添加一个新层。

![Use Shift+Ctrl+N to add a new layer][8]

确保添加新层为透明的。你可以给它一个合适的名称，像“文本大纲”。单击确定来添加这个透明层。

![Add a transparent layer][9]

再次转到菜单，这次转到 “选择” ，并单击 “来自路径” 。你将看到你的文本应该被高亮显示。

![Go to Select and choose From Path][10]

总的来说，你只创建了一个透明层，它有像你的原文一样相同的文本（但是透明）。现在你需要做的是在这个层上增加文本的大小。

#### 步骤 3: 通过增加它的大小和更改它的颜色来添加文本轮廓

为此，再次在菜单中转到 “选择” ，这次选择 “增加”。这将允许增大透明层上的文本的大小。

![Grow the selection on the additional layer][11]

以 5 或 10 像素增加，或者你喜欢的任意像素。

![Grow it by 5 or 10 pixel][12]

你选择需要做是使用一种你选择的颜色来填充这个扩大的选择区。因为我的原文是浅色，在这里我将为轮廓使用背景色。

如果尚未选择的话，先选择你的主图像层。这些层在右侧栏中可视。然后转到工具箱并选择油漆桶工具。为你的轮廓选择想要的颜色。

选择使用该工具来填充黑色到你的选择区。记住。你填充文本外部的轮廓，而不是文本本身。

![Fill the outline of the text with a different color][13]

在这里你完成了很多。使用 `Ctrl+Shift+A` 来取消你当前的选择区。

![Outline added to the text][14]

如此，你现在已经在 GIMP 中成功地添加轮廓到你的文本。它是在白色背景中，如果你想要一个透明背景，只需要在右侧栏的图层菜单中删除背景层。

![Remove the white background layer if you want a transparent background][15]

如果你对结果感到满意，保存文件未 PNG 文件(来保留透明背景)，或你喜欢的任何文件格式。

### 你使它工作了吗？

就这样。这就是你在 GIMP 中为添加一个文本轮廓而需要做的全部工作。

我希望你发现这个 GIMP 教程有帮助。你可能想查看另一个 [关于在 GIMP 中添加一个水印的简单教程][16]。

如果你有问题或建议，请在下面自由留言。

--------------------------------------------------------------------------------

via: https://itsfoss.com/gimp-text-outline/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outlined_text_GIMP.png?ssl=1
[3]: https://itsfoss.com/gimp-2-10-release/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/create_outline_text_gimp_1.jpeg?ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_2.jpg?ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp-3.jpg?ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_4.jpg?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_5.jpg?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_6.jpg?ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_7.jpg?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_8.jpg?ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_9.jpg?ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_10.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_11.jpg?ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/12/outline_text_gimp_12.jpg?ssl=1
[16]: https://itsfoss.com/add-watermark-gimp-linux/
