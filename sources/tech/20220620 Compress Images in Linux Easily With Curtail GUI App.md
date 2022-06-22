[#]: subject: "Compress Images in Linux Easily With Curtail GUI App"
[#]: via: "https://itsfoss.com/curtail-image-compress/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Compress Images in Linux Easily With Curtail GUI App
======

Got a bunch of images with huge file sizes taking too much disk space? Or perhaps you have to upload an image to a web portal that has file size restrictions?

There could be a number of reasons why you would want to compress images. There are tons of tools to help you with it and I am not talking about the command line ones here.

You can use a full-fledged image editor like GIMP. You may also use web tools like [Squoosh][1], an open source project from Google. It even lets you compare the files for each compression level.

However, all these tools work on individual images. What if you want to bulk compress photos? Curtail is an app that saves your day.

### Curtail: Nifty tool for image compression in Linux

Built with Python and GTK3, Curtail is a simple GUI app that uses open source libraries like OptiPNG, [jpegoptim][2], etc to provide the image compression feature.

It is available as a [Flatpak application][3]. Please make sure that you have [Flatpak support enabled on your system][4].

Add the Flathub repo first:

```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

And then use the command below to install Curtail:

```
flatpak install flathub com.github.huluti.Curtail
```

Once installed, look for it in your Linux system’s menu and start it from there.

![curtail app][5]

The interface is plain and simple. You can choose whether you want a lossless or lossy compression.

The lossy compression will have poor-quality images but with a smaller size. The lossless compression will have better quality but the size may not be much smaller than the original.

![curtail app interface][6]

You can either browse for images or drag and drop them into the application.

Yes. You can compress multiple images in one click with Curtail.

In fact, you don’t even need a click. As soon as you select the images or drop them, they are compressed and you see a summary of the compression process.

![curtail image compression summary][7]

As you can see in the image above, I got a 35% size reduction for one image and 3 and 8 percent for the other two. This was with lossless compression.

The images are saved with a -min suffix (by default), in the same directory as the original image.

Though it looks minimalist, there are a few options to configure Curtail. Click on the hamburger menu and you are presented with a few settings options.

![curtail configuration options][8]

You can select whether you want to save the compressed file as new or replace the existing one. If you go for a new file (default behavior), you can also provide a different suffix for the compressed images. The option to keep the file attributes is also there.

In the next tab, you can configure the settings for lossy compression. By default, the compression level is at 90%.

![curtail compression options][9]

The Advanced tab gives you the option to configure the lossless compression level for PNG and WebP files.

![curtain advanced options][10]

### Conclusion

As I stated earlier, it’s not a groundbreaking tool. You can do the same with other tools like GIMP. It just makes the task of image compression simpler, especially for bulk image compression.

I would love to see the option to [convert the image file formats][11] with the compression like what we have in tools like Converseen.

Overall, a good little utility for the specific purpose of image compression.

--------------------------------------------------------------------------------

via: https://itsfoss.com/curtail-image-compress/

作者：[Abhishek Prakash][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lkxed
[1]: https://squoosh.app/
[2]: https://github.com/tjko/jpegoptim
[3]: https://itsfoss.com/what-is-flatpak/
[4]: https://itsfoss.com/flatpak-guide/
[5]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-app.png
[6]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-app-interface.png
[7]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-image-compression-summary.png
[8]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-configuration-options.png
[9]: https://itsfoss.com/wp-content/uploads/2022/06/curtail-compression-options.png
[10]: https://itsfoss.com/wp-content/uploads/2022/06/curtain-advanced-options.png
[11]: https://itsfoss.com/converseen/
