[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Photoflare: An Open Source Image Editor for Simple Editing Needs)
[#]: via: (https://itsfoss.com/photoflare/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

Photoflare: An Open Source Image Editor for Simple Editing Needs
======

_**Brief: Photoflare is an image editor available for Linux and Windows. The editor has a free and open source community edition.**_

When it comes to image editing on Linux, GIMP is the first and obvious choice. But GIMP could be overwhelming if you don’t need advanced editing feature. This is where applications like Photoflare step in.

### PhotoFlare: A simple image editor

![][1]

Photoflare is an editor that provides basic image editing features with a simple-to-use interface.

It is inspired by the popular Windows application [PhotoFiltre][2]. The application is not a clone though and it has been written in C++ from scratch and uses Qt framework for the interface.

The features include cropping, flipping/rotating, resizing image. You can also tools like paint brush, paint bucket, spray can, blur tool and eraser. The magic wand tool lets you select a specific area of the image.

You can also add lines and text on an image. You cal also change the hue variation to change the color tone of the image.

You can also create an image from scratch like any other [paint application][3].

The batch editing option allows you to resize, convert file format and add filter to multiple photos simultaneously.

![Batch Editing Feature in Photoflare | Photo Credit: Photoflare website][4]

### Features of Photoflare

I’ll list the main features of Photoflare for easier reference:

  * Create/draw an image
  * Crop an image
  * Rotate an image
  * Resize image
  * Edit images with tools like paint brush, paint bucket, spray, blur tool and image
  * Add lines and text on images
  * Change the color tone of images
  * Add vintage filter
  * Batch resize, filter etc



### Installing Photflare on Linux

![][5]

On the website of Photoflare, you’ll find the pricing and the option for monthly subscription. However, the application is open source and its [source code is available on GitHub][6].

The application is also **free** to use. The [pricing/subscription part][7] is for financial support of the project. You can download it for free and if you like the application and would continue to use it, consider donating to the project.

Photoflare has an [official PPA][8] for Ubuntu and Ubuntu based distributions. This PPA is available for Ubuntu 18.04 and 20.04 versions.

Open a terminal and use the following commands one by one to install Photoflare:

```
sudo add-apt-repository ppa:photoflare/photoflare-stable
sudo apt update
sudo apt install photoflare
```

To remove Photoflare from Ubuntu-based distributions, use this command:

```
sudo apt remove photoflare
```

It would be a good idea to remove the PPA as well:

```
sudo add-apt-repository -r ppa:photoflare/photoflare-stable
```

**Arch Linux** and Manjaro users can [get it from AUR][9].

There is no ready to use package for Fedora so you’ll have to get the source code:

[Photoflare source code][6]

### Experience with Photoflare

I find it somewhat similar to [Pinta][10] with a bit more features. It is a simple tool for some basic image editing. The batch feature is a plus.

I did notice image doesn’t look sharp when it is opened for editing. I opened a screenshot for editing and the fonts looked blurry. However, after saving the image and opening it in an [image viewer][11] showed no such issue.

Altogether, it is a decent tool if you are not looking for a professional grade image editing.

If you have used it in the past or if you give it a try, do share your experience with Photoflare.

--------------------------------------------------------------------------------

via: https://itsfoss.com/photoflare/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/Photoflare.jpg?ssl=1
[2]: http://photofiltre.free.fr/frames_en.htm
[3]: https://itsfoss.com/open-source-paint-apps/
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/08/batch_editing_photoflare.png?ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/08/photoflare-editor-linux.png?resize=800%2C580&ssl=1
[6]: https://github.com/PhotoFlare/photoflare
[7]: https://photoflare.io/pricing/
[8]: https://launchpad.net/~photoflare/+archive/ubuntu/photoflare-stable
[9]: https://aur.archlinux.org/packages/photoflare-git/
[10]: https://itsfoss.com/pinta-new-release/
[11]: https://itsfoss.com/image-viewers-linux/
