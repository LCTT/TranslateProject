How to add fonts to Fedora
===================

![](https://fedoramagazine.org/wp-content/uploads/2017/11/install-fonts-1024x433.jpg)

Fonts help you express your thoughts in creative ways through design. Whether you’re captioning an image, building a presentation, or designing a greeting or advertisement, fonts can boost your idea to the next level. It’s easy to fall in love with them just for their own aesthetic qualities. Fortunately, Fedora makes installation easy. Here’s how to do it.

### System-wide installation

If you install a font system-wide, it becomes available to all users. The best way to take advantage of this method is by using RPM packages from the official software repositories.

To get started, open the  _Software_  tool in your Fedora Workstation, or other tool that uses the official repositories. Choose the  _Add-ons_  category in the group of banners shown. Then in the add-on categories, select  _Fonts._  You’ll see a list of available fonts similar to this screenshot:

 [![](https://fedoramagazine.org/wp-content/uploads/2017/11/Software-fonts-1024x768.png)][1] 

When you select a font, some details appear. Depending on several conditions, you may be able to preview how the font looks with some example text. Select the  _Install_ button to add it to your system. It may take a few moments for the process to complete, based on your system speed and network bandwidth.

You can also remove previously installed font packages, shown with a check mark, with the  _Remove_  button shown in the font details.

### Personal installation

This method works better if you have a font you’ve downloaded in a compatible format:  _.ttf_ ,  _otf_ ,  _.ttc_ ,  _.pfa_ ,  _.pfb_  or . _pcf._  These font extensions shouldn’t be installed system-wide by dropping them into a system folder. Non-packaged fonts of this type can’t be updated automatically. They also can potentially interfere with some software operations later. The best way to install these fonts is in your own personal data directory.

Open the  _Files_  application in your Fedora Workstation, or a similar file manager app of your choice. If you’re using  _Files_ , you may need to use the  _Ctrl+H_  key combination to show hidden files and folders. Look for the  _.fonts_  folder and open it. If you don’t have a  _.fonts_  folder, create it. (Remember the leading dot and to use all lowercase.)

Copy the font file you’ve downloaded to your  _.fonts_  folder. You can close the file manager at this point. Open a terminal and type the following command:

```
fc-cache
```

This will rebuild font caches that help Fedora locate and reference the fonts it can use. You may also need to restart an application such as Inkscape or LibreOffice in which you want to use the new font. Once you restart, the new font should be available.

* * *

Photo by [Raphael Schaller][2] on [Unsplash][3].

--------------------------------------------------------------------------------

作者简介:

Paul W. Frields
Paul W. Frields has been a Linux user and enthusiast since 1997, and joined the Fedora Project in 2003, shortly after launch. He was a founding member of the Fedora Project Board, and has worked on documentation, website publishing, advocacy, toolchain development, and maintaining software. He joined Red Hat as Fedora Project Leader from February 2008 to July 2010, and remains with Red Hat as an engineering manager. He currently lives with his wife and two children in Virginia.

-----------------------------

via: https://fedoramagazine.org/add-fonts-fedora/

作者：[ Paul W. Frields ][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://fedoramagazine.org/author/pfrields/
[1]:https://fedoramagazine.org/wp-content/uploads/2017/11/Software-fonts.png
[2]:https://unsplash.com/photos/GkinCd2enIY?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
[3]:https://unsplash.com/search/photos/fonts?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText
