Linux 上的科学图像处理
============================================================

在显示你的数据和工作方面我发现了几个科学软件，但是我不会涉及太多方面。因此在这篇文章中，我将谈到一款叫 ImageJ 的热门图像处理软件。特别的，我会介绍 [Fiji][4]，这是一款绑定了一系列用于科学图像处理插件的 ImageJ 软件。

Fiji 这个名字是一个循环缩略词，很像 GNU 。代表着 “Fiji Is Just ImageJ”。 ImageJ 是科学研究领域进行图像分析的实用工具 —— 例如你可以用它来辨认航拍风景图中树的种类。 ImageJ 能划分物品种类。它以插件架构制成，海量插件可供选择以提升使用灵活度。

首先是安装 ImageJ （或 Fiji）。大多数的 ImageJ 发行版都可有该软件包。你愿意的话，可以以这种方式安装它，然后根据你的研究安装所需的独立插件。另一种选择是安装 Fiji 的同时获取最常用的插件。不幸的是，大多数 Linux 发行版的软件中心不会有可用的 Fiji 安装包。幸而，官网上的简单安装文件是可以使用的。这是一个 zip 文件，包含了运行 Fiji 需要的所有文件目录。第一次启动时，你只会看到一个列出了菜单项的工具栏。（图 1）

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif1.png)

*图 1. 第一次打开 Fiji 有一个最小化的界面。*

如果你没有备好图片来练习使用 ImageJ ，Fiji 安装包包含了一些示例图片。点击“File”->“Open Samples”的下拉菜单选项（图 2）。这些示例包含了许多你可能有兴趣做的任务。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif2.jpg)

*图 2. 案例图片可供学习使用 ImageJ。*

如果你安装了 Fiji，而不是单纯的 ImageJ ，那么大量插件也会被安装。首先要注意的是自动更新器插件。每次打开 ImageJ ，该插件将联网检验 ImageJ 和已安装插件的更新。

所有已安装的插件都在“插件”菜单项中可选。一旦你安装了很多插件，列表会变得冗杂，所以需要精简你选择的插件。你想手动更新的话，点击“Help”->“Update Fiji” 菜单项强制检测并获取可用更新的列表（图 3）。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif3.png)

*图 3. 强制手动检测可用更新。*

那么，现在，用 Fiji/ImageJ 可以做什么呢？举一例，统计图片中的物品数。你可以通过点击“File”->“Open Samples”->“Embryos”来载入示例。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif4.jpg)

*图 4. 用 ImageJ 算出图中的物品数。*

第一步给图片设定比例，这样你可以告诉 ImageJ 如何判别物品。首先，选择在工具栏选择线条按钮。然后选择“Analyze”->“Set Scale”，然后就会设置比例尺包含的像素点个数(图 5)。你可以设置“known distance ”为 100，单元为“um”。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif5.png)

*图 5. 很多图片分析任务需要对图片设定一个范围。*

接下来的步骤是简化图片内的信息。点击“Image”->“Type”->“8-bit”来减少信息量到 8 比特灰度图片。要分隔独立物体点击“Process”->“Binary”->“Make Binary”以自动设置图片门限。(图 6)。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif6.png)

*图 6. 有些工具可以自动完成像门限一样的任务。*

图片内的物品计数前，你需要移除像比例尺之类的人工操作。可以用矩形选择工具来选中它并点击“Edit”->“Clear”来完成这项操作。现在你可以分析图片看看这里是啥物体。

确保图中没有区域被选中，点击“Analyze”->“Analyze Particles”来弹出窗口来选择最小尺寸，这决定了最后的图片会展示什么（图 7）。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif7.png)

*图 7. 你可以通过确定最小尺寸生成一个缩减过的图片。 *

图 8 在总结窗口展示了一个概览。每个最小点也有独立的细节窗口。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif8.png)

*图 8. 包含了已知最小点总览清单的输出结果。*

当你有一个分析程序可以工作于给定图片类型，你通常需要将相同的步骤应用到一系列图片当中。这可能数以千计，你当然不会想对每张图片手动重复操作。这时候，你可以集中必要步骤到宏，这样它们可以被应用多次。点击插件->“Macros”->“Record”，弹出一个新的窗口记录你随后的所有命令。所有步骤完成，你可以将之保存为一个宏文件，并且通过点击“Plugins”->“Macros”->“Run”来在其它图片上重复运行。

如果你有非常特定的工作步骤，你可以简单地打开宏文件并手动编辑它，因为它是一个简单的文本文件。事实上有一套完整的宏语言可供你更加充分地控制图片处理过程。

然而，如果你有真的有非常多的系列图片需要处理，这也将是冗长乏味的工作。这种情况下，前往“Process”->“Batch”->“Macro”，会弹出一个你可以设置批量处理工作的新窗口（图 9）。

![](http://www.linuxjournal.com/files/linuxjournal.com/ufiles/imagecache/large-550px-centered/u1000009/12172fijif9.png)

*图 9. 对批量输入的图片用单一命令运行宏。*

这个窗口中，你能选择应用哪个宏文件、输入图片所在的源目录和你想写入输出图片的输出目录。也可以设置输出文件格式，及通过文件名筛选输入图片中需要使用的。万事具备之后，点击窗口下方的的“Process”按钮开始批量操作。

若这是会重复多次的工作，你可以点击窗口底部的“Save”按钮保存批量处理到一个文本文件。点击也在窗口底部的“Open”按钮重新加载相同的工作。这个功能可以使得研究中最冗余部分自动化，这样你就可以在重点放在实际的科学研究中。

考虑到单单是 ImageJ 主页就有超过 500 个插件和超过 300 种宏可供使用，简短起见，我只能在这篇短文中提出最基本的话题。幸运的是，还有很多专业领域的教程可供使用，项目主页上还有关于 ImageJ 核心的非常棒的文档。如果你觉得这个工具对研究有用，你研究的专业领域也会有很多信息指引你。 

--------------------------------------------------------------------------------

作者简介：

Joey Bernard 有物理学和计算机科学的相关背景。这对他在新不伦瑞克大学当计算研究顾问的日常工作大有裨益。他也教计算物理和并行程序规划。

--------------------------------

via: https://www.linuxjournal.com/content/image-processing-linux

作者：[Joey Bernard][a]
译者：[XYenChi](https://github.com/XYenChi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linuxjournal.com/users/joey-bernard
[1]:https://www.linuxjournal.com/tag/science
[2]:https://www.linuxjournal.com/tag/statistics
[3]:https://www.linuxjournal.com/users/joey-bernard
[4]:https://imagej.net/Fiji
