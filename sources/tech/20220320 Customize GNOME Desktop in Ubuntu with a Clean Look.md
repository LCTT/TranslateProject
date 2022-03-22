[#]: subject: "Customize GNOME Desktop in Ubuntu with a Clean Look"
[#]: via: "https://www.debugpoint.com/2022/03/customize-gnome-clean-look-2022-1/"
[#]: author: "Arindam https://www.debugpoint.com/author/admin1/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Customize GNOME Desktop in Ubuntu with a Clean Look
======
THIS TUTORIAL GIVES YOU SOME EASY STEPS TO CUSTOMIZE GNOME DESKTOP WITH
A CLEAN LOOK WITH MINIMAL EFFORT. HERE’S HOW.
If you are bored with the usual look of your favourite GNOME Desktop, then you are on the right page. Let’s install some themes icons and do some tweaks to uplift your desktop. We will transform this below desktop (GNOME 40.5 with Ubuntu 21.10).

![Ubuntu Desktop with GNOME – Before Customization][1]

This customization session will use the great-looking Colloid GTK theme, Mkos-Big-Sur icons, a cool cursor theme with additional extensions, and Conky.

### Customize GNOME Desktop and uplift it with a Clean Look

#### Installation

  * First, setup the GNOME Shell Extenstion by running the following command from the terminal.



```

    sudo apt install chrome-gnome-shell

```

  * Then [open this page][2] and add the plugin to your browser (Chrome/Firefox) for GNOME Extension.



![Add Browser Add-on for GNOME Shell Extension][3]

  * Install the Extensions Flatpak application which you may need to change settings of GNOME Extensions.



[Install Extensions App][4]

  * After that, install GNOME Tweaks tool using the following command from the terminal. We will use this utility to change the Themes and other settings.



```

    sudo apt install gnome-tweaks

```

  * Download the Colloid GTK Theme from the below link. After download extract the files. Then copy the extracted folder to ~/.themes in your home directory. If the folder doesn’t exists, create it. After you done this, open a terminal and run the `install.sh` file.



[Download Colloid GTK Theme][5]

  * Download the Mkos-Big-Sur icon theme from the below link. Once it is downloaded, extract the files and copy the parent folder to ~/.icons in your home directory.



[Download Icon theme][6]

  * Download the below cursor theme and follow the same steps as above. Copy the extracted folder to the ~/.icons directory. Then open a terminal and run the `install.sh` file.



[Download Cursor Theme][7]

Now, its time to install Conky and some extensions that would eventually give your GNOME Desktop a clean look. To install Conky and a Conky manager, open the terminal prompt and run the below commands.

```

    sudo apt install conky

```

```

    sudo add-apt-repository ppa:tomtomtom/conky-manager
    sudo apt update && sudo apt install conky-manager2

```

Now, open each of the below links for the extensions and install them in sequence. To install, open the page and click on the ON/OFF toggle switch (see below image). It would ask for your admin password and permission to install.

  * [Move Clock][8]
  * [Dash to Dock][9]
  * [Tray Icons][10]
  * [Arc Menu][11]
  * [User Themes][12]



![GNOME Extension – Page][13]

#### Configurations

After you complete the above steps, its time to do some basic configurations. You may see some of the changes already in force when you installed the GNOME Extensions above. For example, the clock should already be shifted to the right side when installing the Move Clock extension above.

[][14]

SEE ALSO:   Give Your Ubuntu a New Look Using Paper Theme

  * Open the Tweaks tool (search from the application menu) and go to Apperance.


  * Change the Application theme to **Colloid Dark**, Cursors as **Vimix Cursors**, Icons as **Mkos-big-sur** and Shell Theme as **Colloid Dark**. If you want, you can choose the light theme and different option.



![Apply Themes][15]

  * Open the Extenstion application and go to the Arch Menu Settings.


  * Change the menu layout to `Alternative Menu Layout > Raven`.


  * Change the application menu button to some icons you prefer. For this guide, I have downloaded a GNOME icon from [here][16]. And applied it via Arc Menu `Settings > Button Appearance > Browse Icon`. And it should look like this.



![Arch Menu – Raven][17]

  * Open Dash to Dock settings from the Extension application. In the Appearance tab, change the below items:
    * Enable Shrink the dash
    * Customize windows counter indicator = Dashes
    * Enable Customize Dash color
    * Customize Opacity = Fixed
    * Opacity to 12%


  * In the position and size tab, change the Dock position to bottom and Icon size limit to 39px.


  * You can start Conky if you like and download a nice wallpaper which goes with Colloid theme. For this demonstration I have [chosen a nice grey-ish wallpaper][18] which looks stunning with the dark theme.



### Result

After all the configuration, and if all goes well, your desktop should look like this.

![GNOME Customization in Ubuntu with a simple look-1][19]

![GNOME Customization in Ubuntu with a simple look-2][20]

![GNOME Customization in Ubuntu with a simple look-3][21]

You can play around with different variants of this theme with several combinations of settings. And create a look that suits you better.

I hope this guide helps you transform your GNOME desktop with a clean look. Let me know in the comments down below if you like this setup.

* * *

We bring the latest tech, software news and stuff that matters. Stay in touch via [Telegram][22], [Twitter][23], [YouTube][24], and [Facebook][25] and never miss an update!

##### Also Read

--------------------------------------------------------------------------------

via: https://www.debugpoint.com/2022/03/customize-gnome-clean-look-2022-1/

作者：[Arindam][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://www.debugpoint.com/author/admin1/
[b]: https://github.com/lujun9972
[1]: https://www.debugpoint.com/wp-content/uploads/2022/03/Ubuntu-Desktop-with-GNOME-Before-Customization-1024x582.jpg
[2]: https://extensions.gnome.org/
[3]: https://www.debugpoint.com/wp-content/uploads/2022/03/Add-Browser-Add-on-for-GNOME-Shell-Extension.jpg
[4]: https://dl.flathub.org/repo/appstream/org.gnome.Extensions.flatpakref
[5]: https://github.com/vinceliuice/Colloid-gtk-theme/archive/refs/heads/main.zip
[6]: https://github.com/zayronxio/Mkos-Big-Sur/archive/refs/heads/master.zip
[7]: https://github.com/vinceliuice/Vimix-cursors
[8]: https://extensions.gnome.org/extension/2/move-clock/
[9]: https://extensions.gnome.org/extension/307/dash-to-dock/
[10]: https://extensions.gnome.org/extension/2890/tray-icons-reloaded/
[11]: https://extensions.gnome.org/extension/3628/arcmenu/
[12]: https://extensions.gnome.org/extension/19/user-themes/
[13]: https://www.debugpoint.com/wp-content/uploads/2018/05/GNOME-Extension-Page.png
[14]: https://www.debugpoint.com/2018/09/give-your-ubuntu-a-new-look-using-paper-theme/
[15]: https://www.debugpoint.com/wp-content/uploads/2022/03/Apply-Themes.jpg
[16]: https://icons.iconarchive.com/icons/tatice/operating-systems/32/Gnome-icon.png
[17]: https://www.debugpoint.com/wp-content/uploads/2022/03/Arch-Menu-Raven.jpg
[18]: https://i.redd.it/1ttvv79apo851.png
[19]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Customization-in-Ubuntu-with-a-simple-look-1-1024x579.jpg
[20]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Customization-in-Ubuntu-with-a-simple-look-2-1024x580.jpg
[21]: https://www.debugpoint.com/wp-content/uploads/2022/03/GNOME-Customization-in-Ubuntu-with-a-simple-look-3-1024x576.jpg
[22]: https://t.me/debugpoint
[23]: https://twitter.com/DebugPoint
[24]: https://www.youtube.com/c/debugpoint?sub_confirmation=1
[25]: https://facebook.com/DebugPoint
