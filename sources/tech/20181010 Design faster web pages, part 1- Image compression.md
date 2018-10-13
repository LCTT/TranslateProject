Translating by StdioA

Design faster web pages, part 1: Image compression
======

![](https://fedoramagazine.org/wp-content/uploads/2018/02/fasterwebsites1-816x345.jpg)

Lots of web developers want to achieve fast loading web pages. As more page views come from mobile devices, making websites look better on smaller screens using responsive design is just one side of the coin. Browser Calories can make the difference in loading times, which satisfies not just the user but search engines that rank on loading speed. This article series covers how to slim down your web pages with tools Fedora offers.

### Preparation

Before you sart to slim down your web pages, you need to identify the core issues. For this, you can use [Browserdiet][1]. It’s a browser add-on available for Firefox, Opera and Chrome and other browsers. It analyzes the performance values of the actual open web page, so you know where to start slimming down.

Next you’ll need some pages to work on. The example screenshot shows a test of [getfedora.org][2]. At first it looks very simple and responsive.

![Browser Diet - values of getfedora.org][3]

However, BrowserDiet’s page analysis shows there are 1.8MB in files downloaded. Therefore, there’s some work to do!

### Web optimization

There are over 281 KB of JavaScript files, 203 KB more in CSS files, and 1.2 MB in images. Start with the biggest issue — the images. The tool set you need for this is GIMP, ImageMagick, and optipng. You can easily install them using the following command:

```
sudo dnf install gimp imagemagick optipng

```

For example, take the [following file][4] which is 6.4 KB:

![][4]

First, use the file command to get some basic information about this image:

```
$ file cinnamon.png
cinnamon.png: PNG image data, 60 x 60, 8-bit/color RGBA, non-interlaced

```

The image — which is only in grey and white — is saved in 8-bit/color RGBA mode. That’s not as efficient as it could be.

Start GIMP so you can set a more appropriate color mode. Open cinnamon.png in GIMP. Then go to Image>Mode and set it to greyscale. Export the image as PNG with compression factor 9. All other settings in the export dialog should be the default.

```
$ file cinnamon.png
cinnamon.png: PNG image data, 60 x 60, 8-bit gray+alpha, non-interlaced

```

The output shows the file’s now in 8bit gray+alpha mode. The file size has shrunk from 6.4 KB to 2.8 KB. That’s already only 43.75% of the original size. But there’s more you can do!

You can also use the ImageMagick tool identify to provide more information about the image.

```
$ identify cinnamon2.png
cinnamon.png PNG 60x60 60x60+0+0 8-bit Grayscale Gray 2831B 0.000u 0:00.000

```

This tells you the file is 2831 bytes. Jump back into GIMP, and export the file. In the export dialog disable the storing of the time stamp and the alpha channel color values to reduce this a little more. Now the file output shows:

```
$ identify cinnamon.png
cinnamon.png PNG 60x60 60x60+0+0 8-bit Grayscale Gray 2798B 0.000u 0:00.000

```

Next, use optipng to losslessly optimize your PNG images. There are other tools that do similar things, including **advdef** (which is part of advancecomp), **pngquant** and **pngcrush.**

Run optipng on your file. Note that this will replace your original:

```
$ optipng -o7 cinnamon.png
** Processing: cinnamon.png
60x60 pixels, 2x8 bits/pixel, grayscale+alpha
Reducing image to 8 bits/pixel, grayscale
Input IDAT size = 2720 bytes
Input file size = 2812 bytes

Trying:
 zc = 9 zm = 8 zs = 0 f = 0 IDAT size = 1922
 zc = 9 zm = 8 zs = 1 f = 0 IDAT size = 1920

Selecting parameters:
 zc = 9 zm = 8 zs = 1 f = 0 IDAT size = 1920

Output IDAT size = 1920 bytes (800 bytes decrease)
Output file size = 2012 bytes (800 bytes = 28.45% decrease)

```

The option -o7 is the slowest to process, but provides the best end results. You’ve knocked 800 more bytes off the file size, which is now 2012 bytes.

To resize all of the PNGs in a directory, use this command:

```
$ optipng -o7 -dir=<directory> *.png

```

The option -dir lets you give a target directory for the output. If this option is not used, optipng would overwrite the original images.

### Choosing the right file format

When it comes to pictures for the usage in the internet, you have the choice between:


+ [JPG or JPEG][9]
+ [GIF][10]
+ [PNG][11]
+ [aPNG][12]
+ [JPG-LS][13]
+ [JPG 2000 or JP2][14]
+ [SVG][15]


JPG-LS and JPG 2000 are not widely used. Only a few digital cameras support these formats, so they can be ignored. aPNG is an animated PNG, and not widely used either.

You could save a few bytes more through changing the compression rate or choosing another file format. The first option you can’t do in GIMP, as it’s already using the highest compression rate. As there are no [alpha channels][5] in the picture, you can choose JPG as file format instead. For now use the default value of 90% quality — you could change it down to 85%, but then alias effects become visible. This saves a few bytes more:

```
$ identify cinnamon.jpg
cinnamon.jpg JPEG 60x60 60x60+0+0 8-bit sRGB 2676B 0.000u 0:00.000

```

Alone this conversion to the right color space and choosing JPG as file format brought down the file size from 23 KB to 12.3 KB, a reduction of nearly 50%.


#### PNG vs. JPG: quality and compression rate

So what about the rest of the images? This method would work for all the other pictures, except the Fedora “flavor” logos and the logos for the four foundations. Those are presented on a white background.

One of the main differences between PNG and JPG is that JPG has no alpha channel. Therefore it can’t handle transparency. If you rework these images by using a JPG on a white background, you can reduce the file size from 40.7 KB to 28.3 KB.

Now there are four more images you can rework: the backgrounds. For the grey background, set the mode to greyscale again. With this bigger picture, the savings also is bigger. It shrinks from 216.2 KB to 51.0 KB — it’s now barely 25% of its original size. All in all, you’ve shrunk 481.1 KB down to 191.5 KB — only 39.8% of the starting size.

#### Quality vs. Quantity

Another difference between PNG and JPG is the quality. PNG is a lossless compressed raster graphics format. But JPG loses size through compression, and thus affects quality. That doesn’t mean you shouldn’t use JPG, though. But you have to find a balance between file size and quality.

### Achievement

This is the end of Part 1. After following the techniques described above, here are the results:

![][6]

You brought image size down to 488.9 KB versus 1.2MB at the start. That’s only about a third of the size, just through optimizing with optipng. This page can probably be made to load faster still. On the scale from snail to hypersonic, it’s not reached racing car speed yet!

Finally you can check the results in [Google Insights][7], for example:

![][8]

In the Mobile area the page gathered 10 points on scoring, but is still in the Medium sector. It looks totally different for the Desktop, which has gone from 62/100 to 91/100 and went up to Good. As mentioned before, this test isn’t the be all and end all. Consider scores such as these to help you go in the right direction. Keep in mind you’re optimizing for the user experience, and not for a search engine.


--------------------------------------------------------------------------------

via: https://fedoramagazine.org/design-faster-web-pages-part-1-image-compression/

作者：[Sirko Kemter][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/gnokii/
[b]: https://github.com/lujun9972
[1]: https://browserdiet.com/calories/
[2]: http://getfedora.org
[3]: https://fedoramagazine.org/wp-content/uploads/2018/02/ff-addon-diet.jpg
[4]: https://getfedora.org/static/images/cinnamon.png
[5]: https://www.webopedia.com/TERM/A/alpha_channel.html
[6]: https://fedoramagazine.org/wp-content/uploads/2018/02/ff-addon-diet-i.jpg
[7]: https://developers.google.com/speed/pagespeed/insights/?url=getfedora.org&tab=mobile
[8]: https://fedoramagazine.org/wp-content/uploads/2018/02/PageSpeed_Insights.png
[9]: https://en.wikipedia.org/wiki/JPEG
[10]: https://en.wikipedia.org/wiki/GIF
[11]: https://en.wikipedia.org/wiki/Portable_Network_Graphics
[12]: https://en.wikipedia.org/wiki/APNG
[13]: https://en.wikipedia.org/wiki/JPEG_2000
[14]: https://en.wikipedia.org/wiki/JPEG_2000
[15]: https://en.wikipedia.org/wiki/Scalable_Vector_Graphics
