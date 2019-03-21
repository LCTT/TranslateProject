[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (10 Python image manipulation tools)
[#]: via: (https://opensource.com/article/19/3/python-image-manipulation-tools)
[#]: author: (Parul Pandey https://opensource.com/users/parul-pandey)

10 Python image manipulation tools
======

These Python libraries provide an easy and intuitive way to transform images and make sense of the underlying data.

![][1]

Today's world is full of data, and images form a significant part of this data. However, before they can be used, these digital images must be processed—analyzed and manipulated in order to improve their quality or extract some information that can be put to use.

Common image processing tasks include displays; basic manipulations like cropping, flipping, rotating, etc.; image segmentation, classification, and feature extractions; image restoration; and image recognition. Python is an excellent choice for these types of image processing tasks due to its growing popularity as a scientific programming language and the free availability of many state-of-the-art image processing tools in its ecosystem.

This article looks at 10 of the most commonly used Python libraries for image manipulation tasks. These libraries provide an easy and intuitive way to transform images and make sense of the underlying data.

### 1\. scikit-image

**[**scikit** -image][2]** is an open source Python package that works with [NumPy][3] arrays. It implements algorithms and utilities for use in research, education, and industry applications. It is a fairly simple and straightforward library, even for those who are new to Python's ecosystem. The code is high-quality, peer-reviewed, and written by an active community of volunteers.

#### Resources

scikit-image is very well [documented][4] with a lot of examples and practical use cases.

#### Usage

The package is imported as **skimage** , and most functions are found within the submodules.

Image filtering:

```
import matplotlib.pyplot as plt
%matplotlib inline

from skimage import data,filters

image = data.coins() # ... or any other NumPy array!
edges = filters.sobel(image)
plt.imshow(edges, cmap='gray')
```

![Image filtering in scikit-image][6]

Template matching using the [match_template][7] function:

![Template matching in scikit-image][9]

You can find more examples in the [gallery][10].

### 2\. NumPy

[**NumPy**][11] is one of the core libraries in Python programming and provides support for arrays. An image is essentially a standard NumPy array containing pixels of data points. Therefore, by using basic NumPy operations, such as slicing, masking, and fancy indexing, you can modify the pixel values of an image. The image can be loaded using **skimage** and displayed using Matplotlib.

#### Resources

A complete list of resources and documentation is available on NumPy's [official documentation page][11].

#### Usage

Using Numpy to mask an image:

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

### 3\. SciPy

**[SciPy][14]** is another of Python's core scientific modules (like NumPy) and can be used for basic image manipulation and processing tasks. In particular, the submodule [**scipy.ndimage**][15] (in SciPy v1.1.0) provides functions operating on n-dimensional NumPy arrays. The package currently includes functions for linear and non-linear filtering, binary morphology, B-spline interpolation, and object measurements.

#### Resources

For a complete list of functions provided by the **scipy.ndimage** package, refer to the [documentation][16].

#### Usage

Using SciPy for blurring using a [Gaussian filter][17]:
```
from scipy import misc,ndimage

face = misc.face()
blurred_face = ndimage.gaussian_filter(face, sigma=3)
very_blurred = ndimage.gaussian_filter(face, sigma=5)

#Results
plt.imshow(<image to be displayed>)
```

![Using a Gaussian filter in SciPy][19]

### 4\. PIL/Pillow

**PIL** (Python Imaging Library) is a free library for the Python programming language that adds support for opening, manipulating, and saving many different image file formats. However, its development has stagnated, with its last release in 2009. Fortunately, there is [**Pillow**][20], an actively developed fork of PIL, that is easier to install, runs on all major operating systems, and supports Python 3. The library contains basic image processing functionality, including point operations, filtering with a set of built-in convolution kernels, and color-space conversions.

#### Resources

The [documentation][21] has instructions for installation as well as examples covering every module of the library.

#### Usage

Enhancing an image in Pillow using ImageFilter:

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

[Image source code][24]

### 5\. OpenCV-Python

**OpenCV** (Open Source Computer Vision Library) is one of the most widely used libraries for computer vision applications. [**OpenCV-Python**][25] is the Python API for OpenCV. OpenCV-Python is not only fast, since the background consists of code written in C/C++, but it is also easy to code and deploy (due to the Python wrapper in the foreground). This makes it a great choice to perform computationally intensive computer vision programs.

#### Resources

The [OpenCV2-Python-Guide][26] makes it easy to get started with OpenCV-Python.

#### Usage

Using _Image Blending using Pyramids_ in OpenCV-Python to create an "Orapple":


![Image blending using Pyramids in OpenCV-Python][28]

[Image source code][29]

### 6\. SimpleCV

[**SimpleCV**][30] is another open source framework for building computer vision applications. It offers access to several high-powered computer vision libraries such as OpenCV, but without having to know about bit depths, file formats, color spaces, etc. Its learning curve is substantially smaller than OpenCV's, and (as its tagline says), "it's computer vision made easy." Some points in favor of SimpleCV are:

  * Even beginning programmers can write simple machine vision tests
  * Cameras, video files, images, and video streams are all interoperable



#### Resources

The official [documentation][31] is very easy to follow and has tons of examples and use cases to follow.

#### Usage

### [7-_simplecv.png][32]

![SimpleCV][33]

### 7\. Mahotas

**[Mahotas][34]** is another computer vision and image processing library for Python. It contains traditional image processing functions such as filtering and morphological operations, as well as more modern computer vision functions for feature computation, including interest point detection and local descriptors. The interface is in Python, which is appropriate for fast development, but the algorithms are implemented in C++ and tuned for speed. Mahotas' library is fast with minimalistic code and even minimum dependencies. Read its [official paper][35] for more insights.

#### Resources

The [documentation][36] contains installation instructions, examples, and even some tutorials to help you get started using Mahotas easily.

#### Usage

The Mahotas library relies on simple code to get things done. For example, it does a good job with the [Finding Wally][37] problem with a minimum amount of code.

Solving the Finding Wally problem:

![Finding Wally problem in Mahotas][39]

[Image source code][40]

![Finding Wally problem in Mahotas][42]

[Image source code][40]

### 8\. SimpleITK

[**ITK**][43] (Insight Segmentation and Registration Toolkit) is an "open source, cross-platform system that provides developers with an extensive suite of software tools for image analysis. **[SimpleITK][44]** is a simplified layer built on top of ITK, intended to facilitate its use in rapid prototyping, education, [and] interpreted languages." It's also an image analysis toolkit with a [large number of components][45] supporting general filtering operations, image segmentation, and registration. SimpleITK is written in C++, but it's available for a large number of programming languages including Python.

#### Resources

There are a large number of [Jupyter Notebooks][46] illustrating the use of SimpleITK for educational and research activities. The notebooks demonstrate using SimpleITK for interactive image analysis using the Python and R programming languages.

#### Usage

Visualization of a rigid CT/MR registration process created with SimpleITK and Python:

![SimpleITK animation][48]

[Image source code][49]

### 9\. pgmagick

[**pgmagick**][50] is a Python-based wrapper for the GraphicsMagick library. The [**GraphicsMagick**][51] image processing system is sometimes called the Swiss Army Knife of image processing. Its robust and efficient collection of tools and libraries supports reading, writing, and manipulating images in over 88 major formats including DPX, GIF, JPEG, JPEG-2000, PNG, PDF, PNM, and TIFF.

#### Resources

pgmagick's [GitHub repository][52] has installation instructions and requirements. There is also a detailed [user guide][53].

#### Usage

Image scaling:

![Image scaling in pgmagick][55]

[Image source code][56]

Edge extraction:

![Edge extraction in pgmagick][58]

[Image source code][59]

### 10\. Pycairo

[**Pycairo**][60] is a set of Python bindings for the [Cairo][61] graphics library. Cairo is a 2D graphics library for drawing vector graphics. Vector graphics are interesting because they don't lose clarity when resized or transformed. Pycairo can call Cairo commands from Python.

#### Resources

The Pycairo [GitHub repository][62] is a good resource with detailed instructions on installation and usage. There is also a [getting started guide][63], which has a brief tutorial on Pycairo.

#### Usage

Drawing lines, basic shapes, and radial gradients with Pycairo:

![Pycairo][65]

[Image source code][66]

### Conclusion

These are some of the useful and freely available image processing libraries in Python. Some are well known and others may be new to you. Try them out to get to know more about them!

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/3/python-image-manipulation-tools

作者：[Parul Pandey][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/parul-pandey
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/daisy_gimp_art_design.jpg?itok=6kCxAKWO
[2]: https://scikit-image.org/
[3]: http://docs.scipy.org/doc/numpy/reference/index.html#module-numpy
[4]: http://scikit-image.org/docs/stable/user_guide.html
[5]: /file/426206
[6]: https://opensource.com/sites/default/files/uploads/1-scikit-image.png (Image filtering in scikit-image)
[7]: http://scikit-image.org/docs/dev/auto_examples/features_detection/plot_template.html#sphx-glr-auto-examples-features-detection-plot-template-py
[8]: /file/426211
[9]: https://opensource.com/sites/default/files/uploads/2-scikit-image.png (Template matching in scikit-image)
[10]: https://scikit-image.org/docs/dev/auto_examples
[11]: http://www.numpy.org/
[12]: /file/426216
[13]: https://opensource.com/sites/default/files/uploads/3-numpy.png (NumPy)
[14]: https://www.scipy.org/
[15]: https://docs.scipy.org/doc/scipy/reference/ndimage.html#module-scipy.ndimage
[16]: https://docs.scipy.org/doc/scipy/reference/tutorial/ndimage.html#correlation-and-convolution
[17]: https://docs.scipy.org/doc/scipy/reference/generated/scipy.ndimage.gaussian_filter.html
[18]: /file/426221
[19]: https://opensource.com/sites/default/files/uploads/4-scipy.png (Using a Gaussian filter in SciPy)
[20]: https://python-pillow.org/
[21]: https://pillow.readthedocs.io/en/3.1.x/index.html
[22]: /file/426226
[23]: https://opensource.com/sites/default/files/uploads/5-pillow.png (Enhancing an image in Pillow using ImageFilter)
[24]: http://sipi.usc.edu/database/
[25]: https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_setup/py_intro/py_intro.html
[26]: https://github.com/abidrahmank/OpenCV2-Python-Tutorials
[27]: /file/426236
[28]: https://opensource.com/sites/default/files/uploads/6-opencv.jpeg (Image blending using Pyramids in OpenCV-Python)
[29]: https://opencv-python-tutroals.readthedocs.io/en/latest/py_tutorials/py_imgproc/py_pyramids/py_pyramids.html#pyramids
[30]: http://simplecv.org/
[31]: http://examples.simplecv.org/en/latest/
[32]: /file/426241
[33]: https://opensource.com/sites/default/files/uploads/7-_simplecv.png (SimpleCV)
[34]: https://mahotas.readthedocs.io/en/latest/
[35]: https://openresearchsoftware.metajnl.com/articles/10.5334/jors.ac/
[36]: https://mahotas.readthedocs.io/en/latest/install.html
[37]: https://blog.clarifai.com/wheres-waldo-using-machine-learning-to-find-all-the-waldos
[38]: /file/426246
[39]: https://opensource.com/sites/default/files/uploads/8-mahotas.png (Finding Wally problem in Mahotas)
[40]: https://mahotas.readthedocs.io/en/latest/wally.html
[41]: /file/426251
[42]: https://opensource.com/sites/default/files/uploads/9-mahotas.png (Finding Wally problem in Mahotas)
[43]: https://itk.org/
[44]: http://www.simpleitk.org/
[45]: https://itk.org/ITK/resources/resources.html
[46]: http://insightsoftwareconsortium.github.io/SimpleITK-Notebooks/
[47]: /file/426256
[48]: https://opensource.com/sites/default/files/uploads/10-simpleitk.gif (SimpleITK animation)
[49]: https://github.com/InsightSoftwareConsortium/SimpleITK-Notebooks/blob/master/Utilities/intro_animation.py
[50]: https://pypi.org/project/pgmagick/
[51]: http://www.graphicsmagick.org/
[52]: https://github.com/hhatto/pgmagick
[53]: https://pgmagick.readthedocs.io/en/latest/
[54]: /file/426261
[55]: https://opensource.com/sites/default/files/uploads/11-pgmagick.png (Image scaling in pgmagick)
[56]: https://pgmagick.readthedocs.io/en/latest/cookbook.html#scaling-a-jpeg-image
[57]: /file/426266
[58]: https://opensource.com/sites/default/files/uploads/12-pgmagick.png (Edge extraction in pgmagick)
[59]: https://pgmagick.readthedocs.io/en/latest/cookbook.html#edge-extraction
[60]: https://pypi.org/project/pycairo/
[61]: https://cairographics.org/
[62]: https://github.com/pygobject/pycairo
[63]: https://pycairo.readthedocs.io/en/latest/tutorial.html
[64]: /file/426271
[65]: https://opensource.com/sites/default/files/uploads/13-pycairo.png (Pycairo)
[66]: http://zetcode.com/gfx/pycairo/basicdrawing/
