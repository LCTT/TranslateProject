[#]: collector: (lujun9972)
[#]: translator: ( )
[#]: reviewer: ( )
[#]: publisher: ( )
[#]: url: ( )
[#]: subject: (How to Go Full Dark Mode in Ubuntu 20.04)
[#]: via: (https://itsfoss.com/dark-mode-ubuntu/)
[#]: author: (Abhishek Prakash https://itsfoss.com/author/abhishek/)

How to Go Full Dark Mode in Ubuntu 20.04
======

One of the most talked about [new features in Ubuntu 20.04][1] is the dark mode. You can [install dark theme in any Ubuntu version][2] to give it a dark look but the new Ubuntu 20.04 makes it a lot easier.

You don’t need to install themes on your own. You can find three variants of the default theme (called Yaru) and you can enable the dark mode from the settings.

It still leaves a few thing to I am going to show you some tips on giving complete dark mode to your Ubuntu system.

### Enable dark mode in Ubuntu 20.04

[Subscribe to our YouTube channel for more Linux videos][3]

The steps are performed on the GNOME desktop. If you are [using some other desktop environment][4], the screenshots may look different.

Press the super key (Windows key) and start typing settings to search for the Settings application.

![Search for Settings][5]

In the Settings application, go to Apperance section and you should see three variants of the theme: Light, Standard and Dark. No prizes for guessing that you need to select Dark if you want to use the dark mode.

![Enable Dark Theme in Ubuntu][6]

Not all but applications using GTK3 should automatically comply with the dark theme. In other words, you’ll notice that most of the applications like text editor, terminal, LibreOffice etc on your system automatically switch to dark mode.

But it still leaves a few thing in the light mode. Let me show you a couple of tips to ‘go to the darker side’.

### Tweaks to go full dark mode in Ubuntu 20.04

You’ll notice that the shell theme is still light. The message tray, system tray (in the top panel) are still not using dark mode.

![No Dark Shell by default in Ubuntu][7]

You’ll have to [use a GNOME extension][8] here that will let you install Yaru dark shell theme. Install the browser extension first by using this command in terminal ([use Ctrl+Alt+T keyboard shortcut for terminal in Ubuntu][9]).

```
sudo apt install chrome-gnome-shell
```

Now [go to the extension’s webpage][10] and enable the extension by switching it on:

![Enable User Themes GNOME Extension][11]

You need to [install GNOME Tweaks tool][12] by using this command:

```
sudo apt install gnome-tweaks
```

Open the GNOME Tweaks tool and go to Appearance. You’ll see the option to change the shell theme. You don’t need to install this Yaru dark shell theme. It’s already there. You just have to enable it.

![Enable Yaru Dark Shell Theme in Ubuntu][13]

Now, you can see that even the shell features like desktop notifications, message tray, system tray are also in dark mode.

![Yaru Dark Shell Theme in Ubuntu][14]

Looks better, isn’t it? There is one more thing you could do to further enjoy dark mode in Ubuntu. You’ll notice that the websites you visit still have white background. You cannot expect all the websites to provide a dark mode.

This is where you can use a browser extension like [Dark Reader][15]. John has already discussed it in the tutorial on [enabling dark mode in Firefox][16]. It’s not a complicated task. If you use Firefox, Chrome or [Chromium in Ubuntu][17], you can install the browser extension listed on the [Dark Reader website][15].

Once you have installed Dark Reader, all the websites you visit should be in dark mode automatically.

![It’s FOSS Homepage in Dark Mode with Dark Reader][18]

You may still find a few external third party applications using light theme. You may have to manually enable dark theme, if they have such an option available.

Dark mode is getting popular these days even among the non-coders. With these tips, you can satisfy your craving of dark mode in Ubuntu.

I hope you like it. Enjoy the dark mode.

--------------------------------------------------------------------------------

via: https://itsfoss.com/dark-mode-ubuntu/

作者：[Abhishek Prakash][a]
选题：[lujun9972][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/abhishek/
[b]: https://github.com/lujun9972
[1]: https://itsfoss.com/ubuntu-20-04-release-features/
[2]: https://itsfoss.com/install-themes-ubuntu/
[3]: https://www.youtube.com/c/itsfoss?sub_confirmation=1
[4]: https://itsfoss.com/find-desktop-environment/
[5]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/settings-search-ubuntu-20-04.jpg?ssl=1
[6]: https://i1.wp.com/itsfoss.com/wp-content/uploads/2020/04/enable-dark-theme-ubuntu.png?ssl=1
[7]: https://i2.wp.com/itsfoss.com/wp-content/uploads/2020/04/no-dark-shell-ubuntu.jpg?ssl=1
[8]: https://itsfoss.com/gnome-shell-extensions/
[9]: https://itsfoss.com/ubuntu-shortcuts/
[10]: https://extensions.gnome.org/extension/19/user-themes/
[11]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/enable-user-themes-gnome.jpg?ssl=1
[12]: https://itsfoss.com/gnome-tweak-tool/
[13]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/ubuntu-yaru-dark-shell-theme.jpeg?ssl=1
[14]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/04/yaru-dark-shell-theme-ubuntu.jpg?ssl=1
[15]: https://darkreader.org/
[16]: https://itsfoss.com/firefox-dark-mode/
[17]: https://itsfoss.com/install-chromium-ubuntu/
[18]: https://i0.wp.com/itsfoss.com/wp-content/uploads/2020/01/itsfoss_dark_mode.jpg?ssl=1
