怎么去使用 SVG 作为一个占位符，以及其它图像加载技术
============================================================

![](https://cdn-images-1.medium.com/max/1563/0*zJGl1vKLttcJGIL4.jpg)
从被用作占位符的图像中生成 SVGs。继续阅读！

我对怎么去让 web 性能更优化和图像加载的更快充满了热情。对这些感兴趣的领域中的其中一项研究就是占位符：当图像还没有被加载的时候应该去展示些什么？

在前此天，我偶然发现了使用 SVG 的一些加载技术，随后，我将在这篇文章中去描述它。

在这篇文章中我们将涉及如下的主题：

*   不同的占位符类型的概述

*   基于 SVG 的占位符（边缘、形状、和轮廓）

*   自动化处理

### 不同的占位符类型的概述

以前 [我写的关于占位符和图像延迟加载（lazy-loading）][28] 的文章和 [关于它的讨论][29] 中。当进行一个图像的延迟加载时，一个很好的主意是去考虑提供一个东西作为占位符，因为，它可能会很大程序上影响用户的感知体验。以前我提供了几个选项：


![](https://cdn-images-1.medium.com/max/1563/0*jlMM144vAhH-0bEn.png)

在图像被加载之前，有几种办法去填充图像区域。

*   在图像区保持空白：在一个响应式设计的环境中，这种方式防止了内容的跳跃。这种布局从用户体验的角度来看是非常差的作法。但是，它是为了性能的考虑，否则，每次为了获取图像尺寸，浏览器被迫进行布局重计算，以为它留下空间。

*   占位符：在那里显示一个用户配置的图像。我们可以在背景上显示一个轮廓。它一直显示直到实际的图像被加载，它也被用于当请求失败或者当用户根本没有设置图像的情况下。这些图像一般都是矢量图，并且都选择尺寸非常小的内联图片。

*   固定的颜色：从图像中获取颜色，并将其作为占位符的背景颜色。这可能是主导的颜色，最具活力的 … 这个主意是基于你正在加载的图像，并且它将有助于在没有图像和图像加载完成之间进行平滑过渡。

*   模糊的图像：也被称为模糊技术。你提供一个极小版本的图像，然后再去过渡到完整的图像。最初的图像的像素和尺寸是极小的。为去除伪影图像（artifacts the image）被放大和模糊化。我在前面写的 [怎么去做中间的渐进加载的图像][1]、[使用 WebP 去创建极小的预览图像][2]、和 [渐进加载图像的更多示例][3] 中讨论过这方面的内容。

结果是，还有其它的更多的变化，并且许多聪明的人开发了其它的创建占位符的技术。

其中一个就是用梯度图代替固定的颜色。梯度图可以创建一个更精确的最终图像的预览，它整体上非常小（提升了有效载荷）。


![](https://cdn-images-1.medium.com/max/1250/0*ecPkBAl69ayvRctn.jpg)
使用梯度图作为背景。来自 Gradify 的截屏，它现在并不在线，代码 [在 GitHub][4]。

其它的技术是使用基于 SVGs 的技术，它在最近的实验和黑客中得到了一些支持。

### 基于 SVG 的占位符

我们知道  SVGs 是完美的矢量图像。在大多数情况下我们是希望去加载一个位图，所以，问题是怎么去矢量化一个图像。一些选择是使用边缘、形状和轮廓。

#### 边缘

在 [前面的文章中][30]，我解释了怎么去找出一个图像的边缘和创建一个动画。我最初的目标是去尝试绘制区域，矢量化这个图像，但是，我并不知道该怎么去做到。我意识到使用边缘也可能被创新，并且，我决定去让它们动起来，创建一个 “绘制” 的效果。

[在以前，使用边缘检测绘制图像和 SVG 动画，在 SVG 中基本上不被使用和支持的。一段时间以后，我们开始用它去作为一个有趣的替代 … medium.com][31][][32]

#### 形状

SVG 也可以用于去从图像中绘制区域而不是边缘/边界。用这种方法，我们可以矢量化一个位图去创建一个占位符。

在以前，我尝试去用三角形做类似的事情。你可以在我的 [at CSSConf][33] 和 [Render Conf][34] 的演讲中看到它。


上面的 codepen 是一个由 245 个三角形组成的基于 SVG 占位符的观点的证明。生成的三角形是使用 [Possan’s polyserver][36] 基于 [Delaunay triangulation][35]。正如预期的那样，使用更多的三角形，文件尺寸就更大。

#### Primitive 和 SQIP，一个基于 SVG 的 LQIP 技术

Tobias Baldauf 正在致力于另一个使用 SVGs 的被称为 [SQIP][37] 的低质量图像占位符技术。在深入研究 SQIP 之前，我先简单了解一下 [Primitive][38]，它是基于 SQIP 的一个库。

Primitive 是非常吸引人的，我强烈建议你去了解一下。它讲解了一个位图怎么变成由重叠形状组成的 SVG。它尺寸比较小，一个更小的往返，更适合直接放置到页面中，在一个初始的 HTML 载荷中，它是非常有意义的。

Primitive 基于像三角形、长方形、和圆形等形状去生成一个图像。在每一步中它增加一个新形状。很多步之后，图像的结果看起来非常接近原始图像。如果你输出的是 SVG，它意味着输出代码的尺寸将很大。

为了理解 Primitive 是怎么工作的，我通过几个图像来跑一下它。我用 10 个形状和 100 个形状来为这个插画生成  SVGs：

 ** 此处有Canvas,请手动处理 ** 

![](https://cdn-images-1.medium.com/max/625/1*y4sr9twkh_WyZh6h0yH98Q.png)


![](https://cdn-images-1.medium.com/max/625/1*cqyhYnx83LYvhGdmg2dFDw.png)

![](https://cdn-images-1.medium.com/max/625/1*qQP5160gPKQdysh0gFnNfw.jpeg)
Processing [this picture][5] 使用 Primitive，使用 [10 个形状][6] 和 [100 形状][7]。


![](https://cdn-images-1.medium.com/max/625/1*PWZLlC4lrLO4CVv1GwR7qA.png)



![](https://cdn-images-1.medium.com/max/625/1*khnga22ldJKOZ2z45Srh8A.png)


![](https://cdn-images-1.medium.com/max/625/1*N-20rR7YGFXiDSqIeIyOjA.jpeg)
Processing [this picture][8] 使用 Primitive，使用 [10 形状][9] 和 [100 形状][10]。

当在图像中使用 10 个形状时，我们基本构画出了原始图像。在图像环境占位符这里我们使用了 SVG 作为潜在的占位符。实际上，使用 10 个形状的 SVG 代码已经很小了，大约是 1030 字节，当通过 SVGO 传输时，它将下降到 ~640 字节。

```
<svg xmlns=”http://www.w3.org/2000/svg" width=”1024" height=”1024"><path fill=”#817c70" d=”M0 0h1024v1024H0z”/><g fill-opacity=”.502"><path fill=”#03020f” d=”M178 994l580 92L402–62"/><path fill=”#f2e2ba” d=”M638 894L614 6l472 440"/><path fill=”#fff8be” d=”M-62 854h300L138–62"/><path fill=”#76c2d9" d=”M410–62L154 530–62 38"/><path fill=”#62b4cf” d=”M1086–2L498–30l484 508"/><path fill=”#010412" d=”M430–2l196 52–76 356"/><path fill=”#eb7d3f” d=”M598 594l488–32–308 520"/><path fill=”#080a18" d=”M198 418l32 304 116–448"/><path fill=”#3f201d” d=”M1086 1062l-344–52 248–148"/><path fill=”#ebd29f” d=”M630 658l-60–372 516 320"/></g></svg>
```

使用 100 个形状生成的图像是很大的，正如我们预期的那样，在 SVGO（之前是 8kB）之后，加权大小为 ~5kB。它们在细节上已经很好了，但是仍然是个很小的载荷。使用多少三角形主要取决于图像类型和细腻程序（如，对比度、颜色数量、复杂度）。

它还可能去创建一个类似于 [cpeg-dssim][39] 的脚本，去调整所使用的形状的数量，以满足 [结构相似][40] 的阈值（或者最差情况中的最大数量）。

这些 SVG 的结果也可以用作背景图像。因为尺寸约束和矢量化，它们在图像和大规模的背景图像中是很好的选择。

#### SQIP

用 [Tobias 自己的话说][41]：

> SQIP 是尝试在这两个极端之间找到一种平衡：它使用 [Primitive][42] 去生成一个由几种简单图像构成的近似图像的可见特征的 SVG，使用 [SVGO][43] 去优化 SVG，并且为它增加高斯模糊滤镜。产生的最终的 SVG 占位符加权后大小为 ~800–1000 字节，在屏幕上看起来更为平滑，并提供一个可视的图像内容提示。

这个结果和使用一个极小的使用了模糊技术的占位符图像类似。（what [Medium][44] and [other sites][45] do)。区别在于它们使用了一个位图图像，如 JPG 或者 WebP，而这里是使用的占位符是 SVG。

如果我们使用 SQIP 而不是原始图像，我们将得到这样的效果：


![](https://cdn-images-1.medium.com/max/938/0*yUY1ZFP27vFYgj_o.png)



![](https://cdn-images-1.medium.com/max/938/0*DKoZP7DXFvUZJ34E.png)
[第一张图片][11] 和 [第二张][12] 的输出图像使用了 SQIP。

输出的 SVG 是 ~900 字节，并且检查代码，我们可以发现 `feGaussianBlur` 过滤应用到形状组上：

```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2000 2000"><filter id="b"><feGaussianBlur stdDeviation="12" /></filter><path fill="#817c70" d="M0 0h2000v2000H0z"/><g filter="url(#b)" transform="translate(4 4) scale(7.8125)" fill-opacity=".5"><ellipse fill="#000210" rx="1" ry="1" transform="matrix(50.41098 -3.7951 11.14787 148.07886 107 194.6)"/><ellipse fill="#eee3bb" rx="1" ry="1" transform="matrix(-56.38179 17.684 -24.48514 -78.06584 205 110.1)"/><ellipse fill="#fff4bd" rx="1" ry="1" transform="matrix(35.40604 -5.49219 14.85017 95.73337 16.4 123.6)"/><ellipse fill="#79c7db" cx="21" cy="39" rx="65" ry="65"/><ellipse fill="#0c1320" cx="117" cy="38" rx="34" ry="47"/><ellipse fill="#5cb0cd" rx="1" ry="1" transform="matrix(-39.46201 77.24476 -54.56092 -27.87353 219.2 7.9)"/><path fill="#e57339" d="M271 159l-123–16 43 128z"/><ellipse fill="#47332f" cx="214" cy="237" rx="242" ry="19"/></g></svg>
```

SQIP 也可以输出一个 Base 64 编码的 SVG 内容的图像标签：

```
<img width="640" height="640" src="example.jpg” alt="Add descriptive alt text" style="background-size: cover; background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAw…<stripped base 64>…PjwvZz48L3N2Zz4=);">
```

#### 轮廓

我们刚才看了使用了边缘和 primitive 形状的 SVG。另外一种可能是去矢量化图像以 “tracing” 它们。[Mikael 动画][47] 分享的 [a codepen][48]，在几天前展示了怎么去使用两色轮廓作为一个占位符。结果非常漂亮：

 
![](https://cdn-images-1.medium.com/max/1250/1*r6HbVnBkISCQp_UVKjOJKQ.gif)

SVGs 在这种情况下是手工绘制的，但是，这种技术可以用工具快速生成并自动化处理。

*   [Gatsby][13]，一个 React 支持的描绘 SVGs 的静态网站生成器。它使用 [一个 potrace 算法的 JS 端口][14] 去矢量化图像。

*   [Craft 3 CMS][15]，它也增加了对轮廓的支持。它使用 [一个 potrace 算法的 PHP 端口][16]。


*   [image-trace-loader][17]，一个使用了 Potrace 算法去处理图像的 Webpack 加载器。


如果感兴趣，可以去看一下 Emil 的 webpack 加载器 (基于 potrace) 和 Mikael 的手工绘制 SVGs 之间的比较。


假设我使用一个默认选项的 potrace 生成输出。但是，有可能对它们进行调整。查看 [the options for image-trace-loader][49]，它非常漂亮 [the ones passed down to potrace][50]。

### 总结

我们看到有不同的工具和技术去从图像中生成 SVGs，并且使用它们作为占位符。与 [WebP 是一个奇妙格式的缩略图][51] 方式相同，SVG 也是一个用于占位符的有趣的格式。我们可以控制细节的级别（和它们的大小），它是高可压缩的，并且很容易用 CSS 和 JS 进行处理。

#### 额外的资源

这篇文章发表于 [the top of Hacker News][52]。我非常感谢它，并且，在页面上的注释中的其它资源的全部有链接。下面是其中一部分。

*   [Geometrize][18] 是用 Haxe 写的 Primitive 的一个端口。这个也是，[一个 JS 实现][19]，你可以直接 [在你的浏览器上][20]尝试。

*   [Primitive.js][21]，它也是在 JS 中的一个 Primitive 端口，[primitive.nextgen][22]，它是使用 Primitive.js 和 Electron 的 Primitive 的桌面版应用的一个端口。

*   这里有两个 Twitter 帐户，里面你可以看到一些用 Primitive 和 Geometrize 生成的图像示例。访问 [@PrimitivePic][23] 和 [@Geometrizer][24]。

*   [imagetracerjs][25]，它是在 JavaScript 中的光栅图像跟踪和矢量化程序。这里也有为 [Java][26] 和 [Android][27] 提供的端口。

--------------------------------------------------------------------------------

via: https://medium.freecodecamp.org/using-svg-as-placeholders-more-image-loading-techniques-bed1b810ab2c

作者：[ José M. Pérez][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://medium.freecodecamp.org/@jmperezperez?source=post_header_lockup
[1]:https://medium.com/@jmperezperez/how-medium-does-progressive-image-loading-fd1e4dc1ee3d
[2]:https://medium.com/@jmperezperez/using-webp-to-create-tiny-preview-images-3e9b924f28d6
[3]:https://medium.com/@jmperezperez/more-examples-of-progressive-image-loading-f258be9f440b
[4]:https://github.com/fraser-hemp/gradify
[5]:https://jmperezperez.com/assets/images/posts/svg-placeholders/pexels-photo-281184-square.jpg
[6]:https://jmperezperez.com/assets/images/posts/svg-placeholders/pexels-photo-281184-square-10.svg
[7]:https://jmperezperez.com/assets/images/posts/svg-placeholders/pexels-photo-281184-square-100.svg
[8]:https://jmperezperez.com/assets/images/posts/svg-placeholders/pexels-photo-618463-square.jpg
[9]:https://jmperezperez.com/assets/images/posts/svg-placeholders/pexels-photo-618463-square-10.svg
[10]:https://jmperezperez.com/assets/images/posts/svg-placeholders/pexels-photo-618463-square-100.svg
[11]:https://jmperezperez.com/assets/images/posts/svg-placeholders/pexels-photo-281184-square-sqip.svg
[12]:https://jmperezperez.com/svg-placeholders/%28/assets/images/posts/svg-placeholders/pexels-photo-618463-square-sqip.svg
[13]:https://www.gatsbyjs.org/
[14]:https://www.npmjs.com/package/potrace
[15]:https://craftcms.com/
[16]:https://github.com/nystudio107/craft3-imageoptimize/blob/master/src/lib/Potracio.php
[17]:https://github.com/EmilTholin/image-trace-loader
[18]:https://github.com/Tw1ddle/geometrize-haxe
[19]:https://github.com/Tw1ddle/geometrize-haxe-web
[20]:http://www.samcodes.co.uk/project/geometrize-haxe-web/
[21]:https://github.com/ondras/primitive.js
[22]:https://github.com/cielito-lindo-productions/primitive.nextgen
[23]:https://twitter.com/PrimitivePic
[24]:https://twitter.com/Geometrizer
[25]:https://github.com/jankovicsandras/imagetracerjs
[26]:https://github.com/jankovicsandras/imagetracerjava
[27]:https://github.com/jankovicsandras/imagetracerandroid
[28]:https://medium.com/@jmperezperez/lazy-loading-images-on-the-web-to-improve-loading-time-and-saving-bandwidth-ec988b710290
[29]:https://www.youtube.com/watch?v=szmVNOnkwoU
[30]:https://medium.com/@jmperezperez/drawing-images-using-edge-detection-and-svg-animation-16a1a3676d3
[31]:https://medium.com/@jmperezperez/drawing-images-using-edge-detection-and-svg-animation-16a1a3676d3
[32]:https://medium.com/@jmperezperez/drawing-images-using-edge-detection-and-svg-animation-16a1a3676d3
[33]:https://jmperezperez.com/cssconfau16/#/45
[34]:https://jmperezperez.com/renderconf17/#/46
[35]:https://en.wikipedia.org/wiki/Delaunay_triangulation
[36]:https://github.com/possan/polyserver
[37]:https://github.com/technopagan/sqip
[38]:https://github.com/fogleman/primitive
[39]:https://github.com/technopagan/cjpeg-dssim
[40]:https://en.wikipedia.org/wiki/Structural_similarity
[41]:https://github.com/technopagan/sqip
[42]:https://github.com/fogleman/primitive
[43]:https://github.com/svg/svgo
[44]:https://medium.com/@jmperezperez/how-medium-does-progressive-image-loading-fd1e4dc1ee3d
[45]:https://medium.com/@jmperezperez/more-examples-of-progressive-image-loading-f258be9f440b
[46]:http://www.w3.org/2000/svg
[47]:https://twitter.com/mikaelainalem
[48]:https://codepen.io/ainalem/full/aLKxjm/
[49]:https://github.com/EmilTholin/image-trace-loader#options
[50]:https://www.npmjs.com/package/potrace#parameters
[51]:https://medium.com/@jmperezperez/using-webp-to-create-tiny-preview-images-3e9b924f28d6
[52]:https://news.ycombinator.com/item?id=15696596
