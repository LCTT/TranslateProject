[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Resize images using Python)
[#]: via: (https://opensource.com/life/15/2/resize-images-python)
[#]: author: (Dayo Ntwari https://opensource.com/users/dayontwari)

Resize images using Python
======
A quick explanation of how to resize images in Python while keeping the
same aspect ratio.
![Python in a tree][1]

I love [Python][2], and I've been learning it for a while now. Some time ago, I wrote a Python script where I needed to resize a bunch of images while at the same time keeping the aspect ratio (the proportions) intact. So I looked around and found [Pillow][3], a Python imaging library and "friendly fork" of an old library just called PIL. 

To install Pillow, use the `pip` module of Python:


```
`$ python3 -m pip install Pillow`
```

### Scaling by width

Here's a basic script to resize an image using the Pillow module:


```
from PIL import Image

basewidth = 300
img = Image.open('fullsized_image.jpg')
wpercent = (basewidth / float(img.size[0]))
hsize = int((float(img.size[1]) * float(wpercent)))
img = img.resize((basewidth, hsize), Image.ANTIALIAS)
img.save('resized_image.jpg')
```

These few lines of Python code resize an image (**fullsized_image.jpg**) using Pillow to a width of 300 pixels, which is set in the variable **basewidth** and a height proportional to the new width. The proportional height is calculated by determining what percentage 300 pixels is of the original width (**img.size[0]**) and then multiplying the original height (**img.size[1]**) by that percentage. The resulting height value is saved in the variable **hsize.**

You can change **basewidth** to any other number if you need a different width for your images. Also, notice I saved the resized image under a different name, **resized_image.jpg**, because I wanted to preserve the full-size image (**fullsized_image.jpg**) as well. You don't have to do this, of course. You can use the same filename to overwrite the full-size image with the resized image, if that is what you want.

### Scaling by height

If the height is fixed and the width proportionally variable, it's pretty much the same thing, you just need to switch things around a bit:


```
from PIL import Image

baseheight = 560
img = Image.open('fullsized_image.jpg')
hpercent = (baseheight / float(img.size[1]))
wsize = int((float(img.size[0]) * float(hpercent)))
img = img.resize((wsize, baseheight), Image.ANTIALIAS)
img.save('resized_image.jpg')
```

Notice **basewidth** is now **baseheight**, since height is fixed. In the third line, we are calculating the height percentage, so we need **img.size[1]** instead of **img.size[0]**. The size attribute is a tuple containing width and height in pixels; **size[0]** refers to the first tuple element, which is the width, and **size[1]** is the second element, which is height. Line 4 also has this switch between **size[0]** for width and **size[1]** for height.

_Originally published on Dayo Ntwari's [blog][4] and republished under Creative Commons with permission._

_This article was updated in January 2021 by the editor._

--------------------------------------------------------------------------------

via: https://opensource.com/life/15/2/resize-images-python

作者：[Dayo Ntwari][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/dayontwari
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/life-python.jpg?itok=F2PYP2wT (Python in a tree)
[2]: http://python.org/ (Python Programming Language – Official Website)
[3]: https://pypi.org/project/Pillow/ (Python Imaging Library)
[4]: https://dayontwari.wordpress.com/2015/01/06/how-to-resize-images-with-python/
