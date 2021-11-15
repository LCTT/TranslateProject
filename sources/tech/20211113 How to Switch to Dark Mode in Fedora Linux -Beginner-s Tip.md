[#]: subject: "How to Switch to Dark Mode in Fedora Linux [Beginner’s Tip]"
[#]: via: "https://itsfoss.com/fedora-dark-mode/"
[#]: author: "Abhishek Prakash https://itsfoss.com/author/abhishek/"
[#]: collector: "lujun9972"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

How to Switch to Dark Mode in Fedora Linux [Beginner’s Tip]
======

Unlike Ubuntu, Fedora offers the actual, vanilla GNOME experience. And that works pretty well. The horizontal layout, the three finger swipe, it’s all good.

The one thing I don’t like is the default standard theme which is a mix of Adwaita Light (default) theme and the dark shell.

So, while the notifications and notification area are dark, rest of the system and applications have light theme. And quite honestly, it looks dull for my taste.

![Fedora GNOME standard theme][1]

On the other side, the dark theme makes it look better.

![Fedora GNOME dark theme][2]

Let me show you how to turn the dark mode on in Fedora or any other distribution that uses GNOME desktop environment.

### Switch to dark mode in Fedora

Alright! I’ll share the command line method because it is quicker. Open a terminal and use this command:

```

    gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark

```

That’s it. It was easy, right? But I’ll also show the GUI method.

Since I use Ubuntu primarily, my reference point is always Ubuntu. Ubuntu provides the option to switch between the light and dark theme in the system settings itself.

However, there is no such settings in the vanilla GNOME. You’ll have to [install GNOME Tweaks tool on Fedora][3] first and then use it to switch themes.

You could either search for it in the software center and click the ‘Install’ button:

![Install GNOME Tweaks from the software center in Fedora][4]

Or, you type the following command in the terminal:

```

    sudo dnf install gnome-tweaks

```

Once installed, search for it in the system menu by pressing the super key (Windows key):

![Start GNOME Tweaks][5]

Click on the **Appearance** tab in the left sidebar and click on the Applications under the Themes section.

![Changing theme in Fedora][6]

You’ll see a few available themes here. You should select Adwaita-dark here. As soon as you select it, the application will switch to dark theme.

![Selecting the Adwaita-dark theme][7]

And that’s all you need to do to switch to dark mode in Fedora. Since the GNOME Shell is already using dark theme, you don’t need to explicitly set it to dark mode. All the notifications, message tray etc. are in dark mode always.

### Conclusion

You can find various dark GTK themes and install them to give your Fedora a different dark look. However, I have noticed that it is only the system’s own dark theme that is recognized by web browsers.

So, if you visit a website that automatically enables dark mode based on your system theme, it will work with Adwaita-dark but may not work with other dark GTK themes.

That’s one sure shot advantage of using dark theme provided by the system.

As you can see, it’s not a rocket science to enable dark mode in Fedora. It’s just a matter of knowing and finding things.

Enjoy the dark colors!

--------------------------------------------------------------------------------

via: https://itsfoss.com/fedora-dark-mode/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/fedora-gnome-standard-theme.webp?resize=800%2C450&ssl=1
[2]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2021/11/fedora-gnome-dark-theme.webp?resize=800%2C450&ssl=1
[3]: https://itsfoss.com/install-gnome-tweaks-fedora/
[4]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2021/11/install-gnome-tweaks-fedora.webp?resize=800%2C448&ssl=1
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/start-gnome-tweaks-tool-in-Fedora.png?resize=800%2C271&ssl=1
[6]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/change-GTK-theme-Fedora.webp?resize=800%2C532&ssl=1
[7]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2021/11/switching-dark-mode-fedora.png?resize=800%2C515&ssl=1
