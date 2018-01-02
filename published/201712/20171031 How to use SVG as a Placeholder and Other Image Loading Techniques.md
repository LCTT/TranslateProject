怎么使用 SVG 作为一个图像占位符
============================================================

![](https://cdn-images-1.medium.com/max/1563/0*zJGl1vKLttcJGIL4.jpg)

*从图像中生成的 SVG 可以用作占位符。请继续阅读！*

我对怎么去让 web 性能更优化和图像加载的更快充满了热情。在这些感兴趣的领域中的其中一项研究就是占位符：当图像还没有被加载的时候应该去展示些什么？

在前些天，我偶然发现了使用 SVG 的一些加载技术，我将在这篇文章中谈论它。

在这篇文章中我们将涉及如下的主题：

*   不同的占位符类型的概述
*   基于 SVG 的占位符（边缘、形状和轮廓）
*   自动化处理

### 不同的占位符类型的概述

之前 [我写过一篇关于图像占位符和<ruby>延迟加载<rt>lazy-loading</rt></ruby>][28] 的文章以及 [关于它的讨论][29]。当进行一个图像的延迟加载时，一个很好的办法是提供一个东西作为占位符，因为它可能会很大程度上影响用户的感知体验。之前我提供了几个选择：

![](https://cdn-images-1.medium.com/max/1563/0*jlMM144vAhH-0bEn.png)

在图像被加载之前，有几种办法去填充图像区域：

*   在图像区域保持空白：在一个响应式设计的环境中，这种方式防止了内容的跳跃。从用户体验的角度来看，那些布局的改变是非常差的作法。但是，它是为了性能的考虑，否则，每次为了获取图像尺寸，浏览器就要被迫进行布局重新计算，以便为它留下空间。
*   占位符：在图像那里显示一个用户配置的图像。我们可以在背景上显示一个轮廓。它一直显示直到实际的图像被加载完成，它也被用于当请求失败或者当用户根本没有设置头像图像的情况下。这些图像一般都是矢量图，并且由于尺寸非常小，可以作为内联图片。
*   单一颜色：从图像中获取颜色，并将其作为占位符的背景颜色。这可能是图像的主要颜色、最具活力的颜色 … 这个想法是基于你正在加载的图像，并且它将有助于在没有图像和图像加载完成之间进行平滑过渡。
*   模糊的图像：也被称为模糊技术。你提供一个极小版本的图像，然后再去过渡到完整的图像。最初显示的图像的像素和尺寸是极小的。为去除<ruby>细节<rt>artifacts</rt></ruby>，该图像会被放大并模糊化。我在前面写的 [Medium 是怎么做的渐进加载图像][1]、[使用 WebP 去创建极小的预览图像][2]、和[渐进加载图像的更多示例][3] 中讨论过这方面的内容。

此外还有其它的更多的变种，许多聪明的人也开发了其它的创建占位符的技术。

其中一个就是用梯度图代替单一的颜色。梯度图可以创建一个更精确的最终图像的预览，它整体上非常小（提升了有效载荷）。

![](https://cdn-images-1.medium.com/max/1250/0*ecPkBAl69ayvRctn.jpg)

*使用梯度图作为背景。这是来自 Gradify 的截屏，它现在已经不在线了，代码 [在 GitHub][4]。*

另外一种技术是使用基于 SVG 的技术，它在最近的实验和研究中取得到了一些进展。

### 基于 SVG 的占位符

我们知道  SVG 是完美的矢量图像。而在大多数情况下我们是希望加载一个位图，所以，问题是怎么去矢量化一个图像。其中一些方法是使用边缘、形状和轮廓。

#### 边缘

在 [前面的文章中][30]，我解释了怎么去找出一个图像的边缘并创建一个动画。我最初的目标是去尝试绘制区域，矢量化该图像，但是我并不知道该怎么去做到。我意识到使用边缘也可能是一种创新，我决定去让它们动起来，创建一个 “绘制” 的效果。

- [范例](https://codepen.io/jmperez/embed/oogqdp?default-tabs=html%2Cresult&embed-version=2&height=600&host=https%3A%2F%2Fcodepen.io&referrer=https%3A%2F%2Fmedium.freecodecamp.org%2Fmedia%2F8c5c44a4adf82b09692a34eb4daa3e2e%3FpostId%3Dbed1b810ab2c&slug-hash=oogqdp#result-box)

> [使用边缘检测绘制图像和 SVG 动画][31]

> 在以前，很少使用和支持 SVG。一段时间以后，我们开始用它去作为一个某些图标的传统位图的替代品……

#### 形状

SVG 也可以用于根据图像绘制区域而不是边缘/边界。用这种方法，我们可以矢量化一个位图来创建一个占位符。

在以前，我尝试去用三角形做类似的事情。你可以在 [CSSConf][33] 和 [Render Conf][34] 上我的演讲中看到它。

- [范例](https://codepen.io/jmperez/embed/BmaWmQ?default-tabs=html%2Cresult&embed-version=2&height=600&host=https%3A%2F%2Fcodepen.io&referrer=https%3A%2F%2Fmedium.freecodecamp.org%2Fmedia%2F05d1ee44f0537f8257258124d7b94613%3FpostId%3Dbed1b810ab2c&slug-hash=BmaWmQ#result-box)

上面的 codepen 是一个由 245 个三角形组成的基于 SVG 占位符的概念验证。生成的三角形是基于 [Delaunay triangulation][35] 的，使用了 [Possan’s polyserver][36]。正如预期的那样，使用更多的三角形，文件尺寸就更大。

#### Primitive 和 SQIP，一个基于 SVG 的 LQIP 技术

Tobias Baldauf 正在致力于另一个使用 SVG 的低质量图像占位符技术，它被称为 [SQIP][37]。在深入研究 SQIP 之前，我先简单介绍一下 [Primitive][38]，它是基于 SQIP 的一个库。

Primitive 是非常吸引人的，我强烈建议你去了解一下。它讲解了一个位图怎么变成由重叠形状组成的 SVG。它尺寸比较小，适合于直接内联放置到页面中。当步骤较少时，在初始的 HTML 载荷中作为占位符是非常有意义的。

Primitive 基于三角形、长方形、和圆形等形状生成一个图像。在每一步中它增加一个新形状。很多步之后，图像的结果看起来非常接近原始图像。如果你输出的是 SVG，它意味着输出代码的尺寸将很大。

为了理解 Primitive 是怎么工作的，我通过几个图像来跑一下它。我用 10 个形状和 100 个形状来为这个插画生成 SVG：

![](https://cdn-images-1.medium.com/max/625/1*y4sr9twkh_WyZh6h0yH98Q.png)
![](https://cdn-images-1.medium.com/max/625/1*cqyhYnx83LYvhGdmg2dFDw.png)
![](https://cdn-images-1.medium.com/max/625/1*qQP5160gPKQdysh0gFnNfw.jpeg)

使用 Primitive 处理 ，使用 [10 个形状][6] 、 [100 形状][7]、 [原图][5]。

![](https://cdn-images-1.medium.com/max/625/1*PWZLlC4lrLO4CVv1GwR7qA.png)
![](https://cdn-images-1.medium.com/max/625/1*khnga22ldJKOZ2z45Srh8A.png)
![](https://cdn-images-1.medium.com/max/625/1*N-20rR7YGFXiDSqIeIyOjA.jpeg)

使用 Primitive 处理，使用 [10 形状][9] 、 [100 形状][10]、 [原图][8] 。

当在图像中使用 10 个形状时，我们基本构画出了原始图像。在图像占位符这种使用场景里，我们可以使用这种 SVG 作为潜在的占位符。实际上，使用 10 个形状的 SVG 代码已经很小了，大约是 1030 字节，当通过 SVGO 传输时，它将下降到约 640 字节。

```
<svg xmlns=”http://www.w3.org/2000/svg" width=”1024" height=”1024"><path fill=”#817c70" d=”M0 0h1024v1024H0z”/><g fill-opacity=”.502"><path fill=”#03020f” d=”M178 994l580 92L402–62"/><path fill=”#f2e2ba” d=”M638 894L614 6l472 440"/><path fill=”#fff8be” d=”M-62 854h300L138–62"/><path fill=”#76c2d9" d=”M410–62L154 530–62 38"/><path fill=”#62b4cf” d=”M1086–2L498–30l484 508"/><path fill=”#010412" d=”M430–2l196 52–76 356"/><path fill=”#eb7d3f” d=”M598 594l488–32–308 520"/><path fill=”#080a18" d=”M198 418l32 304 116–448"/><path fill=”#3f201d” d=”M1086 1062l-344–52 248–148"/><path fill=”#ebd29f” d=”M630 658l-60–372 516 320"/></g></svg>
```

正如我们预计的那样，使用 100 个形状生成的图像更大，在 SVGO（之前是 8kB）之后，大小约为 5kB。它们在细节上已经很好了，但是仍然是个很小的载荷。使用多少三角形主要取决于图像类型和细腻程度（如，对比度、颜色数量、复杂度）。

还可以创建一个类似于 [cpeg-dssim][39] 的脚本，去调整所使用的形状的数量，以满足 [结构相似][40] 的阈值（或者最差情况中的最大数量）。

这些生成的 SVG 也可以用作背景图像。因为尺寸约束和矢量化，它们在展示<ruby>超大题图<rt>hero image</rt></ruby>和大型背景图像时是很好的选择。

#### SQIP

用 [Tobias 自己的话说][41]：

> SQIP 尝试在这两个极端之间找到一种平衡：它使用 [Primitive][42] 去生成一个 SVG，由几种简单的形状构成，近似于图像中可见的主要特征，使用 [SVGO][43] 优化 SVG，并且为它增加高斯模糊滤镜。产生的最终的 SVG 占位符后大小仅为约 800~1000 字节，在屏幕上看起来更为平滑，并提供一个图像内容的视觉提示。

这个结果和使用一个用了模糊技术的极小占位符图像类似。（看看  [Medium][44] 和 [其它站点][45] 是怎么做的）。区别在于它们使用了一个位图图像，如 JPG 或者 WebP，而这里是使用的占位符是 SVG。

如果我们使用 SQIP 而不是原始图像，我们将得到这样的效果：

![](https://cdn-images-1.medium.com/max/938/0*yUY1ZFP27vFYgj_o.png)
![](https://cdn-images-1.medium.com/max/938/0*DKoZP7DXFvUZJ34E.png)

*[第一张图像][11] 和 [第二张图像][12] 使用了 SQIP 后的输出图像。*

输出的 SVG 约 900 字节，并且通过检查代码，我们可以发现 `feGaussianBlur` 过滤被应用到该组形状上：

```
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 2000 2000"><filter id="b"><feGaussianBlur stdDeviation="12" /></filter><path fill="#817c70" d="M0 0h2000v2000H0z"/><g filter="url(#b)" transform="translate(4 4) scale(7.8125)" fill-opacity=".5"><ellipse fill="#000210" rx="1" ry="1" transform="matrix(50.41098 -3.7951 11.14787 148.07886 107 194.6)"/><ellipse fill="#eee3bb" rx="1" ry="1" transform="matrix(-56.38179 17.684 -24.48514 -78.06584 205 110.1)"/><ellipse fill="#fff4bd" rx="1" ry="1" transform="matrix(35.40604 -5.49219 14.85017 95.73337 16.4 123.6)"/><ellipse fill="#79c7db" cx="21" cy="39" rx="65" ry="65"/><ellipse fill="#0c1320" cx="117" cy="38" rx="34" ry="47"/><ellipse fill="#5cb0cd" rx="1" ry="1" transform="matrix(-39.46201 77.24476 -54.56092 -27.87353 219.2 7.9)"/><path fill="#e57339" d="M271 159l-123–16 43 128z"/><ellipse fill="#47332f" cx="214" cy="237" rx="242" ry="19"/></g></svg>
```

SQIP 也可以输出一个带有 Base64 编码的 SVG 内容的图像标签：

```
<img width="640" height="640" src="example.jpg” alt="Add descriptive alt text" style="background-size: cover; background-image: url(data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAw…<stripped base 64>…PjwvZz48L3N2Zz4=);">
```

#### 轮廓

我们刚才看了使用了边缘和原始形状的 SVG。另外一种矢量化图像的方式是 “描绘” 它们。在几天前 [Mikael Ainalem][47] 分享了一个 [codepen][48] 代码，展示了怎么去使用两色轮廓作为一个占位符。结果非常漂亮：

![](https://cdn-images-1.medium.com/max/1250/1*r6HbVnBkISCQp_UVKjOJKQ.gif)

SVG 在这种情况下是手工绘制的，但是，这种技术可以用工具快速生成并自动化处理。

*   [Gatsby][13]，一个用 React 支持的描绘 SVG 的静态网站生成器。它使用 [一个 potrace 算法的 JS 移植][14] 去矢量化图像。
*   [Craft 3 CMS][15]，它也增加了对轮廓的支持。它使用了 [一个 potrace 算法的 PHP 移植][16]。
*   [image-trace-loader][17]，一个使用了 potrace 算法去处理图像的 Webpack 加载器。

如果感兴趣，可以去看一下 Emil 的 webpack 加载器 (基于 potrace) 和 Mikael 的手工绘制 SVG 之间的比较。

这里我假设该输出是使用默认选项的 potrace 生成的。但是可以对它们进行优化。查看 [图像描绘加载器的选项][49]，[传递给 potrace 的选项][50]非常丰富。

### 总结

我们看到了从图像中生成 SVG 并使用它们作为占位符的各种不同的工具和技术。与 [WebP 是一个用于缩略图的奇妙格式][51] 一样，SVG 也是一个用于占位符的有趣格式。我们可以控制细节的级别（和它们的大小），它是高可压缩的，并且很容易用 CSS 和 JS 进行处理。

#### 额外的资源

这篇文章上到了 [Hacker News 热文][52]。对此以及在该页面的评论中分享的其它资源的链接，我表示非常感谢。下面是其中一部分。

*   [Geometrize][18] 是用 Haxe 写的 Primitive 的一个移植。也有[一个 JS 实现][19]，你可以直接 [在你的浏览器上][20]尝试它。
*   [Primitive.js][21]，它也是 Primitive 在 JS 中的一个移植，[primitive.nextgen][22]，它是使用 Primitive.js 和 Electron 的 Primitive 的桌面版应用的一个移植。
*   这里有两个 Twitter 帐户，里面你可以看到一些用 Primitive 和 Geometrize 生成的图像示例。访问 [@PrimitivePic][23] 和 [@Geometrizer][24]。
*   [imagetracerjs][25]，它是在 JavaScript 中的光栅图像描绘器和矢量化程序。这里也有为 [Java][26] 和 [Android][27] 提供的移植。

--------------------------------------------------------------------------------

via: https://medium.freecodecamp.org/using-svg-as-placeholders-more-image-loading-techniques-bed1b810ab2c

作者：[José M. Pérez][a]
译者：[qhwdw](https://github.com/qhwdw)
校对：[wxy](https://github.com/wxy)

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
