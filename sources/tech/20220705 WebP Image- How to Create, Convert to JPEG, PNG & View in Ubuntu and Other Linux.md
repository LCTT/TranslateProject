[#]: subject: "WebP Image: How to Create, Convert to JPEG, PNG & View in Ubuntu and Other Linux"
[#]: via: "https://www.debugpoint.com/view-webp-ubuntu-linux/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lkxed"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

WebP Image: How to Create, Convert to JPEG, PNG & View in Ubuntu and Other Linux
======
In this article, I will explain the following topics, which cover all the information you need to convert and view WebP images in Ubuntu and other distributions.

![WebP Logo][1]

### What is WebP

In September 2010, Google announced the WebP image format with a vision and a solid replacement for JPEG, PNG and GIF file formats. As you can see, it’s one single format that provides all the features of the legacy compression algorithm. At its core, WebP supports lossy, lossless animation and transparency.

In addition, WebP is based on block prediction technology and its recommended image format for the web. Due to its significant low file size and better quality, it became the modern standard for serving website images.

### The Current State

Today, almost all the major web browsers support WebP – which means you can view the images in popular browsers such as Chromium, Chrome, Firefox, Brave, Vivaldi, Safari and Edge.

But creating a WebP image from existing JPG and PNG files requires the [WebP][2] library developed by Google. Moreover, the Linux distribution’s file managers are not yet capable of displaying them out of the box.

For a seamless integration and experience with WebP – many small components must work together. The operating system requires the core library for WebP. In addition, the file manager and image viewers need to recognise the `*.webp` file type and read them.

All of these result in a consistent experience for users. Since it is still a new standard and adoption is in progress, you need to perform some extra steps in Linux to get it working.

On the other hand, Windows 10 and 11 currently support WebP by default, including its new Image Viewer.

Hence, this article will discuss how to view, create and convert WebP images in Linux systems.

### View WebP Images

#### Ubuntu, Linux Mint and related distros

Viewing an image requires a loader. The file managers or image viewers use that loader library to enable the display of WebP images. By default, the WebP image loader is not available in Ubuntu Linux. Hence, you need to install the `webp-pixbuf-loader` library using the following PPA to view a WebP image in Ubuntu. This library enables GTK applications to show the WebP images.

```
sudo add-apt-repository ppa:helkaluin/webp-pixbuf-loadersudo apt updatesudo apt install webp-pixbuf-loader
```

If you want to learn how a GDK library works between the display server (e.g. X.Org) and GTK components, visit [this page.][3]

#### openSUSE

Leap and Tumbleweed packages are [available here][4]. Visit the page and click on the Expert Download to install.

#### Arch Linux

In Arch Linux, the package is available in [the community repo][5]. Hence the installation is easy using the following command.

```
sudo pacman -S webp-pixbuf-loader
```

#### Fedora Linux, RHEL

For Fedora and other related distributions, use the following command to install.

```
sudo dnf install webp-pixbuf-loader
```

After installation is complete, **restart your system**(optional)**.**

Now, the fun part. Browse to any directory with WebP images, and you should see them in thumbnails or the default image viewer.

Here’s an example image with a before-after view of the Nautilus file manager in Ubuntu 22.04 LTS with WebP images.

![GNOME Files (Nautilus) with WebP file - before][6]

![GNOME Files (Nautilus) with WebP file - after][7]

### View WebP images in Various File Manager/Image Viewers in Linux Distros

#### GNOME & Nautilus

For GNOME desktops, Nautilus would work fine with the method I explained above for Ubuntu/Fedora or others.

#### View WebP images in Thunar Desktop (Xfce-based distros)

Although Thunar can show the thumbnail by default for the Xfce desktop, the default image viewer Ristretto wouldn’t open the WebP. So, you must install the above packages first (Ubuntu/Fedora or Arch) and reboot. Then open it with Ristretto image viewer after changing the default .webp file-type association.

![Thunar and Ristretto Image Viewer shows webp image][8]

#### KDE Plasma – Dolphin file manager and image viewer – Gwenview

The default image viewer Gwenview supports WebP by default. Hence you don’t need any additional installation to view it. And Dolphin can display the WebP thumbnail just fine.

![Dolphin and Gwenview displays a sample WebP image in KDE Plasma][9]

#### Viewing WebP images in PCManFMQt (LXQt-based distros)

If you are using Lubuntu, you should be able to open WebP by LXImage viewer because it supports WebP by default. Also, PCManFMQt can show WebP thumbnails by default.

![PCManFM-Qt and LXImage][10]

#### Nemo file manager

[Linux Mint][11] is bringing WebP support from the [Mint 21 “Vanessa”][12] release onwards, which should work for the Nemo file manager. Until then, you can use the above PPA to view the WebP images in Linux Mint.

### How to view WebP image in Ubuntu and other Linux using an app (recommended)

Firstly, the famous raster graphics program **GIMP** can open and save WebP images from version 2.10 onwards (currently available for all distros).

Secondly, you can use the following image viewers (other than what your desktop offers), which support WebP.

* [Qview][13] – A minimal image viewer
* [gThumb][14] – A GTK-based image viewer [available as Flatpak]

Finally, [LibreOffice 7.4][15] (due in August) brings [native WebP support][16] for both import and export for its all components – Writer, Calc, Draw and Impress.

### Convert WebP Images to JPG or PNG

Since you learned how to view the .webp files, it’s worth knowing how to convert them.

Firstly, install the webp packages for Ubuntu or Fedora Linux, including related distros using the following command. Alternatively, if you want the pre-compiled packages for all distros and operating systems which does not require installation, then visit [this page][17] and download the latest zip file.

**Ubuntu and related distros:**

```
sudo apt install webp
```

**Fedora and related distros:**

```
sudo dnf install libwebp
```

**After installation**, use the following command to convert a WebP image to JPG/PNG. Make sure to change the file name and path for your case.

```
dwebp image1.webp -o image1.png
```

### Convert JPEG or PNG images to WebP format

Similarly, if you want to convert a JPEG or PNG file to WebP format, use the following command with cwebp (WebP encoder).

```
cwebp -q <compression factor> <input image> -o <output image>
```

For example, you can use a sample command below, which converts image1.png to image1.webp with a compression factor of 80

```
cwebp -q 80 image1.png -o image1.webp
```

### Convert GIF image to WebP image

One of the underrated features of the WebP format is it supports animation. Hence, the animated GIF files can also work in WebP format with the same animation. Using the following command, you can convert an existing GIF file to a WebP file.

```
gif2webp input_file.gif -o output_file.webp
```

Visit [this page][18] to learn more about the above utility and other options.

### Closing Notes

Although it’s been a decade since the first announcement of WebP, it took considerable time for desktop Linux to adapt to view the WebP image formats. And I believe, by 2022 end, the WebP support will be native, and you may not need additional tweaking or workaround to view or save WebP files.

I hope this article gives you complete detail about WebP and how you can make it streamlined for your workflow.

So, how you are managing WebP images today? Let me know in the comment box below.

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/view-webp-ubuntu-linux/

作者：[Arindam][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lkxed
[1]: https://www.debugpoint.com/wp-content/uploads/2022/07/WebP-Logo.jpg
[2]: https://developers.google.com/speed/webp
[3]: https://docs.gtk.org/gdk-pixbuf/
[4]: https://software.opensuse.org/package/webp-pixbuf-loader
[5]: https://archlinux.org/packages/community/x86_64/webp-pixbuf-loader/
[6]: https://i0.wp.com/www.debugpoint.com/wp-content/uploads/2022/07/GNOME-Files-Nautilus-with-WebP-file-before.png?ssl=1
[7]: https://i0.wp.com/www.debugpoint.com/wp-content/uploads/2022/07/GNOME-Files-Nautilus-with-WebP-file-after.png?ssl=1
[8]: https://www.debugpoint.com/wp-content/uploads/2022/07/Thunar-and-Ristretto-Image-Viewer-shows-webp-image.jpg
[9]: https://www.debugpoint.com/wp-content/uploads/2022/07/Dolphin-and-Gwenview-displays-a-sample-WebP-image-in-KDE-Plasma.jpg
[10]: https://www.debugpoint.com/wp-content/uploads/2022/07/PCManFM-Qt-and-LXImage.jpg
[11]: https://www.debugpoint.com/linux-mint/
[12]: https://debugpointnews.com/linux-mint-21-systemd-oom/
[13]: https://interversehq.com/qview/download/
[14]: https://flathub.org/apps/details/org.gnome.gThumb
[15]: https://www.debugpoint.com/libreoffice-7-4/
[16]: https://cgit.freedesktop.org/libreoffice/core/commit/?id=60eaa424c5e213f31227008e1ed66a646491a360
[17]: https://storage.googleapis.com/downloads.webmproject.org/releases/webp/index.html
[18]: https://developers.google.com/speed/webp/download
