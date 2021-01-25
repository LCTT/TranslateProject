[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: (wxy)
[#]: publisher: (wxy)
[#]: url: (https://linux.cn/article-13003-1.html)
[#]: subject: (Resize images using Python)
[#]: via: (https://opensource.com/life/15/2/resize-images-python)
[#]: author: (Dayo Ntwari https://opensource.com/users/dayontwari)

使用 Python 调整图像大小
======

> 快速解释如何在 Python 中调整图像大小，同时保持相同的长宽比。

![Python in a tree][1]

我喜欢 [Python][2]，而且我已经学了一段时间了。前段时间，我写了一个 Python 脚本，在这个脚本中，我需要调整一堆图片的大小，同时保持长宽比（比例）不变。于是我四处寻找，发现了 [Pillow][3]，这是一个 Python 图像库，也是一个叫做 PIL 的旧库的“友好复刻”。 

要安装 Pillow，请使用 Python 的 `pip` 模块：

```
$ python3 -m pip install Pillow
```

### 按宽度缩放

这是一个使用 Pillow 模块来调整图片大小的基本脚本：

```
from PIL import Image

basewidth = 300
img = Image.open('fullsized_image.jpg')
wpercent = (basewidth / float(img.size[0]))
hsize = int((float(img.size[1]) * float(wpercent)))
img = img.resize((basewidth, hsize), Image.ANTIALIAS)
img.save('resized_image.jpg')
```

这几行 Python 代码使用 Pillow 将一张图片 （`fullsized_image.jpg`） 调整为 300 像素的宽度，宽度在变量 `basewidth` 中设置，高度则与新的宽度成比例。比例高度的计算方法是：确定 300 像素占原宽度 （`img.size[0]`） 的百分比，然后将原高度（`img.size[1]`） 乘以该百分比。所得的高度值保存在变量 `hsize` 中。

如果你需要不同的图片宽度，你可以将 `basewidth` 改为任何其他数字。另外，请注意，因为我想保留全尺寸的图片 （`fullsized_image.jpg`），因此我将调整后的图片以一个不同的名称 `resized_image.jpg` 保存。当然，你不必这么做。如果你想，你可以使用相同的文件名将调整后的图片覆盖全尺寸的图片。

### 按高度缩放

如果高度是固定的，而宽度是按比例变化的，那也基本差不多，你只需要把东西换一下：

```
from PIL import Image

baseheight = 560
img = Image.open('fullsized_image.jpg')
hpercent = (baseheight / float(img.size[1]))
wsize = int((float(img.size[0]) * float(hpercent)))
img = img.resize((wsize, baseheight), Image.ANTIALIAS)
img.save('resized_image.jpg')
```

注意 `basewidth` 现在换成了 `baseheight`，因为高度是固定的。在第三行中，我们在计算高度百分比，所以我们需要 `img.size[1]` 而不是 `img.size[0]`。`size` 属性是一个元组，包含宽度和高度，单位是像素，`size[0]` 指的是第一个元组元素，也就是宽度，`size[1]` 是第二个元素，也就是高度。第 4 行也有这样的切换，`size[0]` 代表宽度，`size[1]` 代表高度。


--------------------------------------------------------------------------------

via: https://opensource.com/life/15/2/resize-images-python

作者：[Dayo Ntwari][a]
选题：[lujun9972][b]
译者：[geekpi](https://github.com/geekpi)
校对：[wxy](https://github.com/wxy)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dayontwari
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-python.jpg?itok=F2PYP2wT (Python in a tree)
[2]: http://python.org/ (Python Programming Language – Official Website)
[3]: https://pypi.org/project/Pillow/ (Python Imaging Library)
[4]: https://dayontwari.wordpress.com/2015/01/06/how-to-resize-images-with-python/
