[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (Tweaking the look of Fedora Workstation with themes)
[#]: via: (https://fedoramagazine.org/tweaking-the-look-of-fedora-workstation-with-themes/)
[#]: author: (Ryan Lerch https://fedoramagazine.org/author/ryanlerch/)

Tweaking the look of Fedora Workstation with themes
======

![][1]

Changing the theme of a desktop environment is a common way to customize your daily experience with Fedora Workstation. This article discusses the 4 different types of visual themes you can change and how to change to a new theme. Additionally, this article will cover how to install new themes from both the Fedora repositories and 3rd party theme sources.

### Theme Types

When changing the theme of Fedora Workstation, there are 4 different themes that can be changed independently of each other. This allows a user to mix and match the theme types to customize their desktop in a multitude of combinations. The 4 theme types are the **Application** (GTK) theme, the **shell** theme, the **icon** theme, and the **cursor** theme.

#### Application (GTK) themes

As the name suggests, Application themes change the styling of the applications that are displayed on a user’s desktop. Application themes control the style of the window borders and the window titlebar. Additionally, they also control the style of the widgets in the windows — like dropdowns, text inputs, and buttons. One point to note is that an application theme does not change the icons that are displayed in an application — this is achieved using the icon theme.

![Two application windows with two different application themes. The default Adwaita theme on the left, the Adapta theme on the right.][2]

Application themes are also known as GTK themes, as GTK ( **G** IMP **T** ool **k** it) is the underlying technology that is used to render the windows and user interface widgets in those windows on Fedora Workstation.

#### Shell Themes

Shell themes change the appearance of the GNOME Shell. The GNOME Shell is the technology that displays the top bar (and the associated widgets like drop downs), as well as the overview screen and the applications list it contains.

![Comparison of two Shell themes, with the Fedora Workstation default on top, and the Adapta shell theme on the bottom.][3]

#### Icon Themes

As the name suggests, icon themes change the icons used in the desktop. Changing the icon theme will change the icons displayed both in the Shell, and in applications.

![Comparison of two icon themes, with the Fedora 30 Workstation default Adwaita on the left, and the Yaru icon theme on the right][4]

One important item to note with icon themes is that all icon themes will not have customized icons for all application icons. Consequently, changing the icon theme will not change all the icons in the applications list in the overview.

![Comparison of two icon themes, with the Fedora 30 Workstation default Adwaita on the top, and the Yaru icon theme on the bottom][5]

#### Cursor Theme

The cursor theme allows a user to change how the mouse pointer is displayed. Most cursor themes change all the common cursors, including the pointer, drag handles and the loading cursor.

![Comparison of multiple cursors of two different cursor themes. Fedora 30 default is on the left, the Breeze Snow theme on the right.][6]

### Changing the themes

Changing themes on Fedora Workstation is a simple process. To change all 4 types of themes, use the **Tweaks** application. Tweaks is a tool used to change a range of different options in Fedora Workstation. It is not installed by default, and is installed using the Software application:

![][7]

Alternatively, install Tweaks from the command line with the command:

```
sudo dnf install gnome-tweak-tool
```

In addition to Tweaks, to change the Shell theme, the **User Themes** GNOME Shell Extension needs to be installed and enabled. [Check out this post for more details on installing extensions][8].

Next, launch Tweaks, and switch to the Appearance pane. The Themes section in the Appearance pane allows the changing of the multiple theme types. Simply choose the theme from the dropdown, and the new theme will apply automatically.

![][9]

### Installing themes

Armed with the knowledge of the types of themes, and how to change themes, it is time to install some themes. Broadly speaking, there are two ways to install new themes to your Fedora Workstation — installing theme packages from the Fedora repositories, or manually installing a theme. One point to note when installing themes, is that you may need to close and re-open the Tweaks application to make a newly installed theme appear in the dropdowns.

#### Installing from the Fedora repositories

The Fedora repositories contain a small selection of additional themes that once installed are available to we chosen in Tweaks. Theme packages are not available in the Software application, and have to be searched for and installed via the command line. Most theme packages have a consistent naming structure, so listing available themes is pretty easy.

To find Application (GTK) themes use the command:

```
dnf search gtk | grep theme
```

To find Shell themes:

```
dnf search shell-theme
```

Icon themes:

```
dnf search icon-theme
```

Cursor themes:

```
dnf search cursor-theme
```

Once you have found a theme to install, install the theme using dnf. For example:

```
sudo dnf install numix-gtk-theme
```

#### Installing themes manually

For a wider range of themes, there are a plethora of places on the internet to find new themes to use on Fedora Workstation. Two popular places to find themes are [OpenDesktop][10] and [GNOMELook][11].

Typically when downloading themes from these sites, the themes are encapsulated in an archive like a tar.gz or zip file. In most cases, to install these themes, simply extract the contents into the correct directory, and the theme will appear in Tweaks. Note too, that themes can be installed either globally (must be done using sudo) so all users on the system can use them, or can be installed just for the current user.

For Application (GTK) themes, and GNOME Shell themes, extract the archive to the **.themes/** directory in your home directory. To install for all users, extract to **/usr/share/themes/**

For Icon and Cursor themes, extract the archive to the **.icons/** directory in your home directory. To install for all users, extract to **/usr/share/icons/**

--------------------------------------------------------------------------------

via: https://fedoramagazine.org/tweaking-the-look-of-fedora-workstation-with-themes/

作者：[Ryan Lerch][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://fedoramagazine.org/author/ryanlerch/
[b]: https://github.com/lujun9972
[1]: https://fedoramagazine.org/wp-content/uploads/2019/06/themes.png-816x345.jpg
[2]: https://fedoramagazine.org/wp-content/uploads/2019/06/application-theme-1024x514.jpg
[3]: https://fedoramagazine.org/wp-content/uploads/2019/06/overview-theme-1024x649.jpg
[4]: https://fedoramagazine.org/wp-content/uploads/2019/06/icon-theme-application-1024x441.jpg
[5]: https://fedoramagazine.org/wp-content/uploads/2019/06/overview-icons-1024x637.jpg
[6]: https://fedoramagazine.org/wp-content/uploads/2019/06/cursortheme-1024x467.jpg
[7]: https://fedoramagazine.org/wp-content/uploads/2019/06/tweaks-in-software-1024x725.png
[8]: https://fedoramagazine.org/install-extensions-via-software-application/
[9]: https://fedoramagazine.org/wp-content/uploads/2019/06/tweaks-choose-themes.png
[10]: https://www.opendesktop.org/
[11]: https://www.gnome-look.org/
