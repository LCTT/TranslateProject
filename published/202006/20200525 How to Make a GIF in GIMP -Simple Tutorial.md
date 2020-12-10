[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12289-1.html)
[#]: subject: (How to Make a GIF in GIMP [Simple Tutorial])
[#]: via: (https://itsfoss.com/make-gif-in-gimp/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

初级：如何在 GIMP 中制作 GIF
======

制作一个 GIF 可能是一件很有趣的事，很多用户可能都想如何制作一个 GIF。你可以使用功能强大的开源图像编辑软件 [GIMP][1] 创建一个非常简单的 GIF。

在这篇 GIMP 教程中，我将向你展示如何在 GIMP 中创建一个简单的 GIF。

### 在 GIMP 中制作一个 GIF 

![][2]

使用 GIMP 作为一个动画制作工具需要你把每个图层都看作动画的一帧。在这篇教程中，我将创建一个简单的基于我们的徽标的网页横幅。我将使用 2 个图像作为我的图层，但当你制作自己的 GIF 时，你可以随意添加更多的图像。

我在这里使用的方法叫做“组合法”，在这个方法中，新的帧被添加到先前的帧中。我的想法是制作一个“频闪”的网页横幅，来在对一些重要的事情引起注意。

我假设你已经 [在 Ubuntu 或其它使用的操作系统中安装了 GIMP][3]。让我们开始制作 GIF 吧。

#### 步骤 1

从“文件”菜单中，单击“作为图层打开”，并选择你想包含在 GIF 中的所有图像。然后单击“打开”。

![][4]

你可以排序图层标签页中的图像。GIF 的帧序列将从最下面的图层开始，从下到上运行每一层图层。

![][5]

从主菜单中选择“滤镜”，接着选择“动画”，最后单击“优化（用于 GIF）”。

![][6]

> “优化”做了什么？
>
> 优化会检查每一个图层，如果来自前一帧的信息在下一帧中没有改变，则重复使用这些信息。它只存储新更改的像素值，并清除任何重复的部分。
>
> 如果一帧与前一帧完全相同，那么它将完全删除这一幅帧，并且前一帧将恰当地在屏幕上停留更长时间。

要查看该 GIF，从主菜单中单击“滤镜”，接着单击“动画”和“回放”。

![][7]

按下“回放”按钮来启动 GIF。要保存该 GIF，在文件菜单上选择“文件”，单击“导出为”。

![][8]

命名你的 GIF，并选择你想将其保存到的文件夹。在“选择文件类型”时，选择 “GIF 图像”。

![][9]

当提示时，选择“作为动画”、“反复循环”,设置期望的延迟值，并单击“上面输入的延迟用于所有帧”来生效。

最重要的选项是设置帧处理动作为“累积各图层（组合）”，以便为我们的横幅获取“频闪”效果。单击“导出”作为最后一个步骤。

![][10]

你的 GIF 已经准备好了！

![][11]

这是一个浅显易懂的示例，不过 GIMP 在动画创作方面有很多能力，需要大量的学习和实践才能掌握它。

--------------------------------------------------------------------------------

via: https://itsfoss.com/make-gif-in-gimp/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/create-gif-in-gimp.jpg?ssl=1
[3]: https://itsfoss.com/gimp-2-10-release/
[4]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/1.-open-as-layers.jpeg?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/layers-order.jpg?ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/2.-optimize-for-gif-1.png?fit=800%2C647&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/05/3.-playback.png?fit=800%2C692&ssl=1
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/4.-export-as.png?ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/05/5.-save-as-gif.png?fit=800%2C677&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/6.-export-options-1.png?ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/05/its-foss-logo.gif?fit=800%2C417&ssl=1
[12]: https://itsfoss.com/subscribe-to-newsletter/
