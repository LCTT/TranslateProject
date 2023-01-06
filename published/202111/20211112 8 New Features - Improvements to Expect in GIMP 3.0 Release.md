[#]: subject: "8 New Features & Improvements to Expect in GIMP 3.0 Release"
[#]: via: "https://news.itsfoss.com/gimp-3-0-features/"
[#]: author: "Ankush Das https://news.itsfoss.com/author/ankush/"
[#]: collector: "lujun9972"
[#]: translator: "wxy"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-13987-1.html"

GIMP 3.0 中值得期待的 8 项新功能和改进
======

> 将带来重大改进的 GIMP 3.0 是最令人期待的版本之一。根据它最近的开发版本，这是一个预期的功能列表。

![](https://i2.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/GIMP-3-0-expected.jpg?w=1200&ssl=1)

[GIMP][1] 是可在 Linux 上使用的 [最佳免费图像编辑器][2] 之一。不仅仅适用于那些想要 Adobe 套件的免费替代品的用户，许多专业人士也使用 GIMP 进行艺术创作、设计和照片编辑。

尽管 GIMP 提供了许多必要的功能和选项，但在各种平台上已经出现了许多现代替代品，其中在一些方面已经超过了 GIMP。

不过，GIMP 3.0 可能是一个扭转局面的版本，它将使 GIMP 成为最好的现代产品之一，可与现有的商业对手相竞争。

本文将讨论预期出现在 GIMP 3.0 版本的功能。

### GIMP 3.0 值得期待的顶级功能

随着 GIMP 3.0 的版本发布，其开发版本增加了很多改进。

你或许想看到早期开发版本中的所有功能/变化，但我们将在本文中只能介绍其中重要的亮点。

### 1、基于 GTK3 的用户界面

![来源：GIMP 博客][3]

GIMP 3.0 将带来基于 GTK3 的用户界面的重新打造的视觉享受。除了改进的外观和感受，你还可以看到一些新的小工具。

别忘了，[爱德华•斯诺登也认为 GIMP 需要进行 UI 大修][4]。所以，GIMP 3.0 即使最终没有成为一种视觉享受，也应该在某种形式上有所改善。

在以前的 GIMP 版本中，它并不支持高像素密度的显示器。虽然可以使用，但如果你有一个更高分辨率的屏幕，GIMP 看起来就不够好。

现在，随着 GTK3 的加入，它增加了对高像素密度显示器的支持。你所要做的就是设置你的操作系统的首选缩放/分辨率，GIMP 应该可以支持它了。

### 2、Wayland 支持

向 GTK3 的过渡应该能提供更好的 Wayland 支持。因此，如果你开始使用 Wayland 桌面会话，GIMP 3.0 应该可以让你毫无问题地使用该应用程序。

### 3、多层选择

![来源：GIMP 播客][5]

最关键的新增功能之一是可以选择多个图层。

虽然这是一个需要很长时间才能完成的功能，但它终于在 GIMP 3.0 版本中实现了。

有了这个功能，人们可以轻松地管理和组织他们的工程中的几个图层。

根据现有的信息，他们正式提到了这个变化：

> 可停靠的图层现在完全可以进行多选，使用通常的交互方式进行多项目选择（“`Shift` + 点击”用于选择一系列图层，“`Ctrl` + 点击”用于选择或取消选择不相邻的层）。组织操作现在可以对所有选定的图层起作用，即你可以一次性移动、重新排序、删除、复制、合并（以及更多...）所有选定的图层。

换句话说，你可以选择多个图层，并同时对它们进行批量操作。

例如，你可以裁剪、移动、使用合并的图层中的颜色选择工具，并使用这个功能执行更多操作。

在发表这篇文章时，我注意到，根据他们的开发博客，这是一个正在进行的工作，有一些限制。希望在稳定版中，多层选择可以完美地工作。

### 4、新的插件 API

插件 API 保留了所有的基本功能，但也引入了一些新的改进。

因此，新的插件 API 应该不会对开发者造成任何破坏，而应该可以让他们把插件轻松地移植到 GIMP 3.0 应用程序上。

他们的开发版本中提到了一些改进：

  * 摆脱了对象 ID，转而使用真实的对象。特别是在 GIMP 3 中，`GimpImage`、`GimpItem`、`GimpDrawable`、`GimpLayer`、`GimpVectors`、`GimpChannel` 和 `GimpPDB` 都是对象（其他类别的对象已经存在或以后可能加入）。
  * 路径现在被当作 `GFile` 来处理，这意味着使用 GLib/GIO API。
  * GIMP API 应该可以完全支持各种语言（Python 3、JavaScript、Lua、Vala 等）。

### 5、绘画选择工具

![来源：GIMP 博客][6]

前景选择工具不会消失。然而，他们正在开发一个新的实验性的“绘画选择”工具，它可以让你逐步选择和绘制使用画笔的区域。

绘画选择工具的目的还在于克服前景选择工具对大图像的限制，并解决内存/稳定性问题。

考虑到它被列为实验性工具，我们不能确定它是否能进入稳定版，但它已经有了新的图标，你可以找到这个工具。

### 6、Windows Ink 支持

![来源：GIMP 播客][7]

当然，我们在这里讨论的都是 Linux。但是，GIMP 是一个流行的跨平台工具。

所以，为了吸引更多的用户，最好为专业人士或设计师使用的工具提供硬件支持。

GIMP 3.0 现在支持 Windows Ink 开箱即用，这要归功于它引入的 GTK3。你会从管理输入设备的设置中找到使用 Windows Ink API 的选项。

### 7、改进手势支持

GIMP 并不是笔记本电脑用户的最佳选择，或者更准确地说，不是触摸板/触摸屏用户的最佳选择。

然而，随着 GIMP 3.0 增加了手势支持，可以捏住画布放大/缩小，这种情况可能会有所改善。

我们还可能在最终版本中看到更多的手势支持，但截至 2.99.8 版本，也就是最新的开发版本，还没有新的手势。

### 8、改进的文件格式支持

GIMP 3.0 现在支持 JPEG-XL 文件格式，能够加载/导出带有灰度和 RGB 颜色配置文件的 .jxl 文件。

对 Adobe Photoshop 工程文件的支持也得到了改进。它现在可以处理大于 4GB 的 PSD 文件，同时加载多达 99 个通道。

除此以外，对 WebP 和 16 位 SGI 图像的支持也得到了改进。

### 总结

看看 [GIMP 的开发博客][8]，看起来他们几乎已经完成了最终版本。然而，他们并没有透露任何特定的发布日期时间表。

所以，一旦他们解决了错误并完成了改进，它就会到来。

你期待 GIMP 3.0 吗？它看起来是一个有希望的下一代版本吗？

--------------------------------------------------------------------------------

via: https://news.itsfoss.com/gimp-3-0-features/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://news.itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://itsfoss.com/image-applications-ubuntu-linux/
[3]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/gimp-2-99-2-gtk3.png?w=1200&ssl=1
[4]: https://news.itsfoss.com/gimp-ui-edward-snowden/
[5]: https://i0.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/gimp-2.99.2-multi-layer-selection.png?w=492&ssl=1
[6]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/gimp-paint-select-tool.png?w=800&ssl=1
[7]: https://i1.wp.com/news.itsfoss.com/wp-content/uploads/2021/11/gimp-windows-ink.png?w=1278&ssl=1
[8]: https://www.gimp.org/news/2021/10/20/gimp-2-99-8-released/
