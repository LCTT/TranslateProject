[#]: collector: "lujun9972"
[#]: translator: "zero-mk "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "
[#]: subject: "Top Hex Editors for Linux"
[#]: via: "https://itsfoss.com/hex-editors-linux"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"

Top Hex Editors for Linux
======

十六进制编辑器可以让你以十六进制的形式查看/编辑文件的二进制数据，因此其被命名为“十六进制”编辑器。说实话，并不是每个人都需要它。只有必须处理二进制数据的特定用户组才会使用到它。

如果您不知道，它是什么，让我举个例子。假设您拥有游戏的配置文件，您可以使用十六进制编辑器打开它们并更改某些值以获得更多的弹药/分数等等。 想要了解有关Hex编辑器的更多信息，你可以参阅 [Wikipedia page][1]。

如果你已经知道它用来干什么了 —— 让我们来看看Linux最好的Hex编辑器。

### 5个最好的十六进制编辑器

![Best Hex Editors for Linux][2]

**注意：**提到的十六进制编辑器没有特定的排名顺序。

#### 1\. Bless Hex Editor

![bless hex editor][3]

**主要特点：**

  * 编辑裸设备（Raw disk ）
  * 多级撤消/重做操作
  * 多个标签
  * 转换表
  * 支持插件扩展功能



Bless是Linux上最流行的Hex编辑器之一。您可以在AppCenter或软件中心中找到它。 如果不是这种情况，您可以查看他们的 [GitHub page][4] 获取构建和相关的说明。

它可以轻松处理编辑大文件而不会降低速度——因此它是一个快速的十六进制编辑器。

#### 2\. GNOME Hex Editor

![gnome hex editor][5]

**主要特点：**

  * 以 十六进制/Ascii格式 查看/编辑

  * 编辑大文件

  *


另一个神奇的十六进制编辑器-专门为GNOME量身定做的。 我个人用的是 Elementary OS, 所以我可以在 软件中心（AppCenter）找到它.。您也可以在软件中心找到它。如果没有,请参考 [GitHub page][6] 获取源代码。

您可以使用此编辑器以十六进制或ASCII格式 查看/编辑 文件。用户界面非常简单——正如您在上面的图像中看到的那样。

#### 3\. Okteta

![okteta][7]

**主要特点：** 

  * 可自定义的数据视图
  * 多个选项卡
  * 字符编码:支持Qt、EBCDIC的所有8位编码
  * 解码表列出常见的简单数据类型



Okteta是一个简单的十六进制编辑器，没有那么奇特的功能。虽然它可以处理大部分任务。它有一个单独的模块，你可以使用它嵌入其他程序来查看/编辑文件。


与上述所有编辑器类似，您也可以在应用中心（App Center）和软件中心（Software Center）上找到列出的编辑器。

#### 4\. wxHexEditor

![wxhexeditor][8]

**主要特点:**

  * 轻松处理大文件
  * 支持x86反汇编
  * **** Sector Indication **** on Disk devices
  * 支持自定义十六进制面板格式和颜色



这很有趣。它主要是一个十六进制编辑器，但您也可以将其用作低级磁盘编辑器。例如，如果您的硬盘有问题，可以使用此编辑器编辑RAW格式原始数据镜像文件，在十六进制中的扇区并修复它。

你可以在你的应用中心（App Center）和软件中心（Software Center）找到它。 如果不是， [Sourceforge][9] 是个正确的选择。

#### 5\. Hexedit (命令行工具)

![hexedit][10]

**主要特点：**

  * 运行在命令行终端上
  * 它又快又简单



如果您想在终端上工作，可以继续通过控制台安装hexedit。它是我最喜欢的命令行Linux十六进制编辑器。

当你启动它时，你必须指定要打开的文件的位置，然后它会为你打开它。

要安装它，只需输入：

```
sudo apt install hexedit
```

### 结束

十六进制编辑器可以方便地进行实验和学习。如果你是一个有经验的人，你应该选择一个有更多功能的——GUI。 尽管这一切都取决于个人喜好。

你认为十六进制编辑器的实用性如何？你用哪一个？我们没有列出你最喜欢的吗？请在评论中告诉我们！

![][11]

--------------------------------------------------------------------------------

via: https://itsfoss.com/hex-editors-linux

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[zero-mk](https://github.com/zero-mk)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Hex_editor
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/Linux-hex-editors-800x450.jpeg?resize=800%2C450&ssl=1
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/bless-hex-editor.jpg?ssl=1
[4]: https://github.com/bwrsandman/Bless
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/01/ghex-hex-editor.jpg?ssl=1
[6]: https://github.com/GNOME/ghex
[7]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/okteta-hex-editor-800x466.jpg?resize=800%2C466&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/01/wxhexeditor.jpg?ssl=1
[9]: https://sourceforge.net/projects/wxhexeditor/
[10]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/hexedit-console.jpg?resize=800%2C566&ssl=1
[11]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/01/Linux-hex-editors.jpeg?fit=800%2C450&ssl=1
