[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12712-1.html)
[#]: subject: (Drawing is an Open Source MS-Paint Type of App for Linux Desktop)
[#]: via: (https://itsfoss.com/drawing-app/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Drawing：一款开源的类似微软画图的 Linux 桌面应用
======

![](https://img.linux.net.cn/data/attachment/album/202010/12/231731q0pgrkzidsguosps.jpg)

> Drawing 是一个基本的图像编辑器，就像微软画图一样。有了这个开源的应用，你可以画箭头、线条、几何图形、添加颜色和其他你期望在普通绘图应用程序中做的事情。

### Drawing: 一个简单的 Linux 绘图应用

![][1]

对于从 Windows XP （或更早版本）开始使用电脑的人来说，微软<ruby>画图<rt>Paint</rt></ruby>是一个有趣的应用，是个可以随便画一些草图的应用。在这个被 Photoshop 和 GIMP 主导的世界里，画图应用仍然具有一定的现实意义。

有几个[可用于 Linux 的绘画应用][2]，我打算在这个列表中再添加一个。

这款应用不出意外地叫做 [Drawing][3]，你可以在 Linux 桌面和 Linux 智能手机上使用它。

### Drawing 应用的功能

![][4]

Drawing 拥有你所期待的绘图应用的所有功能。你可以：

  * 从头开始创建新的绘图
  * 编辑现有的 PNG、JPEG 或 BMP 图像文件
  * 添加几何图形、线条、箭头等
  * 虚线
  * 使用铅笔工具进行自由手绘
  * 使用曲线和形状工具
  * 裁剪图像
  * 缩放图像到不同的像素大小
  * 添加文本
  * 选择图像的一部分（矩形、自由选择和颜色选择）
  * 旋转图像
  * 添加复制到剪贴板的图像
  * 可在偏好中使用橡皮擦、荧光笔、油漆桶、颜色选择、颜色选择器工具
  * 无限撤销
  * 滤镜可以增加模糊、像素化、透明度等

### 我使用 Drawing 的经验

![][5]

这个应用是新出现的，并且有不错的用户界面。它具有你期望在标准的绘画应用中找到的所有基本功能。

它有一些额外的工具，如颜色选择和拾色器，但在使用时可能会混淆。没有什么文档描述这些工具的使用，要全靠你自己摸索。

它的体验很流畅，作为图像编辑工具，我觉得这个工具很有潜力取代 Shutter （是的，我[用 Shutter 编辑截图][6]）。

我觉得最麻烦的是，添加元素后无法编辑/修改。你有撤消和重做选项，但如果你想修改一个你在 12 步前添加的文本，你就必须重做所有的步骤。这是未来的版本中开发者可能要做的一些改进。

### 在 Linux 上安装 Drawing

这是一款 Linux 专属应用。它也适用于基于 Linux 的智能手机，如 [PinePhone][7]。

有多种方式可以安装 Drawing。它在许多主要的 Linux 发行版的仓库中都有。

#### 基于 Ubuntu 的发行版

Drawing 包含在 Ubuntu 的 universe 仓库中，这意味着你可以从 Ubuntu 软件中心安装它。

但是，如果你想要最新的版本，有一个 [PPA][8] 可以轻松地在 Ubuntu、Linux Mint 和其他基于 Ubuntu 的发行版上安装 Drawing。

使用下面的命令：

```
sudo add-apt-repository ppa:cartes/drawing
sudo apt update
sudo apt install drawing
```

如果你想删除它，你可以使用以下命令：

```
sudo apt remove drawing
sudo add-apt-repository -r ppa:cartes/drawing
```

#### 其他 Linux 发行版

检查你的发行版的包管理器中是否有 Drawing，然后在那里安装。如果你想要最新的版本，你可以使用 Flatpak 版本的应用。

- [Drawing Flatpak][9]

### 总结

你还在用画图应用么？你用的是哪一款？如果你已经尝试过 Drawing，你的体验如何？

--------------------------------------------------------------------------------

via: https://itsfoss.com/drawing-app/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/drawing-app-interface.jpg?resize=789%2C449&ssl=1
[2]: https://itsfoss.com/open-source-paint-apps/
[3]: https://maoschanz.github.io/drawing/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/drawing-screenshot.jpg?resize=800%2C489&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/using-drawing-app-linux.png?resize=787%2C473&ssl=1
[6]: https://itsfoss.com/install-shutter-ubuntu/
[7]: https://itsfoss.com/pinephone/
[8]: https://launchpad.net/~cartes/+archive/ubuntu/drawing
[9]: https://flathub.org/apps/details/com.github.maoschanz.drawing
