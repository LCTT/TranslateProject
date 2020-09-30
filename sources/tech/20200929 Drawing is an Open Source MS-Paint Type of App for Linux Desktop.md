[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Drawing is an Open Source MS-Paint Type of App for Linux Desktop)
[#]: via: (https://itsfoss.com/drawing-app/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Drawing is an Open Source MS-Paint Type of App for Linux Desktop
======

_**Brief: Drawing is a basic image editor like Microsoft Paint. With this open source application, you can draw arrows, lines, geometrical shapes, add colors and other stuff you expect to do in a regular drawing application.**_

### Drawing: A simple drawing application for Linux

![][1]

For people introduced to computers with Windows XP (or earlier version), MS Paint was an amusing application from sketching random stuff. In a world dominated with Photoshop and GIMP, the paint applications still hold some relevance.

There are several [painting applications available for Linux][2], and I am going to add one more to this list.

The app is unsurprisingly called [Drawing][3] and you can use it on both Linux desktop and Linux smartphones.

### Features of Drawing app

![][4]

Drawing has all the features you expect from a drawing application. You can

  * Create new drawings from scratch
  * Edit an existing image in PNG, JPEG or BMP file
  * Add geometrical shapes, lines, arrows etc
  * Dashed
  * Use pencil tool for free-hand drawing
  * Use curve and shape tool
  * Crop images
  * Scale images to different pixel size
  * Add text
  * Select part of image (rectangle, freehand and color selection)
  * Rotate images
  * Add images copied to clipboard
  * Eraser, Highlighter, Paint, Color Selection, Color Picker tools are available in preferences
  * Unlimited undo
  * Filters to add blur, pixelisation, transparency etc



### My experience with Drawing

![][5]

The application is new and has a decent user interface. It comes with all the basic features you expect to find in a standard paint app.

It has some additional tools like color selection and color picker but it might be confusing to use them. There is no documentation available to describe the use of these tools to you are on your own here.

The experience is smooth and I feel that this tool has good potential to replace Shutter as image editing tool (yes, I [use Shutter for editing screenshots][6]).

The thing that I find most bothersome is that it is not possible to edit/modify an element after adding it. You have the undo and redo options but if you want to modify a text you added 12 steps back, you’ll have to redo all the steps. This is something the developer may look into it in the future releases.

### Installing Drawing on Linux

This is a Linux exclusive app. It is also available for Linux-based smartphones like [PinePhone][7].

There are various ways you can install Drawing app. It is available in the repositories of many major Linux distributions.

#### Ubuntu-based distributions

Drawing is included in the universe repository in Ubuntu. Which means you can install it from the Ubuntu Software Center.

However, if you want the latest version, there is a [PPA available][8] for easily installing Drawing on Ubuntu. Linux Mint and other Ubuntu-based distributions.

Use the following command:

```
sudo add-apt-repository ppa:cartes/drawing
sudo apt update
sudo apt install drawing
```

If you want to remove it, you can use the following commands:

```
sudo apt remove drawing
sudo add-apt-repository -r ppa:cartes/drawing
```

#### Other Linux distributions

Check your distribution’s package manager for Drawing and install it from there. If you want the latest version, you may use the Flatpak version of the app.

[Drawing Flatpak][9]

**Conclusion**

Do you still use a paint application? Which one do you use? If you have tried Drawing app already, how is your experience with it?

--------------------------------------------------------------------------------

via: https://itsfoss.com/drawing-app/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/drawing-app-interface.jpg?resize=789%2C449&ssl=1
[2]: https://itsfoss.com/open-source-paint-apps/
[3]: https://maoschanz.github.io/drawing/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/drawing-screenshot.jpg?resize=800%2C489&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/09/using-drawing-app-linux.png?resize=787%2C473&ssl=1
[6]: https://itsfoss.com/install-shutter-ubuntu/
[7]: https://itsfoss.com/pinephone/
[8]: https://launchpad.net/~cartes/+archive/ubuntu/drawing
[9]: https://flathub.org/apps/details/com.github.maoschanz.drawing
