How to stitch photos together on Linux
================================================================================
If you are an avid photographer, you will probably have several stunning panoramic photos in your portfolio. You don't have to be a professional photographer, nor need specialized equipment to create dramatic panoramic pictures. In fact, there are quite a few picture stitch apps (online or offline, desktop or mobile), which can easily create a panoramic view of a scene from two or more overlapping pictures.

In this tutorial, I will explain **how to stitch photos together on Linux**. For that, I am going to use panoramic photo stitching software called [Hugin][1].

Hugin is an open-source (GPLv2) free panorama photo stitching tool. It is available on multiple platforms including Linux, Windows, OS X, and FreeBSD. Being open-source freeware does not mean that Hugin won't match up to other commercial photo stitchers in terms of features and quality. On the contrary, Hugin is extremely powerful, capable of creating a 360-degree panoramic image, and featuring various advanced photometric corrections and optimizations.

### Install Hugin on Linux ###

To install Hugin on Debian, Ubuntu or Linux Mint:

    $ sudo apt-get install hugin

To install Hugin on Fedora:

    $ sudo yum install hugin

### Launch Hugin ###

Use hugin command to launch Hugin.

    $ hugin

The first thing to do is to load photos that you want to stitch together. For that, click on "Load images" button, and load (two or more) pictures to join. It should be obvious, but individual pictures need to be overlapping with each other.

[![](http://farm3.staticflickr.com/2884/11230363115_9aaaf5d8e4_z.jpg)][2]

### First Round of Photo Stitching ###

After loading pictures, click on "Align" button for the first round of stitching.

[![](http://farm8.staticflickr.com/7405/11230471403_4aab2dd708_z.jpg)][3]

Hugin will then run stitching assistant in a separate window, which analyzes common keypoints (or control points) between photos to combine the photos properly. After analysis is completed, you will see a panorama preview window, which will display panorama preview.

Switch back to the Hugin's main window. Under the "Align" button, you will see the status of photo stitching (i.e., number of control points, mean error). It will also say whether fit is good or bad.

[![](http://farm3.staticflickr.com/2838/11230471243_c59a6dd6cd_z.jpg)][4]

If it says "bad" or "really bad" fit, you can go ahead and fine-tune picture alignment as demonstrated below.

### Add or Remove Control Points ###

In the main Hugin window, go to "Control Points" tab. In this tab, Hugin shows which common control points are used to join multiple photos. It shows a pair of photos in left/right panels, and common key points between them are visualized with small boxes of the same color. You can remove any spurious points, or add new common points by hand. The more accurately matched points there are, the better quality stitching you will get. Also, if matched control points are well spread-out, they will be more helpful (than highly clustered control points).

[![](http://farm4.staticflickr.com/3706/11230392866_aeee95908d_z.jpg)][5]

Using the left/right arrow buttons located at the top-center, find a pair of photos which have least common control points. Given such a pair, try adding more common points by hand as follows.

Click one spot on a left-side photo, and then click on the corresponding identical spot on a right-side photo. Hugin will try to fine-tune the match automatically. Click on "Add" button at the bottom to add the matched pair. Repeat this process to add additional common points.

[![](http://farm4.staticflickr.com/3790/11230376534_4acfdf09c8_z.jpg)][6]

### Other Optimizations ###

You can also try re-optimization. Either click on "Re-optimize" button in the toolbar, or go to "Optimizer" tab to fine-tune the optimization. 

[![](http://farm4.staticflickr.com/3830/11230470413_05dbb778d0_z.jpg)][5]

Go back to "Assistant" tab in the main Hugin window, and click on "Align" button again to see if you get a better result.

If the combined panoramic view has a wavy horizon, you can straighten out the horizon. For that, click on "Preview panorama" button in the toolbar.

[![](http://farm8.staticflickr.com/7423/11230361845_afbb2e11ea_z.jpg)][6]

Then click on "Straighten" button in the Panorama preview window.

[![](http://farm4.staticflickr.com/3750/11230470463_2b4ef3dedf_z.jpg)][7]

Once you are satisfied with the stitch result, you can go ahead, and export it to an image file. For that, go to "Stitcher" tab in the Hugin's main window, and do the following.

Adjust canvas size, and amount of crop. Also, select output format (e.g., TIFF, JPEG, PNG). Finally, click on "Stitch!" button.

[![](http://farm3.staticflickr.com/2837/11230376234_2e46342a01_z.jpg)][8]

You will be asked to save a current project file (*.pto), and then specify output file name for the stitched photo.

It will take a couple of seconds to finalize photo stitch.

Here is the output of my experiment with Hugin. This is a beautiful panoramic view of luxury beach front in Cancun, Mexico. :-)

[![](http://www.flickr.com/photos/xmodulo/11230423496/)][9]

--------------------------------------------------------------------------------

via: http://xmodulo.com/2013/12/stitch-photos-together-linux.html

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

[1]:http://hugin.sourceforge.net/
[2]:http://www.flickr.com/photos/xmodulo/11230363115/
[3]:http://www.flickr.com/photos/xmodulo/11230471403/
[4]:http://www.flickr.com/photos/xmodulo/11230471243/
[5]:http://www.flickr.com/photos/xmodulo/11230392866/
[6]:http://www.flickr.com/photos/xmodulo/11230376534/
[7]:http://www.flickr.com/photos/xmodulo/11230470413/
[8]:http://www.flickr.com/photos/xmodulo/11230361845/
[9]:http://www.flickr.com/photos/xmodulo/11230470463/
[10]:http://www.flickr.com/photos/xmodulo/11230376234/
[11]:http://www.flickr.com/photos/xmodulo/11230423496/