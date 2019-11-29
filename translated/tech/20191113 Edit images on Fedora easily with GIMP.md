[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Edit images on Fedora easily with GIMP)
[#]: via: (https://fedoramagazine.org/edit-images-on-fedora-easily-with-gimp/)
[#]: author: (Mehdi Haghgoo https://fedoramagazine.org/author/powergame/)

在 Fedora 上使用 GIMP 简单地编辑图像
======

![][1]

GIMP ( GNU Image Manipulation Program 的缩写) 是自由和开源图像处理软件。有很多的功能，从简单地编辑图像,到复杂的滤镜，脚本，甚至是动画，它是一款很好的流行的商业选项的替代品。

继续阅读来学习如何在 Fedora 上安装和使用 GIMP 。这篇文章涉及基本的日常图像编辑。

### 安装 GIMP

GIMP 在官方 Fedora 存储库中可获得。为安装它，运行：

```
sudo dnf install gimp
```

### 单个窗口模式

在你打开应用程序后，它显示带有工具箱和主编辑区的暗色主题窗口。注意，它有两种窗口模式，你可以通过选择 _窗口_ -&gt; _单个窗口模式_ 在其中切换。通过选中这个选项，用户界面的所有组件将显示在单个窗口中。否则，它们将是分开的。

### 加载一个图像

![][2]

为加载一个图像，转到 _文件_ -&gt; _打开_ ，然后选择你的文件并选择你的图像文件。

### 重新调整一个图像的大小

为重新调整图像大小，你有以一对参数为基础的重新调整大小的选项，包括像素和百分比 — 在编辑图像时，这两个参数很方便。

让我们假使我们需要缩小 Fedora 30 背景图像到它当前大小的75%。为此，选择 _图像_ -&gt; _比例_ ，然后在比例对话框上，选择在单位下拉列表中的百分比。接下来，输入 _75_ 作为宽度或高度，然后按 **Tab** 键。默认情况下，为保持纵横比，其它尺寸将自动地与更改的尺寸对应来重新调整大小。现在，保存其它选项不变，并按比例。

![][3]

该图像缩小到其原始尺寸的75%。

### 旋转图像

旋转是一种变换操作，因此，你可以从主菜单下的 _图像_ -&gt; _变换_ 的下面找到它，其中有图像旋转90°或180°的选项。在上述选项下也有垂直或水平翻转图像的选项。

让我们假使我们需要旋转图像90°。在应用一次90°顺时针旋转和水平翻转后，我们的图像将看起来像这样：

![Transforming an image with GIMP][4]

### 添加文本

添加文本非常简单。只需要从工具箱中选择 A 图标，然后，在你的图像上，单击你想要添加文本的位置上一点。如果工具箱不可见，从 窗口-&gt;新建工具箱 打开它。

当你编辑文本时，你可能注意到，文本对话框有字体自定义选项，包括字体系列，字体大小等等。

![Adding text to image in GIMP][5]

### 保存和导出

你可以从 _文件_ -&gt; _保存_ 或通过按 **Ctrl+S** 来保存你的编辑为一个带有 _xcf_ 扩展名的 GIMP 工程。或者，你可以导出你的图像，例如，以 PNG 或 JPEG 格式。为导出，转到 _文件_ -&gt; _导出为_ 或按 **Ctrl+Shift+E** ，接下来，在你面前将产生一个你可以选择输出图像和名称的对话框。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/edit-images-on-fedora-easily-with-gimp/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[robsean](https://github.com/robsean)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/gimp-magazine-816x346.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2019/10/Screenshot-from-2019-10-25-11-00-44-300x165.png
[3]: https://fedoramagazine.org/wp-content/uploads/2019/10/Screenshot-from-2019-10-25-11-17-33-300x262.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/10/Screenshot-from-2019-10-25-11-41-28-300x243.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/10/Screenshot-from-2019-10-25-11-47-54-300x237.png

