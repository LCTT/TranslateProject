Translating by GOLinux!
Linux FAQs with Answers--How to crop an image from the command line on Linux
================================================================================
> **Question**: I would like to get rid of white margins of an image file. Is there an easy way to crop an image file from the command line on Linux? 

When it comes to converting or editing images files on Linux, ImageMagick is undoubtedly one of the best known all-in-one image software. It boasts of a suite of command-line tools to display, convert, or manipulate more than 200 types of raster or vector image files, all from the command line. ImageMagick can be used for a variety of image editing tasks, such as converting file format, adding special effects, adding text, and transforming (resize, rotate, flip, crop) images.

If you want to crop an image to trim its margins, you can use two command-line utilities that come with ImageMagick. If you haven't installed ImageMagick, follow [this guideline][1] to install it.

In this tutorial, let's crop the following PNG image. We want to get rid of the right and bottom margins of the image, so that the chart will be centered.

![](https://farm8.staticflickr.com/7562/15688242319_ed19aca3a2_z.jpg)

First, identify the dimension (width and height) of the image file. You can use identify command for that.

     $ identify chart.png 

----------

    chart.png PNG 1500x1000 1500x1000+0+0 8-bit DirectClass 31.7KB 0.000u 0:00.000

As shown above, the input image is 1500x1000px.

Next, determine two things for image cropping: (1) the position at which the cropped image will start, and (2) the size of the cropped rectangle.

In this example, let's assume that the cropped image starts at top left corner, more specifically at x=20px and y=10px, and that the size of a cropped image will be 1200x700px.

The utility used to crop an image is convert. With "-crop" option, the convert command cuts out a rectangular region of an input image.

     $ convert chart.png -crop 1200x700+20+10 chart-cropped.png 

Given the input image chart.png, the convert command will store the cropped image as chart-cropped.png.

![](https://farm8.staticflickr.com/7527/15872271461_401276e072_z.jpg)

--------------------------------------------------------------------------------

via: http://ask.xmodulo.com/crop-image-command-line-linux.html

译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://ask.xmodulo.com/install-imagemagick-linux.html
