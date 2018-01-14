Multimedia Apps for the Linux Console
======

![](https://www.linux.com/sites/lcom/files/styles/rendered_file/public/multimedia.jpg?itok=v-XrnKRB)
The Linux console supports multimedia, so you can enjoy music, movies, photos, and even read PDF files.

When last we met, we learned that the Linux console supports multimedia. Yes, really! You can enjoy music, movies, photos, and even read PDF files without being in an X session with MPlayer, fbi, and fbgs. And, as a bonus, you can enjoy a Matrix-style screensaver for the console, CMatrix.

You will probably have make some tweaks to your system to make this work. The examples used here are for Ubuntu Linux 16.04.

### MPlayer

You're probably familiar with the amazing and versatile MPlayer, which supports almost every video and audio format, and runs on nearly everything, including Linux, Android, Windows, Mac, Kindle, OS/2, and AmigaOS. Using MPLayer in your console will probably require some tweaking, depending on your Linux distribution. To start, try playing a video:
```
$ mplayer [video name]

```

If it works, then hurrah, and you can invest your time in learning useful MPlayer options, such as controlling the size of the video screen. However, some Linux distributions are managing the framebuffer differently than in the olden days, and you may have to adjust some settings to make it work. This is how to make it work on recent Ubuntu releases.

First, add yourself to the video group.

Second, verify that `/etc/modprobe.d/blacklist-framebuffer.conf` has this line: `#blacklist vesafb`. It should already be commented out, and if it isn't then comment it. All the other module lines should be un-commented, which prevents them from loading. Side note: if you want to dig more deeply into managing your framebuffer, the module for your video card may give better performance.

Add these two modules to the end of `/etc/initramfs-tools/modules`, `vesafb` and `fbcon`, then rebuild the initramfs image:
```
$ sudo nano /etc/initramfs-tools/modules
 # List of modules that you want to include in your initramfs.
 # They will be loaded at boot time in the order below.
 fbcon
 vesafb

$ sudo update-initramfs -u

```

[fbcon][1] is the Linux framebuffer console. It runs on top of the framebuffer and adds graphical features. It requires a framebuffer device, which is supplied by the `vesafb` module.

Now you must edit your GRUB2 configuration. In `/etc/default/grub` you should see a line like this:
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

```

It may have some other options, but it should be there. Add `vga=789`:
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash vga=789"

```

Reboot and enter your console (Ctrl+Alt+F1), and try playing a video. This command selects the `fbdev2` video device; I haven't learned yet how to know which one to use, but I had to use it to play the video. The default screen size is 320x240, so I scaled it to 960:
```
$ mplayer -vo fbdev2 -vf scale -zoom -xy 960 AlienSong_mp4.mov
```

And behold Figure 1. It's grainy because I have a low-fi copy of this video, not because MPlayer is making it grainy.

MPLayer plays CDs, DVDs, network streams, and has a giant batch of playback options, which I shall leave as your homework to explore.

### fbi Image Viewer

`fbi`, the framebuffer image viewer, comes in the [fbida][2] package on most Linuxes. It has native support for the common image file formats, and uses `convert` (from Image Magick), if it is installed, for other formats. Its simplest use is to view a single image file:
```
$ fbi filename

```

Use the arrow keys to scroll a large image, + and - to zoom, and r and l to rotate 90 degress right and left. Press the Escape key to close the image. You can play a slideshow by giving `fbi` a list of files:
```
$ fbi --list file-list.txt

```

`fbi` supports autozoom. With `-a` `fbi` controls the zoom factor. `--autoup` and `--autodown` tell `fbi` to only zoom up or down. Control the blend time between images with `--blend [time]`, in milliseconds. Press the k and j keys to jump behind and ahead in your file list.

`fbi` has commands for creating file lists from images you have viewed, and for exporting your commands to a file, and a host of other cool options. Check out `man fbi` for complete options.

### CMatrix Console Screensaver

The Matrix screensaver is still my favorite (Figure 2), second only to the bouncing cow. [CMatrix][3] runs on the console. Simply type `cmatrix` to start it, and Ctrl+C stops it. Run `cmatrix -s` to launch it in screensaver mode, which exits on any keypress. `-C` changes the color. Your choices are green, red, blue, yellow, white, magenta, cyan, and black.

CMatrix supports asynchronous key presses, which means you can change options while it's running.

`-B` is all bold text, and `-B` is partially bold.

### fbgs PDF Viewer

It seems that the addiction to PDF documents is pandemic and incurable, though PDFs are better than they used to be, with live hyperlinks, copy-paste, and good text search. The `fbgs` console PDF viewer is part of the `fbida` package. Options include page size, resolution, page selections, and most `fbi` options, with the exceptions listed in `man fbgs`. The main option I use is page size; you get `-l`, `xl`, and `xxl` to choose from:
```
$ fbgs -xl annoyingpdf.pdf

```

Learn more about Linux through the free ["Introduction to Linux" ][4]course from The Linux Foundation and edX.

--------------------------------------------------------------------------------

via: https://www.linux.com/learn/intro-to-linux/2018/1/multimedia-apps-linux-console

作者：[Carla Schroder][a]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.linux.com/users/cschroder
[1]:https://www.mjmwired.net/kernel/Documentation/fb/fbcon.txt
[2]:https://www.kraxel.org/blog/linux/fbida/
[3]:http://www.asty.org/cmatrix/
[4]:https://training.linuxfoundation.org/linux-courses/system-administration-training/introduction-to-linux
