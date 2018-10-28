FSSlc translating

A Cross-platform High-quality GIF Encoder
======

![](https://www.ostechnix.com/wp-content/uploads/2018/09/gifski-720x340.png)

As a content writer, I needed to add images in my articles. Sometimes, it is better to add videos or gif images to explain the concept a bit easier. The readers can easily understand the guide much better by watching the output in video or gif format than the text. The day before, I have written about [**Flameshot**][1], a feature-rich and powerful screenshot tool for Linux. Today, I will show you how to make high quality gif images either from a video or set of images. Meet **Gifski** , a cross-platform, open source, command line High-quality GIF encoder based on **Pngquant**.

For those wondering, pngquant is a command line lossy PNG image compressor. Trust me, pngquant is one of the best loss-less PNG compressor that I ever use. It compresses PNG images **upto 70%** without losing the original quality and and preserves full alpha transparency. The compressed images are compatible with all web browsers and operating systems. Since Gifski is based on Pngquant, it uses pngquant’s features for creating efficient GIF animations. Gifski is capable of creating animated GIFs that use thousands of colors per frame. Gifski is also requires **ffmpeg** to convert video into PNG images.

### **Installing Gifski**

Make sure you have installed FFMpeg and Pngquant.

FFmpeg is available in the default repositories of most Linux distributions, so you can install it using the default package manager. For installation instructions, refer the following guide.

Pngquant is available in [**AUR**][2]. To install it in Arch-based systems, use any AUR helper programs like [**Yay**][3].
```
$ yay -S pngquant

```

On Debian-based systems, run:
```
$ sudo apt install pngquant

```

If pngquant is not available for your distro, compile and install it from source. You will need **`libpng-dev`** package installed with development headers.
```
$ git clone --recursive https://github.com/kornelski/pngquant.git

$ make

$ sudo make install

```

After installing the prerequisites, install Gifski. You can install it using **cargo** if you have installed [**Rust**][4] programming language.
```
$ cargo install gifski

```

You can also get it with [**Linuxbrew**][5] package manager.
```
$ brew install gifski

```

If you don’t want to install cargo or Linuxbrew, download the latest binary executables from [**releases page**][6] and compile and install gifski manually.

### Create high-quality GIF animations using Gifski high-quality GIF encoder

Go to the location where you have kept the PNG images and run the following command to create GIF animation from the set of images:
```
$ gifski -o file.gif *.png

```

Here file.gif is the final output gif animation.

Gifski has also some other additional features, like;

  * Create GIF animation with specific dimension
  * Show specific number of animations per second
  * Encode with a specific quality
  * Encode faster
  * Encode images exactly in the order given, rather than sorted



To create GIF animation with specific dimension, for example width=800 and height=400, use the following command:
```
$ gifski -o file.gif -W 800 -H 400 *.png

```

You can set how many number of animation frames per second you want in the gif animation. The default value is **20**. To do so, run:
```
$ gifski -o file.gif --fps 1 *.png

```

In the above example, I have used one animation frame per second.

We can encode with specific quality on the scale of 1-100. Obviously, the lower quality may give smaller file and higher quality give bigger seize gif animation.
```
$ gifski -o file.gif --quality 50 *.png

```

Gifski will take more time when you encode large number of images. To make the encoding process 3 times faster than usual speed, run:
```
$ gifski -o file.gif --fast *.png

```

Please note that it will reduce quality to 10% and create bigger animation file.

To encode images exactly in the order given (rather than sorted), use **`--nosort`** option.
```
$ gifski -o file.gif --nosort *.png

```

If you do not to loop the GIF, simple use **`--once`** option.
```
$ gifski -o file.gif --once *.png

```

**Create GIF animation from Video file**

Some times you might want to an animated file from a video. It is also possible. This is where FFmpeg comes in help. First convert the video into PNG frames first like below.
```
$ ffmpeg -i video.mp4 frame%04d.png

```

The above command makes image files namely “frame0001.png”, “frame0002.png”, “frame0003.png”…, etc. from video.mp4 (%04d makes the frame number) and save them in the current working directory.

After converting the image files, simply run the following command to make the animated GIF file.
```
$ gifski -o file.gif *.png

```

For more details, refer the help section.
```
$ gifski -h

```

Here is the sample animated file created using Gifski.

As you can see, the quality of the GIF file is really great.

And, that’s all for now. Hope this was useful. More good stuffs to come. Stay tuned!

Cheers!


--------------------------------------------------------------------------------

via: https://www.ostechnix.com/gifski-a-cross-platform-high-quality-gif-encoder/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.ostechnix.com/author/sk/
[1]: https://www.ostechnix.com/flameshot-a-simple-yet-powerful-feature-rich-screenshot-tool/
[2]: https://aur.archlinux.org/packages/pngquant/
[3]: https://www.ostechnix.com/yay-found-yet-another-reliable-aur-helper/
[4]: https://www.ostechnix.com/install-rust-programming-language-in-linux/
[5]: https://www.ostechnix.com/linuxbrew-common-package-manager-linux-mac-os-x/
[6]: https://github.com/ImageOptim/gifski/releases
