3 open source alternatives to Adobe Lightroom
======

![](https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/camera-photography-film.jpg?itok=oe2ixyu6)

You wouldn't be wrong to wonder whether the smartphone, that modern jack-of-all-trades, is taking over photography. While that might be valid in the point-and-shoot camera market, there are a sizeable number of photography professionals and hobbyists who recognize that a camera that fits in your pocket can never replace a high-end DSLR camera and the depth, clarity, and realism of its photos.

All of that power comes with a small price in terms of convenience; like negatives from traditional film cameras, the [raw image][1] files produced by DSLRs must be processed before they can be edited or printed. For this, a digital image processing application is indispensable, and the go-to application has been Adobe Lightroom. But for many reasons—including its expensive, subscription-based pricing model and its proprietary license—there's a lot of interest in open source and other alternatives.

Lightroom has two main functions: processing raw image files and digital asset management (DAM)—organizing images with tags, ratings, and other metadata to make it easier to keep track of them.

In this article, we'll look at three open source image processing applications: Darktable, LightZone, and RawTherapee. All of them have DAM capabilities, but none has Lightroom's machine learning-based image categorization and tagging features. If you're looking for more information about open source DAM software, check out Terry Hancock's article "[Digital asset management for an open movie project][2]," where he shares his research on software to organize multimedia files for his [_Lunatics!_][3] open movie project.

### Darktable

![Darktable][4]

Like the other applications on our list, [darktable][5] processes raw images into usable file formats—it exports into JPEG, PNG, TIFF, PPM, PFM, and EXR, and it also supports Google and Facebook web albums, Flickr uploads, email attachments, and web gallery creation.

Its 61 image operation modules allow you to adjust contrast, tone, exposure, color, noise, etc.; add watermarks; crop and rotate; and much more. As with the other applications described in this article, those edits are "non-destructive"—that is, your original raw image is preserved no matter how many tweaks and modifications you make.

Darktable imports raw images from more than 400 cameras plus JPEG, CR2, DNG, OpenEXR, and PFM; images are managed in a database so you can filter and search using metadata including tags, ratings, and color. It's also available in 21 languages and is supported on Linux, MacOS, BSD, Solaris 11/GNOME, and Windows. (The [Windows port][6] is new, and darktable warns it may have "rough edges or missing functionality" compared to other versions.)

Darktable is licensed under [GPLv3][7]; you can learn more by perusing its [features][8], viewing the [user manual][9], or accessing its [source code][10] on GitHub.

### LightZone

![LightZone's tool stack][11]

As a non-destructive raw image processing tool, [LightZone][12] is similar to the other two applications on this list: it's cross-platform, operating on Windows, MacOS, and Linux, and it supports JPG and TIFF images in addition to raw. But it's also unique in several ways.

For one thing, it started out in 2005 as a proprietary image processing tool and later became an open source project under a BSD license. Also, before you can download the application, you must register for a free account; this is so the LightZone development community can track downloads and build the community. (Approval is quick and automated, so it's not a large barrier.)

Another difference is that image modifications are done using stackable tools, rather than filters (like most image-editing applications); tool stacks can be rearranged or removed, as well as saved and copied to a batch of images. You can also edit certain parts of an image using a vector-based tool or by selecting pixels based on color or brightness.

You can get more information on LightZone by searching its [forums][13] or accessing its [source code][14] on GitHub.

### RawTherapee

![RawTherapee][15]

[RawTherapee][16] is another popular open source ([GPL][17]) raw image processor worth your attention. Like darktable and LightZone, it is cross-platform (Windows, MacOS, and Linux) and implements edits in a non-destructive fashion, so you maintain access to your original raw image file no matter what filters or changes you make.

RawTherapee uses a panel-based interface, including a history panel to keep track of your changes and revert to a previous point; a snapshot panel that allows you to work with multiple versions of a photo; and scrollable tool panels to easily select a tool without worrying about accidentally using the wrong one. Its tools offer a wide variety of exposure, color, detail, transformation, and demosaicing features.

The application imports raw files from most cameras and is localized to more than 25 languages, making it widely usable. Features like batch processing and [SSE][18] optimizations improve speed and CPU performance.

RawTherapee offers many other [features][19]; check out its [documentation][20] and [source code][21] for details.

Do you use another open source raw image processing tool in your photography? Do you have any related tips or suggestions for other photographers? If so, please share your recommendations in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/alternatives/adobe-lightroom

作者：[Opensource.com][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://opensource.com
[1]:https://en.wikipedia.org/wiki/Raw_image_format
[2]:https://opensource.com/article/18/3/movie-open-source-software
[3]:http://lunatics.tv/
[4]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/raw-image-processors_darkroom1.jpg?itok=0fjk37tC (Darktable)
[5]:http://www.darktable.org/
[6]:https://www.darktable.org/about/faq/#faq-windows
[7]:https://github.com/darktable-org/darktable/blob/master/LICENSE
[8]:https://www.darktable.org/about/features/
[9]:https://www.darktable.org/resources/
[10]:https://github.com/darktable-org/darktable
[11]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/raw-image-processors_lightzone1tookstack.jpg?itok=1e3s85CZ (LightZone's tool stack)
[12]:http://www.lightzoneproject.org/
[13]:http://www.lightzoneproject.org/Forum
[14]:https://github.com/ktgw0316/LightZone
[15]:https://opensource.com/sites/default/files/styles/panopoly_image_original/public/uploads/raw-image-processors_rawtherapee.jpg?itok=meiuLxPw (RawTherapee)
[16]:http://rawtherapee.com/
[17]:https://github.com/Beep6581/RawTherapee/blob/dev/LICENSE.txt
[18]:https://en.wikipedia.org/wiki/Streaming_SIMD_Extensions
[19]:http://rawpedia.rawtherapee.com/Features
[20]:http://rawpedia.rawtherapee.com/Main_Page
[21]:https://github.com/Beep6581/RawTherapee
