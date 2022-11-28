[#]: subject: (Use OpenCV on Fedora Linux ‒ part 1)
[#]: via: (https://fedoramagazine.org/use-opencv-on-fedora-linux-part-1/)
[#]: author: (Onuralp SEZER https://fedoramagazine.org/author/thunderbirdtr/)
[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13698-1.html)

在 Fedora Linux 上使用 OpenCV（一）
======

![][1]

*封面图片选自[文森特·梵高][2]的《星空》，公共领域，通过维基共享资源发布*

技术世界每天都在变化，对计算机视觉、人工智能和机器学习的需求也在增加。让计算机和手机能够看到周围环境的技术被称为 [计算机视觉][3]。这个重新创造人眼的工作始于 50 年代。从那时起，计算机视觉技术有了长足的发展。计算机视觉已经通过不同的应用进入了我们的手机。这篇文章将介绍 Fedora Linux 上的 [OpenCV][4]。

### 什么是 OpenCV？

> OpenCV（<ruby>开源计算机视觉库<rt>Open Source Computer Vision Library</rt></ruby>）是一个开源的计算机视觉和机器学习软件库。OpenCV 的建立是为了给计算机视觉应用提供一个通用的基础设施，并加速机器感知在商业产品中的应用。它有超过 2500 种优化后的算法，其中包括一套全面的经典和最先进的计算机视觉和机器学习算法。这些算法可用于检测和识别人脸、识别物体、对视频中的人类行为进行分类，并建立标记，将其与增强现实叠加等等。
>
> [opencv.org – about][5]

### 在 Fedora Linux 上安装 OpenCV

要开始使用 OpenCV，请从 Fedora Linux 仓库中安装它：

```
$ sudo dnf install opencv opencv-contrib opencv-doc python3-opencv python3-matplotlib python3-numpy
```

**注意：** 在 Fedora Silverblue 或 CoreOS 上，Python 3.9 是核心提交的一部分。用以下方法安装 OpenCV 和所需工具：

```
rpm-ostree install opencv opencv-doc python3-opencv python3-matplotlib python3-numpy
```

接下来，在终端输入以下命令，以验证 OpenCV 是否已经安装：

```
$ python
Python 3.9.6 (default, Jul 16 2021, 00:00:00)
[GCC 11.1.1 20210531 (Red Hat 11.1.1-3)] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import cv2 as cv
>>> print( cv.__version__ )
4.5.2
>>> exit()
```

当你输入 `print` 命令时，应该显示当前的 OpenCV 版本，如上图所示。这表明 OpenCV 和 Python-OpenCV 库已经成功安装。

此外，如果你想用 Jupyter Notebook 做笔记和写代码，并了解更多关于数据科学工具的信息，请查看早期的 Fedora Magazine 文章：[Fedora 中的 Jupyter 和数据科学][6]。

### 开始使用 OpenCV

安装完成后，使用 Python 和 OpenCV 库加载一个样本图像（按 `S` 键以 png 格式保存图像的副本并完成程序）：

```
$ cp /usr/share/opencv4/samples/data/starry_night.jpg .
$ python starry_night.py
```

`starry_night.py` 的内容：

```
import cv2 as cv
import sys
img = cv.imread(cv.samples.findFile("starry_night.jpg"))
if img is None:
    sys.exit("Could not read the image.")
cv.imshow("Display window", img)
k = cv.waitKey(0)
if k == ord("s"):
    cv.imwrite("starry_night.png", img)
```

![][7]

通过在 `cv.imread` 函数中添加参数 `0`，对图像进行灰度处理，如下所示。

```
img = cv.imread(cv.samples.findFile("starry_night.jpg"),0)
```

![][8]

这些是一些可以用于 `cv.imread` 函数的第二个参数的替代值：

  * `cv2.IMREAD_GRAYSCALE` 或 `0`：以灰度模式加载图像。
  * `cv2.IMREAD_COLOR** 或 `1`：以彩色模式载入图像。图像中的任何透明度将被移除。这是默认的。
  * `cv2.IMREAD_UNCHANGED** 或 `-1`：载入未经修改的图像。包括 alpha 通道。

#### 使用 OpenCV 显示图像属性

图像属性包括行、列和通道的数量、图像数据的类型、像素的数量等等。假设你想访问图像的形状和它的数据类型。你可以这样做：

```
import cv2 as cv

img = cv.imread(cv.samples.findFile("starry_night.jpg"))
print("Image size is", img.shape)
print("Data type of image is", img.dtype)

Image size is (600, 752, 3)
Data type of image is uint8

print(f"Image 2D numpy array \n {img}")

Image 2D numpy array
 [[[0 0 0]
  [0 0 0]
  [0 0 0]
  ...
  [0 0 0]
  [0 0 0]
  [0 0 0]]

 [[0 0 0]
  [0 0 0]
  [0 0 0]
  ...
```

  * `img.shape`：返回一个行数、列数和通道数的元组（如果是彩色图像）。
  * `img.dtype`：返回图像的数据类型。

接下来用 Matplotlib 显示图像：

```
import cv2 as cv
import matplotlib.pyplot as plt
img = cv.imread(cv.samples.findFile("starry_night.jpg"),0)
plt.imshow(img)
plt.show()
```

![][9]

#### 发生了什么？

该图像是作为灰度图像读入的，但是当使用 Matplotlib 的 `imshow` 函数时，它不一定会以灰度显示。这是因为 `imshow` 函数默认使用不同的颜色映射。要指定使用灰度颜色映射，请将 `imshow` 函数的第二个参数设置为 `cmap='gray'`，如下所示：

```
plt.imshow(img,cmap='gray')
```

![][10]

这个问题在以彩色模式打开图片时也会发生，因为 Matplotlib 期望图片为 RGB（红、绿、蓝）格式，而 OpenCV 则以 BGR（蓝、绿、红）格式存储图片。为了正确显示，你需要将 BGR 图像的通道反转。

```
import cv2 as cv
import matplotlib.pyplot as plt
img = cv.imread(cv.samples.findFile("starry_night.jpg"),cv.IMREAD_COLOR)
fig, (ax1, ax2) = plt.subplots(1,2)
ax1.imshow(img)
ax1.set_title('BGR Colormap')
ax2.imshow(img[:,:,::-1])
ax2.set_title('Reversed BGR Colormap(RGB)')
plt.show()
```

![][11]

#### 分割和合并颜色通道

```
import cv2 as cv
import matplotlib.pyplot as plt

img = cv.imread(cv.samples.findFile("starry_night.jpg"),cv.IMREAD_COLOR)
b,g,r = cv.split(img)

fig,ax = plt.subplots(2,2)

ax[0,0].imshow(r,cmap='gray')
ax[0,0].set_title("Red Channel");
ax[0,1].imshow(g,cmap='gray')
ax[0,1].set_title("Green Channel");
ax[1,0].imshow(b,cmap='gray')
ax[1,0].set_title("Blue Channel");

# Merge the individual channels into a BGR image
imgMerged = cv.merge((b,g,r))
# Show the merged output
ax[1,1].imshow(imgMerged[:,:,::-1])
ax[1,1].set_title("Merged Output");
plt.show()
```

![][12]

  * `cv2.split`：将一个多通道数组分割成几个单通道数组。
  * `cv2.merge`：将几个数组合并成一个多通道数组。所有的输入矩阵必须具有相同的大小。

**注意：** 白色较多的图像具有较高的颜色密度。相反，黑色较多的图像，其颜色密度较低。在上面的例子中，红色的密度是最低的。

#### 转换到不同的色彩空间

`cv2.cvtColor` 函数将一个输入图像从一个颜色空间转换到另一个颜色空间。在 RGB 和 BGR 色彩空间之间转换时，应明确指定通道的顺序（`RGB2BGR` 或 `BGR2RGB`）。**注意，OpenCV 中的默认颜色格式通常被称为 RGB，但它实际上是 BGR（字节是相反的）。** 因此，标准（24 位）彩色图像的第一个字节将是一个 8 位蓝色分量，第二个字节是绿色，第三个字节是红色。然后第四、第五和第六个字节将是第二个像素（蓝色、然后是绿色，然后是红色），以此类推。

```
import cv2 as cv
import matplotlib.pyplot as plt
img = cv.imread(cv.samples.findFile("starry_night.jpg"),cv.IMREAD_COLOR)
img_rgb = cv.cvtColor(img, cv.COLOR_BGR2RGB)
plt.imshow(img_rgb)
plt.show()
```

![][13]

### 更多信息

关于 OpenCV 的更多细节可以在[在线文档][14]中找到。

感谢阅读。

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-opencv-on-fedora-linux-part-1/

作者：[Onuralp SEZER][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/thunderbirdtr/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2021/08/starry-night-1-816x345.jpg
[2]: https://commons.wikimedia.org/wiki/File:Van_Gogh_-_Starry_Night_-_Google_Art_Project.jpg
[3]: https://en.wikipedia.org/wiki/Computer_vision
[4]: https://en.wikipedia.org/wiki/OpenCV
[5]: https://opencv.org/about/
[6]: https://fedoramagazine.org/jupyter-and-data-science-in-fedora/
[7]: https://fedoramagazine.org/wp-content/uploads/2021/06/image.png
[8]: https://fedoramagazine.org/wp-content/uploads/2021/06/image-1.png
[9]: https://fedoramagazine.org/wp-content/uploads/2021/06/image-2.png
[10]: https://fedoramagazine.org/wp-content/uploads/2021/06/image-3.png
[11]: https://fedoramagazine.org/wp-content/uploads/2021/06/image-4.png
[12]: https://fedoramagazine.org/wp-content/uploads/2021/06/image-5.png
[13]: https://fedoramagazine.org/wp-content/uploads/2021/06/image-7.png
[14]: https://docs.opencv.org/4.5.2/index.html
