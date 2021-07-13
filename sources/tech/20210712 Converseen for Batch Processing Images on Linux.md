[#]: subject: (Converseen for Batch Processing Images on Linux)
[#]: via: (https://itsfoss.com/converseen/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Converseen for Batch Processing Images on Linux
======

Converseen is a free and open source software for batch image conversion. With this tool, you can convert multiple images to another format, resize, change their aspect ratio, rotate or flip them all at once.

This is a handy tool for someone like me who has to deal with multiple screenshots of different size but has to resize them all before uploading to the website.

Batch conversion tools help a lot in such cases. This could be done in the Linux command line with the wonderful [ImageMagick][1] but a GUI tool is a lot easier to use here. Actually, Converseen uses ImageMagick underneath the Qt-based GUI.

### Batch process images with Converseen

You can use [Converseen][2] to convert, resize, rotate and flip multiple images with a mouse click.

You have plenty of supporting options for the batch conversion. You can add additional images to your selection or remove some of them. You can choose to convert only a few of your selected images.

While resizing the images, you can choose to keep the aspect ratio. Keep in mind that out of width and height, the one you changed/typed last is the one controlling the aspect ratio. So, if you want to resize keeping the same aspect ratio but according to the width, don’t touch the height field.

![][3]

You can also choose to save the converted images with different name in the same directory or some other location. You may also overwrite the existing images.

You cannot add folder but you can select and add multiple images at once.

You can convert the images to a number of formats like JPEG, JPG, TIFF, SVG and more.

There is also an option to give the transparent background a certain color while changing the format. You can also set the quality of the compression level.

![][4]

Converseen says that it can also import PDF files and convert the entire PDF or part of it into images. However, it crashed in Ubuntu 21.04 each time I tried to convert a PDF file.

### Install Converseen on Linux

Converseen is a popular application. It is available in the repositories of most Linux distributions.

You can search for it in your distribution’s software center:

![][5]

You may, of course, use your distribution’s package manager to install it via command line.

On Debian and Ubuntu-based distributions, use:

```
sudo apt install converseen
```

On Fedora, use:

```
sudo dnf install converseen
```

On Arch and Manjaro, use:

```
sudo pacman -Sy converseen
```

Converseen is also available for Windows and FreeBSD. You can get the instructions on the download page of the project website.

[Download Converseen][6]

Its source code is [available][7] on the project’s GitHub repository.

If you are looking for an even easier way to resize a single image, you can use this nifty trick and [resize and rotate images with right click context menu in Nautilus file manager][8].

Overall, Converseen is a useful GUI tool for batch image conversion. It’s not perfect but it works for the most part. Have you ever used Converseen or do you use a similar tool? How is your experience with it?

--------------------------------------------------------------------------------

via: https://itsfoss.com/converseen/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://imagemagick.org/index.php
[2]: https://converseen.fasterland.net/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/converseen-interface.png?resize=800%2C400&ssl=1
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/07/converseen-features-overview_copy.png?resize=800%2C497&ssl=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/07/install-converseen-linux.jpeg?resize=800%2C527&ssl=1
[6]: https://converseen.fasterland.net/download/
[7]: https://github.com/Faster3ck/Converseen
[8]: https://itsfoss.com/resize-images-with-right-click/
