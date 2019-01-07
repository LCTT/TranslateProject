[#]: collector: (lujun9972)
[#]: translator: ( WangYueScream)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How To Display Thumbnail Images In Terminal)
[#]: via: (https://www.ostechnix.com/how-to-display-thumbnail-images-in-terminal/)
[#]: author: (SK https://www.ostechnix.com/author/sk/)

How To Display Thumbnail Images In Terminal
======
![](https://www.ostechnix.com/wp-content/uploads/2019/01/lsix-720x340.png)

A while ago, we discussed about [**Fim**][1], a lightweight, CLI image viewer application used to display various type of images, such as bmp, gif, jpeg, and png etc., from command line. Today, I stumbled upon a similar utility named **‘lsix’**. It is like ‘ls’ command in Unix-like systems, but for images only. The lsix is a simple CLI utility designed to display thumbnail images in Terminal using **Sixel** graphics. For those wondering, Sixel, short for six pixels, is a type of bitmap graphics format. It uses **ImageMagick** , so almost all file formats supported by imagemagick will work fine.

### Features

Concerning the features of lsix, we can list the following:

  * Automatically detects if your Terminal supports Sixel graphics or not. If your Terminal doesn’t support Sixel, it will notify you to enable it.
  * Automatically detects the terminal background color. It uses terminal escape sequences to try to figure out the foreground and background colors of your Terminal application and will display the thumbnails clearly.
  * If there are more images in the directory, usually >21, lsix will display those images one row a a time, so you need not to wait for the entire montage to be created.
  * Works well over SSH, so you can manipulate images stored on your remote web server without much hassle.
  * It supports Non-bitmap graphics, such as.svg, .eps, .pdf, .xcf etc.
  * Written in BASH, so works on almost all Linux distros.



### Installing lsix

Since lsix uses ImageMagick, make sure you have installed it. It is available in the default repositories of most Linux distributions. For example, on Arch Linux and its variants like Antergos, Manjaro Linux, ImageMagick can be installed using command:

```
$ sudo pacman -S imagemagick
```

On Debian, Ubuntu, Linux Mint:

```
$ sudo apt-get install imagemagick
```

lsix doesn’t require any installation as it is just a BASH script. Just download it and move it to your $PATH. It’s that simple.

Download the latest lsix version from project’s github page. I am going to download the lsix archive file using command:

```
$ wget https://github.com/hackerb9/lsix/archive/master.zip
```

Extract the downloaded zip file:

```
$ unzip master.zip
```

This command will extract all contents into a folder named ‘lsix-master’. Copy the lsix binary from this directory to your $PATH, for example /usr/local/bin/.

```
$ sudo cp lsix-master/lsix /usr/local/bin/
```

Finally, make the lsbix binary executable:

```
$ sudo chmod +x /usr/local/bin/lsix
```

That’s it. Now is the time to display thumbnails in the terminal itself.

Before start using lsix, **make sure your Terminal supports Sixel graphics**.

The developer has developed lsix on an Xterm in **vt340 emulation mode**. However, the he claims that lsix should work on any Sixel compatible Terminal.

Xterm supports Sixel graphics, but it isn’t enabled by default.

You can launch Xterm with Sixel mode enabled using command (from another Terminal):

```
$ xterm -ti vt340
```

Alternatively, you can make vt340 the default terminal type for Xterm as described below.

Edit **.Xresources** file (If it not available, just create it):

```
$ vi .Xresources
```

Add the following line:

```
xterm*decTerminalID    :   vt340
```

Press **ESC** and type **:wq** to save and close the file.

Finally, run the following command to apply the changes:

```
$ xrdb -merge .Xresources
```

Now Xterm will start with Sixel mode enabled at every launch by default.

### Display Thumbnail Images In Terminal

Launch Xterm (Don’t forget to start it with vt340 mode). Here is how Xterm looks like in my system.
![](https://www.ostechnix.com/wp-content/uploads/2019/01/xterm-1.png)

Like I already stated, lsix is very simple utility. It doesn’t have any command line flags or configuration files. All you have to do is just pass the path of your file as an argument like below.

```
$ lsix ostechnix/logo.png
```

![](https://www.ostechnix.com/wp-content/uploads/2019/01/lsix-4.png)

If you run it without path, it will display the thumbnail images in your current working directory. I have few files in a directory named **ostechnix**.

To display the thumbnails in this directory, just run:

```
$ lsix
```

![](https://www.ostechnix.com/wp-content/uploads/2019/01/lsix-1.png)

See? The thumbnails of all files are displayed in the terminal itself.

If you use ‘ls’ command, you would just see the filenames only, not thumbnails.

![][3]

You can also display a specific image or group of images of a specific type using wildcards.

For example, to display a single image, just mention the full path of the image like below.

```
$ lsix girl.jpg
```

![](https://www.ostechnix.com/wp-content/uploads/2019/01/lsix-2.png)

To display all images of a specific type, say PNG, use the wildcard character like below.

```
$ lsix *.png
```

![][4]

For JPEG type images, the command would be:

```
$ lsix *jpg
```

The thumbnail image quality is surprisingly good. I thought lsix would just display blurry thumbnails. I was wrong. The thumbnails are clearly visible just like on the graphical image viewers.

And, that’s all for now. As you can see, lsix is very similar to ‘ls’ command, but it only for displaying thumbnails. If you deal with a lot of images at work, lsix might be quite handy. Give it a try and let us know your thoughts on this utility in the comment section below. If you know any similar tools, please suggest them as well. I will check and update this guide.

More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/how-to-display-thumbnail-images-in-terminal/

作者：[SK][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[b]: https://github.com/lujun9972
[1]: https://www.ostechnix.com/how-to-display-images-in-the-terminal/
[2]: data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[3]: http://www.ostechnix.com/wp-content/uploads/2019/01/ls-command-1.png
[4]: http://www.ostechnix.com/wp-content/uploads/2019/01/lsix-3.png
