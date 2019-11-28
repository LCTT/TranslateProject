[#]: collector: (lujun9972)
[#]: translator: (robsean)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Edit images on Fedora easily with GIMP)
[#]: via: (https://fedoramagazine.org/edit-images-on-fedora-easily-with-gimp/)
[#]: author: (Mehdi Haghgoo https://fedoramagazine.org/author/powergame/)

Edit images on Fedora easily with GIMP
======

![][1]

GIMP (short for GNU Image Manipulation Program) is free and open-source image manipulation software. With many capabilities ranging from simple image editing to complex filters, scripting and even animation, it is a good alternative to popular commercial options.

Read on to learn how to install and use GIMP on Fedora. This article covers basic daily image editing.

### Installing GIMP

GIMP is available in the official Fedora repository. To install it run:

```
sudo dnf install gimp
```

### Single window mode

Once you open the application, it shows you the dark theme window with toolbox and the main editing area. Note that it has two window modes that you can switch between by selecting _Windows_ -&gt; _Single Window Mode_. By checking this option all components of the UI are displayed in a single window. Otherwise, they will be separate.

### Loading an image

![][2]

To load an image, go to _File_ -&gt; _Open_ and choose your file and choose your image file.

### Resizing an image

To resize the image, you have the option to resize based on a couple of parameters, including pixel and percentage — the two parameters which are often handy in editing images.

Let’s say we need to scale down the Fedora 30 background image to 75% of its current size. To do that, select _Image_ -&gt; _Scale_ and then on the scale dialog, select percentage in the unit drop down. Next, enter _75_ as width or height and press the **Tab** key. By default, the other dimension will automatically resize in correspondence with the changed dimension to preserve aspect ratio. For now, leave other options unchanged and press Scale.

![][3]

The image scales to 0.75 percent of its original size.

### Rotating images

Rotating is a transform operation, so you find it under _Image_ -&gt; _Transform_ from the main menu, where there are options to rotate the image by 90 or 180 degrees. There are also options for flipping the image vertically or horizontally under the mentioned option.

Let’s say we need to rotate the image 90 degrees. After applying a 90-degree clockwise rotation and horizontal flip, our image will look like this:

![Transforming an image with GIMP][4]

### Adding text

Adding text is very easy. Just select the A icon from the toolbox, and click on a point on your image where you want to add the text. If the toolbox is not visible, open it from Windows-&gt;New Toolbox.

As you edit the text, you might notice that the text dialog has font customization options including font family, font size, etc.

![Adding text to image in GIMP][5]

### Saving and exporting

You can save your edit as as a GIMP project with the _xcf_ extension from _File_ -&gt; _Save_ or by pressing **Ctrl+S**. Or you can export your image in formats such as PNG or JPEG. To export, go to _File_ -&gt; _Export As_ or hit **Ctrl+Shift+E** and you will be presented with a dialog where you can select the output image and name.

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/edit-images-on-fedora-easily-with-gimp/

作者：[Mehdi Haghgoo][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/powergame/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/10/gimp-magazine-816x346.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2019/10/Screenshot-from-2019-10-25-11-00-44-300x165.png
[3]: https://fedoramagazine.org/wp-content/uploads/2019/10/Screenshot-from-2019-10-25-11-17-33-300x262.png
[4]: https://fedoramagazine.org/wp-content/uploads/2019/10/Screenshot-from-2019-10-25-11-41-28-300x243.png
[5]: https://fedoramagazine.org/wp-content/uploads/2019/10/Screenshot-from-2019-10-25-11-47-54-300x237.png
