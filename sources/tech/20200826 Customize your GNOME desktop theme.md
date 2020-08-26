[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Customize your GNOME desktop theme)
[#]: via: (https://opensource.com/article/20/8/gnome-themes)
[#]: author: (Alan Formy-Duval https://opensource.com/users/alanfdoss)

Customize your GNOME desktop theme
======
Use Tweaks and its user themes extension to change the look of your
Linux UI.
![Gnomes in a window.][1]

GNOME is a fairly simple and streamlined Linux graphical user interface (GUI), and a lot of users appreciate its minimalist look. Although it's pretty basic out of the box, you can customize [GNOME][2] to match your preferences. Thanks to GNOME Tweaks and the user themes extension, you can change the look and feel of the top bar, window title bars, icons, cursors, and many other UI options.

### Get started

Before you can change your GNOME theme, you have to install [Tweaks][3] and enable the user themes extension.

#### Install GNOME Tweaks

You can find Tweaks in the GNOME Software Center, where you can install it quickly with just the click of a button.

![Install Tweaks in Software Center][4]

(Alan Formy-Duval, [CC BY-SA 4.0][5])

If you prefer the command line, use your package manager. For instance, on Fedora or CentOS:


```
`$ sudo dnf install gnome-tweaks`
```

On Debian or similar:


```
`$ sudo apt install gnome-tweaks`
```

#### Enable user themes

To enable the user themes extension, launch Tweaks and select **Extensions**. Find **User themes** and click the slider to enable it.

![Enable User Themes Extension][6]

(Alan Formy-Duval, [CC BY-SA 4.0][5])

### Get a theme

Now that you've completed those prerequisites, you're ready to find and download some themes. A great site to find new themes is [GNOME-Look.org][7].

There's a list of theme categories on the left-hand side of the page. Once you find a theme you want, you need to download it. I downloaded the `.tar` file directly to the `.themes` directory under my home directory (you may need to create the directory first):


```
`$ mkdir ~/.themes`
```

If you want all the machine's users to be able to use the theme, place it in `/usr/share/themes`.


```
`$ tar xvf theme_archive.tar.xz`
```

Once you have downloaded the file, extract the archive. You can delete the `.tar.xz` file to save some disk space.

### Apply a theme

To apply your new theme, go to the **Appearance** section in Tweaks. Here, you can select different options for each aspect of your desktop.

![Apply a theme][8]

(Alan Formy-Duval, [CC BY-SA 4.0][5])

### Variety is the spice of life

Being able to personalize a computer desktop with different wallpaper, colors, fonts, and more has been a popular feature since the first graphical interfaces hit the market. GNOME Tweaks and the user themes extension enable this customization on the GNOME desktop environment on all the GNU/Linux operating systems where it is available. And the open source community continues to provide a wide range of themes, icons, fonts, and wallpapers that anyone can download, play with, and customize.

What are your favorite GNOME themes, and why do you like them? Please share in the comments.

--------------------------------------------------------------------------------

via: https://opensource.com/article/20/8/gnome-themes

作者：[Alan Formy-Duval][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://opensource.com/users/alanfdoss
[b]: https://github.com/lujun9972
[1]: https://opensource.com/sites/default/files/styles/image-full-size/public/lead-images/custom_gnomes.png?itok=iG98iL8d (Gnomes in a window.)
[2]: https://www.gnome.org/
[3]: https://wiki.gnome.org/Apps/Tweaks
[4]: https://opensource.com/sites/default/files/uploads/gnome-install_tweaks_gui.png (Install Tweaks in Software Center)
[5]: https://creativecommons.org/licenses/by-sa/4.0/
[6]: https://opensource.com/sites/default/files/uploads/gnome-enable_user_theme_extension.png (Enable User Themes Extension)
[7]: https://www.gnome-look.org
[8]: https://opensource.com/sites/default/files/uploads/gnome-apply_theme.png (Apply a theme)
