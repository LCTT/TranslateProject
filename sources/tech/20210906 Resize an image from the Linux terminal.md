[#]: subject: "Resize an image from the Linux terminal"
[#]: via: "https://opensource.com/article/21/9/resize-image-linux"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Resize an image from the Linux terminal
======
Shrink an image from your terminal with the ImageMagick convert command.
![Old camera blue][1]

ImageMagick is a handy multipurpose command-line tool for all your image needs. ImageMagick supports a variety of image types, including JPG photos and PNG graphics.

### Resizing images

I often use ImageMagick on my webserver to resize images. For example, let's say I want to include a photo of my cats on my personal website. The photo from my phone is very large, about 4000x3000 pixels, at 3.3MB. That's much too large for a web page. I use the ImageMagick convert tool to change the size of my photo so that I can include it on my web page. ImageMagick is a full suite of tools, one of the most common is the `convert` command.

The ImageMagick `convert` command uses this general syntax:


```
`convert {input} {actions} {output}`
```

To resize a photo called `PXL_20210413_015045733.jpg` to a more manageable 500-pixel width, type this:


```
`$ convert PXL_20210413_015045733.jpg -resize 500x sleeping-cats.jpg`
```

The new image is now only 65KB in size. 

![Sleeping cats][2]

Jim Hall, [CC BY-SA 4.0][3]

You can provide both width and height dimensions with the `-resize` option. But, by providing only the width, ImageMagic does the math for you and automatically retains the aspect ratio by resizing the output image with a proportional height.

### Install ImageMagick on Linux

On Linux, you can install ImageMagick using your package manager. For instance, on Fedora or similar:


```
`$ sudo dnf install imagemagick`
```

On Debian and similar:


```
`$ sudo apt install imagemagick`
```

On macOS, use [MacPorts][4] or [Homebrew][5].

On Windows, use [Chocolatey][6].

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/resize-image-linux

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/osdc-photo-camera-blue.png?itok=AsIMZ9ga (Old camera blue)
[2]: https://opensource.com/sites/default/files/sleeping-cats.jpg (Sleeping cats)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
