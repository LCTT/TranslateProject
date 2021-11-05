[#]: subject: "4 ways to edit photos on the Linux command line"
[#]: via: "https://opensource.com/article/21/11/edit-photos-linux-command-line"
[#]: author: "Alan Formy-Duval https://opensource.com/users/alanfdoss"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

4 ways to edit photos on the Linux command line
======
Here are a few of my favorite ImageMagick tricks and how to use them
without a GUI.
![Montage of Alan as a Kid][1]

Linux is useful to photographers and graphic artists. It provides many tools for editing different types of image files and formats, including photographs. This roundup shows that you do not even need a graphical interface to work with your photos. Here are four ways that you can edit images at the command line.

### Apply effects to your images

A couple of years ago, Seth Kenlon wrote the article, [4 fun (and semi-useless) Linux toys][2] which included an introduction to the ImageMagick suite of editing tools. ImageMagick is even more relevant today in 2021.

This article taught us about Fred's ImageMagick scripts, which really are useful. Fred Weinhaus maintains over 200 scripts for applying all sorts of effects to your image files. Seth shows us an example of Fred's `vintage3` script that gives an image an old-time appearance.

### Create photo collages

This year, Jim Hall showed us how to create a collage from photos with his article, [Create a photo collage from the Linux command line][3].

Collages are used a lot in pamphlets and brochures. They are a fun way to display several images within a single picture. Effects can be applied to blend them further together. As a matter of fact, I used his article as a guide to create the collage of pictures above. That is me when I was a kid! Here is the command I used:


```
$ montage Screenshot-20211021114012.png \
Screenshot-20211021114220.png \
Screenshot-20211021114257.png \
Screenshot-20211021114530.png \
Screenshot-20211021114639.png \
Screenshot-20211021120156.png \
-tile 3x2 -background black \
screenshot-montage.png
```

### Resize images

Jim delivered another article, [Resize an image from the Linux terminal][4]. This tutorial demonstrates how to change the dimensions of an image file and save it as a new file using ImageMagick. For example, the collage that resulted from the montage command above did not have the required dimensions. Learning how to resize allowed me to adjust the width and height so that it could be included. This is the command I used to resize the lead image of this article:


```
`$ convert screenshot-montage.png -resize 520x292\! alanfd-kid-montage.png`
```

### Automate image processing

Recently, I decided to take a look at the ImageMagick suite for myself. This time, I combined its tools into a Bash script. The article is entitled [Automate image processing with this bash script][5]. This example is a simple script that automates the production of images for my articles. It is tailored to the requirements here on Opensource.com. I provided a Git repo link in the article if you would like to use the script. It is easily modified and extensible for anyone's needs.

### Wrap up

I hope you enjoy these articles and use Linux in your artistic endeavors. If you would like to check out more Linux image software, take a look at the Fedora [Design Suite][6] Spin. It is a complete operating system installation that includes many different open source multimedia production and publishing tools, such as:

  * GIMP
  * Inkscape
  * Blender
  * Darktable
  * Krita
  * Scribus
  * and more...



--------------------------------------------------------------------------------

via: https://opensource.com/article/21/11/edit-photos-linux-command-line

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/alanfd-kid-montage.png?itok=r1kgXpLc (Montage of Alan as a Kid)
[2]: https://opensource.com/life/16/6/fun-and-semi-useless-toys-linux
[3]: https://opensource.com/article/21/9/photo-montage-imagemagick
[4]: https://opensource.com/article/21/9/resize-image-linux
[5]: https://opensource.com/article/21/10/image-processing-bash-script
[6]: https://labs.fedoraproject.org/en/design-suite/
