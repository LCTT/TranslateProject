[#]: subject: "Blackbox is an Aesthetically Pleasing Terminal for Minimalists Linux Users"
[#]: via: "https://itsfoss.com/blackbox-terminal/"
[#]: author: "Anuj Sharma https://itsfoss.com/author/anuj/"
[#]: collector: "lkxed"
[#]: translator: "geekpi"
[#]: reviewer: " "
[#]: publisher: " "
[#]: url: " "

Blackbox is an Aesthetically Pleasing Terminal for Minimalists Linux Users
======

There are [numerous terminal emulators available for Linux][1]. From Terminator to Tilix, you have a wide selection of terminals to choose from.

But that has not deterred the arrival of new terminal applications. You recently learned about [GNOME Console][2], and today, I’ll introduce you to Blackbox.

### Blackbox Terminal: Overview and Features

Blackbox is a terminal emulator which supports GTK4. The developer created this project so that he could use a decent-looking terminal app on Linux.

So, don’t expect it to have ton of features. It is just a terminal emulator that utilizes GTK4 toolkit and has support for themes.

In other words, it is more about the looks than the features.

Here are the main highlights of Blackbox:

* Theming ([Tilix][3] compatible color scheme support)
* Theme integration with the window decorations
* Custom fonts
* Various customizable UI settings
* Tabs
* Toggleable header bar
* Click to open links
* Files drag-n-drop support

Talking about the looks, let us go through the different looks it offers. The default window will look something like the screenshot below.

![Default look of Blackbox terminal][4]

#### No header bar

You can also have no header bar, as shown below. It’s one of the most ‘popular’ features of GTK4 apps.

![Blackbox without header bar][5]

You can also enable floating controls in no header-bar mode.

![Floating controls with no header bar mode][6]

#### Easy copy and paste (don’t revolt)

Ctrl+C and Ctrl+V are like the universal keyboard shortcuts for copy-paste.

But the ancient Unix existed before the universe and hence it uses the [Ctrl+C keys for terminating a running program in the terminal][7].

However, some people find it a bit inconvenient not to be able to use their favorite shortcuts for [copy-pasting in the terminal][8].

Blackbox allows you to change that by enabling the “Easy Copy & Paste” setting. With this setting enabled, you can use Ctrl+C and Ctrl+v for copy-paste operation.

Don’t worry. Ctrl+C can still be used for stopping running commands.

![Easy copy-paste mode allows using Ctrl+C and Ctrl+V keys][9]

#### Themes

You can also select different themes from the settings. There are several light and dark themes available to choose from. You can also use Tilix styled theming.

![Available themes for Blackbox][10]

Let us see how it looks with the Yaru theme and with tabs not expanding, unlike the default Blackbox behaviour.

![Blackbox with a changed theme][11]

#### Reset to default

There are a few more handy features like remember window size, scroll by pixels etc.

The good thing is that if you made too many changes to the settings, you can revert them all and reset to the default settings.

The option is available in the Advanced tab of Preferences.

![reset blackbox settings to default][12]

### Installing Blackbox terminal

Please keep in mind that **Blackbox is in the early stages of development**. I experienced some crashes when I switched themes.

To install Blackbox Terminal you should have [Flatpak installed and Flathub repo enabled][13] in your system.

Use this command to install Blackbox on your system:

```
flatpak install flathub com.raggesilver.BlackBox
```

On Fedora and some other distributions that integrate with Flatpak, you can install Blackbox from the software center.

![Blackbox can also be installed in GNOME Software Center][14]

Once installed, you can launch it from the applications menu.

#### Removing Blackbox Terminal

If you don’t like Blackbox and want to remove it, enter the following command to remove it.

```
flatpak uninstall flathub com.raggesilver.BlackBox
```

### Conclusion

In my opinion, Blackbox is a decent terminal emulator. You get all the eye-candy GTK4 can offer on distributions that do not support GTK4 already. The feature it offers are good enough for day to day work.

In the end, it all comes to personal preference. You may like it. You may not like it. If you like experimenting, give it a try and share your experience with us in the comment section.

--------------------------------------------------------------------------------

via: https://itsfoss.com/blackbox-terminal/

作者：[Anuj Sharma][a]
选题：[lkxed][b]
译者：[译者ID](https://github.com/译者ID)
校对：[校对者ID](https://github.com/校对者ID)

本文由 [LCTT](https://github.com/LCTT/TranslateProject) 原创编译，[Linux中国](https://linux.cn/) 荣誉推出

[a]: https://itsfoss.com/author/anuj/
[b]: https://github.com/lkxed
[1]: https://itsfoss.com/linux-terminal-emulators/
[2]: https://itsfoss.com/gnome-console/
[3]: https://github.com/gnunn1/tilix
[4]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-default.png
[5]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-noheader.png
[6]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-floating-controls.png
[7]: https://itsfoss.com/stop-program-linux-terminal/
[8]: https://itsfoss.com/copy-paste-linux-terminal/
[9]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-easy-copy-paste.png
[10]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-theme-selection.png
[11]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-yaru.png
[12]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-reset.png
[13]: https://itsfoss.com/flatpak-guide/
[14]: https://itsfoss.com/wp-content/uploads/2022/08/blackbox-install.png
