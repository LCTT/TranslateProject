[#]: subject: "Create a photo collage from the Linux command line"
[#]: via: "https://opensource.com/article/21/9/photo-montage-imagemagick"
[#]: author: "Jim Hall https://opensource.com/users/jim-hall"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Create a photo collage from the Linux command line
======
Here's how I use ImageMagick to make photo grids for my social media
posts.
![Polaroids and palm trees][1]

ImageMagick is the "Swiss Army knife" of manipulating images on the command line. While you could use a desktop graphics program like GIMP or GLIMPSE to adjust or combine photos and graphics, sometimes it's just easier to use one of the almost dozen tools from ImageMagick.

For example, I frequently find myself creating image montages to share on social media. Let's say I wanted to share a montage or "image grid" of several screenshots. To do that, I use the ImageMagick `montage` command. 

ImageMagick is a full suite of tools, and the one I use here is the `montage` command. The general syntax of the `montage` command looks like this:


```
`montage {input} {actions} {output}`
```

In my case, my screenshots are already the same size: 320x240 pixels.  To create a montage of six of these images, in a grid that's two screenshots wide by three tall, I can use this command:


```
$ montage acronia.png \
ascii-table.png \
music.png \
programming-chess.png \
petra.png \
amb.png \
-tile 2x3 -geometry +1+1 \ 
screenshot-montage.png
```

This creates an image that's composed of the six screenshots, with a 1-pixel border around each. Doing the math, that's 644 pixels wide and 726 pixels high.

Note the order of the images: ImageMagick montage arranges the images from left-to-right and top-to-bottom.

![Screenshot montage][2]

(Jim Hall, [CC BY-SA 4.0][3])

In my example, the first row of images shows the open source 2D shooter Acronia and an ASCII programming example, the middle row is an open source music player and a chess programming example, and the third row shows the open source game Post Apocalyptic Petra and the FreeDOS AMB Help reader.

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

These open source photo libraries help you stay organized while making your pictures look great.

--------------------------------------------------------------------------------

via: https://opensource.com/article/21/9/photo-montage-imagemagick

作者：[Jim Hall][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/jim-hall
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/design_photo_art_polaroids.png?itok=SqPLgWxJ (Polaroids and palm trees)
[2]: https://opensource.com/sites/default/files/uploads/screenshot-montage_0.png (Screenshot montage)
[3]: https://creativecommons.org/licenses/by-sa/4.0/
[4]: https://opensource.com/article/20/11/macports
[5]: https://opensource.com/article/20/6/homebrew-mac
[6]: https://opensource.com/article/20/3/chocolatey
