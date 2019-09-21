设计更快的网页（二）：图片替换
======

![](https://fedoramagazine.org/wp-content/uploads/2018/03/fasterwebsites2-816x345.jpg)

欢迎回到我们为了构建更快网页所写的系列文章。上一篇[文章][1]讨论了只通过图片压缩实现这个目标的方法。这个例子从一开始有 1.2MB 的“浏览器脂肪”，然后它减轻到了 488.9KB 的大小。但这还不够快！那么本文继续来给浏览器“减肥”。你可能在这个过程中会认为我们所做的事情有点疯狂，但一旦完成，你就会明白为什么要这么做了。

### 准备工作

本文再次从对网页的分析开始。使用 Firefox 内置的截图功能来对整个页面进行截图。你还需要[用 sudo][2] 来安装 Inkscape：

```
$ sudo dnf install inkscape
```

如果你想了解 Inkscape 的用法，Fedora 杂志上有几篇现成的[文章][3]。本文仅会介绍一些基本的 SVG 优化方法以供 Web 使用。

### 分析

我们再来用 [getfedora.org][4] 的网页来举例。

![Getfedora 的页面，对其中的图片做了标记][5]

这次分析以图形方式完成更好，这也就是它从屏幕截图开始的原因。上面的截图标记了页面中的所有图形元素。Fedora 网站团队已经针对两种情况措施（也有可能是四种，这样更好）来替换图像了。社交媒体的图标变成了字体的字形，而语言选择器变成了 SVG.

我们有几个可以替换的选择：

+ CSS3
+ 字体
+ SVG
+ HTML5 Canvas

#### HTML5 Canvas

简单来说，HTML5 Canvas 是一种 HTML 元素，它允许你借助脚本语言（通常是 JavaScript）在上面绘图，不过它现在还没有被广泛使用。因为它可以使用脚本语言来绘制，所以这个元素也可以用来做动画。这里有一些使用 HTML Canvas 实现的实例，比如[三角形模式][6]、[动态波浪][7]和[字体动画][8]。不过，在这种情况下，似乎这也不是最好的选择。

#### CSS3

使用层叠式样式表，你可以绘制图形，甚至可以让它们动起来。CSS 常被用来绘制按钮等元素。然而，使用 CSS 绘制的更复杂的图形通常只能在技术演示页面中看到。这是因为使用视觉来制作图形依然要比使用代码来的更快一些。

#### 字体

另外一种方式是使用字体来装饰网页，[Fontawesome][9] 在这方面很流行。比如，在这个例子中你可以使用字体来替换“Flavor”和“Spin”的图标。这种方法有一个负面影响，但解决起来很容易，我们会在本系列的下一部分中来介绍。

#### SVG

这种图形格式已经存在了很长时间，而且它总是在浏览器中被使用。有很长一段时间并非所有浏览器都支持它，不过现在这已经成为历史了。所以，本例中图形替换的最佳方法是使用 SVG.

### 为网页优化 SVG

优化 SVG 以供互联网使用，需要几个步骤。

SVG 是一种 XML 方言。它用节点来描述圆形、矩形或文本路径等组件。每个节点都是一个 XML 元素。为了保证代码简洁，SVG 应该包含尽可能少的元素。

我们选用的 SVG 实例是带有一个咖啡杯的圆形图标。你有三种选项来用 SVG 描述它。

#### 一个圆形元素，上面有一个咖啡杯

```
<circle
style="opacity:1;fill:#717d82;fill-opacity:1;stroke:none;stroke-width:9.51950836;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:markers fill stroke"
id="path36"
cx="68.414307"
cy="130.71523"
r="3.7620001" />
```

#### 一个圆形路径，上面有一个咖啡杯

```
<path
style="opacity:1;fill:#717d82;fill-opacity:1;stroke:none;stroke-width:1.60968435;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:markers fill stroke"
d="m 68.414044,126.95318 a 3.7618673,3.7618673 0 0 0 -3.76153,3.76204 3.7618673,3.7618673 0 0 0 3.76153,3.76205 3.7618673,3.7618673 0 0 0 3.76206,-3.76205 3.7618673,3.7618673 0 0 0 -3.76206,-3.76204 z"
id="path20" />
```

#### 单一路径

```
<path
style="opacity:1;fill:#717d82;fill-opacity:1;stroke:none;stroke-width:1.60968435;stroke-linecap:round;stroke-linejoin:round;stroke-miterlimit:4;stroke-dasharray:none;stroke-dashoffset:0;stroke-opacity:1;paint-order:markers fill stroke"
d="m 68.414044,126.95318 a 3.7618673,3.7618673 0 0 0 -3.76153,3.76204 3.7618673,3.7618673 0 0 0 3.76153,3.76205 3.7618673,3.7618673 0 0 0 3.76206,-3.76205 3.7618673,3.7618673 0 0 0 -3.76206,-3.76204 z m -1.21542,0.92656 h 2.40554 c 0.0913,0.21025 0.18256,0.42071 0.27387,0.63097 h 0.47284 v 0.60099 h -0.17984 l -0.1664,1.05989 h 0.24961 l -0.34779,1.96267 -0.21238,-0.003 -0.22326,1.41955 h -2.12492 l -0.22429,-1.41955 -0.22479,0.003 -0.34829,-1.96267 h 0.26304 l -0.16692,-1.05989 h -0.1669 v -0.60099 h 0.44752 c 0.0913,-0.21026 0.18206,-0.42072 0.27336,-0.63097 z m 0.12608,0.19068 c -0.0614,0.14155 -0.12351,0.28323 -0.185,0.42478 h 2.52336 c -0.0614,-0.14155 -0.12248,-0.28323 -0.18397,-0.42478 z m -0.65524,0.63097 v 0.21911 l 0.0594,5.2e-4 h 3.35844 l 0.0724,-5.2e-4 v -0.21911 z m 0.16846,0.41083 0.1669,1.05937 h 2.80603 l 0.16693,-1.05937 -1.57046,0.008 z m -0.061,1.25057 0.27956,1.5782 1.34411,-0.0145 1.34567,0.0145 0.28059,-1.5782 z m 1.62367,1.75441 -1.08519,0.0124 0.19325,1.2299 h 1.79835 l 0.19328,-1.2299 z"
id="path2714"
inkscape:connector-curvature="0" />
```

你应该可以看出，代码变得越来越复杂，需要更多的字符来描述它。当然，文件中包含更多的字符，就会导致更大的尺寸。

#### 节点清理

如果你在 Inkscape 中打开了实例 SVG 按下 F2，就会激活一个节点工具。你应该看到这样的界面：

![Inkscape - 激活节点工具][10]

这个例子中有五个不必要的节点——就是直线中间的那些。要删除它们，你可以使用已激活的节点工具依次选中它们，并按下 `Del` 键。然后，选中这条线的定义节点，并使用工具栏的工具把它们重新做成角。

![Inkscape - 将节点变成角的工具][11]

如果不修复这些角，我们还有方法可以定义这条曲线，这条曲线会被保存，也就会增加文件体积。你可以手动清理这些节点，因为它无法有效的自动完成。现在，你已经为下一阶段做好了准备。

使用“另存为”功能，并选择“优化的 SVG”。这会弹出一个窗口，你可以在里面选择移除或保留哪些成分。

![Inkscape - “另存为”“优化的 SVG”][12]

虽然这个 SVG 实例很小，但它还是从 3.2KB 减小到了 920 字节，不到原有的三分之一。

回到 getfedora 的页面：页面主要部分的背景中的灰色沃罗诺伊图，在经过本系列第一篇文章中的优化处理之后，从原先的 211.12 KB 减小到了 164.1 KB.

页面中导出的原始 SVG 有 1.9 MB 大小。经过这些 SVG 优化步骤后，它只有 500.4 KB 了。太大了？好吧，现在的蓝色背景的体积是 564.98 KB。SVG 和 PNG 之间只有很小的差别。

#### 压缩文件

```
$ ls -lh
insgesamt 928K
-rw-r--r--. 1 user user 161K 19. Feb 19:44 grey-pattern.png
-rw-rw-r--. 1 user user 160K 18. Feb 12:23 grey-pattern.png.gz
-rw-r--r--. 1 user user 489K 19. Feb 19:43 greyscale-pattern-opti.svg
-rw-rw-r--. 1 user user 112K 19. Feb 19:05 greyscale-pattern-opti.svg.gz
```

这是我为可视化这个主题所做的一个小测试的输出。你可能应该看到光栅图形——PNG——已经被压缩，不能再被压缩了。而 SVG，它是一个 XML 文件正相反。它是文本文件，所以可被压缩至原来的四分之一不到。因此，现在它的体积要比 PNG 小 50 KB 左右。

现代浏览器可以以原生方式处理压缩文件。所以，许多 Web 服务器都打开了 mod_deflate (Apache) 和 gzip (Nginx) 模式。这样我们就可以在传输过程中节省空间。你可以在[这儿][13]看看你的服务器是不是启用了它。

### 生产工具

首先，没有人希望每次都要用 Inkscape 来优化 SVG. 你可以在命令行中脱离 GUI 来运行 Inkscape，但你找不到选项来将 Inkscape SVG 转换成优化的 SVG. 用这种方式只能导出光栅图像。但是我们替代品：

* SVGO (看起来开发过程已经不活跃了)
* Scour

本例中我们使用 `scour` 来进行优化。先来安装它：

```
$ sudo dnf install scour
```

要想自动优化 SVG 文件，请运行 `scour`，就像这样：

```
[user@localhost ]$ scour INPUT.svg OUTPUT.svg -p 3 --create-groups --renderer-workaround --strip-xml-prolog --remove-descriptive-elements --enable-comment-stripping --disable-embed-rasters --no-line-breaks --enable-id-stripping --shorten-ids
```

这就是第二部分的结尾了。在这部分中你应该学会了如何将光栅图像替换成 SVG，并对它进行优化以供使用。请继续关注 Feroda 杂志，第三篇即将出炉。


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/design-faster-web-pages-part-2-image-replacement/

作者：[Sirko Kemter][a]
选题：[lujun9972][b]
译者：[StdioA](https://github.com/StdioA)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gnokii/
[b]: https://github.com/lujun9972
[1]: https://linux.cn/article-10166-1.html
[2]: https://fedoramagazine.org/howto-use-sudo/
[3]: https://fedoramagazine.org/?s=Inkscape
[4]: https://getfedora.org
[5]: https://fedoramagazine.org/wp-content/uploads/2018/02/getfedora_mag.png
[6]: https://codepen.io/Cthulahoop/pen/umcvo
[7]: https://codepen.io/jackrugile/pen/BvLHg
[8]: https://codepen.io/tholman/pen/lDLhk
[9]: https://fontawesome.com/
[10]: https://fedoramagazine.org/wp-content/uploads/2018/02/svg-optimization-nodes.png
[11]: https://fedoramagazine.org/wp-content/uploads/2018/02/node_cleaning.png
[12]: https://fedoramagazine.org/wp-content/uploads/2018/02/svg-optimizing-dialog.png
[13]: https://checkgzipcompression.com/?url=http%3A%2F%2Fgetfedora.org
