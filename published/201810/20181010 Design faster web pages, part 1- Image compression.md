设计更快的网页（一）：图片压缩
======

![](https://fedoramagazine.org/wp-content/uploads/2018/02/fasterwebsites1-816x345.jpg)

很多 Web 开发者都希望做出加载速度很快的网页。在移动设备浏览占比越来越大的背景下，使用响应式设计使得网站在小屏幕下看起来更漂亮只是其中一个方面。Browser Calories 可以展示网页的加载时间 —— 这不单单关系到用户，还会影响到通过加载速度来进行评级的搜索引擎。这个系列的文章介绍了如何使用 Fedora 提供的工具来给网页“瘦身”。

### 准备工作

在你开始缩减网页之前，你需要明确核心问题所在。为此，你可以使用 [Browserdiet][1]. 这是一个浏览器插件，适用于 Firefox、Opera、 Chrome 和其它浏览器。它会对打开的网页进行性能分析，这样你就可以知道应该从哪里入手来缩减网页。

然后，你需要一些用来处理的页面。下面的例子是针对 [getferoda.org][2] 的测试截图。一开始，它看起来非常简单，也符合响应式设计。

![Browser Diet - getfedora.org 的评分][3]

然而，BroserDiet 的网页分析表明，这个网页需要加载 1.8MB 的文件。所以，我们现在有活干了！

### Web 优化

网页中包含 281 KB 的 JavaScript 文件、203 KB 的 CSS 文件，还有 1.2 MB 的图片。我们先从最严重的问题 —— 图片开始入手。为了解决问题，你需要的工具集有 GIMP、ImageMagick 和 optipng. 你可以使用如下命令轻松安装它们：

```
sudo dnf install gimp imagemagick optipng
```

比如，我们先拿到这个 6.4 KB 的[文件][4]：

![][4]

首先，使用 `file` 命令来获取这张图片的一些基本信息：

```
$ file cinnamon.png
cinnamon.png: PNG image data, 60 x 60, 8-bit/color RGBA, non-interlaced
```

这张只由白色和灰色构成的图片使用 8 位 / RGBA 模式来存储。这种方式并没有那么高效。

使用 GIMP，你可以为这张图片设置一个更合适的颜色模式。在 GIMP 中打开 `cinnamon.png`。然后，在“图片 > 模式”菜单中将其设置为“灰度模式”。将这张图片以 PNG 格式导出。导出时使用压缩因子 9，导出对话框中的其它配置均使用默认选项。

```
$ file cinnamon.png
cinnamon.png: PNG image data, 60 x 60, 8-bit gray+alpha, non-interlaced
```

输出显示，现在这个文件现在处于 8 位 / 灰阶 + aplha 模式。文件大小从 6.4 KB 缩小到了 2.8 KB. 这已经是原来大小的 43.75% 了。但是，我们能做的还有很多！

你可以使用 ImageMagick 工具来查看这张图片的更多信息。

```
$ identify cinnamon2.png
cinnamon.png PNG 60x60 60x60+0+0 8-bit Grayscale Gray 2831B 0.000u 0:00.000
```

它告诉你，这个文件的大小为 2831 字节。我们回到 GIMP，重新导出文件。在导出对话框中，取消存储时间戳和 alpha 通道色值，来让文件更小一点。现在文件输出显示：

```
$ identify cinnamon.png
cinnamon.png PNG 60x60 60x60+0+0 8-bit Grayscale Gray 2798B 0.000u 0:00.000
```

下面，用 `optipng` 来无损优化你的 PNG 图片。具有相似功能的工具有很多，包括 `advdef`（这是 advancecomp 的一部分），`pngquant` 和 `pngcrush`。

对你的文件运行 `optipng`。 注意，这个操作会覆盖你的原文件：

```
$ optipng -o7 cinnamon.png
** Processing: cinnamon.png
60x60 pixels, 2x8 bits/pixel, grayscale+alpha
Reducing image to 8 bits/pixel, grayscale
Input IDAT size = 2720 bytes
Input file size = 2812 bytes

Trying:
 zc = 9 zm = 8 zs = 0 f = 0 IDAT size = 1922
 zc = 9 zm = 8 zs = 1 f = 0 IDAT size = 1920

Selecting parameters:
 zc = 9 zm = 8 zs = 1 f = 0 IDAT size = 1920

Output IDAT size = 1920 bytes (800 bytes decrease)
Output file size = 2012 bytes (800 bytes = 28.45% decrease)
```

`-o7` 选项处理起来最慢，但最终效果最好。于是你又将文件缩小了 800 字节，现在它只有 2012 字节了。

要压缩文件夹下的所有 PNG，可以使用这个命令：

```
$ optipng -o7 -dir=<directory> *.png
```

`-dir` 选项用来指定输出文件夹。如果不加这个选项，`optipng` 会覆盖原文件。

### 选择正确的文件格式

当涉及到在互联网中使用的图片时，你可以选择：

+ [JPG 或 JPEG][9]
+ [GIF][10]
+ [PNG][11]
+ [aPNG][12]
+ [JPG-LS][13]
+ [JPG 2000 或 JP2][14]
+ [SVG][15]

JPG-LS 和 JPG 2000 没有得到广泛使用。只有一部分数码相机支持这些格式，所以我们可以忽略它们。aPNG 是动态的 PNG 格式，也没有广泛使用。

可以通过更改压缩率或者使用其它文件格式来节省下更多字节。我们无法在 GIMP 中应用第一种方法，因为现在的图片已经使用了最高的压缩率了。因为我们的图片中不再包含 [aplha 通道][5]，你可以使用 JPG 类型来替代 PNG。 现在，使用默认值：90% 质量 —— 你可以将它减小至 85%，但这样会导致可见的叠影。这样又省下一些字节：

```
$ identify cinnamon.jpg
cinnamon.jpg JPEG 60x60 60x60+0+0 8-bit sRGB 2676B 0.000u 0:00.000
```

只将这张图转成正确的色域，并使用 JPG 作为文件格式，就可以将它从 23 KB 缩小到 12.3 KB，减少了近 50%.

#### PNG vs JPG: 质量和压缩率

那么，剩下的文件我们要怎么办呢？除了 Fedora “风味”图标和四个特性图标之外，此方法适用于所有其他图片。我们能够处理的图片都有一个白色的背景。

PNG 和 JPG 的一个主要区别在于，JPG 没有 alpha 通道。所以，它没有透明度选项。如果你使用 JPG 并为它添加白色背景，你可以将文件从 40.7 KB 缩小至 28.3 KB.

现在又有了四个可以处理的图片：背景图。对于灰色背景，你可以再次使用灰阶模式。对更大的图片，我们就可以节省下更多的空间。它从 216.2 KB 缩小到了 51 KB —— 基本上只有原图的 25% 了。整体下来，你把这些图片从 481.1 KB 缩小到了 191.5 KB —— 只有一开始的 39.8%.

#### 质量 vs 大小

PNG 和 JPG 的另外一个区别在于质量。PNG 是一种无损压缩光栅图形格式。但是 JPG 虽然使用压缩来缩小体积，可是这会影响到质量。不过，这并不意味着你不应该使用 JPG，只是你需要在文件大小和质量中找到一个平衡。

### 成就

这就是第一部分的结尾了。在使用上述技术后，得到的结果如下：

![][6]

你将一开始 1.2 MB 的图片体积缩小到了 488.9 KB. 只需通过 `optipng` 进行优化，就可以达到之前体积的三分之一。这可能使得页面更快地加载。不过，要是使用蜗牛到超音速来对比，这个速度还没到达赛车的速度呢！

最后，你可以在 [Google Insights][7] 中查看结果，例如：

![][8]

在移动端部分，这个页面的得分提升了 10 分，但它依然处于“中等”水平。对于桌面端，结果看起来完全不同，从 62/100 分提升至了 91/100 分，等级也达到了“好”的水平。如我们之前所说的，这个测试并不意味着我们的工作就做完了。通过参考这些分数可以让你朝着正确的方向前进。请记住，你正在为用户体验来进行优化，而不是搜索引擎。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/design-faster-web-pages-part-1-image-compression/

作者：[Sirko Kemter][a]
选题：[lujun9972][b]
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gnokii/
[b]: https://github.com/lujun9972
[1]: https://browserdiet.com/calories/
[2]: http://getfedora.org
[3]: https://fedoramagazine.org/wp-content/uploads/2018/02/ff-addon-diet.jpg
[4]: https://getfedora.org/static/images/cinnamon.png
[5]: https://www.webopedia.com/TERM/A/alpha_channel.html
[6]: https://fedoramagazine.org/wp-content/uploads/2018/02/ff-addon-diet-i.jpg
[7]: https://developers.google.com/speed/pagespeed/insights/?url=getfedora.org&tab=mobile
[8]: https://fedoramagazine.org/wp-content/uploads/2018/02/PageSpeed_Insights.png
[9]: https://en.wikipedia.org/wiki/JPEG
[10]: https://en.wikipedia.org/wiki/GIF
[11]: https://en.wikipedia.org/wiki/Portable_Network_Graphics
[12]: https://en.wikipedia.org/wiki/APNG
[13]: https://en.wikipedia.org/wiki/JPEG_2000
[14]: https://en.wikipedia.org/wiki/JPEG_2000
[15]: https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
