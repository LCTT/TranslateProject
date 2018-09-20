4 scanning tools for the Linux desktop
======
Go paperless by driving your scanner with one of these open source applications.

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-photo-camera-blue.png?itok=AsIMZ9ga)

While the paperless world isn't here quite yet, more and more people are getting rid of paper by scanning documents and photos. Having a scanner isn't enough to do the deed, though. You need software to drive that scanner.

But the catch is many scanner makers don't have Linux versions of the software they bundle with their devices. For the most part, that doesn't matter. Why? Because there are good scanning applications available for the Linux desktop. They work with a variety of scanners and do a good job.

Let's take a look at four simple but flexible open source Linux scanning tools. I've used each of these tools (and even wrote about three of them [back in 2014][1]) and found them very useful. You might, too.

### Simple Scan

One of my longtime favorites, [Simple Scan][2] is small, quick, efficient, and easy to use. If you've seen it before, that's because Simple Scan is the default scanner application on the GNOME desktop, as well as for a number of Linux distributions.

Scanning a document or photo takes one click. After scanning something, you can rotate or crop it and save it as an image (JPEG or PNG only) or as a PDF. That said, Simple Scan can be slow, even if you scan documents at lower resolutions. On top of that, Simple Scan uses a set of global defaults for scanning, like 150dpi for text and 300dpi for photos. You need to go into Simple Scan's preferences to change those settings.

If you've scanned something with more than a couple of pages, you can reorder the pages before you save. And if necessary—say you're submitting a signed form—you can email from within Simple Scan.

### Skanlite

In many ways, [Skanlite][3] is Simple Scan's cousin in the KDE world. Skanlite has few features, but it gets the job done nicely.

The software has options that you can configure, including automatically saving scanned files, setting the quality of the scan, and identifying where to save your scans. Skanlite can save to these image formats: JPEG, PNG, BMP, PPM, XBM, and XPM.

One nifty feature is the software's ability to save portions of what you've scanned to separate files. That comes in handy when, say, you want to excise someone or something from a photo.

### Gscan2pdf

Another old favorite, [gscan2pdf][4] might be showing its age, but it still packs a few more features than some of the other applications mentioned here. Even so, gscan2pdf is still comparatively light.

In addition to saving scans in various image formats (JPEG, PNG, and TIFF), gscan2pdf also saves them as PDF or [DjVu][5] files. You can set the scan's resolution, whether it's black and white or color, and paper size before you click the Scan button. That beats going into gscan2pdf's preferences every time you want to change any of those settings. You can also rotate, crop, and delete pages.

While none of those features are truly killer, they give you a bit more flexibility.

### GIMP

You probably know [GIMP][6] as an image-editing tool. But did you know you can use it to drive your scanner?

You'll need to install the [XSane][7] scanner software and the GIMP XSane plugin. Both of those should be available from your Linux distro's package manager. From there, select File > Create > Scanner/Camera. From there, click on your scanner and then the Scan button.

If that's not your cup of tea, or if it doesn't work, you can combine GIMP with a plugin called [QuiteInsane][8]. With either plugin, GIMP becomes a powerful scanning application that lets you set a number of options like whether to scan in color or black and white, the resolution of the scan, and whether or not to compress results. You can also use GIMP's tools to touch up or apply effects to your scans. This makes it great for scanning photos and art.

### Do they really just work?

All of this software works well for the most part and with a variety of hardware. I've used them with several multifunction printers that I've owned over the years—whether connecting using a USB cable or over wireless.

You might have noticed that I wrote "works well for the most part" in the previous paragraph. I did run into one exception: an inexpensive Canon multifunction printer. None of the software I used could detect it. I had to download and install Canon's Linux scanner software, which did work.

What's your favorite open source scanning tool for Linux? Share your pick by leaving a comment.

--------------------------------------------------------------------------------

via: https://opensource.com/article/18/9/linux-scanner-tools

作者：[Scott Nesbitt][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/scottnesbitt
[1]: https://opensource.com/life/14/8/3-tools-scanners-linux-desktop
[2]: https://gitlab.gnome.org/GNOME/simple-scan
[3]: https://www.kde.org/applications/graphics/skanlite/
[4]: http://gscan2pdf.sourceforge.net/
[5]: http://en.wikipedia.org/wiki/DjVu
[6]: http://www.gimp.org/
[7]: https://en.wikipedia.org/wiki/Scanner_Access_Now_Easy#XSane
[8]: http://sourceforge.net/projects/quiteinsane/
