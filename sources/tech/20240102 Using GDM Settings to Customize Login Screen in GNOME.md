[#]: subject: "Using GDM Settings to Customize Login Screen in GNOME"
[#]: via: "https://itsfoss.com/customize-gdm-login/"
[#]: author: "Sreenath https://itsfoss.com/author/sreenath/"
[#]: collector: "lujun9972/lctt-scripts-1700446145"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Using GDM Settings to Customize Login Screen in GNOME
======

From the dock to grub screen, GNOME can be customized to your liking.

Add the login screen to this list as a new tool called GDM Settings allows you to change the looks and tweak functionalities of the login screen in GNOME.

You can change the wallpaper, theme, icon, time format, top panel items etc. You can also enable tap to click on the login screen (I love this one) among other things.

In this tutorial, you'll see the steps for installing this tool and how you can use it to change various aspects of the GDM login screen.

Needless to say, you must be using GNOME desktop environment and GDM display manager in order to follow the instructions here.

🚧

Playing with settings in such ways may create issues. Make a backup of system settings with Timeshift. And avoid it completely if you are easily overwhelmed and don't like troubleshooting.

### Tweaks using GDM Settings tool

Let's first see the kind of changes you can make with this awesome utility.

#### 1\. Change shell theme, icon, and wallpaper

You can change the theme, icon and wallpaper of the login screen. Here's an example.

![][1]

To change the theme, you should download it first. Get one from the [GNOME Look website][2].

Next, ensure that the theme is in `/usr/share/themes`. Themes stored in `~/.themes` are not visible to the GDM settings app.

In the GDM Settings tool, go to the Appearance tab and select the themes/icons/cursors.

![GDM Theme Settings][3]

If you want to set a wallpaper, change the Backgrounds to “Image” and then browse a picture from the file browser.

![Change Wallpaper][4]

Once finished, click Apply. This will ask for the password. Give it when prompted.

You will be notified to log out to apply changes. When logged out, the changes will be visible.

![Log Out Prompt][5]

💡

You can change all the settings and then click apply, or click apply each time after a setting. If you press Apply, it will prompt you to log out, and you need to log back in and open the settings app again each time.

#### 2\. Change fonts

Before you change the font, you need to have that fonts installed on your system for all users.

To ensure that, paste the downloaded custom font file to `/usr/local/share/fonts` and then make a font cache using:

```

    fc-cache -f -v

```

Now, open GDM Settings and go to the Fonts tab. There, you can set the fonts, anti-alias settings etc.

![Change Font Settings][6]

You can see that the new font is now set to your log in screen.

![Custom Font][7]

#### 3\. Change color of top panel

To change the top panel color, go to Top Bar option in the sidebar. Under Tweaks, enable the "Change Background Color" button and then set a color you want.

![Change Top panel color setting][8]

It is equally important to change the text color of the top bar to a convenient color to the background you have selected.

![Changed Top bar Color][9]

#### 4\. Change the time display format

Change the clock to 24 hr or 12hr format using the dropdown menu.

![Change time Display Format Setting][10]

Furthermore, you can make seconds visible on the top bar, by toggling the corresponding button.

![Top bar shows seconds][11]

#### 5\. Enable tap to click on login screen

On most distros, this is the default behavior. Even if you have tap to click enabled in the system, the GNOME login screen need you to use left mouse click.

To change that, go to the Mouse and Touchpad section and enable the Tap to Click button.

![Enable Tap to Click][12]

On the same menu, you have an option to tweak the mouse cursor size, if it looks small to you.

![Change Mouse Cursor Size][13]

#### 6\. Enable night light

You can enable a scheduled night light to the GDM.

Go to Display, toggle the Night Light button on. Now, Schedule either sunset to sunrise or to a convenient time of your choice.

![Enable Night Light][14]

#### 7\. Add a logo and welcome Message

Go to the Login screen tab and then enable the "Enable Logo" button. This will give you a button to browse for the image.

![Add a Logo][15]

Select the Image and press Apply.

📋

On my system's monitor, an image of the size up to 128×128 pixel looked acceptable, and beyond that look huge for me. So, select the size accordingly.

After the image is applied, to set a welcome message, enable the Welcome Message button and then add the text you wanted to show.

![Add a Welcome Message][16]

This will display the message, when you selected a user to enter the password.

![Log in screen Welcome Message][17]

#### 8\. Export and import settings

If you want to apply the same settings on some other system, you can export the settings and import it on the other system running GDM Settings tool.

Click on the top-left hamburger menu, and select **Export to file**.

![Export to file][18]

Name the `.ini` file and save it somewhere safe. You can import it later.

![Name the File][19]

#### 9\. Reset all settings

Don't like the changes you made? There is an easy way to revert to default.

To reset the tweaks, click on the top-left hamburger menu and select Reset.

![Reset Settings][20]

Now, press Apply. It will ask for your password. Once provided, you will be prompted to log out.

You can see that, all the changes have been reverted.

#### 10\. More settings

There are other tweaks available too, like:

  1. Show battery percentage on the top bar, through **Top Bar ⇾ Power ⇾ Show Battery Percentage.**
  2. Disable or enable the user list on the login screen through **Login Screen ⇾ Disable User List**.
  3. Change the screen off time, suspend time and other power settings through the **Power** tab.



### Installing GDM Settings Tool

Now that you know what tweaks this tool can do, you may want to try it on your own. Let's see about installing it.

📋

The GDM Settings tool didn't work for me on Ubuntu/Pop!_OS. I am using it as a Flatpak App on Debian 12 Bookworm.

GDM Settings Tool can be installed as a Flatpak.

```

    flatpak install flathub io.github.realmazharhussain.GdmSettings

```

Or, It is available as [an AppImage][21].

For Arch Linux users, install using any AUR Helper from AUR.

```

    yay -S gdm-settings

```

### Conclusion

Login screen is not something that everyone customizes. Other than the "tap to click" change, most other changes are just cosmetic changes.

Overall, it is good to have such options available for people who love to customize every nook and corner of their settings.

🗨️ Are you one of those Linux users who are obsessed with customization? Will you be trying GDM Settings?

--------------------------------------------------------------------------------

via: https://itsfoss.com/customize-gdm-login/

作者：[Sreenath][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/sreenath/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/content/images/2024/01/gdm-settings-applied.webp
[2]: https://www.gnome-look.org/browse/
[3]: https://itsfoss.com/content/images/2023/12/gdm-settings-set-log-in-themes-settings.png
[4]: https://itsfoss.com/content/images/2023/12/gdm-settings-set-an-image-settings.png
[5]: https://itsfoss.com/content/images/2023/12/gdm-settings-click-on-logout.png
[6]: https://itsfoss.com/content/images/2023/12/gdm-settings-apply-custom-font-settings.png
[7]: https://itsfoss.com/content/images/2023/12/different-font-applied-1.png
[8]: https://itsfoss.com/content/images/2023/12/gdm-settings-change-topbar-background-color.png
[9]: https://itsfoss.com/content/images/2023/12/panel-color-changed.png
[10]: https://itsfoss.com/content/images/2023/12/gdm-settings-top-bar-clock-settings.png
[11]: https://itsfoss.com/content/images/2023/12/gdm-settings-show-seconds-on-top-bar.png
[12]: https://itsfoss.com/content/images/2023/12/gdm-settings-enable-tap-to-click-settings.png
[13]: https://itsfoss.com/content/images/2023/12/gdm-settings-add-different-cursor-size-settings.png
[14]: https://itsfoss.com/content/images/2023/12/gdm-settings-change-night-light-settings.png
[15]: https://itsfoss.com/content/images/2023/12/gdm-settings-enable-logo-settings.png
[16]: https://itsfoss.com/content/images/2023/12/gdm-settings-enable-welcome-message-settings.png
[17]: https://itsfoss.com/content/images/2023/12/logo-and-welcome-message-added.png
[18]: https://itsfoss.com/content/images/2023/12/gdm-settings-click-on-export-to-file.png
[19]: https://itsfoss.com/content/images/2023/12/gdm-settings-save-the-export-file-as-gdm-settings-ini.png
[20]: https://itsfoss.com/content/images/2023/12/gdm-settings-click-on-reset.png
[21]: https://github.com/gdm-settings/gdm-settings/releases
