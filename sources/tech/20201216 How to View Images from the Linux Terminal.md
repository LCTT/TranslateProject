[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to View Images from the Linux Terminal)
[#]: via: (https://www.2daygeek.com/how-to-view-display-images-from-linux-terminal/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to View Images from the Linux Terminal
======

Linux has many GUI applications for viewing images.

But I have never tried any CLI applications to see it.

Fortunately while working with the **[ImageMagick tool][1]** I got a command to view an image from the terminal.

The command name is **“display”**, which is part of the ImageMagick tool.

This is a great tool that allows NIX users to view images from the terminal.

Also, I got another great tool called FIM for this purpose.

We will show you how to install and use it to view images from the Linux terminal.

These commands use the system’s framebuffer to display images directly from the command line.

### How to View Images from Terminal Using display Command

[ImageMagick][2] is a free and open source, feature-rich, command-line based image manipulation tool.

It used to create, edit, compose, or convert bitmap images.

It can read and write images in a variety of formats (over 200) including PNG, JPEG, GIF, PDF, SVG and etc,.

It can resize, mirror, rotate, transform images, adjust image colors, apply various special effects, etc,.

It supports batch process, which allow you to processes all images at once.

### How to Install ImageMagick?

The ImageMagick package is included in the official repository of most Linux distributions. Use the distribution package manager to install it.

**Make a note:** Make sure you already have “**[Development Tools][3]**” installed on your Linux system as a prerequisite for this.

For **RHEL/CentOS 6/7** systems, use the **[yum command][4]** to install ImageMagick.

```
$ sudo yum install -y ImageMagick ImageMagick-devel
```

For **RHEL/CentOS 8** and **Fedora** systems, use the **[dnf command][5]** to install ImageMagick.

```
$ sudo dnf install -y ImageMagick ImageMagick-devel
```

For **Debian/Ubuntu** systems, use the **[apt command][6]** or **[apt-get command][7]** to install ImageMagick.

```
$ sudo apt-get update
$ sudo apt-get install imagemagick
```

For **openSUSE** systems, use the **[zypper command][8]** to install ImageMagick

```
$ sudo zypper install -y ImageMagick
```

To view any image file, run display command as follows. You can close the image by pressing the **“Esc/q”** button.

```
$ display bird.jpg
```

![][9]

If you want to open the image with the specified size of the window, use the **“-geometry”** flag.

```
$ display -geometry 1000x600 ~/Downloads/bird.jpg
```

You can also input position information of the image with display command. The below command open your image 800 pixels from the top and 800 pixels from the top left corner of your desktop.

```
$ display -geometry 1000x600+800+800 ~/Downloads/bird.jpg
```

If you want to resize the image with the display command, use the following format.

```
$ display -resize 600x400 ~/Downloads/bird.jp
```

Alternatively, you can use percentage to resize the image.

```
$ display -resize 50% ~/Downloads/bird.jpg
```

### How to View Images from the Terminal Using fim Command

[FIM][10] is a lightweight global image viewer designed specifically for Linux.

But it is not limited to Linux and can be configured to run on other OS such as MS-Windows.

It’s highly customizable and scriptable image viewer for users who are familiar with software like the VIM text editor.

It displays the image in full screen and can be easily controlled using the keyboard shortcuts.

It is very lightweight tool because it only depends on certain libraries.

It can open many file formats and it can display images in the following video modes.

  * Graphically, with the Linux framebuffer device
  * Graphically, under X/Xorg, using the SDL library
  * Graphically, under X/Xorg, using the Imlib2 library
  * Rendered as ASCII Art in any textual console, using the AAlib library



The right video mode gets auto-detected or selected at runtime, and may be opted in/out before build at configure time, if desired.

FIM stands for Fbi IMproved, which is the fork of the Fbi Image viewer.

FIM can be easily installed on Debian/Ubuntu based systems as the package is available in the distribution official repository. For other distributions, you may need to compile it from the source.

```
$ sudo apt install fim
```

Once installed, you can display an image using the following command.

```
$ fim bird.jpg
```

You can automatically zoom an image using the **“-a”** option.

```
$ fim -a bird.jpg
```

![][9]

If you want to open multiple image files in the current directory, use the wildcard to open them all. Use the **“Pageup/Down”** keyboard shortcuts to move to the next or previous image.

```
$ fim -a *.jpg
```

To view the image in ASCII format, you can use the **“-t”** flag.

```
$ fim -t bird.jpg
```

The below keyboard shortcuts allow you to control the images.

  * PageUp/Down : Prev/Next image
  * +/- : Zoom in/out
  * a : Autoscale
  * w : Fit to width
  * ESC/q : Quit



--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-view-display-images-from-linux-terminal/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/resize-convert-images-from-linux-command-line/
[2]: https://imagemagick.org/
[3]: https://www.2daygeek.com/install-development-tools-on-ubuntu-debian-arch-linux-mint-fedora-centos-rhel-opensuse/
[4]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[5]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[6]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[7]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[8]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[9]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[10]: https://www.nongnu.org/fbi-improved/#docs
