HOW TO USE WEBP IMAGES IN UBUNTU LINUX
=========================================

![](http://itsfoss.com/wp-content/uploads/2016/05/support-webp-ubuntu-linux.jpg)
>Brief: This guide shows you how to view WebP images in Linux and how to convert WebP images to JPEG or PNG format. 

###WHAT IS WEBP?

It’s been over five years since Google introduced [WebP file format][0] for images. WebP provides lossy and lossless compression and WebP compressed files are around 25% smaller in size when compared to JPEG compression, Google claims.

Google aimed WebP to become the new standard for images on the web but I don’t see it happening. It’s over five years and it’s still not adopted as a standard except in Google’s ecosystem. But as we know, Google is pushy about its technologies. Few months back Google changed all the images on Google Plus to WebP.

If you download those images from Google Plus using Google Chrome, you’ll have WebP images, no matter if you had uploaded PNG or JPEG. And that’s not the problem. The actual problem is when you try to open that files in Ubuntu using the default GNOME Image Viewer and you see this error:

>**Could not find XYZ.webp**
>**Unrecognized image file format**

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-1.png)
>GNOME Image Viewer doesn’t support WebP images

In this tutorial, we shall see

- how to add WebP support in Linux
- list of programs that support WebP images
- how to convert WebP images to PNG or JPEG
- how to download WebP images directly as PNG images

### HOW TO VIEW WEBP IMAGES IN UBUNTU AND OTHER LINUX

[GNOME Image Viewer][3], the default image viewer in many Linux distributions including Ubuntu, doesn’t support WebP images. There are no plugins available at present that could enable GNOME Image Viewer to add WebP support.

This means that we simply cannot use GNOME Image Viewer to open WebP files in Linux. A better alternative is [gThumb][4] that supports WebP images by default.

To install gThumb in Ubuntu and other Ubuntu based Linux distributions, use the command below:

```
sudo apt-get install gthumb
```

Once installed, you can simply rightly click on the WebP image and select gThumb to open it. You should be able to see it now:

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-2.jpeg)
>WebP image in gThumb

### MAKE GTHUMB THE DEFAULT APPLICATION FOR WEBP IMAGES IN UBUNTU

For Ubuntu beginners, if you like to make gThumb the default application for opening WebP files, just follow the steps below:

#### Step 1: Right click on the WebP image and select Properties.

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-3.png)
>Select Properties from Right Click menu

#### Step 2: Go to Open With tab, select gThumb and click on Set as default.

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-4.png)
>Make gThumb the default application for WebP images in Ubuntu

### MAKE GTHUMB THE DEFAULT APPLICATIONS FOR ALL IMAGES

gThumb has a lot more to offer than Image Viewer. For example, you can do simple editing, add color filters to the images etc. Adding the filter is not as effective as XnRetro, the dedicated tool for [adding Instagram like effects on Linux][5], but the basic filters are available.

I liked gThumb a lot and decided to make it the default image viewer. If you also want to make gThumb the default application for all kind of images in Ubuntu, follow the steps below:

####Step 1: Open System Settings

![](http://itsfoss.com/wp-content/uploads/2014/04/System_Settings_ubuntu_1404.jpeg)

#### Step 2: Go to Details.

![](http://itsfoss.com/wp-content/uploads/2013/11/System_settings_Ubuntu_1.jpeg)

#### Step 3: Select gThumb as the default applications for images here.

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-5.png)

### ALTERNATIVE PROGRAMS TO OPEN WEBP FILES IN LINUX

It is possible that you might not like gThumb. If that’s the case, you can choose one of the following applications to view WebP images in Linux:

- [XnView][6] (Not open source)
- GIMP with unofficial WebP plugin that can be installed via this [PPA][7] that is available until Ubuntu 15.10. I’ll cover this part in another article.
- [Gwenview][8]

### CONVERT WEBP IMAGES TO PNG AND JPEG IN LINUX

There are two ways to convert WebP images in Linux:

- Command line
- GUI

#### 1. USING COMMAND LINE TO CONVERT WEBP IMAGES IN LINUX

You need to install WebP tools first. Open a terminal and use the following command:

```
sudo apt-get install webp
```

##### CONVERT JPEG/PNG TO WEBP

We’ll use cwebp command (does it mean compress to WebP?) to convert JPEG or PNG files to WebP. The command format is like:

```
cwebp -q [image_quality] [JPEG/PNG_filename] -o [WebP_filename]
```

For example, you can use the following command:

```
cwebp -q 90 example.jpeg -o example.webp
```

##### CONVERT WEBP TO JPEG/PNG

To convert WebP images to JPEG or PNG, we’ll use dwebp command. The command format is:

```
dwebp [WebP_filename] -o [PNG_filename]
```

An example of this command could be:

```
dwebp example.webp -o example.png
```

#### 2. USING GUI TOOL TO CONVERT WEBP TO JPEG/PNG

For this purpose, we will use XnConvert which is a free but not open source application. You can download the installer files from their website:

[Download XnConvert][1]

Note that XnConvert is a powerful tool that you can use for batch resizing images. However, in this tutorial, we shall only see how to convert a single WebP image to PNG/JPEG.

Open XnConvert and select the input file:

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-6.jpeg)

In the Output tab, select the output format you want it to be converted. Once you have selected the output format, click on Convert.

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-7.jpeg)

That’s all you need to do to convert WebP images to PNG, JPEg or any other image format of your choice.

### DOWNLOAD WEBP IMAGES AS PNG DIRECTLY IN CHROME WEB BROWSER

Probably you don’t like WebP image format at all and you don’t want to install a new software just to view WebP images in Linux. It will be a bigger pain if you have to convert the WebP file for future use.

An easier and less painful way to deal with is to install a Chrome extension Save Image as PNG. With this extension, you can simply right click on a WebP image and save it as PNG directly.

![](http://itsfoss.com/wp-content/uploads/2016/05/WebP-images-Ubuntu-Linux-8.png)
>Saving WebP image as PNG in Google Chrome

[Get Save Image as PNG extension][2]

### WHAT’S YOUR PICK?

I hope this detailed tutorial helped you to get WebP support on Linux and helped you to convert WebP images. How do you handle WebP images in Linux? Which tool do you use? From the above described methods, which one did you like the most?


----------------------
via: http://itsfoss.com/webp-ubuntu-linux/?utm_source=feedburner&utm_medium=feed&utm_campaign=Feed%3A+ItsFoss+%28Its+FOSS%21+An+Open+Source+Blog%29 

作者：[Abhishek Prakash][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创翻译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: http://itsfoss.com/author/abhishek/
[0]: https://developers.google.com/speed/webp/
[1]: http://www.xnview.com/en/xnconvert/#downloads
[2]: https://chrome.google.com/webstore/detail/save-image-as-png/nkokmeaibnajheohncaamjggkanfbphi?utm_source=chrome-ntp-icon
[3]: https://wiki.gnome.org/Apps/EyeOfGnome
[4]: https://wiki.gnome.org/Apps/gthumb
[5]: http://itsfoss.com/add-instagram-effects-xnretro-ubuntu-linux/
[6]: http://www.xnview.com/en/xnviewmp/#downloads
[7]: https://launchpad.net/~george-edison55/+archive/ubuntu/webp
[8]: https://userbase.kde.org/Gwenview
