[#]: subject: "How to Install and Use Latte Dock on Ubuntu and Other Linux Distributions"
[#]: via: "https://itsfoss.com/install-use-latte-dock-ubuntu/"
[#]: author: "Pratham Patel https://itsfoss.com/author/pratham/"
[#]: collector: "lujun9972"
[#]: translator: " "
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Install and Use Latte Dock on Ubuntu and Other Linux Distributions
======

You know what docks are, right? It is usually the bottom bar where your applications are ‘docked’ for quick access.

![][1]

Many distributions and desktop environments provide some sort of docking implementation. If your distribution does not have a Dock or if you want to experiment with some other Dock applications, Latte dock is a good choice. It is similar to the dock on macOS with a **parabolic animation every time you hover over any dock object** with your mouse.

In this tutorial, I’ll show you how to install Latte Dock on Ubuntu. I’ll also show some a few things about using and customizing Latte Dock.

### Install Latte Dock on Ubuntu

[Latte dock][2] is a popular application and available from the official repository of most Linux distributions. This means that you can use your distribution’s software center or package manager to install Latte dock.

![Latte is available from the software center][3]

On Ubuntu and other distributions that are based on Ubuntu such as elementary OS, Linux Mint, Pop!_OS, Zorin OS, use the apt command:

```

    sudo apt install latte-dock

```

Done! You now have Latte Dock installed on Ubuntu.

#### Disable Ubuntu dock (for Ubuntu users)

Before you start your shiny new dock, I advise that you disable the dock that ships with Ubuntu by default. Here is a [guide on how to disable the dock on Ubuntu][4].

To disable the dock, type this in your terminal

```

    gnome-extensions disable [email protected]

```

If you end up changing your mind, you can enable the Ubuntu dock again with the following command

```

    gnome-extensions enable [email protected]

```

NOTE

The default dock on Pop!_OS 20.04 LTS can not be disabled (although, it is hidden by default on the desktop; only visible in the activities overview). On Pop!_OS with the COSMIC DE/Extension, you can disable or enable the dock by going in the Settings app, under Desktop -&gt; Dock.

### Start using Latte Dock

I am using Pop!_OS in the tutorial but the steps are applicable to any Linux distribution.

Once installed, you will find a launcher icon for Latte Dock in your Applications Drawer. You can either access it through the dock or press the Super (usually the Windows key; or Command key if you have a Mac keyboard) Key + A.

Open Latte Dock from here.

![Latte dock highlighted in the app drawer][5]

Cool! You now have Latte Dock open on your desktop.

![Screenshot of Latte Dock on the desktop][6]

#### Enable autostart for Latte Dock

With Latte Dock now open and Ubuntu Dock disabled, if you reboot now, you will not have any dock next time your computer turns on.

Lets fix that right now.

Perform a right click on the dock. Click on the Configure option under the Layouts sub menu.

![Launching the Settings panel window by going in Layouts > Configure][7]

Now, under the Preferences tab, make sure that the “Enable autostart during startup” checkbox is checked.

![Enable autostart during startup checkbox enabled][8]

### Customize your dock

If you install any KDE product, customization is expected to be endless. It would be odd if Latte Dock wouldn’t allow customization. Fortunately, that is not the case.

You can do a wide variety of things to customize Latte Dock. Increase it’s size, make it more transparent or translucent, theme it, and much more.

#### Pinning apps to the dock

To pin your application to the Latte Dock, open said application and right click on the application icon that is in your dock. Now click on Pin Launcher. Done! Your application is now pinned to the dock.

![Right click the running app and select Pin Launcher option][9]

You can change its position in the dock by moving it to the left or right with the click and drag movement.

#### Search and install themes for Latte Dock

Open the Latte Dock’s Settings window by right clicking on the dock, clicking on the Configure option under the Layout sub menu.

You may already a few themes (err… layout) installed. Select it from the list of installed options and click on the Switch button on the right side.

![change themes latte dock][10]

You may also download more themes by clicking the Download button. It should show you a list of available themes for installation.

![Latte Dock Add On Installer window][11]

#### Change dock appearance and behavior

As I mentioned earlier, there are a huge amount of customization options in KDE products.

Lets play with some, shall we?

Right click on the dock and click on “Dock Settings”

![Access Latte Dock settings by right clicking the dock][12]

Here, you will get all types of options to toggle. Want to move dock to the left side of your monitor? You can do that with the options provided under the Location sub menu.

![The Dock settings and customization window][13]

If you feel limited in any way regarding the available options, toggle the switch at the top right corner that says Advanced.

![The Dock settings and customization window with advanced options now visible][14]

Now THAT is awesome!

Try playing with every available toggle. You can hide the dock after a delay. You can place it to an edge of your monitor, place it to the center of that edge, to the left or right. You can do that all.

Want to tinker with launch, hover etc effects? More options to tinker with await for you under the Effects tab.

### Remove Latte Dock from your system

You installed Latte Dock, customized it but felt it was not what you were looking for. And, now you are looking to remove Latte Dock. That’s fine. I got you.

You can remove Latte Dock using the apt package manager. Do that with the following command:

```

    sudo apt autoremove --purge latte-dock

```

![][15]

The –purge flag will remove any configuration files that Latte Dock had in the system directories except for ~/.config.

#### For advanced users only: removing user specific leftover files

This is not mandatory but if you want to remove the user config files that are usually placed in your $HOME/.config (AKA ~/.config) directory. [Use find command][16] to locate Latte Dock’s config files.

```

    find ~/.config -iname "latte*"

```

![][17]

You can safely remove these directory and config files from your `~/.config` directory.

#### For Ubuntu users: Re-enable the Ubuntu dock

Don’t forget to enable the stock Ubuntu dock. In case you don’t remember, the command to enable the dock again is down below:

```

    gnome-extensions enable [email protected]

```

### Conclusion

Latte Dock is an amazing dock from the KDE kommunity ( ͡° ͜ʖ ͡°)

It offers a lot of theme-ing (layout), appearance, customization options along with some nice effects. It is certainly something that you should look for, if you are thinking of customizing your stock desktop look and feel.

If you end up loving Latte Dock and start using it every day, do let me know in the comments. And, if in any case you don’t like Latte Dock, let me know why, with a comment.

--------------------------------------------------------------------------------

via: https://itsfoss.com/install-use-latte-dock-ubuntu/

作者：[Pratham Patel][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/pratham/
[b]: https://github.com/lujun9972
[1]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/latte-dock.webp?resize=800%2C167&ssl=1
[2]: https://invent.kde.org/plasma/latte-dock
[3]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/12/latte-ubuntu-software-center.png?resize=800%2C384&ssl=1
[4]: https://itsfoss.com/disable-ubuntu-dock/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/02_latte_in_drawer.webp?resize=800%2C450&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/03_latte_dock_launched.webp?resize=800%2C450&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/configure-latte-dock.png?resize=800%2C392&ssl=1
[8]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/enable_autostart_latte_dock.webp?resize=800%2C433&ssl=1
[9]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/12/pin-app-latte-dock.webp?resize=800%2C334&ssl=1
[10]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/change-themes-latte-dock.webp?resize=800%2C393&ssl=1
[11]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/08_download_layouts.webp?resize=800%2C450&ssl=1
[12]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/12/latte_dock_settings.webp?resize=799%2C246&ssl=1
[13]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/11_customization_options.webp?resize=800%2C450&ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/12_customization_options_advanced.webp?resize=800%2C450&ssl=1
[15]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/15_apt_get_remove.webp?resize=800%2C450&ssl=1
[16]: https://linuxhandbook.com/find-command-examples/
[17]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/13_find_configs.webp?resize=800%2C450&ssl=1
