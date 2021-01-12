[#]: collector: (lujun9972)
[#]: translator: (stevenzdg988)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Resize Images with Right Click on Linux)
[#]: via: (https://www.2daygeek.com/how-to-resize-images-with-right-click-on-linux/)
[#]: author: (Magesh Maruthamuthu https://www.2daygeek.com/author/magesh/)

How to Resize Images with Right Click on Linux
======

Do you often manipulate images as part of your daily job?

I personally need to do the graphics work for this website before uploading it to my blog.

One of the most common image editing tasks is resizing, which tremendously reduces the image size from MB to KB.

This allows images to load quickly on the web even if someone uses a slow internet.

I usually use the ImageMagick tool to perform this operation from the command line.

But I recommend using the “Nautilus Image Converter” which gets integrated in the right-click context menu in the image file.

It is very handy and works well in a second. But if you want to perform this action in bulk. I would recommend using the **[ImageMagick tool][1]** because it comes with a batch operation.

### What’s Nautilus?

Nautilus is a file manager used by GNOME and several other desktop environments. It provides a simple and integrated way to manage your files and applications.

The file manager lets you organize your files into folders. This is similar to “File Explorer” in Windows.

### How to Install Nautilus Image Converter Plugin?

There are many Nautilus plugins that enhance its capabilities. They are not installed by default, but you can choose to install them according to your needs.

We are going to install a plugin called Image Manipulator,, which allows you to rotate or resize images by right-clicking on an image.

Run the command below to see if your Linux system uses Nautilus File Manager.

```
$ nautilus --version
GNOME nautilus 3.36.3
```

If you have Nautilus file manager on your system, you will get the same results as above, but the version may vary.

Make sure you already have ImageMagick installed on your system, as this plugin uses ImageMagick for image manipulation. If not, you need to install it.

**Make a note:** Make sure you already have “**[Development Tools][2]**” installed on your Linux system as a prerequisite for this.

For **RHEL/CentOS 6/7** systems, use the **[yum command][3]** to install ImageMagick.

```
$ sudo yum install -y ImageMagick ImageMagick-devel
```

For **RHEL/CentOS 8** and **Fedora** systems, use the **[dnf command][4]** to install ImageMagick.

```
$ sudo dnf install -y ImageMagick ImageMagick-devel
```

For **Debian/Ubuntu** systems, use the **[apt command][5]** or **[apt-get command][6]** to install ImageMagick.

```
$ sudo apt-get update
$ sudo apt-get install imagemagick
```

For **openSUSE** systems, use the **[zypper command][7]** to install ImageMagick.

```
$ sudo zypper install -y ImageMagick
```

Finally install the Nautilus plugin using the commands below.

For **Ubuntu/Debian** system:

```
$ sudo apt install nautilus-image-converter
```

For **Fedora** system:

```
$ sudo dnf install nautilus-image-converter
```

For **Manjaro/ArchLinux** system:

```
$ sudo pacman -S nautilus-image-converter
```

For **openSUSE** system:

```
$ sudo zypper install nautilus-image-converter
```

Once installed, restart Nautilus using the command below.

```
$ nautilus -q
```

### How to Use Nautilus Image Converter Plugin?

You have finished the installation. Now if you right click on an image, you will see two new options in the context menu, **“Resize”** and **“Rotate”**.

![][8]

When you select the resize option in the context menu, you will get a pop-up window below with some options for resizing the image.

  * **Select a size:** Select the image size you want to resize. In the drop-down, you will get the following pixels 96×96, 128×128, 640×480, 800×600, 1024×768 or 1280×960.
  * **Scale:** This is the compression level. By default, it comes with 50% and you can change this based on your needs. I recommend using the default value.
  * **Custom size:** This allows you to set any custom size you want to resize the image to.
  * **Append:** By default, it adds “.resized” to the converted image file name, which helps to retain the original image file.
  * **Resize in place:** You can change the behavior above by selecting this option. This option replaces the original image with a modified image.



![][8]

Click the **“Resize”** button to complete the image conversion.

--------------------------------------------------------------------------------

via: https://www.2daygeek.com/how-to-resize-images-with-right-click-on-linux/

作者：[Magesh Maruthamuthu][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.2daygeek.com/author/magesh/
[b]: https://github.com/lujun9972
[1]: https://www.2daygeek.com/resize-convert-images-from-linux-command-line/
[2]: https://www.2daygeek.com/install-development-tools-on-ubuntu-debian-arch-linux-mint-fedora-centos-rhel-opensuse/
[3]: https://www.2daygeek.com/linux-yum-command-examples-manage-packages-rhel-centos-systems/
[4]: https://www.2daygeek.com/linux-dnf-command-examples-manage-packages-fedora-centos-rhel-systems/
[5]: https://www.2daygeek.com/apt-command-examples-manage-packages-debian-ubuntu-systems/
[6]: https://www.2daygeek.com/apt-get-apt-cache-command-examples-manage-packages-debian-ubuntu-systems/
[7]: https://www.2daygeek.com/zypper-command-examples-manage-packages-opensuse-system/
[8]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
