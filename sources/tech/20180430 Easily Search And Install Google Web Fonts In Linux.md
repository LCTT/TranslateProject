Easily Search And Install Google Web Fonts In Linux
======

![](https://www.ostechnix.com/wp-content/uploads/2018/04/Font-Finder-720x340.png)
**Font Finder** is the Rust implementation of good old [**Typecatcher**][1], which is used to easily search and install Google web fonts from [**Google’s font archive**][2]. It helps you to install hundreds of free and open source fonts in your Linux desktop. In case you’re looking for beautiful fonts for your web projects and apps and whatever else, Font Finder can easily get them for you. It is free, open source GTK3 application written in Rust programming language. Unlike Typecatcher, which is written using Python, Font Finder can filter fonts by their categories, has zero Python runtime dependencies, and has much better performance and resource consumption.

In this brief tutorial, we are going to see how to install and use Font Finder in Linux.

### Install Font Finder

Since Fond Finder is written using Rust programming language, you need to install Rust in your system as described below.

After installing Rust, run the following command to install Font Finder:
```
$ cargo install fontfinder

```

Font Finder is also available as [**flatpak app**][3]. First install Flatpak in your system as described in the link below.

Then, install Font Finder using command:
```
$ flatpak install flathub io.github.mmstick.FontFinder

```

### Search And Install Google Web Fonts In Linux Using Font Finder

You can launch font finder either from the application launcher or run the following command to launch it.
```
$ flatpak run io.github.mmstick.FontFinder

```

This is how Font Finder default interface looks like.

![][5]

As you can see, Font Finder user interface is very simple. All Google web fonts are listed in the left pane and the preview of the respective font is given at the right pane. You can type any words in the preview box to view how the words will look like in the selected font. There is also a search box on the top left which allows you to quickly search for a font of your choice.

By default, Font Finder displays all type of fonts. You can, however, display the fonts by category-wise from the category drop-down box above the the search box.

![][6]

To install a font, just choose it and click the **Install** button on the top.

![][7]

You can test the newly installed fonts in any text processing applications.

![][8]

Similarly, to remove a font, just choose it from the Font Finder dashboard and click the **Uninstall** button. It’s that simple!

The Settings button (the gear button) on the top left corner provides the option to switch to dark preview.

![][9]

As you can see, Font Finder is very simple and does the job exactly as advertised in its home page. If you’re looking for an application to install Google web fonts, Font Finder is one such application.

And, that’s all for now. Hope this helps. More good stuffs to come. Stay tuned!

Cheers!



--------------------------------------------------------------------------------

via: https://www.ostechnix.com/font-finder-easily-search-and-install-google-web-fonts-in-linux/

作者：[SK][a]
选题：[lujun9972](https://github.com/lujun9972)
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]:https://www.ostechnix.com/author/sk/
[1]:https://www.ostechnix.com/install-google-web-fonts-ubuntu/
[2]:https://fonts.google.com/
[3]:https://flathub.org/apps/details/io.github.mmstick.FontFinder
[4]:data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///yH5BAEAAAAALAAAAAABAAEAAAIBRAA7
[5]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-1.png
[6]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-2.png
[7]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-3.png
[8]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-5.png
[9]:http://www.ostechnix.com/wp-content/uploads/2018/04/font-finder-4.png
