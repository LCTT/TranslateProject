[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to install Microsoft TrueType Fonts on Ubuntu-based Distributions)
[#]: via: (https://itsfoss.com/install-microsoft-fonts-ubuntu/)
[#]: author: (Community https://itsfoss.com/author/itsfoss/)

How to install Microsoft TrueType Fonts on Ubuntu-based Distributions
======

If you open some Microsoft documents in LibreOffice on Linux, you’ll notice that the fonts look a bit different. You’ll also notice that you cannot find common fonts like [Times New Roman][1], Arial etc.

Don’t worry. I’ll show you how to install these fonts in Ubuntu and other Ubuntu-based Linux distributions. But before that, let me tell you why these fonts are not available by default.

### Why Microsoft fonts are not installed by default in Linux?

![][2]

Times New Roman, Arial and other such fonts are owned by Microsoft and they are not open source. Many Linux distributions don’t provide proprietary software by default to avoid licensing issue.

This is why Ubuntu and other Linux distributions use an open source fonts “Liberation fonts” to substitute Microsoft fonts by default. The [Liberation Fonts][3] were created by [Red Hat][4] to substitute Arial, Arial Narrow, Times New Roman and Courier New as their width is the same. When you open a document written in Times New Roman, the equivalent Liberation Font will be used to keep the document uninterrupted.

However Liberation fonts are not identical to Microsoft’s fonts and in some cases you may need to use Arial or Times New Roman. A very common scenario is that Microsoft’s fonts are the only option is in schools, universities and other public and private organizations. They require you to submit the documents in one of those fonts.

Good thing is that you can install the Microsoft fonts on Ubuntu and other distributions easily. This way, you will be able to increase compatibility of LibreOffice and have the freedom to choose an open source office software.

### Installing Microsoft fonts on Ubuntu-based Linux distributions

You can [install new fonts in Ubuntu][5] by downloading them on your own. But since Microsoft fonts are very popular (and is provided free of cost), Ubuntu provides an easy way of installing it.

Be aware that despite Microsoft has released its core fonts for free of charge, the usage of the fonts is restricted in other operating systems. You’ll have to read and accept EULA (End User License Agreement) before installing Microsoft fonts in Ubuntu.

These fonts are [available in the multiverse repositories so make sure to enable it][6] first:

```
sudo add-apt-repository multiverse
```

After that, you can update your Ubuntu repository cache and install the Microsoft fonts like this:

```
sudo apt update && sudo apt install ttf-mscorefonts-installer
```

Press tab to select **OK** and the press enter when the Microsoft’s End user agreement appears.

![Press tab to highlight the selection][7]

Click **Yes** to accept the Microsoft’s agreement:

![Use tab key to make a selection and then press enter][8]

When the installation is done, you should update the font cache using the command below:

```
sudo fc-cache -f -v
```

![][9]

If you open the LibreOffice now, you’ll see the Microsoft [TrueType fonts][10].

![][11]

In case that you accidentally reject the license agreement, you can reinstall the installer with this command:

```
sudo apt install –reinstall ttf-mscorefonts-installer
```

Microsoft TrueType fonts are also available via the [Ubuntu Restricted Extras package][12] that contains other proprietary media codecs to play files like MP3 etc.

Don’t underestimate proprietary fonts

You may think what’s the big deal with fonts? After all, it’s just a font, not a crucial piece of software, right?
But did you know that for years, [Netflix paid millions of dollars for the proprietary font][13] it used? At the end, they created their own custom fonts and that saved them a considerable amount of money.

I hope you find this quick tutorial useful. More productivity tutorials are down the line, leave your comments below and subscribe to our social media for more!

![][14]

### Dimitrios Savvopoulos

Dimitrios is an MSc Mechanical Engineer but a Linux enthusiast in heart. He is well settled in Solus OS but curiosity drives him to constantly test other distros. Challenge is part of his personality and his hobby is to compete from 5k to the marathon distance.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-microsoft-fonts-ubuntu/

作者：[Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://en.wikipedia.org/wiki/Times_New_Roman
[2]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/03/microsoft-fonts-ubuntu.png?ssl=1
[3]: https://en.wikipedia.org/wiki/Liberation_fonts
[4]: https://en.wikipedia.org/wiki/Red_Hat
[5]: https://itsfoss.com/install-fonts-ubuntu/
[6]: https://itsfoss.com/ubuntu-repositories/
[7]: https://i1.wp.com/i.imgur.com/JoEJp5w.png?ssl=1
[8]: https://i0.wp.com/i.imgur.com/M8zTc7f.png?ssl=1
[9]: https://i0.wp.com/i.imgur.com/Cshle6S.png?ssl=1
[10]: https://en.wikipedia.org/wiki/TrueType
[11]: https://i1.wp.com/i.imgur.com/9oIu3oj.png?ssl=1
[12]: https://itsfoss.com/install-media-codecs-ubuntu/
[13]: https://thehustle.co/nextflix-sans-custom-font/
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/03/Dimitrios.jpg?ssl=1
