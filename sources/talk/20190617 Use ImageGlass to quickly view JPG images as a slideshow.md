[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Use ImageGlass to quickly view JPG images as a slideshow)
[#]: via: (https://opensource.com/article/19/6/use-imageglass-view-jpg-images-slideshow-windows-10)
[#]: author: (Jeff Macharyas https://opensource.com/users/jeffmacharyas)

Use ImageGlass to quickly view JPG images as a slideshow
======
Want to view images from a folder one-by-one in a slideshow on Windows
10? Open source to the rescue.
![Looking back with binoculars][1]

Welcome to today’s episode of "How Can I Make This Work?" In my case, I was trying to view a folder of JPG images as a slideshow on Windows 10. As often happens, I turned to open source to solve the issue.

On a Mac, viewing a folder of JPG images as a slideshow is a simple matter of selecting all the images in a folder ( **Command-A** ), and then pressing **Option-Command-Y**. From there, you can advance the images with the arrow key. Of course, you can do a similar thing on Windows by selecting the first image, then clicking on the window frame's yellow **Manage** bar, then selecting **Slide Show**. There, you can control the speed, but only to a point: slow, medium, and fast.

I wanted to advance the images in Windows the same way I do it on a Mac. Naturally, I fired up the Googler and searched for a solution. There, I found the [ImageGlass][2] open source app, [licensed GPL 3.0][3], and it did the trick perfectly. Here's what it looks like:

![Viewing an image in ImageGlass.][4]

### About ImageGlass

ImageGlass was developed by Dương Diệu Pháp, a Vietnamese developer who works on the front end for Chainstack, according to his website. He collaborates with US-based [Kevin Routley][5], who "develops new features for ImageGlass." The source code is available on [GitHub][6].

ImageGlass supports most common image formats, including JPG, GIF, PNG, WEBP, SVG, and RAW. Users can customize this extension list easily.

My specific problem was needing to find an image for a catalog cover. Unfortunately, it was in a folder containing dozens of photos. Navigating through the slideshow in ImageGlass, stopping on the image I wanted, and downloading it into my project folder turned out to be easy. Open source to the rescue yet again, and the app took only seconds to download and use.

ImageGlass was featured as a Picasa alternative in Jason Baker’s article [9 open source alternatives to][7] [Picasa][7] from March 10, 2016. There are some other interesting image-related open source tools in there as well if you are in need.

--------------------------------------------------------------------------------

via: https://opensource.com/article/19/6/use-imageglass-view-jpg-images-slideshow-windows-10

作者：[Jeff Macharyas][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jeffmacharyas
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/look-binoculars-sight-see-review.png?itok=NOw2cm39 (Looking back with binoculars)
[2]: https://imageglass.org/
[3]: https://github.com/d2phap/ImageGlass/blob/master/LICENSE
[4]: https://opensource.com/sites/default/files/uploads/imageglass-screenshot.png (Viewing an image in ImageGlass.)
[5]: https://github.com/fire-eggs
[6]: https://github.com/d2phap/ImageGlass
[7]: https://opensource.com/alternatives/picasa
