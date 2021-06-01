[#]: subject: (Convert Images to ASCII Art in Linux Terminal With This Nifty Little Tool)
[#]: via: (https://itsfoss.com/ascii-image-converter/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)
[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )

Convert Images to ASCII Art in Linux Terminal With This Nifty Little Tool
======

Want to do some fun stuff in the Linux terminal? How about converting a regular image into an ASCII art?

You know [what’s ASCII][1]? It’s a standard that assigns letters, numbers and other characters in the 256 slots available in the 8-bit code. The ASCII art is a graphics composed of the printable ASCII characters. Basically, it is composed of a bunch of letters, numbers and special characters.

You might have seen people [displaying their distribution’s logo in ASCII format][2] like this:

![][3]

That’s cool, right? How about converting a normal picture into ASCII art? That’s what you are going to explore in this article.

### Ascii Image Converter

As the name suggests, [Ascii Image Converter][4] is a tool that converts an image into ASCII art. It is a command line based tool written in Go and it prints the ASCII version of the image supplied to it.

You probably won’t recognize me, but that’s me in ASCII in the image below. That’s my 8-bit avatar.

![][5]

The tool supports input images in the following format:

  * JPEG/JPG
  * PNG
  * BMP
  * WEBP
  * TIFF/TIF



Let’s see about installing and using it.

### Installing Ascii Image Converter on Linux

This nifty tool is also available on Windows but I am not going that way. Let’s stick to Linux in this tutorial.

If you have [Snap enabled in your distribution][6], you can easily install its snap package using the following command:

```
sudo snap install ascii-image-converter
```

You may also download the Linux executable file from its release page and put the executable in the /usr/local/bin/ directory. This way, you’ll be able to run it like a regular Linux command. If you wonder why so, please learn about [Linux directory hierarchy][7].

### Using Ascii Image Converter

The usage is simple. Once installed, you just have to provide the path of the image you want to convert.

```
ascii-image-converter path_to_image
```

You may also provide the URL of the image to convert an image into ASCII directly from the web.

Here is my profile picture converted into ASCII. I have put my original photo for the reference.

![][8]

You may also have a colored ASCII conversion.

```
ascii-image-converter -C path_to_image
```

![][9]

You may convert multiple images into ASCII by providing their paths. It will print the ASCII version one after another on the terminal display.

There is an option to save the generated ASCII art but as a text file, not as an image. The command below will save the ASCII art by adding “-ascii-art.txt” to the image name in the directory path passed to the flag.

```
ascii-image-converter path_to_image -s .
```

There are a few more options available such as giving the output a specific dimension, use more ASCII characters, or use your own set of characters for printing the ASCII art. You can read about it on the [project’s repository][4].

### Like it?

Do you like more ASCII stuff? How about [playing ASCII games on Linux][10]? Yes, you can totally do that.

If you like experimenting in the terminal, you may like this tool. Though I wonder what could be a good practical use of an ASCII converted image. Any ideas?

--------------------------------------------------------------------------------

via: https://itsfoss.com/ascii-image-converter/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://www.computerhope.com/jargon/a/ascii.htm
[2]: https://itsfoss.com/display-linux-logo-in-ascii/
[3]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/ubuntu-mate-focal-neofetch.png?resize=800%2C543&ssl=1
[4]: https://github.com/TheZoraiz/ascii-image-converter
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/abhishek-prakash-in-ascii.png?resize=800%2C445&ssl=1
[6]: https://itsfoss.com/enable-snap-support-linux-mint/
[7]: https://linuxhandbook.com/linux-directory-structure/
[8]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/05/abhishek-prakash-ascii-converted.png?resize=800%2C437&ssl=1
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/05/abhishek-colored-ascii.png?resize=800%2C429&ssl=1
[10]: https://itsfoss.com/best-ascii-games/
