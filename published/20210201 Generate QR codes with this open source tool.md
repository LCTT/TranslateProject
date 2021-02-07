[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13097-1.html)
[#]: subject: (Generate QR codes with this open source tool)
[#]: via: (https://opensource.com/article/21/2/zint-barcode-generator)
[#]: author: (Don Watkins https://opensource.com/users/don-watkins)

Zint：用这个开源工具生成二维码
======

> Zint 可以轻松生成 50 多种类型的自定义条码。

![](https://img.linux.net.cn/data/attachment/album/202102/07/231854y8ffstg0m6l2fcmz.jpg)

二维码是一种很好的可以向人们提供信息的方式，且没有打印的麻烦和费用。大多数人的智能手机都支持二维码扫描，无论其操作系统是什么。

你可能想使用二维码的原因有很多。也许你是一名教师，希望通过补充材料来测试你的学生，以增强学习效果，或者是一家餐厅，需要在遵守社交距离准则的同时提供菜单。我经常行走于自然小径，那里贴有树木和其他植物的标签。用二维码来补充这些小标签是一种很好的方式，它可以提供关于公园展品的额外信息，而无需花费和维护标识牌。在这些和其他情况下，二维码是非常有用的。

在互联网上搜索一个简单的、开源的方法来创建二维码时，我发现了 [Zint][2]。Zint 是一个优秀的开源 （GPLv3.0） 生成条码的解决方案。根据该项目的 [GitHub 仓库][3]：“Zint 是一套可以方便地对任何一种公共领域条形码标准的数据进行编码的程序，并允许你将这种功能集成到你自己的程序中。”

Zint 支持 50 多种类型的条形码，包括二维码（ISO 18004），你可以轻松地创建这些条形码，然后复制和粘贴到 word 文档、博客、维基和其他数字媒体中。人们可以用智能手机扫描这些二维码，快速链接到信息。

### 安装 Zint

Zint 适用于 Linux、macOS 和 Windows。

你可以在基于 Ubuntu 的 Linux 发行版上使用 `apt` 安装 Zint 命令：

```
$ sudo apt install zint
```

我还想要一个图形用户界面（GUI），所以我安装了 Zint-QT：

```
$ sudo apt install zint-qt
```

请参考手册的[安装部分][4]，了解 macOS 和 Windows 的说明。

### 用 Zint 生成二维码

安装好后，我启动了它，并创建了我的第一个二维码，这是一个指向 Opensource.com 的链接。

![Generating QR code with Zint][5]

Zint 的 50 多个其他条码选项包括许多国家的邮政编码、DotCode、EAN、EAN-14 和通用产品代码 （UPC）。[项目文档][2]中包含了它可以渲染的所有代码的完整列表。

你可以将任何条形码复制为 BMP 或 SVG，或者将输出保存为你应用中所需要的任何尺寸的图像文件。这是我的 77x77 像素的二维码。

![QR code][7]

该项目维护了一份出色的用户手册，其中包含了在[命令行][8]和 [GUI][9] 中使用 Zint 的说明。你甚至可以[在线][10]试用 Zint。对于功能请求或错误报告，请[访问网站][11]或[发送电子邮件][12]。

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/2/zint-barcode-generator

作者：[Don Watkins][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/don-watkins
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/wfh_work_home_laptop_work.png?itok=VFwToeMy (Working from home at a laptop)
[2]: http://www.zint.org.uk/
[3]: https://github.com/zint/zint
[4]: http://www.zint.org.uk/Manual.aspx?type=p&page=2
[5]: https://opensource.com/sites/default/files/uploads/zintqrcode_generation.png (Generating QR code with Zint)
[6]: https://creativecommons.org/licenses/by-sa/4.0/
[7]: https://opensource.com/sites/default/files/uploads/zintqrcode_77px.png (QR code)
[8]: http://zint.org.uk/Manual.aspx?type=p&page=4
[9]: http://zint.org.uk/Manual.aspx?type=p&page=3
[10]: http://www.barcode-generator.org/
[11]: https://lists.sourceforge.net/lists/listinfo/zint-barcode
[12]: mailto:zint-barcode@lists.sourceforge.net
