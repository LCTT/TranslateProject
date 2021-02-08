使用 MacSVG 创建 SVG 动画
======

> 开源 SVG：墙上的魔法字。

![](https://img.linux.net.cn/data/attachment/album/201908/18/000809mzl1wb1ww754z455.jpg)

新巴比伦的摄政王[伯沙撒][1]没有注意到他在盛宴期间神奇地[书写在墙上的文字][2]。但是，如果他在公元前 539 年有一台笔记本电脑和良好的互联网连接，他可能会通过在浏览器上阅读 SVG 来避开那些讨厌的波斯人。

出现在网页上的动画文本和对象是建立用户兴趣和参与度的好方法。有几种方法可以实现这一点，例如视频嵌入、动画 GIF 或幻灯片 —— 但你也可以使用[可缩放矢量图形（SVG）][3]。

SVG 图像与 JPG 不同，因为它可以缩放而不会丢失其分辨率。矢量图像是由点而不是像素创建的，所以无论它放大到多大，它都不会失去分辨率或像素化。充分利用可缩放的静态图像的一个例子是网站的徽标。

### 动起来，动起来

你可以使用多种绘图程序创建 SVG 图像，包括开源的 [Inkscape][4] 和 Adobe Illustrator。让你的图像“能动起来”需要更多的努力。幸运的是，有一些开源解决方案甚至可以引起伯沙撒的注意。

[MacSVG][5] 是一款可以让你的图像动起来的工具。你可以在 [GitHub][6] 上找到源代码。

根据其[官网][5]说，MacSVG 由阿肯色州康威的 Douglas Ward 开发，是一个“用于设计 HTML5 SVG 艺术和动画的开源 Mac OS 应用程序”。

我想使用 MacSVG 来创建一个动画签名。我承认我发现这个过程有点令人困惑，并且在我第一次尝试创建一个实际的动画 SVG 图像时失败了。

![](https://opensource.com/sites/default/files/uploads/macsvg-screen.png)

重要的是首先要了解要展示的书法内容实际写的是什么。

动画文字背后的属性是 [stroke-dasharray][7]。将该术语分成三个单词有助于解释正在发生的事情：“stroke” 是指用笔（无论是物理的笔还是数字化笔）制作的线条或笔画。“dash” 意味着将笔划分解为一系列折线。“array” 意味着将整个东西生成为数组。这是一个简单的概述，但它可以帮助我理解应该发生什么以及为什么。

使用 MacSVG，你可以导入图形（.PNG）并使用钢笔工具描绘书写路径。我使用了草书来表示我的名字。然后，只需应用该属性来让书法动画起来、增加和减少笔划的粗细、改变其颜色等等。完成后，动画的书法将导出为 .SVG 文件，并可以在网络上使用。除书写外，MacSVG 还可用于许多不同类型的 SVG 动画。

### 在 WordPress 中书写

我准备在我的 [WordPress][8] 网站上传和分享我的 SVG 示例，但我发现 WordPress 不允许进行 SVG 媒体导入。幸运的是，我找到了一个方便的插件：Benbodhi 的 [SVG 支持][9]插件允许快速、轻松地导入我的 SVG，就像我将 JPG 导入媒体库一样。我能够在世界各地向巴比伦人展示我[写在墙上的魔法字][10]。

我在 [Brackets][11] 中开源了 SVG 的源代码，结果如下：

```
<?xml version="1.0" encoding="utf-8" standalone="yes"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd">
<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://web.resource.org/cc/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape" height="360px" style="zoom: 1;" cursor="default" id="svg_document" width="480px" baseProfile="full" version="1.1" preserveAspectRatio="xMidYMid meet" viewBox="0 0 480 360"><title id="svg_document_title">Path animation with stroke-dasharray</title><desc id="desc1">This example demonstrates the use of a path element, an animate element, and the stroke-dasharray attribute to simulate drawing.</desc><defs id="svg_document_defs"></defs><g id="main_group"></g><path stroke="#004d40" id="path2" stroke-width="9px" d="M86,75 C86,75 75,72 72,61 C69,50 66,37 71,34 C76,31 86,21 92,35 C98,49 95,73 94,82 C93,91 87,105 83,110 C79,115 70,124 71,113 C72,102 67,105 75,97 C83,89 111,74 111,74 C111,74 119,64 119,63 C119,62 110,57 109,58 C108,59 102,65 102,66 C102,67 101,75 107,79 C113,83 118,85 122,81 C126,77 133,78 136,64 C139,50 147,45 146,33 C145,21 136,15 132,24 C128,33 123,40 123,49 C123,58 135,87 135,96 C135,105 139,117 133,120 C127,123 116,127 120,116 C124,105 144,82 144,81 C144,80 158,66 159,58 C160,50 159,48 161,43 C163,38 172,23 166,22 C160,21 155,12 153,23 C151,34 161,68 160,78 C159,88 164,108 163,113 C162,118 165,126 157,128 C149,130 152,109 152,109 C152,109 185,64 185,64 " fill="none" transform=""><animate values="0,1739;1739,0;" attributeType="XML" begin="0; animate1.end+5s" id="animateSig1" repeatCount="indefinite" attributeName="stroke-dasharray" fill="freeze" dur="2"></animate></path></svg>
```

你会使用 MacSVG 做什么？

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/10/macsvg-open-source-tool-animation

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[wxy](https://github.com/wxy)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/rikki-endsley
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Belshazzar
[2]: https://en.wikipedia.org/wiki/Belshazzar%27s_feast
[3]: https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
[4]: https://inkscape.org/
[5]: https://macsvg.org/
[6]: https://github.com/dsward2/macSVG
[7]: https://gist.github.com/mbostock/5649592
[8]: https://macharyas.com/
[9]: https://wordpress.org/plugins/svg-support/
[10]: https://macharyas.com/index.php/2018/10/14/open-source-svg/
[11]: http://brackets.io/
