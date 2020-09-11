[#]: collector: "lujun9972"
[#]: translator: "zero-mk"
[#]: reviewer: "wxy"
[#]: publisher: "wxy"
[#]: url: "https://linux.cn/article-10614-1.html"
[#]: subject: "Top Hex Editors for Linux"
[#]: via: "https://itsfoss.com/hex-editors-linux"
[#]: author: "Ankush Das https://itsfoss.com/author/ankush/"

Linux 上最好的十进制编辑器
======

十六进制编辑器可以让你以十六进制的形式查看/编辑文件的二进制数据，因此其被命名为“十六进制”编辑器。说实话，并不是每个人都需要它。只有必须处理二进制数据的特定用户组才会使用到它。

如果你不知道它是什么，让我来举个例子。假设你拥有一个游戏的配置文件，你可以使用十六进制编辑器打开它们并更改某些值以获得更多的弹药/分数等等。想要了解有关十六进制编辑器的更多信息，你可以参阅 [Wikipedia 页面][1]。

如果你已经知道它用来干什么了 —— 让我们来看看 Linux 上最好的十六进制编辑器。

### 5 个最好的十六进制编辑器

![Best Hex Editors for Linux][2]

**注意：**这里提到的十六进制编辑器没有特定的排名顺序。

#### 1、Bless Hex Editor

![bless hex editor][3]

**主要特点：**

  * 编辑裸设备（Raw disk）
  * 多级撤消/重做操作
  * 多个标签页
  * 转换表
  * 支持插件扩展功能

Bless 是 Linux 上最流行的十六进制编辑器之一。你可以在应用中心或软件中心中找到它。否则，你可以查看它们的 [GitHub 页面][4] 获取构建和相关的说明。

它可以轻松处理编辑大文件而不会降低速度 —— 因此它是一个快速的十六进制编辑器。

- [GitHub 项目](https://github.com/bwrsandman/Bless)

#### 2、GNOME Hex Editor

![gnome hex editor][5]

**主要特点：**

  * 以十六进制/ASCII 格式查看/编辑
  * 编辑大文件

另一个神奇的十六进制编辑器 —— 专门为 GNOME 量身定做的。我个人用的是 Elementary OS, 所以我可以在应用中心找到它。你也可以在软件中心找到它。否则请参考 [GitHub 页面][6] 获取源代码。

你可以使用此编辑器以十六进制或 ASCII 格式查看/编辑文件。用户界面非常简单 —— 正如你在上面的图像中看到的那样。

- [官方网站](https://wiki.gnome.org/Apps/Ghex)

#### 3、Okteta

![okteta][7]

**主要特点：** 

  * 可自定义的数据视图
  * 多个标签页
  * 字符编码：支持 Qt、EBCDIC 的所有 8 位编码
  * 解码表列出常见的简单数据类型

Okteta 是一个简单的十六进制编辑器，没有那么奇特的功能。虽然它可以处理大部分任务。它有一个单独的模块，你可以使用它嵌入其他程序来查看/编辑文件。

与上述所有编辑器类似，你也可以在应用中心和软件中心上找到列出的编辑器。

- [官方网站](https://www.kde.org/applications/utilities/okteta/)

#### 4、wxHexEditor

![wxhexeditor][8]

**主要特点：**

  * 轻松处理大文件
  * 支持 x86 反汇编
  * 对磁盘设备可以显示扇区指示
  * 支持自定义十六进制面板格式和颜色

这很有趣。它主要是一个十六进制编辑器，但你也可以将其用作低级磁盘编辑器。例如，如果你的硬盘有问题，可以使用此编辑器以 RAW 格式编辑原始数据以修复它。

你可以在你的应用中心和软件中心找到它。否则，可以去看看 [Sourceforge][9]。

- [官方网站](http://www.wxhexeditor.org/home.php)

#### 5、Hexedit (命令行工具)

![hexedit][10]

**主要特点：**

  * 运行在命令行终端上
  * 它又快又简单

如果你想在终端上工作，可以继续通过控制台安装 hexedit。它是我最喜欢的 Linux 命令行的十六进制编辑器。

当你启动它时，你必须指定要打开的文件的位置，然后它会为你打开它。

要安装它，只需输入：

```
sudo apt install hexedit
```

### 结束

十六进制编辑器可以方便地进行实验和学习。如果你是一个有经验的人，你应该选择一个有更多功能的——GUI。 尽管这一切都取决于个人喜好。

你认为十六进制编辑器的有用性如何？你用哪一个？我们没有列出你最喜欢的吗？请在评论中告诉我们！

### 额外福利

译者注：要我说，以上这些十六进制编辑器都太丑了。如果你只是想美美的查看查看一下十六进制输出，那么下面的这个查看器十分值得看看。虽然在功能上还有些不够成熟，但至少在美颜方面可以将上面在座的各位都视作垃圾。

它就是 hexyl，是一个面向终端的简单的十六进制查看器。它使用颜色来区分不同的字节类型（NULL、可打印的 ASCII 字符、ASCII 空白字符、其它 ASCII 字符和非 ASCII 字符）。

上图：

![](https://camo.githubusercontent.com/1f71ee7031e1962b23f21c8cc89cb837e1201238/68747470733a2f2f692e696d6775722e636f6d2f4d574f3975534c2e706e67)

![](https://camo.githubusercontent.com/2c7114d1b3159fc91e6c1e289e23b79d1186c6d5/68747470733a2f2f692e696d6775722e636f6d2f447037576e637a2e706e67)

它不仅支持各种 Linux 发行版，还支持 MacOS、FreeBSD、Windows，请自行去其[项目页](https://github.com/sharkdp/hexyl)选用， 

--------------------------------------------------------------------------------

via: https://itsfoss.com/hex-editors-linux

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[zero-mk](https://github.com/zero-mk)
校对：[wxy](https://github.com/wxy)

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
