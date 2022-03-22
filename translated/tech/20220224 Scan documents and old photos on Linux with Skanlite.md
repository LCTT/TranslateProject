[#]: subject: "Scan documents and old photos on Linux with Skanlite"
[#]: via: "https://opensource.com/article/22/2/scan-documents-skanlite-linux-kde"
[#]: author: "Seth Kenlon https://opensource.com/users/seth"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

用 Skanlite 在 Linux 上扫描文件和老照片
======
使用这个 Linux KDE 应用，将你的档案数字化。
![Filing papers and documents][1]

虽然现在的世界已经大部分实现了数字化，但仍有一些时候，你只需要打印一份表格，签字，然后把它扫描回来。有时候，我发现在手机上拍个快照就够了，但有些行业需要比草率的快照更好的复印件，因此平板扫描仪是必要的。KDE 项目提供了一个叫做 Skanlite 的应用程序，它可以帮助你导入在平板上扫描的文件，甚至是用联机相机扫描的文件。

### 在 Linux 上安装 Skanlite

你可以从你的软件库中安装 Skanlite。在 Fedora、Mageia 和类似的地方：


```
`$ sudo dnf install skanlite`
```

在 Elementary、Linux Mint 和其他基于 Debian 的发行版上：


```
`$ sudo apt install skanlite`
```

### 扫描仪驱动

市场上的大多数扫描仪都与 SANE 扫描仪 API 兼容。SANE 并不是一个真正的驱动，而是一个协议，可以接收来自图像采集设备的输入，并为希望围绕它建立一个应用的程序员提供选项。Skanlite 就是这样一个应用。

我还没有遇到过不与 SANE 接口兼容的扫描仪，但可能也有不与 SANE 接口兼容的扫描仪。在这些情况下，请在制造商的网站上寻找 SANE 或 TWAIN 的驱动，或者寻找它们专有的驱动和扫描仪接口。后者可能无法使用 Skanlite，但当你不确定你的扫描仪是否通过标准协议进行通信时，Skanlite 总是值得启动。我甚至遇到过打印机和扫描仪的组合设备，尽管打印机需要一个额外的驱动，但扫描仪却能立即被识别。

### 使用 Skanlite

当你启动 Skanlite 时，它首先会在你的系统中搜索图像采集设备。在笔记本电脑上，Skanlite 通常会发现网络摄像头是一个有效的输入源（因为它是），但它也会找到连接到你机器上的平板扫描仪。选择你要使用的扫描仪，然后继续。

要看扫描的内容，点击应用程序右下角的**预览**按钮。

![Skanlite with custom artwork][2]

（图片来源：KDE）

这将在右面板上显示一个预览图像。没有任何东西被保存到你的硬盘上，这只显示你的扫描仪上目前有什么。

### 选择一个扫描区域

如果你只需要扫描仪上的一部分内容，你可以选择一个你想保存的区域。要选择一个单一的区域，在你想保存的区域上点击并拖动你的鼠标。当有一个有效的选择时，当你点击**扫描**按钮时，只有你选择的那部分文件会被保存。

你可以有一个以上的选区，当你需要扫描几个小图像或只扫描一个大文件的特定部分时，这特别有效。要添加一个选区，请点击出现在选区中心的 **+** 图标。

![Adding selections][3]

（图片来源：KDE）

你可以通过点击 **-** 图标来删除选区，当你有多个活动选区时，该图标会出现。

### 扫描设置

图像采集设置位于左边的面板上。这些控件允许你导入彩色或灰度的图像，并对图像的亮度和对比度进行调整。这些选项是基于软件的，不影响你的扫描仪的行为方式，但它们是常见的调整，在这里做这些调整可以使你不必在 GIM 或 Gwenview 中对图像进行后期处理。

在许多情况下，你的扫描仪可能有可配置的设置，可在 Skanlite 窗口左侧的**扫描仪特定选项**标签中找到。有些扫描仪允许你调整色温、亮度、饱和度和其他发生在固件中的属性。可用的选项根据设备和供应商的不同而不同，所以你有可能在这个面板上看到变化，这取决于你与哪种设备的对接。

### 扫描和保存

当你准备好导入图像（或图像的选定区域，如果你已经做了选择）时，点击 Skanlite 窗口右下角的**扫描**按钮。根据你的设备，它可能需要一些时间来创建扫描，但当它完成后，会提示你保存或丢弃图像。如果你喜欢你所看到的，点击**保存**。

图像会被保存到你所配置的任何默认位置。要查看默认位置，点击窗口右下角的**设置**按钮。在 **Skanlite 设置**中，你可以设置默认保存位置、默认名称格式和图像分辨率。你还可以控制每次扫描后是否提示你保存或丢弃图像，或者你是否喜欢保存所有的东西并在以后进行分类。

### Linux 上的扫描很容易

在 Linux 上扫描文件是如此简单，我很少考虑这个问题。通常没有特殊的驱动或应用需要你去寻找和安装，因为像 Skanlite 这样的应用使用开放协议，使这个过程变得简单。下次你有一份需要数字化的拷贝时，用 Skanlite 导入它。

--------------------------------------------------------------------------------

via: https://opensource.com/article/22/2/scan-documents-skanlite-linux-kde

作者：[Seth Kenlon][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/seth
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/documents_papers_file_storage_work.png?itok=YlXpAqAJ (Filing papers and documents)
[2]: https://opensource.com/sites/default/files/skanlite.png (Skanlite with custom artwork)
[3]: https://opensource.com/sites/default/files/skanlite-selection.jpg (Adding selections)
