[#]: collector: (lujun9972)
[#]: translator: (geekpi)
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Change Folder Color in Ubuntu 20.04)
[#]: via: (https://itsfoss.com/folder-color-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Change Folder Color in Ubuntu 20.04
======

The default Yaru theme in [Ubuntu 20.04][1] gives it a polished, modern look. The folders in the default Yaru theme have a purple-aubergine touch to keep in line with the branding of Ubuntu.

If you are not a fan of the purple shade, you have the freedom to change the color theme in Ubuntu.

You may change the theme of Ubuntu to give it a different color but that would mean ditching Yaru theme.

If you just want to change the folder color in Ubuntu 20.04, there are two ways to do that:

  * Give a different color and emblem to selected folders (for better organizing the files and folders)
  * Change the colors for all folders by changing the Yaru color theme



Let me show you both methods.

### Change folder colors and emblem for selected files and folders

![][2]

I know that some people keep their folders in different color/location to indicate whether a work is in progress or pending or completed.

If you are one of those people, you can use the [Folder Color utility][3] and change the color of the folders. You may also add emblem to the folders (the green tick sign for competition, + sign for new, exclamation mark for important etc). You can see some examples in the previous image.

You can also use the Folder Color utility on files. You cannot change the color files icons but you can add emblems to them.

If you are [using Yaru theme][4] in Ubuntu 20.04, you can use the [official PPA][5]:

```
sudo add-apt-repository ppa:costales/yaru-colors-folder-color
```

Now install Folder Color with Yaru compatibility package.

```
sudo apt install folder-color yaru-colors-folder-color
```

Once installed, you’ll have to restart Nautilus file manager using **nautilus -q** command. After that, you can go to the file manager, right click on a folder or file. You’ll see a Folder’s Color option in the context menu. You’ll see the color and emblem options here.

![][6]

You can also **restore the original folder color by choosing Default** in the menu.

For Ubuntu 18.04 or older versions, Folder Color is available to install from the software center. The Folder Color utility is also available for Linux Mint/Cinnamon desktop’s Nemo file manager and MATE desktop’s [Caja file manager][7].

How to remove Folder Color tool?

If you don’t want to use Folder Color, you may remove the app and delete the PPA. First remove the app:

```
sudo apt remove folder-color yaru-colors-folder-color
```

Now [remove the PPA][8]:

```
sudo add-apt-repository -r ppa:costales/yaru-colors-folder-color
```

### Yaru Colors theme pack to change the color variant of Yaru theme

![Yaru Colors Blue Theme Variant][9]

If you want to keep on using Yaru theme but with a different color variant, [Yaru Colors theme pack][10] is what you need.

Yaru Colors consists of 12 color variants of Yaru. The colors are aqua, blue, brown, deep blue, green, grey, MATE green, orange, pink, purple, red and yellow.

The themes consist of GTK theme, icons, cursor them and GNOME shell theme.

  * Icons- Changes the accent color of folders
  * GTK themes- Changes the accent color of the application windows
  * cursor theme- Adds an almost negligible colored outline to the cursor
  * GNOME Shell theme- Changes the accent color in the message tray and system tray



You can download Yaru Colors theme pack from its GitHub repository:

Download Yaru Colors theme pack

When you extract the content you’ll find icons, Themes folders and both of these folders contains the twelve mentioned color variants. You can copy the icons and Themes folder in ~/.local/share/.icons and ~/.local/share/themes folders respectively.

If you are not comfortable doing it all by yourself, you’ll find the install.sh shell script in the extract folder. You can run it to install all or selected few themes via an interactive terminal session.

![][11]

To change the GNOME Shell theme, you’ll have to [use GNOME Tweak tool][12]. You may also use GNOME Tweak to change the icons and themes back to the default ones.

![][13]

Enjoy adding color to your Ubuntu life :)

--------------------------------------------------------------------------------

via: https://itsfoss.com/folder-color-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/download-ubuntu-20-04/
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/06/folder-colors-yaru-ubuntu.png?ssl=1
[3]: https://foldercolor.tuxfamily.org/
[4]: https://itsfoss.com/ubuntu-community-theme/
[5]: https://launchpad.net/folder-color
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/change-folder-color-ubuntu.png?ssl=1
[7]: https://github.com/mate-desktop/caja
[8]: https://itsfoss.com/how-to-remove-or-delete-ppas-quick-tip/
[9]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/yaru-colors-blue-theme-variant.jpg?ssl=1
[10]: https://github.com/Jannomag/Yaru-Colors
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/06/yaru-colors-theme-install.png?resize=800%2C513&ssl=1
[12]: https://itsfoss.com/gnome-tweak-tool/
[13]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/06/restore-yaru-gnome-tweak.png?resize=800%2C557&ssl=1
