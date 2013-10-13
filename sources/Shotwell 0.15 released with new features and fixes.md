		翻译中...............luox
Shotwell 0.15 released with new features and fixes
================================================================================
Ubuntu ships by default [Shotwell][1], handy image manager and basic editor permitting both image-gallery management and basic image editing, latter proving itself useful in numerous and numerous situations.

Shotwell has been [updated][2] to version 0.15, introducing new features and a significant amount of fixes and optimizations.

`Right-clicking on an image-->Open With-->Shotwell Photo Viewer`, pushes the image into Shotwell, where the user is able to edit the image with several options, among which Adjust.

Hitting the `Adjust` button, the user is to notice the newly-implemented Highlights entry, entry useful to on-demand tweak the level of `highlight`; for example, setting `Highlights` as low as possible, removes the light from the editing-in-progress image.

![](http://iloveubuntu.net/pictures_me/Shotwell%20015%20adjust.jpg)

Clicking on the bottom-bar's `Crop` button, summons a resizable dialog, permitting to the user to crop the image accordingly, dialog gaining in the 0.15 version **size-aware** capabilities.

Resizing the dialog, exposes in real-time the newly-acquired size, allowing the user to hassle-free observe the size of the about-to-be-cropped portion of the image; for example, in order to crop a piece of an image to 640x480, the user is now to adjust the cropping dialog to 640x480, handy ability adding clarity to the image editor.

![](http://iloveubuntu.net/pictures_me/Shotwell%20015%20resize%20values.jpg)

Moreover, Shotwell 0.15 comes with:

- usage of OAuth / OpenID for YouTube plugin
- strengthened re-import of video files
- optimized video thumbnailing
- numerous fixes

How do we **install** Shotwell 0.15?
Add the following **official** PPA (Ubuntu 12.10, Ubuntu 13.04)

    sudo add-apt-repository ppa:yorba/ppa
    sudo apt-get update
    sudo apt-get install shotwell

Shotwell 0.15 has already landed in Ubuntu 13.10 via the regular updates.

--------------------------------------------------------------------------------

via: http://iloveubuntu.net/shotwell-015-released-new-features-and-fixes

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](http://linux.cn/) 荣誉推出

译者：[译者ID](https://github.com/译者ID) 校对：[校对者ID](https://github.com/校对者ID)

[1]:http://www.yorba.org/projects/shotwell/
[2]:http://blog.yorba.org/eric/2013/10/shotwell-0-15-has-arrived.html
