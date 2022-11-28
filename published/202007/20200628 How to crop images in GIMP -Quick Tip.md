[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12427-1.html)
[#]: subject: (How to crop images in GIMP [Quick Tip])
[#]: via: (https://itsfoss.com/crop-images-gimp/)
[#]: author: (Dimitrios Savvopoulos https://itsfoss.com/author/dimitrios/)

GIMP 教程：如何使用 GIMP 裁剪图像
======

你可能想在 [GIMP][1] 中裁剪图像的原因有很多。例如，你可能希望删除无用的边框或信息来改善图像，或者你可能希望最终图像的焦点是在一个特定细节上。

在本教程中，我将演示如何在 GIMP 中快速裁剪图像而又不影响精度。让我们一起来看看吧。

### 如何在 GIMP 中裁剪图像

![][2]

#### 方法 1

裁剪只是一种将图像修整成比原始图像更小区域的操作。裁剪图像的过程很简单。

你可以通过“工具”面板访问“裁剪工具”，如下所示：

![Use Crop Tool for cropping images in GIMP][3]

你还可以通过菜单访问裁剪工具：“<ruby>工具 → 变形工具 → 裁剪<rt>Tools → Transform Tools → Crop</rt></ruby>”。

激活该工具后，你会注意到画布上的鼠标光标会发生变化，以表示正在使用“裁剪工具”。

现在，你可以在图像画布上的任意位置单击鼠标左键，并将鼠标拖到某个位置以创建裁剪边界。此时你不必担心精度，因为你可以在实际裁剪之前修改最终选区。

![Crop Selection][4]

此时，将鼠标光标悬停在所选内容的四个角上会更改鼠标光标并高亮显示该区域。现在，你可以微调裁剪的选区。你可以单击并拖动任何边或角来移动部分选区。

选定完区域后，你只需按键盘上的回车键即可进行裁剪。

如果你想重新开始或者不裁剪，你可以按键盘上的 `Esc` 键。

#### 方法 2

裁剪图像的另一种方法是使用“矩形选择工具”进行选择：“<ruby>工具 → 选择工具 → 选择矩形<rt>Tools → Selection Tools → Rectangle Select</rt></ruby>”。

![][5]

然后，你可以使用与“裁剪工具”相同的方式高亮选区，并调整选区。选择好后，可以通过以下方式裁剪图像来适应选区：“<ruby>图像 → 裁剪为选区<rt>Image → Crop to Selection</rt></ruby>”。

![][6]

### 总结

对于 GIMP 用户而言，精确裁剪图像可以视为一项基本功能。你可以选择哪种方法更适合你的需求并探索其潜力。

如果你对过程有任何疑问，请在下面的评论中告诉我。如果你“渴望”更多 [GIMP 教程][7]，请确保在你喜欢的社交媒体平台上订阅！

--------------------------------------------------------------------------------

via: https://itsfoss.com/crop-images-gimp/

作者：[Dimitrios Savvopoulos][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/dimitrios/
[b]: https://github.com/lujun9972
[1]: https://www.gimp.org/
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Crop-images-in-GIMP.png?ssl=1
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/Crop-tool.png?ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/Crop-selection.jpg?ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/select-1.gif?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/crop.gif?ssl=1
[7]: https://itsfoss.com/tag/gimp-tips/
