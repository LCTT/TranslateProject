[#]: collector: (lujun9972)
[#]: translator: (HankChow)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-10679-1.html)
[#]: subject: (10 Python image manipulation tools)
[#]: via: (https://opensource.com/article/19/3/python-image-manipulation-tools)
[#]: author: (Parul Pandey https://opensource.com/users/parul-pandey)

10 个 Python 图像编辑工具
======

> 以下提到的这些 Python 工具在编辑图像、操作图像底层数据方面都提供了简单直接的方法。

![][1]

当今的世界充满了数据，而图像数据就是其中很重要的一部分。但只有经过处理和分析，提高图像的质量，从中提取出有效地信息，才能利用到这些图像数据。

常见的图像处理操作包括显示图像，基本的图像操作，如裁剪、翻转、旋转；图像的分割、分类、特征提取；图像恢复；以及图像识别等等。Python 作为一种日益风靡的科学编程语言，是这些图像处理操作的最佳选择。同时，在 Python 生态当中也有很多可以免费使用的优秀的图像处理工具。

下文将介绍 10 个可以用于图像处理任务的 Python 库，它们在编辑图像、查看图像底层数据方面都提供了简单直接的方法。

### 1、scikit-image

[scikit-image][2] 是一个结合 [NumPy][3] 数组使用的开源 Python 工具，它实现了可用于研究、教育、工业应用的算法和应用程序。即使是对于刚刚接触 Python 生态圈的新手来说，它也是一个在使用上足够简单的库。同时它的代码质量也很高，因为它是由一个活跃的志愿者社区开发的，并且通过了<ruby>同行评审<rt>peer review</rt></ruby>。 

#### 资源

scikit-image 的[文档][4]非常完善，其中包含了丰富的用例。

#### 示例

可以通过导入 `skimage` 使用，大部分的功能都可以在它的子模块中找到。

<ruby>图像滤波<rt>image filtering</rt></ruby>：

```
import matplotlib.pyplot as plt
%matplotlib inline

from skimage import data,filters

image = data.coins() # ... or any other NumPy array!
edges = filters.sobel(image)
plt.imshow(edges, cmap='gray')
```

![Image filtering in scikit-image][6]

使用 [match_template()][7] 方法实现<ruby>模板匹配<rt>template matching</rt></ruby>：

![Template matching in scikit-image][9]

在[展示页面][10]可以看到更多相关的例子。

### 2、NumPy

[NumPy][11] 提供了对数组的支持，是 Python 编程的一个核心库。图像的本质其实也是一个包含像素数据点的标准 NumPy 数组，因此可以通过一些基本的 NumPy 操作（例如切片、<ruby>掩膜<rt>mask</rt></ruby>、<ruby>花式索引<rt>fancy indexing</rt></ruby>等），就可以从像素级别对图像进行编辑。通过 NumPy 数组存储的图像也可以被 skimage 加载并使用 matplotlib 显示。

#### 资源

在 NumPy 的[官方文档][11]中提供了完整的代码文档和资源列表。

#### 示例

使用 NumPy 对图像进行<ruby>掩膜<rt>mask</rt></ruby>操作：

```
import numpy as np
from skimage import data
import matplotlib.pyplot as plt
%matplotlib inline

image = data.camera()
type(image)
numpy.ndarray #Image is a NumPy array:

mask = image < 87
image[mask]=255
plt.imshow(image, cmap='gray')
```

![NumPy][13]

### 3、SciPy

像 NumPy 一样，[SciPy][14] 是 Python 的一个核心科学计算模块，也可以用于图像的基本操作和处理。尤其是 SciPy v1.1.0 中的  [scipy.ndimage][15] 子模块，它提供了在 n 维 NumPy 数组上的运行的函数。SciPy 目前还提供了<ruby>线性和非线性滤波<rt>linear and non-linear filtering</rt></ruby>、<ruby>二值形态学<rt>binary morphology</rt></ruby>、<ruby>B 样条插值<rt>B-spline interpolation</rt></ruby>、<ruby>对象测量<rt>object measurements</rt></ruby>等方面的函数。

#### 资源

在[官方文档][16]中可以查阅到 `scipy.ndimage` 的完整函数列表。

#### 示例

使用 SciPy 的[高斯滤波][17]对图像进行模糊处理：

```
from scipy import misc,ndimage

face = misc.face()
blurred_face = ndimage.gaussian_filter(face, sigma=3)
very_blurred = ndimage.gaussian_filter(face, sigma=5)

#Results
plt.imshow(<image to be displayed>)
```

![Using a Gaussian filter in SciPy][19]

### 4、PIL/Pillow

PIL (Python Imaging Library) 是一个免费 Python 编程库，它提供了对多种格式图像文件的打开、编辑、保存的支持。但在 2009 年之后 PIL 就停止发布新版本了。幸运的是，还有一个 PIL 的积极开发的分支 [Pillow][20]，它的安装过程比 PIL 更加简单，支持大部分主流的操作系统，并且还支持 Python 3。Pillow 包含了图像的基础处理功能，包括像素点操作、使用内置卷积内核进行滤波、颜色空间转换等等。

#### 资源

Pillow 的[官方文档][21]提供了 Pillow 的安装说明自己代码库中每一个模块的示例。

#### 示例

使用 Pillow 中的 ImageFilter 模块实现图像增强：

```
from PIL import Image,ImageFilter
#Read image
im = Image.open('image.jpg')
#Display image
im.show()

from PIL import ImageEnhance
enh = ImageEnhance.Contrast(im)
enh.enhance(1.8).show("30% more contrast")
```

![Enhancing an image in Pillow using ImageFilter][23]

- [源码][24]

### 5、OpenCV-Python

OpenCV（Open Source Computer Vision 库）是计算机视觉领域最广泛使用的库之一，[OpenCV-Python][25] 则是 OpenCV 的 Python API。OpenCV-Python 的运行速度很快，这归功于它使用 C/C++ 编写的后台代码，同时由于它使用了 Python 进行封装，因此调用和部署的难度也不大。这些优点让 OpenCV-Python 成为了计算密集型计算机视觉应用程序的一个不错的选择。

#### 资源

入门之前最好先阅读 [OpenCV2-Python-Guide][26] 这份文档。

#### 示例

使用 OpenCV-Python 中的<ruby>金字塔融合<rt>Pyramid Blending</rt></ruby>将苹果和橘子融合到一起：


![Image blending using Pyramids in OpenCV-Python][28]

- [源码][29]

### 6、SimpleCV

[SimpleCV][30] 是一个开源的计算机视觉框架。它支持包括 OpenCV 在内的一些高性能计算机视觉库，同时不需要去了解<ruby>位深度<rt>bit depth</rt></ruby>、文件格式、<ruby>色彩空间<rt>color space</rt></ruby>之类的概念，因此 SimpleCV 的学习曲线要比 OpenCV 平缓得多，正如它的口号所说，“将计算机视觉变得更简单”。SimpleCV 的优点还有：

  * 即使是刚刚接触计算机视觉的程序员也可以通过 SimpleCV 来实现一些简易的计算机视觉测试
  * 录像、视频文件、图像、视频流都在支持范围内

#### 资源

[官方文档][31]简单易懂，同时也附有大量的学习用例。

#### 示例

![SimpleCV][33]

### 7、Mahotas

[Mahotas][34] 是另一个 Python 图像处理和计算机视觉库。在图像处理方面，它支持滤波和形态学相关的操作；在计算机视觉方面，它也支持<ruby>特征计算<rt>feature computation</rt></ruby>、<ruby>兴趣点检测<rt>interest point detection</rt></ruby>、<ruby>局部描述符<rt>local descriptors</rt></ruby>等功能。Mahotas 的接口使用了 Python 进行编写，因此适合快速开发，而算法使用 C++ 实现，并针对速度进行了优化。Mahotas 尽可能做到代码量少和依赖项少，因此它的运算速度非常快。可以参考[官方文档][35]了解更多详细信息。

#### 资源

[文档][36]包含了安装介绍、示例以及一些 Mahotas 的入门教程。

#### 示例

Mahotas 力求使用少量的代码来实现功能。例如这个 [Finding Wally][37] 游戏：

![Finding Wally problem in Mahotas][39]

![Finding Wally problem in Mahotas][42]

- [源码][40]

### 8、SimpleITK

[ITK][43]（Insight Segmentation and Registration Toolkit）是一个为开发者提供普适性图像分析功能的开源、跨平台工具套件，[SimpleITK][44] 则是基于 ITK 构建出来的一个简化层，旨在促进 ITK 在快速原型设计、教育、解释语言中的应用。SimpleITK 作为一个图像分析工具包，它也带有[大量的组件][45]，可以支持常规的滤波、图像分割、<ruby>图像配准<rt>registration</rt></ruby>功能。尽管 SimpleITK 使用 C++ 编写，但它也支持包括 Python 在内的大部分编程语言。

#### 资源

有很多 [Jupyter Notebooks][46] 用例可以展示 SimpleITK 在教育和科研领域中的应用，通过这些用例可以看到如何使用 Python 和 R 利用 SimpleITK 来实现交互式图像分析。

#### 示例

使用 Python + SimpleITK 实现的 CT/MR 图像配准过程：

![SimpleITK animation][48]

- [源码][49]

### 9、pgmagick

[pgmagick][50] 是使用 Python 封装的 GraphicsMagick 库。[GraphicsMagick][51] 通常被认为是图像处理界的瑞士军刀，因为它强大而又高效的工具包支持对多达 88 种主流格式图像文件的读写操作，包括 DPX、GIF、JPEG、JPEG-2000、PNG、PDF、PNM、TIFF 等等。

#### 资源

pgmagick 的 [GitHub 仓库][52]中有相关的安装说明、依赖列表，以及详细的[使用指引][53]。

#### 示例

图像缩放：

![Image scaling in pgmagick][55]

- [源码][56]

边缘提取：

![Edge extraction in pgmagick][58]

- [源码][59]

### 10、Pycairo

[Cairo][61] 是一个用于绘制矢量图的二维图形库，而 [Pycairo][60] 是用于 Cairo 的一组 Python 绑定。矢量图的优点在于做大小缩放的过程中不会丢失图像的清晰度。使用 Pycairo 可以在 Python 中调用 Cairo 的相关命令。

#### 资源

Pycairo 的 [GitHub 仓库][62]提供了关于安装和使用的详细说明，以及一份简要介绍 Pycairo 的[入门指南][63]。

#### 示例

使用 Pycairo 绘制线段、基本图形、<ruby>径向渐变<rt>radial gradients</rt></ruby>：

![Pycairo][65]

- [源码][66]

### 总结

以上就是 Python 中的一些有用的图像处理库，无论你有没有听说过、有没有使用过，都值得试用一下并了解它们。

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/python-image-manipulation-tools

作者：[Parul Pandey][a]
选题：[lujun9972][b]
译者：[HankChow](https://github.com/HankChow)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/parul-pandey
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/daisy_gimp_art_design.jpg?itok=6kCxAKWO
[2]: https://scikit-image.org/
[3]: http://docs.scipy.org/doc/numpy/reference/index.html#module-numpy
[4]: http://scikit-image.org/docs/stable/user_guide.html
[5]: /file/426206
[6]: https://opensource.com/sites/default/files/uploads/1-scikit-image.png "Image filtering in scikit-image"
[7]: http://scikit-image.org/docs/dev/auto_examples/features_detection/plot_template.html#sphx-glr-auto-examples-features-detection-plot-template-py
[8]: /file/426211
[9]: https://opensource.com/sites/default/files/uploads/2-scikit-image.png "Template matching in scikit-image"
[10]: https://scikit-image.org/docs/dev/auto_examples
[11]: http://www.numpy.org/
[12]: /file/426216
[13]: https://opensource.com/sites/default/files/uploads/3-numpy.png "NumPy"
[14]: https://www.scipy.org/
[15]: https://docs.scipy.org/doc/scipy/reference/ndimage.html#module-scipy.ndimage
[16]: https://docs.scipy.org/doc/scipy/reference/tutorial/ndimage.html#correlation-and-convolution
[17]: https://docs.scipy.org/doc/scipy/reference/generated/scipy.ndimage.gaussian_filter.html
[18]: /file/426221
[19]: https://opensource.com/sites/default/files/uploads/4-scipy.png "Using a Gaussian filter in SciPy"
[20]: https://python-pillow.org/
[21]: https://pillow.readthedocs.io/en/3.1.x/index.html
[22]: /file/426226
[23]: https://opensource.com/sites/default/files/uploads/5-pillow.png "Enhancing an image in Pillow using ImageFilter"
[24]: http://sipi.usc.edu/database/
[25]: https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_setup/py_intro/py_intro.html
[26]: https://github.com/abidrahmank/OpenCV2-Python-Tutorials
[27]: /file/426236
[28]: https://opensource.com/sites/default/files/uploads/6-opencv.jpeg "Image blending using Pyramids in OpenCV-Python"
[29]: https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_imgproc/py_pyramids/py_pyramids.html#pyramids
[30]: http://simplecv.org/
[31]: http://examples.simplecv.org/en/latest/
[32]: /file/426241
[33]: https://opensource.com/sites/default/files/uploads/7-_simplecv.png "SimpleCV"
[34]: https://mahotas.readthedocs.io/en/latest/
[35]: https://openresearchsoftware.metajnl.com/articles/10.5334/jors.ac/
[36]: https://mahotas.readthedocs.io/en/latest/install.html
[37]: https://blog.clarifai.com/wheres-waldo-using-machine-learning-to-find-all-the-waldos
[38]: /file/426246
[39]: https://opensource.com/sites/default/files/uploads/8-mahotas.png "Finding Wally problem in Mahotas"
[40]: https://mahotas.readthedocs.io/en/latest/wally.html
[41]: /file/426251
[42]: https://opensource.com/sites/default/files/uploads/9-mahotas.png "Finding Wally problem in Mahotas"
[43]: https://itk.org/
[44]: http://www.simpleitk.org/
[45]: https://itk.org/ITK/resources/resources.html
[46]: http://insightsoftwareconsortium.github.io/SimpleITK-Notebooks/
[47]: /file/426256
[48]: https://opensource.com/sites/default/files/uploads/10-simpleitk.gif "SimpleITK animation"
[49]: https://github.com/InsightSoftwareConsortium/SimpleITK-Notebooks/blob/master/Utilities/intro_animation.py
[50]: https://pypi.org/project/pgmagick/
[51]: http://www.graphicsmagick.org/
[52]: https://github.com/hhatto/pgmagick
[53]: https://pgmagick.readthedocs.io/en/latest/
[54]: /file/426261
[55]: https://opensource.com/sites/default/files/uploads/11-pgmagick.png "Image scaling in pgmagick"
[56]: https://pgmagick.readthedocs.io/en/latest/cookbook.html#scaling-a-jpeg-image
[57]: /file/426266
[58]: https://opensource.com/sites/default/files/uploads/12-pgmagick.png "Edge extraction in pgmagick"
[59]: https://pgmagick.readthedocs.io/en/latest/cookbook.html#edge-extraction
[60]: https://pypi.org/project/pycairo/
[61]: https://cairographics.org/
[62]: https://github.com/pygobject/pycairo
[63]: https://pycairo.readthedocs.io/en/latest/tutorial.html
[64]: /file/426271
[65]: https://opensource.com/sites/default/files/uploads/13-pycairo.png "Pycairo"
[66]: http://zetcode.com/gfx/pycairo/basicdrawing/

