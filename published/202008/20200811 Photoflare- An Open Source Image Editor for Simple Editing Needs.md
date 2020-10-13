[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-12538-1.html)
[#]: subject: (Photoflare: An Open Source Image Editor for Simple Editing Needs)
[#]: via: (https://itsfoss.com/photoflare/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Photoflare：满足简单编辑需求的开源图像编辑器
======

> Photoflare 是一款可用于 Linux 和 Windows 上的图像编辑器。它有一个免费而开源的社区版本。

在 Linux 上编辑图像时，GIMP 显然是首选。但是，如果你不需要高级编辑功能，GIMP 可能会让人不知所措。这是像 Photoflare 这样的应用立足的地方。

### PhotoFlare：一个简单的图像编辑器

![][1]

Photoflare 是一个在简单易用的界面里提供了基本的图像编辑功能的编辑器。

它受流行的 Windows 应用 [PhotoFiltre][2] 的启发。这个程序不是一个克隆品，它是用 C++ 从头开始编写的，并使用 Qt 框架作为界面。

它的功能包括裁剪、翻转/旋转、调整图像大小。你还可以使用诸如油漆刷、油漆桶、喷雾罐、模糊工具和橡皮擦之类的工具。魔术棒工具可让你选择图像的特定区域。

你还可以在图像上添加线条和文本。你还可以更改图像的色调。

你也可以像其他[画图应用][3]一样从头开始创建图像。

批处理编辑选项可让你同时为多张图片调整大小、转换文件格式和添加滤镜。

![Batch Editing Feature in Photoflare | Photo Credit: Photoflare website][4]

### Photoflare 的功能

为了方便参考，我将列出 Photoflare 的主要功能：

* 创建/绘制图像
* 裁剪图像
* 旋转图像
* 调整图像大小
* 使用画笔、油漆桶、喷涂、模糊工具和图像等工具编辑图像
* 在图像上添加线条和文字
* 更改图像的色调
* 添加老照片滤镜
* 批量调整大小、滤镜等

### 在 Linux 上安装 Photflare

![][5]

在 Photoflare 的网站上，你可以找到定价以及每月订阅的选项。但是，该应用是开源的，它的[源码可在 GitHub 上找到][6]。

应用也是“免费”使用的。[定价/订购部分][7]用于该项目的财务支持。你可以免费下载它，如果你喜欢该应用并且会继续使用，请考虑给它捐赠。

Photoflare 有[官方 PPA][8]，适用于 Ubuntu 和基于 Ubuntu 的发行版。此 PPA 可用于 Ubuntu 18.04 和 20.04 版本。

打开终端，逐一输入下面的命令安装 Photoflare：

```
sudo add-apt-repository ppa:photoflare/photoflare-stable
sudo apt update
sudo apt install photoflare
```

要从基于 Ubuntu 的发行版中删除 Photoflare，请使用以下命令：

```
sudo apt remove photoflare
```

最好也删除 PPA：

```
sudo add-apt-repository -r ppa:photoflare/photoflare-stable
```

Arch Linux 和 Manjaro 用户可以[从 AUR 获取][9]。

Fedora 没有现成的软件包，因此你需要获取源码：

- [Photoflare 源代码][6]

### Photoflare 的经验

我发现它与 [Pinta][10] 有点相似，但功能更多。它是用于基本图像编辑的简单工具。批处理功能是加分项。

我注意到图像在打开编辑时看起来不够清晰。我打开一张截图进行编辑，字体看起来很模糊。但是，保存图像并在[图像查看器][11]中打开后，没有显示此问题。

总之，如果你不需要专业级的图像编辑，它是一个不错的工具。

如果你曾经使用过或会去尝试它，请分享你的 Photoflare 使用经验。

--------------------------------------------------------------------------------

via: https://itsfoss.com/photoflare/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/Photoflare.jpg?ssl=1
[2]: http://photofiltre.free.fr/frames_en.htm
[3]: https://itsfoss.com/open-source-paint-apps/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/batch_editing_photoflare.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/photoflare-editor-linux.png?resize=800%2C580&ssl=1
[6]: https://github.com/PhotoFlare/photoflare
[7]: https://photoflare.io/pricing/
[8]: https://launchpad.net/~photoflare/+archive/ubuntu/photoflare-stable
[9]: https://aur.archlinux.org/packages/photoflare-git/
[10]: https://itsfoss.com/pinta-new-release/
[11]: https://itsfoss.com/image-viewers-linux/