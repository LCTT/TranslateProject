[#]: subject: (Use OpenCV on Fedora Linux ‒ part 1)
[#]: via: (https://fedoramagazine.org/use-opencv-on-fedora-linux-part-1/)
[#]: author: (Onuralp SEZER https://fedoramagazine.org/author/thunderbirdtr/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Use OpenCV on Fedora Linux ‒ part 1
======

![][1]

Cover image excerpted from Starry Night by [Vincent van Gogh][2], Public domain, via Wikimedia Commons

The technology world changes daily and the demands for computer vision, artificial intelligence, and machine learning are increasing. The technology that allows computers and mobile phones to see their surroundings is called [computer vision][3]. Work on re-creating a human eye started in the 50s. Since then, computer vision technology has come a long way. Computer vision has already made its way to our mobile phones via different applications. This article will introduce [OpenCV][4] on Fedora Linux.

### **What is OpenCV?**

> OpenCV (Open Source Computer Vision Library) is an open-source computer vision and machine learning software library. OpenCV was built to provide a common infrastructure for computer vision applications and to accelerate the use of machine perception in the commercial products. It has more than 2500 optimized algorithms, which includes a comprehensive set of both classic and state-of-the-art computer vision and machine learning algorithms. These algorithms can be used to detect and recognize faces, identify objects, classify human actions in videos and establish markers to overlay it with augmented reality and much more.
>
> [opencv.org – about][5]

### Install OpenCV on Fedora Linux

To get started with OpenCV, install it from the Fedora Linux repositories.

```
$ sudo dnf install opencv opencv-contrib opencv-doc python3-opencv python3-matplotlib python3-numpy
```

**Note:** On Fedora Silverblue or CoreOs, Python 3.9 is part of the core commit. Layer OpenCV and required tools with: _rpm-ostree install opencv opencv-doc python3-opencv python3-matplotlib python3-numpy_.

Next, enter the following commands in a terminal to verify that OpenCV is installed (user input shown in bold).

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

The current OpenCV version should be displayed when you enter the _print_ command as shown above. This indicates that OpenCV and the Python-OpenCV libraries have been installed successfully.

Additionally, if you want to take notes and write code with Jupyter Notebook and learn more about data science tools, check out the earlier Fedora Magazine article: [_Jupyter and Data Science in Fedora_][6].

### Get started with OpenCV

After installation is complete, load a sample image using Python and the OpenCV libraries (press the **S** key to save a copy of the image in _png_ format and finish the program):

```
$ cp /usr/share/opencv4/samples/data/starry_night.jpg .
$ python starry_night.py
```

Contents of _starry_night.py_:

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

Gray-scale the image by adding the parameter **0** to the _cv.imread_ function as shown below.

```
img = cv.imread(cv.samples.findFile("starry_night.jpg"),0)
```

![][8]

These are some alternative values that can be used for the second parameter of the _cv.imread_ function.

  * **cv2.IMREAD_GRAYSCALE** or **0:** Load the image in grayscale mode.
  * **cv2.IMREAD_COLOR** or **1:** Load the image in color mode. Any transparency in the image will be removed. This is the default.
  * **cv2.IMREAD_UNCHANGED** or **-1:** Load the image unaltered; including alpha channel.



#### Display image attributes using OpenCV

Image attributes include the number of rows, columns, and channels; the type of image data; the number of pixels; etc. Suppose you wanted to access the image’s shape and its datatype. This is how you would do it:

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

  * **img.shape:** return a tuple of the number of rows, columns, and channels (if it is a color image)
  * **img.dtype:** return the datatype of the image



Next display image with Matplotlib:

```
import cv2 as cv
import matplotlib.pyplot as plt
img = cv.imread(cv.samples.findFile("starry_night.jpg"),0)
plt.imshow(img)
plt.show()
```

![][9]

#### What happened?

The image was read in as a gray-scale image, however it won’t necessarily display in gray-scale when using Matplotlib’s _imshow_ fucntion. This is because the _imshow_ function uses a different color map by default. To specify that a gray-scale color map should be used, set the second parameter of the _imshow_ function to _cmap=’gray’_ as shown below.

```
plt.imshow(img,cmap='gray')
```

![][10]

This problem is also going to happen when opening a picture in color mode because Matplotlib expects the image in RGB (red, green, blue) format whereas OpenCV stores images in BGR (blue, green, red) format. For correct display, you need to reverse the channels of the BGR image.

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

#### Splitting and merging color channels

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

  * **cv2.split:** Divide a multi-channel array into several single-channel arrays.
  * **cv2.merge:** Merge several arrays to make a single multi-channel array. All the input matrices must have the same size.



**Note:** Images with more white have a higher density of color. Contrarily, images with more black have a lower density of color. In the above example the red color has the lowest density.

#### Converting to different color spaces

The _cv2.cvtColor_ function converts an input image from one color space to another. When transforming between the RGB and BGR color spaces, the order of the channels should be specified explicitly (_RGB2BGR_ or _BGR2RGB_). **Note that the default color format in OpenCV is often referred to as RGB but it is actually BGR (the bytes are reversed).** So the first byte in a standard (24-bit) color image will be an 8-bit blue component, the second byte will be green, and the third byte will be red. The fourth, fifth, and sixth bytes would then be the second pixel (blue, then green, then red), and so on.

```
import cv2 as cv
import matplotlib.pyplot as plt
img = cv.imread(cv.samples.findFile("starry_night.jpg"),cv.IMREAD_COLOR)
img_rgb = cv.cvtColor(img, cv.COLOR_BGR2RGB)
plt.imshow(img_rgb)
plt.show()
```

![][13]

### Further information

More details on OpenCV are available in the [online documentation][14].

Thank you.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/use-opencv-on-fedora-linux-part-1/

作者：[Onuralp SEZER][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

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
