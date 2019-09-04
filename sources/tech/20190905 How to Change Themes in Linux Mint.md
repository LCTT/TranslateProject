[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Change Themes in Linux Mint)
[#]: via: (https://itsfoss.com/install-themes-linux-mint/)
[#]: author: (It's FOSS Community https://itsfoss.com/author/itsfoss/)

How to Change Themes in Linux Mint
======

Using Linux Mint is, from the start, a unique experience for its main Desktop Environment: Cinnamon. This is one of the main [features why I love Linux Mint][1].

Since Mint’s dev team [started to take design more serious][2], “Themes” applet became an important way not only to choose new themes, icons, buttons, window borders and mouse pointers, but also to install new themes directly from it. Interested? Let’s jump into it.

### How to change themes in Linux Mint

Search for themes in the Menu and open the Themes applet.

![Theme Applet provides an easy way of installing and changing themes][3]

At the applet there’s a “Add/Remove” button, pretty simple, huh? And, clicking on it, you and I can see Cinnamon Spices (Cinnamon’s official addons repository) themes ordered first by popularity.

![Installing new themes in Linux Mint Cinnamon][4]

To install one, all it’s needed to do is click on yours preferred one and wait for it to download. After that, the theme will be available at the “Desktop” option on the first page of the applet. Just double click on one of the installed themes to start using it.

![Changing themes in Linux Mint Cinnamon][5]

Here’s the default Linux Mint look:

![Linux Mint Default Theme][6]

And here’s after I change the theme:

![Linux Mint with Carta Theme][7]

All the themes are also available at the Cinnamon Spices site for more information and bigger screenshots so you can take a better look on how your system will look.

[Browse Cinnamon Themes][8]

### Installing third party themes in Linux Mint

_“I saw this amazing theme on another site and it is not available at Cinnamon Spices…”_

Cinnamon Spices has a good collection of themes but you’ll still find that the theme you saw some place else is not available on the official Cinnamon website.

Well, it would be nice if there was another way, huh? You might imagine that there is (I’m mean…obviously there is). So, first things first, there are other websites where you and I can find new cool themes.

I’ll recommend going to Cinnamon Look and browse themes there. If you like something download it.

[Get more themes at Cinnamon Look][9]

After the preferred theme is downloaded, you will have a compressed file now with all you need for the installation. Extract it and save at ~/.themes. Confused? The “~” file path is actually your home folder: /home/{YOURUSER}/.themes.

[][10]

Suggested read  Fix "Failed To Start Session" At Login In Ubuntu 16.04

So go to the your Home directory. Press Ctrl+H to [show hidden files in Linux][11]. If you don’t see a .themes folder, create a new folder and name .themes. Remember that the dot at the beginning of the folder name is important.

Copy the extracted theme folder from your Downloads directory to the .themes folder in your Home.

After that, look for the installed theme at the applet above mentioned.

Note

Remember that the themes must be made to work on Cinnamon, even though it is a fork from GNOME, not all themes made for GNOME works at Cinnamon.

Changing theme is one part of Cinnamon customization. You can also [change the looks of Linux Mint by changing the icons][12].

I hope you now you know how to change themes in Linux Mint. Which theme are you going to use?

### João Gondim

Linux enthusiast from Brasil.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-themes-linux-mint/

作者：[It's FOSS Community][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/itsfoss/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/tiny-features-linux-mint-cinnamon/
[2]: https://itsfoss.com/linux-mint-new-design/
[3]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/install-theme-linux-mint-1.jpg?resize=800%2C625&ssl=1
[4]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2019/09/install-theme-linux-mint-2.jpg?resize=800%2C625&ssl=1
[5]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2019/09/install-theme-linux-mint-3.jpg?resize=800%2C450&ssl=1
[6]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux-mint-default-theme.jpg?resize=800%2C450&ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2019/09/linux-mint-carta-theme.jpg?resize=800%2C450&ssl=1
[8]: https://cinnamon-spices.linuxmint.com/themes
[9]: https://www.cinnamon-look.org/
[10]: https://itsfoss.com/failed-to-start-session-ubuntu-14-04/
[11]: https://itsfoss.com/hide-folders-and-show-hidden-files-in-ubuntu-beginner-trick/
[12]: https://itsfoss.com/install-icon-linux-mint/
