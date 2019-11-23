[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (App Highlight: Flameshot for Taking and Editing Screenshots)
[#]: via: (https://itsfoss.com/flameshot/)
[#]: author: (Ankush Das https://itsfoss.com/author/ankush/)

App Highlight: Flameshot for Taking and Editing Screenshots
======

If you have been following It’s FOSS regularly, you might have come across my coverage on the [best ways to take a screenshot in Linux][1].

![][2]

I did recommend using Flameshot as well because it happens to be my personal favorite to take screenshots. In case you didn’t know, [Flameshot][3] is an open source screenshot tool available for Linux.

However, in this article, I shall be focusing on ‘Flameshot’ to help you install it, configure it, and highlight the features it has to offer.

### Flameshot Features

Flameshot offers almost all the essential features that you would ever require on a screenshot tool in Linux. Here are some of the key features in video format:

[Subscribe to our YouTube channel for more Linux videos][4]

#### Upload screenshot to Imgur

![][5]

A lot of users want to simply upload their screenshots directly to the cloud in order to easily share it with others.

You can do that by syncing your saved files to a cloud storage solution and share them later. But, that’s quite a few steps to follow in order to share your screenshot, right?

So, here, Flameshot lets you upload your image directly to [Imgur][6] with a single click. All you have to do is share the URL.

Do note that these uploads will not be associated with your Imgur account (if you have one) and will be only accessible to the ones with the link.

#### Annotation Options

![][7]

The whole point of having a 3rd party screenshot utility is the ability to annotate the pictures.

You can choose to add an arrow mark, highlight a text, blur a section, add a text, draw something, add a rectangular/circular shaped border, and add a solid color box.

![][8]

You can take a closer look at the options with the help of the GIF above (from their official [GitHub page][9]):

#### Customization Options

![][10]

In addition to all the useful features, it also gives you the ability to customize the UI, filename (when you save a screenshot), and some general options as well.

### Installing Flameshot on Linux

Before configuring Flameshot, you need to get it installed on your Linux system.

You might find it in your Software Center/App Center/Package Manager, simply search for “flameshot” and get it installed.

In case you do not find it there, you can head on to its [GitHub releases page][11] and download the setup file suitable for your Linux distro. It is available in DEB (for Ubuntu), RPM (for Fedora) and AppImage (for all Linux distributions) format.

[Download Flameshot][11]

### How To Setup Flameshot?

Now that you are aware of the features (and probably have it installed), how do you use it?

Of course, you don’t want to launch a screenshot tool by searching for it in the list of applications installed.

So, the best way to access it would be to press the **PRT SC** key, right?

But, by default, when you press the **Print Screen** button, it will launch the default screenshot tool (or directly take a full-screen screenshot).

Fret not, you can easily change it. Here’s how you can set flameshot to launch upon pressing the ‘**Prt Sc**‘ button:

1\. Head to the system settings and navigate your way to the “**Device**” options.

2\. Next, head inside the “**Keyboard Shortcuts**” option.

3\. Now, you need to change the keyboard shortcut for “**Saving a screenshot to Pictures**” from **Prt Sc** to anything else (a button you don’t use frequently).

![Assign a custom keyboard shortcut to Flameshot][12]

Refer to the image above to understand it better.

4\. Once you have done this, scroll down to the bottom and add a new keyboard shortcut by clicking on the “**+**” button.

5\. Here, you will get the option to name the shortcut (it can be anything) and in place of the command, you will have to enter:

```
flameshot gui
```

And, hit the **Prt Sc** button when you set the shortcut. That’s it!

Here’s how it should look after configuration:

![][13]

Now, you should be able to launch Flameshot by pressing the **Prt Sc** button.

### Few Tips To Note

![][14]

  * By default, Flameshot saves the pictures in [PNG][15] format. So, if you need a [JPEG][16] file, you can simply rename the file extension.
  * You can change the color of the text/arrow mark by performing a right-click before adding it. Once you change it, the color remains the same even when you use it the next time. You can change the color again, the same way.
  * If you want the option to choose a custom color (instead of the pre-defined color selection), just hit the **SPACE** **bar** after you select a region to take the screenshot.
  * If you cannot access the Flameshot configuration option via the app drawer, simply type in “**flameshot config**” in the terminal.



**Wrapping Up**

Even though there are alternatives to Flameshot available, I find it to be the best screenshot tool for my usage.

If you found this tutorial helpful, do share it with other Linux users. If you find Flameshot useful, please do consider making a [donation to its developer][17].

In either case, if you already use a screenshot tool, which one is it? Do you know of something that happens to be better than Flameshot? Let me know your thoughts in the comments below.

--------------------------------------------------------------------------------

via: https://itsfoss.com/flameshot/

作者：[Ankush Das][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/ankush/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/take-screenshot-linux/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/11/flameshot.png?ssl=1
[3]: https://flameshot.js.org/
[4]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[5]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/flameshot-cloud-upload-feature.jpg?ssl=1
[6]: https://imgur.com/
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/10/flameshot-options.jpg?ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/flameshot-usage.gif?ssl=1
[9]: https://github.com/lupoDharkael/flameshot
[10]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/flameshot-customization.jpg?ssl=1
[11]: https://github.com/lupoDharkael/flameshot/releases
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/10/keyboard-shortcut-option.jpg?ssl=1
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/flameshot-shortcut-config.jpg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/10/flameshot-tips.jpg?ssl=1
[15]: https://en.wikipedia.org/wiki/Portable_Network_Graphics
[16]: https://en.wikipedia.org/wiki/JPEG
[17]: https://flameshot.js.org/#/
